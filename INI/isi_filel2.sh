#!/bin/bash
nkf -w $2  > time_nodoka.csv
#nkf -w $2  |tr '\r\n' \\n > time.csv
if [[ $4 -le 1 || $4 -eq "" ]]; then
    ./beta $1 time_nodoka.csv $3
    ./betal $1 time_nodoka.csv l$3
else
    i=1
    while [ $i -le $4 ]
    do
	cut -d ',' -f $i $1 > $i-$1
	./beta $i-$1 time_nodoka.csv $i-$3
	./betal $i-$1 time_nodoka.csv $i-l$3
	#cat l$3
	if [ $i -eq 1 ]; then
	    cp 1-l$3 l$3
	    #cp 1-$3 $3
	else
	    cat l$3 <(echo ) $i-l$3  > ll$3
	   # paste -d :$3 $i-$3 > r$3
	    rm l$3
	    #rm $3
	    cp ll$3  l$3
	   # sed -e "s/:/,,,/g" r$3 > $3
	    rm ll$3
	    #rm r$3
	fi
	i=`expr $i + 1`
    done
    paste -d : [1-$4]-$3 > r$3
    sed -e "s/:/,,/g" r$3 > $3
    rm r$3
    rm *-$1
    rm *-$3
    rm *-l$3
fi
rm time_nodoka.csv
