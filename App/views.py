from django.shortcuts import render
from django.http import JsonResponse
from googleapiclient.discovery import build
from .videos import fetch_and_transcribe_youtube_videos
from .models import Transcript


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
    """Search for videos, transcribe them, and save to the database."""
    if request.method == 'POST':
        query = request.POST.get('query')
        video_data = fetch_and_transcribe_youtube_videos(query)

        for video in video_data:
            # Save transcription to the database
            Transcript.objects.update_or_create(
                video_id=video['video_id'],
                defaults={
                    'video_title': video['title'],
                    'video_url': video['url'],
                    'transcript_text': video['transcript'],
                }
            )

        return render(request, 'App/Result.html', {'videos': video_data})

    return render(request, 'App/Analysis.html')
