#!/bin/bash
#Variables for the color of the problem and description.
HI='\033[0;32m'
NORMAL='\033[0m'
#Question 1
echo -e "${HI}1. starts or ends with Jose.$NORMAL"
echo $( grep -E --color=always '^Jose|Jose$' phonebook.dat)
#Question 2
echo -e "${HI}2. starts with at least 27 upper0 or lower-case characters a-z.$NORMAL"
echo $( grep -E --color=always '[a-zA-Z]{27,}' phonebook.dat)
#Question 3
echo -e "${HI}3. Consists of more than 18 characters.$NORMAL"
echo $( grep -E --color=always '.{19,}' phonebook.dat)
#Question 4
echo -e "${HI}4. Contains exactly 10 characters.$NORMAL"
echo $( grep -E --color=always '^.{10}$' phonebook.dat)
#Question 5
echo -e "${HI}5. Contains of sequence of 6 to 8 alphabetic characters seperated by a space or tab.$NORMAL"
echo $( grep -E --color=always '\s[a-zA-z]{6,8}\s' phonebook.dat)
#Question 6
echo -e "${HI}6. Contains a local phone number.$NORMAL"
echo $( grep -E --color=always '[^\-][0-9]{3}\-[0-9]{4}|^[0-9]{3}\-[0-9]{4}' phonebook.dat)
#Question 7
echo -e "${HI}7. Contains a valid URL on a line by itself.$NORMAL"
echo $( grep -E --color=always '^(http|HTTP)://[a-zA-Z]+\.[a-zA-Z]+\.(com|edu|org)$' phonebook.dat)
