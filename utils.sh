#!/bin/bash

find /usr/bin -name 'c*'

find /usr/bin -name '*sh' -type 1

find /usr | head -n 10

grep -F 'model name' /proc/cpuinfo

grep -vc 'sudo' /etc/group

grep -n 'sudo' /etc/group