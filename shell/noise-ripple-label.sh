#!/bin/bash

for line in *$1*; do
    sed -i "s/1/5/g" $line
    sed -i "s/3/5/g" $line
    sed -i "s/0/2/g" $line
done
