#!/bin/bash

# Create directories
for directories in images documents pdfs executables data unknown
 do
	if [ ! -d "$directories" ]
	 then
		echo "Creating directory: $directories"
		mkdir "$directories"
	else
		echo "Directory already exists: $directories"
	fi
done

# Iterate over files and move to directories

# counters
FilesMoved=0
BytesMoved=0

declare -A file_category
declare -A bytes_category


for file in *; do
	if [ -f "$file" ]; then
		case "$file" in
		*.jpg|*.jpeg|*.png|*.gif)
			category="images"
			;;
		*.txt|*.docx|*.doc|*.pages|*.key|*.ppt|*.odt|*.md)
			category="documents"
			;;
		*.pdf)
			category="pdfs"
			;;
		*.*sh|*.exe|*.*sh)
			category="executables"
			;;
		*.csv|*.xlsx|*.json)
			category="data"
			;;
		*)
			category="unknown"
			;;
		esac


echo "Moving files into directories..."

mv "$file" "$category/"

# update the counters
((FilesMoved++))
BytesMoved=$((BytesMoved + $(wc -c < "$category/$file")))

#update category counters
((file_category[$category]++))
bytes_category[$category]=$((bytes_category[$category] + $(wc -c < "$category/$file")))

fi 
done



