all: 03.05_ARM_Memory_Offset_Debug 
 
03.05_ARM_Memory_Offset_Debug: 03.05_ARM_Memory_Offset_Debug.o lib.o
	gcc -o $@ $+
 
03.05_ARM_Memory_Offset_Debug.o : 03.05_ARM_Memory_Offset_Debug.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 03.05_ARM_Memory_Offset_Debug *.o

