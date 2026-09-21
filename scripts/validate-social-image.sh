#!/bin/sh
set -eu

if [ "$#" -eq 0 ]; then
  echo "Usage: validate-social-image.sh <image> [<image> ...]" >&2
  exit 2
fi

for image_path in "$@"; do
  if [ ! -f "$image_path" ]; then
    echo "ERROR missing file: $image_path" >&2
    continue
  fi

  image_width=$(sips -g pixelWidth "$image_path" 2>/dev/null | awk '/pixelWidth/ {print $2}')
  image_height=$(sips -g pixelHeight "$image_path" 2>/dev/null | awk '/pixelHeight/ {print $2}')
  image_format=$(sips -g format "$image_path" 2>/dev/null | awk '/format:/ {print $2}')
  image_bytes=$(stat -f %z "$image_path")
  image_ratio=$(awk -v width="$image_width" -v height="$image_height" 'BEGIN { printf "%.4f", width / height }')
  ratio_status=$(awk -v ratio="$image_ratio" 'BEGIN { expected = 0.75; delta = ratio - expected; if (delta < 0) delta = -delta; if (delta <= 0.002) print "PASS"; else print "CHECK" }')

  if [ "$image_bytes" -le 5242880 ]; then
    size_status="PASS"
  else
    size_status="CHECK"
  fi

  printf '%s\n' "FILE: $image_path"
  printf '  format: %s\n' "$image_format"
  printf '  dimensions: %sx%s\n' "$image_width" "$image_height"
  printf '  aspect_ratio: %s\n' "$image_ratio"
  printf '  portrait_3x4: %s\n' "$ratio_status"
  printf '  bytes: %s\n' "$image_bytes"
  printf '  x_5mb_limit: %s\n' "$size_status"
done
