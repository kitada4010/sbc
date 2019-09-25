#!/bin/bash
#POINT="/home2/nodoka"
POINT="/home/nodoka"
#PYENVPY="/home/nodoka/.pyenv/shims/python"
# 引数1 label時間ファイル
# 引数2 エピソード-個体名-(HR or HL)

while read line
do
    ${POINT}/sbc/c/or-label $line 1 $2 
#    if [ $3 = "3" ]; then
#	sed -i "s/1/5/g" B39-${line/[    ]/-}-label.csv
#	sed -i "s/3/5/g" B39-${line/[    ]/-}-label.csv
#	sed -i "s/0/2/g" B39-${line/[    ]/-}-label.csv
#   fi
done < $1
