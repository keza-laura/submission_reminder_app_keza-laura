# submission_reminder_app
Upcoming assignment deadlines alert

# Overview
This is a simple shell-based application that reminds students about upcoming assignment deadlines.  
It was created using Bash scripting and helps automate checking who has not submitted their assignments.

# Task 1: Environment Setup
Run this command to create the project environment:

bash create_environment.sh

This script creates the necessary directories and files for a program that shows students who need to be reminded of their pending submissions.
The submissions.txt  contains the sample records of the student’s submission status.
When the script runs, it should prompt the user for their name and create a directory named submission_reminder_{yourName}, replacing {yourName}

#Task 2: Copilot Shell Script

Prompts the user to enter the assignment name, then the new input will replace the current name in config/config.env on the ASSIGNMENT value (row 2)
With the sed Or other suitable commands, the input of the assignment can replace the value in config/config.env
When the replacement is complete, you can rerun startup.sh that will check the non-submission status of students for the new assignment that was saved in the config/config.env.

#Structure
submission_reminder_<EnteredName>/
├── config/
│ └── config.env
├── data/
│ └── submissions.txt
├── scripts/
│ ├── functions.sh
│ ├── reminder.sh
  └── startup.sh

submission_reminder_app_<keza-laura>/
├── create_environment.sh
├── copilot_shell_script.sh
└── README.md
