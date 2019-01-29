#!/bin/bash
#POINT="/home2/nodoka"
POINT="/home/nodoka"
PYENVPY="/home/nodoka/.pyenv/shims/python"
#while read line
for line in *$1*; do
file=$line
    while read filename
    do
	${POINT}/sbc/c/label $filename $2 $3-${file:0:3}-H${file:3:1}
    done < ${file}
done
