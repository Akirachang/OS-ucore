//here all
#include "defs.h"

extern char ekernel[];
extern char s_bss[];
extern char e_bss[];

void clean_bss() {
    char* p;
    for(p = s_bss; p < e_bss; ++p)
        *p = 0;
}

void main() {
    clean_bss();
    printf("hello wrold!\n");
    trapinit();
    printf("hi");
    batchinit();
    printf("hi2");
    run_next_app();
    printf("hi3");
}