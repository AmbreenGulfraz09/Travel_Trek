from django.db import models


class Transcript(models.Model):
    video_id = models.CharField(max_length=100, unique=True)
    video_title = models.CharField(max_length=255)
    video_url = models.URLField()
    transcript_text = models.TextField(blank=True, null=True)

    def __str__(self):
        return self.video_title
