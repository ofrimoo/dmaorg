#!/bin/bash

# find path

files=$(find . -type f -name "clancy.html")

# remove scripts

for file in $files; do 
  sed -i '/<script/,/<\/script>/d' "$file"

done
