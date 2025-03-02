import os
from dotenv import load_dotenv
from googleapiclient.discovery import build
import re
import spacy

# Load environment variables
load_dotenv()
key = os.getenv("YoutubeAPI_KEY")

# Load spaCy's small English model for POS tagging
nlp = spacy.load("en_core_web_sm")


def clean_and_refine_query(query):
    """
    Simplify the query while preserving its context using spaCy NLP.
    """
    try:
        # Step 1: Preprocess the query
        query = query.lower()  # Convert to lowercase
        # Remove white spaces, alphanumerics, punctuations
        query = re.sub(r"[^\w\s]", "", query)

        # Step 2: Parse the query with spaCy for POS tagging
        doc = nlp(query)

        # Step 3: Keep only important words (nouns, verbs, adjectives)
        important_words = [
            token.text for token in doc
            # token is not stop word
            if token.pos_ in {"NOUN", "VERB", "ADJ", "PROPN"} and not token.is_stop
        ]  # token.pos_, checks the current token is part of speech or not

        # Combine refined words into a simplified query
        refined_query = " ".join(important_words)

        # If no refined words, fallback to original query
        if not refined_query.strip():  # remove white spaces
            refined_query = query.strip()

        return refined_query
    except Exception as e:
        print(f"Error refining query: {e}")
        return query  # Fallback to original query


def fetch_youtube_videos(query):
    """
    Fetch YouTube videos based on a search query.
    Returns a list of dictionaries containing video details.
    """
    try:
        # Refine the query
        refined_query = clean_and_refine_query(query)
        print(f"Refined Query: {refined_query}")

        # Initialize YouTube API client
        youtube_client = build('youtube', 'v3', developerKey=key)

        # Search for videos using refined query
        response = youtube_client.search().list(
            q=query,
            # this parameter to get all video properties in response.
            part='snippet',
            maxResults=10,
            type='video',
            relevanceLanguage='en',
            order='relevance',
            regionCode='US',
            videoCaption='closedCaption'
        ).execute()

        # Process YouTube API response
        videos = []
        for item in response.get('items', []):
            video_id = item['id']['videoId']
            video_title = item['snippet']['title']
            video_url = f"https://www.youtube.com/watch?v={video_id}"
            video_thumbnail = item['snippet']['thumbnails']['default']['url']
            video_description = item['snippet']['description']

            # Add video details
            videos.append({
                'video_id': video_id,
                'title': video_title,
                'url': video_url,
                'thumbnail': video_thumbnail,
                'description': video_description
            })

        return videos

    except Exception as e:
        print(f"Error fetching YouTube videos: {e}")
        return []
