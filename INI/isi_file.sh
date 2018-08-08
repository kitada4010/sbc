#!/bin/bash
nkf -w $2  > time_nodoka.csv
#nkf -w $2  |tr '\r\n' \\n > time.csv
if [[ $4 -le 1 || $4 -eq "" ]]; then
    ./beta $1 time_nodoka.csv $3
else
    i=1
    while [ $i -le $4 ]
    do
	cut -d ',' -f $i $1 > $i-$1
	./beta $i-$1 time_nodoka.csv $i-$3
	i=`expr $i + 1`
    done    
    rm *-$1
fi
rm time_nodoka.csv
