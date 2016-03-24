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


# @api_view(['GET', 'POST'])
# def get_books(request):
# utils.dump(request.GET)
#     books = Book.objects.all()
#     serializer = BookSimpleSerializer(instance=books, many=True)
#     return Response(serializer.data)

# def search_books(request):
# utils.dump(request.GET)
#     author=request.POST.get('author')
#     name=request.POST.get('name')
#     comment=request.POST.get('comment')

#     books = Book.objects.all()
#     if author:
#         books = books.filter(author__contains=author)
#     if name:
#         books = books.filter(name__contains=name)
#     if comment:
#         books = books.filter(comment__contains=comment)

#     serializer = BookSerializer(instance=books, many=True)
#     return JSONResponseOk(serializer.data)

# def get_book_detail(request):
#     utils.dump(request.POST)
#     book_id = request.POST.get('id')
#     if book_id:
#         book = Book.objects.get(pk=book_id)
#         serializer = BookSerializer(instance=book)
#         return JSONResponseOk(serializer.data)
#     else:
#         return JSONResponseFailure(serializer.data)

# def edit_book(request):
#     book_id = request.POST.get('id')
#     name = request.POST.get('name')
#     author = request.POST.get('author')
#     comment = request.POST.get('comment')
#     iconurl = request.POST.get('iconurl')
#     url = request.POST.get('link')

#     old_book = Book.objects.get(pk=book_id)
#     if url != old_book.link.url:
#         old_book.link.url = url
#         old_book.link.save()
#     old_book.name = name
#     old_book.author = author
#     old_book.comment = comment
#     old_book.iconurl = iconurl
#     old_book.save()

#     serializer = BookSerializer(instance=old_book)
#     return JSONResponseOk(serializer.data)

# def delete_book(request):
# utils.dump(request.POST)
#     book_id = request.POST.get('id')
#     deleted_book = Book.objects.get(pk=book_id)
#     deleted_book.delete()
#     serializer = BookSimpleSerializer(instance=deleted_book)
#     return JSONResponseOk(serializer.data)

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

# def delete_word(request):
#     word_id = request.POST.get('word_id')
#     word = Word.objects.get(pk=word_id)
#     word.delete()
#     response = utils.build_json_obj_success(query=word)
#     serializer = WordSerializer(instance=word)
#     return JSONResponseOk(serializer.data)


def add_phrase(request):
    word_id = request.POST.get('word_id')
    content = request.POST.get('new_phrase')

    word = Word.objects.get(pk=word_id)
    phrase = Phrase(word=word, content=content)
    phrase.save()
    serializer = PhraseSerializer(instance=phrase)
    return JSONResponseOk(serializer.data)
