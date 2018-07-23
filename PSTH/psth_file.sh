#!/bin/bash
#nkf -w $2  |tr '\r\n' \\n > time.csv
nkf -w $2  > time.csv
./beta $1 time.csv $3
paste -d , 1-$3 2-$3 3-$3 4-$3 5-$3 6-$3 7-$3 8-$3 9-$3 10-$3 11-$3 12-$3> $3
rm *-$3
rm time.csv
