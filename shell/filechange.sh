#!/bin/sh
for file in `\find . -name '*.txt' `; do
#for file in `\find . -maxdepth 1 -type f`; do
    grep '^[0-9,-]' $file  > ${file/txt/csv}
done

for file in `\find . -name '*.csv' `; do
#for file in `\find . -maxdepth 1 -type f`; do
    python ~/sbc/python/py/piccle.py ${file/.csv/}
done

