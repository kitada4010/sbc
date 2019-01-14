#!/bin/bash
#POINT="/home2/nodoka"
POINT="/home/nodoka"
PYENVPY="/home/nodoka/.pyenv/shims/python"
for line in *$1*; do
    wc -l $line
done
