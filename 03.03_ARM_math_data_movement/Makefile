all: 03.03_ARM_math_data_movement 
 
03.03_ARM_math_data_movement: 03.03_ARM_math_data_movement.o lib.o
	gcc -o $@ $+
 
03.03_ARM_math_data_movement.o : 03.03_ARM_math_data_movement.asm 
	as -o $@ $<

lib.o: lib.asm
	as -o lib.o lib.asm
 
clean:
	rm -vf 03.03_ARM_math_data_movement *.o

