#!/bin/bash
#POINT="/home2/nodoka"
POINT="/home/nodoka/sbc/shell/"
PYENVPY="/home/nodoka/.pyenv/shims/python"
#while read line
for line in *$1*; do
    ${POINT}label.sh $line $2
done
