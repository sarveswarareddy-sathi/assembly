all: 03.03_ARM_load_store 
 
03.03_ARM_load_store: 03.03_ARM_load_store.o lib.o
	gcc -o $@ $+
 
03.03_ARM_load_store.o : 03.03_ARM_load_store.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 03.03_ARM_load_store *.o

