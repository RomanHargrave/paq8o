.PHONY: bin/

bin/paq7asm.o: bin/ 
	yasm -pnasm -felf32 paq7asm.asm -o bin/paq7asm.o

bin/paq7asmsse.o: bin/ 
	yasm -pnasm -felf32 paq7asmsse.asm -o bin/paq7asmsse.o

bin/paq7asm-x86_64.o: bin/ 
	yasm -felf64 paq7asm-x86_64.asm -o bin/paq7asm-x86_64.o

bin/paq8o: bin/ bin/paq7asm-x86_64.o
	g++ -o bin/paq8o -march=native -mtune=native -O3 -fomit-frame-pointer paq8o.cpp bin/paq7asm-x86_64.o
