#!/bin/bash
#POINT="/home2/nodoka"
POINT="/home/nodoka"
while read line
do
    python ${POINT}/sbc/python/py/wavelet/short-comparison.py ${line} noise
done < $1
