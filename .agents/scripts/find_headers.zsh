#!/usr/bin/env zsh

# Ensure at least a file path and one search word are provided
if [[ $# -lt 2 ]]; then
    echo "Usage: $0 </absolute/path/to/file.md> <word1> [word2 ...]"
    exit 1
fi

file_path="$1"
shift # Remove the first argument so $@ now holds only the search words

# Verify the path is an absolute path (starts with /)
if [[ "$file_path" != /* ]]; then
    echo "Error: Please provide an absolute file path starting with '/'."
    exit 1
fi

# Verify the file exists and is readable
if [[ ! -f "$file_path" || ! -r "$file_path" ]]; then
    echo "Error: File '$file_path' does not exist or is not readable."
    exit 1
fi

# Read the file line by line
while IFS= read -r line || [[ -n "$line" ]]; do
    # Check if the line is a Markdown header (starts with optional spaces and 1-6 '#' followed by a space)
    if [[ "$line" =~ ^[[:space:]]*#{1,6}[[:space:]]+ ]]; then
        match=true
        
        # Check that EVERY search word is present in the header (case-insensitive)
        for word in "$@"; do
            if [[ "${line:l}" != *"${word:l}"* ]]; then
                match=false
                break
            fi
        done

        if [[ "$match" == true ]]; then
            echo "$line"
        fi
    fi
done < "$file_path"
