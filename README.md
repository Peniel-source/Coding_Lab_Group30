# Group_Coding_Lab_Group30
Title of the project: Hospital Data Monitoring & Archival System.

Objective Of the Project

This project aims to:
Collect real-time patient health metrics and resource usage data
1. Provide controlled log archiving with user selection
2. Generate analytical reports with device statistics and temporal patterns
Required System Setup:
1.Three different Python scripts we used in our project that mimic real devices to generate data. They are heart_monitor.py, temp_sensor.py, and water_meter.py

Completed Required Tasks
The directory “hospital_data/” is created manually. The other directories are created automatically when the simulators are run.
We wrote the two scripts,  archive_logs.sh and analyze_logs.sh. 
archive_logs.sh is an interactive script that does three things when run. 
1. It prompts the user by displaying the menus heart_rate_log.log, temperature_log.log, and water_usage_log.log
2. When the user selects one of the menus, it archives only the selected log file into its designated archive folder, renaming it with a timestamp, and creating an empty log file for continued monitoring. 
So let's take you through the archive_logs.sh file:
the echo command is used to print the prompt to user
The variable ‘choice’ stores the choice the user entered
The variable time is stores time stamp
The first if condition checks whether the directory exists or not and creates the “directories heart_data_archive,temperature_data_archive,water_usage-archive”.
The remaining conditions and nested conditions check users input to  archive log files to respective directories.
The second script  - Intelligent Analysis Script (analyze_logs.sh) does the followings:
1) . When run, this script prompts users with these menus Heart Rate (heart_rate.log), Temperature (temperature.log), Water Usage (water_usage.log), and Enter choice (1-3). And also validates user input (only 1, 2, or 3)
2. Counts occurrences of of each device in the selected log file, and records both total counts per device and timestamp of first/last entry (bonus). It finally appends results to reports/analysis_report.txt
So let us take you through analyze_logs.sh script:
The first two variables report_file and log_dir holds file paths such as hospital_data/reports/analysis_report.txt and hospital_data/active_logs respectively.
Then the menus listed above are displayed for user are written by the help of echo command.
The case statement is used to accept the choices of users. The variable “option” stores the choices.
If conditions are used to check the existence of log file selected by the user and prints error message if the file is not there.
Log types and current date as header in the report for the sake of clarity is printed for the user. echo command is used.
Then the number of entries per device, first and last timestamp entries are gotten. Finally the the script wrapps up the process by printing the message  “analysis complete. Results saved to $report_file”
The file “analysis_report.txt”  stores the results analized by the analyze_logs.sh. 


