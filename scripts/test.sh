#!/bin/bash

mkdir -p files-directory

echo "insert file name: "
read NAME
NAME="${NAME}"
counter=1

# Use find command to search for files and handle filenames with spaces and parentheses
find . -type f -path "*${NAME}.jpg" | while IFS= read -r file; do
    cp "$file" "files-directory/${counter}.jpg"
    ((counter++))
    cp ~/bin/git/diff.sh ~/bin/git/files-directory
done
