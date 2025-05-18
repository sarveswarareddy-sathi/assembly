// Structure layout and offsets
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
/*
; C Structure Layout --------
;
; Start at first declration
;
; Round to the nearest even byte boundary for the next size - byte 1, short 2, float 4, integer 4, 32-bit arch long 4, 64-bit arch - long 8, Double - 8
; even boundary access is faster for memories
;
; Offsets --- addr for the above structure elements boundaries
; -20(32) --> -1c(28) --> -18(24) --> -14(20) --> -10(16) --> -0c(12)
*/
 typedef struct myStruct{
    float f;
    char c;
    int d;
    unsigned char t[6];
 }myStruct;

 int main(int argc, char **argv, char **envp) {
    struct myStruct s;
    s.f = 3.1;
    s.c = 'a';
    s.d = 255;
    s.t[0] = 'b';
    s.t[1] = 0;
 }