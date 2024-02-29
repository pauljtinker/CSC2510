#!/bin/bash
for x in images documents pdf executables data unknown
do
	if test -d "$x";then
		echo "$x  directory exists"
	else
		mkdir $x
		echo "$x  directory not found, Creating $x directory"
	fi
done
