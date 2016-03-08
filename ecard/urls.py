from django.conf.urls import url

from . import views
from . import viewsbook
from . import viewstask
from . import viewsnote

urlpatterns = [
    url(r'^$', views.index, name='index'),

    url(r'^get_mottos/$', views.get_mottos, name='get_mottos'),

    url(r'^get_task/(?P<task_id>[0-9]+)/$', viewstask.get_task, name='get_task'),
    url(r'^get_tasks/$', viewstask.get_tasks, name='get_tasks'),
    url(r'^get_tasks_by_date/$', viewstask.get_tasks_by_date, name='get_tasks_by_date'),
    url(r'^get_deleted_tasks/$', viewstask.get_deleted_tasks, name='get_tasks'),
    url(r'^get_unfinished_tasks/$', viewstask.get_unfinished_tasks, name='get_unfinished_tasks'),
    url(r'^delete_task/$', viewstask.delete_task, name='delete_task'),
    url(r'^add_task/$', viewstask.add_task, name='add_task'),
    url(r'^edit_task/$', viewstask.edit_task, name='edit_task'),

    url(r'^search_books/$', viewsbook.search_books, name='search_books'),
    url(r'^get_books/$', viewsbook.get_books, name='get_books'),
    url(r'^get_book_detail/$', viewsbook.get_book_detail, name='get_book_detail'),
    url(r'^add_book/$', viewsbook.add_book, name='add_book'),
    url(r'^edit_book/$', viewsbook.edit_book, name='edit_book'),
    url(r'^delete_book/$', viewsbook.delete_book, name='delete_book'),
    url(r'^add_word/$', viewsbook.add_word, name='add_word'),
    url(r'^add_phrase/$', viewsbook.add_phrase, name='add_phrase'),
    url(r'^delete_word/$', viewsbook.delete_word, name='delete_word'),
    url(r'^delete_phrase/$', viewsbook.delete_phrase, name='delete_phrase'),

    url(r'^get_note/(?P<note_id>[0-9]+)/$', viewsnote.get_note, name='get_note'),
    url(r'^get_notes/$', viewsnote.get_notes, name='get_notes'),
    url(r'^delete_notes/$', viewsnote.delete_notes, name='delete_notes'),
    url(r'^add_note/$', viewsnote.add_note, name='add_note'),
    url(r'^edit_note/$', viewsnote.edit_note, name='edit_note'),

]