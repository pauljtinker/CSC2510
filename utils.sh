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
printf "Here are the total number of lines in /etc/services that does not contain the word send\n"
echo $(grep -v -c send /etc/services)
#Question 6
printf "Here are the lines in /etc/services that do contain send and there line numbers also\n"
echo $(grep -n send /etc/services)
#For this one, I checked the contents of the file and didn't see any lines where it showed up, but the code should work.
#Question 7

