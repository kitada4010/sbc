#!/bin/bash

#概要
#divergence.txt divergenceの計算結果を出力
#data-ab.txt 
#CONDUCT : divergence の計算

#パス指定
#自宅pc
export LABELDATAPATH="/home/nodoka/win/ubuntu/01-data"
export PYTHON="/home/nodoka/.pyenv/shims/python"
#export FREQLDATAPATH="/home/nodoka/win/ubuntu/123ms-data"
#大学計算機サーバ
#export LABELDATAPATH="/st9/b009vb/01data"
#export PYTHON="/usr/local/anaconda3/bin/python3.6"

#プログラムの指定
export PROG="/sbc/python/py/pattern/jensen-shannon-2.2.py"
export PLOT_PROG="/sbc/python/py/pattern/plot_probability.py"

#パラメータの範囲指定
export TIME_RANGE_S="1"
export TIME_RANGE_E="101"
export PATTERN_RANGE_S="1"
export PATTERN_RANGE_E="51"
export SKIP="1"
export TABLE_NUM="10"
export TOP_PRINT="20"
export GNUPLOT_MIN="0"
export GNUPLOT_MAX="0.85"
export GNUPLOT_TITLE="kullback"

#入力ファイル指定 2:経験前, 3:経験後0~10分間, 4:経験後10~20分間, 5:経験後20~30分間
export EP_B="2"
export EP_A="3"




[ -d okiba ] || mkdir okiba
# 結果まとめ出力先設定
#cp texhead.tex graph.tex
#cp texhead.tex top-com-probability.tex
#cp texhead.tex top-com-table.tex


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
    export dir
    export file
    export episodehz
    while read indivi
    do
	export indivi
	tamesi.sh
	#divergence の計算
	#./okiba/conduct.sh

	# divergence の分布図を作成
	#./okiba/gnuplot.sh

	#kullback値が上位である組み合わせの表を作成
	#./okiba/sort.sh

	# divergence が上位である組み合わせの表をまとめたファイルを作成
	#./okiba/sort-table.sh

	# divergence が上位である組み合わせの確率分布図を作成
	#./okiba/divergence-sort.sh

	# divergence が上位である組み合わせの確率分布図をまとめたファイルを作成
	#./okiba/sort-graph.sh

	# 分布の画像をまとめたtexファイルを作成
	#./okiba/graph.sh

    done < $dir
    echo ${file%.*} "end"
    echo
done



# divergence が上位である組み合わせの表をまとめたファイルのコンパイル
#./okiba/comp-table.sh


# divergence の分布図をまとめたファイルのコンパイル
#./okiba/comp-graph.sh


# divergence が上位である組み合わせの確率分布をまとめたファイルのコンパイル
#./okiba/comp-probability-graph.sh
