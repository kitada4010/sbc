#!/bin/bash

com=$(sort -r -g -k 3,3 $episodehz/$indivi/divergence.txt |head -n 1)
com=${com% *}
#echo ${com/ /-}.png
echo \\begin{table}[htb] >> top-com-table.tex
echo \\centering >> top-com-table.tex
echo \\caption{${episodehz%-*}-$indivi} >> top-com-table.tex
echo \\input{$episodehz/$indivi/top-table.tex} >> top-com-table.tex
echo \\end{table} >> top-com-table.tex
echo >> top-com-table.tex
echo >> top-com-table.tex
