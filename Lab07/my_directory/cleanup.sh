#!/bin/bash
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
if [[ -d images ]] #This should run for every directory.
then
    echo "Images exists, skipping creation."
else
    mkdir images
    echo "Images has been created."
fi

if [[ -d documents ]]
then
    echo "Documents exists, skipping creation."
else
    mkdir documents
    echo "Documents has been created."
fi

if [[ -d pdfs ]]
then
    echo "pdfs exists, skipping creation."
else
    mkdir pdfs
    echo "pdfs has been created."
fi

if [[ -d executables ]]
then
    echo "Executables exists, skipping creation."
else
    mkdir executables
    echo "Executables has been created."
fi

if [[ -d data ]]
then
    echo "Data exists, skipping creation."
else
    mkdir data
    echo "Data has been created."
fi

if [[ -d unknown ]]
then
    echo "Unknown exists, skipping creation."
else
    mkdir unknown
    echo "Unknown has been created."
fi
echo "Moving files into respective directories.."
#The loop below to do all of the checking. A source I would like to cite is howtogeek.com I was doing research on case statement and it happened to have  
#something involving file extensions and a case statement. This helped me to apply it to this concept.
for file in *; do 
    temp_bytes=$(stat -c '%s' "$file")
    Extension="${file##*.}"
    case "$Extension" in
        jpg | jpeg | png | gif)
            if [[ -d "$file" ]] #This should prevent the directories from getting moved around.
            then
                continue
            else
                file_total=$((file_total+1)) #I used arithmetic expansion here.
                image_total=$((image_total+1))
                t_bytes=$((t_bytes+temp_bytes))
                i_bytes=$((i_bytes+temp_bytes))  
            #Check size of file first. This is done with stat.
            #stat -f%z "./file" for mac
            #stat -c %s for windows
                mv -n "$file" /images
            fi
            ;;
        txt | docx | pages | key| pptx | odt  | md)
            if [[ -d "$file" ]]
            then
                continue
            else
                file_total=$((file_total+1))
                documents_total=$((documents_total+1))
                t_bytes=$((t_bytes+temp_bytes))
                do_bytes=$((do_bytes+temp_bytes))
                mv -n "$file" /documents
            fi
            ;;
        pdf)
            if [[ -d "$file" ]]
            then
                continue
            else
                file_total=$((file_total+1))
                pdfs_total=$((pdfs_total+1))
                t_bytes=$((t_bytes+temp_bytes))
                p_bytes=$((p_bytes+temp_bytes))
                mv -n "$file" /pdfs
            fi
            ;;
        sh | exe)
            if [[ -d "$file" ]] 
            then
                continue #This single colon should just skip the else statement in the loop, so the cleanup.sh file is completely ignored. continue
            elif [[ "$file" == "cleanup.sh" ]] #This should make it so that it will not move cleanup.sh
            then
                continue
            else
                file_total=$((file_total+1))
                executables_total=$((executables_total+1))
                t_bytes=$((t_bytes+temp_bytes))
                e_bytes=$((e_bytes+temp_bytes))
                mv -n "$file" /executables
            fi
            ;;
        csv | xlsx | json)
            if [[ -d "$file" ]]
            then
                continue
            else
                file_total=$((file_total+1))
                data_total=$((data_total+1))
                t_bytes=$((t_bytes+temp_bytes))
                da_bytes=$((da_bytes+temp_bytes))
                mv -n "$file" /data
            fi
            ;;
        *)
            if [[ -d "$file" ]]
            then
                continue
            else
                file_total=$((file_total+1))
                unknown_total=$((unknown_total+1))
                t_bytes=$((t_bytes+temp_bytes))
                u_bytes=$((u_bytes+temp_bytes))
                mv -n "$file" /unknown
            fi
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
echo "Total moved $documents_total, total size $do_bytes B"
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
