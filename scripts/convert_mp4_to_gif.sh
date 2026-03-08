#!/usr/bin/env bash
# Convert project MP4 videos to looping GIFs for reliable in-browser playback.
# Converts: assets/bachelor_thesis.mp4, and downloads + converts BCQ Results.mp4 from GitHub.
# Requires: ffmpeg, curl (or wget)
set -e
cd "$(dirname "$0")/.."
ASSETS="assets"
FPS=10
WIDTH=480

convert_one() {
  local in="$1"
  local out="$2"
  [[ ! -f "$in" ]] && { echo "Skip: $in not found"; return 0; }
  local palette="/tmp/palette_$$.png"
  echo "Converting $in -> $out"
  ffmpeg -y -i "$in" -vf "fps=${FPS},scale=${WIDTH}:-1:flags=lanczos,palettegen" "$palette"
  ffmpeg -y -i "$in" -i "$palette" -lavfi "fps=${FPS},scale=${WIDTH}:-1:flags=lanczos[x];[x][1:v]paletteuse" -loop 0 "$out"
  rm -f "$palette"
}

# Bachelor's thesis (local)
convert_one "$ASSETS/bachelor_thesis.mp4" "$ASSETS/bachelor_thesis.gif"

# BCQ: download from GitHub if not present, then convert
BCQ_MP4="$ASSETS/bcq_results.mp4"
BCQ_URL="https://raw.githubusercontent.com/spkulgod/BCQ_extension/master/Results.mp4"
if [[ ! -f "$BCQ_MP4" ]]; then
  echo "Downloading BCQ video from GitHub..."
  curl -sL -o "$BCQ_MP4" "$BCQ_URL" || { echo "Download failed; skip BCQ."; exit 0; }
fi
convert_one "$BCQ_MP4" "$ASSETS/bcq_results.gif"

echo "Done. GIFs are in $ASSETS/."
