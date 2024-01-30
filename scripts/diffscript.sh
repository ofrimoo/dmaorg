#!/bin/bash

mkdir -p files-directory

NAME="unnamed (1)"
files=$(find . -type f -name "${NAME}.jpg" -print)

counter=1
for file in $files; do
    cp "$file" "files-directory/$counter.jpg"
    ((counter++))
done

