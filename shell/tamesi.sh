#!/bin/bash
#POINT="/home2/nodoka"
#POINT=""
PYENVPY="/home/nodoka/.pyenv/shims/python"
KNN="/sbc/python/py/knn/"
#rm $2
#引数1 : エピソード
echo ${1%%label.csv} 
echo ${1%%label.csv}cut.csv
if[ ${1%%label.csv}cut.csv = "$2" ];then
    echo 判定
fi
	