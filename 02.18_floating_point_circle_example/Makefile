all: 02.18_floating_point_circle_example
02.18_floating_point_circle_example: 02.18_floating_point_circle_example.o asm_io.o
	gcc -m32 -o $@ $+ driver.c

02.18_floating_point_circle_example.o: 02.18_floating_point_circle_example.asm 
	nasm -f elf 02.18_floating_point_circle_example.asm -o 02.18_floating_point_circle_example.o

asm_io.o: asm_io.asm 
	nasm -f elf -d ELF_TYPE asm_io.asm -o asm_io.o

clean:
	rm 02.18_floating_point_circle_example *.o