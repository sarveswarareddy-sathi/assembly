#include <stdio.h>
#include <time.h>
#include <sys/time.h>
#include <sys/resource.h>

int main () {
    struct timespec start;
    clock_gettime(CLOCK_REALTIME, &start);
    printf("The time is %ld seconds and %ld nanoseconds\n", start.tv_sec, start.tv_nsec)
}