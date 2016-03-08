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


from .models import UserPreference
from .models import Link
from .models import Motto
from .models import LinkSerializer
from .models import Note
from .models import NoteSerializer




from datetime import datetime

import utils
from my_decorators import basicauth

NOTE_ID_DELIMITER = ','


logger = logging.getLogger('mine')

def get_note(request, note_id):
    utils.dump(request.GET)
    note = Note.objects.get(pk=note_id)
    serializer = NoteSerializer(instance=note)
    response = utils.build_json_obj_success_with_serializer(serializer)
    return JsonResponse(response, safe=False)


# @basicauth
def get_notes(request):
    notes = Note.objects.all().order_by('modified')
    serializer = NoteSerializer(instance=notes, many=True)
    response = utils.build_json_obj_success_with_serializer(serializer)
    return JsonResponse(response, safe=False)


def get_notes_by_date(request):
    # utils.dump(request.GET)
    year=request.POST.get('year')
    month=request.POST.get('month')
    day=request.POST.get('day')
    notes = Note.objects.all().filter(date__year=year, date__month=month, date__day=day).order_by('priority')
    response = utils.build_json_obj_success_query_set(notes)
    return JsonResponse(response, safe=False)

def get_unfinished_notes(request):
    utils.dump(request.GET)
    latest_note_list = Note.objects.all().filter(status=0).order_by('-date')
    response = utils.build_obj_from_queryset(latest_note_list)
    return JsonResponse(response, safe=False)

def add_note(request):
    content = request.POST.get('content')
    notetype = request.POST.get('notetype')

    new_note = Note(content=content, notetype=notetype)
    new_note.save()

    serializer = NoteSerializer(instance=new_note)
    response = utils.build_json_obj_success_with_serializer(serializer)
    return JsonResponse(response)

def edit_note(request):
    note_id = request.POST.get('id')
    content = request.POST.get('content')
    notetype = request.POST.get('notetype')

    old_note = Note.objects.get(pk=note_id)
    old_note.content = content
    old_note.notetype = notetype
    old_note.save()

    serializer = NoteSerializer(instance=old_note)
    response = utils.build_json_obj_success_with_serializer(serializer)
    return JsonResponse(response)

def delete_notes(request):
    # utils.dump(request.POST)
    note_ids = request.POST.get('ids')
    note_ids = note_ids.split(NOTE_ID_DELIMITER)
    for note_id in note_ids:
        deleted_note = Note.objects.get(pk=note_id)
        deleted_note.delete()

    response = utils.build_json_obj_success_data(note_ids)
    return JsonResponse(response)