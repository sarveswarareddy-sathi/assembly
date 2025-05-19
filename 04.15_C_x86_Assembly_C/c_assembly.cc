#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int lenstring(char *c, int max);

int main()
{
    int size = 30;
    char *input = (char *)malloc(size);
    scanf("%s",input);
    int len = strlen(input);
    int len2 = lenstring(input, size);
    printf("(%d) (%d) %s\n", len, len2);
    return 0;
}
