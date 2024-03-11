#!/bin/bashgi
#) verify correct number of arguments was received
if (($# -lt 2 )):
    echo invalid augment
    break;
elif (($# -gt 3)):
    echo invalid augment
    break;
else
    echo correct augment 
fi
#verify file exists
if [ -f "$1"]
    echo file exits
else   
    echo file invalid
    break;
fi
#verify username exists
if [ grep -r $2 $1 ]:
    echo found 
else 
    echo not found
