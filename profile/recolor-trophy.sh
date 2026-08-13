#!/usr/bin/env bash
#
# Re-frame github-profile-trophy output to sit on the al-folio site's card
# surface. Only the CARD FRAME is touched — the border and (dark) cell
# background. The trophy keeps its full native rank colour palette.
#
#   Light: keep white cells; border -> site divider (#e6e6e6)
#   Dark:  cells -> site card colour (#212529); border -> site divider (#424246)
#
# Usage: recolor-trophy.sh <light|dark> <file.svg>
set -euo pipefail

mode="${1:?usage: recolor-trophy.sh <light|dark> <file>}"
file="${2:?usage: recolor-trophy.sh <light|dark> <file>}"
[ -f "$file" ] || { echo "recolor-trophy: $file not found, skipping"; exit 0; }

if [ "$mode" = light ]; then
  # Light cells are already white (matches --global-card-bg-color); only the
  # border needs nudging to the site divider colour.
  sed -i \
    -e 's/stroke="#e1e4e8"/stroke="#e6e6e6"/g' \
    "$file"
elif [ "$mode" = dark ]; then
  # Cell background #333 -> site card colour; light border -> site divider.
  sed -i \
    -e 's/fill="#333"/fill="#212529"/g' \
    -e 's/stroke="#e1e4e8"/stroke="#424246"/g' \
    "$file"
else
  echo "recolor-trophy: unknown mode '$mode' (expected light|dark)" >&2
  exit 1
fi
