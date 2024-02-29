#!/bin/bash
for x in images documents pdf executables data unknown
do
	if test -d "$x";then
		echo "$x  directory exists"
	else
		mkdir $x
		echo "$x  directory not found, Creating $x directory"
	fi
done

for file in *; do
	if test -f "$file" ;then
        files="${file##*.}"
        case "$files" in
            jpg|jpeg|png|gif)
                echo "images bytes: "
                stat -c %s $file
                mv "$file" "images/" ;;
            txt|docx|doc|pages|key|pptx|ppt|odt|md)
                mv "$file" "documents/" ;;
            pdf)
                mv "$file" "pdfs/" ;;
            sh|exe)
                if [ -x "$file" ]; then
                    mv "$file" "executables/"
                fi ;;
            csv|xlsx|json)
                mv "$file" "data/" ;;
            *)
                mv "$file" "unknown/" ;;
        esac
    fi    
done    