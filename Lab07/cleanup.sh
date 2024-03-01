#!/bin/bash
current_directory=$(pwd) #This should get the current directory, which will be needed for later loops.
#All of the variable that have total in them will keep the total tracked.
file_total=0
image_total=0
documents_total=0
pdfs_total=0
executables_total=0
data_total=0
unknown_total=0
#These variables will track filesize, using similar ideas to the variable above, however it is just the first and maybe second letter.
t_bytes=0
i_bytes=0
do_bytes=0
p_bytes=0
e_bytes=0
da_bytes=0
u_bytes=0
if [ -d images ] #This should run for every directory.
then
    mkdir images
    echo "Images has been created."
else
    echo "Images exists, skipping creation."
fi

if [ -d documents ]
then
    mkdir documents
    echo "Documents has been created."
else
    echo "Documents exists, skipping creation."
fi

if [ -d pdfs ]
then
    mkdir pdfs
    echo "pdfs has been created."
else
    echo "pdfs exists, skipping creation."
fi

if [ -d executables ]
then
    mkdir executables
    echo "Executables has been created."
else
    echo "Executables exists, skipping creation."
fi

if [ -d data ]
then
    mkdir data
    echo "Data has been created."
else
    echo "Data exists, skipping creation."
fi

if [ -d unknown ]
then
    mkdir unknown
    echo "Unknown has been created."
else
    echo "Unknown exists, skipping creation."
fi
echo "Moving files into respective directories.."
#The loop below to do all of the checking. A source I would like to cite is howtogeek.com I was doing research on case statement and it happened to have  
#something involving file extensions and a case statement. This helped me to apply it to this concept.
for File in "$current_directory"/*; do 
    Extension="${File##*.}"
    case "$Extension" in
        jpg | jpeg | png | gif)
            file_total=$((file_total+1)) #I used arithmetic expansion here.
            image_total=$((image_total+1))
            let "t_bytes=t_bytes+$(stat -c '%s' $File)" #I use let here.
            let "i_bytes=i_bytes+$(stat -c '%s' $File)"
            mv -n File /images
            ;;
        txt | docx | pages | key| pptx | odt  | md)
            file_total=$((file_total+1))
            documents_total=$((documents_total+1))
            let "t_bytes=t_bytes+$(stat -c '%s' $File)"
            let "do_bytes=do_bytes+$(stat -c '%s' $File)"
            mv -n File /documents
            ;;
        pdf)
            file_total=$((file_total+1))
            pdfs_total=$((pdfs_total+1))
            let "t_bytes=t_bytes+$(stat -c '%s' $File)"
            let "p_bytes=p_bytes+$(stat -c '%s' $File)"
            mv -n File /pdfs
            ;;
        sh | exe) #This might accidently end up moving the current cleanup.sh file.
            if("$File" == "cleanup.sh"); 
            then
                : #This single colon should just skip the else statement in the loop, so the cleanup.sh file is completely ignored.
            else
                file_total=$((file_total+1))
                executables_total=$((executables_total+1))
                let "t_bytes=t_bytes+$(stat -c '%s' $File)"
                let "e_bytes=e_bytes+$(stat -c '%s' $File)"
                mv -n File /executables
            fi
            ;;
        csv | xlsx | json)
            file_total=$((file_total+1))
            data_total=$((data_total+1))
            let "t_bytes=t_bytes+$(stat -c '%s' $File)"
            let "da_bytes=da_bytes+$(stat -c '%s' $File)"
            mv -n File /data
            ;;
        *)
            file_total=$((file_total+1))
            unknown_total=$((unknown_total+1))
            let "t_bytes=t_bytes+$(stat -c '%s' $File)"
            let "u_bytes=u_bytes+$(stat -c '%s' $File)"
            mv -n File /unknown
            ;;
    esac
done
t_average=$((t_bytes / file_total))
echo "File move complete. Total files moved: $file_total"
echo "Total size of the files moved: $t_bytes B"
echo "Average file size: $t_average B"

echo "*** Breakdown per file type ***"

i_average=$((i_bytes / image_total))
echo "*** Images ***"
echo "Total moved $image_total, total size $i_bytes B"
echo "Average file size: $i_average B"

do_average=$((do_bytes / documents_total))
echo "*** Documents ***"
echo "Total moved $document_total, total size $do_bytes B"
echo "Average file size: $do_average B"

p_average=$((p_bytes / pdfs_total))
echo "*** PDFs ***"
echo "Total moved $pdfs_total, total size $p_bytes B"
echo "Average file size: $p_average B"

e_average=$((e_bytes / executables_total))
echo "*** Executables ***"
echo "Total moved $executables_total, total size $e_bytes B"
echo "Average file size: $e_average B"

da_average=$((da_bytes / data_total))
echo "*** Data ***"
echo "Total moved $data_total, total size $da_bytes B"
echo "Average file size: $da_average B"

u_average=$((u_bytes / unknown_total))
echo "*** Unknown ***"
echo "Total moved $unknown_total, total size $u_bytes B"
echo "Average file size: $u_average B"
