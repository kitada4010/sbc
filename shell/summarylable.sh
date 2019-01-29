#!/bin/bash
#POINT="/home2/nodoka"
POINT="/home/nodoka"
PYENVPY="/home/nodoka/.pyenv/shims/python"
#while read line
for line in *$1*; do
    while read filename
    do
	${POINT}label.sh $filename $2 ${line:0:4}
    done < $line
done
