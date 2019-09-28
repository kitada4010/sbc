#!/bin/bash
dirs=`find ./individual/*.txt`
TIMEDATAPATH="/home/nodoka/win/ubuntu/new-time-label"
#HZCUTS="3072"
#HZCUTL="2048"
HZCUT="1024"
STEPTIME="360"


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
	     
	     #ラベル作成
#	     echo ~/sbc/shell/or-hz-label.sh $TIMEDATAPATH/${file%-*}/${indivi%-*}${indivi##*H}/${indivi%-*}-${file%-*}-${indivi##*H}${line}_label_data.txt  1  ${file%-*}-$indivi $STEPTIME #> jikkou.txt
	     
	     echo 

	     #周波数作成
	     echo ${episodehz##*-}
	     if [ ${episodehz##*-} = "25000" ]; then
		 echo ~/sbc/shell/diff-samp-psnormalize.sh $TIMEDATAPATH/${file%-*}/${indivi%-*}${indivi##*H}/${indivi%-*}-${file%-*}-${indivi##*H}${line}_time_data.txt ${file%-*} $indivi $(( HZCUT * 3)) $(( $STEPTIME / 4)) ${episodehz##*-} #> jikkou.txt
	     else
		 echo ~/sbc/shell/diff-samp-psnormalize.sh $TIMEDATAPATH/${file%-*}/${indivi%-*}${indivi##*H}/${indivi%-*}-${file%-*}-${indivi##*H}${line}_time_data.txt ${file%-*} $indivi $(( HZCUT * 2)) $(( $STEPTIME / 6)) ${episodehz##*-} #> jikkou.txt
	     fi

	     echo ~/sbc/shell/group.sh ${file%-*}  >> jikkou.txt
 #	    cat shell-head.txt jikkou.txt > okiba/conduct.sh
#	     make -C okiba
	     
	     #できたファイルの移動
	     rsync ./okiba/Makefile  $episodehz/$line/$indivi/
	     mvfiles=`find ./okiba/* -not -name 'Makefile' `
	     for mvfile in $mvfiles;
	     do
		 mv $mvfile $episodehz/$line/$indivi/
	     done
	     

	 done < $dir
     done < timing.txt
done

