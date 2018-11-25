#!/bin/bash
POINT="/home/nodoka"
#POINT="/home/hera/nodoka/home2/nodoka"
#for file in `\find . -name '*.txt'`; do
#        grep '^[0-9,-]' $file  > ${file/.txt/.csv}
#    if ${file} = "*LFP*"; then
#	echo 判定できてる${file}
#    else 
#	echo これもいける${file}
#    fi
#done

for csvfile in `\find . -name '*.csv' `; do
    python ${POINT}/sbc/python/py/piccle.py ${csvfile/.csv/}
done
#rm *LFP.pikle

for picklefile in `\find .  -name '*.pickle' `; do
    python ${POINT}/sbc/python/py/400s-comparison.py ${picklefile/.pickle/}
done

