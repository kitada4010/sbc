#!/bin/bash
#POINT="/home2/nodoka"
#POINT=""
PYENVPY="/home/nodoka/.pyenv/shims/python"
KNN="/sbc/python/py/knn/"
#rm $2
#引数1 : エピソード
for line in *$1*; do
    if [ ! -e "${line%%${1}.csv}$2.csv" ]; then
	rm ${line%%${1}.csv}*
    fi
done