# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecard', '0009_auto_20160311_1043'),
    ]

    operations = [
        migrations.AlterField(
            model_name='book',
            name='iconurl',
            field=models.CharField(default=b'', max_length=200, blank=True),
        ),
        migrations.AlterField(
            model_name='book',
            name='name',
            field=models.CharField(default=b'Unknown', max_length=200, blank=True),
        ),
    ]
