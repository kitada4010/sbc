#!/bin/bash
nkf -w $2  > time.csv
#nkf -w $2  |tr '\r\n' \\n > time.csv
./beta $1 time.csv $3
rm time.csv
