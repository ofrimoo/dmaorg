#!/bin/bash

mkdir -p files-directory

files=$(find . -type f -name '2_1_2.gif')

counter=1
for file in $files; do
    cp "$file" "files-directory/$counter.gif"
    ((counter++))
done

