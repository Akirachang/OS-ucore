#include "defs.h"
#include "syscall_ids.h"
#include "trap.h"
#include "proc.h"
#include "riscv.h"
#define min(a, b) a < b ? a : b;

// char user_stk[4096];
uint64 sys_write(int fd, char *addr, uint len) {
    if (fd != 0 && fd!=1)
        return -1;    
    
    struct proc *p = curr_proc();
    char str[200];
    int size = copyinstr(p->pagetable, str, (uint64) addr, MIN(len, 200));
    // printf("size = %d\n", size);

    // if (fd != 0 && fd!=1)
    // {
    //     return -1;
    // }
    // uint64 user_stk = p->ustack;
    // if(((uint64)(str)<(uint64)user_stk ||
    // (uint64)str+len>(uint64)user_stk+(uint64)4096) && 
    // (uint64)str<BA + p->num * MAS)
    // {
    //     return -1;
    // }
    // if(strlen(str)<len)
    //     size = strlen(str);
    // else
    //     size = len;

    for(int i = 0; i < size; ++i) {
        // printf(",");
        console_putchar(str[i]);
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

uint64 sys_get_time(uint64 ts,int tz){
    // printf("im here");
    struct proc *p = curr_proc();
    uint64 physical_addr = useraddr(p->pagetable,ts);
    uint64 rtn = get_time((TimeVal *)physical_addr,0);
    // printf("%d",((ts->sec & 0xffff) * 1000 + ts->usec / 1000));
    // printf("\n");
    // printf("here i am \n");
    return rtn;
}

uint64 sys_mmap(uint64 start, uint64 len, uint64 port){
    struct proc *p = curr_proc();
    int mmp=0;
for(int i=0;i<len;i++){
    uint64 physical_addr = (uint64) kalloc();
    // start left shift, last bit 
    printf("port1 is %d",port);

    if(start%4096!=0)
        return -1;

    if(len%4096!=0){
        while(len%4096!=0){
            len++;
        }    
    }


    port = port<<1;
    port = port | PTE_U;
    port = port | PTE_V;
    printf("port is %d\n", port);
    
    if(((port&0x8)!=0) || ((port&0x7)==0)){
        return -1;
    }
    mmp = mappages(p->pagetable, start+i, 1, physical_addr, port);
}
    if(mmp == 0){
        return len;
    }
    else
        return -1;
}
// 0  0 0 1 1
// 16 8 4 2 1
// 00110

void syscall() {
    struct trapframe *trapframe = curr_proc()->trapframe;
    int id = trapframe->a7, ret;
    uint64 args[6] = {trapframe->a0, trapframe->a1, trapframe->a2, trapframe->a3, trapframe->a4, trapframe->a5};
    // printf("syscall %d args:%p %p %p %p %p %p\n", id, args[0], args[1], args[2], args[3], args[4], args[5]);
    switch (id) {
        case SYS_write:
            ret = sys_write(args[0], (char *) args[1], args[2]);
            // printf("\n");
            break;
        case SYS_exit:
            // printf("sys exit");
            ret = sys_exit(args[0]);
            break;
        case SYS_sched_yield:
            // printf("sys sched");
            ret = sys_sched_yield();
            break;
        case SYS_setpriority:
            // printf("sys prio");
            ret = sys_setpriority(args[0]);
            break;
        case SYS_gettimeofday:
            // printf("sys time");
            // printf("args0 is %p",args[0]);
            // printf("\n");
            // printf("physical args0 is %p",useraddr(p->pagetable,args[0]));
            ret = sys_get_time(args[0],0);
            // ret=-1;
            break;
        case SYS_mmap:
            // printf("args0 is %p \n",args[0]);
            // printf("args1 is %p \n",args[1]);
            ret = sys_mmap(args[0],args[1],args[2]);
            printf("ret is %d \n",ret);
            break;
        default:
            ret = -1;
            // printf("unknown syscall %d\n", id);
    }
    trapframe->a0 = ret;
    // printf("syscall ret %d\n", ret);
}
