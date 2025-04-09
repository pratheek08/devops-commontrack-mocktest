#!/bin/bash
# Author: PRATHEEK

# Check if directory path is provided
if [ -z "$1" ]; then
    echo "Directory not provided."
    exit 1
fi

DIR_PATH=$1

# Confirm with user
read -p "Do you want to organize files in $DIR_PATH? (y/n): " answer
if [[ "$answer" != "y" ]]; then
    echo "Exiting..."
    exit 0
fi

# Ask for file extension
read -p "Enter the file extension to organize (e.g., txt): " extension

# Create destination directory (note: fixed typo in 'organized')
DEST_DIR="$DIR_PATH/organized/$extension"
mkdir -p "$DEST_DIR"

# Move files
count=0
shopt -s nullglob  # Avoid error if no matching files
for file in "$DIR_PATH"/*."$extension"; do
    if [ -f "$file" ]; then
        mv "$file" "$DEST_DIR"
        echo "Moved $file to $DEST_DIR"
        ((count++))
    fi
done
shopt -u nullglob

echo "Total files moved: $count"
