 #!/bin/bash

mkdir system_info

cd system_info

touch system_info.txt

> system_info.txt

echo "System information has been gathered. Here’s the summary:" >> system_info.txt 

echo "Date and Time: $(date '+%m/%d/%Y %H:%M:%S %Z')" >> system_info.txt

echo "User: $(whoami)" >> system_info.txt

echo "Current Working Directory: $PWD" >> system_info.txt

echo "System Usage:" >> system_info.txt

ps aux | head -n 6  >> system_info.txt

echo "Disk Usage:" >> system_info.txt

df -h | head -n 11 >> system_info.txt

cat system_info.txt
