#!/bin/bash

echo $episodehz/$indivi
sort -r -g -k 3,3 $episodehz/$indivi/divergence.txt |head -n $TABLE_NUM > $episodehz/$indivi/top-table.txt
[ -f table.txt ] && rm table.txt
rsync ./okiba/Makefile $episodehz/$indivi/
$HOME/sbc/tex/change-tex-tabular.sh $episodehz/$indivi/top-table.txt > table.txt
cat shell-head.txt table.txt  > $episodehz/$indivi/table.sh
make table -C $episodehz/$indivi/
echo 
