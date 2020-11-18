#!/bin/bash

[ -d $episodehz/$indivi ] || mkdir $episodehz/$indivi
[ -f jikkou.txt ] && rm jikkou.txt
#divergence.txt を削除
[ -f $episodehz/$indivi/divergence.txt ] && rm $episodehz/$indivi/divergence.txt
[ -f $episodehz/$indivi/data-ab.txt ] && rm $episodehz/$indivi/data-ab.txt
[ -f $episodehz/$indivi/count-data.txt ] && rm $episodehz/$indivi/count-data.txt 
#divergence-old.txt があれば置き換え
#[ -f $episodehz/$indivi/divergence.txt ] && mv $episodehz/$indivi/divergence.txt  $episode/$indivi/divergence-old.txt
#[ -f $episodehz/$indivi/data-ab.txt ] && mv $episodehz/$indivi/data-ab.txt  $episode/$indivi/data-ab-old.txt
#divergence-old.txt を削除
#[ -f $episodehz/$indivi/divergence-old.txt ] && rm $episodehz/$indivi/divergence-old.txt
#[ -f $episodehz/$indivi/data-ab-old.txt ] && rm $episodehz/$indivi/data-ab-old.txt  
#conduct.sh(実行文をまとめたシェルスクリプト)の作成
for ((i=1; i<TIME_RANGE_E; i+=SKIP))
do
    # 実行文の出力
    echo $PYTHON $HOME$PROG  $LABELDATAPATH/${file%.*}/${indivi}/${indivi%-*}-${file%-*}-${indivi##*H}$EP_A.xlsx  $LABELDATAPATH/${file%.*}/${indivi}/${indivi%-*}-${file%-*}-${indivi##*H}$EP_B.xlsx $i $i $PATTERN_RANGE_S  $PATTERN_RANGE_E $SKIP >> jikkou.txt
done
rsync ./okiba/Makefile $episodehz/$indivi/
cat shell-head.txt jikkou.txt > $episodehz/$indivi/conduct.sh
chmod +x $episodehz/$indivi/conduct.sh
make conduct -C $episodehz/$indivi/	
