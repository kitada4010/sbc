#!/bin/sh

dirs=`find -maxdepth 0 -type f -name *.xls`

for dir in $dirs;
do
    echo $dir
    # ここから実行処理を記述
done
