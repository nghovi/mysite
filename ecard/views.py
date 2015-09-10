from django.shortcuts import render

from django.http import HttpResponse
from django.http import JsonResponse

import json
from django.core import serializers


from .models import Task
from .models import Book
from .models import UserPreference
from .models import Link

# Create your views here.
def index(request):
    return HttpResponse("Hello, world. You're at the ecard index.")

def task_list(request):
    response2 = ""
    for key,value in request.META.items():
        response2 += key
        if type(value) is str:
            response2 = response2 + ":" + value

    latest_task_list = Task.objects.order_by('-date')[:5]
    # output = ', '.join([task.name for task in latest_task_list])
    # return HttpResponse("You're requesting task list: <br/>" + output)
    # In order to serialize objects other than dict you must set the safe parameter to False:
    response = serializers.serialize("json", latest_task_list)
    return HttpResponse(response2)
    #return JsonResponse(json.loads(response) + response2, safe=False)

def add_task(request):
    return HttpResponse("sfsf")

def delete_task(request, task_id):
    return HttpResponse("You're going to delete task id " + task_id)

def book_list(request):
    response = "You're requesting book list %s."
    return HttpResponse(response)