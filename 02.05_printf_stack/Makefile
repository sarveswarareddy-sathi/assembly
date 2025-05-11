all: 02.05_printf_stack
02.05_printf_stack: 02.05_printf_stack.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

02.05_printf_stack.o: 02.05_printf_stack.asm 
	nasm -f elf 02.05_printf_stack.asm -o 02.05_printf_stack.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 02.05_printf_stack *.o