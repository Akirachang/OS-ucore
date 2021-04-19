#include "defs.h"
#include "syscall_ids.h"
#include "trap.h"
#include "proc.h"
#include "riscv.h"
#define min(a, b) a < b ? a : b;

uint64 console_write(uint64 va, uint64 len) {
    struct proc *p = curr_proc();
    char str[200];
    int size = copyinstr(p->pagetable, str, va, MIN(len, 200));
    for(int i = 0; i < size; ++i) {
        console_putchar(str[i]);
    }
    return size;
}

uint64 console_read(uint64 va, uint64 len) {
    struct proc *p = curr_proc();
    char str[200];
    for(int i = 0; i < len; ++i) {
        int c = console_getchar();
        str[i] = c;
    }
    copyout(p->pagetable, va, str, len);
    return len;
}

uint64 sys_write(int fd, uint64 va, uint64 len) {
    if(fd == 0 || fd==1) {
        return console_write(va, len);
    }
    struct proc *p = curr_proc();
    struct file *f = p->files[fd];
    if(f->type == FD_PIPE) {
        info("write to pipe at %p\n", f->pipe);
        return pipewrite(f->pipe, va, len);
    }
    error("unknown file type %d\n", f->type);
    panic("syswrite: unknown file type\n");
    return -1;
}

uint64 sys_read(int fd, uint64 va, uint64 len) {
    if(fd == 0 || fd==1) {
        return console_read(va, len);
    }
    struct proc *p = curr_proc();
    struct file *f = p->files[fd];
    if(f->type == FD_PIPE) {
        info("read to pipe at %p\n", f->pipe);
        return piperead(f->pipe, va, len);
    }
    error("unknown file type %d\n", f->type);
    panic("sysread: unknown file type\n");
    return -1;
}

uint64
sys_pipe(uint64 fdarray) {
    info("init pipe\n");
    struct proc *p = curr_proc();
    uint64 fd0, fd1;
    struct file* f0, *f1;
    if(f0 < 0 || f1 < 0) {
        return -1;
    }
    f0 = filealloc();
    f1 = filealloc();
    if(pipealloc(f0, f1) < 0)
        return -1;
    fd0 = fdalloc(f0);
    fd1 = fdalloc(f1);
    if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
       copyout(p->pagetable, fdarray+sizeof(uint64), (char *)&fd1, sizeof(fd1)) < 0){
        fileclose(f0);
        fileclose(f1);
        p->files[fd0] = 0;
        p->files[fd1] = 0;
        return -1;
    }
    return 0;
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

uint64 sys_spawn(uint64 va){
    struct proc* p = curr_proc();
    char name[200];
    copyinstr(p->pagetable, name, va, 200);
   uint64 sp = spawn(name);
    return sp;
}

uint64 sys_close(int fd) {
    if(fd == 0)
        return 0;
    struct proc *p = curr_proc();
    struct file *f = p->files[fd];
    if(f->type != FD_PIPE) {
        error("unknown file type %d\n", f->type);
        panic("fileclose: unknown file type\n");
    }
    fileclose(f);
    p->files[fd] = 0;
    return 0;
}

uint64 sys_mailread(void* buf, int len){
    if(len>256)
        len = 256;
    
    struct proc *p = curr_proc();
    p->pointWrite--;
    if (len < p->mailLen[p->pointRead]){ 
        if(copyout(p->pagetable,(uint64)buf,&p->mail[p->pointRead][0],len)!=-1)
        {
            p->pointRead++;
            return len;
        }
        else
            return -1;
    }
    else {
        if(len==0)
            return -1;
        int temp = p->mailLen[p->pointRead];
        printf("temp is %d \n",temp);
        if(copyout(p->pagetable,(uint64)buf,&p->mail[p->pointRead][0],p->mailLen[p->pointRead])!=-1){
            p->pointRead++;
            return temp;
        }
        else{
            return -1;
        }
    }
}

uint64 sys_mailwrite(int pid, void* buf, int len){
    if(len>256)
        len = 256;
    struct proc *p = get_proc(pid);
    if((uint64)buf == 0x90000000ULL)
        return -1;
    printf("point write %d",p->pointWrite);
    if(len==0 && p->pointWrite == 16)
       { 
           printf("this if");
           return -1;
       }
    else if(len == 0){
        printf("kkkkkk");
        return 0;
        }
    printf("here\n");
    printf("3");
    if(p->pointWrite == 16)
        return -1;
    printf("4");
    // copyin(p->pagetable,&p->mail[p->pointWrite],(uint64)buf,len);
    // void* temp = &buf;
    // char* charbuf = (char*) temp;
    copyin(p->pagetable,&p->mail[p->pointWrite][0],(uint64)buf,len);
    // for(int i=0;i<len;i++){
    //     copyin(p->pagetable,&p->mail[p->pointWrite][0],(uint64)buf,len);
    //     p->mail[p->pointWrite][i] = charbuf[i];
    // }
    printf("5");
    p->mailLen[p->pointWrite] = len;
    p->pointWrite++;
    return len;
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
            // printf("sys exit\n");
            ret = sys_exit(args[0]);
            break;
        case SYS_sched_yield:
            // printf("sys sched\n");
            ret = sys_sched_yield();
            break;
        case SYS_getpid:
            // printf("sy_getpid\n");
            ret = sys_getpid();
            break;
        case SYS_clone: // SYS_fork
            // printf("sy_clone\n");
            ret = sys_clone();
            break;
        case SYS_execve:
            // printf("sy_exec\n");
            ret = sys_exec(args[0]);
            break;
        case SYS_wait4:
            // printf("sy_wait4\n");
            ret = sys_wait(args[0], args[1]);
            // printf("ret in wait is %d \n",ret);
            break;
        case SYS_times:
            // printf("sy_times\n");
            ret = sys_times();
            break;
        case SYS_setpriority:
            // printf("sys prio\n");
            ret = sys_setpriority(args[0]);
            break;
        case SYS_gettimeofday:
            // printf("sys time\n");
            // printf("args0 is %p",args[0]);
            // printf("\n");
            // printf("physical args0 is %p",useraddr(p->pagetable,args[0]));
            ret = sys_get_time(args[0],0);
            // ret=-1;
            break;
        case SYS_mmap:
            // printf("sy_mmap\n");
            // printf("args0 is %p \n",args[0]);
            // printf("args1 is %p \n",args[1]);
            ret = sys_mmap(args[0],args[1],args[2]);
            // printf("ret is %d \n",ret);
            break;
        case SYS_munmap:
            // printf("sy_unmap\n");
            ret = sys_munmap(args[0],args[1]);
            // printf("ret is %d \n",ret);
            break;
        case SYS_spawn:
            // printf("sy_spawn\n");
            // printf("%p",args[0]);
            ret = sys_spawn(args[0]);
            // printf("ret in spawn is %d\n",ret);
            break;
        case SYS_mailread:
            ret = sys_mailread((void*)args[0],args[1]);
            printf("ret in mail_read is:%d\n",ret);
            break;
        case SYS_mailwrite:
            // printf("in here");
            // printf("%p\n",args[0]);
            // printf("%p\n",args[1]);
            // printf("%p\n",args[2]);

            ret = sys_mailwrite(args[0],(void*)args[1],args[2]);
            printf("ret in mail_write is:%d\n",ret);
            break;
        default:
            ret = -1;
            warn("unknown syscall %d\n", id);
    }
    trapframe->a0 = ret;
    // printf("syscall ret %d\n", ret);
}
