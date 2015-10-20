# mysite
First Django project

#todo: enable csrf
#todo: http://www.lifehack.org/318009/25-websites-other-than-social-media-upgrade-your-life?mid=20151006&ref=mail&uid=464409&feq=daily
#todo: don't know why simple JsonObjectRequest of volley doesn't work, so using BasicJsonRequest from quicker as temporary solution.
#todo: read http://www.tutorialspoint.com/python/python_lists.htm
#todo: python convention
#todo: new shoe, new kindle
#todo: http://thecodeship.com/patterns/guide-to-python-function-decorators/


-------------Command----------------------------------------------------
./manage.py runserver
./manage.py startup ecard //create new app

Create new model
1. edit models.py
2. ./manage.py makemigrations ecard //turn models to schema
3. ./manage.py migrate

manage.py createsuperuser (vietnh90@gmail.com/admin/admin)

-------------------------------------------------------------------------
Tasks.objects.all().filter(date=date) //return a QuerySet
objects: a manager called on table-level
alt D: put cursor into address bar
--------------------------------------------------------------------------


emo: I was so stupid that i forgot to open Inbound rule ssh so i couldn't login from putty.
-shut the fuck off and write some code. said by Takaaki. I should


met issue:
- error:django.core.exceptions.ImproperlyConfigured: Error loading MySQLdb module: No module named MySQLdb
solution: pip install mysql-python
- it could be a solution:
http://stackoverflow.com/questions/9865621/connecting-to-ec2-django-development-server
$python manage.py runserver 0.0.0.0:8000
- post url to Django must end with a slash /
- disable csrf
- cannot git pull on ec2: open tcp port 443 at outbound


refs:
Server: ec2-54-175-13-221.compute-1.amazonaws.com  /  54.175.13.221
vars(obj) //return tuple of attrs of obj
getattr(obj, attr) //
