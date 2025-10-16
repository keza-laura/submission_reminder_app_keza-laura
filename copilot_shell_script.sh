#!/bin/bash

# Find the folder that starts with submission_reminder_
folder=$(find . -type d -name "submission_reminder_*" | head -n 1)

# If not found, show error
if [ -z "$folder" ]; then
  echo " Folder not found! Please run create_environment.sh first."
  exit 1
else
  echo "Found directory: $folder"
fi

# File paths
CONFIG="$folder/config/config.env"
REMINDER="$folder/app/reminder.sh"

# Check if config file exists
if [ ! -f "$CONFIG" ]; then
  echo "Config file not found! Please run create_environment.sh first."
  exit 1
fi

# Ask the user for a new assignment
read -p "Enter new assignment name: " new_name

# Check if user entered something
if [ -z "$new_name" ]; then
  echo "You must enter a name!"
  exit 1
fi

# Update the ASSIGNMENT line in config.env
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=$new_name/" "$CONFIG"

echo "Assignment updated to: $new_name"
echo "Running reminder to check students..."

# Run the reminder script
bash "$REMINDER"
