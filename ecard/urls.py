from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),

    url(r'^get_tasks/$', views.task_list, name='get_tasks'),
    url(r'^delete_task/(?P<task_id>[0-9]+)/$', views.delete_task, name='delete_task'),


    url(r'^get_books/$', views.book_list, name='get_books'),
]