#!/bin/bash
dirs=`find ./individual/*.txt`

for dir in $dirs;
do
    file=${dir##*/}
    echo ${file%.*}
    [ -d ${file%.*} ] || mkdir ${file%.*}
    while read line
    do
	[ -d ${file%.*}/$line ] || mkdir ${file%.*}/$line
    done < timing.txt
done
