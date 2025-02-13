from django.db import models


class SearchQuery(models.Model):
    query_text = models.CharField(max_length=255)
    combined_summary = models.TextField(null=True, blank=True)
    guide_content = models.TextField(null=True, blank=True)
    guide_pdf = models.BinaryField(null=True, blank=True)
    pdf_filename = models.CharField(max_length=255, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True , null= True)

    def __str__(self):
        return f"Search: {self.query_text[:50]}..."


class Transcript(models.Model):
    search_query = models.ForeignKey(
        SearchQuery, on_delete=models.CASCADE, null=True)
    video_id = models.CharField(max_length=100, unique=True)
    video_title = models.CharField(max_length=255)
    video_url = models.URLField()
    transcript_text = models.TextField(blank=True, null=True)
    

    def __str__(self):
        return f"Transcript: {self.video_title}"

