all: 02.12_x86_calling_stack
02.12_x86_calling_stack: 02.12_x86_calling_stack.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

02.12_x86_calling_stack.o: 02.12_x86_calling_stack.asm 
	nasm -f elf 02.12_x86_calling_stack.asm -o 02.12_x86_calling_stack.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 02.12_x86_calling_stack *.o