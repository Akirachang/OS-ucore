#include "defs.h"
#include "proc.h"
#include "trap.h"

struct proc pool[NPROC];
char kstack[NPROC][PAGE_SIZE];
__attribute__ ((aligned (4096))) char ustack[NPROC][PAGE_SIZE];
char trapframe[NPROC][PAGE_SIZE];

extern char boot_stack_top[];
struct proc* current_proc;
struct proc idle;


struct proc* curr_proc() {
    return current_proc;
}

void
procinit(void)
{
    struct proc *p;
    for(p = pool; p < &pool[NPROC]; p++) {
        p->state = UNUSED;
        p->kstack = (uint64)kstack[p - pool];
        p->ustack = (uint64)ustack[p - pool];
        p->trapframe = (struct trapframe*)trapframe[p - pool];
        p->pid=-1;
    }
    idle.kstack = (uint64)boot_stack_top;
    idle.pid = 0;
    idle.killed = 0;
}

int allocpid() {
    static int PID = 1;
    return PID++;
}

struct proc* allocproc(void)
{
    struct proc *p;
    for(p = pool; p < &pool[NPROC]; p++) {
        if(p->state == UNUSED) {
            goto found;
        }
    }
    return 0;

    found:
    p->pid = allocpid();
    p->state = USED;
    memset(&p->context, 0, sizeof(p->context));
    memset(p->trapframe, 0, PAGE_SIZE);
    memset((void*)p->kstack, 0, PAGE_SIZE);
    p->context.ra = (uint64)usertrapret;
    p->context.sp = p->kstack + PAGE_SIZE;
    p->prio = 16; //default prio
    p->pass=INT_MAX/16;
    p->stride = 0;
    return p;
}

void
scheduler(void)
{
    for(;;){
        struct proc *p;
        struct proc *chosen=0;
        printf("here");
        for(p = pool; p < &pool[NPROC]; p++) {
            // printf("here2");
            if(p->state == RUNNABLE && 
            (!chosen||p->stride < chosen->stride)) {
                chosen = p;
                printf("chosen");
            }
        }
        chosen->state = RUNNING;
        chosen->stride+=chosen->pass; //将对应的 stride 加上其对应的步长 pass
        current_proc = chosen;
        swtch(&idle.context, &chosen->context);
    }
}

// Switch to scheduler.  Must hold only p->lock
// and have changed proc->state. Saves and restores
// intena because intena is a property of this
// kernel thread, not this CPU. It should
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    struct proc *p = curr_proc();
    if(p->state == RUNNING)
        panic("sched running");
    swtch(&p->context, &idle.context);
}

// Give up the CPU for one scheduling round.
void yield(void)
{
    current_proc->state = RUNNABLE;
    sched();
}

void exit(int code) {
    struct proc *p = curr_proc();
    printf("proc %d exit with %d\n", p->pid, code);
    p->state = UNUSED;
    finished();
    sched();
}

uint64 set_priority(int code) {
    struct proc *p = curr_proc();
    // printf("code is %d",code);
    if(code>=2&&code<=INT_MAX){
        p->prio=code;
        return code;
    }
    else{
        return -1;
    }
}

uint64 get_time(TimeVal* ts, int tz) {
    ts->sec = get_cycle()/12500000;
    ts->usec = (get_cycle()%12500000)*10/125;
    // printf("hi2");
    return 0;
}