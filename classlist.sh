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
