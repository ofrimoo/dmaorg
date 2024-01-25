#!/bin/bash

# Prompt to enter URL
echo 'Please enter Wayback Machine URL: '
# Create URL variable
read url

# Enter directory name, i.e., date of the dmaorg update
echo 'Enter the date of the dmaorg update: '
# Create variable
read directory_name

# Create directory with that name
mkdir "$directory_name"

# Check to see if it worked
if [ $? -eq 0 ]; then
  echo "Directory '$directory_name' created successfully."

  # Enter directory
  cd "$directory_name"

  # Download the site with wget
  wget -r "$url"

  # Check to see if it worked
  if [ $? -eq 0 ]; then
    echo "Website downloaded successfully."

    # Find the "dmaorg.info" directory within the current directory and its subdirectories
    dmaorg_info_path=$(find . -type d -name "dmaorg.info" -print -quit)

    # Check if the directory was found
    if [ -n "$dmaorg_info_path" ]; then
      # Move the "dmaorg.info" directory to the specified directory
      mv "$dmaorg_info_path" "$directory_name"

      # Check if mv was successful
      if [ $? -eq 0 ]; then
        echo "Moved 'dmaorg.info' directory to '$directory_name'."
      else
        echo "Failed to move 'dmaorg.info' directory."
      fi
    else
      echo "Error: 'dmaorg.info' directory not found within the downloaded content."
    fi
  else
    echo "Failed to download website."
  fi
else
  echo "Failed to create directory '$directory_name'."
fi

# End of process
echo "Finished!"

