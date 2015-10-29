# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Book',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('iconUrl', models.CharField(max_length=200)),
                ('author', models.CharField(max_length=200)),
                ('name', models.CharField(max_length=200)),
                ('vocabulary', models.CharField(max_length=1000)),
                ('comment', models.CharField(default=b'', max_length=500)),
                ('mood', models.CharField(max_length=1000)),
            ],
        ),
        migrations.CreateModel(
            name='Link',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('url', models.CharField(max_length=200)),
                ('description', models.CharField(max_length=300)),
                ('status', models.IntegerField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Task',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
                ('description', models.CharField(max_length=200)),
                ('priority', models.IntegerField(default=0)),
                ('status', models.IntegerField(default=0)),
                ('date', models.DateTimeField(verbose_name=b'date updated')),
                ('lastupdated', models.DateTimeField(verbose_name=b'date updated')),
            ],
        ),
        migrations.CreateModel(
            name='UserPreference',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('user_id', models.IntegerField(verbose_name=b'user id')),
                ('primary_card', models.ForeignKey(to='ecard.Link')),
            ],
        ),
        migrations.AddField(
            model_name='book',
            name='booklink',
            field=models.ForeignKey(to='ecard.Link'),
        ),
    ]
