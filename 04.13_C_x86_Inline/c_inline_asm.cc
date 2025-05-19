#include <stdio.h>
int var = 0;
int main()
{
    asm(".intel_syntax noprefix");
    asm("mov eax, 0");
    asm("lea eax, var");
    asm("mov DWORD PTR [eax], 1");
    asm(".att_syntax prefix");
    if (var == 1) {
        printf("Var was modified");
    }
    printf("Done\n");
    return 0;
}
