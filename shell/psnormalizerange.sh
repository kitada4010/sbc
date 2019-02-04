#!/bin/bash
#POINT="/home2/nodoka"
POINT="/home/nodoka"
PYENVPY="/home/nodoka/.pyenv/shims/python"

KNN="/sbc/python/py/knn/"
#引数1 : エピソード
#$2 : データ数2
#$3 : 文字列

if [ "$1" != "restraint" ] && [ "$1" != "male" ] && [ "$1" != "female" ] && [ "$1" != "object" ]; then
    echo HOWTO
    echo $0 episode data_range \(string\)
    echo episode is restraint, male, female or object.
    echo data_range is data of range (int).
    echo \(string\) is pattern. \(if necessary\)
    exit 0
fi
if [ "$2" == "" ]; then
    echo HOWTO
    echo $0 episode data_range \(string\)
    echo episode is restraint, male, female or object.
    echo data_range is data of range (int).
    echo \(string\) is pattern. \(if necessary\)
    exit 0
fi

if [ "$3" = "" ]; then
    filetype=time
else
    filetype=$3
fi

for line in *$filetype*; do
    filename=$line
    while read timedata
    do
	${PYENVPY} ${POINT}/sbc/python/py/knn/psdatacutrange.py  $timedata $2
	cut -f 150- -d "," B39-${timedata/[	]/-}-pscut$2.csv >  B39-${timedata/[	]/-}-150-highpass$2.csv
	#${PYENVPY} ${POINT}/sbc/python/py/knn/normalize.py $timedata all B39-${timedata/[	]/-}-pscut$2.csv
	${PYENVPY} ${POINT}/sbc/python/py/knn/normalize.py $timedata 150-$2 B39-${timedata/[	]/-}-150-highpass$2.csv 
    done < ${filename}
done
