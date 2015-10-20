from django.shortcuts import render
from django.http import HttpResponse
from django.http import JsonResponse
import json
from django.core import serializers
from .models import Task
from .models import Book
from .models import UserPreference
from .models import Link
from pprint import pprint

#This class for make datetime in model serializable
class ComplexEncoder(json.JSONEncoder):
    def default(self, obj):
        try:
            return super(ComplexEncoder, obj).default(obj)
        except TypeError:
            return str(obj)


#Why? because json cannot serialize some special attribute in model object, like _state
def convert_queryset_to_list(queryset):
    result = []
    for record in queryset:
        new_record = {}
        for attr in vars(record):
            if attr != '_state':
                new_record[attr] = getattr(record, attr)
        result.append(new_record)
    return result

def get_obj_without_slash(obj):
    json_string = json.dumps(obj, skipkeys=True, cls=ComplexEncoder)
    return json.loads(json_string)

def dump(obj):
     print ("Dump object " + str(obj) + ":\n")
     pprint(vars(obj))

def build_obj_from_queryset(queryset):
    records = convert_queryset_to_list(queryset)
    response_dict = {'data' : records}
    json_obj = get_obj_without_slash(response_dict)
    return json_obj

def build_json_obj_success():
    response_dict = {'statusCode' : 1}
    json_obj = get_obj_without_slash(response_dict)
    return response_dict