# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('ecard', '0002_auto_20150910_0307'),
    ]

    operations = [
        migrations.AddField(
            model_name='task',
            name='status',
            field=models.IntegerField(default=0),
        ),
    ]