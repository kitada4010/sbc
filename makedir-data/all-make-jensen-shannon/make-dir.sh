#!/bin/bash

#概要
#divergence.txt divergenceの計算結果を出力
#data-ab.txt 
#CONDUCT : divergence の計算

#パス指定
#自宅pc
LABELDATAPATH="/home/nodoka/win/ubuntu/01-data"
PYTHON="/home/nodoka/.pyenv/shims/python"
#FREQLDATAPATH="/home/nodoka/win/ubuntu/123ms-data"
#大学計算機サーバ
#LABELDATAPATH="/st9/b009vb/01data"
#PYTHON="/usr/local/anaconda3/bin/python3.6"

#プログラムの指定
PROG="/sbc/python/py/pattern/jensen-shannon-2.1.py"

#パラメータの範囲指定
TIME_RANGE_S="1"
TIME_RANGE_E="101"
PATTERN_RANGE_S="1"
PATTERN_RANGE_E="51"
SKIP="1"
TOP_PATTERN="20"
#入力ファイル指定 2:経験前, 3:経験後0~10分間, 4:経験後10~20分間, 5:経験後20~30分間
EP_B="2"
EP_A="3"



[ -d okiba ] || mkdir okiba
# 結果まとめ出力先設定
#cp texhead.tex graph.tex
#cp texhead.tex top-com-probability.tex

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
#divergence の計算
#<<CONDUCT 
    while read indivi
    do
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
            echo $PYTHON $HOME$PROG  $LABELDATAPATH/${file%.*}/${indivi}/${indivi%-*}-${file%-*}-${indivi##*H}$EP_A.xlsx  $LABELDATAPATH/${file%.*}/${indivi}/${indivi%-*}-${file%-*}-${indivi##*H}$EP_B.xlsx $i $i $PATTERN_RANGE_S  $PATTERN_RANGE_E $SKIP $TOP_PATTERN >> jikkou.txt
	done
	rsync ./okiba/Makefile $episodehz/$indivi/
	cat shell-head.txt jikkou.txt > $episodehz/$indivi/conduct.sh
	chmod +x $episodehz/$indivi/conduct.sh
	make conduct -C $episodehz/$indivi/	
#CONDUCT
	
	

#GNUPLOT

       # kullback値が上位である組み合わせの表を作成
<<SORT
        echo $episodehz/$indivi
	sort -r -g -k 3,3 $episodehz/$indivi/kullback-t${TIME_RANGE_S}${TIME_RANGE_E}p${PATTERN_RANGE_S}${PATTERN_RANGE_E}s${SKIP}.txt |head > $episodehz/$indivi/top-table.txt
	$HOME/sbc/tex/change-tex-tabular.sh $episodehz/$indivi/top-table.txt
	echo 
SORT

	
# kullback値が上位である組み合わせの図まとめたファイルを作成
<<SORT_GRAPH
	com=$(sort -r -g -k 3,3 $episodehz/$indivi/divergence.txt |head -n 1)
	com=${com% *}
	#echo ${com/ /-}.png
	echo \\begin{figure}[htb] >> top-com-probability.tex
	echo \\centering >> top-com-probability.tex
	echo \\caption{${episodehz%-*}-$indivi} >> top-com-probability.tex
        echo \\includegraphics[width=14cm]{$episodehz/$indivi/${com/ /-}.png} >> top-com-probability.tex
	echo \\end{figure} >> top-com-probability.tex
	echo >> top-com-probability.tex
	echo >> top-com-probability.tex
SORT_GRAPH


# 画像をまとめたtexファイルを作成
<<GRAPH
        
        echo \\begin{figure}[htb] >> graph.tex
	echo \\centering >> graph.tex
	echo \\caption{${episodehz%-*}-$indivi} >> graph.tex
        echo \\includegraphics[width=14cm]{$episodehz/$indivi/$indivi-kullback.png} >> graph.tex
	echo \\end{figure} >> graph.tex
	echo >> graph.tex
	echo >> graph.tex
GRAPH

    done < $dir
    echo ${file%.*} "end"
    echo
done

#echo \\end{document} >> graph.tex
#echo \\end{document} >> top-com-probability.tex


<<COMP_GRAPH
platex graph.tex
platex graph.tex
dvipdfmx graph.dvi
COMP_GRAPH

<<COMP_PROBABILITY_GRAPH
platex top-com-probability.tex
platex top-com-probability.tex
dvipdfmx top-com-probability.dvi
COMP_PROBABILITY_GRAPH
