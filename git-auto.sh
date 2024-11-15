#!/bin/bash

# Check if the current directory is a Git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Error: This is not a Git repository."
    exit 1
fi

# Prompt the user for a commit message
echo "Enter commit message:"
read commit_message

# Run Git commands with error checking
git add . || { echo "Failed to add files"; exit 1; }
git commit -m "$commit_message" || { echo "Commit failed"; exit 1; }
git push || { echo "Push failed"; exit 1; }

