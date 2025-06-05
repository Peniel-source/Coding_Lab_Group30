#!/bin/bash

# Creating a menu of log types using the select command
echo "Select log to archive:"
echo "1) heart_rate_log.log"
echo "2) temperature_log.log"
echo "3) water_usage_log.log"

# User input 
read -p "Enter choice [1-3]: " choice

# Creating directories and the time variable to store the timestamp
dir="hospital_data/archive_logs"
time=$(date +%Y-%m-%d_%H-%M-%S)

# Create parent and sub-directories if they don’t exist
mkdir -p "$dir/heart_data_archive"
mkdir -p "$dir/temperature_data_archive"
mkdir -p "$dir/water_usage_archive"

case "$choice" in
  1)
	  file1="active_logs/heart_rate_log.log"
    archive_file1="$dir/heart_data_archive/heart_rate_${time}.log"
    if [ -f "$file1" ]; then
      mv "$file1" "$archive_file1"
      echo "Archiving heart_rate_log.log..."
      echo "Successfully archived to $archive_file1"
    else
      echo "Error: $file1 does not exist."
    fi
    ;;
  2)
	  file2="active_logs/temperature_log.log"
    archive_file2="$dir/temperature_data_archive/temperature_${time}.log"
    if [ -f "$file2" ]; then
      mv "$file2" "$archive_file2"
      echo "Archiving temperature_log.log..."
      echo "Successfully archived to $archive_file2"
    else
      echo "Error: $file2 does not exist."
    fi
    ;;
  3)
	  file3="active_logs/water_usage_log.log"
    archive_file3="$dir/water_usage_archive/water_usage_${time}.log"
    if [ -f "$file3" ]; then
      mv "$file3" "$archive_file3"
      echo "Archiving water_usage_log.log..."
      echo "Successfully archived to $archive_file3"
    else
      echo "Error: $file3 does not exist."
    fi
    ;;
  *)
    echo "Error: Invalid choice. Please select 1, 2, or 3."
    ;;
esac

		
