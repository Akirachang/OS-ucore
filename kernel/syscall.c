#include "defs.h"
#include "syscall_ids.h"
#include "trap.h"
#include "proc.h"
#include "riscv.h"
#define min(a, b) a < b ? a : b;

// char user_stk[4096];
uint64 sys_write(int fd, uint64 va, uint len) {
    // printf("fd is %d\n",fd);
    if (fd != 0 && fd!=1)
        return -1;
    struct proc *p = curr_proc();
    char str[200];
    int size = copyinstr(p->pagetable, str, va, MIN(len, 200));
    for(int i = 0; i < size; ++i) {
        console_putchar(str[i]);
    }
    return size;
}

uint64 sys_read(int fd, uint64 va, uint64 len) {
    if (fd != 0)
        return -1;
    struct proc *p = curr_proc();
    char str[200];
    for(int i = 0; i < len; ++i) {
        int c = console_getchar();
        str[i] = c;
    }
    copyout(p->pagetable, va, str, len);
    return len;
}

uint64 sys_exit(int code) {
    exit(code);
    return 0;
}

uint64 sys_sched_yield() {
    yield();
    return 0;
}

uint64 sys_getpid() {
    return curr_proc()->pid;
}

uint64 sys_clone() {
    info("fork!\n");
    return fork();
}

uint64 sys_exec(uint64 va) {
    struct proc* p = curr_proc();
    char name[200];
    copyinstr(p->pagetable, name, va, 200);
    info("sys_exec %s\n", name);
    return exec(name);
}

uint64 sys_wait(int pid, uint64 va) {
    struct proc* p = curr_proc();
    int* code = (int*)useraddr(p->pagetable, va);
    return wait(pid, code);
}

uint64 sys_times() {
    return get_time_ms();
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
    if(((port&0x8)!=0) || ((port&0x7)==0)){
        return -1;
    }
    port = port<<1;
    port = port | PTE_U;
    port = port | PTE_V;
    
    if(start%4096!=0)
        return -1;

    if(len%4096!=0){
        while(len%4096!=0){
            len++;
        }    
    }
    for(int i=0;i<len/PGSIZE;i++){
    uint64 physical_addr = (uint64) kalloc();
    // start left shift, last bit 
    printf("port1 is %d",port);
    printf("port is %d\n", port);
    mmp = mappages(p->pagetable, start+i*PGSIZE, PGSIZE, physical_addr, port);
    }
    if(mmp == 0){
        return len;
    }
    else
        return -1;
}

uint64 sys_munmap(uint64 start, uint64 len){

    if(start%4096!=0)
        return -1;

    if(len%4096!=0){
        while(len%4096!=0){
            len++;
        }    
    }
    pte_t *pte;
    uint64 a;
    struct proc *p = curr_proc();
    for (a = start; a < start + (len/PGSIZE) * PGSIZE; a += PGSIZE) {
        pte = walk(p->pagetable, a, 0);
        if ((*pte & PTE_V) == 0){
            return -1; //not mapped, return -1
        }
    }

    uvmunmap(p->pagetable,start,len/PGSIZE,1);
    return len;
}
// 0  0 0 1 1
// 16 8 4 2 1
// 00110

int sys_spawn(uint64 name){
    int pid = fork();
    int exe = sys_exec(name);
    if(exe!=-1)
        return pid;
    return -1;
}

void syscall() {
    struct proc *p = curr_proc();
    struct trapframe *trapframe = p->trapframe;
    int id = trapframe->a7, ret;
   uint64 args[7] = {trapframe->a0, trapframe->a1, trapframe->a2, trapframe->a3, trapframe->a4, trapframe->a5, trapframe->a6};
    trace("syscall %d args:%p %p %p %p %p %p %p\n", id, args[0], args[1], args[2], args[3], args[4], args[5], args[6]);
    switch (id) {
        case SYS_write:
            // printf("sy_write\n");
            ret = sys_write(args[0], args[1], args[2]);
            // printf("ret in write is: %d \n",ret);
            break;
        case SYS_read:
            // printf("sy_read\n");
            ret = sys_read(args[0], args[1], args[2]);
            // printf("ret in read is: %d \n",ret);
            break;
        case SYS_exit:
            printf("sys exit\n");
            ret = sys_exit(args[0]);
            break;
        case SYS_sched_yield:
            printf("sys sched\n");
            ret = sys_sched_yield();
            break;
        case SYS_getpid:
            printf("sy_getpid\n");
            ret = sys_getpid();
            break;
        case SYS_clone: // SYS_fork
            printf("sy_clone\n");
            ret = sys_clone();
            break;
        case SYS_execve:
            printf("sy_exec\n");
            ret = sys_exec(args[0]);
            break;
        case SYS_wait4:
            printf("sy_wait4\n");
            ret = sys_wait(args[0], args[1]);
            break;
        case SYS_times:
            printf("sy_times\n");
            ret = sys_times();
            break;
        case SYS_setpriority:
            printf("sys prio\n");
            ret = sys_setpriority(args[0]);
            break;
        case SYS_gettimeofday:
            printf("sys time\n");
            // printf("args0 is %p",args[0]);
            // printf("\n");
            // printf("physical args0 is %p",useraddr(p->pagetable,args[0]));
            ret = sys_get_time(args[0],0);
            // ret=-1;
            break;
        case SYS_mmap:
            printf("sy_mmap\n");
            // printf("args0 is %p \n",args[0]);
            // printf("args1 is %p \n",args[1]);
            ret = sys_mmap(args[0],args[1],args[2]);
            printf("ret is %d \n",ret);
            break;
        case SYS_munmap:
            printf("sy_unmap\n");
            ret = sys_munmap(args[0],args[1]);
            printf("ret is %d \n",ret);
            break;
        case SYS_spawn:
            printf("sy_spawn\n");
            // printf("%p",args[0]);
            ret = sys_spawn(args[0]);
            printf("ret in spawn is %d",ret);
            break;
        default:
            ret = -1;
            warn("unknown syscall %d\n", id);
    }
    trapframe->a0 = ret;
    trace("syscall ret %d\n", ret);
}
