#!/bin/bash

#概要
#divergence.txt divergenceの計算結果を出力
#data-ab.txt 
#CONDUCT : divergence の計算

#パス指定
#自宅pc
READPATH="/home/nodoka/win/ubuntu/01-data/"
WRITEPATH=$(cd $(dirname $0);pwd)
WRITEPATH=$WRITEPATH/
PYTHON="/home/nodoka/.pyenv/shims/python"
#FREQLDATAPATH="/home/nodoka/win/ubuntu/123ms-data"
#大学計算機サーバ
#READPATH="/st9/b009vb/01data"
#PYTHON="/usr/local/anaconda3/bin/python3.6"

#プログラムの指定
PROG="/sbc/python/py/change-xlsx/change-newtype.py"

#パラメータの範囲指定
TIMING="5"



[ -d okiba ] || mkdir okiba
# 結果まとめ出力先設定
#cp texhead.tex graph.tex
#cp texhead.tex top-com-probability.tex
#cp texhead.tex top-com-probability-divergence.tex
#cp texhead.tex top-com-num.tex
#cp texhead.tex top-com-after-hist.tex
#cp texhead.tex top-com-before-hist.tex
#cp texhead.tex top-com-table.tex
#[ -f top-table.txt ] && rm top-table.txt

#検索をかける個体を読み込み
#ファイル名:経験とサンプリング周波数
#ファイル内容:個体
dirs=`find ./individual/*.txt`
for dir in $dirs;
do
    file=${dir##*/}
    echo ${file%.*}
    episodehz=${file%.*}
    [ -d $episodehz ] || mkdir $episodehz
    while read indivi
    do
#変換
#<<CONDUCT 
	[ -d $episodehz/$indivi ] || mkdir $episodehz/$indivi
	[ -f jikkou.txt ] && rm jikkou.txt
	#divergence.txt を削除
#	[ -f $episodehz/$indivi/divergence.txt ] && rm $episodehz/$indivi/divergence.txt
#	[ -f $episodehz/$indivi/data-ab.txt ] && rm $episodehz/$indivi/data-ab.txt
#	[ -f $episodehz/$indivi/count-data.txt ] && rm $episodehz/$indivi/count-data.txt 
	#divergence-old.txt があれば置き換え
	#[ -f $episodehz/$indivi/divergence.txt ] && mv $episodehz/$indivi/divergence.txt  $episode/$indivi/divergence-old.txt
	#[ -f $episodehz/$indivi/data-ab.txt ] && mv $episodehz/$indivi/data-ab.txt  $episode/$indivi/data-ab-old.txt
	#divergence-old.txt を削除
	#[ -f $episodehz/$indivi/divergence-old.txt ] && rm $episodehz/$indivi/divergence-old.txt
	#[ -f $episodehz/$indivi/data-ab-old.txt ] && rm $episodehz/$indivi/data-ab-old.txt  
	#conduct.sh(実行文をまとめたシェルスクリプト)の作成
	for ((i=2; i<=TIMING; i+=1))
	do
	    # 実行文の出力
            echo $PYTHON $HOME$PROG  $READPATH $WRITEPATH ${file%.*}/${indivi}/ ${indivi%-*}-${file%-*}-${indivi##*H}$i.xlsx >> jikkou.txt
	done
	rsync ./okiba/Makefile $episodehz/$indivi/
	cat shell-head.txt jikkou.txt > $episodehz/$indivi/conduct.sh
	chmod +x $episodehz/$indivi/conduct.sh
	make conduct -C $episodehz/$indivi/	
#CONDUCT
    done< $dir
    echo ${file%.*} "end"
    echo
done
