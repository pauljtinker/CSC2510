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

echo "The username does not exist." 