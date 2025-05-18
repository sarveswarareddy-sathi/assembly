all: 04.09_C_x86_Jump
04.09_C_x86_Jump: 04.09_C_x86_Jump.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

04.09_C_x86_Jump.o: 04.09_C_x86_Jump.asm 
	nasm -f elf 04.09_C_x86_Jump.asm -o 04.09_C_x86_Jump.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 04.09_C_x86_Jump *.o