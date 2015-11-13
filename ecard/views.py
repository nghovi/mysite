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
from .models import Motto
from datetime import datetime

import utils;
from my_decorators import basicauth


logger = logging.getLogger('mine')


# Create your views here.
def index(request):
    return HttpResponse("Hello, world. You're at the ecard index.")

def get_primary_card_info(request):
    return HttpResponse("todo")

def get_mottos(request):
    # utils.dump(request.GET)
    mottos = Motto.objects.all()
    response = utils.build_obj_from_queryset(mottos);
    return JsonResponse(response, safe=False)

def get_books(request):
    # utils.dump(request.GET)
    books = Book.objects.all()
    for book in books:
        book.link = book.booklink.url
    response = utils.build_obj_from_queryset(books);
    return JsonResponse(response, safe=False)

def edit_book(request):
    new_book_string = request.POST.get('book')
    logger.error(new_book_string)
    jbook = json.loads(new_book_string);
    old_book = Book.objects.get(pk=jbook.get("id"))
    if jbook.get("link") == old_book.booklink.url:
        link = old_book.booklink
    else:
        old_book.booklink.delete()
        link =  Link(url=jbook.get("link"), description="Link of book " + jbook.get("name"))
        link.save()
    updated_book = Book(pk=jbook.get("id"), name=jbook.get("name"), iconUrl=jbook.get("iconUrl"), author=jbook.get("author"),vocabulary=jbook.get("vocabulary"),comment=jbook.get("comment"),booklink=link,mood=jbook.get("mood"))
    updated_book.save()
    response = utils.build_json_obj_success()
    return JsonResponse(response)


def add_book(request):
    new_book_string = request.POST.get('book')
    logger.error(new_book_string)
    jbook = json.loads(new_book_string);
    link =  Link(url=jbook.get("link"), description="Link of book " + jbook.get("name"))
    link.save()
    updated_book = Book(booklink=link, name=jbook.get("name"), iconUrl=jbook.get("iconUrl"), author=jbook.get("author"),vocabulary=jbook.get("vocabulary"),comment=jbook.get("comment"),mood=jbook.get("mood"))
    updated_book.save()
    response = utils.build_json_obj_success()
    return JsonResponse(response)

def delete_book(request):
    # utils.dump(request.POST)
    pk = request.POST.get('id')
    deleted_book = Book.objects.get(pk=pk)
    deleted_book.delete();
    response = utils.build_json_obj_success()
    return JsonResponse(response)


########################### Task######################################



# @basicauth
def get_tasks(request):
    utils.dump(request.GET)
    # date = datetime.strptime("Tue Oct 20 09:26:38 GMT 2015",  '%a %b %d %H:%M:%S %Z %Y')
    # latest_task_list = Task.objects.all().filter(date=date).order_by('-date')
    latest_task_list = Task.objects.all().order_by('-date')
    response = utils.build_obj_from_queryset(latest_task_list);
    return JsonResponse(response, safe=False)

def get_unfinished_tasks(request):
    utils.dump(request.GET)
    latest_task_list = Task.objects.all().filter(status=0).order_by('-date')
    response = utils.build_obj_from_queryset(latest_task_list);
    return JsonResponse(response, safe=False)

def add_task(request):
    new_task_string = request.POST.get('task')
    # logger.error(new_task_string)
    jtask = json.loads(new_task_string);
    date = datetime.strptime(jtask.get('date')[:-5], "%Y-%m-%d %H:%M:%S")
    last_update= datetime.strptime(jtask.get('lastupdated')[:-5], "%Y-%m-%d %H:%M:%S")
    new_task = Task(pk=jtask.get("id"), name=jtask.get("name"), description=jtask.get("description"), status=jtask.get("status"),priority=jtask.get("priority"), date=date, lastupdated=last_update)
    new_task.save()
    response = utils.build_json_obj_success()
    return JsonResponse(response)

def edit_task(request):
    return add_task(request)

def delete_task(request):
    # utils.dump(request.POST)
    pk = request.POST.get('id')
    deleted_task = Task.objects.get(pk=pk)
    deleted_task.delete();
    response = utils.build_json_obj_success()
    return JsonResponse(response)