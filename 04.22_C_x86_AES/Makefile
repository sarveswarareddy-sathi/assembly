all: 04.22_C_x86_AES
04.22_C_x86_AES: 04.22_C_x86_AES.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

04.22_C_x86_AES.o: 04.22_C_x86_AES.asm 
	nasm -f elf 04.22_C_x86_AES.asm -o 04.22_C_x86_AES.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 04.22_C_x86_AES *.o