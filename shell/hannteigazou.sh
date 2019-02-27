#!/bin/bash
#POINT="/home2/nodoka"
#POINT=""
PYENVPY="/home/nodoka/.pyenv/shims/python"
SBC="/sbc"
#rm $2
#引数1 : エピソード
#引数2 : 学習したデータ
#引数3 : テストしたいデータ形式
#引数4 : テストしたい時間が入ったファイル名


if [ "$1" != "restraint" ] && [ "$1" != "male" ] && [ "$1" != "female" ] && [ "$1" != "object" ]; then
    echo HOWTO
    echo $0 episode data_of_pickle fomat_prog \(string\)
    echo episode is restraint, male, female or object.
    echo format_prog is spec or wave.
    echo \(string\) is pattern. \(if necessary\)
    exit 0
fi


if [ "$2" == "knn-150"]; then
    PICKLE="/home/nodoka/18-kitada-bachelor-data/testdata"
    
elif [ "$2" != "knn-150non"]; then
    PICKLE="/home/nodoka/18-kitada-bachelor-data/testdata"

elif [ "$2" != "svm-150"]; then
    PICKLE="/home/nodoka/18-kitada-bachelor-data/testdata"

elif [ "$2" != "svm-150non"]; then
    PICKLE="/home/nodoka/18-kitada-bachelor-data/testdata"


else
    echo HOWTO
    echo $0 episode data_of_pickle fomat_prog \(string\)
    echo episode is restraint, male, female or object.
    echo format_prog is spec or wave.
    echo \(string\) is pattern. \(if necessary\)
    exit 0
fi

if [ "$3" == "spec" ]; then
    PS=150ps-
elif [ "$3" == "wave" ]; then
    PS=150-
else
    echo HOWTO
    echo $0 episode data_of_pickle fomat_prog \(string\)
    echo episode is restraint, male, female or object.
    echo format_prog is spec or wave.
    echo \(string\) is pattern. \(if necessary\)
    exit 0
fi


if [ "$4" = "" ]; then
    filetype=time
else
    filetype=$4
fi

#$HOME${SBC}/shell/make-feature.sh $1 $3
#mkdir spec
#mkdir wave
#mv *ps* ./spec/
#mv *150* ./wave/
#mv *cut* ./wave/
while read timedata
do
    ${PYENVPY} ${HOME}${SBC}/python/py/save/knn_check.py ${PICKLE} $1$ ${4:0:3}-H${4:3:1}.pickle $1-${4:0:3}-H${4:3:1}-${timedata/[       ][        ]*/-}-${PS}nomalize.csv  $timedata
done < $4

