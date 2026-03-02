#!/bin/bash
YAML_FILE="_data/paintings.yml"

count=$(grep -c '^- ' "$YAML_FILE")
echo "Number of entries: $count"
