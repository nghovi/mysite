# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('ecard', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Task',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
                ('description', models.CharField(max_length=200)),
                ('priority', models.IntegerField(default=0)),
                ('date', models.DateTimeField(verbose_name=b'date created and done')),
            ],
        ),
        migrations.AddField(
            model_name='book',
            name='comment',
            field=models.CharField(default=b'', max_length=500),
        ),
    ]
