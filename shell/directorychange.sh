#!/bin/bash
#POINT="/home/nodoka/txt-data"
POINT="/home2/nodoka"
cd ${POINT}/txt-data/restrant && ${POINT}/sbc/shell/filechange.sh && 
cd ${POINT}/txt-data/female && ${POINT}/sbc/shell/filechange.sh && 
cd ${POINT}/txt-data/male && ${POINT}/sbc/shell/filechange.sh && 
cd ${POINT}/txt-data/object  ${POINT}/sbc/shell/filechange.sh 
