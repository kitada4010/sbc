#!/bin/bash
num=`awk -F ',' '{print NF}' $1 |head -n 1`
echo $num
#<<DOM
i=0
begin_tabular="\begin{tabular}{|"
while [ $i -ne $num ]
do
    echo $begin_tabular
    begin_tabular="$begin_tabular l |"
    i=$(($i+1))
done
begin_tabular="$begin_tabular}"
echo $begin_tabular
#DOM
\
