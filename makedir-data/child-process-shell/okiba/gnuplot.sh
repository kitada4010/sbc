#!/bin/bash

echo set terminal png > plot.gp
echo set output \"$indivi-kullback.png\" >> plot.gp
echo set pm3d map >> plot.gp
echo set xlabel \"time_leng \[ms\]\" >> plot.gp
echo set ylabel \"pattern_leng\" >> plot.gp
echo set cbrange\[$GNUPLOT_MIN:$GNUPLOT_MAX\] >> plot.gp
#echo set cblabel \"Kullback-divergence\" >> plot.gp
#echo unset cbtics >> plot.gp
echo splot \"divergence.txt\" u \(\$1/25\):2:3 with pm3d title \"$indivi-$GNUPLOT_TITLE\">> plot.gp
#echo set label 1 at graph 0.1,0.9 STATS_max_z >> plot.gp
echo replot >> plot.gp
echo set terminal x11 >> plot.gp

rsync ./okiba/Makefile $episodehz/$indivi/
rsync ./plot.gp $episodehz/$indivi/
make plot -C $episodehz/$indivi/
