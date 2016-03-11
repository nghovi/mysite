# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecard', '0011_auto_20160311_1058'),
    ]

    operations = [
        migrations.AlterField(
            model_name='book',
            name='comment',
            field=models.CharField(default=b'', max_length=500, blank=True),
        ),
    ]
