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
    printf("im here");
    clean_bss();
    printf("hello world!\n");
    trapinit();
    batch_INIT();
    NEXT_APP();
}