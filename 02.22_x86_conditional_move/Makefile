all: 02.22_x86_conditional_move
02.22_x86_conditional_move: 02.22_x86_conditional_move.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

02.22_x86_conditional_move.o: 02.22_x86_conditional_move.asm 
	nasm -f elf 02.22_x86_conditional_move.asm -o 02.22_x86_conditional_move.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 02.22_x86_conditional_move *.o