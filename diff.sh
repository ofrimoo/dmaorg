#!/bin/bash

# Get a list of all files in the current directory
files=$(find . -maxdepth 1 -type f)

# Iterate through the files and compare each one with the others
for file1 in $files; do
    for file2 in $files; do
        if [ "$file1" != "$file2" ]; then
            if ! diff -q "$file1" "$file2" >/dev/null; then
                echo "Files $file1 and $file2 are different."
            fi
        fi
    done
done

