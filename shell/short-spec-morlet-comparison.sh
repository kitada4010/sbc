#!/bin/bash
#POINT="/home2/nodoka"
POINT="/home/nodoka"
while read line
do
    python ${POINT}/sbc/python/py/wavelet/short-Morlet-comparison.py  $line spec-ripple
done < $1
