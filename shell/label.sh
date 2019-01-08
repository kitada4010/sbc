#!/bin/bash
#POINT="/home2/nodoka"
POINT="/home/nodoka"
#PYENVPY="/home/nodoka/.pyenv/shims/python"

while read line
do
    ${POINT}/sbc/c/label $line $2 
done < $1
