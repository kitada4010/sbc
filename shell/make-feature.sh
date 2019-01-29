#!/bin/bash
#POINT="/home2/nodoka"
#POINT=""
PYENVPY="/home/nodoka/.pyenv/shims/python"
KNN="/sbc/python/py/knn/"
#rm $2
#引数1 : エピソード


#while read line
for line in *time*; do

    while read timedata
    do
	#filename=line
	${PYENVPY} $HOME${KNN}datacut.py $timedata $1 ${line:0:3}-H${line:3:1} 
	${PYENVPY} $HOME${KNN}psdatacut.py $timedata $1 ${line:0:3}-H${line:3:1}
cut -f 150- -d "," $1-${line:0:3}-H${line:3:1}-${timedata/[ 	][	  ]*/-}-cut.csv | tee  $1-${line:0:3}-H${line3:1}-${timedata/[ 	][	 ]*/-}-150-highpass.csv
	cut -f 150- -d "," $1-${line:0:3}-H${line:3:1}-${timedata/[ 	][	 ]*/-}-pscut.csv | tee  $1-${line:0:3}-H${line:3:1}-${timedata/[ 	][	 ]*/-}-150-pshighpass.csv
	${PYENVPY} $HOME${KNN}normalize.py $timedata 150 $1-${line:0:3}-H${line:3:1}-${timedata/[ 	][	 ]*/-}-150-highpass.csv $1 ${line:0:3}-H${line:3:1} 
	${PYENVPY} $HOME${KNN}normalize.py $timedata 150 $1-${line:0:3}-H${line:3:1}-${timedata/[ 	][	 ]*/-}-ps150-highpass.csv $1 ${line:0:3}-H${line:3:1}ps 
    done < ${line}

done
