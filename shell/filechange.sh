#!/bin/bash
#POINT="/home/nodoka"
POINT="/home2/nodoka"
#for file in `\find . -name '*.txt'`; do
#    grep '^[0-9,-]' $file  > ${file/.txt/.csv}
#done
#rm *LFP.csv
for csvfile in `\find . -name '*.csv' `; do
    python ${POINT}/sbc/python/py/piccle.py ${csvfile/.csv/}
done

for picklefile in `\find .  -name '*.pickle' `; do
    python ${POINT}/sbc/python/py/400s-comparison.py ${picklefile/.pickle/}
    
done

