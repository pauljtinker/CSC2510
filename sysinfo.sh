 #!/bin/bash

mkdir system_info

cd system_info

touch system_info.txt

echo "System information has been gathered. Here’s the summary:"

echo "Date and Time: $(date '+%m/%d/%Y %H:%M:%S %Z')"

echo "User: $(whoami)"

echo "Current Working Directory: $PWD"

echo "System Usage:"

ps aux | head -n 6

echo "Disk Usage:"

df -h | head -n 11
