#include "defs.h"
#ifndef TIMEVAL
#define TIMEVAL
typedef struct{
    uint64 sec;	// 自 Unix 纪元起的秒数
    uint64 usec;	// 微秒数
}TimeVal;
#endif
void loop() {
    for(;;);
}

void panic(char *s)
{
    printf("panic: ");
    printf(s);
    printf("\n");
    shutdown();
}