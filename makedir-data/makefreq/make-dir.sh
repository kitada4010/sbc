#!/bin/bash
dirs=`find ./individual/*.txt`
TIMEDATAPATH="/home/nodoka/win/ubuntu/kuttuketime-label"
TIMEDATAPATH="/st9/b009vb/data/kuttuketime-label"
#HZCUTS="3072"
#HZCUTL="2048"
HZCUT="1024"
STEPTIME="360"
MODE="freq"


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
		 echo ~/sbc/shell/group.sh ${file%-*} ${file%-*}-$line-$indivi-$MODE.csv >> jikkou.txt		 
		 
		 
		 
	     elif [ $MODE = "freq" ]; then    #周波数作成
		 echo ${episodehz##*-}
		 if [ ${episodehz##*-} = "25000" ]; then
		     range=$(( HZCUT * 3))
		     echo ~/sbc/shell/diff-samp-psnormalize.sh $TIMEDATAPATH/${file%-*}/${indivi%-*}${indivi##*H}/${indivi%-*}-${file%-*}-${indivi##*H}${line}_time_data.txt ${file%-*} $indivi $range $(( $STEPTIME / 4)) ${episodehz##*-} #> jikkou.txt
		 else
		     range=$(( HZCUT * 2))
		     echo ~/sbc/shell/diff-samp-psnormalize.sh $TIMEDATAPATH/${file%-*}/${indivi%-*}${indivi##*H}/${indivi%-*}-${file%-*}-${indivi##*H}${line}_time_data.txt ${file%-*} $indivi $range $(( $STEPTIME / 6)) ${episodehz##*-} #> jikkou.txt
		 fi
		 
	     
	     


		 echo ~/sbc/shell/group.sh ${file%-*}*pscut ${file%-*}-$line-$indivi-$MODE-pscut$range.csv >> jikkou.txt
		 echo ~/sbc/shell/group.sh ${file%-*}*150-highpass ${file%-*}-$line-$indivi-$MODE-150-highpass$range.csv >> jikkou.txt
		 echo ~/sbc/shell/group.sh ${file%-*}*150-nomalize ${file%-*}-$line-$indivi-$MODE-150-nomalize$range.csv >> jikkou.txt
		 echo ~/sbc/shell/group.sh ${file%-*}*all-nomalize ${file%-*}-$line-$indivi-$MODE-all-nomalize$range.csv >> jikkou.txt

	     
	     else
		 echo "not found mode"
	     fi
	     rsync ./okiba/Makefile  $episodehz/$line/$indivi/
	     cat shell-head.txt jikkou.txt > $episodehz/$line/$indivi/conduct.sh
	     chmod +x $episodehz/$line/$indivi/conduct.sh
#	     make -C $episodehz/$line/$indivi/
	     rsync $episodehz/$line/$indivi/${file%-*}-$line-$indivi-$MODE*.csv $episodehz/$line/

	     
	 done < $dir
	 if [ $MODE = "label" ]; then 	 #ラベル作成
	     echo ~/sbc/shell/group.sh  $MODE.csv ${file%-*}-$line-$MODE.csv > jikkou.txt     
	 elif [ $MODE = "freq" ]; then    #周波強度データのグループ化
	     echo ~/sbc/shell/group.sh  $MODE-pscut ${file%-*}-$line-$MODE-pscut.csv > jikkou.txt
	     echo ~/sbc/shell/group.sh  $MODE-150-highpass ${file%-*}-$line-$MODE-150-highpass.csv >> jikkou.txt 
	     echo ~/sbc/shell/group.sh  $MODE-150-nomalize ${file%-*}-$line-$MODE-150-nomalize.csv >> jikkou.txt 
	     echo ~/sbc/shell/group.sh  $MODE-all-nomalize ${file%-*}-$line-$MODE-all-nomalize.csv >> jikkou.txt 
	 fi
	 cat shell-head.txt jikkou.txt > $episodehz/$line/conduct.sh
	 rsync ./okiba/Makefile  $episodehz/$line/	 
	 chmod +x $episodehz/$line/conduct.sh
	 make -C $episodehz/$line/
	 rsync $episodehz/$line/${file%-*}-$line-$MODE*.csv $episodehz/
	 
     done < timing.txt
     if [ $MODE = "label" ]; then 	 #ラベル作成
	 echo ~/sbc/shell/group.sh -$MODE.csv $episodehz-$MODE.csv > jikkou.txt
     elif [ $MODE = "freq" ]; then    #周波強度データのグループ化
	 echo ~/sbc/shell/group.sh $MODE-pscut.csv $episodehz-$MODE-pscut.csv > jikkou.txt
	 echo ~/sbc/shell/group.sh $MODE-150-highpass.csv $episodehz-$MODE-150-highpass.csv >> jikkou.txt
	 echo ~/sbc/shell/group.sh $MODE-150-nomalize.csv $episodehz-$MODE-150-nomalize.csv >> jikkou.txt
	 echo ~/sbc/shell/group.sh $MODE-all-nomalize.csv $episodehz-$MODE-all-nomalize.csv >> jikkou.txt
     fi
     cat shell-head.txt jikkou.txt > $episodehz/conduct.sh
     chmod +x $episodehz/conduct.sh
     rsync ./okiba/Makefile  $episodehz/
     make -C $episodehz/
     rsync $episodehz/$episodehz-$MODE*.csv ./
     
done

