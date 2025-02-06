import os
import uuid
import re
import time
from pathlib import Path
import pyttsx3
from django.conf import settings
from django.core.files.storage import default_storage

class TTSManager:
    def __init__(self):
        self.engine = pyttsx3.init()
        self.engine.setProperty('rate', 150)
        self.engine.setProperty('volume', 0.9)
        
        self.audio_dir = Path(settings.MEDIA_ROOT) / 'audio_guides'
        self.audio_dir.mkdir(parents=True, exist_ok=True)
        
        self.cleanup_old_files()
    
    def cleanup_old_files(self, max_age_hours=24):
        """Remove audio files older than specified hours"""
        current_time = time.time()
        for audio_file in self.audio_dir.glob('*.mp3'):
            if (current_time - audio_file.stat().st_mtime) > (max_age_hours * 3600):
                audio_file.unlink()

    def clean_text_for_tts(self, text: str) -> str:
        """Clean text specifically for TTS reading"""
        # Remove HTML tags
        text = re.sub(r'<[^>]+>', '', text)
        # Remove inline CSS
        text = re.sub(r'(font-family|font-size|line-height|text-align):[^;]+;?', '', text)
        # Replace multiple whitespaces
        text = re.sub(r'\s+', ' ', text)
        # Remove HTML entities
        text = text.replace('&nbsp;', ' ')
        return text.strip()

    def generate_audio(self, text: str, search_query_id: int) -> str:
        """Generate audio file from text"""
        # Use search_query_id in filename to make it unique
        filename = f"guide_{search_query_id}_{uuid.uuid4().hex[:8]}.mp3"
        file_path = self.audio_dir / filename
        
        # Clean the text before TTS
        clean_text = self.clean_text_for_tts(text)
        
        # Generate audio
        self.engine.save_to_file(clean_text, str(file_path))
        self.engine.runAndWait()
        
        # Return relative path for URL
        return f'/media/audio_guides/{filename}'

def generate_guide_audio(guide_content: str, search_query_id: int) -> str:
    tts_manager = TTSManager()
    audio_url = tts_manager.generate_audio(guide_content, search_query_id)
    return audio_url