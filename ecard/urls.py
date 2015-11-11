from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),

    url(r'^get_primary_card_info/$', views.get_books, name='get_primary_card_info'),


    url(r'^get_tasks/$', views.get_tasks, name='get_tasks'),
    url(r'^get_unfinished_tasks/$', views.get_unfinished_tasks, name='get_unfinished_tasks'),

    # url(r'^delete_task/(?P<task_id>[0-9]+)/$', views.delete_task, name='delete_task'),
    url(r'^delete_task/$', views.delete_task, name='delete_task'),
    url(r'^add_task/$', views.add_task, name='add_task'),
    url(r'^edit_task/$', views.edit_task, name='edit_task'),

    url(r'^get_books/$', views.get_books, name='get_books'),
    url(r'^add_book/$', views.add_book, name='add_book'),
    url(r'^edit_book/$', views.edit_book, name='edit_book'),
    url(r'^delete_book/$', views.delete_book, name='delete_book'),
]