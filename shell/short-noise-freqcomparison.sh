#!/bin/bash
#POINT="/home2/nodoka"
POINT="/home/nodoka"
while read line
do
    python ${POINT}/sbc/python/py/freq-wavelet/short-comparison.py ${line} freq-noise
done < $1
