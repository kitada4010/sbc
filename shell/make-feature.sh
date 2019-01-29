#!/bin/bash
#POINT="/home2/nodoka"
POINT="/home/nodoka"
PYENVPY="/home/nodoka/.pyenv/shims/python"
#rm $2
#while read line
for line in *$1*; do
    echo $line 
    echo ${line:0:3}
    echo ${line:3:1}
done
