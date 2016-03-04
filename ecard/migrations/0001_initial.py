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
                ('iconurl', models.CharField(max_length=200)),
                ('author', models.CharField(max_length=200)),
                ('name', models.CharField(max_length=200)),
                ('comment', models.CharField(default=b'', max_length=500)),
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
            name='Motto',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('message', models.CharField(max_length=200)),
                ('mottotype', models.IntegerField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Phrase',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('syllabus', models.CharField(max_length=2000)),
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
                ('isDeleted', models.BooleanField(default=False)),
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
        migrations.CreateModel(
            name='Word',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('syllabus', models.CharField(max_length=200)),
                ('book', models.ForeignKey(related_name='words', default=None, blank=True, to='ecard.Book', null=True)),
            ],
        ),
        migrations.AddField(
            model_name='phrase',
            name='word',
            field=models.ForeignKey(related_name='pharses', default=None, blank=True, to='ecard.Word', null=True),
        ),
        migrations.AddField(
            model_name='book',
            name='link',
            field=models.ForeignKey(to='ecard.Link'),
        ),
    ]
