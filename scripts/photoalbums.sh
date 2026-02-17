#!/bin/bash

YAML_FILE="_data/paintings2.yml"

# List of album folders and corresponding album numbers
ALBUM_DIRS=("assets/albums/FotoAlbum-1" "assets/albums/FotoAlbum-2" "assets/albums/FotoAlbum-3")
ALBUM_NUMS=(1 2 3)

# Loop over each album folder
for i in "${!ALBUM_DIRS[@]}"; do
  IMG_DIR="${ALBUM_DIRS[$i]}"
  ALBUM_NUM="${ALBUM_NUMS[$i]}"

  # Loop over image files in the album folder
  for img in "$IMG_DIR"/*.{png,jpg,jpeg,webp}; do
    [ -e "$img" ] || continue

    filename=$(basename "$img")
    title="${filename%.*}"
    title="${title//_/ }"

    # Only append if not already in YAML
    if ! grep -Eq "^\s*image:\s*\"?$filename\"?\s*(#.*)?$" "$YAML_FILE"; then
      cat >> "$YAML_FILE" <<EOF

- title: "$title"
  year: "jaar onbekend"
  image: "$filename"
  size: "onbekend"
  signed: false
  category: "TBD"
  location: "B"
  album: $ALBUM_NUM
EOF
      echo "Added: $filename to album $ALBUM_NUM"
    fi
  done
done


# #!/bin/bash

# YAML_FILE="paintings2.yml"

# ALBUM_DIRS=("assets/FotoAlbum-1" "assets/FotoAlbum-2" "assets/FotoAlbum-3")
# ALBUM_NUMS=(1 2 3)

# for i in "${!ALBUM_DIRS[@]}"; do
#   DIR="${ALBUM_DIRS[$i]}"
#   ALBUM_NUM="${ALBUM_NUMS[$i]}"

#   for img in "$DIR"/*; do
#     [ -f "$img" ] || continue

#     ext="${img##*.}"
#     case "$ext" in
#       png|jpg|jpeg|webp) ;;
#       *) continue ;;
#     esac

#     filename=$(basename "$img")
#     title="${filename%.*}"
#     title="${title//_/ }"

#     if ! grep -Eq "^\s*image:\s*\"?$filename\"?\s*$" "$YAML_FILE"; then
#       cat >> "$YAML_FILE" <<EOF

# - title: "$title"
#   year: "jaar onbekend"
#   image: "$filename"
#   size: "onbekend"
#   signed: false
#   category: "TBD"
#   location: "B"
#   album: $ALBUM_NUM
# EOF
#       echo "Added: $filename to album $ALBUM_NUM"
#     fi
#   done
# done



# # YAML_FILE="paintings2.yml"

# # ALBUM_DIRS=("assets/FotoAlbum-1" "assets/FotoAlbum-2" "assets/FotoAlbum-3")
# # ALBUM_NUMS=(1 2 3)

# # for img in "$DIR"/*; do
# #   # skip non-files and only process images
# #   [ -f "$img" ] || continue
# #   ext="${img##*.}"
# #   case "$ext" in
# #     png|jpg|jpeg|webp) ;;
# #     *) continue ;;
# #   esac

# #   filename=$(basename "$img")
# #   title="${filename%.*}"
# #   title="${title//_/ }"

# #   if ! grep -Eq "^\s*image:\s*\"?$filename\"?\s*(#.*)?$" "$YAML_FILE"; then
# #     cat >> "$YAML_FILE" <<EOF

# # - title: "$title"
# #   year: "jaar onbekend"
# #   image: "$filename"
# #   size: "onbekend"
# #   signed: false
# #   category: "TBD"
# #   location: "B"
# #   album: $ALBUM_NUM
# # EOF
# #     echo "Added: $filename to album $ALBUM_NUM"
# #   fi
# # done


# # YAML_FILE="paintings2.yml"

# # ALBUM_DIRS=("assets/FotoAlbum-1" "assets/FotoAlbum-2" "assets/FotoAlbum-3")
# # ALBUM_NUMS=(1 2 3)

# # for i in "${!ALBUM_DIRS[@]}"; do
# #   DIR="${ALBUM_DIRS[$i]}"
# #   ALBUM_NUM="${ALBUM_NUMS[$i]}"

# #   for img in "$DIR"/*.{png,jpg,jpeg,webp}; do
# #     [ -e "$img" ] || continue

# #     filename=$(basename "$img")
# #     title="${filename%.*}"
# #     title="${title//_/ }"

# #     if ! grep -Eq "^\s*image:\s*\"?$filename\"?\s*(#.*)?$" "$YAML_FILE"; then
# #       cat >> "$YAML_FILE" <<EOF

# # - title: "$title"
# #   year: "jaar onbekend"
# #   image: "$filename"
# #   size: "onbekend"
# #   signed: false
# #   category: "TBD"
# #   location: "B"
# #   album: $ALBUM_NUM
# # EOF
# #       echo "Added: $filename to album $ALBUM_NUM"
# #     fi
# #   done
# # done