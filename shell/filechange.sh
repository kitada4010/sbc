#!/bin/sh
for file in `\find . -name '*.txt' -not -name '\*LFP\*' `; do
    grep '^[0-9,-]' $file  > ${file/txt/csv}
done
rm *LFP.csv
for file in `\find . -name '*.csv' `; do
    python ~/sbc/python/py/piccle.py ${file/.csv/}
    #python ~/home2/nodoka/sbc/python/py/piccle.py ${file/.csv/}
done

for file in `\find .  -not -name '\*LFP\*' -name '*.pickle' `; do
    python ~/sbc/python/py/400s-comparison.py ${file/.pickle/}
    #python ~/home2/nodoka/sbc/python/py/400s-comparison.py ${file/.pickle/}
done

