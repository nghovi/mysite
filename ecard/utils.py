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


def convert_models_to_tuple(records):
    result = []
    for record in records:
        new_record = {}
        for attr in vars(record):
            if attr != '_state':
                new_record[attr] = getattr(record, attr)
        result.append(new_record)
    return result

def get_json_obj_without_slash(obj):
    json_string = json.dumps(obj, skipkeys=True, cls=ComplexEncoder)
    return json.loads(json_string)

def dump(obj):
     pprint (vars(record))