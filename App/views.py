from django.shortcuts import render
from django.http import JsonResponse
from googleapiclient.discovery import build
from .videos import fetch_youtube_videos
from django.utils.timezone import now
from .models import Transcript, SearchQuery
from threading import Thread
from .tasks import transcribe_and_embed_video_task
from concurrent.futures import ThreadPoolExecutor
from .generations import generate_and_store_summaries, guide_generation
import time
from django.db import transaction
from django.core.exceptions import ObjectDoesNotExist
from django.http import FileResponse, Http404
import os
import traceback
from django.conf import settings

def home(request):
    return render(request, 'App/home.html')


def about(request):
    return render(request, 'App/about.html')


def contact(request):
    return render(request, 'App/contact.html')


def analysis(request):
    return render(request, 'App/Analysis.html')


def tutorial(request):
    return render(request, 'App/tutorial.html')


def result(request):
    return render(request, 'App/Result.html')


def admin(request):
    return render(request, 'App/AdminLogin.html')


def adminDashboard(request):
    return render(request, 'App/AdminDashboard.html')


def addAdmin(request):
    return render(request, "App/AddAdmin.html")


executor = ThreadPoolExecutor(max_workers=5)

def search_videos(request):
    if request.method == 'POST':
        query = request.POST.get('query')
        try:
            # Fetch videos from YouTube
            video_data = fetch_youtube_videos(query)
            
            # Check for existing search
            existing_search = SearchQuery.objects.filter(
                query_text__iexact=query).first()
            if existing_search:
                if existing_search.combined_summary:
                    # Return cached results
                    guide_result = guide_generation(existing_search.id)
                    guide_content = guide_result['guide'] if guide_result['success'] else None
                    audio_url = guide_result.get('audio_url', '') if guide_result['success'] else ''
                    return render(request, 'App/Result.html', {
                        'videos': video_data,
                        'combined_summary': existing_search.combined_summary,
                        'guide_content': guide_content,
                        'audio_url': audio_url,
                        'search_query_id': existing_search.id
                    })
                else:
                    # Delete existing incomplete records
                    with transaction.atomic():
                        Transcript.objects.filter(
                            search_query=existing_search).delete()
                        existing_search.delete()
            
            # Process as new search
            search_query = SearchQuery.objects.create(query_text=query)
            futures = []
            
            for video in video_data:
                # Avoid duplicate entries
                if not Transcript.objects.filter(video_id=video['video_id']).exists():
                    Transcript.objects.create(
                        video_id=video['video_id'],
                        search_query=search_query,
                        video_title=video['title'],
                        video_url=video['url'],
                        transcript_text=None
                    )
                    # Submit video for processing
                    future = executor.submit(
                        process_video_safely,
                        video['video_id'],
                        video['url']
                    )
                    futures.append(future)
            
            # Function to generate summaries and guide
            def generate_content_when_ready():
                try:
                    while not all(future.done() for future in futures):
                        time.sleep(1)
                    
                    # Generate summary first
                    summary_result = generate_and_store_summaries(search_query.id)
                    if summary_result['success']:
                        search_query.combined_summary = summary_result['summary']
                        search_query.save()
                    
                     # Only generate guide after summary is successfully generated
                        print("Summary generated, now generating guide...")
                        guide_result = guide_generation(search_query.id)
                        if guide_result['success']:
                             search_query.guide_content = guide_result['guide']
                             search_query.save()
                        else:
                            print(f"Guide generation failed: {guide_result.get('error')}")
                    else:
                        print(f"Summary generation failed: {summary_result.get('error')}")

                except Exception as e:
                    print(f"Error in content generation: {str(e)}")
                    traceback.print_exc()
            
            executor.submit(generate_content_when_ready)
            
            return render(request, 'App/Result.html', {
                'videos': video_data,
                'combined_summary': None,
                'guide_content': None,
                'search_query_id': search_query.id
            })
        except Exception as e:
            print(f"Error in search_videos: {str(e)}")
            return render(request, 'App/Result.html', {
                'error': 'An error occurred while processing your request.'
            })
    
    return render(request, 'App/Analysis.html')


def check_content_status(request):
    """Check the status of summary and guide generation."""
    search_query_id = request.GET.get('search_query_id')
    try:
        search_query = SearchQuery.objects.get(id=search_query_id)
        
        # Get the audio file URL if it exists
        audio_url = None
        if search_query.guide_content:
            audio_filename = f"guide_{search_query_id}_*.mp3"
            audio_dir = os.path.join(settings.MEDIA_ROOT, 'audio_guides')
            audio_files = [f for f in os.listdir(audio_dir) if f.startswith(f"guide_{search_query_id}_")]
            if audio_files:
                audio_url = f'/media/audio_guides/{audio_files[0]}'
        
        return JsonResponse({
            'summary_ready': bool(search_query.combined_summary),
            'guide_ready': bool(search_query.guide_content),
            'summary': search_query.combined_summary if search_query.combined_summary else None,
            'guide': search_query.guide_content if search_query.guide_content else None,
            'audio_url': audio_url
        })
    except SearchQuery.DoesNotExist:
        return JsonResponse({'error': 'Search query not found'}, status=404)
    except Exception as e:
        print(f"Error in check_content_status: {str(e)}")
        return JsonResponse({'error': str(e)}, status=500)



def process_video_safely(video_id: str, video_url: str) -> None:
    """
    Wrapper function to safely process videos in threads.
    """
    try:
        print(f"Processing video {video_id}") 
        transcribe_and_embed_video_task(video_id, video_url)
        print(f"Processing completed for video {video_id}")
    except Exception as e:
        print(f"Error processing video {video_id}: {str(e)}")


def check_summaries_status(request):
    """
    API endpoint to check if combined summary is ready
    """
    try:
        # Get 'search_id' from the request
        search_id = request.GET.get('search_id')

        # Validate 'search_id'
        if not search_id:
            return JsonResponse({'error': "Missing 'search_id' in the request."}, status=400)

        # Attempt to retrieve the SearchQuery record
        search_query = SearchQuery.objects.get(id=search_id)

        # Respond with the summary status
        return JsonResponse({
            'combined_summary': search_query.combined_summary,
            'is_ready': bool(search_query.combined_summary)
        })

    except ValueError:
        # Handle invalid search_id (non-numeric or malformed)
        return JsonResponse({'error': "'search_id' must be a valid number."}, status=400)

    except ObjectDoesNotExist:
        # Handle non-existent SearchQuery record
        return JsonResponse({'error': "No search found for the given 'search_id'."}, status=404)

    except Exception as e:
        # Catch-all for other unexpected errors
        print(f"Error in check_summaries_status: {str(e)}")
        return JsonResponse({'error': 'An unexpected error occurred.'}, status=500)


