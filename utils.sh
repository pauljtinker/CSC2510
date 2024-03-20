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

