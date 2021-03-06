#!/bin/bash
dirs=`find ./individual/*.txt`
#自宅pc
#LABELDATAPATH="/home/nodoka/win/ubuntu/kuttuketime-label"
#FREQLDATAPATH="/home/nodoka/win/ubuntu/123ms-data"
#大学計算機サーバ
LABELDATAPATH="/st9/b009vb/01data"
PYTHON="/usr/local/anaconda3/bin/python3.6"
PROG="/sbc/python/py/pattern/jensen-shannon-2.0.py"
TIME_RANGE_S="1"
TIME_RANGE_E="30"
PATTERN_RANGE_S="1"
PATTERN_RANGE_E="20"
SKIP="1"
TOP_PATTERN="20"

EP_B="2"
EP_A="3"


[ -d okiba ] || mkdir okiba
# 結果まとめ出力先設定
cp texhead.tex graph.tex
cp texhead.tex top-com-probability.tex

for dir in $dirs;
do
    file=${dir##*/}
    echo ${file%.*}
    episodehz=${file%.*}
    [ -d $episodehz ] || mkdir $episodehz
    while read indivi
    do
	[ -d $episodehz/$inidivi ] || mkdir $episodehz/$indivi

	# kullbackの計算
#<<CONDUCT
        echo $PYTHON $HOME$PROG  $LABELDATAPATH/${file%.*}/${indivi}/${indivi%-*}-${file%-*}-${indivi##*H}$EP_A.xlsx  $LABELDATAPATH/${file%.*}/${indivi}/${indivi%-*}-${file%-*}-${indivi##*H}$EP_B.xlsx $TIME_RANGE_S $TIME_RANGE_E $PATTERN_RANGE_S  $PATTERN_RANGE_E $SKIP $TOP_PATTERN > jikkou.txt
	rsync ./okiba/Makefile $episodehz/$indivi/
	cat shell-head.txt jikkou.txt > $episodehz/$indivi/conduct.sh
	chmod +x $episodehz/$indivi/conduct.sh
	make conduct -C $episodehz/$indivi/	
#CONDUCT


	# gnuplotによるグラフの画像出力
#<<GNUPLOT
        echo set terminal png > plot.gp
	echo set output \"$indivi-kullback.png\" >> plot.gp
	echo set pm3d map >> plot.gp
	echo set xlabel \"time_leng \[ms\]\" >> plot.gp
	echo set ylabel \"pattern_leng\" >> plot.gp
	echo set cbrange\[0:0.85\] >> plot.gp
	#echo set cblabel \"Kullback-divergence\" >> plot.gp
	#echo unset cbtics >> plot.gp
	echo splot \"kullback-t${TIME_RANGE_S}${TIME_RANGE_E}p${PATTERN_RANGE_S}${PATTERN_RANGE_E}s${SKIP}.txt\" u \(\$1/25\):2:3 with pm3d title \"$indivi-kullback\">> plot.gp
	#echo set label 1 at graph 0.1,0.9 STATS_max_z >> plot.gp
	echo replot >> plot.gp
	echo set terminal x11 >> plot.gp

	rsync ./okiba/Makefile $episodehz/$indivi/
	rsync ./plot.gp $episodehz/$indivi/
	make plot -C $episodehz/$indivi/
	
#GNUPLOT

       # kullback値が上位である組み合わせの表を作成
<<SORT
        echo $episodehz/$indivi
	sort -r -g -k 3,3 $episodehz/$indivi/kullback-t${TIME_RANGE_S}${TIME_RANGE_E}p${PATTERN_RANGE_S}${PATTERN_RANGE_E}s${SKIP}.txt |head > $episodehz/$indivi/top-table.txt
	$HOME/sbc/tex/change-tex-tabular.sh $episodehz/$indivi/top-table.txt
	echo 
SORT

	
# kullback値が上位である組み合わせの図まとめたファイルを作成
#<<SORT_GRAPH
	com=$(sort -r -g -k 3,3 $episodehz/$indivi/kullback-t${TIME_RANGE_S}${TIME_RANGE_E}p${PATTERN_RANGE_S}${PATTERN_RANGE_E}s${SKIP}.txt |head -n 1)
	com=${com% *}
	#echo ${com/ /-}.png
	echo \\begin{figure}[htb] >> top-com-probability.tex
	echo \\centering >> top-com-probability.tex
	echo \\caption{${episodehz%-*}-$indivi} >> top-com-probability.tex
        echo \\includegraphics[width=14cm]{$episodehz/$indivi/${com/ /-}.png} >> top-com-probability.tex
	echo \\end{figure} >> top-com-probability.tex
	echo >> top-com-probability.tex
	echo >> top-com-probability.tex
#SORT_GRAPH


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

echo \\end{document} >> graph.tex
echo \\end{document} >> top-com-probability.tex


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
