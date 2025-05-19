#include <stdio.h>
void printa(int a) {
    printf("A = %d\n",  a);
}

int main() {
    void (*print) (int) = &printa;
    (*print)(10);
    asm ("push 20\n\t"
        "mov eax, %0\n\t"
        "call eax\n\t"
        "pop eax\n\t"
        :   //output
        : "m" (print) //input
        : "eax" //clobbers
    );
    return 0;
}
