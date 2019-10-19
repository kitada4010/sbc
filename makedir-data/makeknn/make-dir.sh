#!/bin/bash
dirs=`find ./individual/*.txt`
#LABELDATAPATH="/home/nodoka/win/ubuntu/kuttuketime-label"
LABELDATAPATH="/st9/b009vb/data/kuttuketime-label"
FREQLDATAPATH="/home/nodoka/win/ubuntu/123ms-data"
FREQLDATAPATH="/st9/b009vb/analysis/123ms-data"
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
	 do
	     
	     if [ ${episodehz##*-} = "25000" ]; then
		 range=$(( HZCUT * 3))
	     else
		 range=$(( HZCUT * 2))
	     fi

	     echo $LABELDATAPATH/${file%-*}-$line-$indivi-label$range.csv 
	     echo $FREQLDATAPATH/${file%-*}-$line-$indivi-freq-pscut$range.csv 
	     echo $FREQLDATAPATH/${file%-*}-$line-$indivi-freq-150-highpass$range.csv 
	     echo $FREQLDATAPATH/${file%-*}-$line-$indivi-freq-all-nomalize$range.csv 
	     echo $FREQLDATAPATH/${file%-*}-$line-$indivi-freq-150-nomalize$range.csv 
	     echo
	     echo ${file%-*}-$line-$indivi-$MODE.csv 
	     
	     
	     echo $MODE.csv ${file%-*}-$line-$MODE.csv 
	 done < $dir

	 echo ${file%-*}-$line-$MODE.csv #>> jikkou.txt
	 
     done < timing.txt

     
done

