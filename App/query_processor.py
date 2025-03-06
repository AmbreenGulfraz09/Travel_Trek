import os
from typing import Dict, Any, List

from langchain.chains import RetrievalQA
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain_community.vectorstores.faiss import FAISS
from langchain.prompts import PromptTemplate
from langchain_huggingface import HuggingFaceEmbeddings
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain.docstore.document import Document
from django.conf import settings
from dotenv import load_dotenv
from .models import SearchQuery, Transcript

# Initialize embeddings
embeddings = HuggingFaceEmbeddings(
    model_name="all-MiniLM-L6-v2",
    model_kwargs={'device': 'cpu'},
    encode_kwargs={'normalize_embeddings': True}
)

def create_query_specific_vectorstore(transcripts) -> FAISS:
    """
    Create a query-specific vector store from transcripts.
    """
    # Combine all transcript texts
    all_texts = []
    
    for transcript in transcripts:
        if transcript.transcript_text:
            # Create document with metadata
            doc = Document(
                page_content=transcript.transcript_text,
                metadata={
                    "video_id": transcript.video_id,
                    "video_title": transcript.video_title,
                    "video_url": transcript.video_url
                }
            )
            all_texts.append(doc)
    
    # Create vector store from documents
    if all_texts:
        # Optional: Split texts into chunks if they're very large
        text_splitter = RecursiveCharacterTextSplitter(
            chunk_size=1000,
            chunk_overlap=100
        )
        split_texts = text_splitter.split_documents(all_texts)
        
        # Create and return the vector store
        return FAISS.from_documents(split_texts, embeddings)
    
    return None

def process_query(search_query_id: str, user_query: str) -> Dict[str, Any]:
    """
    Process a user query against the video content associated with a search.
    
    Args:
        search_query_id: The ID of the SearchQuery object
        user_query: The user's natural language query
        
    Returns:
        Dictionary containing the result and metadata
    """
    try:
        # Load the search query
        search_query = SearchQuery.objects.get(id=search_query_id)
        
        # Get associated transcripts
        transcripts = Transcript.objects.filter(search_query=search_query)
        
        if not transcripts.exists():
            return {
                'success': False,
                'error': 'No transcripts found for this search query',
                'answer': None
            }
        
        # Check if transcripts have been processed by verifying they have content
        incomplete_transcripts = transcripts.filter(transcript_text__isnull=True).count()
        total_transcripts = transcripts.count()
        
        # If all transcripts are null, there's a problem
        if incomplete_transcripts == total_transcripts:
            return {
                'success': False,
                'error': 'No transcript data is available for processing',
                'answer': None
            }
        
        # If some transcripts are missing but not all, we can continue with the available ones
        # Just log a warning that some transcripts are missing
        if incomplete_transcripts > 0:
            print(f"Warning: {incomplete_transcripts} out of {total_transcripts} transcripts are missing for query {search_query_id}")
        
        # Create a query-specific vector store from the available transcripts
        vector_store = create_query_specific_vectorstore(transcripts.exclude(transcript_text__isnull=True))
        
        if not vector_store:
            return {
                'success': False,
                'error': 'Failed to create vector store from transcripts',
                'answer': None
            }
        
        # Enhance context with guide if available
        additional_context = ""
        if search_query.guide_content:
            additional_context = f"\nAdditional guide information: {search_query.guide_content}\n"
        
        # Create prompt template with enhanced context
        prompt_template = f"""
        You are an assistant that answers questions about video content.
        
        Use the following video transcripts as context to answer the question.
        
        Context: {{context}}
        {additional_context}
        
        Question: {{question}}
        
        Provide a concise, accurate answer based only on the information in the context.
        If the answer is not contained in the context, say "I don't have enough information to answer that question based on the videos."
        
        Answer:
        """
        
        PROMPT = PromptTemplate(
            template=prompt_template,
            input_variables=["context", "question"]
        )
        
        # Load environment variables
        load_dotenv()
        gemini_key = os.getenv("GeminiAPIkey")

        # Initialize the LLM 
        llm = ChatGoogleGenerativeAI(
             model="models/gemini-1.5-flash",
             google_api_key=gemini_key,
             temperature=0.3,
             )
        
        # Create retrieval QA chain
        qa_chain = RetrievalQA.from_chain_type(
            llm=llm,
            chain_type="stuff",
            retriever=vector_store.as_retriever(search_kwargs={"k": 3}),
            chain_type_kwargs={"prompt": PROMPT}
        )
        
        # Process the query
        result = qa_chain.invoke(user_query)
        
        # Extract the answer from the result
        answer = result.get('result', '')
        
        return {
            'success': True,
            'answer': answer,
            'query': user_query
        }
    
    except SearchQuery.DoesNotExist:
        return {
            'success': False,
            'error': 'Search query not found',
            'answer': None
        }
    except Exception as e:
        print(f"Error processing query: {str(e)}")
        return {
            'success': False,
            'error': f"An error occurred: {str(e)}",
            'answer': None
        }