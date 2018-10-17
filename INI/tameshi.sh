#!/bin/bash
i=1
while [ $i -le $1 ]
do
    cut -d ',' -f $i $2 > $i-$2
    i=`expr $i + 1`
done
