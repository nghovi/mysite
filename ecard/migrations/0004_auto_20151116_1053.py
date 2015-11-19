# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecard', '0003_motto'),
    ]

    operations = [
        migrations.AlterField(
            model_name='book',
            name='vocabulary',
            field=models.TextField(null=True, blank=True),
        ),
    ]
