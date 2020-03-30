#!/bin/bash
if [ ${1##*.}!=".csv" ]; then
    sed -e "s/[ 	][	 ]*/,/g" $1 > ${1%.*}.csv
    echo ok
fi
num=`awk -F ',' '{print NF}' ${1%.*}.csv |head -n 1`
echo 列数は $num
i=0
begin_tabular="\begin{tabular}{|"
while [ $i -ne $num ]
do
    #echo $begin_tabular
    begin_tabular="$begin_tabular l |"
    i=$(($i+1))
done
begin_tabular="$begin_tabular}"
echo $begin_tabular > ${1%.*}.tex
<<<<<<< HEAD
sed -e "s/,/ \& /g" -e 's/$/\\\\/g' ${1%.*}.csv  >> ${1%.*}.tex
=======
sed -e "s/,/ \& /g" -e  's/$/\\\\/g' ${1%.*}.csv  >> ${1%.*}.tex
>>>>>>> a41ced93b4bea2a33d3f5d9a6be2a2f86ccccdc2
sed -i -e 's/$/ \\hline/g' ${1%.*}.tex 
echo "\end{tabular}" >> ${1%.*}.tex

