all: 02.15_x86_Enter_and_Leave
02.15_x86_Enter_and_Leave: 02.15_x86_Enter_and_Leave.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

02.15_x86_Enter_and_Leave.o: 02.15_x86_Enter_and_Leave.asm 
	nasm -f elf 02.15_x86_Enter_and_Leave.asm -o 02.15_x86_Enter_and_Leave.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 02.15_x86_Enter_and_Leave *.o