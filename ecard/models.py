from django.db import models
from rest_framework import serializers

#


# Create your models here.
class Link(models.Model):
    url = models.CharField(max_length=200)
    description = models.CharField(max_length=300)
    status = models.IntegerField(default=0)
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)

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
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)

class Word(models.Model):
    book = models.ForeignKey(Book, related_name='words', default=None, blank=True, null=True)
    syllabus = models.CharField(max_length=200)
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)

class Phrase(models.Model):
    word = models.ForeignKey(Word, related_name="phrases", default=None, blank=True, null=True)
    content = models.CharField(max_length=2000)
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)

class PhraseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Phrase
        fields = ('content', 'id')
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
    UNFINISHED = 0
    FINISHED = 1
    HIGH_PRIORITY = 1
    MEDIUM_PRIORITY = 2
    LOW_PRIORITY = 3

    name = models.CharField(max_length=200)
    description = models.CharField(max_length=200)
    priority = models.IntegerField(default=HIGH_PRIORITY)
    status = models.IntegerField(default=UNFINISHED)
    date = models.DateTimeField()
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)

class TaskSerializer(serializers.ModelSerializer):
    class Meta:
        model = Task
        fields = ('id', 'name', 'description', 'status', 'priority', 'date')

class Motto(models.Model):
    message = models.CharField(max_length=200)
    mottotype = models.IntegerField(default=0)
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)

class Note(models.Model):
    REMEMBER = 0
    IDEA = 1
    content = models.CharField(max_length=2000)
    notetype=models.IntegerField(default=REMEMBER)
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)

class NoteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Note
        fields = ('id', 'content', 'modified', 'notetype')
