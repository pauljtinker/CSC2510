#!/bin/bash

# source links
# https://linuxhandbook.com/bash-number-arguments/
# https://ioflood.com/blog/bash-not-equal/
# https://ioflood.com/blog/bash-if-file-exists/#:~:text=In%20bash%2C%20you%20can%20check,and%2>
# https://unix.stackexchange.com/questions/530561/shell-script-check-if-a-file-contains-a-spec>
# https://manpages.ubuntu.com/manpages/noble/en/man1/grep.1posix.html
# https://ryanstutorials.net/bash-scripting-tutorial/bash-input.php
# https://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linu>
# https://stackoverflow.com/questions/6207573/how-to-append-output-to-the-end-of-a-text-file
# https://stackoverflow.com/questions/29244351/how-to-sort-a-file-in-place

if [ "$#" != "2" ]; then
    echo "Please enter exactly two parameters."
    exit 0
fi
if [ ! -f "$1" ]; then
    echo "The file you entered as parameter 1 is not a file or does not exist."
    exit 0
fi
if grep -qw "$2" "$1"; then
    echo "The entered name is on line:"
    grep -n "$2" "$1"
else
    echo "The entered name is not in the list."
    read -p "Would you like to add the name you entered to the file? " addtolist
    while [[ "$addtolist" != "yes" && "$addtolist" != "Yes" && "$addtolist" != "y" && "$addtol>
        read -p "That is an invalid response. Please enter either yes or no." addtolist
    done
    if [[ "$addtolist" == "yes" || "$addtolist" == "Yes" || "$addtolist" == "y" || "$addtolist>
        echo "$2" >> "$1"
        read -p "Would you like the list to be alphabetized now that the new name has been add>
        while [[ "$alphabetize" != "yes" && "$alphabetize" != "Yes" && "$alphabetize" != "y" &>
            read -p "That is an invalid response. Please enter either yes or no. " alphabetize
        done
        if [[ "$alphabetize" == "yes" || "$alphabetize" == "Yes" || "$alphabetize" == "y" || ">
            sort -o "$1" "$1"
        fi
        if [[ "$alphabetize" == "no" || "$alphabetize" == "No" || "$alphabetize" == "n" || "$a>
            exit 0
        fi
    fi
    if [[ "$addtolist" == "no" || "$addtolist" == "No" || "$addtolist" == "n" || "$addtolist" >
        exit 0
    fi
fi
