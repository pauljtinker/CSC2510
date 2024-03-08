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

case $answer in 
	[Yy]*)
		echo "$username" >> "$file"

		while true; do
			read -p "Do you want $file to be in alphabetical order? (Y/N): " sort_answer

			case $sort_answer in
				[Yy])
					sort -o "$file" "$file"
					break
					;;
				[Nn])
					break
					;;
				*)
					echo "Invalid input. Please enter Y or N."
					;;
			esac
		done

		exit 0
		;;
	[Nn]*)
		exit 0
		;;
	*)
		echo "Invalid input. Please enter Y or N."
		;;
		esac
	done
fi
