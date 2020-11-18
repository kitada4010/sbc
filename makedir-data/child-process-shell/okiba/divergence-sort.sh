#!/bin/bash

com=$(sort -r -g -k 3,3 $episodehz/$indivi/divergence.txt |head -n 1)
com=${com% *}
grep -E "^${com/ /,}," $episodehz/$indivi/count_data.csv > top-com-probability.csv
$PYTHON $HOME/$PLOT_PROG top-com-probability.csv $TOP_PRINT
mv ${com/ /-}.png $episodehz/$indivi/
mv top-com-probability.csv $episodehz/$indivi/
