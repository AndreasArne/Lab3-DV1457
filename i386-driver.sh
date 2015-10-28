#!/bin/bash
if [ "$#" -ne 1 ]; then
	echo "Usage: i386-driver.sh <filename>"
	exit
fi

FILE_PATH=$(echo $1 | sed -e 's/\/[a-zA-Z]*\.calc$//g')
FILE_NAME=$(echo $1 | sed -e 's/.*\/\([a-zA-Z]*\.calc\)$/\1/g')
FILE_NO_EXT=$(echo $FILE_NAME | sed -e 's/\([a-zA-Z0-9]*\).*/\1/g')
ABS_PATH=`cd $FILE_PATH; pwd`"/"$FILE_NAME
CODE=$(./bin/calc3i < $ABS_PATH)
FACT=$(cat ./lib/fact.s)
SECTION=".section"
DATA=".data"
TEXT=".text"
GLOBAL_M=".global main"
MAIN="main:"
END="end:"
PRNT_INT="prnt_int:\n\t.asciz \"%d\\\n\""
PRE="\tpushl %ebp\n\tmovl %esp, %ebp\nsub\t\$100, %esp"
END="\tmovl %ebp, %esp\n\tpopl %ebp\n\tcall exit"

rm ./$FILE_NO_EXT.s
touch ./$FILE_NO_EXT.s

echo "$SECTION $DATA" 	>> $FILE_NO_EXT.s
echo -e "$PRNT_INT" 	>> $FILE_NO_EXT.s
echo "$SECTION $TEXT" 	>> $FILE_NO_EXT.s
echo "$FACT"			>> $FILE_NO_EXT.s
echo "$GLOBAL_M"		>> $FILE_NO_EXT.s
echo "$MAIN"			>> $FILE_NO_EXT.s
echo -e "$PRE"			>> $FILE_NO_EXT.s
echo "$CODE"			>> $FILE_NO_EXT.s
echo -e "$END"			>> $FILE_NO_EXT.s

gcc -g $FILE_NO_EXT.s -o $FILE_NO_EXT
