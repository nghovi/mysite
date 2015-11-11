# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecard', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='book',
            name='vocabulary',
            field=models.CharField(max_length=1000, null=True, blank=True),
        ),
    ]
