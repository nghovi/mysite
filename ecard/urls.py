from django.conf.urls import url

from . import ecardviews
from . import viewsbook
from . import viewstask
from . import viewsnote
from .models import LinkSerializer
from django.contrib.auth.models import User, Group
from django.conf.urls import url, include

from rest_framework import routers, serializers, viewsets
from rest_framework.urlpatterns import format_suffix_patterns
from rest_framework.authtoken import views


# Routers provide an easy way of automatically determining the URL conf.
router = routers.DefaultRouter()
router.register(r'users', ecardviews.UserViewSet)
router.register(r'group', ecardviews.GroupViewSet)



# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    url(r'^', include(router.urls)),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^api-token-auth/', views.obtain_auth_token),
    url(r'^$', ecardviews.index, name='index'),

    url(r'^get_mottos/$', ecardviews.get_mottos, name='get_mottos'),

    url(r'^task/id=(?P<pk>[0-9]+)/$', viewstask.TaskDetail.as_view(), name='get_task'),
    url(r'^tasks/$', viewstask.TaskList.as_view(), name='get_tasks'),
    # url(r'^delete_task/$', viewstask.delete_task, name='delete_task'),
    # url(r'^add_task/$', viewstask.add_task, name='add_task'),
    # url(r'^edit_task/$', viewstask.edit_task, name='edit_task'),

    # url(r'^search_books/$', viewsbook.search_books, name='search_books'),
    url(r'^books/$', viewsbook.BookList.as_view(), name='get_books'),
    url(r'^book/id=(?P<pk>[0-9]+)/$', viewsbook.BookDetail.as_view(), name='get_book_detail'),
    # url(r'^add_book/$', viewsbook.add_book, name='add_book'),
    url(r'^links/$', viewsbook.LinkList.as_view(), name='get_links'),
    # url(r'^edit_book/$', viewsbook.edit_book, name='edit_book'),
    # url(r'^delete_book/$', viewsbook.delete_book, name='delete_book'),
    url(r'^words/$', viewsbook.WordList.as_view(), name='get_words'),
    url(r'^word/id=(?P<pk>[0-9]+)/$', viewsbook.WordDetail.as_view(), name='get_word'),
    url(r'^add_word/$', viewsbook.add_word, name='add_word'),
    url(r'^phrases/$', viewsbook.PhraseList.as_view(), name='get_phrases'),
    url(r'^phrase/id=(?P<pk>[0-9]+)/$', viewsbook.PhraseDetail.as_view(), name='get_phrase'),
    url(r'^add_phrase/$', viewsbook.add_phrase, name='add_phrase'),
    # url(r'^delete_word/$', viewsbook.delete_word, name='delete_word'),
    # url(r'^delete_phrase/$', viewsbook.delete_phrase, name='delete_phrase'),

    url(r'^note/id=(?P<pk>[0-9]+)/$', viewsnote.NoteDetail.as_view(), name='get_note'),
    url(r'^notes/$', viewsnote.NoteList.as_view(), name='get_notes'),
    # url(r'^delete_notes/$', viewsnote.delete_notes, name='delete_notes'),
    # url(r'^add_note/$', viewsnote.add_note, name='add_note'),
    # url(r'^edit_note/id=(?P<pk>[0-9]+)/$', viewsnote.edit_note, name='edit_note'),

]

# urlpatterns = format_suffix_patterns(urlpatterns)