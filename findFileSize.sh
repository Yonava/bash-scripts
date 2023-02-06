#!/bin/bash

# Check if the user provided both parameters
if [ $# -lt 2 ]
then
  # If the directory parameter was not provided, prompt for it
  if [ -z "$1" ]
  then
    read -p "Enter the name of the directory to start in: " dir
  else
    dir=$1
  fi

  # If the file size limit was not provided, prompt for it
  if [ -z "$2" ]
  then
    read -p "Enter the file size limit in MB: " size
  else
    size=$2
  fi
else
  dir=$1
  size=$2
fi

# Convert the file size limit from MB to KB
size=$((size*1024))

# Find all files in the directory and its subdirectories that are greater than the specified size
find "$dir" -type f -size +"$size"k -print > "files_over_${size}KB.txt"