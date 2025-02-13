import pdfkit
import os
from django.conf import settings
from bs4 import BeautifulSoup
import re
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

    def process_content(self, guide_content):
        """Process and structure the guide content"""
        # Clean HTML tags if present
        if isinstance(guide_content, str) and '<p class="guide text-color">' in guide_content:
            soup = BeautifulSoup(guide_content, 'html.parser')
            guide_content = soup.get_text()

        # Split content into lines and clean them
        lines = [line.strip() for line in guide_content.split('\n') if line.strip()]
        processed_content = []
        
        # Process first line as main title
        if lines:
            main_title = lines[0].strip()
            processed_content.append(f'<h1 class="main-title">{main_title}</h1>')
            lines = lines[1:]

        current_section = []
        
        for line in lines:
            # Check if line starts with a number followed by period
            if re.match(r'^\d+\.', line):
                # If we have content from previous section, add it first
                if current_section:
                    processed_content.append(f'<p class="section-content">{" ".join(current_section)}</p>')
                    current_section = []
                
                # Clean the line and make it a heading
                cleaned_heading = line.strip()
                processed_content.append(f'<h2 class="section-heading">{cleaned_heading}</h2>')
            else:
                # Add to current section content
                current_section.append(line)

        # Add any remaining content
        if current_section:
            processed_content.append(f'<p class="section-content">{" ".join(current_section)}</p>')

        return '\n'.join(processed_content)

    def create_styled_html(self, guide_content):
        """Create styled HTML content for PDF generation"""
        processed_content = self.process_content(guide_content)

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
                    padding: 20px;
                }}
                .main-title {{
                    font-size: 24px;
                    font-weight: bold;
                    text-align: center;
                    margin-bottom: 30px;
                }}
                .section-heading {{
                    font-size: 16px;
                    font-weight: bold;
                    margin-top: 20px;
                    margin-bottom: 10px;
                }}
                .section-content {{
                    margin-bottom: 15px;
                    text-align: justify;
                    font-size: 14px;
                }}
            </style>
        </head>
        <body>
            {processed_content}
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
                'pdf_content': pdf_content,
                'pdf_filename': pdf_filename,
                'pdf_path': pdf_path
            }

        except Exception as e:
            print(f"Error generating PDF: {str(e)}")
            return {
                'success': False,
                'error': str(e)
            }