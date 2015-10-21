#!/bin/bash
if [ "$#" -ne 1 ]; then
	echo "Usage: i386-driver.sh <filename>"
	exit
fi

FILE_PATH=$(echo $1 | sed -e 's/\/[a-zA-Z]*\.calc$//g')
FILE_NAME=$(echo $1 | sed -e 's/.*\/\([a-zA-Z]*\.calc\)$/\1/g')
ABS_PATH=`cd $FILE_PATH; pwd`"/"$FILE_NAME
CODE=$(./bin/calc3b < $ABS_PATH)

SECTION=".section"
DATA=".data"
TEXT=".text"
GLOBAL_M=".global main"
MAIN="main:"

FULL_CODE=$HEADER$CODE
echo "$FULL_CODE"