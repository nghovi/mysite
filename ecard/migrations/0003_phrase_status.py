# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecard', '0002_auto_20160303_1621'),
    ]

    operations = [
        migrations.AddField(
            model_name='phrase',
            name='status',
            field=models.CharField(default='', max_length=2000),
            preserve_default=False,
        ),
    ]
