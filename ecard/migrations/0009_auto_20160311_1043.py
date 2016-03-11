# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecard', '0008_auto_20160308_0957'),
    ]

    operations = [
        migrations.AlterField(
            model_name='book',
            name='link',
            field=models.ForeignKey(default=None, blank=True, to='ecard.Link', null=True),
        ),
    ]
