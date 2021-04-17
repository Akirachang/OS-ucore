#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    puts(m);
    exit(-100);
}

void assert(int f, int code) {
    if(!f) {
        exit(code);
    }
}
