#!/bin/bash

# Define the source directory
SOURCE_DIR="/var/lib/go-agent/pipelines/Moodle/"

# Define the destination server and directory
DEST_SERVER="192.168.13.30"
DEST_DIR="/var/www/html/moodle"

# Rsync options
# -a: archive mode
# -v: verbose
# -z: compress file data
# --delete: delete extraneous files from destination dirs
RSYNC_OPTIONS="-avz --delete"

# Rsync command execution
rsync $RSYNC_OPTIONS $SOURCE_DIR/ root@$DEST_SERVER:$DEST_DIR

# Check if rsync command was successful
if [ $? -eq 0 ]; then
    echo "Rsync operation completed successfully."
else
    echo "Rsync operation failed."
    exit 1
fi
