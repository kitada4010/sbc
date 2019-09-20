#!/bin/bash
#POINT="/home2/nodoka"
#引数1 ファイル名(.txt)
POINT="/home/nodoka"
PYENVPY="/home/nodoka/.pyenv/shims/python"

while read line
do
    ${PYENVPY} ${POINT}/sbc/python/py/knn/psdatacut.py  $line
    cut -f 150- -d "," B39-${line/[	]/-}-pscut.csv >  B39-${line/[	]/-}-150-highpass.csv
    ${PYENVPY} ${POINT}/sbc/python/py/knn/normalize.py $line all B39-${line/[	]/-}-pscut.csv
    ${PYENVPY} ${POINT}/sbc/python/py/knn/normalize.py $line 150 B39-${line/[	]/-}-150-highpass.csv 
done < $1
