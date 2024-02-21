#!/bin/bash

echo "System information has been gathered. Here's the summary:" >> system_info.txt

now=$(date +"%m/%d/%Y %H:%M:%S %Z")
echo "Current date and time: $now" >> system_info.txt

me=$(whoami)
echo "User: $me" >> system_info.txt

current=$(pwd)
echo "Current Working Directory: $current" >> system_info.txt

sysusage=$(top -bn1 | head -n 5)
echo "System Usage:" >> system_info.txt
echo "$sysusage" >> system_info.txt

dskusage=$(df -h)
echo "Disk Usage:" >> system_info.txt
echo "$dskusage" >> system_info.txt
