
cleanup: build
	@echo "Cleanup"
	@rm ./lexyacc-code/lex.yy.o
	@rm ./lexyacc-code/y.tab.o
	@rm ./lexyacc-code/lex.yy.c
	@rm ./lexyacc-code/y.tab.c
	@rm ./lexyacc-code/y.tab.h

build: flex_bison
	@echo "Building: gcc ./lexyacc-code/y.tab.o ./lexyacc-code/lex.yy.o ./lexyacc-code/calc3b.c -o calc3b"
	@gcc ./lexyacc-code/y.tab.o ./lexyacc-code/lex.yy.o ./lexyacc-code/calc3b.c -o calc3b
	@mv calc3b ./bin

flex_bison: flex
	@echo "flex_bison: gcc -c ./lexyacc-code/y.tab.c ./lexyacc-code/lex.yy.c"
	@gcc -c ./lexyacc-code/y.tab.c ./lexyacc-code/lex.yy.c
	@mv lex.yy.o ./lexyacc-code
	@mv y.tab.o ./lexyacc-code

flex: bison
	@echo "Flex: flex ./lexyacc-code/calc3.l"
	@flex ./lexyacc-code/calc3.l
	@mv lex.yy.c ./lexyacc-code

bison:
	@echo "Bison: bison -y -d ./lexyacc-code/calc3.y"
	@bison -y -d ./lexyacc-code/calc3.y
	@mv y.tab.c ./lexyacc-code
	@mv y.tab.h ./lexyacc-code