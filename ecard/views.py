from django.shortcuts import render
from django.http import HttpResponse
from django.http import JsonResponse
import json
import logging
from django.core import serializers
from pprint import pprint
import base64
from django.contrib.auth import authenticate, login


from .models import Task
from .models import Book
from .models import UserPreference
from .models import Link
from datetime import datetime

import utils;
from my_decorators import basicauth


logger = logging.getLogger('mine')


# Create your views here.
def index(request):
    return HttpResponse("Hello, world. You're at the ecard index.")

def get_primary_card_info(request):
    return HttpResponse("todo")

def get_books(request):
    utils.dump(request.GET)
    books = Book.objects.all()
    response = utils.build_json_obj_from_queryset(books);

    return JsonResponse(response, safe=False)

########################### Task######################################



@basicauth
def get_tasks(request):
    utils.dump(request.GET)
    latest_task_list = Task.objects.order_by('-date')[:5]
    response = utils.build_json_obj_from_queryset(latest_task_list);

    return JsonResponse(response, safe=False)

def add_task(request):
    new_task = Task(name=request.POST.get('name'), description=request.POST.get('description'), date=datetime.strptime(request.POST.get('date'), '%a %b %d %H:%M:%S %Z %Y'))
    new_task.save()
    response = utils.build_json_obj_success()
    return JsonResponse(response)

def delete_task(request):
    utils.dump(request.POST)
    pk = request.POST.get('id')

    deleted_task = Task.objects.get(pk=pk)
    deleted_task.delete();
    response = utils.build_json_obj_success()

    return JsonResponse(response)

def update_status_task(request):
    utils.dump(request.POST)
    pk = request.POST.get('id')
    status = request.POST.get('status')

    updated_task = Task.objects.get(pk=pk)
    updated_task.status = status
    updated_task.save()
    response = utils.build_json_obj_success()

    return JsonResponse(response)




