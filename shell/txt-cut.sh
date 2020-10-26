#!/bin/bash
sed '1,'$2'd' $1 > ${1/.txt/.csv}
