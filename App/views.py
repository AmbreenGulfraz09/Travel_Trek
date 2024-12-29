from django.shortcuts import render
from django.http import JsonResponse
from googleapiclient.discovery import build
from .videos import fetch_youtube_videos
from django.utils.timezone import now
from .models import Transcript, SearchQuery
from threading import Thread
from .tasks import transcribe_and_embed_video_task
from concurrent.futures import ThreadPoolExecutor
from .generations import generate_and_store_summaries
import time


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
            # Clear any old transcripts that might be stuck processing
            Transcript.objects.filter(
                transcript_text__isnull=True
            ).delete()
            
            # Create search query record
            search_query = SearchQuery.objects.create(query_text=query)
            video_data = fetch_youtube_videos(query)
            futures = []

            for video in video_data:
                transcript_obj, created = Transcript.objects.update_or_create(
                    video_id=video['video_id'],
                    search_query=search_query,  # Ensure this is set
                    defaults={
                        'video_title': video['title'],
                        'video_url': video['url'],
                        'transcript_text': None,
                    }
                )

                future = executor.submit(
                    process_video_safely,
                    video['video_id'],
                    video['url']
                )
                futures.append(future)

            def generate_summaries_when_ready():
                try:
                    while not all(future.done() for future in futures):
                        time.sleep(1)

                    # Pass search_query_id to ensure we only process relevant transcripts
                    result = generate_and_store_summaries(search_query.id)
                    print(f"Summary generation result: {result}")
                    if result['success']:
                        search_query.combined_summary = result['summary']
                        search_query.save()
                except Exception as e:
                    print(f"Error in summary generation: {str(e)}")

            executor.submit(generate_summaries_when_ready)

            return render(request, 'App/Result.html', {
                'videos': video_data,
                'combined_summary': None,
                'search_query_id': search_query.id
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
        print(f"Processing video {video_id}")  # Debugging log
        transcribe_and_embed_video_task(video_id, video_url)
        print(f"Processing completed for video {video_id}")
    except Exception as e:
        print(f"Error processing video {video_id}: {str(e)}")


def check_summaries_status(request):
    """
    API endpoint to check if combined summary is ready
    """
    try:
        search_id = request.GET.get('search_id')
        search_query = SearchQuery.objects.get(id=search_id)

        return JsonResponse({
            'combined_summary': search_query.combined_summary,
            'is_ready': bool(search_query.combined_summary)
        })
    except Exception as e:
        print(f"Error in check_summaries_status: {str(e)}")
        return JsonResponse({'error': str(e)}, status=500)
