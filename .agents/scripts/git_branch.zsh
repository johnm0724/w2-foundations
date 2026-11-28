#!/usr/bin/env zsh

# Check if inside a git repository
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    branch=$(git branch --show-current)
    
    # Handle detached HEAD state
    if [[ -n "$branch" ]]; then
        echo "Current branch: $branch"
    else
        echo "HEAD is detached at $(git rev-parse --short HEAD)"
    fi
else
    echo "Not inside a Git repository."
fi
