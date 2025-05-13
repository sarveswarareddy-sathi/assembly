all: XX 
 
XX: XX.o lib.o
	gcc -o $@ $+
 
XX.o : XX.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf XX *.o

