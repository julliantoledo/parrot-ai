# Parrot-AI

Parrot-AI is an experimental project exploring smooth, natural interaction with AI voices.  
This repo sets up a lightweight pipeline to preprocess training audio and connect with [Tortoise-TTS](https://github.com/neonbjb/tortoise-tts).

---

## 🚀 Quickstart

### 1. Clone with submodules
```bash
git clone --recurse-submodules git@github.com:julliantoledo/parrot-ai.git
cd parrot-ai
```

If you forgot `--recurse-submodules`, run:
```bash
git submodule update --init --recursive
```

---

### 2. Install dependencies
Make sure you have **Python 3.10+** and `ffmpeg` installed.

On macOS:
```bash
brew install ffmpeg
```

Then install Python deps:
```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r tortoise-tts/requirements.txt
```

---

### 3. Prepare audio
- Place clean `.mp3` files into `einstein_clean/`.  
  (Each file should ideally be a single, clear voice clip.)  

Run the preprocessing script to convert them:
```bash
tools/process_to_mono.sh einstein_clean/*.mp3
```

This will:
- Normalize audio
- Convert to mono WAV format
- Store results in `processed/`

---

### 4. Using Automator (macOS only)
Inside `ops/mac/Processor.workflow` you’ll find an **Automator Quick Action** for drag-and-drop processing.  
This is optional, but makes file conversion simple on macOS.

---

### 5. Training / Generation
The repo links to [Tortoise-TTS](https://github.com/neonbjb/tortoise-tts) as a submodule.  
Once audio is processed, you can follow Tortoise’s README to start experimenting with cloning voices and generating speech.

---

## 📂 Repo Structure
```
parrot-ai/
│
├── einstein_clean/         # drop raw mp3 files here
├── processed/              # normalized mono wav files
├── tools/                  # helper scripts
│   └── process_to_mono.sh  # ffmpeg batch processor
├── ops/mac/                # macOS Automator workflows
├── tortoise-tts/           # submodule: Tortoise-TTS
└── .gitignore
```

---

## ✨ Notes
- `.gitignore` is set to exclude bulky artifacts, caches, and local venvs.  
- Submodule keeps Tortoise pinned to a working commit for reproducibility.  
- Contributions are welcome, but this is still in early experimental stages.  

---

💡 *Goal:* Build a smooth pipeline where GPT output flows into Einstein-like voice synthesis with minimal friction.  
