 #!/bin/bash

mkdir system_info

cd system_info

touch system_info.txt

echo "System information has been gathered. Here’s the summary:"

echo "Date and Time: $(date '+%m/%d/%Y %H:%M:%S %Z')"
