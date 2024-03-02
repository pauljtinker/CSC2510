#!/bin/bash

## tracks moved bytes
image_byte_moved=0
documents_bytes_moved=0
pdf_byte_moved=0
executables_byte_moved=0
data_byte_moved=0
unknown_byte_moved=0

#tracks files moved
image_file_moved=0
documents_file_moved=0
pdf_file_moved=0
executables_file_moved=0
data_file_moved=0
unknown_file_moved=0


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
                image_bytes=$(stat -c %s "$file" )
                ((image_file_moved++))
                image_byte_moved=$((image_byte_moved + image_bytes))
                mv "$file" "images/" ;;
                
            txt|docx|doc|pages|key|pptx|ppt|odt|md)
                documents_bytes=$(stat -c %s "$file" )
                documents_byte_moved=$((documents_byte_moved + documents_bytes))
                ((documents_file_moved++))
                mv "$file" "documents/" ;;
            pdf)
                pdf_bytes=$(stat -c %s "$file" )
                pdf_byte_moved=$((pdf_byte_moved + pdf_bytes))
                ((pdf_file_moved++))
                mv "$file" "pdf/" ;;
            sh|exe)
               
                if test -x "$file"; then
                    executables_bytes=$(stat -c %s "$file" )
                    executables_byte_moved=$((executables_byte_moved + executables_bytes))
                    ((executables_file_moved++))
                    mv "$file" executables/
                fi ;;
            csv|xlsx|json)
                data_bytes=$(stat -c %s "$file" )
                data_byte_moved=$((data_byte_moved + data_bytes))
                ((data_file_moved++))
                mv "$file" "data/" ;;
            *)
                unknown_bytes=$(stat -c %s "$file" )
                unknown_byte_moved=$((unknown_file_moved + unknown_bytes))
                ((unknown_file_moved++))
                mv "$file" "unknown/" ;;
        esac
    fi
done  

#tracks average and total bytes of each folder
total_bytes=$((image_byte_moved + documents_bytes_moved + pdf_byte_moved + executables_byte_moved + data_byte_moved + unknown_byte_moved ))
total_average_bytes=$((total_bytes/6))
total_files=$((image_file_moved + documents_file_moved + pdf_file_moved + executables_file_moved + data_file_moved + unknown_file_moved))
img_avg=$((image_byte_moved / image_file_moved))
doc_avg=$((documents_bytes_moved/documents_file_moved))
pdf_avg=$((pdf_byte_moved/pdf_file_moved))
exc_avg=$((executables_byte_moved/executables_file_moved))
data_avg=$((data_byte_moved/data_file_moved))
unknown_avg=$((unknown_byte_moved/unknown_file_moved))

## print for terminal
echo "--------------------------- moving files ----------------------------------------------"
echo "File move complete. Total files moved: " $total_files
echo "Total size of files moved: " $total_bytes " B"
echo "Average file size:" $total_average_bytes
echo "*** Breakdown per file type ***"
echo "---------------------------------------------------------------------------------------"
echo "*** images *** "
    echo "Total move, $image_file_moved total size $image_byte_moved"
    echo "Average file size " $img_avg
#Average file size is total size / total move

echo "*** documents ***"
    echo "Total move, $documents_file_moved total size $documents_bytes_moved"
    echo "Average file size "$doc_avg

echo "*** pdfs ***"
    echo "Total move, $pdf_file_moved total size $pdf_byte_moved"
    echo "Average file size "$pdf_avg

echo "*** executables ***"
    echo "Total move, $executables_file_moved total size $executables_byte_moved"
    echo "Average file size "$exc_avg

echo "*** data ***"
    echo "Total move, $data_file_moved total size $data_byte_moved"
    echo "Average file size "$data_avg

echo "*** unknown ***"
    echo "Total move, $unknown_file_moved total size $unknown_byte_moved"
    echo "Average file size "$unknown_avg