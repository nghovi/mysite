from django.shortcuts import render

from django.http import HttpResponse
from django.http import JsonResponse

import json
import logging
# import bson
from django.core import serializers
from pprint import pprint


from .models import Task
from .models import Book
from .models import UserPreference
from .models import Link

import utils;


logger = logging.getLogger('mine')

# Create your views here.
def index(request):
    return HttpResponse("Hello, world. You're at the ecard index.")

def get_primary_card_info(request):
    return HttpResponse("todo")

def get_books(request):
    response = "You're requesting book list %s."
    return HttpResponse(response)


########################### Task######################################




def get_tasks(request):
    latest_task_list = Task.objects.order_by('-date')[:5]
    data = utils.convert_models_to_tuple(latest_task_list)
    rp = {'data' : data}
    response = utils.get_json_obj_without_slash(rp)
    logger.info(response)
    return JsonResponse(response, safe=False)

def add_task(request):

    return HttpResponse("sfsf")

def delete_task(request, task_id):
    return HttpResponse("You're going to delete task id " + task_id)

def update_status_task(request, task_id, status):
    return HttpResponse("todo")

