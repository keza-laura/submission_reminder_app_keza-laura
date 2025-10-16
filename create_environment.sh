#!/bin/bash

read -p "Enter your name: " name

main="submission_reminder_$name"
mkdir -p $main/app
mkdir -p $main/modules
mkdir -p $main/assets
mkdir -p $main/config

cat > "$main/app/reminder.sh" << 'EOF'
#!/bin/bash

# Get the directory where this script is located
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source environment variables and helper functions (relative to script location)
source "$BASE_DIR/../config/config.env"
source "$BASE_DIR/../modules/functions.sh"

# Path to the submissions file (relative to script location)
submissions_file="$BASE_DIR/../assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

#check_submissions "$submissions_file"

EOF

cat <<'EOL' > $main/modules/functions.sh
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOL

cat <<'EOL' > $main/assets/submissions.txt

student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Kevin, Git, not submitted
liza, Shell Navigation, submitted
Nana, Git, submitted
Adore, Shell Basics, not submitted
Loli, Shell Basics, not submitted

EOL

cat <<'EOL' > $main/config/config.env

# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2

EOL

cat <<'EOL' > $main/startup.sh
#!/bin/bash
echo "Starting Submission Reminder App..."
bash app/reminder.sh
EOL

find $main_dir -type f -name "*.sh" -exec chmod +x {} \;

echo "Environment setup complete in folder: $main"
