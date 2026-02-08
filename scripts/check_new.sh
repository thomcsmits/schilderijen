#!/bin/bash

YAML_FILE="_data/paintings.yml"
IMG_DIR="assets/img/paintings"

for img in "$IMG_DIR"/*.{png,jpg,jpeg,webp}; do
  [ -e "$img" ] || continue

  filename=$(basename "$img")
  title="${filename%.*}"
  title="${title//_/ }"

  # only append if not already in YAML
  if ! grep -Eq "^\s*image:\s*\"?$filename\"?\s*(#.*)?$" "$YAML_FILE"; then
    cat >> "$YAML_FILE" <<EOF

- title: "$title"
  year: "jaar onbekend"
  image: "$filename"
  size: "onbekend"
  signed: false
  category: "TBD"
  location: "B"
  album: false
EOF
    echo "Added: $filename"
  fi
done
