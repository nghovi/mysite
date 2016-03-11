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
from django.contrib.auth.models import User, Group
from django.conf.urls import url, include



from rest_framework import routers, serializers, viewsets


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


# Serializers define the API representation.
class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('url', 'username', 'email', 'is_staff', 'groups')

# ViewSets define the view behavior.
class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer

class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ('url', 'name')

class GroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer
