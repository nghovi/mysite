from django.db import models
from rest_framework import serializers

#


# Create your models here.
class Link(models.Model):
    url = models.CharField(max_length=200)
    description = models.CharField(max_length=300)
    status = models.IntegerField(default=0)

class LinkSerializer(serializers.ModelSerializer):
    class Meta:
        model = Link
        fields = ('url', 'description', 'status')


class UserPreference(models.Model):
    primary_card = models.ForeignKey(Link)
    user_id = models.IntegerField('user id')

class Book(models.Model):
    iconurl = models.CharField(max_length=200)
    author = models.CharField(max_length=200)
    name = models.CharField(max_length=200)
    comment = models.CharField(max_length=500, default='')
    link = models.ForeignKey(Link)

class Word(models.Model):
    book = models.ForeignKey(Book, related_name='words', default=None, blank=True, null=True)
    syllabus = models.CharField(max_length=200)

class Phrase(models.Model):
    word = models.ForeignKey(Word, related_name="phrases", default=None, blank=True, null=True)
    content = models.CharField(max_length=2000)

class PhraseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Phrase
        fields = ('content', 'id');
        #why fields is autoconverted to string if we don't leave, at the end 


class WordSerializer(serializers.ModelSerializer):
    phrases = PhraseSerializer(many=True, read_only=True)
    class Meta:
        model = Word
        fields = ('syllabus', 'phrases', 'id')



class BookSerializer(serializers.ModelSerializer):
    link = LinkSerializer(many=False, read_only=True)
    words = WordSerializer(many=True, read_only=True)
    class Meta:
        model = Book
        fields = ('id', 'iconurl', 'author', 'name', 'comment', 'link', 'words')


class Task(models.Model):
    name = models.CharField(max_length=200)
    description = models.CharField(max_length=200)
    priority = models.IntegerField(default=0)
    status = models.IntegerField(default=0)
    date = models.DateTimeField()
    lastupdated = models.DateTimeField()

class Motto(models.Model):
    message = models.CharField(max_length=200)
    mottotype = models.IntegerField(default=0)
