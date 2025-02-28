import os
from typing import Dict, Any, List

from langchain.chains import RetrievalQA
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain_community.vectorstores.faiss import FAISS
from langchain.prompts import PromptTemplate
from langchain_huggingface import HuggingFaceEmbeddings
from django.conf import settings
from dotenv import load_dotenv
from .models import SearchQuery, Transcript

# Initialize embeddings
embeddings = HuggingFaceEmbeddings(
    model_name="all-MiniLM-L6-v2",
    model_kwargs={'device': 'cpu'},
    encode_kwargs={'normalize_embeddings': True}
)

def load_vector_store() -> FAISS:
    """
    Load the FAISS vector store from disk.
    """
    if os.path.exists(settings.VECTOR_STORE_PATH):
        return FAISS.load_local(
            settings.VECTOR_STORE_PATH, 
            embeddings,
            allow_dangerous_deserialization=True
        )
    raise FileNotFoundError(f"Vector store not found at {settings.VECTOR_STORE_PATH}")

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
        
        # Verify transcripts have been processed
        if transcripts.filter(transcript_text__isnull=True).exists():
            return {
                'success': False,
                'error': 'Some transcripts are still being processed',
                'answer': None
            }
        
        # Load vector store
        vector_store = load_vector_store()
        
        # Create prompt template
        prompt_template = """
        You are an assistant that answers questions about video content.
        
        Use the following video transcripts as context to answer the question.
        
        Context: {context}
        
        Question: {question}
        
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
    except FileNotFoundError as e:
        return {
            'success': False,
            'error': str(e),
            'answer': None
        }
    except Exception as e:
        print(f"Error processing query: {str(e)}")
        return {
            'success': False,
            'error': f"An error occurred: {str(e)}",
            'answer': None
        }