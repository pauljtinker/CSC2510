#!/bin/bash

find /usr/bin -name 'c*'

find /usr/bin -name '*sh' -type 1

find /usr | head -n 10

grep -F 'model name' /proc/cpuinfo

grep -vc 'sudo' /etc/group

grep -n 'sudo' /etc/group

sort food

sort -r food

sort -k2 food

sort -k3,3nr -k2,2nr food > calo