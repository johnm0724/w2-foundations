#!/bin/bash

for item in *; do
  # Remove all occurrences of _YYYY-MM-DD_HH-MM-SS from the name
  new_name=$(echo "$item" | sed -E 's/(_[0-9]{4}-[0-9]{2}-[0-9]{2}_[0-9]{2}-[0-9]{2}-[0-9]{2})+//g')

  # Only rename if the name actually changed
  if [ "$item" != "$new_name" ]; then
    if [ -e "$new_name" ]; then
      echo "Skipping '$item' -> '$new_name' already exists."
    else
      mv "$item" "$new_name"
      echo "Renamed: '$item' -> '$new_name'"
    fi
  fi
done
