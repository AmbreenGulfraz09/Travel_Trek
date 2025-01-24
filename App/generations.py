import os
from typing import Dict
from langchain_community.vectorstores.faiss import FAISS
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain.prompts import PromptTemplate
from langchain.chains import LLMChain
from django.conf import settings
from .tasks import load_vector_store
from .models import Transcript
from dotenv import load_dotenv
from .videos import clean_and_refine_query
import traceback

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

Provide a concise and focused summary (5–6 lines) covering all relevant points. Ensure the summary ends with a strong conclusion and includes actionable insights if applicable:"""

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
        print(f" Starting summary generation process for search query {search_query_id}...")
        
        # Only get transcripts for current search query
        transcripts = Transcript.objects.filter(
            search_query_id=search_query_id,
            transcript_text__isnull=False
        )
        
        if not transcripts.exists():
            return {'success': False, 'error': 'No transcripts available for this search'}

        print(f" Processing {transcripts.count()} transcripts for current search...")
        
        # Get and refine the search query
        user_query = transcripts.first().search_query.query_text  # Assuming `query_text` is stored in related search query
        refined_query = clean_and_refine_query(user_query)

        chunk_chain = LLMChain(
            llm=llm,  # Using the directly initialized Gemini LLM
            prompt=chunk_prompt_template,
            verbose=False
        )

        final_chain = LLMChain(
            llm=llm,  # Using the directly initialized Gemini LLM
            prompt=final_prompt_template,
            verbose=False
        )

        chunks = chunk_transcripts(transcripts)
        chunk_summaries = []
        
        for i, chunk in enumerate(chunks, 1):
            print(f" Summarizing part {i} of {len(chunks)}...")
            try:
                summary = chunk_chain.run(transcripts=chunk, query=refined_query)
                chunk_summaries.append(summary)
            except Exception as e:
                print(f" Error in part {i}: {str(e)}")
                continue

        if not chunk_summaries:
            return {'success': False, 'error': 'Failed to generate summaries'}

        print(" Creating final summary...")
        final_summary = final_chain.run(summaries="\n\n".join(chunk_summaries), query=refined_query)

        if not final_summary:
            return {'success': False, 'error': 'Final summary generation failed'}

        print(" Summary generation complete!")
        return {'success': True, 'summary': final_summary}
        
    except Exception as e:
        print(f" Error: {str(e)}")
        return {'success': False, 'error': str(e)}