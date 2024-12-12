from langchain_community.document_loaders import YoutubeLoader
from .models import Transcript

def transcribe_video_task(video_id, video_url):
    try:
        loader = YoutubeLoader.from_youtube_url(video_url, language=['en'], translation='en')
        docs = loader.load()
        transcript = " ".join([doc.page_content for doc in docs])

        Transcript.objects.filter(video_id=video_id).update(transcript_text=transcript)
        print(f"Transcription completed for video: {video_id}")
    except Exception as e:
        print(f"Error transcribing video {video_id}: {e}")
