import os
from typing import Dict
from langchain_community.vectorstores.faiss import FAISS
from langchain_huggingface import ChatHuggingFace, HuggingFaceEndpoint
from langchain.prompts import PromptTemplate
from langchain.chains import LLMChain
from django.conf import settings
from .tasks import load_vector_store
from .models import Transcript
from dotenv import load_dotenv
import traceback

# Load environment variables
load_dotenv()
key = os.getenv("huggingFaceKey")

# Initialize the LLM
llm = HuggingFaceEndpoint(
    repo_id="HuggingFaceH4/zephyr-7b-beta",
    task="text-generation",  
    max_new_tokens=1024,
    do_sample=False,
    repetition_penalty=1.03,
    huggingfacehub_api_token=key,
)

chat_model = ChatHuggingFace(llm=llm)

# Define prompts
CHUNK_SUMMARY_PROMPT = """Summarize the following video transcripts in 2-3 concise lines:

Transcripts:
{transcripts}

Provide a brief summary of the main points:"""

FINAL_SUMMARY_PROMPT = """Below are summaries from different parts of the videos. Create a unified summary (5-6 lines) that captures the most important points from all parts:

Summaries:
{summaries}

Please provide a unified summary incorporating key points from all parts:"""

chunk_prompt_template = PromptTemplate(
    input_variables=["transcripts"],
    template=CHUNK_SUMMARY_PROMPT
)

final_prompt_template = PromptTemplate(
    input_variables=["summaries"],
    template=FINAL_SUMMARY_PROMPT
)

def chunk_transcripts(transcripts_queryset, max_chars=10000):
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

        chunk_chain = LLMChain(
            llm=chat_model,
            prompt=chunk_prompt_template,
            verbose=False
        )
        
        final_chain = LLMChain(
            llm=chat_model,
            prompt=final_prompt_template,
            verbose=False
        )

        chunks = chunk_transcripts(transcripts)
        chunk_summaries = []
        
        for i, chunk in enumerate(chunks, 1):
            print(f" Summarizing part {i} of {len(chunks)}...")
            try:
                summary = chunk_chain.run(transcripts=chunk)
                chunk_summaries.append(summary)
            except Exception as e:
                print(f" Error in part {i}: {str(e)}")
                continue

        if not chunk_summaries:
            return {'success': False, 'error': 'Failed to generate summaries'}

        print(" Creating final summary...")
        final_summary = final_chain.run(summaries="\n\n".join(chunk_summaries))

        if not final_summary:
            return {'success': False, 'error': 'Final summary generation failed'}

        print(" Summary generation complete!")
        return {'success': True, 'summary': final_summary}
        
    except Exception as e:
        print(f" Error: {str(e)}")
        return {'success': False, 'error': str(e)}