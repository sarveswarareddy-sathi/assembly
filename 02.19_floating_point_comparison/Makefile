all: 02.19_floating_point_comparison
02.19_floating_point_comparison: 02.19_floating_point_comparison.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

02.19_floating_point_comparison.o: 02.19_floating_point_comparison.asm 
	nasm -f elf 02.19_floating_point_comparison.asm -o 02.19_floating_point_comparison.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 02.19_floating_point_comparison *.o