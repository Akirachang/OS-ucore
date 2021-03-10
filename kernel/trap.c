#include "defs.h"
#include "trap.h"
#include "riscv.h"
// #include "proc.h"
// #include "riscv.h"
// #include "memory_layout.h"

extern char trampoline[], uservec[], boot_stack_top[];
extern void* userret(uint64);


void trapinit(void) {
    // intr_on();
    // set_kerneltrap();
    w_stvec((uint64)uservec & ~0x3);
}

// void kerneltrap() {
//     if((r_sstatus() & SSTATUS_SPP) == 0)
//         panic("kerneltrap: not from supervisor mode");
//     panic("trap from kernel\n");
// }

// // set up to take exceptions and traps while in the kernel.
// void set_usertrap(void) {
//     w_stvec(((uint64) TRAMPOLINE + (uservec - trampoline)) & ~0x3); // DIRECT
// }

// void set_kerneltrap(void) {
//     w_stvec((uint64)kerneltrap & ~0x3); // DIRECT
// }

// void unknown_trap() {
//     error("unknown trap: %p, stval = %p sepc = %p\n", r_scause(), r_stval(), r_sepc());
//     exit(-1);
// }

//
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void usertrap(struct trapframe *trapframe){
    //here
    if((r_sstatus() & SSTATUS_SPP) != 0)
        panic("usertrap: not from user mode");

    uint64 cause = r_scause();
    if(cause == UserEnvCall) {
        trapframe->epc += 4;
        syscall();
        return usertrapret(trapframe, (uint64)boot_stack_top);
    }
    switch(cause) {
        case StoreFault:
        case StorePageFault:
        case InstructionFault:
        case InstructionPageFault:
        case LoadFault:
        case LoadPageFault:
            printf(
                    "%d in application, bad addr = %p, bad instruction = %p, core dumped.\n",
                    cause,
                    r_stval(),
                    trapframe->epc
            );
            break;
        case IllegalInstruction:
            printf("IllegalInstruction in application, epc = %p, core dumped.\n", trapframe->epc);
            break;
        default:
            printf("unknown trap: %p, stval = %p sepc = %p\n", r_scause(), r_stval(), r_sepc());
            break;
    }
    printf("switch to next app\n");
    run_next_app();
    printf("all apps over\n");
    shutdown();
}

void usertrapret(struct trapframe* trapframe, uint64 kstack)
{
    //here
    trapframe->kernel_satp = r_satp();         // kernel page table
    trapframe->kernel_sp = kstack + PGSIZE; // process's kernel stack
    trapframe->kernel_trap = (uint64)usertrap;
    trapframe->kernel_hartid = r_tp();         // hartid for cpuid()

    w_sepc(trapframe->epc);
    // set up the registers that trampoline.S's sret will use
    // to get to user space.

    // set S Previous Privilege mode to User.
    uint64 x = r_sstatus();
    x &= ~SSTATUS_SPP;// clear SPP to 0 for user mode
    x |= SSTATUS_SPIE;// enable interrupts in user mode
    w_sstatus(x);

    // tell trampoline.S the user page table to switch to.
    // uint64 satp = MAKE_SATP(curr_proc()->pagetable);
    // trace("return to user at %p\n", trapframe->epc);
    // uint64 fn = TRAMPOLINE + (userret - trampoline);
    // ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    userret((uint64)trapframe);

}