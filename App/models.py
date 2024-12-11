from django.db import models


class SearchQuery(models.Model):
    query_text = models.CharField(max_length=255)
    search_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.query_text


class Transcript(models.Model):
    search_query = models.ForeignKey(
        SearchQuery, on_delete=models.CASCADE, related_name='transcripts', null=True)
    video_id = models.CharField(max_length=100, unique=True)
    video_title = models.CharField(max_length=255)
    video_url = models.URLField()
    transcript_text = models.TextField(blank=True, null=True)

    def __str__(self):
        return self.video_title
