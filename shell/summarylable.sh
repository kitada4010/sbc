#!/bin/bash
#POINT="/home2/nodoka"
POINT="/home/nodoka"
PYENVPY="/home/nodoka/.pyenv/shims/python"
#while read line
for line in *$1*; do
file=$line
    while read filename
    do
	${POINT}/sbc/c/label $filename $2 ${file:0:4}
    done < $file
done
