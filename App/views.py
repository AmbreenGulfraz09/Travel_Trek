
# Create your views here.
from django.shortcuts import render
from django.template.loader import get_template


def home(request):
    return render(request, 'base.html')
