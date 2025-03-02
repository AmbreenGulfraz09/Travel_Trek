import os
from typing import Dict
from langchain_community.vectorstores.faiss import FAISS
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain.prompts import PromptTemplate
from langchain.chains import LLMChain
from django.conf import settings
from dotenv import load_dotenv
import traceback
from .videos import clean_and_refine_query
from .tasks import load_vector_store
from .models import Transcript
from .tts_utils import generate_guide_audio
from .pdf_generator import PDFGenerator
from threading import Thread

# Load environment variables
load_dotenv()
gemini_key = os.getenv("GeminiAPIkey")

# Initialize the LLM directly using ChatGoogleGenerativeAI
llm = ChatGoogleGenerativeAI(
    model="models/gemini-1.5-flash",
    google_api_key=gemini_key,
    max_tokens=None,
    stream=True,
    temperature=0,
    max_retries=2,
)

CHUNK_SUMMARY_PROMPT = """
User Query: "{query}"

Extract and summarize the key points from the following video transcript that are directly relevant to the query. Focus on the main aspects of the query without adding irrelevant details, background context, video titles, IDs, or references to video creators.

Transcripts:
{transcripts}

Provide a concise summary (2–3 lines) that directly addresses the query. Ensure the summary is complete and ends with a clear, meaningful sentence:"""

FINAL_SUMMARY_PROMPT = """
User Query: "{query}"

The following are summaries extracted from various parts of the video transcripts. Combine these into a single, unified summary that directly addresses the query. Focus on the key points related to the query, avoid repetition, and ensure the summary is coherent and complete.

Summaries:
{summaries}

Provide a concise and focused summary (5–6 lines, with full justification) covering all relevant points. Ensure the summary ends with a strong conclusion and includes actionable insights if applicable:"""

chunk_prompt_template = PromptTemplate(
    input_variables=["transcripts", "query"],
    template=CHUNK_SUMMARY_PROMPT
)

final_prompt_template = PromptTemplate(
    input_variables=["summaries", "query"],
    template=FINAL_SUMMARY_PROMPT
)


def chunk_transcripts(transcripts_queryset, max_chars=10000):  # Increased max_chars
    """Break transcripts into smaller chunks to avoid token limits."""
    chunks = []
    current_chunk = []
    current_length = 0

    for transcript in transcripts_queryset:
        transcript_text = f"VIDEO_ID: {transcript.video_id}\nTitle: {transcript.video_title}\n{transcript.transcript_text}"
        if current_length + len(transcript_text) > max_chars:
            if current_chunk:
                chunks.append("\n\n".join(current_chunk))
            current_chunk = [transcript_text]
            current_length = len(transcript_text)
        else:
            current_chunk.append(transcript_text)
            current_length += len(transcript_text)

    if current_chunk:
        chunks.append("\n\n".join(current_chunk))

    return chunks


def generate_and_store_summaries(search_query_id: int) -> Dict:
    try:
        print(
            f" Starting summary generation process for search query {search_query_id}...")

        # Only get transcripts for current search query
        transcripts = Transcript.objects.filter(
            search_query_id=search_query_id,
            transcript_text__isnull=False
        )

        if not transcripts.exists():
            return {'success': False, 'error': 'No transcripts available for this search'}

        print(
            f" Processing {transcripts.count()} transcripts for current search...")

        # Get and refine the search query
        user_query = transcripts.first().search_query.query_text
        refined_query = clean_and_refine_query(user_query)

        chunk_chain = LLMChain(
            llm=llm,
            prompt=chunk_prompt_template,
            verbose=False
        )

        final_chain = LLMChain(
            llm=llm,
            prompt=final_prompt_template,
            verbose=False
        )

        chunks = chunk_transcripts(transcripts)
        chunk_summaries = []

        for i, chunk in enumerate(chunks, 1):
            print(f" Summarizing part {i} of {len(chunks)}...")
            try:
                summary = chunk_chain.run(
                    transcripts=chunk, query=refined_query)
                chunk_summaries.append(summary)
            except Exception as e:
                print(f" Error in part {i}: {str(e)}")
                continue

        if not chunk_summaries:
            return {'success': False, 'error': 'Failed to generate summaries'}

        print(" Creating final summary...")
        final_summary = final_chain.run(
            summaries="\n\n".join(chunk_summaries), query=refined_query)

        if not final_summary:
            return {'success': False, 'error': 'Final summary generation failed'}

        print(" Summary generation complete!")
        return {'success': True, 'summary': final_summary}

    except Exception as e:
        print(f" Error: {str(e)}")
        return {'success': False, 'error': str(e)}


