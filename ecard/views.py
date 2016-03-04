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
from .models import Word
from .models import Phrase
from .models import LinkSerializer
from .models import WordSerializer
from .models import PhraseSerializer
from .models import BookSerializer



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
    # for book in books:
        # book.link = book.booklink.url
    response = utils.build_json_obj_success_query_set(books)
    # serializer = BookSerializer(instance=books, many=True)
    # response = utils.build_json_obj_success_with_serializer(serializer);
    return JsonResponse(response, safe=False)

def get_book_detail(request):
    utils.dump(request.POST)
    book_id = request.POST.get('id')
    if book_id:
        book = Book.objects.get(pk=book_id)
        serializer = BookSerializer(instance=book)
        response = utils.build_json_obj_success_with_serializer(serializer);
    else:
        response = utils.build_json_obj_failure({'book_id' : book_id})
    return JsonResponse(response, safe=False)


def edit_book(request):
    book_id = request.POST.get('id');
    name = request.POST.get('name');
    author = request.POST.get('author');
    comment = request.POST.get('comment');
    iconurl = request.POST.get('iconurl');
    url = request.POST.get('link');

    old_book = Book.objects.get(pk=book_id)
    if url != old_book.link.url:
        old_book.link.url = url;
        old_book.link.save();
    old_book.name = name;
    old_book.author = author;
    old_book.comment = comment;
    old_book.iconurl = iconurl;
    old_book.save();

    serializer = BookSerializer(instance=old_book)
    response = utils.build_json_obj_success_with_serializer(serializer);
    return JsonResponse(response)

def add_word(request):
    book_id = request.POST.get('book_id');
    syllabus = request.POST.get('new_word');
    content = request.POST.get('new_phrase');
   
    book = Book.objects.get(pk=book_id);
    word = Word(syllabus=syllabus, book=book);
    word.save();
    if content:
        phrase = Phrase(word=word, content=content);
        phrase.save();
    serializer = WordSerializer(instance=word);
    response = utils.build_json_obj_success_with_serializer(serializer);
    return JsonResponse(response);

def delete_word(request):
    word_id = request.POST.get('word_id');
    word = Word.objects.get(pk=word_id);
    word.delete();
    response = utils.build_json_obj_success(query=word)
    return JsonResponse(response)

def add_phrase(request):
    word_id = request.POST.get('word_id');
    content = request.POST.get('new_phrase');
   
    word = Word.objects.get(pk=word_id);
    phrase = Phrase(word=word, content=content);
    phrase.save();
    serializer = PhraseSerializer(instance=phrase);
    response = utils.build_json_obj_success_with_serializer(serializer);
    return JsonResponse(response);

def delete_phrase(request):
    phrase_id = request.POST.get('phrase_id');
    phrase = Phrase.objects.get(pk=phrase_id);
    phrase.delete();
    response = utils.build_json_obj_success(query=phrase)
    return JsonResponse(response)

def add_book(request):
    name = request.POST.get('name');
    author = request.POST.get('author');
    comment = request.POST.get('comment');
    iconurl = request.POST.get('iconurl');
    url = request.POST.get('link'); 

    link =  Link(url=url, description="Link of book " + name)
    link.save();
      
    new_book = Book(name=name, author=author, comment=comment, iconurl=iconurl, link=link)
    new_book.save();

    serializer = BookSerializer(instance=new_book)
    response = utils.build_json_obj_success_with_serializer(serializer);
    return JsonResponse(response)

def delete_book(request):
    # utils.dump(request.POST)
    book_id = request.POST.get('id')
    deleted_book = Book.objects.get(pk=book_id)
    deleted_book.delete();
    response = utils.build_json_obj_success(query=deleted_book)
    return JsonResponse(response)


########################### Task######################################



# @basicauth
def get_tasks(request):
    utils.dump(request.GET)
    tasks = Task.objects.all().order_by('priority');
    response = utils.build_json_obj_success_query_set(tasks);
    return JsonResponse(response, safe=False)

def get_tasks_by_date(request):
    utils.dump(request.GET)
    year=request.POST.get('year');
    month=request.POST.get('month');
    day=request.POST.get('day');
    tasks = Task.objects.all().filter(date__year=year, date__month=month, date__day=day).order_by('priority');
    response = utils.build_json_obj_success_query_set(tasks);
    return JsonResponse(response, safe=False)

# For save memory at client
def get_deleted_tasks(request):
    utils.dump(request.GET)
    latest_task_list = Task.objects.all().filter(isDeleted=True).order_by('-date')
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
    new_task = Task(name=jtask.get("name"), description=jtask.get("description"), status=jtask.get("status"),priority=jtask.get("priority"), date=date, lastupdated=last_update, isDeleted=False)
    new_task.save()
    response = utils.build_json_obj_success(query=new_task.id)
    return JsonResponse(response)

def edit_task(request):
    new_task_string = request.POST.get('task')
    # logger.error(new_task_string)
    jtask = json.loads(new_task_string);
    date = datetime.strptime(jtask.get('date')[:-5], "%Y-%m-%d %H:%M:%S")
    last_update= datetime.strptime(jtask.get('lastupdated')[:-5], "%Y-%m-%d %H:%M:%S")
    primary_key = jtask.get("id");
    if (primary_key):
        new_task = Task(pk=primary_key, name=jtask.get("name"), description=jtask.get("description"), status=jtask.get("status"),priority=jtask.get("priority"), date=date, lastupdated=last_update)
    else:
        new_task = Task(name=jtask.get("name"), description=jtask.get("description"), status=jtask.get("status"),priority=jtask.get("priority"), date=date, lastupdated=last_update)
    new_task.save()
    response = utils.build_json_obj_success(query=new_task.id)
    return JsonResponse(response)

def delete_task(request):
    # utils.dump(request.POST)
    pk = request.POST.get('id')
    deleted_task = Task.objects.get(pk=pk)
    deleted_task.isDeleted = True;
    # deleted_task.delete();
    deleted_task.save();
    response = utils.build_json_obj_success(query=False)
    return JsonResponse(response)