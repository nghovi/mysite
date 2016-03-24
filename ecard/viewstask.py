import logging
from django.db.models import Q
from .models import Task
from .models import TaskSerializer
from rest_framework import generics
from rest_framework import permissions
from datetime import datetime
import utils
from rest_framework import status


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
            queryset = queryset.filter(
                Q(name__contains=text) | Q(description__contains=text))
        if status is not None:
            queryset = queryset.filter(status=status)
        if priority:
            queryset = queryset.filter(priority=priority)
        if date:
            date = datetime.strptime(date, "%Y-%m-%dT%H:%M:%S")
            queryset = queryset.filter(
                date__year=date.year,
                date__month=date.month, date__day=date.day)
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
        return utils.JSONResponseOk(
            data=instance.id, status=status.HTTP_200_OK)


def task_stats(request):
    date_from = request.GET.get('date_from')
    date_to = request.GET.get('date_to')
    date_from = datetime.strptime(date_from, "%Y-%m-%dT%H:%M:%S")
    date_to = datetime.strptime(date_to, "%Y-%m-%dT%H:%M:%S")
    queryset = Task.objects.all()
    queryset = queryset.filter(Q(date__range=(date_from, date_to)))
    daily_tasks = dict()
    total_finished = 0
    total_unfinished = 0
    for task in queryset:
        key = task.date.strftime("%Y-%m-%d")
        if key not in daily_tasks:
            daily_tasks[key] = dict(date=task.date, taskFinishedCount=0,
                                    taskUnFinishedCount=0)

        if task.status == Task.FINISHED:
            daily_tasks[key]["taskFinishedCount"] += 1
            total_finished += 1
        else:
            daily_tasks[key]["taskUnFinishedCount"] += 1
            total_unfinished += 1
    result = dict(
        daily_tasks=daily_tasks.values(),
        totalFinished=total_finished,
        totalUnfinished=total_unfinished)

    return utils.JSONResponseOk(result)
