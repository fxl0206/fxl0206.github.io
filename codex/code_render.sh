#!/bin/sh
SRC_DIR=$1
OUT_FILE=$2
echo "" >> ${OUT_FILE}
find "${SRC_DIR}" -type f | while read line
do 
    echo "### ${line##*/}">> ${OUT_FILE}
    echo "" >> ${OUT_FILE}
    echo ${line}>> ${OUT_FILE}
    echo "" >> ${OUT_FILE}
    echo "\`\`\` ${line##*.}">> ${OUT_FILE}
    cat ${line} >> ${OUT_FILE}
    echo "" >> ${OUT_FILE}
    echo "\`\`\`" >> ${OUT_FILE}
    echo "" >> ${OUT_FILE}
done