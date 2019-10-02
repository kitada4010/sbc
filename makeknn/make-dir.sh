#!/bin/bash
dirs=`find ./individual/*.txt`
LABELDATAPATH="/tamesijikkou"
FREQLDATAPATH="/home/nodoka/win/ubuntu/123ms-data"
#HZCUTS="3072"
#HZCUTL="2048"
HZCUT="1024"
STEPTIME="360"
MODE="knn"


[ -d okiba ] || mkdir okiba

for dir in $dirs;
do
    file=${dir##*/}
    echo ${file%.*}
    episodehz=${file%.*}
    [ -d $episodehz ] || mkdir $episodehz
     while read line
     do
	 [ -d $episodehz/$line ] || mkdir $episodehz/$line
	 while read indivi
	 echo ~/sbc 
	 echo $LABELDATAPATH/${file%-*}-$line-$indivi-label.csv 
	 echo $FREQLDATAPATH/${file%-*}-$line-$indivi-freq.csv 
	 

	 echo ${file%-*}-$line-$indivi-$MODE.csv 


	 echo $MODE.csv ${file%-*}-$line-$MODE.csv 
	 
	 
     done < timing.txt
     ${file%-*}-$line-$indivi-$MODE.csv #>> jikkou.txt
     
done

