#!/bin/bash
#POINT="/home2/nodoka"
POINT="/home/nodoka"
PYENVPY="/home/nodoka/.pyenv/shims/python"

while read line
do
    ${PYENVPY} ${POINT}/sbc/python/py/knn/datacut.py  $line
    cut -f 150- -d "," B39-${line/[	]/-}-cut.csv >  B39-${line/[	]/-}-150-highpass.csv
    ${PYENVPY} ${POINT}/sbc/python/py/knn/normalize.py $line all B39-${line/[	]/-}-cut.csv
    ${PYENVPY} ${POINT}/sbc/python/py/knn/normalize.py $line 150 B39-${line/[	]/-}-150-highpass.csv 
done < $1
