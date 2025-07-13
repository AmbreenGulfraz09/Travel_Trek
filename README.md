# 🌍 The Travel Trek – AI-Based Travel Guide Generator

**The Travel Trek** is a full-stack AI-powered web application that transforms YouTube travel videos into structured, queryable travel guides. It uses Gemini 1.5 Flash to analyze transcribed video content and generate comprehensive travel information — all presented in a clean, interactive interface.

Whether you're planning your next trip or just exploring places virtually, Travel Trek helps you do it smarter and faster.

---

## 🚀 Key Features

- 🔎 **Search by Destination**: Enter a travel location and get the most relevant YouTube travel videos automatically.
- 📹 **Video Transcription**: Extracts full transcript from travel videos.
- ✂️ **Summary Generation**: Filters out unnecessary details and captures core travel insights.
- 📘 **Guide Generation**: Produces a structured, day-wise travel guide based on video content.
- 💬 **Query into the Guide**: Ask questions like "Best food spots in Murree?" or "How many days for Skardu?" and get contextual answers.
- 🔊 **Listen to the Guide**: Converts generated guides into audio format for hands-free listening.
- 📄 **Downloadable PDF**: Export the guide to a PDF file for offline use.
- 📊 **Admin Panel**: Monitors search queries, stores video data, and manages generated guides.

---

## 🧱 Tech Stack

| Layer         | Technology Used                          |
|---------------|------------------------------------------|
| **Frontend**  | HTML, CSS, JavaScript, Bootstrap         |
| **Backend**   | Django (Python)                          |
| **AI/NLP**    | Gemini 1.5 Flash (via LangChain)         |
| **Transcription** | LangChain, Whisper or similar tool               |
| **Database**  | MySQL                                    |
| **Other Tools** | YouTube API, gTTS (Text to Speech), PDFKit |

---

## 📂 Project Structure
travel-trek/
├── App/ # Django project files and NLP logic
├── static/ # HTML templates, static files
├── media/audio_guides # Audio files for listening to guides
├── media/pdf_guides/ # Generated PDF travel guides
├── vector_store/faiss_index # vector store files
└── README.md

💻 How to Clone and Run Locally

Follow these steps to run the project on your local machine:

### 🔁 Step 1: Clone the Repository

```bash
git clone https://github.com/AmbreenGulfraz09/travel-trek.git
cd the-travel-trek
```
🐍 Step 2: Set Up Virtual Environment
```bash
python -m venv venv
source venv/bin/activate      # On macOS/Linux
venv\Scripts\activate         # On Windows
```
Step 3: Install Dependencies
```bash
pip install -r requirements.txt
```
