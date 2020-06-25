#!/bin/bash

echo \\begin{figure}[htb] >> graph.tex
echo \\centering >> graph.tex
echo \\caption{${episodehz%-*}-$indivi} >> graph.tex
echo \\includegraphics[width=14cm]{$episodehz/$indivi/$indivi-kullback.png} >> graph.tex
echo \\end{figure} >> graph.tex
echo >> graph.tex
echo >> graph.tex
