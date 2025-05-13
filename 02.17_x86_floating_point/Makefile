all: 02.17_x86_floating_point
02.17_x86_floating_point: 02.17_x86_floating_point.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

02.17_x86_floating_point.o: 02.17_x86_floating_point.asm 
	nasm -f elf 02.17_x86_floating_point.asm -o 02.17_x86_floating_point.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 02.17_x86_floating_point *.o