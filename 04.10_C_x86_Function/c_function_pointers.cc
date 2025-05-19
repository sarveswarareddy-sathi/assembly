#include <stdio.h>
int printa(int x);
int printb(int x);

void main()
{
    int choice = 0;
    printf("Enter 1--> n^2 20-->n^3:");
    scanf("%d", &choice);
    int var = 1;
    int (*print)(int);
    if(choice == 1) {
        print = &printa;
    } else {
        print = &printb;
    }
    var = print(10);
    printf("Var = %d\n", var);

}
int printa(int a) {
    printf("A = %d\n", a);
    return a * a;
}
int printb(int a) {
    printf("A = %d\n", a)
    return a * a * a;
}
