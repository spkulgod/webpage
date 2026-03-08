#!/usr/bin/env bash
# Convert quadcopter videos (MP4 or WMV) to looping GIFs for reliable in-browser playback.
# Requires: ffmpeg (install with: sudo apt install ffmpeg)
set -e
cd "$(dirname "$0")/.."
ASSETS="assets"
FPS=10
WIDTH=480

for i in 1 2 3; do
  if [[ -f "$ASSETS/quadcopter_video${i}.mp4" ]]; then
    in="$ASSETS/quadcopter_video${i}.mp4"
  elif [[ -f "$ASSETS/quadcopter_video${i}.wmv" ]]; then
    in="$ASSETS/quadcopter_video${i}.wmv"
  else
    echo "Skip: no quadcopter_video${i}.mp4 or .wmv in $ASSETS"
    continue
  fi
  out="$ASSETS/quadcopter_video${i}.gif"
  palette="/tmp/quadcopter_palette_${i}.png"
  echo "Converting $in -> $out"
  ffmpeg -y -i "$in" -vf "fps=${FPS},scale=${WIDTH}:-1:flags=lanczos,palettegen" "$palette"
  ffmpeg -y -i "$in" -i "$palette" -lavfi "fps=${FPS},scale=${WIDTH}:-1:flags=lanczos[x];[x][1:v]paletteuse" -loop 0 "$out"
  rm -f "$palette"
done
echo "Done. Quadcopter GIFs are in $ASSETS/."
