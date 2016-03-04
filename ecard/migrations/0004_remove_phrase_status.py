# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecard', '0003_phrase_status'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='phrase',
            name='status',
        ),
    ]
