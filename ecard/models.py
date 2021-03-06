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
    iconUrl = models.CharField(max_length=200)
    author = models.CharField(max_length=200)
    name = models.CharField(max_length=200)
    vocabulary = models.TextField(blank=True, null=True)
    comment = models.CharField(max_length=500, default='')
    mood = models.CharField(max_length=1000)
    isDeleted = models.BooleanField(default=False)
    booklink = models.ForeignKey(Link)

class Task(models.Model):
    name = models.CharField(max_length=200)
    description = models.CharField(max_length=200)
    priority = models.IntegerField(default=0)
    status = models.IntegerField(default=0)
    isDeleted = models.BooleanField(default=False)
    date = models.DateTimeField('date updated')
    lastupdated = models.DateTimeField('date updated')

class Motto(models.Model):
    message = models.CharField(max_length=200)
    mottotype = models.IntegerField(default=0)
