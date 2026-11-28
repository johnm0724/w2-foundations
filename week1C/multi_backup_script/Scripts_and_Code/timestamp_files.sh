#!/usr/bin/env bash

# Ensure at least one folder or pattern was passed
if [ $# -eq 0 ]; then
    echo "Usage: $0 <folder_or_pattern...>"
    exit 1
fi

# Generate current timestamp (e.g., 2026-11-26_20-21-00)
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# Loop through all passed arguments (supports wildcards like folder*)
for item in "$@"; do
    # Strip trailing slash if present (e.g., "folder1/" -> "folder1")
    clean_item="${item%/}"

    if [ -d "$clean_item" ]; then
        new_name="${clean_item}_${timestamp}"
        mv -v -- "$clean_item" "$new_name"
    else
        echo "Skipping '$item': not a directory."
    fi
done
