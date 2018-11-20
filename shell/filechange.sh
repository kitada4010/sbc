#!/bin/bash
for file in `\find . -name '*.txt'`; do
    grep '^[0-9,-]' $file  > ${file/.txt/.csv}
done
rm *LFP.csv
for csvfile in `\find . -name '*.csv' `; do
    python ~/sbc/python/py/piccle.py ${csvfile/.csv/}
    #python ~/home2/nodoka/sbc/python/py/piccle.py ${file/.csv/}
done

for picklefile in `\find .  -name '*.pickle' `; do
    python ~/sbc/python/py/400s-comparison.py ${picklefile/.pickle/}
    #python ~/home2/nodoka/sbc/python/py/400s-comparison.py ${file/.pickle/}
done

