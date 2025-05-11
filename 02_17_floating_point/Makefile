all: 02_17_floating_point
02_17_floating_point: 02_17_floating_point.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

02_17_floating_point.o: 02_17_floating_point.asm 
	nasm -f elf 02_17_floating_point.asm -o 02_17_floating_point.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 02_17_floating_point *.o