import os
from typing import Optional
from langchain_community.document_loaders import YoutubeLoader
from langchain_huggingface import HuggingFaceEmbeddings
from langchain_community.vectorstores.faiss import FAISS
from .models import Transcript
from django.conf import settings

# Ensure vector store directory exists
vector_store_dir = os.path.dirname(settings.VECTOR_STORE_PATH)
if not os.path.exists(vector_store_dir):
    os.makedirs(vector_store_dir)

# Initialize HuggingFace embeddings
embeddings = HuggingFaceEmbeddings(
    model_name="all-MiniLM-L6-v2",
    model_kwargs={'device': 'cpu'},
    encode_kwargs={'normalize_embeddings': True}
)


def load_vector_store() -> Optional[FAISS]:
    """
    Load the FAISS vector store from disk if it exists.
    Returns None if the store doesn't exist.
    """
    if os.path.exists(settings.VECTOR_STORE_PATH):
        print(f"Loading FAISS vector store from: {settings.VECTOR_STORE_PATH}")
        # Added allow_dangerous_deserialization=True since we're working with our own files
        return FAISS.load_local(
            settings.VECTOR_STORE_PATH,
            embeddings,
            allow_dangerous_deserialization=True  # Added this line
        )
    return None


def save_vector_store(store: FAISS) -> None:
    """
    Save the FAISS vector store to disk.
    """
    print(f"Saving FAISS vector store to: {settings.VECTOR_STORE_PATH}")
    store.save_local(settings.VECTOR_STORE_PATH)


def transcribe_and_embed_video_task(video_id: str, video_url: str) -> None:
    """
    Transcribe a YouTube video and store its embeddings in FAISS.
    """
    try:
        # Step 1: Load or initialize vector store
        vector_store = load_vector_store()

        # Step 2: Transcribe the video
        loader = YoutubeLoader.from_youtube_url(
            video_url,
            language=["en"],
            translation="en"
        )
        docs = loader.load()
        transcript = " ".join([doc.page_content for doc in docs])

        # Save transcript to database
        Transcript.objects.update_or_create(
            video_id=video_id,
            defaults={'transcript_text': transcript}
        )

        # Step 3: Create or update vector store
        if vector_store is None:
            # Create new vector store if none exists
            print(f"Creating new FAISS vector store with video {video_id}")
            vector_store = FAISS.from_texts(
                texts=[transcript],
                embedding=embeddings,
                metadatas=[{"video_id": video_id}]
            )
        else:
            # Add to existing vector store
            print(f"Adding video {video_id} to existing vector store")
            vector_store.add_texts(
                texts=[transcript],
                metadatas=[{"video_id": video_id}]
            )

        # Step 4: Save vector store
        save_vector_store(vector_store)
        print(f"Successfully processed video: {video_id}")

    except Exception as e:
        print(f"Error processing video {video_id}: {str(e)}")
        raise
