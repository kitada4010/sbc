#!/bin/bash
find . -name "* *" | rename 's/ /-/g' 
dirs=`find *.xls`

for dir in $dirs;
do
    echo $dir
    python ~/sbc/python/py/cut-time/cut-time.py $dir
done


dirs=`find *.csv`

for dir in $dirs;
do
    echo $dir
    sed "s/,/\t/g"  $dir  > ${dir/.csv/.txt}
    echo ${dir/.csv/.txt}
done
