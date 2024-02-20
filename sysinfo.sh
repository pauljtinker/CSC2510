#!/bin/sh
mkdir -p system_info
cd system_info
echo "System information has been gathered. Here's the summary:"> system_info.txt 
echo "Date and Time:    $(date)" >> system_info.txt
echo "User:     $(whoami)" >> system_info.txt
echo "Current Working Directory:    $(pwd)" >>system_info.txt
echo "System Usage:     $(top -b -n 1)" >>system_info.txt
echo "Disk Usage:   $(df -h)" system_info.txt
