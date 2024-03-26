#!/bin/bash

find /usr/bin -name 'c*'

echo " "


find /usr/bin -name '*sh' -type 1

echo " "


find /usr | head -n 10

echo " "


grep -F 'model name' /proc/cpuinfo

echo " "


grep -vc 'sudo' /etc/group

echo " "


grep -n 'sudo' /etc/group

echo " "

sort food

echo " "

sort -r food

echo " "

sort -k2 food
echo " "


sort -k3,3nr -k2,2nr food > calo
echo " "
