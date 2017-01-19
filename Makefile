.PHONY: bin/

default: bin/paq8o

clean:
	-rm bin/paq7asm-x86_64.o bin/paq7asmsse.o bin/paq7asm.o  
	-rm bin/paq8o

install: bin/paq8o
	install -s bin/paq8o /usr/local/bin

#----------------------------------------------------------
# No idea if these two build correctly on a 64bit system
bin/paq7asm.o: bin/ 
	yasm -pnasm -felf32 paq7asm.asm -o bin/paq7asm.o

bin/paq7asmsse.o: bin/ 
	yasm -pnasm -felf32 paq7asmsse.asm -o bin/paq7asmsse.o
#----------------------------------------------------------

bin/paq7asm-x86_64.o: bin/ paq7asm-x86_64.asm 
	yasm -felf64 paq7asm-x86_64.asm -o bin/paq7asm-x86_64.o

bin/paq8o: bin/ bin/paq7asm-x86_64.o paq8o.cpp
	g++ -o bin/paq8o -march=native -mtune=native -O3 -fomit-frame-pointer paq8o.cpp bin/paq7asm-x86_64.o

