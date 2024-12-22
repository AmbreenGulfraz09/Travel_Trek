from django.shortcuts import render
from django.http import JsonResponse
from googleapiclient.discovery import build
from .videos import fetch_youtube_videos
from django.utils.timezone import now
from .models import Transcript, SearchQuery
from threading import Thread
from .tasks import transcribe_and_embed_video_task
from concurrent.futures import ThreadPoolExecutor



def home(request):
    return render(request, 'App/home.html')


def about(request):
    return render(request, 'App/about.html')


def contact(request):
    return render(request, 'App/contact.html')


def analysis(request):
    return render(request, 'App/Analysis.html')


def result(request):
    return render(request, 'App/Result.html')


def admin(request):
    return render(request, 'App/AdminLogin.html')


def adminDashboard(request):
    return render(request, 'App/AdminDashboard.html')


def addAdmin(request):
    return render(request, "App/AddAdmin.html")


# Create a thread pool executor
executor = ThreadPoolExecutor(max_workers=3)

def search_videos(request):
    if request.method == 'POST':
        query = request.POST.get('query')
        try:
            # Create search query record
            search_query = SearchQuery.objects.create(query_text=query)
            
            # Fetch videos
            video_data = fetch_youtube_videos(query)
            
            # Process each video
            for video in video_data:
                # Save video details to database
                transcript_obj, created = Transcript.objects.update_or_create(
                    video_id=video['video_id'],
                    defaults={
                        'search_query': search_query,
                        'video_title': video['title'],
                        'video_url': video['url'],
                        'transcript_text': None,
                    }
                )
                
                # Submit transcription task to thread pool
                executor.submit(
                    process_video_safely,
                    video['video_id'],
                    video['url']
                )
            
            return render(request, 'App/Result.html', {
                'videos': video_data,
            })
            
        except Exception as e:
            print(f"Error in search_videos: {str(e)}")
            return render(request, 'App/Result.html', {
                'error': 'An error occurred while processing your request.'
            })
    
    return render(request, 'App/Analysis.html')

def process_video_safely(video_id: str, video_url: str) -> None:
    """
    Wrapper function to safely process videos in threads.
    """
    try:
        transcribe_and_embed_video_task(video_id, video_url)
    except Exception as e:
        print(f"Error processing video {video_id}: {str(e)}")