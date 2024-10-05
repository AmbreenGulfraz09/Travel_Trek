
# Create your views here.
from django.shortcuts import render

def index(request):
    return render(request, 'app_name/index.html')
