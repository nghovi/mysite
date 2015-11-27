# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecard', '0004_auto_20151116_1053'),
    ]

    operations = [
        migrations.AddField(
            model_name='book',
            name='isDeleted',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='book',
            name='isRemoteSave',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='task',
            name='isDeleted',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='task',
            name='isRemoteSave',
            field=models.BooleanField(default=False),
        ),
    ]
