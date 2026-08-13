#!/usr/bin/env bash
#
# Recolour github-profile-trophy output to the al-folio site palette so the
# trophy grid matches the stats and pin cards.
#
#   Light: purple accent (#b509ac), white cells, site divider border (#e6e6e6)
#   Dark:  cyan accent   (#2698ba), #212529 cells, site divider border (#424246)
#
# Only the clashing brand colours (blue rank accent, bright green, the rainbow
# "SECRET" gradient) and the card frame are touched; neutral tier metals, the
# title/subtitle text and icon internals are left as the theme rendered them.
#
# Usage: recolor-trophy.sh <light|dark> <file.svg>
set -euo pipefail

mode="${1:?usage: recolor-trophy.sh <light|dark> <file>}"
file="${2:?usage: recolor-trophy.sh <light|dark> <file>}"
[ -f "$file" ] || { echo "recolor-trophy: $file not found, skipping"; exit 0; }

if [ "$mode" = light ]; then
  sed -i \
    -e 's/#0366d6/#b509ac/g' \
    -e 's/#009366/#b509ac/g' \
    -e 's/stroke="#e1e4e8"/stroke="#e6e6e6"/g' \
    -e 's/stop-color="red"/stop-color="#e05fd8"/g' \
    -e 's/stop-color="fuchsia"/stop-color="#b509ac"/g' \
    -e 's/stop-color="blue"/stop-color="#7a0673"/g' \
    -e 's/fill="fuchsia"/fill="#b509ac"/g' \
    "$file"
elif [ "$mode" = dark ]; then
  sed -i \
    -e 's/#00aeff/#2698ba/g' \
    -e 's/#178600/#2698ba/g' \
    -e 's/#2dde98/#2698ba/g' \
    -e 's/#0d1117/#212529/g' \
    -e 's/stroke="#e1e4e8"/stroke="#424246"/g' \
    -e 's/stop-color="#ff5555"/stop-color="#5fd0e0"/g' \
    -e 's/stop-color="#ff79c6"/stop-color="#2698ba"/g' \
    -e 's/stop-color="#388bfd"/stop-color="#1b6f88"/g' \
    -e 's/fill="#ff79c6"/fill="#2698ba"/g' \
    "$file"
else
  echo "recolor-trophy: unknown mode '$mode' (expected light|dark)" >&2
  exit 1
fi
