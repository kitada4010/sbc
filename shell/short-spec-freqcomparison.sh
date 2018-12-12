#!/bin/bash
#POINT="/home2/nodoka"
#POINT="/home/nodoka"
POINT="/Users/neko/Desktop/研究室　第二生理"
while read line
do
    python ${POINT}/sbc/python/py/freq-wavelet/short-comparison.py  $line freq-spec-ripple
done < $1
