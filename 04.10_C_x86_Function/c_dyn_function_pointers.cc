#include <stdio.h>
#include <stdlib.h>

int printa(int x);
int printb(int x);

int main() {
    int a = &printa;
    int b = &printb;
    printf("A %d B %d\n", a, b);

    int choice = 0;
    scanf("%d", &choice);
    int (*foo) (int);
    foo = (int (*) (int)) choice;
    int res = foo(10);
    printf("Res = %d\n", res);

    return 0;
}

int printa(int a) {
    printf("A = %d\n", a);
    return a *a ;
}

int printb(int a) {
    printf("A = %d\n", a)
    return a * a * a;
}
