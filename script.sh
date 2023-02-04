#!/bin/bash

# Prompt for the file extension to search for if not provided as an argument
if [ -z "$1" ]; then
  read -p "Enter the file extension to search for: " extension
else
  extension=$1
fi

# Prompt for the directory to copy the found files into if not provided as an argument
if [ -z "$2" ]; then
  read -p "Enter the directory to copy the found files into: " backup_dir
else
  backup_dir=$2
fi

# Check if the backup directory exists, create it if it doesn't
if [ ! -d "$backup_dir" ]; then
  mkdir -p "$backup_dir"
fi

# Create the backup log file in the backup directory
log_file="$backup_dir/backup.log"
if [ ! -f "$log_file" ]; then
  touch "$log_file"
fi

# Search the entire file system for files with the specified extension
for file in $(find / -type f -name "*.$extension"); do
  # Copy the found files into the backup directory
  cp "$file" "$backup_dir"

  # Get the current date and time
  date_time=$(date +%F::%T)

  # Write the date and time, and the name of the backed up file, to the backup log
  echo "$date_time::$file" >> "$log_file"
done
