#!/bin/bash

# Get the current branch name
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Set the commit message with the date format
COMMIT_MESSAGE=$(date +%d/%m/%Y)

# Add all changes to the Git staging area
git add -A

# Commit changes with the commit message
git commit -m "$COMMIT_MESSAGE"

# Push changes to the remote repository's current branch
git push origin "$CURRENT_BRANCH"
