#!/bin/bash
#POINT="/home2/nodoka"
#POINT=""
PYENVPY="/home/nodoka/.pyenv/shims/python"
KNN="/sbc/python/py/knn/"
#rm $2
#引数1 : エピソード
echo ${1%%label.csv} 
echo ${1%%label.csv}cut.csv
da=${1%%label.csv}cut.csv
#echo ${da}
if [ -e "${da}" ]; then
    echo 判定
fi
	