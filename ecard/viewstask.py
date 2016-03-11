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
from .utils import JSONResponseOk


from .models import Task
from .models import UserPreference
from .models import Link
from .models import Motto
from .models import LinkSerializer
from .models import TaskSerializer

from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import mixins
from rest_framework import generics
from rest_framework import permissions




from datetime import datetime

import utils
from my_decorators import basicauth


logger = logging.getLogger('mine')


class TaskList(generics.ListCreateAPIView):
    permission_classes = (permissions.IsAuthenticated,)
    def get_queryset(self):
        text = self.request.GET.get('text')
        priority = self.request.GET.get('priority')
        status = self.request.GET.get('status')
        date = self.request.GET.get('date')
        queryset = Task.objects.all()
        if text:
            queryset = queryset.filter(Q(name__contains=text) | Q(description__contains=text))
        if status is not None:
            queryset = queryset.filter(status=status)
        if priority:
            queryset = queryset.filter(priority=priority)
        if date:
            date = datetime.strptime(date, "%Y-%m-%dT%H:%M:%S")
            queryset = queryset.filter(date__year=date.year, date__month=date.month, date__day=date.day)
        queryset.order_by('priority')
        return queryset   
    serializer_class = TaskSerializer

class TaskDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = (permissions.IsAuthenticated,)
    queryset = Task.objects.all()
    serializer_class = TaskSerializer

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        return utils.JSONResponseOk(data=instance.id, status=status.HTTP_200_OK)




# @basicauth
# def get_task(request, task_id):
#     utils.dump(request.GET)
#     task = Task.objects.get(pk=task_id)
#     serializer = TaskSerializer(instance=task)
#     return JSONResponseOk(response)


# # @basicauth
# def get_tasks(request):
#     # utils.dump(request.GET)
#     text=request.POST.get('text')
#     priority=request.POST.get('priority')
#     status=request.POST.get('status')
#     tasks = Task.objects.all()
#     if text:
#         tasks = tasks.filter(Q(name__contains=text) | Q(description__contains=text))
#     if status is not None:
#         tasks = tasks.filter(status=status)
#     if priority:
#         tasks =tasks.filter(priority=priority)

#     # NOTE: Each time you refine a QuerySet, you get a brand-new QuerySet that is in no way bound to the previous QuerySet. Each refinement creates a separate and distinct QuerySet that can be stored, used and reused.
#     serializer = TaskSerializer(instance=tasks, many=True)
#     return JSONResponseOk(serializer.data)


# def get_tasks_by_date(request):
#     utils.dump(request.session)
#     year=request.POST.get('year')
#     month=request.POST.get('month')
#     day=request.POST.get('day')
#     tasks = Task.objects.all().filter(date__year=year, date__month=month, date__day=day).order_by('priority')
#     return JSONResponseOk(TaskSerializer(instance=tasks, many=True).data)

# def add_task(request):
#     name = request.POST.get('name')
#     description = request.POST.get('description')
#     priority = request.POST.get('priority')
#     date = request.POST.get('date')
#     date = datetime.strptime(date, "%Y-%m-%dT%H:%M:%S")
#     new_task = Task(name=name, description=description, priority=priority, date=date)
#     new_task.save()
#     serializer = TaskSerializer(instance=new_task)
#     return JSONResponseOk(serializer.data)

# def edit_task(request):
#     task_id = request.POST.get('id')
#     name = request.POST.get('name')
#     description = request.POST.get('description')
#     priority = request.POST.get('priority')
#     status = request.POST.get('status')
#     date = request.POST.get('date')

#     date = datetime.strptime(date, "%Y-%m-%dT%H:%M:%S")
#     old_task = Task.objects.get(pk=task_id)
#     old_task.name = name
#     old_task.description = description
#     old_task.status = status
#     old_task.priority = priority
#     old_task.date = date
#     old_task.save()
#     serializer = TaskSerializer(instance=old_task)
#     return JSONResponseOk(serializer.data)

# def delete_task(request):
#     # utils.dump(request.POST)
#     task_id = request.POST.get('id')
#     deleted_task = Task.objects.get(pk=task_id)
#     deleted_task.delete()
#     serializer = TaskSerializer(instance=deleted_task)
#     return JSONResponseOk(serializer.data)
