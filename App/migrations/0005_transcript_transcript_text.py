# Generated by Django 4.2.16 on 2024-12-10 17:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('App', '0004_search_remove_transcript_transcript_text_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='transcript',
            name='transcript_text',
            field=models.TextField(blank=True, null=True),
        ),
    ]
