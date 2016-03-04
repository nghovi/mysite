# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecard', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='phrase',
            old_name='syllabus',
            new_name='content',
        ),
        migrations.AlterField(
            model_name='phrase',
            name='word',
            field=models.ForeignKey(related_name='phrases', default=None, blank=True, to='ecard.Word', null=True),
        ),
    ]
