#!/bin/sh
find . -name "* *" | rename 's/ /-/g' 
dirs=`find *.xls`

for dir in $dirs;
do
    echo $dir
    python ~/sbc/python/py/cut-time/cut-time.py $dir
    # ここから実行処理を記述
done
