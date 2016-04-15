import logging

from .models import Book
from .models import Word
from .models import Phrase
from .models import LinkSerializer
from .models import WordSerializer
from .models import PhraseSerializer
from .models import BookSerializer
from .models import BookSimpleSerializer
from .models import Link


from rest_framework import generics
from rest_framework import permissions
from rest_framework import status


from utils import JSONResponseOk


logger = logging.getLogger('mine')


class BookList(generics.ListCreateAPIView):
    permission_classes = (permissions.IsAuthenticated,)
    queryset = Book.objects.all()
    serializer_class = BookSimpleSerializer


class BookDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = (permissions.IsAuthenticated,)
    queryset = Book.objects.all()
    serializer_class = BookSerializer

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        return JSONResponseOk(data=instance.id, status=status.HTTP_200_OK)


class LinkList(generics.ListCreateAPIView):
    permission_classes = (permissions.IsAuthenticated,)
    queryset = Link.objects.all()
    serializer_class = LinkSerializer


class WordList(generics.ListCreateAPIView):
    permission_classes = (permissions.IsAuthenticated,)
    queryset = Word.objects.all()
    serializer_class = WordSerializer


class WordDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = (permissions.IsAuthenticated,)
    queryset = Word.objects.all()
    serializer_class = WordSerializer

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        return JSONResponseOk(data=instance.id, status=status.HTTP_200_OK)


class PhraseList(generics.ListCreateAPIView):
    permission_classes = (permissions.IsAuthenticated,)
    queryset = Phrase.objects.all()
    serializer_class = PhraseSerializer


class PhraseDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = (permissions.IsAuthenticated,)
    queryset = Phrase.objects.all()
    serializer_class = PhraseSerializer

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        return JSONResponseOk(data=instance.id, status=status.HTTP_200_OK)


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
    return JSONResponseOk(serializer.data)


def add_phrase(request):
    word_id = request.POST.get('word_id')
    content = request.POST.get('new_phrase')

    word = Word.objects.get(pk=word_id)
    phrase = Phrase(word=word, content=content)
    phrase.save()
    serializer = PhraseSerializer(instance=phrase)
    return JSONResponseOk(serializer.data)
