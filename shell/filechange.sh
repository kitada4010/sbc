#!/bin/sh
for file in `\find . -name '*.txt' -not -name '\*LFP\*' `; do
    grep '^[0-9,-]' $file  > ${file/txt/csv}
done

for file in `\find . -name '*.csv' `; do
    #python ~/sbc/python/py/piccle.py ${file/.csv/}
    python ~/home2/nodoka/sbc/python/py/piccle.py ${file/.csv/}
done

