#include <stdlib.h>
#include <stdio.h>
int main() {
    int b = 0;
    int * x = malloc(1 * sizeof(int));
    scanf("%d", x);
    //char x;
    //scanf(%c,x);
    switch(* x)
    {
        case 1:
            b = 1;
            break;
        case 2:
            b = 2;
            break;
        case 3:
            b = 3;
            break;
        default:
            b = 99;
    }
    printf("%d\n", b);
}
