from django.shortcuts import render
from django.http import JsonResponse
from googleapiclient.discovery import build
key = "AIzaSyBNd0vuYYBgDyve535Y32iO70TMcVNN7Hs"


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


# YOUTUBE API INTEGRATION IN ANALYSIS.HTML AND RESULTS.HTML

def fetch_top_youtube_videos(query):
    try:
        youtube = build('youtube', 'v3', developerKey=key)
        response = youtube.search().list(
            q=query,
            part='snippet',
            maxResults=5,
            type='video',
            relevanceLanguage='en',
            order='relevance',
            regionCode='US',
            videoCaption='closedCaption'
        ).execute()

        videos = [
            {
                'title': item['snippet']['title'],
                'url': f"https://www.youtube.com/watch?v={item['id']['videoId']}",
                'thumbnail': item['snippet']['thumbnails']['default']['url'],
                'description': item['snippet']['description'],
            }
            for item in response.get('items', [])
        ]
        return videos

    except Exception as e:
        print(f"Error fetching YouTube videos: {e}")
        return []


def search_videos(request):
    """Handles the search query and renders results on the results.html page."""
    if request.method == 'POST':
        query = request.POST.get('query')
        videos = fetch_top_youtube_videos(query)
        return render(request, 'App/Result.html', {'videos': videos})
    return render(request, 'App/Analysis.html')
