# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('ecard', '0007_auto_20160307_1023'),
    ]

    operations = [
        migrations.CreateModel(
            name='Note',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('content', models.CharField(max_length=2000)),
                ('notetype', models.IntegerField(default=0)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('modified', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.RemoveField(
            model_name='task',
            name='lastupdated',
        ),
        migrations.AddField(
            model_name='book',
            name='created',
            field=models.DateTimeField(default=datetime.datetime(2016, 3, 8, 9, 55, 55, 615000), auto_now_add=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='book',
            name='modified',
            field=models.DateTimeField(default=datetime.datetime(2016, 3, 8, 9, 56, 7, 41000), auto_now=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='link',
            name='created',
            field=models.DateTimeField(default=datetime.datetime(2016, 3, 8, 9, 56, 17, 63000), auto_now_add=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='link',
            name='modified',
            field=models.DateTimeField(default=datetime.datetime(2016, 3, 8, 9, 56, 33, 475000), auto_now=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='motto',
            name='created',
            field=models.DateTimeField(default=datetime.datetime(2016, 3, 8, 9, 56, 40, 370000), auto_now_add=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='motto',
            name='modified',
            field=models.DateTimeField(default=datetime.datetime(2016, 3, 8, 9, 56, 46, 720000), auto_now=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='phrase',
            name='created',
            field=models.DateTimeField(default=datetime.datetime(2016, 3, 8, 9, 56, 51, 865000), auto_now_add=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='phrase',
            name='modified',
            field=models.DateTimeField(default=datetime.datetime(2016, 3, 8, 9, 57, 1, 349000), auto_now=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='task',
            name='created',
            field=models.DateTimeField(default=datetime.datetime(2016, 3, 8, 9, 57, 5, 742000), auto_now_add=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='task',
            name='modified',
            field=models.DateTimeField(default=datetime.datetime(2016, 3, 8, 9, 57, 11, 633000), auto_now=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='word',
            name='created',
            field=models.DateTimeField(default=datetime.datetime(2016, 3, 8, 9, 57, 21, 905000), auto_now_add=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='word',
            name='modified',
            field=models.DateTimeField(default=datetime.datetime(2016, 3, 8, 9, 57, 27, 54000), auto_now=True),
            preserve_default=False,
        ),
    ]
