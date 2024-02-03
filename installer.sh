#!/bin/bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
SCRIPT_NAME="script.sh"
SCRIPT_PATH="$CURR_DIR/$SCRIPT_NAME"


CRON_JOB_1="* * * * * /bin/bash $SCRIPT_PATH"
CRON_JOB_2="* * * * * sleep 30; /bin/bash $SCRIPT_PATH"


add_cron_job() {
    local job="$1"
    sudo crontab -l > /tmp/current_crontab
    if ! grep -Fxq "$job" /tmp/current_crontab; then
        (sudo crontab -l 2>/dev/null; echo "$job") | sudo crontab -
    else
        echo "Cron job already exists: $job"
    fi
}

add_cron_job "$CRON_JOB_1"
add_cron_job "$CRON_JOB_2"

rm /tmp/current_crontab
