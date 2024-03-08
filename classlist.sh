#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "Usage: $0 <file> username>"
	exit 1
fi

file="$1"
username="$2"

# Check if file exists and is a regular file
if [ ! -f "$file" ]; then
	echo "Error: $file does not exist or is not a regular file."
	exit 1
fi

# Check if username exists
line_number=$(grep -n "$username" "$file" | cut -d: -f1)

if [ -n "$line_number" ]; then
	echo "The name $username exists on line $line_number."
else
	while true; do
		read -p "Would you like to add $username to $file? (Y/N): " answer
