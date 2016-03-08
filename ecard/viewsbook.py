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

import utils
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
    response = utils.build_obj_from_queryset(mottos)
    return JsonResponse(response, safe=False)

def get_books(request):
    # utils.dump(request.GET)
    books = Book.objects.all()
    # for book in books:
        # book.link = book.booklink.url
    response = utils.build_json_obj_success_query_set(books)
   
    return JsonResponse(response, safe=False)

def search_books(request):
    # utils.dump(request.GET)
    author=request.POST.get('author')
    name=request.POST.get('name')
    comment=request.POST.get('comment')

    books = Book.objects.all()
    if author:
        books = books.filter(author__contains=author)
    if name:
        books = books.filter(name__contains=name)
    if comment:
        books = books.filter(comment__contains=comment)

    serializer = BookSerializer(instance=books, many=True)
    response = utils.build_json_obj_success_with_serializer(serializer)
    return JsonResponse(response, safe=False)

def get_book_detail(request):
    utils.dump(request.POST)
    book_id = request.POST.get('id')
    if book_id:
        book = Book.objects.get(pk=book_id)
        serializer = BookSerializer(instance=book)
        response = utils.build_json_obj_success_with_serializer(serializer)
    else:
        response = utils.build_json_obj_failure({'book_id' : book_id})
    return JsonResponse(response, safe=False)

def edit_book(request):
    book_id = request.POST.get('id')
    name = request.POST.get('name')
    author = request.POST.get('author')
    comment = request.POST.get('comment')
    iconurl = request.POST.get('iconurl')
    url = request.POST.get('link')

    old_book = Book.objects.get(pk=book_id)
    if url != old_book.link.url:
        old_book.link.url = url
        old_book.link.save()
    old_book.name = name
    old_book.author = author
    old_book.comment = comment
    old_book.iconurl = iconurl
    old_book.save()

    serializer = BookSerializer(instance=old_book)
    response = utils.build_json_obj_success_with_serializer(serializer)
    return JsonResponse(response)

def delete_book(request):
    # utils.dump(request.POST)
    book_id = request.POST.get('id')
    deleted_book = Book.objects.get(pk=book_id)
    deleted_book.delete()
    response = utils.build_json_obj_success(query=deleted_book)
    return JsonResponse(response)

def add_word(request):
    book_id = request.POST.get('book_id')
    syllabus = request.POST.get('new_word')
    content = request.POST.get('new_phrase')
   
    book = Book.objects.get(pk=book_id)
    word = Word(syllabus=syllabus, book=book)
    word.save()
    if content:
        phrase = Phrase(word=word, content=content)
        phrase.save()
    serializer = WordSerializer(instance=word)
    response = utils.build_json_obj_success_with_serializer(serializer)
    return JsonResponse(response)

def delete_word(request):
    word_id = request.POST.get('word_id')
    word = Word.objects.get(pk=word_id)
    word.delete()
    response = utils.build_json_obj_success(query=word)
    return JsonResponse(response)

def add_phrase(request):
    word_id = request.POST.get('word_id')
    content = request.POST.get('new_phrase')
   
    word = Word.objects.get(pk=word_id)
    phrase = Phrase(word=word, content=content)
    phrase.save()
    serializer = PhraseSerializer(instance=phrase)
    response = utils.build_json_obj_success_with_serializer(serializer)
    return JsonResponse(response)

def delete_phrase(request):
    phrase_id = request.POST.get('phrase_id')
    phrase = Phrase.objects.get(pk=phrase_id)
    phrase.delete()
    response = utils.build_json_obj_success(query=phrase)
    return JsonResponse(response)

def add_book(request):
    name = request.POST.get('name')
    author = request.POST.get('author')
    comment = request.POST.get('comment')
    iconurl = request.POST.get('iconurl')
    url = request.POST.get('link') 

    link =  Link(url=url, description="Link of book " + name)
    link.save()
      
    new_book = Book(name=name, author=author, comment=comment, iconurl=iconurl, link=link)
    new_book.save()

    serializer = BookSerializer(instance=new_book)
    response = utils.build_json_obj_success_with_serializer(serializer)
    return JsonResponse(response)