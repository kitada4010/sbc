#!/bin/bash

echo \\end{document} >> top-com-table.tex
platex top-com-table.tex
platex top-com-table.tex
dvipdfmx top-com-table.dvi
