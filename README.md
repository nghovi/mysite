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