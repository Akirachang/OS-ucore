#include "defs.h"
#include "fcntl.h"
#include "proc.h"
#include "syscall_ids.h"
#include "trap.h"
#include "riscv.h"
#include "fs.h"

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
    for(int i = 0; i < MIN(len, 200); ++i) {
        int c = console_getchar();
        str[i] = c;
    }
    copyout(p->pagetable, va, str, len);
    return len;
}

uint64 sys_write(int fd, uint64 va, uint64 len) {
    if(fd>15)
        return -1;
    if(fd<=2) {
        return console_write(va, len);
    }
    struct proc *p = curr_proc();
    struct file *f = p->files[fd];
    if(f->type == FD_PIPE) {
        info("write to pipe at %p\n", f->pipe);
        return pipewrite(f->pipe, va, len);
         } else if (f->type == FD_INODE) {
        return filewrite(f, va, len);
    }
    error("unknown file type %d\n", f->type);
    panic("syswrite: unknown file type\n");
    return -1;
}

uint64 sys_read(int fd, uint64 va, uint64 len) {
    if(fd == 0 ) {
        return console_read(va, len);
    }
    struct proc *p = curr_proc();
    struct file *f = p->files[fd];
    if(f->type == FD_PIPE) {
        info("read to pipe at %p\n", f->pipe);
        return piperead(f->pipe, va, len);
         } else if (f->type == FD_INODE) {
        return fileread(f, va, len);
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
    uint64 time = get_time_ms();
    return time;
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

    fileclose(f);
    p->files[fd] = 0;
    return 0;
}

uint64 sys_openat(uint64 va, uint64 omode, uint64 _flags) {
    struct proc *p = curr_proc();
    char path_dir[200];
    copyinstr(p->pagetable, path_dir, va, 200);
    return fileopen(path_dir, omode);
}

uint64 sys_mailread(void* buf, int len){
    // printf("here1");
    struct proc *p = curr_proc();
    struct mails *mail = &p -> mail;
    if(mail->end == mail -> begin)
        return -1;
    // printf("here2");
    if(len>mail->len[mail->begin])
        len = mail->len[mail->begin];
    // printf("here3");
    if(len == 0)
        return 0;
    int cpyout = copyout(p->pagetable,(uint64)buf, mail->mails[mail->begin],len);
    // printf("here4");
    // printf("%d",cpyout);
    if(cpyout  == -1)
        return -1;
    else{
        int update = (1+mail->begin) %17;
        mail->begin = update;
        return len;
    }
}

uint64 sys_mailwrite(int pid, void* buf, int len){
    struct proc *p = get_proc(pid);
    // printf("here");
    struct mails *mail = &p ->mail;
        // printf("here1");
    if(len>256)
        len=256;
    if((1+mail->end)%17 == mail->begin)
        return -1;
    if(len==0)
        return 0;
    mail->len[mail->end]=len;
        // printf("here2");
    int cpyin = copyin(curr_proc()->pagetable,mail->mails[mail->end],(uint64)buf, len);
        // printf("here3");
    if(cpyin == -1)
        return -1;
    else {
        int update = (1+mail->end)%17;
        mail->end = update;
        return len;
    }
}

uint64 sys_link(uint64 old_DIR_fd, char* old_path, uint64 new_DIR_fd, char* new_path, uint64 flags){
    char outdate_path[DIRSIZ], currNew_path[DIRSIZ];
    struct proc *p = curr_proc();
    pagetable_t pagetable = p->pagetable;
    copyin(pagetable, outdate_path, (uint64)old_path, DIRSIZ);
    copyin(pagetable, currNew_path, (uint64)new_path, DIRSIZ);
    struct inode *ip;
    struct inode *dp = root_dir();
    if(!strncmp(outdate_path, currNew_path, DIRSIZ)){
        //printf("here");
        return -1;
    }
    if (!(ip = dirlookup(dp, outdate_path, 0))){
        //printf("here1");
        return -1;
    }
    if(dirlink(dp, currNew_path, ip->inum) < 0){
        //printf("here2");
        return -1;
    }
    return 0;
}

uint64 sys_unlink(uint64 DIR_fd, char* path, uint64 flags) {
    info("into function unlinkat\n");
    char path_dir[DIRSIZ];
    pagetable_t pagetable = curr_proc()->pagetable;
    copyin(pagetable, path_dir, (uint64)path, DIRSIZ);
    struct inode *ip;
    struct inode *dp = root_dir();
    if (!(ip = dirlookup(dp, path_dir, 0)))
    {
        return -1;}
    if(dirunlink(dp, path_dir) < 0)
    {
        return -1;
        }
    return 0;
}

uint64 sys_fstat(uint64 fd, struct Stat* st){
    info("into function fstat\n");
    info("fd = %d\n", fd);
    if(fd < 0 || fd >= 16){
        printf("exceeded!\n");
        return -1;
    }
    struct inode *ip;
    struct inode *dp = root_dir();
    ip = curr_proc()->files[fd]->ip;
    int numlink = 0;
    int i;
    struct dirent de;
    for(i = 0; i < dp->size; i += sizeof(de)){
        if(readi(dp, 0, (uint64)&de, i, sizeof(de)) != sizeof(de))
        {
            return -1;
        }
        if(de.inum == ip->inum) 
        {
            numlink++;
        }
    }
    struct Stat status;
    status.dev = ip->dev;
    status.ino = ip->inum;
    if(ip->type == T_DIR)
    {
        status.mode = DIR;
    }
    else if(ip->type == T_FILE){
        status.mode = FILE;
    }
    else{
        return -1;
    }
    status.nlink = numlink;
    if(copyout(p->pagetable, (uint64)st, (char*)&status, sizeof(status)) < 0){
        return -1;
    }
    return 0;
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
        case SYS_openat:
            ret = sys_openat(args[0], args[1], args[2]);
            break;
        case SYS_close:
            ret = sys_close(args[0]);
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
        case SYS_pipe2:
            ret = sys_pipe(args[0]);
            break;
        case SYS_linkat:
            ret = sys_link(args[0], (char*)args[1], args[2], (char*)args[3], args[4]);
            break;

        case SYS_unlinkat: 
            ret = sys_unlink(args[0], (char*)args[1], args[2]);
            break;
        case SYS_fstat:
            ret = sys_fstat(args[0],(struct Stat*)args[1]);
            break;
        default:
            ret = -1;
            warn("unknown syscall %d\n", id);
    }
    trapframe->a0 = ret;
    // printf("syscall ret %d\n", ret);
}
