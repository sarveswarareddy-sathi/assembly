all: 04.20_C_x86_64bit
04.20_C_x86_64bit: 04.20_C_x86_64bit.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

04.20_C_x86_64bit.o: 04.20_C_x86_64bit.asm 
	nasm -f elf 04.20_C_x86_64bit.asm -o 04.20_C_x86_64bit.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 04.20_C_x86_64bit *.o