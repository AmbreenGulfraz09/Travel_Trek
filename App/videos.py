from googleapiclient.discovery import build
from langchain_community.document_loaders import YoutubeLoader
import os
from dotenv import load_dotenv

load_dotenv()
key = os.getenv("YoutubeAPI_KEY")


def fetch_youtube_videos(query):
    """
    Fetch YouTube videos based on a search query.
    Returns a list of dictionaries containing video details.
    """
    try:
        # Initialize YouTube API client
        youtube_client = build('youtube', 'v3', developerKey=key)

        # Search for videos
        response = youtube_client.search().list(
            q=query,
            part='snippet',
            maxResults=5,
            type='video',
            relevanceLanguage='en',
            order='relevance',
            regionCode='US',
            videoCaption='closedCaption'
        ).execute()

        videos = []
        for item in response.get('items', []):
            video_id = item['id']['videoId']
            video_title = item['snippet']['title']
            video_url = f"https://www.youtube.com/watch?v={video_id}"
            video_thumbnail = item['snippet']['thumbnails']['default']['url']
            video_description = item['snippet']['description']

            # Add video details without waiting for transcription
            videos.append({
                'video_id': video_id,
                'title': video_title,
                'url': video_url,
                'thumbnail': video_thumbnail,
                'description': video_description,
                'transcript': None  # Placeholder for transcription
            })

        return videos

    except Exception as e:
        print(f"Error fetching YouTube videos: {e}")
        return []
