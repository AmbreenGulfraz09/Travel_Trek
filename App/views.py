from django.shortcuts import render

def home(request):
    return render(request, 'App/home.html')  # The path matches the template folder

def about(request):
    return render(request, 'App/about.html')

def contact(request):
    return render(request, 'App/contact.html')

def analysis(request):
    return render(request, 'App/Analysis.html')
