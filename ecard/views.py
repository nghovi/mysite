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
from datetime import datetime

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
    logger.info(utils.get_json_obj_without_slash(request.POST))
    logger.info(utils.get_json_obj_without_slash(request.GET))
    return JsonResponse(response, safe=False)

def add_task(request):
    utils.dump(request.POST)
    new_task = Task(name=request.POST.get('name'), description=request.POST.get('description'), date=datetime.strptime(request.POST.get('date'), '%a %b %d %H:%M:%S %Z %Y'))
    new_task.save()
    response = utils.get_json_obj_without_slash({'statusCd' : '1'})
    return JsonResponse(response)

def delete_task(request, task_id):
    return HttpResponse("You're going to delete task id " + task_id)

def update_status_task(request, task_id, status):
    return HttpResponse("todo")

