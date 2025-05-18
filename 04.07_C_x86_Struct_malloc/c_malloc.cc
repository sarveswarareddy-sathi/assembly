#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char const *argv[]) {
    int *x = malloc(sizeof(int));
    int size = 100;
    int *xarray = malloc(sizeof(int) * size);
    xarray[99] = -1;
}