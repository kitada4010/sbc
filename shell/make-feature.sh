#!/bin/bash
#POINT="/home2/nodoka"
POINT="/home/nodoka"
PYENVPY="/home/nodoka/.pyenv/shims/python"
#rm $2
#引数1 : ファイル名に共通するtime

#while read line
for line in *$1*; do
    echo $line 
    echo ${line:0:3}-H${line:3:1}
    echo $($line | cut -f 2 -d "-") | cut -f 1 -d "1"
done
