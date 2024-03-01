#!/bin/bash

## tracks moved bytes
image_byte_moved = 0
documents_bytes_moved = 0
pdf_byte_moved = 0
executables_byte_moved = 0
data_byte_moved = 0
unknown_byte_moved = 0
total_bytes = $((image_byte_moved + documents_bytes_moved + pdf_byte_moved + executables_byte_moved + data_byte_moved + unknown_byte_moved ))
Average_bytes = $((total_bytes/6 ))
for x in images documents pdf executables data unknown
do
	if test -d "$x";then
		echo "$x  directory exists. Skipping creation"
	else
		mkdir $x
		echo "$x directory not found, Creating...Done"
	fi
done

for file in *; do
	if test -f "$file" ;then
        files="${file##*.}"
        case "$files" in
            jpg|jpeg|png|gif)
                image_bytes = $(stat -c %s "$file" )
                image_byte_moved=$((image_byte_moved + image_bytes))
                mv "$file" "images/" ;;
                
            txt|docx|doc|pages|key|pptx|ppt|odt|md)
                documents_bytes = $(stat -c %s "$file" )
                documents_byte_moved=$((documents_byte_moved + documents_bytes))
                mv "$file" "documents/" ;;
            pdf)
                pdf_bytes = $(stat -c %s "$file" )
                pdf_byte_moved=$((pdf_byte_moved + pdf_bytes))
                mv "$file" "pdfs/" ;;
            sh|exe)
                executables_bytes = $(stat -c %s "$file" )
                executables_byte_moved=$((executables_byte_moved + executables_bytes))
                if [ -x "$file" ]; then
                    mv "$file" "executables/"
                fi ;;
            csv|xlsx|json)
                data_bytes = $(stat -c %s "$file" )
                data_byte_moved=$((data_byte_moved + data_bytes))
                mv "$file" "data/" ;;
            *)
                unknown_bytes = $(stat -c %s "$file" )
                unknown_byte_moved=$((unknown_byte_moved + unknown_bytes))
                mv "$file" "unknown/" ;;
        esac
    fi    
done    

## print for terminal
echo "*** moving files ***"
echo "File move complete. Total files moved: [insert bytes]"
echo "Total size of files moved: " $total_bytes " B"
echo "Average file size:" $Average_bytes
echo "*** Breakdown per file type ***"
echo "*** images *** "
    echo "Total move, [insert] total size [insert]"
    echo "Average file size [insert]"
#Average file size is total size / total move

echo "*** documents ***"
    echo "Total move, [insert] total size [insert]"
    echo "Average file size [insert]"

echo "*** pdfs ***"
    echo "Total move, [insert] total size [insert]"
    echo "Average file size [insert]"

echo "*** executables ***"
    echo "Total move, [insert] total size [insert]"
    echo "Average file size [insert]"

echo "*** data ***"
    echo "Total move, [insert] total size [insert]"
    echo "Average file size [insert]"

echo "*** unknown ***"
    echo "Total move, [insert] total size [insert]"
    echo "Average file size [insert]"