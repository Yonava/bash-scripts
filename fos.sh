#!/bin/bash

# Prompt for directory name if not provided as argument
if [ -z "$1" ]; then
    read -p "Enter directory name: " directory
else
    directory="$1"
fi

# Prompt for file size limit if not provided as argument
if [ -z "$2" ]; then
    read -p "Enter file size limit (MB): " size_limit
else
    size_limit="$2"
fi

# Find files greater than the size limit and write to output file
find "$directory" -type f -size +"$size_limit"M -printf '%p %s\n' > "files_over_${size_limit}MB"

# Redirect syserr output to errors.log
2> errors.log