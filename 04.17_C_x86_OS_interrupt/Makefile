all: 04.17_C_x86_OS_interrupt
04.17_C_x86_OS_interrupt: 04.17_C_x86_OS_interrupt.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

04.17_C_x86_OS_interrupt.o: 04.17_C_x86_OS_interrupt.asm 
	nasm -f elf 04.17_C_x86_OS_interrupt.asm -o 04.17_C_x86_OS_interrupt.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 04.17_C_x86_OS_interrupt *.o