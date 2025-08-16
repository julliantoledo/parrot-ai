#!/bin/bash
# process_to_mono.sh - Convert audio to mono 22.05kHz WAV

OUTDIR="$1"
shift

LOG="$OUTDIR/_processor.log"
mkdir -p "$OUTDIR"

{
  echo "----- $(date) -----"
  for f in "$@"; do
    [[ -f "$f" ]] || { echo "Skipping missing file: $f"; continue; }
    case "${f,,}" in
      *.wav|*.mp3|*.aif|*.aiff|*.m4a)
        base=$(basename "${f%.*}")
        echo "Processing: $f -> ${base}_mono.wav"
        /opt/homebrew/bin/ffmpeg -hide_banner -y -i "$f" -ac 1 -ar 22050 "$OUTDIR/${base}_mono.wav" \
          && rm "$f" \
          && echo "OK: ${base}_mono.wav" \
          || echo "ERROR: $f"
        ;;
      *) echo "Skipping unsupported file: $f" ;;
    esac
  done
  echo
} >> "$LOG" 2>&1
