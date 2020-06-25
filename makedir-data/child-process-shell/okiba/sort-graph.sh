#!/bin/bash

com=$(sort -r -g -k 3,3 $episodehz/$indivi/divergence.txt |head -n 1)
com=${com% *}
grep -E "^$com " $episodehz/$indivi/count.txt | cat -n > gg.txt
echo 
#echo ${com/ /-}.png
echo \\begin{figure}[htb] >> top-com-probability.tex
echo \\centering >> top-com-probability.tex
echo \\caption{${episodehz%-*}-$indivi} >> top-com-probability.tex
echo \\includegraphics[width=14cm]{$episodehz/$indivi/${com/ /-}.png} >> top-com-probability.tex
echo \\end{figure} >> top-com-probability.tex
echo >> top-com-probability.tex
echo >> top-com-probability.tex
