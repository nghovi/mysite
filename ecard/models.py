from django.db import models

# Create your models here.
class Link(models.Model):
    url = models.CharField(max_length=200)
    description = models.CharField(max_length=300)
    status = models.IntegerField(default=0)

class UserPreference(models.Model):
    primary_card = models.ForeignKey(Link)
    user_id = models.IntegerField('user id')

class Book(models.Model):
    name = models.CharField(max_length=200)
    author = models.CharField(max_length=200)
    comment = models.CharField(max_length=500, default='')
    link = models.ForeignKey(Link)
    pub_date = models.DateTimeField('date published')

class Task(models.Model):
    name = models.CharField(max_length=200)
    description = models.CharField(max_length=200)
    priority = models.IntegerField(default=0)
    status = models.IntegerField(default=0)
    date = models.DateTimeField('date updated')
    lastupdated = models.DateTimeField('date updated')
