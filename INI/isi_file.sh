#!/bin/bash
nkf -w $2  > time_nodoka.csv
#nkf -w $2  |tr '\r\n' \\n > time.csv
echo "aaa"
if [[ $4 -le 1 || $4 -eq "" ]]; then
    echo "aaa"
    for line in 10 20 30 40 50
    do
	for count in 3 4 5 6 7 8 9 10
	do
	    ./beta $1 time_nodoka.csv ${line}m-${count}_${1/.csv/_}${2/.csv/_}$3 c${line}m-$count_${1/.csv/_}${2/.csv/_}$3 $line $count
	    #    ./betal $1 time_nodoka.csv l${1/.csv/_}${2/.csv/_}$3
	done
    done
else
    echo "aaad"
    for line in 10 20 30 40 50
    do
	for count in 3 4 5 6 7 8 9 10
	do
	    i=1
	    while [ $i -le $4 ]
	    do
		cut -d ',' -f $i $1 > $i-$1
		./beta $i-$1 time_nodoka.csv $i-$3 c$i-$3 $line $count
		#	./betal $i-$1 time_nodoka.csv $i-l$3
		#cat l$3
		#	if [ $i -eq 1 ]; then
		#	    cp 1-l$3 l$3
		#cp 1-$3 $3
		#	elsen
		#	    cat l$3 <(echo ) $i-l$3  > ll$3
		# paste -d :$3 $i-$3 > r$3
		#	    rm l$3
		#rm $3
		#	    cp ll$3  l$3
		#sed -e "s/:/,,,/g" r$3 > $3
		#	    rm ll$3
		#rm r$3
		#	fi
		i=`expr $i + 1`
	    done
	    paste -d : [1-$4]-$3 > r$3
	    paste -d : c[1-$4]-$3 > cr$3
	    sed -e "s/:/,,/g" r$3 > ${line}m-${count}_${1/.csv/_}${2/.csv/_}$3
	    sed -e "s/:/,,/g" cr$3 > c${line}m-${count}_${1/.csv/_}${2/.csv/_}$3
	    rm r$3
	    rm cr$3
	    rm *-$1
	    rm *-$3
	    #rm *-l$3
	done
    done
fi
rm time_nodoka.csv
