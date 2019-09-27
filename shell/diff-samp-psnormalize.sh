#!/bin/bash
#POINT="/home2/nodoka"
#引数1 ファイル名(.txt)
#引数2 エピソード
#引数3 個体番号-(HR or HL)
#引数4 : 区切るデータ数(N) range
#引数5 : 飛ばすデータ数(s) 例) 25000 : 90 | 16666.666016 : 60
#引数6 : サンプリング周波数

POINT="/home/nodoka"
PYENVPY="/home/nodoka/.pyenv/shims/python"

while read line
do
    ${PYENVPY} ${POINT}/sbc/python/py/knn/diffsmpdatacut.py  $line  $2  $3 $4 $5 $6
    cut -f 150- -d "," $2-$3-${line/[	]/-}-pscut.csv >  $2-$3-${line/[	]/-}-150-highpass.csv
    ${PYENVPY} ${POINT}/sbc/python/py/knn/normalize.py $line all $2-$3-${line/[	]/-}-pscut.csv  $2 $3
    ${PYENVPY} ${POINT}/sbc/python/py/knn/normalize.py $line 150 $2-$3-${line/[	]/-}-150-highpass.csv $2 $3 
done < $1
