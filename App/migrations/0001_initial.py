# Generated by Django 4.2.16 on 2024-12-09 15:23

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Transcript',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('video_id', models.CharField(max_length=100, unique=True)),
                ('video_title', models.CharField(max_length=255)),
                ('video_url', models.URLField()),
                ('transcript_text', models.TextField(blank=True, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
        ),
    ]
