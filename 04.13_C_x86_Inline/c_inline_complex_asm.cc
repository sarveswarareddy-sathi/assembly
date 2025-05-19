#include <stdio.h>
// %1 refer to a
// %0 refer to b
// placeholders sequence decided based on volatile order
int main(int argc, char *argv[])
{
    //initial values
    int a = 1;
    int b = 17;
    asm volatile (
        "mov eax, %1\n\t" //mov 'a' (which is 1) into EAX register
        "add eax, 99\n\t" //add 99 to eax (eax = 1 + 99 =100)
        "mov %0, eax\n\t" //move updated eax value (100) into 'b'
        : "=r" (b) //output
        : "r" (a) //input
        : "eax" //clobbers - modified by assembly
    );
    printf("varibles a %d b %d\n", a, b);
    getchar();
    return 0;
}
