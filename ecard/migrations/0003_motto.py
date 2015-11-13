# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecard', '0002_auto_20151111_1320'),
    ]

    operations = [
        migrations.CreateModel(
            name='Motto',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('message', models.CharField(max_length=200)),
                ('mottotype', models.IntegerField(default=0)),
            ],
        ),
    ]
