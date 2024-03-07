#!/bin/bash
#NOTE TO SELF THE FIRST PARAMETER IS THE FILE.
if (( $# != 2 )) #If the number of parameters was right.
then
    echo "That was not the correct number of parameters."
    echo "Please use only two parameters."
    exit 1 #General errors exit.
fi

if [[ ! -f $1 ]] #This will check if the file exists, and isn't a directory.
then
    echo "Error the file either does not exist, or is not a normal file."
    exit 1
fi

line_Count=0
while read -r line;
do
    (( line_Count++ ))
    if [[ $2 = $line ]] #This works for the TA this is not working for me however.
    then
        echo "The username $2 exists and is on line $line_Count" #Placeholder for later need to fix.
        exit 0 #Succesful exit.
    fi
done <$1

while : #Will loop until one of the exit statements within it is ran.
do
    read -p "That username is not on the list. Would you like to add it?" answer_One
    case "$answer_One" in
        'N' | 'n' | 'No' | 'no')
        exit 0
        ;;
        'Y' | 'y' | 'Yes' | 'yes')
        echo "$2" >> $1
        while :
        do
            read -p "Would you like to alphabetize the new list." answer_Two
            case "$answer_Two" in
                'N' | 'n' | 'No' | 'no')
                exit 0
                ;;
                'Y' | 'y' | 'Yes' | 'yes')
                sort $1 > "updatedclasslist.txt" #This is a placeholder file that will be organized.
                rm $1 #This will remove the old file.
                mv "updatedclasslist.txt" $1 #This will change the name of the placeholder file so it looks like the old one.
                exit 0
                ;;
                *)
                echo "Invalid input, please enter the response in the form of yes or no."
                ;;
            esac
        done
        ;;
        *)
        echo "Invalid input, please enter the response in the form of yes or no."
        ;;
        esac
done
