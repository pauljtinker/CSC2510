#!/bin/bash
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
if [ -f "$1" ]; then
    echo file exits
else
    echo file invalid
    exit 1;
fi
# verify username exists
if grep -wq "$2" "$1"; then 
    echo "$2" found
else 
    echo "$2" not found
    read -rp "Would you like to add the username? " ANSWER
    case "$ANSWER" in
        [Yy] | [Yy]es )
            echo "Added."
            echo -e "\n$2" >> "$1"
            read -rp "Would you like to Alphabetize the usernames? (yes/no): " ANSWER2
            case "$ANSWER2" in
                [Yy] | [Yy]es )
                    echo "Alphabetizing usernames."
                    # Sort the file alphabetically
                    sort -o "$1" "$1"
                    ;;
                [Nn] | [Nn]o )
                    echo "exiting."
                    exit
                    ;;
                * )
                    echo "Invalid input"
                    ;;
            esac
            exit ;;
        [Nn] | [Nn]o )
            echo "Not added. Exiting."
            exit ;;
        * )
            echo "Invalid input. Please enter 'yes' or 'no'."
            exit ;;
    esac
fi
