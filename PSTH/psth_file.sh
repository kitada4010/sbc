#!/bin/bash
#nkf -w $2  |tr '\r\n' \\n > time.csv
nkf -w $2  > time_nodoka.csv
if [[ $4 -le 1 || $4 -eq "" ]]; then
    ./beta $1 time_nodoka.csv $3
    paste -d , 1-$3 2-$3 3-$3 4-$3 5-$3 6-$3 7-$3 8-$3 9-$3 10-$3 11-$3 12-$3 > $3
else
   i=1
   while [ $i -le $4 ]
   do
       cut -d ',' -f $i $1 > $i-$1
       ./beta $i-$1 time_nodoka.csv $3
       paste -d , 1-$3 2-$3 3-$3 4-$3 5-$3 6-$3 7-$3 8-$3 9-$3 10-$3 11-$3 12-$3 > $i-neuron-$3
       i=`expr $i + 1`
   done
   rm *-$1
fi
rm 1-$3
rm 2-$3
rm 3-$3
rm 4-$3
rm 5-$3
rm 6-$3
rm 7-$3
rm 8-$3
rm 9-$3
rm 10-$3
rm 11-$3
rm 12-$3
rm time_nodoka.csv
