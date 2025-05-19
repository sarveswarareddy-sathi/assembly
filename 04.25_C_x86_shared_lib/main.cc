#include <stdio.h>
extern int hello;
extern long long hello2;
int asm_main();
int main() {
    asm_main();
    printf("hello %08X\n", hello);
    printf("hello %016LX\n", hello2);
}
