#!/bin/bash
POINT="/home/nodoka"
#POINT="/home/hera/nodoka/home2/nodoka"
FILE="B40-HR C14-HL C14-HR C15-HL C15-HR"
#for file in ${FILE}
#do
#        grep '^[0-9,-]' $file  > ${file/.txt/.csv}
#    if ${file} = "*LFP*"; then
#	echo 判定できてる${file}
#    else 
#	echo これもいける${file}
#    fi
#done

#for csvfile in ${FILE}
#do
#    python ${POINT}/sbc/python/py/piccle.py ${csvfile}
#done
#rm *LFP.pikle

for picklefile in ${FILE}
do
    python ${POINT}/sbc/python/py/spectrogram/400s-comparison.py ${picklefile}
done

