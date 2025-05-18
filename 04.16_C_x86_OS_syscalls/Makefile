all: 04.16_C_x86_OS_syscalls
04.16_C_x86_OS_syscalls: 04.16_C_x86_OS_syscalls.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

04.16_C_x86_OS_syscalls.o: 04.16_C_x86_OS_syscalls.asm 
	nasm -f elf 04.16_C_x86_OS_syscalls.asm -o 04.16_C_x86_OS_syscalls.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 04.16_C_x86_OS_syscalls *.o