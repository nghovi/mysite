from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),

    url(r'^get_primary_card_info/$', views.get_books, name='get_primary_card_info'),


    url(r'^get_tasks/$', views.get_tasks, name='get_tasks'),
    # url(r'^delete_task/(?P<task_id>[0-9]+)/$', views.delete_task, name='delete_task'),
    url(r'^delete_task/$', views.delete_task, name='delete_task'),
    url(r'^add_task/$', views.add_task, name='add_task'),
    url(r'^edit_task/$', views.edit_task, name='edit_task'),
    url(r'^update_status_task/$', views.update_status_task, name='update_status_task'),

    url(r'^get_books/$', views.get_books, name='get_books'),
]