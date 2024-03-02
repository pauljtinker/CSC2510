#!/bin/bash


#sources
# https://stackoverflow.com/questions/59838/how-do-i-check-if-a-directory-exists-or-not-in-a-bash-shell-script
# https://www.digitalocean.com/community/tutorials/workflow-loop-through-files-in-a-directory



dir1="images"
dir2="documents"
dir3="pdfs"
dir4="executables"
dir5="data"
dir6="unknown"


# unique to user
dirtoclean="/c/Users/User/JamesE-CSC2510/my_directory/"
toimage="/c/Users/User/JamesE-CSC2510/images/"
todata="/c/Users/User/JamesE-CSC2510/data/"
todoc="/c/Users/User/JamesE-CSC2510/documents/"
toexec="/c/Users/User/JamesE-CSC2510/executables/"
topdf="/c/Users/User/JamesE-CSC2510/pdfs/"
toother="/c/Users/User/JamesE-CSC2510/unknown/"



filesmoved="0"
bytesmoved="0"
imagemoved="0"
docmoved="0"
pdfmoved="0"
execmoved="0"
datamoved="0"
othermoved="0"
imagebyte="0"
docbyte="0"
pdfbyte="0"
execbyte="0"
databyte="0"
otherbyte="0"
averfile="0"
averimage="0"
averdata="0"
averdoc="0"
averexec="0"
averpdf="0"
averother="0"


if [ ! -d "$dir1" ]; then
    mkdir "$dir1"
    echo "Directory '$dir1' created successfully."
else
    echo "Directory '$dir1' already exists. Skipping creation."
fi


if [ ! -d "$dir2" ]; then
    mkdir "$dir2"
    echo "Directory '$dir2' created successfully."
else
    echo "Directory '$dir2' already exists. Skipping creation."
fi


if [ ! -d "$dir3" ]; then
    mkdir "$dir3"
    echo "Directory '$dir3' created successfully."
else
    echo "Directory '$dir3' already exists. Skipping creation."
fi


if [ ! -d "$dir4" ]; then
    mkdir "$dir4"
    echo "Directory '$dir4' created successfully."
else
    echo "Directory '$dir4' already exists. Skipping creation."
fi


if [ ! -d "$dir5" ]; then
    mkdir "$dir5"
    echo "Directory '$dir5' created successfully."
else
    echo "Directory '$dir5' already exists. Skipping creation."
fi


if [ ! -d "$dir6" ]; then
    mkdir "$dir6"
    echo "Directory '$dir6' created successfully."
else
    echo "Directory '$dir6' already exists. Skipping creation."
fi



for file in "$dirtoclean"*.jpg *.jpeg *.png *.gif; do
    if [ -f "$file" ]; then
        let "imagebyte += $(stat -c "%s" "$file")"
        let "bytesmoved += $(stat -c "%s" "$file")"
        let "filesmoved += 1"
        let "imagemoved += 1"
        mv "$file" "$toimage"
        echo "Moved $file to $toimage/"
    fi
done

echo "Moving files into respective directories."

for file in "$dirtoclean"*.txt *.docx *.doc *.pages *.key *.pptx *.ppt *.odt *.md; do
    if [ -f "$file" ]; then
        let "docbyte += $(stat -c "%s" "$file")"
        let "bytesmoved += $(stat -c "%s" "$file")"
        let "filesmoved += 1"
        let "docmoved += 1"
        mv "$file" "$todoc"
        echo "Moved $file to $todoc/"
    fi
done



for file in "$dirtoclean"*.pdf; do
    if [ -f "$file" ]; then
        let "pdfbyte += $(stat -c "%s" "$file")"
        let "bytesmoved += $(stat -c "%s" "$file")"
        let "filesmoved += 1"
        let "pdfmoved += 1"
        mv "$file" "$topdf"
        echo "Moved $file to $topdf/"
    fi
done



for file in "$dirtoclean"*.sh *.exe; do
    if [ -f "$file" ]; then
        let "execbyte += $(stat -c "%s" "$file")"
        let "bytesmoved += $(stat -c "%s" "$file")"
        let "filesmoved += 1"
        let "execmoved += 1"
        mv "$file" "$toexec"
        echo "Moved $file to $toexec/"
    fi
done



for file in "$dirtoclean"*.csv *.xlsx *.json; do
    if [ -f "$file" ]; then
        let "databyte += $(stat -c "%s" "$file")"
        let "bytesmoved += $(stat -c "%s" "$file")"
        let "filesmoved += 1"
        let "datamoved += 1"
        mv "$file" "$todata"
        echo "Moved $file to $todata/"
    fi
done



for file in "$dirtoclean"*; do
    if [ -f "$file" ]; then
        let "otherbyte += $(stat -c "%s" "$file")"
        let "bytesmoved += $(stat -c "%s" "$file")"
        let "filesmoved += 1"
        let "othermoved += 1"
        mv "$file" "$toother"
        echo "Moved $file to $toother/"
    fi
done



let "averfile=$bytesmoved/$filesmoved"
let "averimage=$imagebyte/$imagemoved"
let "averdata=$databyte/$datamoved"
let "averdoc=$docbyte/$docmoved"
let "averexec=$execbyte/$execmoved"
let "averpdf=$pdfbyte/$pdfmoved"
let "averother=$otherbyte/$othermoved"


echo "File move complete. Total files moved: $filesmoved"
echo "Total size of files moved: $bytesmoved B"
echo "Average file size: $averfile B"
echo "*** Breakdown per file type"
echo "*** Images ***"
echo "Total moved $imagemoved, total size $imagebyte B"
echo "Average file size: $averimage"
echo "*** Documents ***"
echo "Total moved $docmoved, total size $docbyte B"
echo "Average file size: $averdoc"
echo "*** PDFs ***"
echo "Total moved $pdfmoved, total size $pdfbyte B"
echo "Average file size: $averpdf"
echo "*** Executables ***"
echo "Total moved $execmoved, total size $execbyte B"
echo "Average file size: $averexec"
echo "*** Data ***"
echo "Total moved $datamoved, total size $databyte B"
echo "Average file size: $averdata"
echo "*** Unknown ***"
echo "Total moved $othermoved, total size $otherbyte B"
echo "Average file size: $averother"
