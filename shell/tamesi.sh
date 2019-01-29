#!/bin/bash
#POINT="/home2/nodoka"
#POINT=""
PYENVPY="/home/nodoka/.pyenv/shims/python"
KNN="/sbc/python/py/knn/"
#rm $2
#引数1 : エピソード
if [ "$1" != "restraint" ] && [ "$1" != "male" ] && [ "$1" != "remale" ] && [ "$1" != "object" ]; then
    echo HOWTO
    echo $0 episode \(string\)
    echo episode is restraint, male, female or object.
    echo \(string\) is pattern. \(if necessary\)
    exit 0
fi
echo eede
