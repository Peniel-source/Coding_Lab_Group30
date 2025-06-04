#!/bin/bash

# Setting file paths in variables
report_file="reports/analysis_report.txt"
log_dir="hospital_data/active_logs"

# Displaying the menu to the user
echo "Select log to archive:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
read -p "Enter choice (1-3): " option

# Selecting the file based on the user's input
case $option in
     1)
	log_file=$log_dir/heart_rate.log
	log_type="Heart Rate"
	;;
     2)
	log_file=$log_dir/temperature.log
	log_type="Temperature"
	;;
     3)
	log_file=$log_dir/water_usage.log
	log_type="Water Usage"
	;;
     *)
	echo "Please enter either 1, 2, or 3. Exiting program."
	exit 1
	;;
esac

# Confirming the existence of the selected log file
if [ ! -f "$log_file" ]; then
	echo "Error, Log file $log_file does not exist."
	exit 1
fi

# Printing the log type and current date as a header in the report for the sake of clarity
echo "Analyzing $log_type log: $log_file"
echo "------ $log_type Log Analysis ------" >> "$report_file"
echo "Date: $(date)" >> "$report_file"

# Counting the number of entries per device
echo "Device Entry Counts:" >> "$report_file"
awk '{print $1}' "$log_file" | sort | uniq -c >> "$report_file"

# Getting the first and last timestamp entries
FIRST_TIME=$(head -n 1 "$log_file" | cut -d' ' -f2-)
LAST_TIME=$(tail -n 1 "$log_file" | cut -d' ' -f2-)
echo "First entry time: $FIRST_TIME" >> "$report_file"
echo "Last entry time:  $LAST_TIME" >> "$report_file"

# Wrapping up the program
echo "Analysis complete. Results saved to $report_file"
