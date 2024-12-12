from django.shortcuts import render
from django.http import JsonResponse
from googleapiclient.discovery import build
from .videos import fetch_youtube_videos
from django.utils.timezone import now
from .models import Transcript, SearchQuery
from threading import Thread
from .tasks import transcribe_video_task


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


def search_videos(request):
    if request.method == 'POST':
        query = request.POST.get('query')
        search_query = SearchQuery.objects.create(query_text=query)
        video_data = fetch_youtube_videos(query)

        for video in video_data:
            # Save video details to the database
            transcript_obj, created = Transcript.objects.update_or_create(
                video_id=video['video_id'],
                defaults={
                    'search_query': search_query,
                    'video_title': video['title'],
                    'video_url': video['url'],
                    'transcript_text': None,  # Transcription will be added later
                }
            )

            # Start transcription in a new thread
            thread = Thread(target=transcribe_video_task,
                            args=(video['video_id'], video['url']))
            thread.start()

        return render(request, 'App/Result.html', {'videos': video_data})

    return render(request, 'App/Analysis.html')
