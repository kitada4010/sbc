#!/bin/bash

for i in $(seq $(find . -type d | wc -l))
do
    find . -maxdepth $i -name "$1" | \
	while read line
	do newline=$(echo $line | sed "s/'$1'/'$2'/g")
	   echo $newline
	   mv "$line" $newline
	done
done
