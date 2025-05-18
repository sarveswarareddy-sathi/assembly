all: 03.20_ARM_Thumb 
 
03.20_ARM_Thumb: 03.20_ARM_Thumb.o lib.o
	gcc -o $@ $+
 
03.20_ARM_Thumb.o : 03.20_ARM_Thumb.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 03.20_ARM_Thumb *.o

