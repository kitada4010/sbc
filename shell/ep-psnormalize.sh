#!/bin/bash
#POINT="/home2/nodoka"
#引数1 ファイル名(.txt)
#引数2 エピソード
#引数3 個体番号-(HR or HL)


POINT="/home/nodoka"
PYENVPY="/home/nodoka/.pyenv/shims/python"

while read line
do
    ${PYENVPY} ${POINT}/sbc/python/py/knn/psdatacut.py  $line  $2  $3
    cut -f 150- -d "," $2-$3-${line/[	]/-}-pscut.csv >  $2-$3-${line/[	]/-}-150-highpass.csv
    ${PYENVPY} ${POINT}/sbc/python/py/knn/normalize.py $line all $2-$3-${line/[	]/-}-pscut.csv  $2 $3
    ${PYENVPY} ${POINT}/sbc/python/py/knn/normalize.py $line 150 $2-$3-${line/[	]/-}-150-highpass.csv $2 $3 
done < $1
