from django.shortcuts import render

from django.http import HttpResponse
from .models import Task
from .models import Book
from .models import UserPreference
from .models import Link

# Create your views here.
def index(request):
    return HttpResponse("Hello, world. You're at the ecard index.")

def task_list(request):
    latest_task_list = Task.objects.order_by('-date')[:5]
    output = ', '.join([task.name for task in latest_task_list])
    return HttpResponse("You're requesting task list: <br/>" + output)

def delete_task(request, task_id):
    return HttpResponse("You're going to delete task id " + task_id)

def book_list(request):
    response = "You're requesting book list %s."
    return HttpResponse(response)