# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecard', '0005_remove_task_isdeleted'),
    ]

    operations = [
        migrations.AlterField(
            model_name='task',
            name='date',
            field=models.DateTimeField(),
        ),
        migrations.AlterField(
            model_name='task',
            name='lastupdated',
            field=models.DateTimeField(),
        ),
    ]
