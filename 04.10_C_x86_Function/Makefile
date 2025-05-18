all: 04.10_C_x86_Function
04.10_C_x86_Function: 04.10_C_x86_Function.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

04.10_C_x86_Function.o: 04.10_C_x86_Function.asm 
	nasm -f elf 04.10_C_x86_Function.asm -o 04.10_C_x86_Function.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 04.10_C_x86_Function *.o