#!/bin/bash
if [ "$#" -ne 1 ]; then
	echo "Usage: i386-driver.sh <filename>"
	exit
fi

FILE_PATH=$(echo $1 | sed -e 's/\/[a-zA-Z]*\.calc$//g')
FILE_NAME=$(echo $1 | sed -e 's/.*\/\([a-zA-Z]*\.calc\)$/\1/g')
FILE_NO_EXT=$(echo $FILE_NAME | sed -e 's/\([a-zA-Z0-9]*\).*/\1/g')
ABS_PATH=`cd $FILE_PATH; pwd`"/"$FILE_NAME
CODE=$(./bin/calc3b < $ABS_PATH)
FACT=$(cat ./lib/fact.s)
SECTION=".section"
DATA=".data"
TEXT=".text"
GLOBAL_M=".global main"
MAIN="main:"
END="end:"
PRNT_INT="prnt_int:\n\t.asciz \"%d\\\n\""
PRE="\tpushl %ebp\n\tmovl %esp, %ebp"
END="\tmovl %ebp, %esp\n\tpop %ebp\n\tcall exit"

rm ./test_file.s
touch ./test_file.s

echo "$SECTION $DATA" 	>> test_file.s
echo -e "$PRNT_INT" 	>> test_file.s
echo "$SECTION $TEXT" 	>> test_file.s
echo "$FACT"			>> test_file.s
echo "$GLOBAL_M"		>> test_file.s
echo "$MAIN"			>> test_file.s
echo -e "$PRE"			>> test_file.s
echo "$CODE"			>> test_file.s
echo -e "$END"			>> test_file.s

cat ./test_file.s

gcc -g test_file.s -o $FILE_NO_EXT

#rm ./test_file.s

