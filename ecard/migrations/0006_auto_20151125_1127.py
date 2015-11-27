# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecard', '0005_auto_20151125_1126'),
    ]

    operations = [
        migrations.RenameField(
            model_name='book',
            old_name='isRemoteSave',
            new_name='isRemoteSaved',
        ),
        migrations.RenameField(
            model_name='task',
            old_name='isRemoteSave',
            new_name='isRemoteSaved',
        ),
    ]
