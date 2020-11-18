#!/bin/bash

echo \\end{document} >> top-com-probability.tex
platex top-com-probability.tex
platex top-com-probability.tex
dvipdfmx top-com-probability.dvi
