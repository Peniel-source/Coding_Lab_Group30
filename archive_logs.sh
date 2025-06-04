#!/bin/bash

#Creating a menu of log types to choose from using the select command.
echo "Select log to archive:"
echo "1) heart_rate_log.log"
echo "2 temperature_rate_log.log" 
echo "3) water_usage_log.log"
#Using the read command to take input from the user. 
read -p "Enter choice [1-3]: " choice
dir="hospital_data/archive_logs"
time=(date + "YYYY-MM-DD_HH:MM:SS")
if [ ! -d "$dir" ]; then
        mkdir $dir
        cd $dir
        mkdir {heart_data_archive,temperature_data_archive,water_usage-archive}
fi
# Using the if condition to execute the choice from the user input if particular conditions are true. 
if [ "$choice" = "1" ]; then
        archive_file1="heart_rate_${time}.log"
        file1="hospital_data/$dir/heart_data_archive/$archive_file1"
        if [ -f "hospital_data/active-logs/heart_rate_log.log" ]; then
                touch $file1
                mv hospital_data/active_logs/heart_rate_log.log $file1
                echo "Archiving heart_rate.log..."
                echo "Successfully archived to $file1"
elif [ "$choice" = "2" ]; then
        archive_file2="heart_rate_${time}.log"
        file2="hospital_data/$dir/heart_data_archive/$archive_file2"
        if [ -f "hospital_data/active-logs/heart_rate_log.log" ]; then
                touch $file2
                mv hospital_data/active_logs/heart_rate_log.log $file2
                echo "Archiving heart_rate.log..."
                echo "Successfully archived to $file2"
elif [ "$choice" = "3" ]; then
        archive_file3="heart_rate_${time}.log"
        file3="hospital_data/$dir/heart_data_archive/$archive_file3" 
	if [ -f "hospital_data/active-logs/heart_rate_log.log" ]; then
                touch $file3
                mv hospital_data/active_logs/heart_rate_log.log $file3
                echo "Archiving heart_rate.log..."
                echo "Successfully archived to $file3"
else
        echo "Error: Invalid User Input, Please choose from [1-3]"
fi
