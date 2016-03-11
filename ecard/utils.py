from django.shortcuts import render
from django.http import HttpResponse
from django.http import JsonResponse
import json
from django.core import serializers
from pprint import pprint



from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser

class JSONResponseOk(HttpResponse):
    """
    An HttpResponse that renders its content into JSON.
    """
    def __init__(self, data, **kwargs):
        content = JSONRenderer().render({'statusCode': 1, 'data': data})
        kwargs['content_type'] = 'application/json'
        super(JSONResponseOk, self).__init__(content, **kwargs)

class JSONResponseFailure(HttpResponse):
    """
    An HttpResponse that renders its content into JSON.
    """
    def __init__(self, data, **kwargs):
        content = JSONRenderer().render({'statusCode': 0, 'data': data})
        kwargs['content_type'] = 'application/json'
        super(JSONResponseFailure, self).__init__(content, **kwargs)

def dump2(obj):
    print "DUMP2 ++++++++++++++++++++++++"
    pprint(vars(obj))

def dump(obj):
    print "DUMP ++++++++++++++++++++++++"
    if type(obj) is dict:
        for key,val in obj.items():
            print("{} = {}".format(key, val))
    elif type(obj) is list:
        for k in obj:
            dump(k)
    else:
        print obj
     

#This class for make datetime in model serializable
# class ComplexEncoder(json.JSONEncoder):
#     def default(self, obj):
#         try:
#             return super(ComplexEncoder, obj).default(obj)
#         except TypeError:
#             return str(obj)


#Why? because json cannot serialize some special attribute in model object, like _state
# def convert_queryset_to_list(queryset):
#     result = []
#     for record in queryset:
#         new_record = {}
#         for attr in vars(record):
#             if attr != '_state':
#                 new_record[attr] = getattr(record, attr)
#         result.append(new_record)
#     return result

# def get_obj_without_slash(obj):
#     json_string = json.dumps(obj, skipkeys=True, cls=ComplexEncoder)
#     return json.loads(json_string)



# def build_json_obj_success_query(query):
#     new_record = {}
#     for attr in vars(query):
#         if attr != '_state':
#             new_record[attr] = getattr(query, attr)
#     response_dict = {'statusCode' : 1, 'data' : new_record}
#     json_obj = get_obj_without_slash(response_dict)
#     return json_obj

# def build_json_obj_success_with_serializer(serializer):
#     response_dict = {'statusCode' : 1, 'data' : serializer.data}
#     json_obj = get_obj_without_slash(response_dict)
#     return json_obj

# def build_json_obj_success_query_set(queryset):
#     records = convert_queryset_to_list(queryset)
#     response_dict = {'statusCode' : 1, 'data' : records}
#     json_obj = get_obj_without_slash(response_dict)
#     return response_dict

# ### todo
# def build_json_obj_success_data(data):
#     response_dict = {'statusCode' : 1, 'data' : data}
#     json_obj = get_obj_without_slash(response_dict)
#     return json_obj

# def build_json_obj_failure(data):
#     response_dict = {'statusCode' : 0, 'data' : data}
#     json_obj = get_obj_without_slash(response_dict)
#     return response_dict