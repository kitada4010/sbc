#!/bin/bash

echo \\end{document} >> graph.tex
platex graph.tex
platex graph.tex
dvipdfmx graph.dvi
