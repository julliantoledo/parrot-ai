# Parrot‑AI

Tools to collect, clean, and prep voice data for cloning.

## What this does
- **Drop‑folder automation (macOS):** Drag any audio into a voice folder and get a mono **22.05 kHz WAV** in `/processed` automatically.
- **Batch conversion:** Reusable shell script to convert arbitrary inputs (mp3/wav/aif/m4a) to Tortoise/Bark‑friendly mono WAV.
- **Sample collection:** Simple CLI to fetch audio via `yt-dlp` and pipe it into the same processing flow.

> ⚠️ Only collect and use audio you have the right to use. Respect local laws and platform terms.

## Quick start

### 1) Dependencies
- `ffmpeg` (Homebrew: `brew install ffmpeg`)
- Python 3.10+ (for tools)
- `yt-dlp` (`pip install yt-dlp`)

### 2) Automator Folder Action (macOS)
Exported workflow lives at **ops/mac/Processor.workflow**.  
Double‑click to attach it to your target folder (e.g. `voices/einstein_clean`).  
It will:
- convert drops to **mono @ 22.05 kHz**, 
- write to `processed/`,
- delete originals,
- log to `processed/_processor.log`.

### 3) Reusable scripts
- `tools/process_to_mono.sh` — batch convert arbitrary files:
  ```bash
  tools/process_to_mono.sh voices/einstein_clean/processed voices/einstein_clean/raw/*.wav
