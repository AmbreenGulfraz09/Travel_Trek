import pdfkit
import os
from django.conf import settings
from bs4 import BeautifulSoup
from io import BytesIO

class PDFGenerator:
    def __init__(self):
        # Configure wkhtmltopdf path based on operating system
        if os.name == 'nt':  # Windows
            self.wkhtmltopdf_path = settings.WKHTMLTOPDF_PATH
        else:
            print("Path not found for wkhtmltopdf.")
            
        # Configure pdfkit options
        self.options = {
            'page-size': 'A4',
            'margin-top': '0.75in',
            'margin-right': '0.75in',
            'margin-bottom': '0.75in',
            'margin-left': '0.75in',
            'encoding': 'UTF-8',
            'custom-header': [
                ('Accept-Encoding', 'gzip')
            ],
            'no-outline': None,
            'enable-local-file-access': None
        }
        
        # Configure pdfkit configuration
        self.config = pdfkit.configuration(wkhtmltopdf=self.wkhtmltopdf_path)

    def create_styled_html(self, guide_content):
        """Create styled HTML content for PDF generation"""
        # Clean the guide content if it contains HTML tags
        if isinstance(guide_content, str) and '<p class="guide text-color">' in guide_content:
            soup = BeautifulSoup(guide_content, 'html.parser')
            guide_content = soup.get_text()

        # Create HTML template with styles
        html_content = f"""
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <style>
                body {{
                    font-family: Arial, sans-serif;
                    line-height: 1.6;
                    color: #333;
                    text-align: justify;
                }}
                h1 {{
                    color: #2c3e50;
                    font-size: 24px;
                    margin-bottom: 20px;
                }}
                h2 {{
                    color: #34495e;
                    font-size: 20px;
                    margin-top: 20px;
                    margin-bottom: 15px;
                }}
                p {{
                    margin-bottom: 15px;
                    text-align: justify;
                }}
            </style>
        </head>
        <body>
            {guide_content}
        </body>
        </html>
        """
        return html_content

    def generate_pdf(self, guide_content, search_query_id):
        """Generate PDF from guide content"""
        try:
            # Verify wkhtmltopdf path exists
            if not os.path.exists(self.wkhtmltopdf_path):
                raise Exception(f"wkhtmltopdf not found at {self.wkhtmltopdf_path}")

            # Create styled HTML
            html_content = self.create_styled_html(guide_content)

            # Create media/guides directory if it doesn't exist
            pdf_dir = os.path.join(settings.MEDIA_ROOT, 'pdf_guides')
            os.makedirs(pdf_dir, exist_ok=True)

            # Generate PDF file path
            pdf_filename = f'travel_guide_{search_query_id}.pdf'
            pdf_path = os.path.join(pdf_dir, pdf_filename)

            # Generate PDF directly to bytes using BytesIO
            pdf_content = pdfkit.from_string(
                html_content,
                False,  # False means return bytes instead of writing to file
                options=self.options,
                configuration=self.config
            )

            # Also save a copy to the file system
            with open(pdf_path, 'wb') as f:
                f.write(pdf_content)

            return {
                'success': True,
                'pdf_content': pdf_content,  # This is already in bytes
                'pdf_filename': pdf_filename,
                'pdf_path': pdf_path
            }

        except Exception as e:
            print(f"Error generating PDF: {str(e)}")
            return {
                'success': False,
                'error': str(e)
            }