all: 04.15_C_x86_Assembly_C
04.15_C_x86_Assembly_C: 04.15_C_x86_Assembly_C.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

04.15_C_x86_Assembly_C.o: 04.15_C_x86_Assembly_C.asm 
	nasm -f elf 04.15_C_x86_Assembly_C.asm -o 04.15_C_x86_Assembly_C.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 04.15_C_x86_Assembly_C *.o