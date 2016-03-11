# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecard', '0012_auto_20160311_1121'),
    ]

    operations = [
        migrations.AlterField(
            model_name='link',
            name='url',
            field=models.CharField(default=b'', max_length=200, blank=True),
        ),
    ]
