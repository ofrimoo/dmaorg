#!/bin/bash

# find path

files=$(find . -type f -name "clancy.html")

# remove scripts

for file in $files; do 
  sed -i '/web/,/14/d' "$file"

done
