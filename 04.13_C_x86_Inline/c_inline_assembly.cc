#include <stdio.h>
#include <stdlib.h>

int main() {
    unsigned long long time = 0;
    asm volatile ("rdtsc\n"
            "lea ebx, %0\n"
            "mov [ebx], eax\n"
            "add ebx, 4\n"
            "mov [ebx], edx\n"
        : "=m" (time)//output
        : //input
        : "eax", "edx", "ebx"//clobbers
    );

    printf("Time = %llu\n", time);
    return 0;
}

//gcc -m32 -masm=intel main.c
