#!/bin/bashgi
#) verify correct number of arguments was received
if [ $# -lt 2 ]; then
    echo Invalid number of arguments.
    exit 1
elif [ $# -gt 3 ]; then
    echo Invalid number of arguments.
    exit 1
else
    echo Correct number of arguments.
fi

#verify file exists
if [-f "$1" ]
    echo file exits
else   
    echo file invalid
    exit 1;
fi
#verify username exists
if  grep -r "$2" "$1"; then 
    echo found 
else 
    echo not found
