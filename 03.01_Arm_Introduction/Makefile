all: 03.01_Arm_Introduction
03.01_Arm_Introduction: 03.01_Arm_Introduction.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

03.01_Arm_Introduction.o: 03.01_Arm_Introduction.asm 
	nasm -f elf 03.01_Arm_Introduction.asm -o 03.01_Arm_Introduction.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 03.01_Arm_Introduction *.o