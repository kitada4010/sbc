#!/bin/bash
#POINT="/home2/nodoka"
POINT="/home/nodoka"
while read line
do
    python ${POINT}/sbc/python/py/spectrogram/short10-comparison.py $line
done < $1
