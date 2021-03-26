#include "defs.h"
#include "syscall_ids.h"
#include "trap.h"
#include "proc.h"
#define min(a, b) a < b ? a : b;

// char user_stk[4096];
const uint64 BA = 0x80400000,  MAS= 0x20000;

uint64 sys_write(int fd, char *addr, uint len) {
    // if (fd != 0)
    //     return -1;    
    
    struct proc *p = curr_proc();
    char str[200];
    int size = copyinstr(p->pagetable, str, (uint64) addr, MIN(len, 200));
    printf("size = %d\n", size);

    if (fd != 0 && fd!=1)
    {
        return -1;
    }
    struct proc* p = curr_proc();
    uint64 user_stk = p->ustack;
    if(((uint64)(addr)<(uint64)user_stk ||
    (uint64)addr+len>(uint64)user_stk+(uint64)4096) && 
    (uint64)addr<BA + p->num * MAS)
    {
        return -1;
    }
    int size=0;
    if(strlen(addr)<len)
        size = strlen(addr);
    else
        size = len;
        
    for(int i = 0; i < size; ++i) {
        // printf(",");
        console_putchar(addr[i]);
    }
    return size;

}

uint64 sys_exit(int code) {
    exit(code);
    return 0;
}

uint64 sys_sched_yield() {
    yield();
    return 0;
}

uint64 sys_setpriority(int code) {
    uint64 rtn = set_priority(code);
    return rtn;
}

uint64 sys_get_time(TimeVal* ts,int tz){
    // printf("im here");
    uint64 rtn = get_time(ts,0);
    // printf("%d",((ts->sec & 0xffff) * 1000 + ts->usec / 1000));
    // printf("\n");
    // printf("here i am \n");
    return rtn;
}


void syscall() {
    struct trapframe *trapframe = curr_proc()->trapframe;
    int id = trapframe->a7, ret;
    uint64 physical_addr;
    // printf("syscall %d\n", id);
    uint64 args[7] = {trapframe->a0, trapframe->a1, trapframe->a2, trapframe->a3, trapframe->a4, trapframe->a5, trapframe->a6};
    switch (id) {
        case SYS_write:
            printf("sys write");
            // physical_addr = walkaddr(get_pagetable(), args[0]);
            ret = sys_write(args[0], (char *) useraddr(get_pagetable(), args[1]), args[2]);
            break;
        case SYS_exit:
            printf("sys exit");
            physical_addr = useraddr(get_pagetable(), args[0]);
            ret = sys_exit(physical_addr);
            break;
        case SYS_sched_yield:
            printf("sys sched");
            ret = sys_sched_yield();
            break;
        case SYS_setpriority:
            printf("sys prio");
            ret = sys_setpriority(args[0]);
            break;
        case SYS_gettimeofday:
            printf("sys time");
            // printf("args0 is %d",args[0]);
            ret = sys_get_time((TimeVal *)args[0],0);
            break;
        default:
            ret = -1;
            printf("unknown syscall %d\n", id);
    }
    trapframe->a0 = ret;
    printf("syscall ret %d\n", ret);
}
