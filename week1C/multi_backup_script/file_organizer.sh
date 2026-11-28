#!/bin/bash

# Use the directory passed as an argument, or default to the current directory (.)
TARGET_DIR="${1:-.}"

# Verify the target directory exists
if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: Directory '$TARGET_DIR' does not exist." >&2
  exit 1
fi

# Get the name of this script so it doesn't accidentally move itself
SCRIPT_NAME=$(basename "$0")

# Loop through items in the target directory
for item in "$TARGET_DIR"/*; do
  # Skip if it's not a regular file (ignores existing folders)
  [ -f "$item" ] || continue

  filename=$(basename "$item")

  # Skip hidden files and the organizer script itself
  if [[ "$filename" == .* || "$filename" == "$SCRIPT_NAME" ]]; then
    continue
  fi

  # Extract the lowercase file extension
  ext="${filename##*.}"
  ext="${ext,,}"

  # Assign category folder based on extension
  if [[ "$filename" != *.* ]]; then
    category="Others"
  else
    case "$ext" in
      jpg|jpeg|png|gif|svg|webp)
        category="Images"
        ;;
      pdf|doc|docx|txt|md|csv|xlsx|pptx)
        category="Documents"
        ;;
      zip|tar|gz|rar|7z)
        category="Archives"
        ;;
      sh|py|js|html|css|json|c|cpp)
        category="Scripts_and_Code"
        ;;
      mp3|wav|flac|aac)
        category="Audio"
        ;;
      mp4|mkv|mov|avi)
        category="Videos"
        ;;
      *)
        category="Others"
        ;;
    esac
  fi

  # Create the destination folder if it doesn't exist and move the file
  mkdir -p "$TARGET_DIR/$category"
  mv "$item" "$TARGET_DIR/$category/"
  echo "Moved: $filename -> $category/"
done

echo "Organization complete."
