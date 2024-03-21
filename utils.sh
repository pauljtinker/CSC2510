#!/bin/bash
#Question 1
printf "Here are all of the files in /bin that begin with c.\n"
echo $(find  -L /bin -name 'c*')
#Question 2
printf "Here are all of the files that contain the characters sh.\n"
echo $(find -L /bin -iname '*sh*')
#Question 3
printf "Here are the first 10 file in /usr.\n"
echo $(find /usr -type f | head)
#Question 4
printf "Here are the lines that have model name in the /proc/cpuinfo\n"
echo $(grep "model name" /proc/cpuinfo)
#Question 5
printf "Here are the total number of lines in /etc/group that does not contain the word sudo\n"
echo $(grep -v -c sudo /etc/group)
#Question 6
printf "Here are the lines in /etc/group that do contain sudo and the line numbers also\n"
echo $(grep -n sudo /etc/group)
#Question 7
printf "Here is the content of the food file sorted in alphabetical order\n"
echo $(sort food)
#Question 8
printf "Here is the content of the food file sorted in reverse alphabetical order\n"
echo $(sort food -r)
#Question 9
printf "Here is the content of the food file sort in alphabetical order by the second word\n"
echo $(sort food -k 2)
#Question 10
printf "Here is the content of the food file sorted by calories into a file name calo\n"
sort food -k 4rn > calo
cat calo
