# mysite
First Django project

./manage.py runserver
./manage.py startup ecard //create new app

#Create new model
1. edit models.py
2. ./manage.py makemigrations ecard //turn models to schema
3. ./manage.py migrate


manage.py createsuperuser (vietnh90@gmail.com/admin/admin)

error:django.core.exceptions.ImproperlyConfigured: Error loading MySQLdb module: No module named MySQLdb
solution: pip install mysql-python

it could be a solution:
http://stackoverflow.com/questions/9865621/connecting-to-ec2-django-development-server

I was so stupid that i forgot to open Inbound rule ssh so i couldn't login from putty.

ec2-54-175-13-221.compute-1.amazonaws.com
54.175.13.221