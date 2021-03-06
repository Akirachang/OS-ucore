#include "defs.h"
// here 1
extern char stext[];
extern char etext[];
extern char srodata[];
extern char erodata[];
extern char sdata[];
extern char edata[];
extern char sbss[];
extern char ebss[];
// to here 1

void clean_bss() {
    char* p;
    for(p = sbss; p < ebss; ++p)
        *p = 0;
}

// int debug_level = INFO;

void main() {
    clean_bss();
    //here 2
    printf("\n");
    printf("hello wrold!\n");
    printf("stext: %p\n", stext);
    printf("etext: %p\n", etext);
    printf("sroda: %p\n", srodata);
    printf("eroda: %p\n", erodata);
    printf("sdata: %p\n", sdata);
    printf("edata: %p\n", edata);
    printf("sbss : %p\n", sbss);
    printf("ebss : %p\n", ebss);
    extern info!(".text [{:#x}, {:#x})", stext as usize, etext as usize);
    extern debug!(".rodata [{:#x}, {:#x})", srodata as usize, erodata as usize);
    extern error!(".data [{:#x}, {:#x})", sdata as usize, edata as usize);
    printf("\n");
    shutdown();
    //to here 2
}