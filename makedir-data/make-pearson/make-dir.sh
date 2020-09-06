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
PROG="/sbc/python/py/pattern/pearson-2.2.py"
PLOT_PROG="/sbc/python/py/pattern/plot_probability.py"

#パラメータの範囲指定
TIME_RANGE_S="1"
TIME_RANGE_E="101"
PATTERN_RANGE_S="1"
PATTERN_RANGE_E="51"
SKIP="1"
TABLE_NUM="10"
TOP_PRINT="20"
GNUPLOT_MIN="0"
GNUPLOT_MAX="0.85"
GNUPLOT_TITLE="kullback"

#入力ファイル指定 2:経験前, 3:経験後0~10分間, 4:経験後10~20分間, 5:経験後20~30分間
EP_B="2"
EP_A="3"



[ -d okiba ] || mkdir okiba
# 結果まとめ出力先設定
#cp texhead.tex graph.tex
#cp texhead.tex top-com-probability.tex
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
#divergence の計算
<<CONDUCT 
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
CONDUCT

# divergence の分布図を作成	
<<GNUPLOT
        echo set terminal png > plot.gp
	echo set output \"$indivi-kullback.png\" >> plot.gp
	echo set pm3d map >> plot.gp
	echo set xlabel \"time_leng \[ms\]\" >> plot.gp
	echo set ylabel \"pattern_leng\" >> plot.gp
	echo set cbrange\[$GNUPLOT_MIN:$GNUPLOT_MAX\] >> plot.gp
	#echo set cblabel \"Kullback-divergence\" >> plot.gp
	#echo unset cbtics >> plot.gp
	echo splot \"divergence.txt\" u \(\$1/25\):2:3 with pm3d title \"$indivi-$GNUPLOT_TITLE\">> plot.gp
	#echo set label 1 at graph 0.1,0.9 STATS_max_z >> plot.gp
	echo replot >> plot.gp
	echo set terminal x11 >> plot.gp

	rsync ./okiba/Makefile $episodehz/$indivi/
	rsync ./plot.gp $episodehz/$indivi/
	make plot -C $episodehz/$indivi/
GNUPLOT


# kullback値が上位である組み合わせの表を作成
<<SORT
        echo $episodehz/$indivi
	sort -r -g -k 3,3 $episodehz/$indivi/divergence.txt |head -n $TABLE_NUM > $episodehz/$indivi/top-table.txt
	$HOME/sbc/c/change-table $episodehz/$indivi/top-table.txt $episodehz/$indivi/top-table-display.txt
	[ -f table.txt ] && rm table.txt
	rsync ./okiba/Makefile $episodehz/$indivi/
	echo $HOME/sbc/tex/change-tex-tabular.sh top-table-display.txt > table.txt
	cat shell-head.txt table.txt  > $episodehz/$indivi/table.sh
	make table -C $episodehz/$indivi/
	echo 
SORT


#	sort -r -g -k 3,3 $episodehz/$indivi/divergence.txt |head -n 1 >> top-table.txt


# divergence が上位である組み合わせの表をまとめたファイルを作成
<<SORT_TABLE
	com=$(sort -r -g -k 3,3 $episodehz/$indivi/divergence.txt |head -n 1)
	com=${com% *}
	#echo ${com/ /-}.png
	echo \\begin{table}[htb] >> top-com-table.tex
	echo \\centering >> top-com-table.tex
	echo \\caption{${episodehz%-*}-$indivi} >> top-com-table.tex
        echo \\input{$episodehz/$indivi/top-table.tex} >> top-com-table.tex
	echo \\end{table} >> top-com-table.tex
	echo >> top-com-table.tex
	echo >> top-com-table.tex
SORT_TABLE




# divergence が上位である組み合わせの確率分布図を作成
<<DIVERGENCE_SORT
        com=$(sort -r -g -k 3,3 $episodehz/$indivi/divergence.txt |head -n 1)
	com=${com% *}
	grep -E "^${com/ /,}," $episodehz/$indivi/count_data.csv > top-com-probability.csv
	$PYTHON $HOME/$PLOT_PROG top-com-probability.csv $TOP_PRINT
	mv ${com/ /-}.png $episodehz/$indivi/
	mv top-com-probability.csv $episodehz/$indivi/
DIVERGENCE_SORT


# divergence が上位である組み合わせの確率分布図をまとめたファイルを作成
<<SORT_GRAPH
	com=$(sort -r -g -k 3,3 $episodehz/$indivi/divergence.txt |head -n 1)
	com=${com% *}
	grep -E "^$com " $episodehz/$indivi/count.txt | cat -n > gg.txt
	echo 
	#echo ${com/ /-}.png
	echo \\begin{figure}[htb] >> top-com-probability.tex
	echo \\centering >> top-com-probability.tex
	echo \\caption{${episodehz%-*}-$indivi} >> top-com-probability.tex
        echo \\includegraphics[width=14cm]{$episodehz/$indivi/${com/ /-}.png} >> top-com-probability.tex
	echo \\end{figure} >> top-com-probability.tex
	echo >> top-com-probability.tex
	echo >> top-com-probability.tex
SORT_GRAPH



# 分布の画像をまとめたtexファイルを作成
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

#$HOME/sbc/c/change-table top-table.txt top-table-display.txt
#$HOME/sbc/tex/change-tex-tabular.sh top-table-display.txt > top-table-display.tex

<<COMP_TABLE
#最初のコンパイル時には1行目が必要
echo \\end{document} >> top-com-table.tex
platex top-com-table.tex
platex top-com-table.tex
dvipdfmx top-com-table.dvi
COMP_TABLE


<<COMP_GRAPH
#最初のコンパイル時には1行目が必要
echo \\end{document} >> graph.tex
platex graph.tex
platex graph.tex
dvipdfmx graph.dvi
COMP_GRAPH

<<COMP_PROBABILITY_GRAPH
#最初のコンパイル時には1行目が必要
echo \\end{document} >> top-com-probability.tex
platex top-com-probability.tex
platex top-com-probability.tex
dvipdfmx top-com-probability.dvi
COMP_PROBABILITY_GRAPH
