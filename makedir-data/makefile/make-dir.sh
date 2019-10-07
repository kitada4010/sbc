#!/bin/bash
dirs=`find ./individual/*.txt`
TIMEDATAPATH="/home/nodoka/win/ubuntu/kuttuketime-label"
#HZCUTS="3072"
#HZCUTL="2048"
HZCUT="1024"
STEPTIME="360"
MODE="label"


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
	     [ -d $episodehz/$line/$inidivi ] || mkdir $episodehz/$line/$indivi
	     
	     #それぞれのファイルで実行したいシェルスクリプトの記入 jikkou.txtに実行コマンドを書き込んでいく
	     


	     if [ $MODE = "label" ]; then 	 #ラベル作成
		 echo ~/sbc/shell/or-hz-label.sh $TIMEDATAPATH/${file%-*}/${indivi%-*}${indivi##*H}/${indivi%-*}-${file%-*}-${indivi##*H}${line}_label_data.txt  1  ${file%-*}-$indivi $STEPTIME > jikkou.txt
		 
		 
		 
		 
	     elif [ $MODE = "freq" ]; then    #周波数作成
		 echo ${episodehz##*-}
		 if [ ${episodehz##*-} = "25000" ]; then
		     echo ~/sbc/shell/diff-samp-psnormalize.sh $TIMEDATAPATH/${file%-*}/${indivi%-*}${indivi##*H}/${indivi%-*}-${file%-*}-${indivi##*H}${line}_time_data.txt ${file%-*} $indivi $(( HZCUT * 3)) $(( $STEPTIME / 4)) ${episodehz##*-} > jikkou.txt
		 else
		     echo ~/sbc/shell/diff-samp-psnormalize.sh $TIMEDATAPATH/${file%-*}/${indivi%-*}${indivi##*H}/${indivi%-*}-${file%-*}-${indivi##*H}${line}_time_data.txt ${file%-*} $indivi $(( HZCUT * 2)) $(( $STEPTIME / 6)) ${episodehz##*-} > jikkou.txt
		 fi
		 
	     else
		 echo "not found mode"
	     fi
	     
	     


	     echo ~/sbc/shell/group.sh ${file%-*} ${file%-*}-$line-$indivi-$MODE.csv >> jikkou.txt
	     rsync ./okiba/Makefile  $episodehz/$line/$indivi/
	     cat shell-head.txt jikkou.txt > $episodehz/$line/$indivi/conduct.sh
	     chmod +x $episodehz/$line/$indivi/conduct.sh
	     make -C $episodehz/$line/$indivi/
	     rsync $episodehz/$line/$indivi/${file%-*}-$line-$indivi-$MODE.csv $episodehz/$line/
	     
	     	     	     	     
	 done < $dir
	 echo ~/sbc/shell/group.sh  $MODE.csv ${file%-*}-$line-$MODE.csv > jikkou.txt     
	 cat shell-head.txt jikkou.txt > $episodehz/$line/$indivi/conduct.sh
	 rsync ./okiba/Makefile  $episodehz/$line/
	 make -C $episodehz/$line/
	 rsync $episodehz/$line/${file%-*}-$line-$indivi$MODE.csv $episodehz/
	 
     done < timing.txt
     
     
done

