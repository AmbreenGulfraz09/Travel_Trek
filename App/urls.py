"""
URL configuration for Travel_Trek project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('about/', views.about, name='about'),
    path('contact/', views.contact, name='contact'),
    path('analysis/', views.analysis, name='analysis'),
    path('result/', views.result, name='result'),
    path('admin/', views.admin, name='admin'),
    path('tutorial/', views.tutorial, name='tutorial'),
    path('admin-dashboard/', views.adminDashboard, name='adminDashboard'),
    path('download-pdf/<int:query_id>/', views.download_pdf, name='download_pdf'),
    path('feedback/', views.feedback, name='feedback'),
    path('search/', views.search_videos, name='search_videos'),
    path('check-summaries/', views.check_summaries_status, name='check_summaries'),
    path('check-content/', views.check_content_status, name='check_content'),
    path ('download-guide/', views.download_guide, name= 'download_guide'),
    path('answer_question/', views.answer_question, name='answer_question'),
    ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

