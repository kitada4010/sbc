#!/bin/bash
function usage {
    echo  -h          Display help
    echo  -a VALUE    A explanation for arg called a
    echo  -b VALUE    A explanation for arg called b
    echo  -c VALUE    A explanation for arg called c
    echo  -d VALUE    A explanation for arg called d

    exit 2

}
# 引数別の処理定義
while getopts ":a:b:c:d:h" optKey; do
    case "$optKey" in
	f)
	    FILENAME=${OPTARG}
	    ;;
	n)
	    head -n 20 ${FILENAME}
	    ;;
	c)
	    sed '1,${OPTARG}d' ${FILENAME} > ${FILENAME/.txt/csv} 
	    ;;
	'-h'|'--help'|* )
	    usage
	    ;;
    esac
done

