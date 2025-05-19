#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char const *argv[]) {
    int *x = (int * )malloc(sizeof(int));//allocate size of one integer - basically allocating in local space
    int size = 100;
    int *xarray = (int * )malloc(sizeof(int) * size);//allocate size of array
    xarray[99] = -1;
}
