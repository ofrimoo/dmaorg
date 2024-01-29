#!/bin/bash

mkdir -p files-directory

files=$(find . -type f -name '_ti_su_p.png')

counter=1
for file in $files; do
    cp "$file" "files-directory/$counter.png"
    ((counter++))
done