# GUIDE GENERATION FEATURE
GUIDE_GENERATION_PROMPT = """
User Query: "{query}"

        Create a detailed, structured travel guide based on the following video transcripts and summary. Include all relevant information about places, activities, and tips mentioned in the videos.

        Summary of Content:
        {summary}

        Detailed Transcripts:
        {transcripts}

        Create a comprehensive guide with the following sections:
        1. Introduction
        2. Key Highlights
        3. [Include other relevant sections based on the content]

        Important topics to cover (if mentioned in the content):
        - Transportation
        - Accommodation
        - Food and Dining
        - Tourist Attractions
        - Safety Tips
        - Best Times to Visit
        - Budget Considerations

        Guidelines:
        - Write in clear, natural paragraphs
        - Use simple section headers
        - Include specific details about locations, costs, and recommendations
        - Keep a conversational but informative tone
        - End each section with a complete thought

        Format the guide in plain text with simple section headers and paragraphs. All text must be fully justified. Do not include any HTML, styling, or formatting tags.
Ensure the content is engaging, informative, and well-organized:
"""



def extract_main_topics(query: str, summary: str) -> list[str]:
    """Extract main topics from the query and summary to ensure they're included as headings."""
    # Initialize the same LLM instance
    topic_chain = LLMChain(
        llm=llm,
        prompt=PromptTemplate(
            input_variables=["query", "summary"],
            template="""
            Extract main topics that should be covered in a travel guide based on this query and summary:
            Query: {query}
            Summary: {summary}
            
            Return only the topic names, separated by commas:"""
        )
    )

    topics_str = topic_chain.run(query=query, summary=summary)
    return [topic.strip() for topic in topics_str.split(',')]

def guide_generation(search_query_id: int) -> Dict:
    """Generate a structured travel guide based on video transcripts and summaries."""
    try:
        print(f"Starting guide generation for search query {search_query_id}...")
        
        # Get transcripts and existing summary
        transcripts = Transcript.objects.filter(
            search_query_id=search_query_id,
            transcript_text__isnull=False
        )
        
        if not transcripts.exists():
            return {'success': False, 'error': 'No transcripts available for this guide'}
        
        # Get the search query and summary
        search_query = transcripts.first().search_query
        summary_result = generate_and_store_summaries(search_query_id)
        
        if not summary_result['success']:
            return {'success': False, 'error': 'Failed to generate summary for guide'}
        
        # Extract main topics
        main_topics = extract_main_topics(
            search_query.query_text, summary_result['summary']
        )
        
        # Create the guide generation chain
        guide_prompt = PromptTemplate(
            input_variables=["query", "summary", "transcripts"],
            template=GUIDE_GENERATION_PROMPT
        )
        
        guide_chain = LLMChain(
            llm=llm,
            prompt=guide_prompt,
            verbose=False
        )
        
        # Combine transcripts text
        combined_transcripts = "\n\n".join([
            f"{transcript.transcript_text}"
            for transcript in transcripts
        ])
        
        # Generate the guide
        print("Generating detailed guide...")
        guide_content = guide_chain.run(
            query=search_query.query_text,
            summary=summary_result['summary'],
            transcripts=combined_transcripts
        )
        
        # Format the guide content for HTML display
        formatted_guide = guide_content.replace(
            '\n\n', '</p><p class="guide text-color">'
        )
        formatted_guide = f'<p class="guide text-color">{formatted_guide}</p>'
        
        # Store the guide content immediately
        search_query.guide_content = formatted_guide
        search_query.save()
        
        print("Guide generation complete!")
        
        # Generate audio for the guide in background
        audio_url = generate_guide_audio(formatted_guide, search_query_id)
        
        # Start PDF generation in a separate thread
        def generate_pdf_async():
            try:
                print(" Generating PDF version...")
                pdf_generator = PDFGenerator()
                guide_pdf = pdf_generator.generate_pdf(guide_content, search_query_id)
                if guide_pdf['success']:
                    search_query.guide_pdf = guide_pdf['pdf_content']
                    search_query.pdf_filename = guide_pdf['pdf_filename']
                    search_query.save()
                    print("PDF generation complete!")
                else:
                    print(f"PDF generation failed: {guide_pdf['error']}")
            except Exception as e:
                print(f"Error in PDF generation: {str(e)}")
        
        Thread(target=generate_pdf_async).start()
        
        return {
            'success': True,
            'guide': formatted_guide,
            'topics': main_topics,
            'audio_url': audio_url
        }
        
    except Exception as e:
        print(f"Error in guide generation: {str(e)}")
        return {'success': False, 'error': str(e)}