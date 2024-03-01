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



