#!/usr/bin/env bash
# Convert quadcopter WMV videos to MP4 so they play in browsers.
# Requires: ffmpeg (install with: sudo apt install ffmpeg)
set -e
cd "$(dirname "$0")/.."
ASSETS="assets"
for i in 1 2 3; do
  in="$ASSETS/quadcopter_video${i}.wmv"
  out="$ASSETS/quadcopter_video${i}.mp4"
  if [[ -f "$in" ]]; then
    echo "Converting $in -> $out"
    ffmpeg -y -i "$in" -c:v libx264 -c:a aac -movflags +faststart "$out"
  else
    echo "Skip: $in not found"
  fi
done
echo "Done. Refresh the page to see the quadcopter videos."
