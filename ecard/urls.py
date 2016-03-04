from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),

    url(r'^get_primary_card_info/$', views.get_books, name='get_primary_card_info'),
    url(r'^get_mottos/$', views.get_mottos, name='get_mottos'),


    url(r'^get_tasks/$', views.get_tasks, name='get_tasks'),
    url(r'^get_tasks_by_date/$', views.get_tasks_by_date, name='get_tasks_by_date'),
    url(r'^get_deleted_tasks/$', views.get_deleted_tasks, name='get_tasks'),
    url(r'^get_unfinished_tasks/$', views.get_unfinished_tasks, name='get_unfinished_tasks'),

    # url(r'^delete_task/(?P<task_id>[0-9]+)/$', views.delete_task, name='delete_task'),
    url(r'^delete_task/$', views.delete_task, name='delete_task'),
    url(r'^add_task/$', views.add_task, name='add_task'),
    url(r'^edit_task/$', views.edit_task, name='edit_task'),

    url(r'^get_books/$', views.get_books, name='get_books'),
    url(r'^get_book_detail/$', views.get_book_detail, name='get_book_detail'),
    url(r'^add_book/$', views.add_book, name='add_book'),
    url(r'^edit_book/$', views.edit_book, name='edit_book'),
    url(r'^delete_book/$', views.delete_book, name='delete_book'),
    url(r'^add_word/$', views.add_word, name='add_word'),
    url(r'^add_phrase/$', views.add_phrase, name='add_phrase'),
    url(r'^delete_word/$', views.delete_word, name='delete_word'),
    url(r'^delete_phrase/$', views.delete_phrase, name='delete_phrase'),


]