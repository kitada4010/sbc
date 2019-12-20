#!/bin/bash
dirs=`find ./individual/*.txt`
#自宅pc
#LABELDATAPATH="/home/nodoka/win/ubuntu/kuttuketime-label"
#FREQLDATAPATH="/home/nodoka/win/ubuntu/123ms-data"
#大学計算機サーバ
LABELDATAPATH="/st9/b009vb/01data"
PYTHON="/usr/local/anaconda3/bin/python3.6"


[ -d okiba ] || mkdir okiba

for dir in $dirs;
do
    file=${dir##*/}
    echo ${file%.*}
    episodehz=${file%.*}
    [ -d $episodehz ] || mkdir $episodehz
    while read indivi
    do
	[ -d $episodehz/$inidivi ] || mkdir $episodehz/$indivi
	echo $PYTHON $HOME/sbc/python/py/pattern/step-para-data-leng.py  $LABELDATAPATH/${file%.*}/${indivi}/${indivi%-*}-${file%-*}-${indivi##*H}3.xlsx  $LABELDATAPATH/${file%.*}/${indivi}/${indivi%-*}-${file%-*}-${indivi##*H}2.xlsx 1 101 1  101 5 > jikkou.txt
	


	# gnuplotによるグラフの画像出力
<<GNUPLOT
	echo set terminal png > plot.gp
	echo set output \"$indivi-kullback.png\" >> plot.gp
	echo set pm3d map >> plot.gp
	echo set xlabel \"time_leng \[ms\]\" >> plot.gp
	echo set ylabel \"pattern_leng\" >> plot.gp
	#echo set cblabel \"Kullback-divergence\" >> plot.gp
	#echo unset cbtics >> plot.gp
	echo splot \"kullback-t1101p1101s5.txt\" u \(\$1/25\):2:3 with pm3d title \"$indivi-kullback\">> plot.gp
	#echo set label 1 at graph 0.1,0.9 STATS_max_z >> plot.gp
	echo replot >> plot.gp
	echo set terminal x11 >> plot.gp

	cp ./okiba/Makefile $episodehz/$indivi/
	cp ./plot.gp $episodehz/$indivi/
GNUPLOT
	
	rsync ./okiba/Makefile $episodehz/$indivi/
	cat shell-head.txt jikkou.txt > $episodehz/$indivi/conduct.sh
	chmod +x $episodehz/$indivi/conduct.sh
	make -C $episodehz/$indivi/
    done < $dir
    echo ${file%.*} "end"
done

