from django.shortcuts import render
from django.http import HttpResponse
from django.http import JsonResponse
import json
import logging
from django.core import serializers
from pprint import pprint
import base64
from django.contrib.auth import authenticate, login
from django.db.models import Q


from .models import Task
from .models import UserPreference
from .models import Link
from .models import Motto
from .models import LinkSerializer
from .models import TaskSerializer




from datetime import datetime

import utils
from my_decorators import basicauth


logger = logging.getLogger('mine')


# @basicauth
def get_task(request, task_id):
    utils.dump(request.GET)
    task = Task.objects.get(pk=task_id)
    serializer = TaskSerializer(instance=task)
    response = utils.build_json_obj_success_with_serializer(serializer)
    return JsonResponse(response, safe=False)


# @basicauth
def get_tasks(request):
    # utils.dump(request.GET)
    text=request.POST.get('text')
    priority=request.POST.get('priority')
    status=request.POST.get('status')
    tasks = Task.objects.filter(Q(name__contains=text) | Q(description__contains=text))
    if status is not None:
        tasks = tasks.filter(status=status)
    if priority:
        tasks =tasks.filter(priority=priority)

    # NOTE: Each time you refine a QuerySet, you get a brand-new QuerySet that is in no way bound to the previous QuerySet. Each refinement creates a separate and distinct QuerySet that can be stored, used and reused.
    response = utils.build_json_obj_success_query_set(tasks.order_by('priority'))
    return JsonResponse(response, safe=False)


def get_tasks_by_date(request):
    utils.dump(request.session)
    year=request.POST.get('year')
    month=request.POST.get('month')
    day=request.POST.get('day')
    tasks = Task.objects.all().filter(date__year=year, date__month=month, date__day=day).order_by('priority')
    response = utils.build_json_obj_success_query_set(tasks)
    return JsonResponse(response, safe=False)

# For save memory at client
def get_deleted_tasks(request):
    utils.dump(request.GET)
    latest_task_list = Task.objects.all().filter(isDeleted=True).order_by('-date')
    response = utils.build_obj_from_queryset(latest_task_list)
    return JsonResponse(response, safe=False)

def get_unfinished_tasks(request):
    utils.dump(request.GET)
    latest_task_list = Task.objects.all().filter(status=0).order_by('-date')
    response = utils.build_obj_from_queryset(latest_task_list)
    return JsonResponse(response, safe=False)

def add_task(request):
    name = request.POST.get('name')
    description = request.POST.get('description')
    priority = request.POST.get('priority')
    date = request.POST.get('date')
    date = datetime.strptime(date, "%Y-%m-%dT%H:%M:%S")
    new_task = Task(name=name, description=description, priority=priority, date=date)
    new_task.save()
    serializer = TaskSerializer(instance=new_task)
    response = utils.build_json_obj_success_with_serializer(serializer)
    return JsonResponse(response)

def edit_task(request):
    task_id = request.POST.get('id')
    name = request.POST.get('name')
    description = request.POST.get('description')
    priority = request.POST.get('priority')
    status = request.POST.get('status')
    date = request.POST.get('date')

    date = datetime.strptime(date, "%Y-%m-%dT%H:%M:%S")
    old_task = Task.objects.get(pk=task_id)
    old_task.name = name
    old_task.description = description
    old_task.status = status
    old_task.priority = priority
    old_task.date = date
    old_task.save()
    serializer = TaskSerializer(instance=old_task)
    response = utils.build_json_obj_success_with_serializer(serializer)
    return JsonResponse(response)

def delete_task(request):
    # utils.dump(request.POST)
    task_id = request.POST.get('id')
    deleted_task = Task.objects.get(pk=task_id)
    deleted_task.delete()
    serializer = TaskSerializer(instance=deleted_task)
    response = utils.build_json_obj_success_with_serializer(serializer)
    return JsonResponse(response)
