#!/bin/bash
POINT="/home/nodoka/txt-data"
#POINT="~/txt-data"
cd ${POINT}/restrant && ~/sbc/shell/filechange.sh && 
cd ${POINT}/female && ~/sbc/shell/filechange.sh && 
cd ${POINT}/male && ~/sbc/shell/filechange.sh && 
cd ${POINT}/object  ~/sbc/shell/filechange.sh 
