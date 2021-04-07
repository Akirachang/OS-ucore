
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_entry>:
    80200000:	00017117          	auipc	sp,0x17
    80200004:	00010113          	mv	sp,sp
    80200008:	247000ef          	jal	ra,80200a4e <main>

000000008020000c <swtch>:
    8020000c:	00153023          	sd	ra,0(a0)
    80200010:	00253423          	sd	sp,8(a0)
    80200014:	e900                	sd	s0,16(a0)
    80200016:	ed04                	sd	s1,24(a0)
    80200018:	03253023          	sd	s2,32(a0)
    8020001c:	03353423          	sd	s3,40(a0)
    80200020:	03453823          	sd	s4,48(a0)
    80200024:	03553c23          	sd	s5,56(a0)
    80200028:	05653023          	sd	s6,64(a0)
    8020002c:	05753423          	sd	s7,72(a0)
    80200030:	05853823          	sd	s8,80(a0)
    80200034:	05953c23          	sd	s9,88(a0)
    80200038:	07a53023          	sd	s10,96(a0)
    8020003c:	07b53423          	sd	s11,104(a0)
    80200040:	0005b083          	ld	ra,0(a1)
    80200044:	0085b103          	ld	sp,8(a1)
    80200048:	6980                	ld	s0,16(a1)
    8020004a:	6d84                	ld	s1,24(a1)
    8020004c:	0205b903          	ld	s2,32(a1)
    80200050:	0285b983          	ld	s3,40(a1)
    80200054:	0305ba03          	ld	s4,48(a1)
    80200058:	0385ba83          	ld	s5,56(a1)
    8020005c:	0405bb03          	ld	s6,64(a1)
    80200060:	0485bb83          	ld	s7,72(a1)
    80200064:	0505bc03          	ld	s8,80(a1)
    80200068:	0585bc83          	ld	s9,88(a1)
    8020006c:	0605bd03          	ld	s10,96(a1)
    80200070:	0685bd83          	ld	s11,104(a1)
    80200074:	8082                	ret

0000000080200076 <loop>:
typedef struct{
    uint64 sec;	// 自 Unix 纪元起的秒数
    uint64 usec;	// 微秒数
}TimeVal;
#endif
void loop() {
    80200076:	1141                	addi	sp,sp,-16
    80200078:	e422                	sd	s0,8(sp)
    8020007a:	0800                	addi	s0,sp,16
    for(;;);
    8020007c:	a001                	j	8020007c <loop+0x6>

000000008020007e <panic>:
}

void panic(char *s)
{
    8020007e:	1101                	addi	sp,sp,-32
    80200080:	ec06                	sd	ra,24(sp)
    80200082:	e822                	sd	s0,16(sp)
    80200084:	e426                	sd	s1,8(sp)
    80200086:	1000                	addi	s0,sp,32
    80200088:	84aa                	mv	s1,a0
    error("panic: %s", s);
    8020008a:	00006717          	auipc	a4,0x6
    8020008e:	18672703          	lw	a4,390(a4) # 80206210 <debug_level>
    80200092:	478d                	li	a5,3
    80200094:	02e7d863          	bge	a5,a4,802000c4 <panic+0x46>
    printf(s);
    80200098:	8526                	mv	a0,s1
    8020009a:	00002097          	auipc	ra,0x2
    8020009e:	980080e7          	jalr	-1664(ra) # 80201a1a <printf>
    printf("\n");
    802000a2:	00004517          	auipc	a0,0x4
    802000a6:	48650513          	addi	a0,a0,1158 # 80204528 <digits+0x30>
    802000aa:	00002097          	auipc	ra,0x2
    802000ae:	970080e7          	jalr	-1680(ra) # 80201a1a <printf>
    shutdown();
    802000b2:	00002097          	auipc	ra,0x2
    802000b6:	b46080e7          	jalr	-1210(ra) # 80201bf8 <shutdown>
    802000ba:	60e2                	ld	ra,24(sp)
    802000bc:	6442                	ld	s0,16(sp)
    802000be:	64a2                	ld	s1,8(sp)
    802000c0:	6105                	addi	sp,sp,32
    802000c2:	8082                	ret
    error("panic: %s", s);
    802000c4:	872a                	mv	a4,a0
    802000c6:	00125697          	auipc	a3,0x125
    802000ca:	0126a683          	lw	a3,18(a3) # 803250d8 <curr_pid>
    802000ce:	00005617          	auipc	a2,0x5
    802000d2:	f4a63603          	ld	a2,-182(a2) # 80205018 <LEVEL+0x18>
    802000d6:	00005597          	auipc	a1,0x5
    802000da:	f565a583          	lw	a1,-170(a1) # 8020502c <COLOR+0xc>
    802000de:	00004517          	auipc	a0,0x4
    802000e2:	f2250513          	addi	a0,a0,-222 # 80204000 <e_text>
    802000e6:	00002097          	auipc	ra,0x2
    802000ea:	934080e7          	jalr	-1740(ra) # 80201a1a <printf>
    802000ee:	b76d                	j	80200098 <panic+0x1a>

00000000802000f0 <kerneltrap>:

// void unknown_trap() {
//     printf("unknown trap: %p, stval = %p\n", r_scause(), r_stval());
//     exit(-1);
// }
void kerneltrap() {
    802000f0:	1141                	addi	sp,sp,-16
    802000f2:	e406                	sd	ra,8(sp)
    802000f4:	e022                	sd	s0,0(sp)
    802000f6:	0800                	addi	s0,sp,16
#define SSTATUS_SIE (1L << 1)// Supervisor Interrupt Enable
#define SSTATUS_UIE (1L << 0)// User Interrupt Enable

static inline uint64 r_sstatus() {
    uint64 x;
    asm volatile("csrr %0, sstatus"
    802000f8:	100027f3          	csrr	a5,sstatus
    if((r_sstatus() & SSTATUS_SPP) == 0)
    802000fc:	1007f793          	andi	a5,a5,256
    80200100:	cf89                	beqz	a5,8020011a <kerneltrap+0x2a>
        panic("kerneltrap: not from supervisor mode");
    panic("trap from kernel\n");
    80200102:	00004517          	auipc	a0,0x4
    80200106:	f4650513          	addi	a0,a0,-186 # 80204048 <e_text+0x48>
    8020010a:	00000097          	auipc	ra,0x0
    8020010e:	f74080e7          	jalr	-140(ra) # 8020007e <panic>
}
    80200112:	60a2                	ld	ra,8(sp)
    80200114:	6402                	ld	s0,0(sp)
    80200116:	0141                	addi	sp,sp,16
    80200118:	8082                	ret
        panic("kerneltrap: not from supervisor mode");
    8020011a:	00004517          	auipc	a0,0x4
    8020011e:	f0650513          	addi	a0,a0,-250 # 80204020 <e_text+0x20>
    80200122:	00000097          	auipc	ra,0x0
    80200126:	f5c080e7          	jalr	-164(ra) # 8020007e <panic>
    8020012a:	bfe1                	j	80200102 <kerneltrap+0x12>

000000008020012c <trapinit>:
void trapinit() {
    8020012c:	1141                	addi	sp,sp,-16
    8020012e:	e422                	sd	s0,8(sp)
    80200130:	0800                	addi	s0,sp,16
    80200132:	100027f3          	csrr	a5,sstatus
                 : "=r"(x));
    return x;
}

// enable device interrupts
static inline void intr_on() { w_sstatus(r_sstatus() | SSTATUS_SIE); }
    80200136:	0027e793          	ori	a5,a5,2
    asm volatile("csrw sstatus, %0"
    8020013a:	10079073          	csrw	sstatus,a5
void set_usertrap(void) {
    w_stvec(((uint64) TRAMPOLINE + (uservec - trampoline)) & ~0x3); // DIRECT
}

void set_kerneltrap(void) {
    w_stvec((uint64)kerneltrap & ~0x3); // DIRECT
    8020013e:	00000797          	auipc	a5,0x0
    80200142:	fb278793          	addi	a5,a5,-78 # 802000f0 <kerneltrap>
    80200146:	9bf1                	andi	a5,a5,-4
    asm volatile("csrw stvec, %0"
    80200148:	10579073          	csrw	stvec,a5
}
    8020014c:	6422                	ld	s0,8(sp)
    8020014e:	0141                	addi	sp,sp,16
    80200150:	8082                	ret

0000000080200152 <set_usertrap>:
void set_usertrap(void) {
    80200152:	1141                	addi	sp,sp,-16
    80200154:	e422                	sd	s0,8(sp)
    80200156:	0800                	addi	s0,sp,16
    w_stvec(((uint64) TRAMPOLINE + (uservec - trampoline)) & ~0x3); // DIRECT
    80200158:	04000737          	lui	a4,0x4000
    8020015c:	00003797          	auipc	a5,0x3
    80200160:	ea478793          	addi	a5,a5,-348 # 80203000 <trampoline>
    80200164:	00003697          	auipc	a3,0x3
    80200168:	e9c68693          	addi	a3,a3,-356 # 80203000 <trampoline>
    8020016c:	8f95                	sub	a5,a5,a3
    8020016e:	177d                	addi	a4,a4,-1
    80200170:	0732                	slli	a4,a4,0xc
    80200172:	97ba                	add	a5,a5,a4
    80200174:	9bf1                	andi	a5,a5,-4
    80200176:	10579073          	csrw	stvec,a5
}
    8020017a:	6422                	ld	s0,8(sp)
    8020017c:	0141                	addi	sp,sp,16
    8020017e:	8082                	ret

0000000080200180 <set_kerneltrap>:
void set_kerneltrap(void) {
    80200180:	1141                	addi	sp,sp,-16
    80200182:	e422                	sd	s0,8(sp)
    80200184:	0800                	addi	s0,sp,16
    w_stvec((uint64)kerneltrap & ~0x3); // DIRECT
    80200186:	00000797          	auipc	a5,0x0
    8020018a:	f6a78793          	addi	a5,a5,-150 # 802000f0 <kerneltrap>
    8020018e:	9bf1                	andi	a5,a5,-4
    80200190:	10579073          	csrw	stvec,a5
}
    80200194:	6422                	ld	s0,8(sp)
    80200196:	0141                	addi	sp,sp,16
    80200198:	8082                	ret

000000008020019a <unknown_trap>:

void unknown_trap() {
    8020019a:	1141                	addi	sp,sp,-16
    8020019c:	e406                	sd	ra,8(sp)
    8020019e:	e022                	sd	s0,0(sp)
    802001a0:	0800                	addi	s0,sp,16
    error("unknown trap: %p, stval = %p sepc = %p\n", r_scause(), r_stval(), r_sepc());
    802001a2:	00006717          	auipc	a4,0x6
    802001a6:	06e72703          	lw	a4,110(a4) # 80206210 <debug_level>
    802001aa:	478d                	li	a5,3
    802001ac:	00e7db63          	bge	a5,a4,802001c2 <unknown_trap+0x28>
    exit(-1);
    802001b0:	557d                	li	a0,-1
    802001b2:	00002097          	auipc	ra,0x2
    802001b6:	0fa080e7          	jalr	250(ra) # 802022ac <exit>
}
    802001ba:	60a2                	ld	ra,8(sp)
    802001bc:	6402                	ld	s0,0(sp)
    802001be:	0141                	addi	sp,sp,16
    802001c0:	8082                	ret
    asm volatile("csrr %0, scause"
    802001c2:	14202773          	csrr	a4,scause
    asm volatile("csrr %0, stval"
    802001c6:	143027f3          	csrr	a5,stval
    asm volatile("csrr %0, sepc"
    802001ca:	14102873          	csrr	a6,sepc
    error("unknown trap: %p, stval = %p sepc = %p\n", r_scause(), r_stval(), r_sepc());
    802001ce:	00125697          	auipc	a3,0x125
    802001d2:	f0a6a683          	lw	a3,-246(a3) # 803250d8 <curr_pid>
    802001d6:	00005617          	auipc	a2,0x5
    802001da:	e4263603          	ld	a2,-446(a2) # 80205018 <LEVEL+0x18>
    802001de:	00005597          	auipc	a1,0x5
    802001e2:	e4e5a583          	lw	a1,-434(a1) # 8020502c <COLOR+0xc>
    802001e6:	00004517          	auipc	a0,0x4
    802001ea:	e7a50513          	addi	a0,a0,-390 # 80204060 <e_text+0x60>
    802001ee:	00002097          	auipc	ra,0x2
    802001f2:	82c080e7          	jalr	-2004(ra) # 80201a1a <printf>
    802001f6:	bf6d                	j	802001b0 <unknown_trap+0x16>

00000000802001f8 <usertrapret>:
        }
    }
    usertrapret();
}

void usertrapret() {
    802001f8:	1101                	addi	sp,sp,-32
    802001fa:	ec06                	sd	ra,24(sp)
    802001fc:	e822                	sd	s0,16(sp)
    802001fe:	e426                	sd	s1,8(sp)
    80200200:	e04a                	sd	s2,0(sp)
    80200202:	1000                	addi	s0,sp,32
    w_stvec(((uint64) TRAMPOLINE + (uservec - trampoline)) & ~0x3); // DIRECT
    80200204:	04000737          	lui	a4,0x4000
    80200208:	00003797          	auipc	a5,0x3
    8020020c:	df878793          	addi	a5,a5,-520 # 80203000 <trampoline>
    80200210:	00003697          	auipc	a3,0x3
    80200214:	df068693          	addi	a3,a3,-528 # 80203000 <trampoline>
    80200218:	8f95                	sub	a5,a5,a3
    8020021a:	177d                	addi	a4,a4,-1
    8020021c:	0732                	slli	a4,a4,0xc
    8020021e:	97ba                	add	a5,a5,a4
    80200220:	9bf1                	andi	a5,a5,-4
    asm volatile("csrw stvec, %0"
    80200222:	10579073          	csrw	stvec,a5
    set_usertrap();
    struct trapframe *trapframe = curr_proc()->trapframe;
    80200226:	00002097          	auipc	ra,0x2
    8020022a:	b7a080e7          	jalr	-1158(ra) # 80201da0 <curr_proc>
    8020022e:	7504                	ld	s1,40(a0)
    asm volatile("csrr %0, satp"
    80200230:	180027f3          	csrr	a5,satp
    trapframe->kernel_satp = r_satp();                   // kernel page table
    80200234:	e09c                	sd	a5,0(s1)
    trapframe->kernel_sp = curr_proc()->kstack + PGSIZE;// process's kernel stack
    80200236:	00002097          	auipc	ra,0x2
    8020023a:	b6a080e7          	jalr	-1174(ra) # 80201da0 <curr_proc>
    8020023e:	711c                	ld	a5,32(a0)
    80200240:	6705                	lui	a4,0x1
    80200242:	97ba                	add	a5,a5,a4
    80200244:	e49c                	sd	a5,8(s1)
    trapframe->kernel_trap = (uint64) usertrap;
    80200246:	00000797          	auipc	a5,0x0
    8020024a:	0a878793          	addi	a5,a5,168 # 802002ee <usertrap>
    8020024e:	e89c                	sd	a5,16(s1)

// read and write tp, the thread pointer, which holds
// this core's hartid (core number), the index into cpus[].
static inline uint64 r_tp() {
    uint64 x;
    asm volatile("mv %0, tp"
    80200250:	8792                	mv	a5,tp
    trapframe->kernel_hartid = r_tp();// hartid for cpuid()
    80200252:	f09c                	sd	a5,32(s1)
    asm volatile("csrw sepc, %0"
    80200254:	6c9c                	ld	a5,24(s1)
    80200256:	14179073          	csrw	sepc,a5
    asm volatile("csrr %0, sstatus"
    8020025a:	100027f3          	csrr	a5,sstatus
    // set up the registers that trampoline.S's sret will use
    // to get to user space.

    // set S Previous Privilege mode to User.
    uint64 x = r_sstatus();
    x &= ~SSTATUS_SPP;// clear SPP to 0 for user mode
    8020025e:	eff7f793          	andi	a5,a5,-257
    x |= SSTATUS_SPIE;// enable interrupts in user mode
    80200262:	0207e793          	ori	a5,a5,32
    asm volatile("csrw sstatus, %0"
    80200266:	10079073          	csrw	sstatus,a5
    w_sstatus(x);

    // tell trampoline.S the user page table to switch to.
    //    userret((uint64) trapframe);
    uint64 satp = MAKE_SATP(curr_proc()->pagetable);
    8020026a:	00002097          	auipc	ra,0x2
    8020026e:	b36080e7          	jalr	-1226(ra) # 80201da0 <curr_proc>
    80200272:	01053903          	ld	s2,16(a0)
    80200276:	00c95913          	srli	s2,s2,0xc
    8020027a:	57fd                	li	a5,-1
    8020027c:	17fe                	slli	a5,a5,0x3f
    8020027e:	00f96933          	or	s2,s2,a5
    trace("return to user at %p\n", trapframe->epc);
    80200282:	00006797          	auipc	a5,0x6
    80200286:	f8e7a783          	lw	a5,-114(a5) # 80206210 <debug_level>
    8020028a:	02f05c63          	blez	a5,802002c2 <usertrapret+0xca>
    uint64 fn = TRAMPOLINE + (userret - trampoline);
    8020028e:	04000737          	lui	a4,0x4000
    80200292:	00003797          	auipc	a5,0x3
    80200296:	e0678793          	addi	a5,a5,-506 # 80203098 <userret>
    8020029a:	00003697          	auipc	a3,0x3
    8020029e:	d6668693          	addi	a3,a3,-666 # 80203000 <trampoline>
    802002a2:	8f95                	sub	a5,a5,a3
    802002a4:	177d                	addi	a4,a4,-1
    802002a6:	0732                	slli	a4,a4,0xc
    802002a8:	97ba                	add	a5,a5,a4
    // printf("return to user1\n");
    ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    802002aa:	85ca                	mv	a1,s2
    802002ac:	02000537          	lui	a0,0x2000
    802002b0:	157d                	addi	a0,a0,-1
    802002b2:	0536                	slli	a0,a0,0xd
    802002b4:	9782                	jalr	a5
    // printf("return to user2\n");

    802002b6:	60e2                	ld	ra,24(sp)
    802002b8:	6442                	ld	s0,16(sp)
    802002ba:	64a2                	ld	s1,8(sp)
    802002bc:	6902                	ld	s2,0(sp)
    802002be:	6105                	addi	sp,sp,32
    802002c0:	8082                	ret
    trace("return to user at %p\n", trapframe->epc);
    802002c2:	6c98                	ld	a4,24(s1)
    802002c4:	00125697          	auipc	a3,0x125
    802002c8:	e146a683          	lw	a3,-492(a3) # 803250d8 <curr_pid>
    802002cc:	00005617          	auipc	a2,0x5
    802002d0:	d3463603          	ld	a2,-716(a2) # 80205000 <LEVEL>
    802002d4:	00005597          	auipc	a1,0x5
    802002d8:	d4c5a583          	lw	a1,-692(a1) # 80205020 <COLOR>
    802002dc:	00004517          	auipc	a0,0x4
    802002e0:	dc450513          	addi	a0,a0,-572 # 802040a0 <e_text+0xa0>
    802002e4:	00001097          	auipc	ra,0x1
    802002e8:	736080e7          	jalr	1846(ra) # 80201a1a <printf>
    802002ec:	b74d                	j	8020028e <usertrapret+0x96>

00000000802002ee <usertrap>:
void usertrap() {
    802002ee:	1101                	addi	sp,sp,-32
    802002f0:	ec06                	sd	ra,24(sp)
    802002f2:	e822                	sd	s0,16(sp)
    802002f4:	e426                	sd	s1,8(sp)
    802002f6:	1000                	addi	s0,sp,32
    w_stvec((uint64)kerneltrap & ~0x3); // DIRECT
    802002f8:	00000797          	auipc	a5,0x0
    802002fc:	df878793          	addi	a5,a5,-520 # 802000f0 <kerneltrap>
    80200300:	9bf1                	andi	a5,a5,-4
    asm volatile("csrw stvec, %0"
    80200302:	10579073          	csrw	stvec,a5
    struct trapframe *trapframe = curr_proc()->trapframe;
    80200306:	00002097          	auipc	ra,0x2
    8020030a:	a9a080e7          	jalr	-1382(ra) # 80201da0 <curr_proc>
    8020030e:	7504                	ld	s1,40(a0)
    asm volatile("csrr %0, sstatus"
    80200310:	100027f3          	csrr	a5,sstatus
    if ((r_sstatus() & SSTATUS_SPP) != 0)
    80200314:	1007f793          	andi	a5,a5,256
    80200318:	e395                	bnez	a5,8020033c <usertrap+0x4e>
    asm volatile("csrr %0, scause"
    8020031a:	14202773          	csrr	a4,scause
    if(cause & (1ULL << 63)) {
    8020031e:	02074863          	bltz	a4,8020034e <usertrap+0x60>
        switch(cause) {
    80200322:	47b5                	li	a5,13
    80200324:	10e7e963          	bltu	a5,a4,80200436 <usertrap+0x148>
    80200328:	00271693          	slli	a3,a4,0x2
    8020032c:	00004617          	auipc	a2,0x4
    80200330:	e7c60613          	addi	a2,a2,-388 # 802041a8 <e_text+0x1a8>
    80200334:	96b2                	add	a3,a3,a2
    80200336:	429c                	lw	a5,0(a3)
    80200338:	97b2                	add	a5,a5,a2
    8020033a:	8782                	jr	a5
        panic("usertrap: not from user mode");
    8020033c:	00004517          	auipc	a0,0x4
    80200340:	d8c50513          	addi	a0,a0,-628 # 802040c8 <e_text+0xc8>
    80200344:	00000097          	auipc	ra,0x0
    80200348:	d3a080e7          	jalr	-710(ra) # 8020007e <panic>
    8020034c:	b7f9                	j	8020031a <usertrap+0x2c>
        cause &= ~(1ULL << 63);
    8020034e:	0706                	slli	a4,a4,0x1
    80200350:	8305                	srli	a4,a4,0x1
        switch(cause) {
    80200352:	4795                	li	a5,5
    80200354:	00f70f63          	beq	a4,a5,80200372 <usertrap+0x84>
            unknown_trap();
    80200358:	00000097          	auipc	ra,0x0
    8020035c:	e42080e7          	jalr	-446(ra) # 8020019a <unknown_trap>
    usertrapret();
    80200360:	00000097          	auipc	ra,0x0
    80200364:	e98080e7          	jalr	-360(ra) # 802001f8 <usertrapret>
}
    80200368:	60e2                	ld	ra,24(sp)
    8020036a:	6442                	ld	s0,16(sp)
    8020036c:	64a2                	ld	s1,8(sp)
    8020036e:	6105                	addi	sp,sp,32
    80200370:	8082                	ret
            printf("time interrupt!\n");
    80200372:	00004517          	auipc	a0,0x4
    80200376:	d7650513          	addi	a0,a0,-650 # 802040e8 <e_text+0xe8>
    8020037a:	00001097          	auipc	ra,0x1
    8020037e:	6a0080e7          	jalr	1696(ra) # 80201a1a <printf>
            set_next_timer();
    80200382:	00002097          	auipc	ra,0x2
    80200386:	094080e7          	jalr	148(ra) # 80202416 <set_next_timer>
            yield();
    8020038a:	00002097          	auipc	ra,0x2
    8020038e:	d44080e7          	jalr	-700(ra) # 802020ce <yield>
            break;
    80200392:	b7f9                	j	80200360 <usertrap+0x72>
            trapframe->epc += 4;
    80200394:	6c9c                	ld	a5,24(s1)
    80200396:	0791                	addi	a5,a5,4
    80200398:	ec9c                	sd	a5,24(s1)
            syscall();
    8020039a:	00001097          	auipc	ra,0x1
    8020039e:	b0a080e7          	jalr	-1270(ra) # 80200ea4 <syscall>
            break;
    802003a2:	bf7d                	j	80200360 <usertrap+0x72>
            error(
    802003a4:	00006697          	auipc	a3,0x6
    802003a8:	e6c6a683          	lw	a3,-404(a3) # 80206210 <debug_level>
    802003ac:	478d                	li	a5,3
    802003ae:	00d7d863          	bge	a5,a3,802003be <usertrap+0xd0>
            exit(-2);
    802003b2:	5579                	li	a0,-2
    802003b4:	00002097          	auipc	ra,0x2
    802003b8:	ef8080e7          	jalr	-264(ra) # 802022ac <exit>
            break;
    802003bc:	b755                	j	80200360 <usertrap+0x72>
    asm volatile("csrr %0, stval"
    802003be:	143027f3          	csrr	a5,stval
            error(
    802003c2:	0184b803          	ld	a6,24(s1)
    802003c6:	00125697          	auipc	a3,0x125
    802003ca:	d126a683          	lw	a3,-750(a3) # 803250d8 <curr_pid>
    802003ce:	00005617          	auipc	a2,0x5
    802003d2:	c4a63603          	ld	a2,-950(a2) # 80205018 <LEVEL+0x18>
    802003d6:	00005597          	auipc	a1,0x5
    802003da:	c565a583          	lw	a1,-938(a1) # 8020502c <COLOR+0xc>
    802003de:	00004517          	auipc	a0,0x4
    802003e2:	d2250513          	addi	a0,a0,-734 # 80204100 <e_text+0x100>
    802003e6:	00001097          	auipc	ra,0x1
    802003ea:	634080e7          	jalr	1588(ra) # 80201a1a <printf>
    802003ee:	b7d1                	j	802003b2 <usertrap+0xc4>
            error("IllegalInstruction in application, epc = %p, core dumped.\n", trapframe->epc);
    802003f0:	00006717          	auipc	a4,0x6
    802003f4:	e2072703          	lw	a4,-480(a4) # 80206210 <debug_level>
    802003f8:	478d                	li	a5,3
    802003fa:	00e7d863          	bge	a5,a4,8020040a <usertrap+0x11c>
            exit(-3);
    802003fe:	5575                	li	a0,-3
    80200400:	00002097          	auipc	ra,0x2
    80200404:	eac080e7          	jalr	-340(ra) # 802022ac <exit>
            break;
    80200408:	bfa1                	j	80200360 <usertrap+0x72>
            error("IllegalInstruction in application, epc = %p, core dumped.\n", trapframe->epc);
    8020040a:	6c98                	ld	a4,24(s1)
    8020040c:	00125697          	auipc	a3,0x125
    80200410:	ccc6a683          	lw	a3,-820(a3) # 803250d8 <curr_pid>
    80200414:	00005617          	auipc	a2,0x5
    80200418:	c0463603          	ld	a2,-1020(a2) # 80205018 <LEVEL+0x18>
    8020041c:	00005597          	auipc	a1,0x5
    80200420:	c105a583          	lw	a1,-1008(a1) # 8020502c <COLOR+0xc>
    80200424:	00004517          	auipc	a0,0x4
    80200428:	d3450513          	addi	a0,a0,-716 # 80204158 <e_text+0x158>
    8020042c:	00001097          	auipc	ra,0x1
    80200430:	5ee080e7          	jalr	1518(ra) # 80201a1a <printf>
    80200434:	b7e9                	j	802003fe <usertrap+0x110>
            unknown_trap();
    80200436:	00000097          	auipc	ra,0x0
    8020043a:	d64080e7          	jalr	-668(ra) # 8020019a <unknown_trap>
            break;
    8020043e:	b70d                	j	80200360 <usertrap+0x72>

0000000080200440 <batchinit>:

void batchinit() {
    char* s;
    app_info_ptr = (uint64 *) _app_num;
    app_cur = -1;
    app_num = *app_info_ptr;
    80200440:	00005697          	auipc	a3,0x5
    80200444:	bf068693          	addi	a3,a3,-1040 # 80205030 <_app_num>
    80200448:	0006c783          	lbu	a5,0(a3)
    8020044c:	0016c703          	lbu	a4,1(a3)
    80200450:	0722                	slli	a4,a4,0x8
    80200452:	8f5d                	or	a4,a4,a5
    80200454:	0026c783          	lbu	a5,2(a3)
    80200458:	07c2                	slli	a5,a5,0x10
    8020045a:	8f5d                	or	a4,a4,a5
    8020045c:	0036c783          	lbu	a5,3(a3)
    80200460:	07e2                	slli	a5,a5,0x18
    80200462:	8fd9                	or	a5,a5,a4
    80200464:	0007871b          	sext.w	a4,a5
    80200468:	00125697          	auipc	a3,0x125
    8020046c:	c4f6ac23          	sw	a5,-936(a3) # 803250c0 <app_num>
    app_info_ptr++;
    80200470:	00005797          	auipc	a5,0x5
    80200474:	bc878793          	addi	a5,a5,-1080 # 80205038 <_app_num+0x8>
    80200478:	00125697          	auipc	a3,0x125
    8020047c:	c4f6b023          	sd	a5,-960(a3) # 803250b8 <app_info_ptr>

    s = _app_names;
    for(int i = 0; i < app_num; ++i) {
    80200480:	0ce05763          	blez	a4,8020054e <batchinit+0x10e>
void batchinit() {
    80200484:	711d                	addi	sp,sp,-96
    80200486:	ec86                	sd	ra,88(sp)
    80200488:	e8a2                	sd	s0,80(sp)
    8020048a:	e4a6                	sd	s1,72(sp)
    8020048c:	e0ca                	sd	s2,64(sp)
    8020048e:	fc4e                	sd	s3,56(sp)
    80200490:	f852                	sd	s4,48(sp)
    80200492:	f456                	sd	s5,40(sp)
    80200494:	f05a                	sd	s6,32(sp)
    80200496:	ec5e                	sd	s7,24(sp)
    80200498:	e862                	sd	s8,16(sp)
    8020049a:	e466                	sd	s9,8(sp)
    8020049c:	e06a                	sd	s10,0(sp)
    8020049e:	1080                	addi	s0,sp,96
    802004a0:	00017997          	auipc	s3,0x17
    802004a4:	b6098993          	addi	s3,s3,-1184 # 80217000 <names>
    for(int i = 0; i < app_num; ++i) {
    802004a8:	4a01                	li	s4,0
    s = _app_names;
    802004aa:	00005917          	auipc	s2,0x5
    802004ae:	b9e90913          	addi	s2,s2,-1122 # 80205048 <_app_names>
        int len = strlen(s);
        strncpy(names[i], (const char*)s, len);
        s += len + 1;
        trace("new name: %s\n", names[i]);
    802004b2:	00006b17          	auipc	s6,0x6
    802004b6:	d5eb0b13          	addi	s6,s6,-674 # 80206210 <debug_level>
    802004ba:	00125d17          	auipc	s10,0x125
    802004be:	c1ed0d13          	addi	s10,s10,-994 # 803250d8 <curr_pid>
    802004c2:	00005c97          	auipc	s9,0x5
    802004c6:	b3ec8c93          	addi	s9,s9,-1218 # 80205000 <LEVEL>
    802004ca:	00005c17          	auipc	s8,0x5
    802004ce:	b56c0c13          	addi	s8,s8,-1194 # 80205020 <COLOR>
    802004d2:	00004b97          	auipc	s7,0x4
    802004d6:	d0eb8b93          	addi	s7,s7,-754 # 802041e0 <e_text+0x1e0>
    for(int i = 0; i < app_num; ++i) {
    802004da:	00125a97          	auipc	s5,0x125
    802004de:	be6a8a93          	addi	s5,s5,-1050 # 803250c0 <app_num>
    802004e2:	a801                	j	802004f2 <batchinit+0xb2>
    802004e4:	2a05                	addiw	s4,s4,1
    802004e6:	06498993          	addi	s3,s3,100
    802004ea:	000aa783          	lw	a5,0(s5)
    802004ee:	04fa5263          	bge	s4,a5,80200532 <batchinit+0xf2>
        int len = strlen(s);
    802004f2:	854a                	mv	a0,s2
    802004f4:	00000097          	auipc	ra,0x0
    802004f8:	4e4080e7          	jalr	1252(ra) # 802009d8 <strlen>
    802004fc:	84aa                	mv	s1,a0
        strncpy(names[i], (const char*)s, len);
    802004fe:	862a                	mv	a2,a0
    80200500:	85ca                	mv	a1,s2
    80200502:	854e                	mv	a0,s3
    80200504:	00000097          	auipc	ra,0x0
    80200508:	464080e7          	jalr	1124(ra) # 80200968 <strncpy>
        s += len + 1;
    8020050c:	0485                	addi	s1,s1,1
    8020050e:	9926                	add	s2,s2,s1
        trace("new name: %s\n", names[i]);
    80200510:	000b2783          	lw	a5,0(s6)
    80200514:	fcf048e3          	bgtz	a5,802004e4 <batchinit+0xa4>
    80200518:	874e                	mv	a4,s3
    8020051a:	000d2683          	lw	a3,0(s10)
    8020051e:	000cb603          	ld	a2,0(s9)
    80200522:	000c2583          	lw	a1,0(s8)
    80200526:	855e                	mv	a0,s7
    80200528:	00001097          	auipc	ra,0x1
    8020052c:	4f2080e7          	jalr	1266(ra) # 80201a1a <printf>
    80200530:	bf55                	j	802004e4 <batchinit+0xa4>
    }
}
    80200532:	60e6                	ld	ra,88(sp)
    80200534:	6446                	ld	s0,80(sp)
    80200536:	64a6                	ld	s1,72(sp)
    80200538:	6906                	ld	s2,64(sp)
    8020053a:	79e2                	ld	s3,56(sp)
    8020053c:	7a42                	ld	s4,48(sp)
    8020053e:	7aa2                	ld	s5,40(sp)
    80200540:	7b02                	ld	s6,32(sp)
    80200542:	6be2                	ld	s7,24(sp)
    80200544:	6c42                	ld	s8,16(sp)
    80200546:	6ca2                	ld	s9,8(sp)
    80200548:	6d02                	ld	s10,0(sp)
    8020054a:	6125                	addi	sp,sp,96
    8020054c:	8082                	ret
    8020054e:	8082                	ret

0000000080200550 <get_id_by_name>:

int get_id_by_name(char* name) {
    80200550:	7179                	addi	sp,sp,-48
    80200552:	f406                	sd	ra,40(sp)
    80200554:	f022                	sd	s0,32(sp)
    80200556:	ec26                	sd	s1,24(sp)
    80200558:	e84a                	sd	s2,16(sp)
    8020055a:	e44e                	sd	s3,8(sp)
    8020055c:	e052                	sd	s4,0(sp)
    8020055e:	1800                	addi	s0,sp,48
    for(int i = 0; i < app_num; ++i) {
    80200560:	00125797          	auipc	a5,0x125
    80200564:	b607a783          	lw	a5,-1184(a5) # 803250c0 <app_num>
    80200568:	02f05c63          	blez	a5,802005a0 <get_id_by_name+0x50>
    8020056c:	89aa                	mv	s3,a0
    8020056e:	00017917          	auipc	s2,0x17
    80200572:	a9290913          	addi	s2,s2,-1390 # 80217000 <names>
    80200576:	4481                	li	s1,0
    80200578:	00125a17          	auipc	s4,0x125
    8020057c:	b48a0a13          	addi	s4,s4,-1208 # 803250c0 <app_num>
        if(strncmp(name, names[i], 100) == 0)
    80200580:	06400613          	li	a2,100
    80200584:	85ca                	mv	a1,s2
    80200586:	854e                	mv	a0,s3
    80200588:	00000097          	auipc	ra,0x0
    8020058c:	3a4080e7          	jalr	932(ra) # 8020092c <strncmp>
    80200590:	c105                	beqz	a0,802005b0 <get_id_by_name+0x60>
    for(int i = 0; i < app_num; ++i) {
    80200592:	2485                	addiw	s1,s1,1
    80200594:	06490913          	addi	s2,s2,100
    80200598:	000a2783          	lw	a5,0(s4)
    8020059c:	fef4c2e3          	blt	s1,a5,80200580 <get_id_by_name+0x30>
            return i;
    }
    warn("not find such app\n");
    802005a0:	00006717          	auipc	a4,0x6
    802005a4:	c7072703          	lw	a4,-912(a4) # 80206210 <debug_level>
    802005a8:	4789                	li	a5,2
    return -1;
    802005aa:	54fd                	li	s1,-1
    warn("not find such app\n");
    802005ac:	00e7db63          	bge	a5,a4,802005c2 <get_id_by_name+0x72>
}
    802005b0:	8526                	mv	a0,s1
    802005b2:	70a2                	ld	ra,40(sp)
    802005b4:	7402                	ld	s0,32(sp)
    802005b6:	64e2                	ld	s1,24(sp)
    802005b8:	6942                	ld	s2,16(sp)
    802005ba:	69a2                	ld	s3,8(sp)
    802005bc:	6a02                	ld	s4,0(sp)
    802005be:	6145                	addi	sp,sp,48
    802005c0:	8082                	ret
    warn("not find such app\n");
    802005c2:	00125697          	auipc	a3,0x125
    802005c6:	b166a683          	lw	a3,-1258(a3) # 803250d8 <curr_pid>
    802005ca:	00005617          	auipc	a2,0x5
    802005ce:	a4663603          	ld	a2,-1466(a2) # 80205010 <LEVEL+0x10>
    802005d2:	00005597          	auipc	a1,0x5
    802005d6:	a565a583          	lw	a1,-1450(a1) # 80205028 <COLOR+0x8>
    802005da:	00004517          	auipc	a0,0x4
    802005de:	c2650513          	addi	a0,a0,-986 # 80204200 <e_text+0x200>
    802005e2:	00001097          	auipc	ra,0x1
    802005e6:	438080e7          	jalr	1080(ra) # 80201a1a <printf>
    802005ea:	b7d9                	j	802005b0 <get_id_by_name+0x60>

00000000802005ec <alloc_ustack>:

uint64 alloc_ustack(struct proc *p) {
    802005ec:	1101                	addi	sp,sp,-32
    802005ee:	ec06                	sd	ra,24(sp)
    802005f0:	e822                	sd	s0,16(sp)
    802005f2:	e426                	sd	s1,8(sp)
    802005f4:	1000                	addi	s0,sp,32
    p->ustack = 0;
    802005f6:	00053c23          	sd	zero,24(a0)
    p->sz = USTACK_SIZE;
    802005fa:	6785                	lui	a5,0x1
    802005fc:	f15c                	sd	a5,160(a0)
    if(mappages(p->pagetable, p->ustack, USTACK_SIZE,
    802005fe:	6904                	ld	s1,16(a0)
                (uint64)kalloc(), PTE_R | PTE_W | PTE_U) < 0){;
    80200600:	00001097          	auipc	ra,0x1
    80200604:	768080e7          	jalr	1896(ra) # 80201d68 <kalloc>
    80200608:	86aa                	mv	a3,a0
    if(mappages(p->pagetable, p->ustack, USTACK_SIZE,
    8020060a:	4759                	li	a4,22
    8020060c:	6605                	lui	a2,0x1
    8020060e:	4581                	li	a1,0
    80200610:	8526                	mv	a0,s1
    80200612:	00001097          	auipc	ra,0x1
    80200616:	b92080e7          	jalr	-1134(ra) # 802011a4 <mappages>
    8020061a:	00054863          	bltz	a0,8020062a <alloc_ustack+0x3e>
        panic("");
    }
    return USTACK_SIZE;
}
    8020061e:	6505                	lui	a0,0x1
    80200620:	60e2                	ld	ra,24(sp)
    80200622:	6442                	ld	s0,16(sp)
    80200624:	64a2                	ld	s1,8(sp)
    80200626:	6105                	addi	sp,sp,32
    80200628:	8082                	ret
        panic("");
    8020062a:	00004517          	auipc	a0,0x4
    8020062e:	ace50513          	addi	a0,a0,-1330 # 802040f8 <e_text+0xf8>
    80200632:	00000097          	auipc	ra,0x0
    80200636:	a4c080e7          	jalr	-1460(ra) # 8020007e <panic>
    8020063a:	b7d5                	j	8020061e <alloc_ustack+0x32>

000000008020063c <bin_loader>:

void bin_loader(uint64 start, uint64 end, struct proc *p) {
    8020063c:	711d                	addi	sp,sp,-96
    8020063e:	ec86                	sd	ra,88(sp)
    80200640:	e8a2                	sd	s0,80(sp)
    80200642:	e4a6                	sd	s1,72(sp)
    80200644:	e0ca                	sd	s2,64(sp)
    80200646:	fc4e                	sd	s3,56(sp)
    80200648:	f852                	sd	s4,48(sp)
    8020064a:	f456                	sd	s5,40(sp)
    8020064c:	f05a                	sd	s6,32(sp)
    8020064e:	ec5e                	sd	s7,24(sp)
    80200650:	e862                	sd	s8,16(sp)
    80200652:	e466                	sd	s9,8(sp)
    80200654:	1080                	addi	s0,sp,96
    80200656:	8aaa                	mv	s5,a0
    80200658:	8932                	mv	s2,a2
    uint64 s = PGROUNDDOWN(start), e = PGROUNDUP(end);
    8020065a:	77fd                	lui	a5,0xfffff
    8020065c:	00f57bb3          	and	s7,a0,a5
    80200660:	6a05                	lui	s4,0x1
    80200662:	1a7d                	addi	s4,s4,-1
    80200664:	95d2                	add	a1,a1,s4
    80200666:	00f5fa33          	and	s4,a1,a5
    info("range : [%p, %p] start = %p\n", s, e, start);
    8020066a:	00006717          	auipc	a4,0x6
    8020066e:	ba672703          	lw	a4,-1114(a4) # 80206210 <debug_level>
    80200672:	4785                	li	a5,1
    80200674:	02e7d463          	bge	a5,a4,8020069c <bin_loader+0x60>
    uint64 ustack_top = alloc_ustack(p);
    80200678:	854a                	mv	a0,s2
    8020067a:	00000097          	auipc	ra,0x0
    8020067e:	f72080e7          	jalr	-142(ra) # 802005ec <alloc_ustack>
    80200682:	8b2a                	mv	s6,a0
    for(uint64 cur = s; cur < e; cur += PGSIZE) {
    80200684:	0b4bf263          	bgeu	s7,s4,80200728 <bin_loader+0xec>
    80200688:	89de                	mv	s3,s7
        void* page = kalloc();
        if(page == 0) {
            panic("");
    8020068a:	00004c97          	auipc	s9,0x4
    8020068e:	a6ec8c93          	addi	s9,s9,-1426 # 802040f8 <e_text+0xf8>
        }
        memmove(page, (const void*)cur, PGSIZE);
        if (mappages(p->pagetable, p->sz, PGSIZE, (uint64)page, PTE_U | PTE_R | PTE_W | PTE_X) != 0) {
            panic("mappages\n");
    80200692:	00004c17          	auipc	s8,0x4
    80200696:	bc6c0c13          	addi	s8,s8,-1082 # 80204258 <e_text+0x258>
    8020069a:	a881                	j	802006ea <bin_loader+0xae>
    info("range : [%p, %p] start = %p\n", s, e, start);
    8020069c:	882a                	mv	a6,a0
    8020069e:	87d2                	mv	a5,s4
    802006a0:	875e                	mv	a4,s7
    802006a2:	00125697          	auipc	a3,0x125
    802006a6:	a366a683          	lw	a3,-1482(a3) # 803250d8 <curr_pid>
    802006aa:	00005617          	auipc	a2,0x5
    802006ae:	95e63603          	ld	a2,-1698(a2) # 80205008 <LEVEL+0x8>
    802006b2:	00005597          	auipc	a1,0x5
    802006b6:	9725a583          	lw	a1,-1678(a1) # 80205024 <COLOR+0x4>
    802006ba:	00004517          	auipc	a0,0x4
    802006be:	b6e50513          	addi	a0,a0,-1170 # 80204228 <e_text+0x228>
    802006c2:	00001097          	auipc	ra,0x1
    802006c6:	358080e7          	jalr	856(ra) # 80201a1a <printf>
    802006ca:	b77d                	j	80200678 <bin_loader+0x3c>
            panic("");
    802006cc:	8566                	mv	a0,s9
    802006ce:	00000097          	auipc	ra,0x0
    802006d2:	9b0080e7          	jalr	-1616(ra) # 8020007e <panic>
    802006d6:	a005                	j	802006f6 <bin_loader+0xba>
        }
        p->sz += PGSIZE;
    802006d8:	6705                	lui	a4,0x1
    802006da:	0a093783          	ld	a5,160(s2)
    802006de:	97ba                	add	a5,a5,a4
    802006e0:	0af93023          	sd	a5,160(s2)
    for(uint64 cur = s; cur < e; cur += PGSIZE) {
    802006e4:	99ba                	add	s3,s3,a4
    802006e6:	0549f163          	bgeu	s3,s4,80200728 <bin_loader+0xec>
        void* page = kalloc();
    802006ea:	00001097          	auipc	ra,0x1
    802006ee:	67e080e7          	jalr	1662(ra) # 80201d68 <kalloc>
    802006f2:	84aa                	mv	s1,a0
        if(page == 0) {
    802006f4:	dd61                	beqz	a0,802006cc <bin_loader+0x90>
        memmove(page, (const void*)cur, PGSIZE);
    802006f6:	6605                	lui	a2,0x1
    802006f8:	85ce                	mv	a1,s3
    802006fa:	8526                	mv	a0,s1
    802006fc:	00000097          	auipc	ra,0x0
    80200700:	1b4080e7          	jalr	436(ra) # 802008b0 <memmove>
        if (mappages(p->pagetable, p->sz, PGSIZE, (uint64)page, PTE_U | PTE_R | PTE_W | PTE_X) != 0) {
    80200704:	4779                	li	a4,30
    80200706:	86a6                	mv	a3,s1
    80200708:	6605                	lui	a2,0x1
    8020070a:	0a093583          	ld	a1,160(s2)
    8020070e:	01093503          	ld	a0,16(s2)
    80200712:	00001097          	auipc	ra,0x1
    80200716:	a92080e7          	jalr	-1390(ra) # 802011a4 <mappages>
    8020071a:	dd5d                	beqz	a0,802006d8 <bin_loader+0x9c>
            panic("mappages\n");
    8020071c:	8562                	mv	a0,s8
    8020071e:	00000097          	auipc	ra,0x0
    80200722:	960080e7          	jalr	-1696(ra) # 8020007e <panic>
    80200726:	bf4d                	j	802006d8 <bin_loader+0x9c>
    }
    p->trapframe->epc = ustack_top + start - s;
    80200728:	02893783          	ld	a5,40(s2)
    8020072c:	417a8ab3          	sub	s5,s5,s7
    80200730:	9ada                	add	s5,s5,s6
    80200732:	0157bc23          	sd	s5,24(a5) # fffffffffffff018 <e_bss+0xffffffff7fcd9018>
    if((p->trapframe->epc & 3) != 0) {
    80200736:	02893783          	ld	a5,40(s2)
    8020073a:	6f9c                	ld	a5,24(a5)
    8020073c:	8b8d                	andi	a5,a5,3
    8020073e:	e395                	bnez	a5,80200762 <bin_loader+0x126>
        panic("invalid user program alignment");
    }
    p->trapframe->sp = ustack_top;
    80200740:	02893783          	ld	a5,40(s2)
    80200744:	0367b823          	sd	s6,48(a5)
}
    80200748:	60e6                	ld	ra,88(sp)
    8020074a:	6446                	ld	s0,80(sp)
    8020074c:	64a6                	ld	s1,72(sp)
    8020074e:	6906                	ld	s2,64(sp)
    80200750:	79e2                	ld	s3,56(sp)
    80200752:	7a42                	ld	s4,48(sp)
    80200754:	7aa2                	ld	s5,40(sp)
    80200756:	7b02                	ld	s6,32(sp)
    80200758:	6be2                	ld	s7,24(sp)
    8020075a:	6c42                	ld	s8,16(sp)
    8020075c:	6ca2                	ld	s9,8(sp)
    8020075e:	6125                	addi	sp,sp,96
    80200760:	8082                	ret
        panic("invalid user program alignment");
    80200762:	00004517          	auipc	a0,0x4
    80200766:	b0650513          	addi	a0,a0,-1274 # 80204268 <e_text+0x268>
    8020076a:	00000097          	auipc	ra,0x0
    8020076e:	914080e7          	jalr	-1772(ra) # 8020007e <panic>
    80200772:	b7f9                	j	80200740 <bin_loader+0x104>

0000000080200774 <loader>:

void loader(int id, void* p) {
    80200774:	1101                	addi	sp,sp,-32
    80200776:	ec06                	sd	ra,24(sp)
    80200778:	e822                	sd	s0,16(sp)
    8020077a:	e426                	sd	s1,8(sp)
    8020077c:	e04a                	sd	s2,0(sp)
    8020077e:	1000                	addi	s0,sp,32
    80200780:	84aa                	mv	s1,a0
    80200782:	892e                	mv	s2,a1
    info("loader %s\n", names[id]);
    80200784:	00006717          	auipc	a4,0x6
    80200788:	a8c72703          	lw	a4,-1396(a4) # 80206210 <debug_level>
    8020078c:	4785                	li	a5,1
    8020078e:	02e7d563          	bge	a5,a4,802007b8 <loader+0x44>
    bin_loader(app_info_ptr[id], app_info_ptr[id+1], p);
    80200792:	048e                	slli	s1,s1,0x3
    80200794:	00125517          	auipc	a0,0x125
    80200798:	92453503          	ld	a0,-1756(a0) # 803250b8 <app_info_ptr>
    8020079c:	94aa                	add	s1,s1,a0
    8020079e:	864a                	mv	a2,s2
    802007a0:	648c                	ld	a1,8(s1)
    802007a2:	6088                	ld	a0,0(s1)
    802007a4:	00000097          	auipc	ra,0x0
    802007a8:	e98080e7          	jalr	-360(ra) # 8020063c <bin_loader>
}
    802007ac:	60e2                	ld	ra,24(sp)
    802007ae:	6442                	ld	s0,16(sp)
    802007b0:	64a2                	ld	s1,8(sp)
    802007b2:	6902                	ld	s2,0(sp)
    802007b4:	6105                	addi	sp,sp,32
    802007b6:	8082                	ret
    info("loader %s\n", names[id]);
    802007b8:	06400793          	li	a5,100
    802007bc:	02f507b3          	mul	a5,a0,a5
    802007c0:	00017717          	auipc	a4,0x17
    802007c4:	84070713          	addi	a4,a4,-1984 # 80217000 <names>
    802007c8:	973e                	add	a4,a4,a5
    802007ca:	00125697          	auipc	a3,0x125
    802007ce:	90e6a683          	lw	a3,-1778(a3) # 803250d8 <curr_pid>
    802007d2:	00005617          	auipc	a2,0x5
    802007d6:	83663603          	ld	a2,-1994(a2) # 80205008 <LEVEL+0x8>
    802007da:	00005597          	auipc	a1,0x5
    802007de:	84a5a583          	lw	a1,-1974(a1) # 80205024 <COLOR+0x4>
    802007e2:	00004517          	auipc	a0,0x4
    802007e6:	aa650513          	addi	a0,a0,-1370 # 80204288 <e_text+0x288>
    802007ea:	00001097          	auipc	ra,0x1
    802007ee:	230080e7          	jalr	560(ra) # 80201a1a <printf>
    802007f2:	b745                	j	80200792 <loader+0x1e>

00000000802007f4 <run_all_app>:

int run_all_app() {
    802007f4:	1101                	addi	sp,sp,-32
    802007f6:	ec06                	sd	ra,24(sp)
    802007f8:	e822                	sd	s0,16(sp)
    802007fa:	e426                	sd	s1,8(sp)
    802007fc:	e04a                	sd	s2,0(sp)
    802007fe:	1000                	addi	s0,sp,32
    struct proc *p = allocproc();
    80200800:	00001097          	auipc	ra,0x1
    80200804:	74e080e7          	jalr	1870(ra) # 80201f4e <allocproc>
    80200808:	84aa                	mv	s1,a0
    p->parent = 0;
    8020080a:	0a053423          	sd	zero,168(a0)
    int id = get_id_by_name("user_shell.bin");
    8020080e:	00004517          	auipc	a0,0x4
    80200812:	a9a50513          	addi	a0,a0,-1382 # 802042a8 <e_text+0x2a8>
    80200816:	00000097          	auipc	ra,0x0
    8020081a:	d3a080e7          	jalr	-710(ra) # 80200550 <get_id_by_name>
    8020081e:	892a                	mv	s2,a0
    if(id < 0)
    80200820:	02054163          	bltz	a0,80200842 <run_all_app+0x4e>
        panic("no user shell");
    loader(id, p);
    80200824:	85a6                	mv	a1,s1
    80200826:	854a                	mv	a0,s2
    80200828:	00000097          	auipc	ra,0x0
    8020082c:	f4c080e7          	jalr	-180(ra) # 80200774 <loader>
    p->state = RUNNABLE;
    80200830:	478d                	li	a5,3
    80200832:	c09c                	sw	a5,0(s1)
    return 0;
    80200834:	4501                	li	a0,0
    80200836:	60e2                	ld	ra,24(sp)
    80200838:	6442                	ld	s0,16(sp)
    8020083a:	64a2                	ld	s1,8(sp)
    8020083c:	6902                	ld	s2,0(sp)
    8020083e:	6105                	addi	sp,sp,32
    80200840:	8082                	ret
        panic("no user shell");
    80200842:	00004517          	auipc	a0,0x4
    80200846:	a7650513          	addi	a0,a0,-1418 # 802042b8 <e_text+0x2b8>
    8020084a:	00000097          	auipc	ra,0x0
    8020084e:	834080e7          	jalr	-1996(ra) # 8020007e <panic>
    80200852:	bfc9                	j	80200824 <run_all_app+0x30>

0000000080200854 <memset>:
#include "defs.h"

void *
memset(void *dst, int c, uint n) {
    80200854:	1141                	addi	sp,sp,-16
    80200856:	e422                	sd	s0,8(sp)
    80200858:	0800                	addi	s0,sp,16
    char *cdst = (char *) dst;
    int i;
    for (i = 0; i < n; i++) {
    8020085a:	ca19                	beqz	a2,80200870 <memset+0x1c>
    8020085c:	87aa                	mv	a5,a0
    8020085e:	1602                	slli	a2,a2,0x20
    80200860:	9201                	srli	a2,a2,0x20
    80200862:	00a60733          	add	a4,a2,a0
        cdst[i] = c;
    80200866:	00b78023          	sb	a1,0(a5)
    for (i = 0; i < n; i++) {
    8020086a:	0785                	addi	a5,a5,1
    8020086c:	fee79de3          	bne	a5,a4,80200866 <memset+0x12>
    }
    return dst;
}
    80200870:	6422                	ld	s0,8(sp)
    80200872:	0141                	addi	sp,sp,16
    80200874:	8082                	ret

0000000080200876 <memcmp>:

int memcmp(const void *v1, const void *v2, uint n) {
    80200876:	1141                	addi	sp,sp,-16
    80200878:	e422                	sd	s0,8(sp)
    8020087a:	0800                	addi	s0,sp,16
    const uchar *s1, *s2;

    s1 = v1;
    s2 = v2;
    while (n-- > 0) {
    8020087c:	ca05                	beqz	a2,802008ac <memcmp+0x36>
    8020087e:	fff6069b          	addiw	a3,a2,-1
    80200882:	1682                	slli	a3,a3,0x20
    80200884:	9281                	srli	a3,a3,0x20
    80200886:	0685                	addi	a3,a3,1
    80200888:	96aa                	add	a3,a3,a0
        if (*s1 != *s2)
    8020088a:	00054783          	lbu	a5,0(a0)
    8020088e:	0005c703          	lbu	a4,0(a1)
    80200892:	00e79863          	bne	a5,a4,802008a2 <memcmp+0x2c>
            return *s1 - *s2;
        s1++, s2++;
    80200896:	0505                	addi	a0,a0,1
    80200898:	0585                	addi	a1,a1,1
    while (n-- > 0) {
    8020089a:	fed518e3          	bne	a0,a3,8020088a <memcmp+0x14>
    }

    return 0;
    8020089e:	4501                	li	a0,0
    802008a0:	a019                	j	802008a6 <memcmp+0x30>
            return *s1 - *s2;
    802008a2:	40e7853b          	subw	a0,a5,a4
}
    802008a6:	6422                	ld	s0,8(sp)
    802008a8:	0141                	addi	sp,sp,16
    802008aa:	8082                	ret
    return 0;
    802008ac:	4501                	li	a0,0
    802008ae:	bfe5                	j	802008a6 <memcmp+0x30>

00000000802008b0 <memmove>:

void *
memmove(void *dst, const void *src, uint n) {
    802008b0:	1141                	addi	sp,sp,-16
    802008b2:	e422                	sd	s0,8(sp)
    802008b4:	0800                	addi	s0,sp,16
    const char *s;
    char *d;

    s = src;
    d = dst;
    if (s < d && s + n > d) {
    802008b6:	02a5e563          	bltu	a1,a0,802008e0 <memmove+0x30>
        s += n;
        d += n;
        while (n-- > 0)
            *--d = *--s;
    } else
        while (n-- > 0)
    802008ba:	fff6069b          	addiw	a3,a2,-1
    802008be:	ce11                	beqz	a2,802008da <memmove+0x2a>
    802008c0:	1682                	slli	a3,a3,0x20
    802008c2:	9281                	srli	a3,a3,0x20
    802008c4:	0685                	addi	a3,a3,1
    802008c6:	96ae                	add	a3,a3,a1
    802008c8:	87aa                	mv	a5,a0
            *d++ = *s++;
    802008ca:	0585                	addi	a1,a1,1
    802008cc:	0785                	addi	a5,a5,1
    802008ce:	fff5c703          	lbu	a4,-1(a1)
    802008d2:	fee78fa3          	sb	a4,-1(a5)
        while (n-- > 0)
    802008d6:	fed59ae3          	bne	a1,a3,802008ca <memmove+0x1a>

    return dst;
}
    802008da:	6422                	ld	s0,8(sp)
    802008dc:	0141                	addi	sp,sp,16
    802008de:	8082                	ret
    if (s < d && s + n > d) {
    802008e0:	02061713          	slli	a4,a2,0x20
    802008e4:	9301                	srli	a4,a4,0x20
    802008e6:	00e587b3          	add	a5,a1,a4
    802008ea:	fcf578e3          	bgeu	a0,a5,802008ba <memmove+0xa>
        d += n;
    802008ee:	972a                	add	a4,a4,a0
        while (n-- > 0)
    802008f0:	fff6069b          	addiw	a3,a2,-1
    802008f4:	d27d                	beqz	a2,802008da <memmove+0x2a>
    802008f6:	02069613          	slli	a2,a3,0x20
    802008fa:	9201                	srli	a2,a2,0x20
    802008fc:	fff64613          	not	a2,a2
    80200900:	963e                	add	a2,a2,a5
            *--d = *--s;
    80200902:	17fd                	addi	a5,a5,-1
    80200904:	177d                	addi	a4,a4,-1
    80200906:	0007c683          	lbu	a3,0(a5)
    8020090a:	00d70023          	sb	a3,0(a4)
        while (n-- > 0)
    8020090e:	fef61ae3          	bne	a2,a5,80200902 <memmove+0x52>
    80200912:	b7e1                	j	802008da <memmove+0x2a>

0000000080200914 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void *
memcpy(void *dst, const void *src, uint n) {
    80200914:	1141                	addi	sp,sp,-16
    80200916:	e406                	sd	ra,8(sp)
    80200918:	e022                	sd	s0,0(sp)
    8020091a:	0800                	addi	s0,sp,16
    return memmove(dst, src, n);
    8020091c:	00000097          	auipc	ra,0x0
    80200920:	f94080e7          	jalr	-108(ra) # 802008b0 <memmove>
}
    80200924:	60a2                	ld	ra,8(sp)
    80200926:	6402                	ld	s0,0(sp)
    80200928:	0141                	addi	sp,sp,16
    8020092a:	8082                	ret

000000008020092c <strncmp>:

int strncmp(const char *p, const char *q, uint n) {
    8020092c:	1141                	addi	sp,sp,-16
    8020092e:	e422                	sd	s0,8(sp)
    80200930:	0800                	addi	s0,sp,16
    while (n > 0 && *p && *p == *q)
    80200932:	ce11                	beqz	a2,8020094e <strncmp+0x22>
    80200934:	00054783          	lbu	a5,0(a0)
    80200938:	cf89                	beqz	a5,80200952 <strncmp+0x26>
    8020093a:	0005c703          	lbu	a4,0(a1)
    8020093e:	00f71a63          	bne	a4,a5,80200952 <strncmp+0x26>
        n--, p++, q++;
    80200942:	367d                	addiw	a2,a2,-1
    80200944:	0505                	addi	a0,a0,1
    80200946:	0585                	addi	a1,a1,1
    while (n > 0 && *p && *p == *q)
    80200948:	f675                	bnez	a2,80200934 <strncmp+0x8>
    if (n == 0)
        return 0;
    8020094a:	4501                	li	a0,0
    8020094c:	a809                	j	8020095e <strncmp+0x32>
    8020094e:	4501                	li	a0,0
    80200950:	a039                	j	8020095e <strncmp+0x32>
    if (n == 0)
    80200952:	ca09                	beqz	a2,80200964 <strncmp+0x38>
    return (uchar) *p - (uchar) *q;
    80200954:	00054503          	lbu	a0,0(a0)
    80200958:	0005c783          	lbu	a5,0(a1)
    8020095c:	9d1d                	subw	a0,a0,a5
}
    8020095e:	6422                	ld	s0,8(sp)
    80200960:	0141                	addi	sp,sp,16
    80200962:	8082                	ret
        return 0;
    80200964:	4501                	li	a0,0
    80200966:	bfe5                	j	8020095e <strncmp+0x32>

0000000080200968 <strncpy>:

char *
strncpy(char *s, const char *t, int n) {
    80200968:	1141                	addi	sp,sp,-16
    8020096a:	e422                	sd	s0,8(sp)
    8020096c:	0800                	addi	s0,sp,16
    char *os;

    os = s;
    while (n-- > 0 && (*s++ = *t++) != 0)
    8020096e:	872a                	mv	a4,a0
    80200970:	8832                	mv	a6,a2
    80200972:	367d                	addiw	a2,a2,-1
    80200974:	01005963          	blez	a6,80200986 <strncpy+0x1e>
    80200978:	0705                	addi	a4,a4,1
    8020097a:	0005c783          	lbu	a5,0(a1)
    8020097e:	fef70fa3          	sb	a5,-1(a4)
    80200982:	0585                	addi	a1,a1,1
    80200984:	f7f5                	bnez	a5,80200970 <strncpy+0x8>
        ;
    while (n-- > 0)
    80200986:	86ba                	mv	a3,a4
    80200988:	00c05c63          	blez	a2,802009a0 <strncpy+0x38>
        *s++ = 0;
    8020098c:	0685                	addi	a3,a3,1
    8020098e:	fe068fa3          	sb	zero,-1(a3)
    while (n-- > 0)
    80200992:	fff6c793          	not	a5,a3
    80200996:	9fb9                	addw	a5,a5,a4
    80200998:	010787bb          	addw	a5,a5,a6
    8020099c:	fef048e3          	bgtz	a5,8020098c <strncpy+0x24>
    return os;
}
    802009a0:	6422                	ld	s0,8(sp)
    802009a2:	0141                	addi	sp,sp,16
    802009a4:	8082                	ret

00000000802009a6 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char *
safestrcpy(char *s, const char *t, int n) {
    802009a6:	1141                	addi	sp,sp,-16
    802009a8:	e422                	sd	s0,8(sp)
    802009aa:	0800                	addi	s0,sp,16
    char *os;

    os = s;
    if (n <= 0)
    802009ac:	02c05363          	blez	a2,802009d2 <safestrcpy+0x2c>
    802009b0:	fff6069b          	addiw	a3,a2,-1
    802009b4:	1682                	slli	a3,a3,0x20
    802009b6:	9281                	srli	a3,a3,0x20
    802009b8:	96ae                	add	a3,a3,a1
    802009ba:	87aa                	mv	a5,a0
        return os;
    while (--n > 0 && (*s++ = *t++) != 0)
    802009bc:	00d58963          	beq	a1,a3,802009ce <safestrcpy+0x28>
    802009c0:	0585                	addi	a1,a1,1
    802009c2:	0785                	addi	a5,a5,1
    802009c4:	fff5c703          	lbu	a4,-1(a1)
    802009c8:	fee78fa3          	sb	a4,-1(a5)
    802009cc:	fb65                	bnez	a4,802009bc <safestrcpy+0x16>
        ;
    *s = 0;
    802009ce:	00078023          	sb	zero,0(a5)
    return os;
}
    802009d2:	6422                	ld	s0,8(sp)
    802009d4:	0141                	addi	sp,sp,16
    802009d6:	8082                	ret

00000000802009d8 <strlen>:

int strlen(const char *s) {
    802009d8:	1141                	addi	sp,sp,-16
    802009da:	e422                	sd	s0,8(sp)
    802009dc:	0800                	addi	s0,sp,16
    int n;

    for (n = 0; s[n]; n++)
    802009de:	00054783          	lbu	a5,0(a0)
    802009e2:	cf91                	beqz	a5,802009fe <strlen+0x26>
    802009e4:	0505                	addi	a0,a0,1
    802009e6:	87aa                	mv	a5,a0
    802009e8:	4685                	li	a3,1
    802009ea:	9e89                	subw	a3,a3,a0
    802009ec:	00f6853b          	addw	a0,a3,a5
    802009f0:	0785                	addi	a5,a5,1
    802009f2:	fff7c703          	lbu	a4,-1(a5)
    802009f6:	fb7d                	bnez	a4,802009ec <strlen+0x14>
        ;
    return n;
}
    802009f8:	6422                	ld	s0,8(sp)
    802009fa:	0141                	addi	sp,sp,16
    802009fc:	8082                	ret
    for (n = 0; s[n]; n++)
    802009fe:	4501                	li	a0,0
    80200a00:	bfe5                	j	802009f8 <strlen+0x20>

0000000080200a02 <consputc>:
#include "defs.h"

void consputc(int c) {
    80200a02:	1141                	addi	sp,sp,-16
    80200a04:	e406                	sd	ra,8(sp)
    80200a06:	e022                	sd	s0,0(sp)
    80200a08:	0800                	addi	s0,sp,16
    console_putchar(c);
    80200a0a:	00001097          	auipc	ra,0x1
    80200a0e:	1be080e7          	jalr	446(ra) # 80201bc8 <console_putchar>
}
    80200a12:	60a2                	ld	ra,8(sp)
    80200a14:	6402                	ld	s0,0(sp)
    80200a16:	0141                	addi	sp,sp,16
    80200a18:	8082                	ret

0000000080200a1a <clean_bss>:


extern char s_bss[];
extern char e_bss[];

void clean_bss() {
    80200a1a:	1141                	addi	sp,sp,-16
    80200a1c:	e422                	sd	s0,8(sp)
    80200a1e:	0800                	addi	s0,sp,16
    char* p;
    for(p = s_bss; p < e_bss; ++p)
    80200a20:	00016717          	auipc	a4,0x16
    80200a24:	5e070713          	addi	a4,a4,1504 # 80217000 <names>
    80200a28:	00125797          	auipc	a5,0x125
    80200a2c:	5d878793          	addi	a5,a5,1496 # 80326000 <e_bss>
    80200a30:	00f77c63          	bgeu	a4,a5,80200a48 <clean_bss+0x2e>
    80200a34:	87ba                	mv	a5,a4
    80200a36:	00125717          	auipc	a4,0x125
    80200a3a:	5ca70713          	addi	a4,a4,1482 # 80326000 <e_bss>
        *p = 0;
    80200a3e:	00078023          	sb	zero,0(a5)
    for(p = s_bss; p < e_bss; ++p)
    80200a42:	0785                	addi	a5,a5,1
    80200a44:	fee79de3          	bne	a5,a4,80200a3e <clean_bss+0x24>
}
    80200a48:	6422                	ld	s0,8(sp)
    80200a4a:	0141                	addi	sp,sp,16
    80200a4c:	8082                	ret

0000000080200a4e <main>:

int debug_level = INFO;

void main() {
    80200a4e:	1141                	addi	sp,sp,-16
    80200a50:	e406                	sd	ra,8(sp)
    80200a52:	e022                	sd	s0,0(sp)
    80200a54:	0800                	addi	s0,sp,16
    clean_bss();
    80200a56:	00000097          	auipc	ra,0x0
    80200a5a:	fc4080e7          	jalr	-60(ra) # 80200a1a <clean_bss>
    trapinit();
    80200a5e:	fffff097          	auipc	ra,0xfffff
    80200a62:	6ce080e7          	jalr	1742(ra) # 8020012c <trapinit>
    kinit();
    80200a66:	00001097          	auipc	ra,0x1
    80200a6a:	2de080e7          	jalr	734(ra) # 80201d44 <kinit>
    procinit();
    80200a6e:	00001097          	auipc	ra,0x1
    80200a72:	352080e7          	jalr	850(ra) # 80201dc0 <procinit>
    kvminit();
    80200a76:	00001097          	auipc	ra,0x1
    80200a7a:	86c080e7          	jalr	-1940(ra) # 802012e2 <kvminit>
    batchinit();
    80200a7e:	00000097          	auipc	ra,0x0
    80200a82:	9c2080e7          	jalr	-1598(ra) # 80200440 <batchinit>
    timerinit();
    80200a86:	00002097          	auipc	ra,0x2
    80200a8a:	9b8080e7          	jalr	-1608(ra) # 8020243e <timerinit>
    run_all_app();
    80200a8e:	00000097          	auipc	ra,0x0
    80200a92:	d66080e7          	jalr	-666(ra) # 802007f4 <run_all_app>
    info("start scheduler!\n");
    80200a96:	00005717          	auipc	a4,0x5
    80200a9a:	77a72703          	lw	a4,1914(a4) # 80206210 <debug_level>
    80200a9e:	4785                	li	a5,1
    80200aa0:	00e7d663          	bge	a5,a4,80200aac <main+0x5e>
    scheduler();
    80200aa4:	00001097          	auipc	ra,0x1
    80200aa8:	550080e7          	jalr	1360(ra) # 80201ff4 <scheduler>
    info("start scheduler!\n");
    80200aac:	00124697          	auipc	a3,0x124
    80200ab0:	62c6a683          	lw	a3,1580(a3) # 803250d8 <curr_pid>
    80200ab4:	00004617          	auipc	a2,0x4
    80200ab8:	55463603          	ld	a2,1364(a2) # 80205008 <LEVEL+0x8>
    80200abc:	00004597          	auipc	a1,0x4
    80200ac0:	5685a583          	lw	a1,1384(a1) # 80205024 <COLOR+0x4>
    80200ac4:	00004517          	auipc	a0,0x4
    80200ac8:	80450513          	addi	a0,a0,-2044 # 802042c8 <e_text+0x2c8>
    80200acc:	00001097          	auipc	ra,0x1
    80200ad0:	f4e080e7          	jalr	-178(ra) # 80201a1a <printf>
    80200ad4:	bfc1                	j	80200aa4 <main+0x56>

0000000080200ad6 <sys_write>:

#define min(a, b) a < b ? a : b;

// char user_stk[4096];
uint64 sys_write(int fd, uint64 va, uint len) {
    if (fd != 0)
    80200ad6:	ed3d                	bnez	a0,80200b54 <sys_write+0x7e>
uint64 sys_write(int fd, uint64 va, uint len) {
    80200ad8:	7179                	addi	sp,sp,-48
    80200ada:	f406                	sd	ra,40(sp)
    80200adc:	f022                	sd	s0,32(sp)
    80200ade:	ec26                	sd	s1,24(sp)
    80200ae0:	e84a                	sd	s2,16(sp)
    80200ae2:	e44e                	sd	s3,8(sp)
    80200ae4:	1800                	addi	s0,sp,48
    80200ae6:	84ae                	mv	s1,a1
    80200ae8:	8932                	mv	s2,a2
        return -1;
    struct proc *p = curr_proc();
    80200aea:	00001097          	auipc	ra,0x1
    80200aee:	2b6080e7          	jalr	694(ra) # 80201da0 <curr_proc>
    char* str = (char*)useraddr(p->pagetable, va);
    80200af2:	85a6                	mv	a1,s1
    80200af4:	6908                	ld	a0,16(a0)
    80200af6:	00000097          	auipc	ra,0x0
    80200afa:	68a080e7          	jalr	1674(ra) # 80201180 <useraddr>
    80200afe:	84aa                	mv	s1,a0
    int size = MIN(strlen(str), len);
    80200b00:	00000097          	auipc	ra,0x0
    80200b04:	ed8080e7          	jalr	-296(ra) # 802009d8 <strlen>
    80200b08:	2501                	sext.w	a0,a0
    80200b0a:	0009099b          	sext.w	s3,s2
    80200b0e:	03256c63          	bltu	a0,s2,80200b46 <sys_write+0x70>
    for(int i = 0; i < size; ++i) {
    80200b12:	03305263          	blez	s3,80200b36 <sys_write+0x60>
    80200b16:	00148913          	addi	s2,s1,1
    80200b1a:	fff9879b          	addiw	a5,s3,-1
    80200b1e:	1782                	slli	a5,a5,0x20
    80200b20:	9381                	srli	a5,a5,0x20
    80200b22:	993e                	add	s2,s2,a5
        console_putchar(str[i]);
    80200b24:	0004c503          	lbu	a0,0(s1)
    80200b28:	00001097          	auipc	ra,0x1
    80200b2c:	0a0080e7          	jalr	160(ra) # 80201bc8 <console_putchar>
    for(int i = 0; i < size; ++i) {
    80200b30:	0485                	addi	s1,s1,1
    80200b32:	ff2499e3          	bne	s1,s2,80200b24 <sys_write+0x4e>
    }
    return size;
    80200b36:	854e                	mv	a0,s3
}
    80200b38:	70a2                	ld	ra,40(sp)
    80200b3a:	7402                	ld	s0,32(sp)
    80200b3c:	64e2                	ld	s1,24(sp)
    80200b3e:	6942                	ld	s2,16(sp)
    80200b40:	69a2                	ld	s3,8(sp)
    80200b42:	6145                	addi	sp,sp,48
    80200b44:	8082                	ret
    int size = MIN(strlen(str), len);
    80200b46:	8526                	mv	a0,s1
    80200b48:	00000097          	auipc	ra,0x0
    80200b4c:	e90080e7          	jalr	-368(ra) # 802009d8 <strlen>
    80200b50:	89aa                	mv	s3,a0
    80200b52:	b7c1                	j	80200b12 <sys_write+0x3c>
        return -1;
    80200b54:	557d                	li	a0,-1
}
    80200b56:	8082                	ret

0000000080200b58 <sys_read>:

uint64 sys_read(int fd, uint64 va, uint64 len) {
    80200b58:	7179                	addi	sp,sp,-48
    80200b5a:	f406                	sd	ra,40(sp)
    80200b5c:	f022                	sd	s0,32(sp)
    80200b5e:	ec26                	sd	s1,24(sp)
    80200b60:	e84a                	sd	s2,16(sp)
    80200b62:	e44e                	sd	s3,8(sp)
    80200b64:	1800                	addi	s0,sp,48
    if (fd != 0)
        return -1;
    80200b66:	59fd                	li	s3,-1
    if (fd != 0)
    80200b68:	e91d                	bnez	a0,80200b9e <sys_read+0x46>
    80200b6a:	84ae                	mv	s1,a1
    80200b6c:	89b2                	mv	s3,a2
    struct proc *p = curr_proc();
    80200b6e:	00001097          	auipc	ra,0x1
    80200b72:	232080e7          	jalr	562(ra) # 80201da0 <curr_proc>
    char* str = (char*)useraddr(p->pagetable, va);
    80200b76:	85a6                	mv	a1,s1
    80200b78:	6908                	ld	a0,16(a0)
    80200b7a:	00000097          	auipc	ra,0x0
    80200b7e:	606080e7          	jalr	1542(ra) # 80201180 <useraddr>
    80200b82:	84aa                	mv	s1,a0
    for(int i = 0; i < len; ++i) {
    80200b84:	00098d63          	beqz	s3,80200b9e <sys_read+0x46>
    80200b88:	01350933          	add	s2,a0,s3
        int c = console_getchar();
    80200b8c:	00001097          	auipc	ra,0x1
    80200b90:	052080e7          	jalr	82(ra) # 80201bde <console_getchar>
        str[i] = c;
    80200b94:	00a48023          	sb	a0,0(s1)
    for(int i = 0; i < len; ++i) {
    80200b98:	0485                	addi	s1,s1,1
    80200b9a:	ff2499e3          	bne	s1,s2,80200b8c <sys_read+0x34>
    }
    return len;
}
    80200b9e:	854e                	mv	a0,s3
    80200ba0:	70a2                	ld	ra,40(sp)
    80200ba2:	7402                	ld	s0,32(sp)
    80200ba4:	64e2                	ld	s1,24(sp)
    80200ba6:	6942                	ld	s2,16(sp)
    80200ba8:	69a2                	ld	s3,8(sp)
    80200baa:	6145                	addi	sp,sp,48
    80200bac:	8082                	ret

0000000080200bae <sys_exit>:

uint64 sys_exit(int code) {
    80200bae:	1141                	addi	sp,sp,-16
    80200bb0:	e406                	sd	ra,8(sp)
    80200bb2:	e022                	sd	s0,0(sp)
    80200bb4:	0800                	addi	s0,sp,16
    exit(code);
    80200bb6:	00001097          	auipc	ra,0x1
    80200bba:	6f6080e7          	jalr	1782(ra) # 802022ac <exit>
    return 0;
}
    80200bbe:	4501                	li	a0,0
    80200bc0:	60a2                	ld	ra,8(sp)
    80200bc2:	6402                	ld	s0,0(sp)
    80200bc4:	0141                	addi	sp,sp,16
    80200bc6:	8082                	ret

0000000080200bc8 <sys_sched_yield>:

uint64 sys_sched_yield() {
    80200bc8:	1141                	addi	sp,sp,-16
    80200bca:	e406                	sd	ra,8(sp)
    80200bcc:	e022                	sd	s0,0(sp)
    80200bce:	0800                	addi	s0,sp,16
    yield();
    80200bd0:	00001097          	auipc	ra,0x1
    80200bd4:	4fe080e7          	jalr	1278(ra) # 802020ce <yield>
    return 0;
}
    80200bd8:	4501                	li	a0,0
    80200bda:	60a2                	ld	ra,8(sp)
    80200bdc:	6402                	ld	s0,0(sp)
    80200bde:	0141                	addi	sp,sp,16
    80200be0:	8082                	ret

0000000080200be2 <sys_getpid>:


uint64 sys_getpid() {
    80200be2:	1141                	addi	sp,sp,-16
    80200be4:	e406                	sd	ra,8(sp)
    80200be6:	e022                	sd	s0,0(sp)
    80200be8:	0800                	addi	s0,sp,16
    return curr_proc()->pid;
    80200bea:	00001097          	auipc	ra,0x1
    80200bee:	1b6080e7          	jalr	438(ra) # 80201da0 <curr_proc>
}
    80200bf2:	4508                	lw	a0,8(a0)
    80200bf4:	60a2                	ld	ra,8(sp)
    80200bf6:	6402                	ld	s0,0(sp)
    80200bf8:	0141                	addi	sp,sp,16
    80200bfa:	8082                	ret

0000000080200bfc <sys_clone>:

uint64 sys_clone() {
    80200bfc:	1141                	addi	sp,sp,-16
    80200bfe:	e406                	sd	ra,8(sp)
    80200c00:	e022                	sd	s0,0(sp)
    80200c02:	0800                	addi	s0,sp,16
    return fork();
    80200c04:	00001097          	auipc	ra,0x1
    80200c08:	4ee080e7          	jalr	1262(ra) # 802020f2 <fork>
}
    80200c0c:	60a2                	ld	ra,8(sp)
    80200c0e:	6402                	ld	s0,0(sp)
    80200c10:	0141                	addi	sp,sp,16
    80200c12:	8082                	ret

0000000080200c14 <sys_exec>:

uint64 sys_exec(uint64 va) {
    80200c14:	1101                	addi	sp,sp,-32
    80200c16:	ec06                	sd	ra,24(sp)
    80200c18:	e822                	sd	s0,16(sp)
    80200c1a:	e426                	sd	s1,8(sp)
    80200c1c:	1000                	addi	s0,sp,32
    80200c1e:	84aa                	mv	s1,a0
    struct proc* p = curr_proc();
    80200c20:	00001097          	auipc	ra,0x1
    80200c24:	180080e7          	jalr	384(ra) # 80201da0 <curr_proc>
    char* name = (char*)useraddr(p->pagetable, va);
    80200c28:	85a6                	mv	a1,s1
    80200c2a:	6908                	ld	a0,16(a0)
    80200c2c:	00000097          	auipc	ra,0x0
    80200c30:	554080e7          	jalr	1364(ra) # 80201180 <useraddr>
    80200c34:	84aa                	mv	s1,a0
    info("sys_exec %s\n", name);
    80200c36:	00005717          	auipc	a4,0x5
    80200c3a:	5da72703          	lw	a4,1498(a4) # 80206210 <debug_level>
    80200c3e:	4785                	li	a5,1
    80200c40:	00e7dc63          	bge	a5,a4,80200c58 <sys_exec+0x44>
    return exec(name);
    80200c44:	8526                	mv	a0,s1
    80200c46:	00001097          	auipc	ra,0x1
    80200c4a:	556080e7          	jalr	1366(ra) # 8020219c <exec>
}
    80200c4e:	60e2                	ld	ra,24(sp)
    80200c50:	6442                	ld	s0,16(sp)
    80200c52:	64a2                	ld	s1,8(sp)
    80200c54:	6105                	addi	sp,sp,32
    80200c56:	8082                	ret
    info("sys_exec %s\n", name);
    80200c58:	872a                	mv	a4,a0
    80200c5a:	00124697          	auipc	a3,0x124
    80200c5e:	47e6a683          	lw	a3,1150(a3) # 803250d8 <curr_pid>
    80200c62:	00004617          	auipc	a2,0x4
    80200c66:	3a663603          	ld	a2,934(a2) # 80205008 <LEVEL+0x8>
    80200c6a:	00004597          	auipc	a1,0x4
    80200c6e:	3ba5a583          	lw	a1,954(a1) # 80205024 <COLOR+0x4>
    80200c72:	00003517          	auipc	a0,0x3
    80200c76:	67e50513          	addi	a0,a0,1662 # 802042f0 <e_text+0x2f0>
    80200c7a:	00001097          	auipc	ra,0x1
    80200c7e:	da0080e7          	jalr	-608(ra) # 80201a1a <printf>
    80200c82:	b7c9                	j	80200c44 <sys_exec+0x30>

0000000080200c84 <sys_wait>:

uint64 sys_wait(int pid, uint64 va) {
    80200c84:	1101                	addi	sp,sp,-32
    80200c86:	ec06                	sd	ra,24(sp)
    80200c88:	e822                	sd	s0,16(sp)
    80200c8a:	e426                	sd	s1,8(sp)
    80200c8c:	e04a                	sd	s2,0(sp)
    80200c8e:	1000                	addi	s0,sp,32
    80200c90:	84aa                	mv	s1,a0
    80200c92:	892e                	mv	s2,a1
    struct proc* p = curr_proc();
    80200c94:	00001097          	auipc	ra,0x1
    80200c98:	10c080e7          	jalr	268(ra) # 80201da0 <curr_proc>
    int* code = (int*)useraddr(p->pagetable, va);
    80200c9c:	85ca                	mv	a1,s2
    80200c9e:	6908                	ld	a0,16(a0)
    80200ca0:	00000097          	auipc	ra,0x0
    80200ca4:	4e0080e7          	jalr	1248(ra) # 80201180 <useraddr>
    80200ca8:	85aa                	mv	a1,a0
    return wait(pid, code);
    80200caa:	8526                	mv	a0,s1
    80200cac:	00001097          	auipc	ra,0x1
    80200cb0:	562080e7          	jalr	1378(ra) # 8020220e <wait>
}
    80200cb4:	60e2                	ld	ra,24(sp)
    80200cb6:	6442                	ld	s0,16(sp)
    80200cb8:	64a2                	ld	s1,8(sp)
    80200cba:	6902                	ld	s2,0(sp)
    80200cbc:	6105                	addi	sp,sp,32
    80200cbe:	8082                	ret

0000000080200cc0 <sys_times>:

uint64 sys_times() {
    80200cc0:	1141                	addi	sp,sp,-16
    80200cc2:	e406                	sd	ra,8(sp)
    80200cc4:	e022                	sd	s0,0(sp)
    80200cc6:	0800                	addi	s0,sp,16
    return get_time_ms();
    80200cc8:	00001097          	auipc	ra,0x1
    80200ccc:	79a080e7          	jalr	1946(ra) # 80202462 <get_time_ms>
}
    80200cd0:	60a2                	ld	ra,8(sp)
    80200cd2:	6402                	ld	s0,0(sp)
    80200cd4:	0141                	addi	sp,sp,16
    80200cd6:	8082                	ret

0000000080200cd8 <sys_setpriority>:

uint64 sys_setpriority(int code) {
    80200cd8:	1141                	addi	sp,sp,-16
    80200cda:	e406                	sd	ra,8(sp)
    80200cdc:	e022                	sd	s0,0(sp)
    80200cde:	0800                	addi	s0,sp,16
    uint64 rtn = set_priority(code);
    80200ce0:	00001097          	auipc	ra,0x1
    80200ce4:	69c080e7          	jalr	1692(ra) # 8020237c <set_priority>
    return rtn;
}
    80200ce8:	60a2                	ld	ra,8(sp)
    80200cea:	6402                	ld	s0,0(sp)
    80200cec:	0141                	addi	sp,sp,16
    80200cee:	8082                	ret

0000000080200cf0 <sys_get_time>:

uint64 sys_get_time(uint64 ts,int tz){
    80200cf0:	1101                	addi	sp,sp,-32
    80200cf2:	ec06                	sd	ra,24(sp)
    80200cf4:	e822                	sd	s0,16(sp)
    80200cf6:	e426                	sd	s1,8(sp)
    80200cf8:	1000                	addi	s0,sp,32
    80200cfa:	84aa                	mv	s1,a0
    // printf("im here");
    struct proc *p = curr_proc();
    80200cfc:	00001097          	auipc	ra,0x1
    80200d00:	0a4080e7          	jalr	164(ra) # 80201da0 <curr_proc>
    uint64 physical_addr = useraddr(p->pagetable,ts);
    80200d04:	85a6                	mv	a1,s1
    80200d06:	6908                	ld	a0,16(a0)
    80200d08:	00000097          	auipc	ra,0x0
    80200d0c:	478080e7          	jalr	1144(ra) # 80201180 <useraddr>
    uint64 rtn = get_time((TimeVal *)physical_addr,0);
    80200d10:	4581                	li	a1,0
    80200d12:	00001097          	auipc	ra,0x1
    80200d16:	6a4080e7          	jalr	1700(ra) # 802023b6 <get_time>
    // printf("%d",((ts->sec & 0xffff) * 1000 + ts->usec / 1000));
    // printf("\n");
    // printf("here i am \n");
    return rtn;
}
    80200d1a:	60e2                	ld	ra,24(sp)
    80200d1c:	6442                	ld	s0,16(sp)
    80200d1e:	64a2                	ld	s1,8(sp)
    80200d20:	6105                	addi	sp,sp,32
    80200d22:	8082                	ret

0000000080200d24 <sys_mmap>:

uint64 sys_mmap(uint64 start, uint64 len, uint64 port){
    80200d24:	711d                	addi	sp,sp,-96
    80200d26:	ec86                	sd	ra,88(sp)
    80200d28:	e8a2                	sd	s0,80(sp)
    80200d2a:	e4a6                	sd	s1,72(sp)
    80200d2c:	e0ca                	sd	s2,64(sp)
    80200d2e:	fc4e                	sd	s3,56(sp)
    80200d30:	f852                	sd	s4,48(sp)
    80200d32:	f456                	sd	s5,40(sp)
    80200d34:	f05a                	sd	s6,32(sp)
    80200d36:	ec5e                	sd	s7,24(sp)
    80200d38:	e862                	sd	s8,16(sp)
    80200d3a:	e466                	sd	s9,8(sp)
    80200d3c:	e06a                	sd	s10,0(sp)
    80200d3e:	1080                	addi	s0,sp,96
    80200d40:	89aa                	mv	s3,a0
    80200d42:	84ae                	mv	s1,a1
    80200d44:	8a32                	mv	s4,a2
    struct proc *p = curr_proc();
    80200d46:	00001097          	auipc	ra,0x1
    80200d4a:	05a080e7          	jalr	90(ra) # 80201da0 <curr_proc>
    int mmp=0;
    if(((port&0x8)!=0) || ((port&0x7)==0)){
    80200d4e:	007a7793          	andi	a5,s4,7
        return -1;
    80200d52:	5d7d                	li	s10,-1
    if(((port&0x8)!=0) || ((port&0x7)==0)){
    80200d54:	cbd9                	beqz	a5,80200dea <sys_mmap+0xc6>
    80200d56:	8aaa                	mv	s5,a0
    80200d58:	008a7713          	andi	a4,s4,8
    }
    port = port<<1;
    port = port | PTE_U;
    port = port | PTE_V;
    
    if(start%4096!=0)
    80200d5c:	03499913          	slli	s2,s3,0x34
    80200d60:	03495913          	srli	s2,s2,0x34
    80200d64:	00e96933          	or	s2,s2,a4
        return -1;
    80200d68:	5d7d                	li	s10,-1
    if(start%4096!=0)
    80200d6a:	08091063          	bnez	s2,80200dea <sys_mmap+0xc6>

    if(len%4096!=0){
    80200d6e:	03449793          	slli	a5,s1,0x34
    80200d72:	8d26                	mv	s10,s1
    80200d74:	cb81                	beqz	a5,80200d84 <sys_mmap+0x60>
        while(len%4096!=0){
    80200d76:	6705                	lui	a4,0x1
    80200d78:	177d                	addi	a4,a4,-1
            len++;
    80200d7a:	0485                	addi	s1,s1,1
        while(len%4096!=0){
    80200d7c:	00e4f7b3          	and	a5,s1,a4
    80200d80:	ffed                	bnez	a5,80200d7a <sys_mmap+0x56>
            len++;
    80200d82:	8d26                	mv	s10,s1
        }    
    }
    for(int i=0;i<len/PGSIZE;i++){
    80200d84:	00cd5b13          	srli	s6,s10,0xc
    80200d88:	6785                	lui	a5,0x1
    80200d8a:	06fd6063          	bltu	s10,a5,80200dea <sys_mmap+0xc6>
    port = port<<1;
    80200d8e:	0a06                	slli	s4,s4,0x1
    port = port | PTE_V;
    80200d90:	011a6a13          	ori	s4,s4,17
    uint64 physical_addr = (uint64) kalloc();
    // start left shift, last bit 
    printf("port1 is %d",port);
    80200d94:	00003c97          	auipc	s9,0x3
    80200d98:	57cc8c93          	addi	s9,s9,1404 # 80204310 <e_text+0x310>
    printf("port is %d\n", port);
    80200d9c:	00003c17          	auipc	s8,0x3
    80200da0:	584c0c13          	addi	s8,s8,1412 # 80204320 <e_text+0x320>
    mmp = mappages(p->pagetable, start+i*PGSIZE, PGSIZE, physical_addr, port);
    80200da4:	000a0b9b          	sext.w	s7,s4
    uint64 physical_addr = (uint64) kalloc();
    80200da8:	00001097          	auipc	ra,0x1
    80200dac:	fc0080e7          	jalr	-64(ra) # 80201d68 <kalloc>
    80200db0:	84aa                	mv	s1,a0
    printf("port1 is %d",port);
    80200db2:	85d2                	mv	a1,s4
    80200db4:	8566                	mv	a0,s9
    80200db6:	00001097          	auipc	ra,0x1
    80200dba:	c64080e7          	jalr	-924(ra) # 80201a1a <printf>
    printf("port is %d\n", port);
    80200dbe:	85d2                	mv	a1,s4
    80200dc0:	8562                	mv	a0,s8
    80200dc2:	00001097          	auipc	ra,0x1
    80200dc6:	c58080e7          	jalr	-936(ra) # 80201a1a <printf>
    mmp = mappages(p->pagetable, start+i*PGSIZE, PGSIZE, physical_addr, port);
    80200dca:	875e                	mv	a4,s7
    80200dcc:	86a6                	mv	a3,s1
    80200dce:	6605                	lui	a2,0x1
    80200dd0:	85ce                	mv	a1,s3
    80200dd2:	010ab503          	ld	a0,16(s5)
    80200dd6:	00000097          	auipc	ra,0x0
    80200dda:	3ce080e7          	jalr	974(ra) # 802011a4 <mappages>
    for(int i=0;i<len/PGSIZE;i++){
    80200dde:	0905                	addi	s2,s2,1
    80200de0:	6785                	lui	a5,0x1
    80200de2:	99be                	add	s3,s3,a5
    80200de4:	fd6962e3          	bltu	s2,s6,80200da8 <sys_mmap+0x84>
    }
    if(mmp == 0){
    80200de8:	e105                	bnez	a0,80200e08 <sys_mmap+0xe4>
        return len;
    }
    else
        return -1;
}
    80200dea:	856a                	mv	a0,s10
    80200dec:	60e6                	ld	ra,88(sp)
    80200dee:	6446                	ld	s0,80(sp)
    80200df0:	64a6                	ld	s1,72(sp)
    80200df2:	6906                	ld	s2,64(sp)
    80200df4:	79e2                	ld	s3,56(sp)
    80200df6:	7a42                	ld	s4,48(sp)
    80200df8:	7aa2                	ld	s5,40(sp)
    80200dfa:	7b02                	ld	s6,32(sp)
    80200dfc:	6be2                	ld	s7,24(sp)
    80200dfe:	6c42                	ld	s8,16(sp)
    80200e00:	6ca2                	ld	s9,8(sp)
    80200e02:	6d02                	ld	s10,0(sp)
    80200e04:	6125                	addi	sp,sp,96
    80200e06:	8082                	ret
        return -1;
    80200e08:	5d7d                	li	s10,-1
    80200e0a:	b7c5                	j	80200dea <sys_mmap+0xc6>

0000000080200e0c <sys_munmap>:

uint64 sys_munmap(uint64 start, uint64 len){

    if(start%4096!=0)
    80200e0c:	03451793          	slli	a5,a0,0x34
    80200e10:	e7d1                	bnez	a5,80200e9c <sys_munmap+0x90>
uint64 sys_munmap(uint64 start, uint64 len){
    80200e12:	7139                	addi	sp,sp,-64
    80200e14:	fc06                	sd	ra,56(sp)
    80200e16:	f822                	sd	s0,48(sp)
    80200e18:	f426                	sd	s1,40(sp)
    80200e1a:	f04a                	sd	s2,32(sp)
    80200e1c:	ec4e                	sd	s3,24(sp)
    80200e1e:	e852                	sd	s4,16(sp)
    80200e20:	e456                	sd	s5,8(sp)
    80200e22:	e05a                	sd	s6,0(sp)
    80200e24:	0080                	addi	s0,sp,64
    80200e26:	8aaa                	mv	s5,a0
    80200e28:	892e                	mv	s2,a1
        return -1;

    if(len%4096!=0){
    80200e2a:	03459793          	slli	a5,a1,0x34
    80200e2e:	c799                	beqz	a5,80200e3c <sys_munmap+0x30>
        while(len%4096!=0){
    80200e30:	6705                	lui	a4,0x1
    80200e32:	177d                	addi	a4,a4,-1
            len++;
    80200e34:	0905                	addi	s2,s2,1
        while(len%4096!=0){
    80200e36:	00e977b3          	and	a5,s2,a4
    80200e3a:	ffed                	bnez	a5,80200e34 <sys_munmap+0x28>
        }    
    }
    pte_t *pte;
    uint64 a;
    struct proc *p = curr_proc();
    80200e3c:	00001097          	auipc	ra,0x1
    80200e40:	f64080e7          	jalr	-156(ra) # 80201da0 <curr_proc>
    80200e44:	8a2a                	mv	s4,a0
    for (a = start; a < start + (len/PGSIZE) * PGSIZE; a += PGSIZE) {
    80200e46:	79fd                	lui	s3,0xfffff
    80200e48:	013979b3          	and	s3,s2,s3
    80200e4c:	99d6                	add	s3,s3,s5
    80200e4e:	033af263          	bgeu	s5,s3,80200e72 <sys_munmap+0x66>
    80200e52:	84d6                	mv	s1,s5
    80200e54:	6b05                	lui	s6,0x1
        pte = walk(p->pagetable, a, 0);
    80200e56:	4601                	li	a2,0
    80200e58:	85a6                	mv	a1,s1
    80200e5a:	010a3503          	ld	a0,16(s4) # 1010 <_entry-0x801feff0>
    80200e5e:	00000097          	auipc	ra,0x0
    80200e62:	236080e7          	jalr	566(ra) # 80201094 <walk>
        if ((*pte & PTE_V) == 0){
    80200e66:	611c                	ld	a5,0(a0)
    80200e68:	8b85                	andi	a5,a5,1
    80200e6a:	cb9d                	beqz	a5,80200ea0 <sys_munmap+0x94>
    for (a = start; a < start + (len/PGSIZE) * PGSIZE; a += PGSIZE) {
    80200e6c:	94da                	add	s1,s1,s6
    80200e6e:	ff34e4e3          	bltu	s1,s3,80200e56 <sys_munmap+0x4a>
            return -1; //not mapped, return -1
        }
    }

    uvmunmap(p->pagetable,start,len/PGSIZE,1);
    80200e72:	4685                	li	a3,1
    80200e74:	00c95613          	srli	a2,s2,0xc
    80200e78:	85d6                	mv	a1,s5
    80200e7a:	010a3503          	ld	a0,16(s4)
    80200e7e:	00000097          	auipc	ra,0x0
    80200e82:	4a8080e7          	jalr	1192(ra) # 80201326 <uvmunmap>
    return len;
    80200e86:	854a                	mv	a0,s2
}
    80200e88:	70e2                	ld	ra,56(sp)
    80200e8a:	7442                	ld	s0,48(sp)
    80200e8c:	74a2                	ld	s1,40(sp)
    80200e8e:	7902                	ld	s2,32(sp)
    80200e90:	69e2                	ld	s3,24(sp)
    80200e92:	6a42                	ld	s4,16(sp)
    80200e94:	6aa2                	ld	s5,8(sp)
    80200e96:	6b02                	ld	s6,0(sp)
    80200e98:	6121                	addi	sp,sp,64
    80200e9a:	8082                	ret
        return -1;
    80200e9c:	557d                	li	a0,-1
}
    80200e9e:	8082                	ret
            return -1; //not mapped, return -1
    80200ea0:	557d                	li	a0,-1
    80200ea2:	b7dd                	j	80200e88 <sys_munmap+0x7c>

0000000080200ea4 <syscall>:
// 0  0 0 1 1
// 16 8 4 2 1
// 00110

void syscall() {
    80200ea4:	711d                	addi	sp,sp,-96
    80200ea6:	ec86                	sd	ra,88(sp)
    80200ea8:	e8a2                	sd	s0,80(sp)
    80200eaa:	e4a6                	sd	s1,72(sp)
    80200eac:	e0ca                	sd	s2,64(sp)
    80200eae:	fc4e                	sd	s3,56(sp)
    80200eb0:	f852                	sd	s4,48(sp)
    80200eb2:	f456                	sd	s5,40(sp)
    80200eb4:	1080                	addi	s0,sp,96
    struct proc *p = curr_proc();
    80200eb6:	00001097          	auipc	ra,0x1
    80200eba:	eea080e7          	jalr	-278(ra) # 80201da0 <curr_proc>
    struct trapframe *trapframe = p->trapframe;
    80200ebe:	02853903          	ld	s2,40(a0)
    int id = trapframe->a7, ret;
    80200ec2:	0a892483          	lw	s1,168(s2)
    uint64 args[6] = {trapframe->a0, trapframe->a1, trapframe->a2, trapframe->a3, trapframe->a4, trapframe->a5};
    80200ec6:	07093983          	ld	s3,112(s2)
    80200eca:	07893a03          	ld	s4,120(s2)
    80200ece:	08093a83          	ld	s5,128(s2)
    trace("syscall %d args:%p %p %p %p %p %p\n", id, args[0], args[1], args[2], args[3], args[4], args[5]);
    80200ed2:	00005797          	auipc	a5,0x5
    80200ed6:	33e7a783          	lw	a5,830(a5) # 80206210 <debug_level>
    80200eda:	02f05c63          	blez	a5,80200f12 <syscall+0x6e>
    switch (id) {
    80200ede:	09900793          	li	a5,153
    80200ee2:	12f48e63          	beq	s1,a5,8020101e <syscall+0x17a>
    80200ee6:	0697d863          	bge	a5,s1,80200f56 <syscall+0xb2>
    80200eea:	0dd00793          	li	a5,221
    80200eee:	12f48063          	beq	s1,a5,8020100e <syscall+0x16a>
    80200ef2:	0c97d663          	bge	a5,s1,80200fbe <syscall+0x11a>
    80200ef6:	10400793          	li	a5,260
    80200efa:	12f49963          	bne	s1,a5,8020102c <syscall+0x188>
            break;
        case SYS_execve:
            ret = sys_exec(args[0]);
            break;
        case SYS_wait4:
            ret = sys_wait(args[0], args[1]);
    80200efe:	85d2                	mv	a1,s4
    80200f00:	0009851b          	sext.w	a0,s3
    80200f04:	00000097          	auipc	ra,0x0
    80200f08:	d80080e7          	jalr	-640(ra) # 80200c84 <sys_wait>
    80200f0c:	0005071b          	sext.w	a4,a0
            break;
    80200f10:	a071                	j	80200f9c <syscall+0xf8>
    trace("syscall %d args:%p %p %p %p %p %p\n", id, args[0], args[1], args[2], args[3], args[4], args[5]);
    80200f12:	09893783          	ld	a5,152(s2)
    80200f16:	e83e                	sd	a5,16(sp)
    80200f18:	09093783          	ld	a5,144(s2)
    80200f1c:	e43e                	sd	a5,8(sp)
    80200f1e:	08893783          	ld	a5,136(s2)
    80200f22:	e03e                	sd	a5,0(sp)
    80200f24:	88d6                	mv	a7,s5
    80200f26:	8852                	mv	a6,s4
    80200f28:	87ce                	mv	a5,s3
    80200f2a:	8726                	mv	a4,s1
    80200f2c:	00124697          	auipc	a3,0x124
    80200f30:	1ac6a683          	lw	a3,428(a3) # 803250d8 <curr_pid>
    80200f34:	00004617          	auipc	a2,0x4
    80200f38:	0cc63603          	ld	a2,204(a2) # 80205000 <LEVEL>
    80200f3c:	00004597          	auipc	a1,0x4
    80200f40:	0e45a583          	lw	a1,228(a1) # 80205020 <COLOR>
    80200f44:	00003517          	auipc	a0,0x3
    80200f48:	3ec50513          	addi	a0,a0,1004 # 80204330 <e_text+0x330>
    80200f4c:	00001097          	auipc	ra,0x1
    80200f50:	ace080e7          	jalr	-1330(ra) # 80201a1a <printf>
    80200f54:	b769                	j	80200ede <syscall+0x3a>
    switch (id) {
    80200f56:	05d00793          	li	a5,93
    80200f5a:	08f48b63          	beq	s1,a5,80200ff0 <syscall+0x14c>
    80200f5e:	0097dc63          	bge	a5,s1,80200f76 <syscall+0xd2>
    80200f62:	07c00793          	li	a5,124
    80200f66:	0cf49363          	bne	s1,a5,8020102c <syscall+0x188>
    yield();
    80200f6a:	00001097          	auipc	ra,0x1
    80200f6e:	164080e7          	jalr	356(ra) # 802020ce <yield>
            ret = sys_sched_yield();
    80200f72:	4701                	li	a4,0
            break;
    80200f74:	a025                	j	80200f9c <syscall+0xf8>
    switch (id) {
    80200f76:	03f00793          	li	a5,63
    80200f7a:	06f48063          	beq	s1,a5,80200fda <syscall+0x136>
    80200f7e:	04000793          	li	a5,64
    80200f82:	0af49563          	bne	s1,a5,8020102c <syscall+0x188>
            ret = sys_write(args[0], args[1], args[2]);
    80200f86:	000a861b          	sext.w	a2,s5
    80200f8a:	85d2                	mv	a1,s4
    80200f8c:	0009851b          	sext.w	a0,s3
    80200f90:	00000097          	auipc	ra,0x0
    80200f94:	b46080e7          	jalr	-1210(ra) # 80200ad6 <sys_write>
    80200f98:	0005071b          	sext.w	a4,a0
            break;
        default:
            ret = -1;
            warn("unknown syscall %d\n", id);
    }
    trapframe->a0 = ret;
    80200f9c:	06e93823          	sd	a4,112(s2)
    trace("syscall ret %d\n", ret);
    80200fa0:	00005797          	auipc	a5,0x5
    80200fa4:	2707a783          	lw	a5,624(a5) # 80206210 <debug_level>
    80200fa8:	0cf05163          	blez	a5,8020106a <syscall+0x1c6>
}
    80200fac:	60e6                	ld	ra,88(sp)
    80200fae:	6446                	ld	s0,80(sp)
    80200fb0:	64a6                	ld	s1,72(sp)
    80200fb2:	6906                	ld	s2,64(sp)
    80200fb4:	79e2                	ld	s3,56(sp)
    80200fb6:	7a42                	ld	s4,48(sp)
    80200fb8:	7aa2                	ld	s5,40(sp)
    80200fba:	6125                	addi	sp,sp,96
    80200fbc:	8082                	ret
    switch (id) {
    80200fbe:	0ac00793          	li	a5,172
    80200fc2:	02f48f63          	beq	s1,a5,80201000 <syscall+0x15c>
    80200fc6:	0dc00793          	li	a5,220
    80200fca:	06f49163          	bne	s1,a5,8020102c <syscall+0x188>
    return fork();
    80200fce:	00001097          	auipc	ra,0x1
    80200fd2:	124080e7          	jalr	292(ra) # 802020f2 <fork>
    80200fd6:	872a                	mv	a4,a0
            break;
    80200fd8:	b7d1                	j	80200f9c <syscall+0xf8>
            ret = sys_read(args[0], args[1], args[2]);
    80200fda:	8656                	mv	a2,s5
    80200fdc:	85d2                	mv	a1,s4
    80200fde:	0009851b          	sext.w	a0,s3
    80200fe2:	00000097          	auipc	ra,0x0
    80200fe6:	b76080e7          	jalr	-1162(ra) # 80200b58 <sys_read>
    80200fea:	0005071b          	sext.w	a4,a0
            break;
    80200fee:	b77d                	j	80200f9c <syscall+0xf8>
    exit(code);
    80200ff0:	0009851b          	sext.w	a0,s3
    80200ff4:	00001097          	auipc	ra,0x1
    80200ff8:	2b8080e7          	jalr	696(ra) # 802022ac <exit>
            ret = sys_exit(args[0]);
    80200ffc:	4701                	li	a4,0
            break;
    80200ffe:	bf79                	j	80200f9c <syscall+0xf8>
            ret = sys_getpid();
    80201000:	00000097          	auipc	ra,0x0
    80201004:	be2080e7          	jalr	-1054(ra) # 80200be2 <sys_getpid>
    80201008:	0005071b          	sext.w	a4,a0
            break;
    8020100c:	bf41                	j	80200f9c <syscall+0xf8>
            ret = sys_exec(args[0]);
    8020100e:	854e                	mv	a0,s3
    80201010:	00000097          	auipc	ra,0x0
    80201014:	c04080e7          	jalr	-1020(ra) # 80200c14 <sys_exec>
    80201018:	0005071b          	sext.w	a4,a0
            break;
    8020101c:	b741                	j	80200f9c <syscall+0xf8>
    return get_time_ms();
    8020101e:	00001097          	auipc	ra,0x1
    80201022:	444080e7          	jalr	1092(ra) # 80202462 <get_time_ms>
            ret = sys_times();
    80201026:	0005071b          	sext.w	a4,a0
            break;
    8020102a:	bf8d                	j	80200f9c <syscall+0xf8>
            warn("unknown syscall %d\n", id);
    8020102c:	00005697          	auipc	a3,0x5
    80201030:	1e46a683          	lw	a3,484(a3) # 80206210 <debug_level>
    80201034:	4789                	li	a5,2
            ret = -1;
    80201036:	577d                	li	a4,-1
            warn("unknown syscall %d\n", id);
    80201038:	f6d7c2e3          	blt	a5,a3,80200f9c <syscall+0xf8>
    8020103c:	8726                	mv	a4,s1
    8020103e:	00124697          	auipc	a3,0x124
    80201042:	09a6a683          	lw	a3,154(a3) # 803250d8 <curr_pid>
    80201046:	00004617          	auipc	a2,0x4
    8020104a:	fca63603          	ld	a2,-54(a2) # 80205010 <LEVEL+0x10>
    8020104e:	00004597          	auipc	a1,0x4
    80201052:	fda5a583          	lw	a1,-38(a1) # 80205028 <COLOR+0x8>
    80201056:	00003517          	auipc	a0,0x3
    8020105a:	31250513          	addi	a0,a0,786 # 80204368 <e_text+0x368>
    8020105e:	00001097          	auipc	ra,0x1
    80201062:	9bc080e7          	jalr	-1604(ra) # 80201a1a <printf>
            ret = -1;
    80201066:	577d                	li	a4,-1
    80201068:	bf15                	j	80200f9c <syscall+0xf8>
    trace("syscall ret %d\n", ret);
    8020106a:	00124697          	auipc	a3,0x124
    8020106e:	06e6a683          	lw	a3,110(a3) # 803250d8 <curr_pid>
    80201072:	00004617          	auipc	a2,0x4
    80201076:	f8e63603          	ld	a2,-114(a2) # 80205000 <LEVEL>
    8020107a:	00004597          	auipc	a1,0x4
    8020107e:	fa65a583          	lw	a1,-90(a1) # 80205020 <COLOR>
    80201082:	00003517          	auipc	a0,0x3
    80201086:	30e50513          	addi	a0,a0,782 # 80204390 <e_text+0x390>
    8020108a:	00001097          	auipc	ra,0x1
    8020108e:	990080e7          	jalr	-1648(ra) # 80201a1a <printf>
}
    80201092:	bf29                	j	80200fac <syscall+0x108>

0000000080201094 <walk>:
//   30..38 -- 9 bits of level-2 index.
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc) {
    80201094:	7139                	addi	sp,sp,-64
    80201096:	fc06                	sd	ra,56(sp)
    80201098:	f822                	sd	s0,48(sp)
    8020109a:	f426                	sd	s1,40(sp)
    8020109c:	f04a                	sd	s2,32(sp)
    8020109e:	ec4e                	sd	s3,24(sp)
    802010a0:	e852                	sd	s4,16(sp)
    802010a2:	e456                	sd	s5,8(sp)
    802010a4:	e05a                	sd	s6,0(sp)
    802010a6:	0080                	addi	s0,sp,64
    802010a8:	84aa                	mv	s1,a0
    802010aa:	89ae                	mv	s3,a1
    802010ac:	8ab2                	mv	s5,a2
    if (va >= MAXVA)
    802010ae:	57fd                	li	a5,-1
    802010b0:	83e9                	srli	a5,a5,0x1a
    802010b2:	00b7e563          	bltu	a5,a1,802010bc <walk+0x28>
walk(pagetable_t pagetable, uint64 va, int alloc) {
    802010b6:	4a79                	li	s4,30
        panic("walk");

    for (int level = 2; level > 0; level--) {
    802010b8:	4b31                	li	s6,12
    802010ba:	a091                	j	802010fe <walk+0x6a>
        panic("walk");
    802010bc:	00003517          	auipc	a0,0x3
    802010c0:	2fc50513          	addi	a0,a0,764 # 802043b8 <e_text+0x3b8>
    802010c4:	fffff097          	auipc	ra,0xfffff
    802010c8:	fba080e7          	jalr	-70(ra) # 8020007e <panic>
    802010cc:	b7ed                	j	802010b6 <walk+0x22>
        pte_t *pte = &pagetable[PX(level, va)];
        if (*pte & PTE_V) {
            pagetable = (pagetable_t) PTE2PA(*pte);
        } else {
            if (!alloc || (pagetable = (pde_t *) kalloc()) == 0)
    802010ce:	060a8663          	beqz	s5,8020113a <walk+0xa6>
    802010d2:	00001097          	auipc	ra,0x1
    802010d6:	c96080e7          	jalr	-874(ra) # 80201d68 <kalloc>
    802010da:	84aa                	mv	s1,a0
    802010dc:	c529                	beqz	a0,80201126 <walk+0x92>
                return 0;
            memset(pagetable, 0, PGSIZE);
    802010de:	6605                	lui	a2,0x1
    802010e0:	4581                	li	a1,0
    802010e2:	fffff097          	auipc	ra,0xfffff
    802010e6:	772080e7          	jalr	1906(ra) # 80200854 <memset>
            *pte = PA2PTE(pagetable) | PTE_V;
    802010ea:	00c4d793          	srli	a5,s1,0xc
    802010ee:	07aa                	slli	a5,a5,0xa
    802010f0:	0017e793          	ori	a5,a5,1
    802010f4:	00f93023          	sd	a5,0(s2)
    for (int level = 2; level > 0; level--) {
    802010f8:	3a5d                	addiw	s4,s4,-9
    802010fa:	036a0063          	beq	s4,s6,8020111a <walk+0x86>
        pte_t *pte = &pagetable[PX(level, va)];
    802010fe:	0149d933          	srl	s2,s3,s4
    80201102:	1ff97913          	andi	s2,s2,511
    80201106:	090e                	slli	s2,s2,0x3
    80201108:	9926                	add	s2,s2,s1
        if (*pte & PTE_V) {
    8020110a:	00093483          	ld	s1,0(s2)
    8020110e:	0014f793          	andi	a5,s1,1
    80201112:	dfd5                	beqz	a5,802010ce <walk+0x3a>
            pagetable = (pagetable_t) PTE2PA(*pte);
    80201114:	80a9                	srli	s1,s1,0xa
    80201116:	04b2                	slli	s1,s1,0xc
    80201118:	b7c5                	j	802010f8 <walk+0x64>
        }
    }
    return &pagetable[PX(0, va)];
    8020111a:	00c9d513          	srli	a0,s3,0xc
    8020111e:	1ff57513          	andi	a0,a0,511
    80201122:	050e                	slli	a0,a0,0x3
    80201124:	9526                	add	a0,a0,s1
}
    80201126:	70e2                	ld	ra,56(sp)
    80201128:	7442                	ld	s0,48(sp)
    8020112a:	74a2                	ld	s1,40(sp)
    8020112c:	7902                	ld	s2,32(sp)
    8020112e:	69e2                	ld	s3,24(sp)
    80201130:	6a42                	ld	s4,16(sp)
    80201132:	6aa2                	ld	s5,8(sp)
    80201134:	6b02                	ld	s6,0(sp)
    80201136:	6121                	addi	sp,sp,64
    80201138:	8082                	ret
                return 0;
    8020113a:	4501                	li	a0,0
    8020113c:	b7ed                	j	80201126 <walk+0x92>

000000008020113e <walkaddr>:
uint64
walkaddr(pagetable_t pagetable, uint64 va) {
    pte_t *pte;
    uint64 pa;

    if (va >= MAXVA)
    8020113e:	57fd                	li	a5,-1
    80201140:	83e9                	srli	a5,a5,0x1a
    80201142:	00b7f463          	bgeu	a5,a1,8020114a <walkaddr+0xc>
        return 0;
    80201146:	4501                	li	a0,0
    if ((*pte & PTE_U) == 0){
        return 0;
    }
    pa = PTE2PA(*pte);
    return pa;
}
    80201148:	8082                	ret
walkaddr(pagetable_t pagetable, uint64 va) {
    8020114a:	1141                	addi	sp,sp,-16
    8020114c:	e406                	sd	ra,8(sp)
    8020114e:	e022                	sd	s0,0(sp)
    80201150:	0800                	addi	s0,sp,16
    pte = walk(pagetable, va, 0);
    80201152:	4601                	li	a2,0
    80201154:	00000097          	auipc	ra,0x0
    80201158:	f40080e7          	jalr	-192(ra) # 80201094 <walk>
    if (pte == 0){
    8020115c:	c105                	beqz	a0,8020117c <walkaddr+0x3e>
    if ((*pte & PTE_V) == 0){
    8020115e:	611c                	ld	a5,0(a0)
    if ((*pte & PTE_U) == 0){
    80201160:	0117f693          	andi	a3,a5,17
    80201164:	4745                	li	a4,17
        return 0;
    80201166:	4501                	li	a0,0
    if ((*pte & PTE_U) == 0){
    80201168:	00e68663          	beq	a3,a4,80201174 <walkaddr+0x36>
}
    8020116c:	60a2                	ld	ra,8(sp)
    8020116e:	6402                	ld	s0,0(sp)
    80201170:	0141                	addi	sp,sp,16
    80201172:	8082                	ret
    pa = PTE2PA(*pte);
    80201174:	00a7d513          	srli	a0,a5,0xa
    80201178:	0532                	slli	a0,a0,0xc
    return pa;
    8020117a:	bfcd                	j	8020116c <walkaddr+0x2e>
        return 0;
    8020117c:	4501                	li	a0,0
    8020117e:	b7fd                	j	8020116c <walkaddr+0x2e>

0000000080201180 <useraddr>:

// Look up a virtual address, return the physical address,
uint64 useraddr(pagetable_t pagetable, uint64 va) {
    80201180:	1101                	addi	sp,sp,-32
    80201182:	ec06                	sd	ra,24(sp)
    80201184:	e822                	sd	s0,16(sp)
    80201186:	e426                	sd	s1,8(sp)
    80201188:	1000                	addi	s0,sp,32
    8020118a:	84ae                	mv	s1,a1
    return walkaddr(pagetable, va) | (va & 0xFFFULL);
    8020118c:	00000097          	auipc	ra,0x0
    80201190:	fb2080e7          	jalr	-78(ra) # 8020113e <walkaddr>
    80201194:	14d2                	slli	s1,s1,0x34
    80201196:	90d1                	srli	s1,s1,0x34
}
    80201198:	8d45                	or	a0,a0,s1
    8020119a:	60e2                	ld	ra,24(sp)
    8020119c:	6442                	ld	s0,16(sp)
    8020119e:	64a2                	ld	s1,8(sp)
    802011a0:	6105                	addi	sp,sp,32
    802011a2:	8082                	ret

00000000802011a4 <mappages>:

// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm) {
    802011a4:	715d                	addi	sp,sp,-80
    802011a6:	e486                	sd	ra,72(sp)
    802011a8:	e0a2                	sd	s0,64(sp)
    802011aa:	fc26                	sd	s1,56(sp)
    802011ac:	f84a                	sd	s2,48(sp)
    802011ae:	f44e                	sd	s3,40(sp)
    802011b0:	f052                	sd	s4,32(sp)
    802011b2:	ec56                	sd	s5,24(sp)
    802011b4:	e85a                	sd	s6,16(sp)
    802011b6:	e45e                	sd	s7,8(sp)
    802011b8:	0880                	addi	s0,sp,80
    802011ba:	8aaa                	mv	s5,a0
    802011bc:	8b3a                	mv	s6,a4
    uint64 a, last;
    pte_t *pte;

    a = PGROUNDDOWN(va);
    802011be:	777d                	lui	a4,0xfffff
    802011c0:	00e5f7b3          	and	a5,a1,a4
    last = PGROUNDDOWN(va + size - 1);
    802011c4:	167d                	addi	a2,a2,-1
    802011c6:	00b609b3          	add	s3,a2,a1
    802011ca:	00e9f9b3          	and	s3,s3,a4
    a = PGROUNDDOWN(va);
    802011ce:	893e                	mv	s2,a5
    802011d0:	40f68a33          	sub	s4,a3,a5
        if (*pte & PTE_V)
            return -1;
        *pte = PA2PTE(pa) | perm | PTE_V;
        if (a == last)
            break;
        a += PGSIZE;
    802011d4:	6b85                	lui	s7,0x1
    802011d6:	a011                	j	802011da <mappages+0x36>
    802011d8:	995e                	add	s2,s2,s7
    for (;;) {
    802011da:	012a04b3          	add	s1,s4,s2
        if ((pte = walk(pagetable, a, 1)) == 0)
    802011de:	4605                	li	a2,1
    802011e0:	85ca                	mv	a1,s2
    802011e2:	8556                	mv	a0,s5
    802011e4:	00000097          	auipc	ra,0x0
    802011e8:	eb0080e7          	jalr	-336(ra) # 80201094 <walk>
    802011ec:	cd19                	beqz	a0,8020120a <mappages+0x66>
        if (*pte & PTE_V)
    802011ee:	611c                	ld	a5,0(a0)
    802011f0:	8b85                	andi	a5,a5,1
    802011f2:	eb85                	bnez	a5,80201222 <mappages+0x7e>
        *pte = PA2PTE(pa) | perm | PTE_V;
    802011f4:	80b1                	srli	s1,s1,0xc
    802011f6:	04aa                	slli	s1,s1,0xa
    802011f8:	0164e4b3          	or	s1,s1,s6
    802011fc:	0014e493          	ori	s1,s1,1
    80201200:	e104                	sd	s1,0(a0)
        if (a == last)
    80201202:	fd391be3          	bne	s2,s3,802011d8 <mappages+0x34>
        pa += PGSIZE;
    }
    return 0;
    80201206:	4501                	li	a0,0
    80201208:	a011                	j	8020120c <mappages+0x68>
            return -1;
    8020120a:	557d                	li	a0,-1
}
    8020120c:	60a6                	ld	ra,72(sp)
    8020120e:	6406                	ld	s0,64(sp)
    80201210:	74e2                	ld	s1,56(sp)
    80201212:	7942                	ld	s2,48(sp)
    80201214:	79a2                	ld	s3,40(sp)
    80201216:	7a02                	ld	s4,32(sp)
    80201218:	6ae2                	ld	s5,24(sp)
    8020121a:	6b42                	ld	s6,16(sp)
    8020121c:	6ba2                	ld	s7,8(sp)
    8020121e:	6161                	addi	sp,sp,80
    80201220:	8082                	ret
            return -1;
    80201222:	557d                	li	a0,-1
    80201224:	b7e5                	j	8020120c <mappages+0x68>

0000000080201226 <kvmmap>:
void kvmmap(pagetable_t kpgtbl, uint64 va, uint64 pa, uint64 sz, int perm) {
    80201226:	1141                	addi	sp,sp,-16
    80201228:	e406                	sd	ra,8(sp)
    8020122a:	e022                	sd	s0,0(sp)
    8020122c:	0800                	addi	s0,sp,16
    8020122e:	87b6                	mv	a5,a3
    if (mappages(kpgtbl, va, sz, pa, perm) != 0)
    80201230:	86b2                	mv	a3,a2
    80201232:	863e                	mv	a2,a5
    80201234:	00000097          	auipc	ra,0x0
    80201238:	f70080e7          	jalr	-144(ra) # 802011a4 <mappages>
    8020123c:	e509                	bnez	a0,80201246 <kvmmap+0x20>
}
    8020123e:	60a2                	ld	ra,8(sp)
    80201240:	6402                	ld	s0,0(sp)
    80201242:	0141                	addi	sp,sp,16
    80201244:	8082                	ret
        panic("kvmmap");
    80201246:	00003517          	auipc	a0,0x3
    8020124a:	17a50513          	addi	a0,a0,378 # 802043c0 <e_text+0x3c0>
    8020124e:	fffff097          	auipc	ra,0xfffff
    80201252:	e30080e7          	jalr	-464(ra) # 8020007e <panic>
}
    80201256:	b7e5                	j	8020123e <kvmmap+0x18>

0000000080201258 <kvmmake>:
pagetable_t kvmmake(void) {
    80201258:	1101                	addi	sp,sp,-32
    8020125a:	ec06                	sd	ra,24(sp)
    8020125c:	e822                	sd	s0,16(sp)
    8020125e:	e426                	sd	s1,8(sp)
    80201260:	e04a                	sd	s2,0(sp)
    80201262:	1000                	addi	s0,sp,32
    kpgtbl = (pagetable_t) kalloc();
    80201264:	00001097          	auipc	ra,0x1
    80201268:	b04080e7          	jalr	-1276(ra) # 80201d68 <kalloc>
    8020126c:	84aa                	mv	s1,a0
    memset(kpgtbl, 0, PGSIZE);
    8020126e:	6605                	lui	a2,0x1
    80201270:	4581                	li	a1,0
    80201272:	fffff097          	auipc	ra,0xfffff
    80201276:	5e2080e7          	jalr	1506(ra) # 80200854 <memset>
    kvmmap(kpgtbl, KERNBASE, KERNBASE, (uint64) e_text - KERNBASE, PTE_R | PTE_X);
    8020127a:	00003917          	auipc	s2,0x3
    8020127e:	d8690913          	addi	s2,s2,-634 # 80204000 <e_text>
    80201282:	4729                	li	a4,10
    80201284:	bff00693          	li	a3,-1025
    80201288:	06d6                	slli	a3,a3,0x15
    8020128a:	96ca                	add	a3,a3,s2
    8020128c:	40100613          	li	a2,1025
    80201290:	0656                	slli	a2,a2,0x15
    80201292:	85b2                	mv	a1,a2
    80201294:	8526                	mv	a0,s1
    80201296:	00000097          	auipc	ra,0x0
    8020129a:	f90080e7          	jalr	-112(ra) # 80201226 <kvmmap>
    kvmmap(kpgtbl, (uint64) e_text, (uint64) e_text, PHYSTOP - (uint64) e_text, PTE_R | PTE_W);
    8020129e:	4719                	li	a4,6
    802012a0:	46c5                	li	a3,17
    802012a2:	06ee                	slli	a3,a3,0x1b
    802012a4:	412686b3          	sub	a3,a3,s2
    802012a8:	864a                	mv	a2,s2
    802012aa:	85ca                	mv	a1,s2
    802012ac:	8526                	mv	a0,s1
    802012ae:	00000097          	auipc	ra,0x0
    802012b2:	f78080e7          	jalr	-136(ra) # 80201226 <kvmmap>
    kvmmap(kpgtbl, TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    802012b6:	4729                	li	a4,10
    802012b8:	6685                	lui	a3,0x1
    802012ba:	00002617          	auipc	a2,0x2
    802012be:	d4660613          	addi	a2,a2,-698 # 80203000 <trampoline>
    802012c2:	040005b7          	lui	a1,0x4000
    802012c6:	15fd                	addi	a1,a1,-1
    802012c8:	05b2                	slli	a1,a1,0xc
    802012ca:	8526                	mv	a0,s1
    802012cc:	00000097          	auipc	ra,0x0
    802012d0:	f5a080e7          	jalr	-166(ra) # 80201226 <kvmmap>
}
    802012d4:	8526                	mv	a0,s1
    802012d6:	60e2                	ld	ra,24(sp)
    802012d8:	6442                	ld	s0,16(sp)
    802012da:	64a2                	ld	s1,8(sp)
    802012dc:	6902                	ld	s2,0(sp)
    802012de:	6105                	addi	sp,sp,32
    802012e0:	8082                	ret

00000000802012e2 <kvminit>:
void kvminit(void) {
    802012e2:	1141                	addi	sp,sp,-16
    802012e4:	e406                	sd	ra,8(sp)
    802012e6:	e022                	sd	s0,0(sp)
    802012e8:	0800                	addi	s0,sp,16
    kernel_pagetable = kvmmake();
    802012ea:	00000097          	auipc	ra,0x0
    802012ee:	f6e080e7          	jalr	-146(ra) # 80201258 <kvmmake>
    802012f2:	00124797          	auipc	a5,0x124
    802012f6:	dca7bb23          	sd	a0,-554(a5) # 803250c8 <kernel_pagetable>
    w_satp(MAKE_SATP(kernel_pagetable));
    802012fa:	8131                	srli	a0,a0,0xc
    802012fc:	57fd                	li	a5,-1
    802012fe:	17fe                	slli	a5,a5,0x3f
    80201300:	8d5d                	or	a0,a0,a5
    asm volatile("csrw satp, %0"
    80201302:	18051073          	csrw	satp,a0
}

// flush the TLB.
static inline void sfence_vma() {
    // the zero, zero means flush all TLB entries.
    asm volatile("sfence.vma zero, zero");
    80201306:	12000073          	sfence.vma
    asm volatile("csrr %0, satp"
    8020130a:	180025f3          	csrr	a1,satp
    printf("enable pageing at %p\n", r_satp());
    8020130e:	00003517          	auipc	a0,0x3
    80201312:	0ba50513          	addi	a0,a0,186 # 802043c8 <e_text+0x3c8>
    80201316:	00000097          	auipc	ra,0x0
    8020131a:	704080e7          	jalr	1796(ra) # 80201a1a <printf>
}
    8020131e:	60a2                	ld	ra,8(sp)
    80201320:	6402                	ld	s0,0(sp)
    80201322:	0141                	addi	sp,sp,16
    80201324:	8082                	ret

0000000080201326 <uvmunmap>:

// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void uvmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free) {
    80201326:	711d                	addi	sp,sp,-96
    80201328:	ec86                	sd	ra,88(sp)
    8020132a:	e8a2                	sd	s0,80(sp)
    8020132c:	e4a6                	sd	s1,72(sp)
    8020132e:	e0ca                	sd	s2,64(sp)
    80201330:	fc4e                	sd	s3,56(sp)
    80201332:	f852                	sd	s4,48(sp)
    80201334:	f456                	sd	s5,40(sp)
    80201336:	f05a                	sd	s6,32(sp)
    80201338:	ec5e                	sd	s7,24(sp)
    8020133a:	e862                	sd	s8,16(sp)
    8020133c:	e466                	sd	s9,8(sp)
    8020133e:	e06a                	sd	s10,0(sp)
    80201340:	1080                	addi	s0,sp,96
    80201342:	8a2a                	mv	s4,a0
    80201344:	892e                	mv	s2,a1
    80201346:	89b2                	mv	s3,a2
    80201348:	8ab6                	mv	s5,a3
    uint64 a;
    pte_t *pte;

    if ((va % PGSIZE) != 0)
    8020134a:	03459793          	slli	a5,a1,0x34
    8020134e:	e785                	bnez	a5,80201376 <uvmunmap+0x50>
        panic("uvmunmap: not aligned");

    for (a = va; a < va + npages * PGSIZE; a += PGSIZE) {
    80201350:	09b2                	slli	s3,s3,0xc
    80201352:	99ca                	add	s3,s3,s2
    80201354:	09397c63          	bgeu	s2,s3,802013ec <uvmunmap+0xc6>
        if ((pte = walk(pagetable, a, 0)) == 0)
            panic("uvmunmap: walk");
    80201358:	00003d17          	auipc	s10,0x3
    8020135c:	0a0d0d13          	addi	s10,s10,160 # 802043f8 <e_text+0x3f8>
        if ((*pte & PTE_V) == 0)
            panic("uvmunmap: not mapped");
    80201360:	00003c17          	auipc	s8,0x3
    80201364:	0a8c0c13          	addi	s8,s8,168 # 80204408 <e_text+0x408>
        if (PTE_FLAGS(*pte) == PTE_V)
    80201368:	4b85                	li	s7,1
            panic("uvmunmap: not a leaf");
    8020136a:	00003c97          	auipc	s9,0x3
    8020136e:	0b6c8c93          	addi	s9,s9,182 # 80204420 <e_text+0x420>
    for (a = va; a < va + npages * PGSIZE; a += PGSIZE) {
    80201372:	6b05                	lui	s6,0x1
    80201374:	a825                	j	802013ac <uvmunmap+0x86>
        panic("uvmunmap: not aligned");
    80201376:	00003517          	auipc	a0,0x3
    8020137a:	06a50513          	addi	a0,a0,106 # 802043e0 <e_text+0x3e0>
    8020137e:	fffff097          	auipc	ra,0xfffff
    80201382:	d00080e7          	jalr	-768(ra) # 8020007e <panic>
    80201386:	b7e9                	j	80201350 <uvmunmap+0x2a>
            panic("uvmunmap: walk");
    80201388:	856a                	mv	a0,s10
    8020138a:	fffff097          	auipc	ra,0xfffff
    8020138e:	cf4080e7          	jalr	-780(ra) # 8020007e <panic>
    80201392:	a035                	j	802013be <uvmunmap+0x98>
        if (PTE_FLAGS(*pte) == PTE_V)
    80201394:	609c                	ld	a5,0(s1)
    80201396:	3ff7f793          	andi	a5,a5,1023
    8020139a:	03778b63          	beq	a5,s7,802013d0 <uvmunmap+0xaa>
        if (do_free) {
    8020139e:	020a9f63          	bnez	s5,802013dc <uvmunmap+0xb6>
            uint64 pa = PTE2PA(*pte);
            kfree((void *) pa);
        }
        *pte = 0;
    802013a2:	0004b023          	sd	zero,0(s1)
    for (a = va; a < va + npages * PGSIZE; a += PGSIZE) {
    802013a6:	995a                	add	s2,s2,s6
    802013a8:	05397263          	bgeu	s2,s3,802013ec <uvmunmap+0xc6>
        if ((pte = walk(pagetable, a, 0)) == 0)
    802013ac:	4601                	li	a2,0
    802013ae:	85ca                	mv	a1,s2
    802013b0:	8552                	mv	a0,s4
    802013b2:	00000097          	auipc	ra,0x0
    802013b6:	ce2080e7          	jalr	-798(ra) # 80201094 <walk>
    802013ba:	84aa                	mv	s1,a0
    802013bc:	d571                	beqz	a0,80201388 <uvmunmap+0x62>
        if ((*pte & PTE_V) == 0)
    802013be:	609c                	ld	a5,0(s1)
    802013c0:	8b85                	andi	a5,a5,1
    802013c2:	fbe9                	bnez	a5,80201394 <uvmunmap+0x6e>
            panic("uvmunmap: not mapped");
    802013c4:	8562                	mv	a0,s8
    802013c6:	fffff097          	auipc	ra,0xfffff
    802013ca:	cb8080e7          	jalr	-840(ra) # 8020007e <panic>
    802013ce:	b7d9                	j	80201394 <uvmunmap+0x6e>
            panic("uvmunmap: not a leaf");
    802013d0:	8566                	mv	a0,s9
    802013d2:	fffff097          	auipc	ra,0xfffff
    802013d6:	cac080e7          	jalr	-852(ra) # 8020007e <panic>
    802013da:	b7d1                	j	8020139e <uvmunmap+0x78>
            uint64 pa = PTE2PA(*pte);
    802013dc:	6088                	ld	a0,0(s1)
    802013de:	8129                	srli	a0,a0,0xa
            kfree((void *) pa);
    802013e0:	0532                	slli	a0,a0,0xc
    802013e2:	00001097          	auipc	ra,0x1
    802013e6:	858080e7          	jalr	-1960(ra) # 80201c3a <kfree>
    802013ea:	bf65                	j	802013a2 <uvmunmap+0x7c>
    }
}
    802013ec:	60e6                	ld	ra,88(sp)
    802013ee:	6446                	ld	s0,80(sp)
    802013f0:	64a6                	ld	s1,72(sp)
    802013f2:	6906                	ld	s2,64(sp)
    802013f4:	79e2                	ld	s3,56(sp)
    802013f6:	7a42                	ld	s4,48(sp)
    802013f8:	7aa2                	ld	s5,40(sp)
    802013fa:	7b02                	ld	s6,32(sp)
    802013fc:	6be2                	ld	s7,24(sp)
    802013fe:	6c42                	ld	s8,16(sp)
    80201400:	6ca2                	ld	s9,8(sp)
    80201402:	6d02                	ld	s10,0(sp)
    80201404:	6125                	addi	sp,sp,96
    80201406:	8082                	ret

0000000080201408 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate() {
    80201408:	1101                	addi	sp,sp,-32
    8020140a:	ec06                	sd	ra,24(sp)
    8020140c:	e822                	sd	s0,16(sp)
    8020140e:	e426                	sd	s1,8(sp)
    80201410:	1000                	addi	s0,sp,32
    pagetable_t pagetable;
    pagetable = (pagetable_t) kalloc();
    80201412:	00001097          	auipc	ra,0x1
    80201416:	956080e7          	jalr	-1706(ra) # 80201d68 <kalloc>
    8020141a:	84aa                	mv	s1,a0
    if (pagetable == 0)
    8020141c:	c519                	beqz	a0,8020142a <uvmcreate+0x22>
        return 0;
    memset(pagetable, 0, PGSIZE);
    8020141e:	6605                	lui	a2,0x1
    80201420:	4581                	li	a1,0
    80201422:	fffff097          	auipc	ra,0xfffff
    80201426:	432080e7          	jalr	1074(ra) # 80200854 <memset>
    //             (uint64)trampoline, PTE_R | PTE_X) < 0){
    //     uvmfree(pagetable, 0);
    //     return 0;
    // }
    return pagetable;
}
    8020142a:	8526                	mv	a0,s1
    8020142c:	60e2                	ld	ra,24(sp)
    8020142e:	6442                	ld	s0,16(sp)
    80201430:	64a2                	ld	s1,8(sp)
    80201432:	6105                	addi	sp,sp,32
    80201434:	8082                	ret

0000000080201436 <uvmdealloc>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz) {
    80201436:	1101                	addi	sp,sp,-32
    80201438:	ec06                	sd	ra,24(sp)
    8020143a:	e822                	sd	s0,16(sp)
    8020143c:	e426                	sd	s1,8(sp)
    8020143e:	1000                	addi	s0,sp,32
    if (newsz >= oldsz)
        return oldsz;
    80201440:	84ae                	mv	s1,a1
    if (newsz >= oldsz)
    80201442:	00b67d63          	bgeu	a2,a1,8020145c <uvmdealloc+0x26>
    80201446:	84b2                	mv	s1,a2

    if (PGROUNDUP(newsz) < PGROUNDUP(oldsz)) {
    80201448:	6785                	lui	a5,0x1
    8020144a:	17fd                	addi	a5,a5,-1
    8020144c:	00f60733          	add	a4,a2,a5
    80201450:	767d                	lui	a2,0xfffff
    80201452:	8f71                	and	a4,a4,a2
    80201454:	97ae                	add	a5,a5,a1
    80201456:	8ff1                	and	a5,a5,a2
    80201458:	00f76863          	bltu	a4,a5,80201468 <uvmdealloc+0x32>
        int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
        uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    }

    return newsz;
}
    8020145c:	8526                	mv	a0,s1
    8020145e:	60e2                	ld	ra,24(sp)
    80201460:	6442                	ld	s0,16(sp)
    80201462:	64a2                	ld	s1,8(sp)
    80201464:	6105                	addi	sp,sp,32
    80201466:	8082                	ret
        int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    80201468:	8f99                	sub	a5,a5,a4
    8020146a:	83b1                	srli	a5,a5,0xc
        uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    8020146c:	4685                	li	a3,1
    8020146e:	0007861b          	sext.w	a2,a5
    80201472:	85ba                	mv	a1,a4
    80201474:	00000097          	auipc	ra,0x0
    80201478:	eb2080e7          	jalr	-334(ra) # 80201326 <uvmunmap>
    8020147c:	b7c5                	j	8020145c <uvmdealloc+0x26>

000000008020147e <uvmalloc>:
    if (newsz < oldsz)
    8020147e:	0ab66163          	bltu	a2,a1,80201520 <uvmalloc+0xa2>
uvmalloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz) {
    80201482:	7139                	addi	sp,sp,-64
    80201484:	fc06                	sd	ra,56(sp)
    80201486:	f822                	sd	s0,48(sp)
    80201488:	f426                	sd	s1,40(sp)
    8020148a:	f04a                	sd	s2,32(sp)
    8020148c:	ec4e                	sd	s3,24(sp)
    8020148e:	e852                	sd	s4,16(sp)
    80201490:	e456                	sd	s5,8(sp)
    80201492:	0080                	addi	s0,sp,64
    80201494:	8aaa                	mv	s5,a0
    80201496:	8a32                	mv	s4,a2
    oldsz = PGROUNDUP(oldsz);
    80201498:	6985                	lui	s3,0x1
    8020149a:	19fd                	addi	s3,s3,-1
    8020149c:	95ce                	add	a1,a1,s3
    8020149e:	79fd                	lui	s3,0xfffff
    802014a0:	0135f9b3          	and	s3,a1,s3
    for (a = oldsz; a < newsz; a += PGSIZE) {
    802014a4:	08c9f063          	bgeu	s3,a2,80201524 <uvmalloc+0xa6>
    802014a8:	894e                	mv	s2,s3
        mem = kalloc();
    802014aa:	00001097          	auipc	ra,0x1
    802014ae:	8be080e7          	jalr	-1858(ra) # 80201d68 <kalloc>
    802014b2:	84aa                	mv	s1,a0
        if (mem == 0) {
    802014b4:	c51d                	beqz	a0,802014e2 <uvmalloc+0x64>
        memset(mem, 0, PGSIZE);
    802014b6:	6605                	lui	a2,0x1
    802014b8:	4581                	li	a1,0
    802014ba:	fffff097          	auipc	ra,0xfffff
    802014be:	39a080e7          	jalr	922(ra) # 80200854 <memset>
        if (mappages(pagetable, a, PGSIZE, (uint64) mem, PTE_W | PTE_X | PTE_R | PTE_U) != 0) {
    802014c2:	4779                	li	a4,30
    802014c4:	86a6                	mv	a3,s1
    802014c6:	6605                	lui	a2,0x1
    802014c8:	85ca                	mv	a1,s2
    802014ca:	8556                	mv	a0,s5
    802014cc:	00000097          	auipc	ra,0x0
    802014d0:	cd8080e7          	jalr	-808(ra) # 802011a4 <mappages>
    802014d4:	e905                	bnez	a0,80201504 <uvmalloc+0x86>
    for (a = oldsz; a < newsz; a += PGSIZE) {
    802014d6:	6785                	lui	a5,0x1
    802014d8:	993e                	add	s2,s2,a5
    802014da:	fd4968e3          	bltu	s2,s4,802014aa <uvmalloc+0x2c>
    return newsz;
    802014de:	8552                	mv	a0,s4
    802014e0:	a809                	j	802014f2 <uvmalloc+0x74>
            uvmdealloc(pagetable, a, oldsz);
    802014e2:	864e                	mv	a2,s3
    802014e4:	85ca                	mv	a1,s2
    802014e6:	8556                	mv	a0,s5
    802014e8:	00000097          	auipc	ra,0x0
    802014ec:	f4e080e7          	jalr	-178(ra) # 80201436 <uvmdealloc>
            return 0;
    802014f0:	4501                	li	a0,0
}
    802014f2:	70e2                	ld	ra,56(sp)
    802014f4:	7442                	ld	s0,48(sp)
    802014f6:	74a2                	ld	s1,40(sp)
    802014f8:	7902                	ld	s2,32(sp)
    802014fa:	69e2                	ld	s3,24(sp)
    802014fc:	6a42                	ld	s4,16(sp)
    802014fe:	6aa2                	ld	s5,8(sp)
    80201500:	6121                	addi	sp,sp,64
    80201502:	8082                	ret
            kfree(mem);
    80201504:	8526                	mv	a0,s1
    80201506:	00000097          	auipc	ra,0x0
    8020150a:	734080e7          	jalr	1844(ra) # 80201c3a <kfree>
            uvmdealloc(pagetable, a, oldsz);
    8020150e:	864e                	mv	a2,s3
    80201510:	85ca                	mv	a1,s2
    80201512:	8556                	mv	a0,s5
    80201514:	00000097          	auipc	ra,0x0
    80201518:	f22080e7          	jalr	-222(ra) # 80201436 <uvmdealloc>
            return 0;
    8020151c:	4501                	li	a0,0
    8020151e:	bfd1                	j	802014f2 <uvmalloc+0x74>
        return oldsz;
    80201520:	852e                	mv	a0,a1
}
    80201522:	8082                	ret
    return newsz;
    80201524:	8532                	mv	a0,a2
    80201526:	b7f1                	j	802014f2 <uvmalloc+0x74>

0000000080201528 <debugwalk>:

void debugwalk(pagetable_t pagetable, int depth) {
    80201528:	7159                	addi	sp,sp,-112
    8020152a:	f486                	sd	ra,104(sp)
    8020152c:	f0a2                	sd	s0,96(sp)
    8020152e:	eca6                	sd	s1,88(sp)
    80201530:	e8ca                	sd	s2,80(sp)
    80201532:	e4ce                	sd	s3,72(sp)
    80201534:	e0d2                	sd	s4,64(sp)
    80201536:	fc56                	sd	s5,56(sp)
    80201538:	f85a                	sd	s6,48(sp)
    8020153a:	f45e                	sd	s7,40(sp)
    8020153c:	f062                	sd	s8,32(sp)
    8020153e:	ec66                	sd	s9,24(sp)
    80201540:	e86a                	sd	s10,16(sp)
    80201542:	e46e                	sd	s11,8(sp)
    80201544:	1880                	addi	s0,sp,112
    80201546:	8bae                	mv	s7,a1
    // there are 2^9 = 512 PTEs in a page table.
    for (int i = 0; i < 512; i++) {
    80201548:	89aa                	mv	s3,a0
    8020154a:	4901                	li	s2,0
        pte_t pte = pagetable[i];
        if(pte != 0)
            info("{%d} pg[%d] = %p\n", depth, i, pte);
    8020154c:	00005a97          	auipc	s5,0x5
    80201550:	cc4a8a93          	addi	s5,s5,-828 # 80206210 <debug_level>
    80201554:	4a05                	li	s4,1
        if ((pte & PTE_V) && (pte & (PTE_R | PTE_W | PTE_X)) == 0) {
            // this PTE points to a lower-level page table.
            uint64 child = PTE2PA(pte);
            debugwalk((pagetable_t) child, depth + 1);
    80201556:	00158b1b          	addiw	s6,a1,1
            info("{%d} pg[%d] = %p\n", depth, i, pte);
    8020155a:	00124d97          	auipc	s11,0x124
    8020155e:	b7ed8d93          	addi	s11,s11,-1154 # 803250d8 <curr_pid>
    80201562:	00004d17          	auipc	s10,0x4
    80201566:	a9ed0d13          	addi	s10,s10,-1378 # 80205000 <LEVEL>
    8020156a:	00004c97          	auipc	s9,0x4
    8020156e:	ab6c8c93          	addi	s9,s9,-1354 # 80205020 <COLOR>
    80201572:	00003c17          	auipc	s8,0x3
    80201576:	ec6c0c13          	addi	s8,s8,-314 # 80204438 <e_text+0x438>
    8020157a:	a035                	j	802015a6 <debugwalk+0x7e>
    8020157c:	8826                	mv	a6,s1
    8020157e:	87ca                	mv	a5,s2
    80201580:	875e                	mv	a4,s7
    80201582:	000da683          	lw	a3,0(s11)
    80201586:	008d3603          	ld	a2,8(s10)
    8020158a:	004ca583          	lw	a1,4(s9)
    8020158e:	8562                	mv	a0,s8
    80201590:	00000097          	auipc	ra,0x0
    80201594:	48a080e7          	jalr	1162(ra) # 80201a1a <printf>
    80201598:	a831                	j	802015b4 <debugwalk+0x8c>
    for (int i = 0; i < 512; i++) {
    8020159a:	2905                	addiw	s2,s2,1
    8020159c:	09a1                	addi	s3,s3,8
    8020159e:	20000793          	li	a5,512
    802015a2:	02f90663          	beq	s2,a5,802015ce <debugwalk+0xa6>
        pte_t pte = pagetable[i];
    802015a6:	0009b483          	ld	s1,0(s3) # fffffffffffff000 <e_bss+0xffffffff7fcd9000>
        if(pte != 0)
    802015aa:	d8e5                	beqz	s1,8020159a <debugwalk+0x72>
            info("{%d} pg[%d] = %p\n", depth, i, pte);
    802015ac:	000aa783          	lw	a5,0(s5)
    802015b0:	fcfa56e3          	bge	s4,a5,8020157c <debugwalk+0x54>
        if ((pte & PTE_V) && (pte & (PTE_R | PTE_W | PTE_X)) == 0) {
    802015b4:	00f4f793          	andi	a5,s1,15
    802015b8:	ff4791e3          	bne	a5,s4,8020159a <debugwalk+0x72>
            uint64 child = PTE2PA(pte);
    802015bc:	00a4d513          	srli	a0,s1,0xa
            debugwalk((pagetable_t) child, depth + 1);
    802015c0:	85da                	mv	a1,s6
    802015c2:	0532                	slli	a0,a0,0xc
    802015c4:	00000097          	auipc	ra,0x0
    802015c8:	f64080e7          	jalr	-156(ra) # 80201528 <debugwalk>
    802015cc:	b7f9                	j	8020159a <debugwalk+0x72>
        }
    }
}
    802015ce:	70a6                	ld	ra,104(sp)
    802015d0:	7406                	ld	s0,96(sp)
    802015d2:	64e6                	ld	s1,88(sp)
    802015d4:	6946                	ld	s2,80(sp)
    802015d6:	69a6                	ld	s3,72(sp)
    802015d8:	6a06                	ld	s4,64(sp)
    802015da:	7ae2                	ld	s5,56(sp)
    802015dc:	7b42                	ld	s6,48(sp)
    802015de:	7ba2                	ld	s7,40(sp)
    802015e0:	7c02                	ld	s8,32(sp)
    802015e2:	6ce2                	ld	s9,24(sp)
    802015e4:	6d42                	ld	s10,16(sp)
    802015e6:	6da2                	ld	s11,8(sp)
    802015e8:	6165                	addi	sp,sp,112
    802015ea:	8082                	ret

00000000802015ec <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void freewalk(pagetable_t pagetable) {
    802015ec:	7139                	addi	sp,sp,-64
    802015ee:	fc06                	sd	ra,56(sp)
    802015f0:	f822                	sd	s0,48(sp)
    802015f2:	f426                	sd	s1,40(sp)
    802015f4:	f04a                	sd	s2,32(sp)
    802015f6:	ec4e                	sd	s3,24(sp)
    802015f8:	e852                	sd	s4,16(sp)
    802015fa:	e456                	sd	s5,8(sp)
    802015fc:	0080                	addi	s0,sp,64
    802015fe:	8aaa                	mv	s5,a0
    // there are 2^9 = 512 PTEs in a page table.
    for (int i = 0; i < 512; i++) {
    80201600:	84aa                	mv	s1,a0
    80201602:	6905                	lui	s2,0x1
    80201604:	992a                	add	s2,s2,a0
        pte_t pte = pagetable[i];
        if ((pte & PTE_V) && (pte & (PTE_R | PTE_W | PTE_X)) == 0) {
    80201606:	4985                	li	s3,1
            // this PTE points to a lower-level page table.
            uint64 child = PTE2PA(pte);
            freewalk((pagetable_t) child);
            pagetable[i] = 0;
        } else if (pte & PTE_V) {
            panic("freewalk: leaf");
    80201608:	00003a17          	auipc	s4,0x3
    8020160c:	e58a0a13          	addi	s4,s4,-424 # 80204460 <e_text+0x460>
    80201610:	a821                	j	80201628 <freewalk+0x3c>
            uint64 child = PTE2PA(pte);
    80201612:	8129                	srli	a0,a0,0xa
            freewalk((pagetable_t) child);
    80201614:	0532                	slli	a0,a0,0xc
    80201616:	00000097          	auipc	ra,0x0
    8020161a:	fd6080e7          	jalr	-42(ra) # 802015ec <freewalk>
            pagetable[i] = 0;
    8020161e:	0004b023          	sd	zero,0(s1)
    for (int i = 0; i < 512; i++) {
    80201622:	04a1                	addi	s1,s1,8
    80201624:	01248f63          	beq	s1,s2,80201642 <freewalk+0x56>
        pte_t pte = pagetable[i];
    80201628:	6088                	ld	a0,0(s1)
        if ((pte & PTE_V) && (pte & (PTE_R | PTE_W | PTE_X)) == 0) {
    8020162a:	00f57793          	andi	a5,a0,15
    8020162e:	ff3782e3          	beq	a5,s3,80201612 <freewalk+0x26>
        } else if (pte & PTE_V) {
    80201632:	8905                	andi	a0,a0,1
    80201634:	d57d                	beqz	a0,80201622 <freewalk+0x36>
            panic("freewalk: leaf");
    80201636:	8552                	mv	a0,s4
    80201638:	fffff097          	auipc	ra,0xfffff
    8020163c:	a46080e7          	jalr	-1466(ra) # 8020007e <panic>
    80201640:	b7cd                	j	80201622 <freewalk+0x36>
        }
    }
    kfree((void *) pagetable);
    80201642:	8556                	mv	a0,s5
    80201644:	00000097          	auipc	ra,0x0
    80201648:	5f6080e7          	jalr	1526(ra) # 80201c3a <kfree>
}
    8020164c:	70e2                	ld	ra,56(sp)
    8020164e:	7442                	ld	s0,48(sp)
    80201650:	74a2                	ld	s1,40(sp)
    80201652:	7902                	ld	s2,32(sp)
    80201654:	69e2                	ld	s3,24(sp)
    80201656:	6a42                	ld	s4,16(sp)
    80201658:	6aa2                	ld	s5,8(sp)
    8020165a:	6121                	addi	sp,sp,64
    8020165c:	8082                	ret

000000008020165e <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void uvmfree(pagetable_t pagetable, uint64 sz) {
    8020165e:	1101                	addi	sp,sp,-32
    80201660:	ec06                	sd	ra,24(sp)
    80201662:	e822                	sd	s0,16(sp)
    80201664:	e426                	sd	s1,8(sp)
    80201666:	1000                	addi	s0,sp,32
    80201668:	84aa                	mv	s1,a0
    if (sz > 0)
    8020166a:	e999                	bnez	a1,80201680 <uvmfree+0x22>
        uvmunmap(pagetable, 0, PGROUNDUP(sz) / PGSIZE, 1);
    freewalk(pagetable);
    8020166c:	8526                	mv	a0,s1
    8020166e:	00000097          	auipc	ra,0x0
    80201672:	f7e080e7          	jalr	-130(ra) # 802015ec <freewalk>
}
    80201676:	60e2                	ld	ra,24(sp)
    80201678:	6442                	ld	s0,16(sp)
    8020167a:	64a2                	ld	s1,8(sp)
    8020167c:	6105                	addi	sp,sp,32
    8020167e:	8082                	ret
        uvmunmap(pagetable, 0, PGROUNDUP(sz) / PGSIZE, 1);
    80201680:	6605                	lui	a2,0x1
    80201682:	167d                	addi	a2,a2,-1
    80201684:	962e                	add	a2,a2,a1
    80201686:	4685                	li	a3,1
    80201688:	8231                	srli	a2,a2,0xc
    8020168a:	4581                	li	a1,0
    8020168c:	00000097          	auipc	ra,0x0
    80201690:	c9a080e7          	jalr	-870(ra) # 80201326 <uvmunmap>
    80201694:	bfe1                	j	8020166c <uvmfree+0xe>

0000000080201696 <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void uvmclear(pagetable_t pagetable, uint64 va) {
    80201696:	1101                	addi	sp,sp,-32
    80201698:	ec06                	sd	ra,24(sp)
    8020169a:	e822                	sd	s0,16(sp)
    8020169c:	e426                	sd	s1,8(sp)
    8020169e:	1000                	addi	s0,sp,32
    pte_t *pte;

    pte = walk(pagetable, va, 0);
    802016a0:	4601                	li	a2,0
    802016a2:	00000097          	auipc	ra,0x0
    802016a6:	9f2080e7          	jalr	-1550(ra) # 80201094 <walk>
    802016aa:	84aa                	mv	s1,a0
    if (pte == 0)
    802016ac:	c909                	beqz	a0,802016be <uvmclear+0x28>
        panic("uvmclear");
    *pte &= ~PTE_U;
    802016ae:	609c                	ld	a5,0(s1)
    802016b0:	9bbd                	andi	a5,a5,-17
    802016b2:	e09c                	sd	a5,0(s1)
}
    802016b4:	60e2                	ld	ra,24(sp)
    802016b6:	6442                	ld	s0,16(sp)
    802016b8:	64a2                	ld	s1,8(sp)
    802016ba:	6105                	addi	sp,sp,32
    802016bc:	8082                	ret
        panic("uvmclear");
    802016be:	00003517          	auipc	a0,0x3
    802016c2:	db250513          	addi	a0,a0,-590 # 80204470 <e_text+0x470>
    802016c6:	fffff097          	auipc	ra,0xfffff
    802016ca:	9b8080e7          	jalr	-1608(ra) # 8020007e <panic>
    802016ce:	b7c5                	j	802016ae <uvmclear+0x18>

00000000802016d0 <uvmcopy>:
    pte_t *pte;
    uint64 pa, i;
    uint flags;
    char *mem;

    for(i = 0; i < sz; i += PGSIZE){
    802016d0:	c265                	beqz	a2,802017b0 <uvmcopy+0xe0>
{
    802016d2:	711d                	addi	sp,sp,-96
    802016d4:	ec86                	sd	ra,88(sp)
    802016d6:	e8a2                	sd	s0,80(sp)
    802016d8:	e4a6                	sd	s1,72(sp)
    802016da:	e0ca                	sd	s2,64(sp)
    802016dc:	fc4e                	sd	s3,56(sp)
    802016de:	f852                	sd	s4,48(sp)
    802016e0:	f456                	sd	s5,40(sp)
    802016e2:	f05a                	sd	s6,32(sp)
    802016e4:	ec5e                	sd	s7,24(sp)
    802016e6:	e862                	sd	s8,16(sp)
    802016e8:	e466                	sd	s9,8(sp)
    802016ea:	1080                	addi	s0,sp,96
    802016ec:	8aaa                	mv	s5,a0
    802016ee:	8a2e                	mv	s4,a1
    802016f0:	89b2                	mv	s3,a2
    for(i = 0; i < sz; i += PGSIZE){
    802016f2:	4901                	li	s2,0
        if((pte = walk(old, i, 0)) == 0)
            panic("uvmcopy: pte should exist");
    802016f4:	00003b97          	auipc	s7,0x3
    802016f8:	d8cb8b93          	addi	s7,s7,-628 # 80204480 <e_text+0x480>
        if((*pte & PTE_V) == 0)
            panic("uvmcopy: page not present");
    802016fc:	00003b17          	auipc	s6,0x3
    80201700:	da4b0b13          	addi	s6,s6,-604 # 802044a0 <e_text+0x4a0>
    80201704:	a881                	j	80201754 <uvmcopy+0x84>
            panic("uvmcopy: pte should exist");
    80201706:	855e                	mv	a0,s7
    80201708:	fffff097          	auipc	ra,0xfffff
    8020170c:	976080e7          	jalr	-1674(ra) # 8020007e <panic>
    80201710:	a899                	j	80201766 <uvmcopy+0x96>
        pa = PTE2PA(*pte);
    80201712:	6098                	ld	a4,0(s1)
    80201714:	00a75593          	srli	a1,a4,0xa
    80201718:	00c59c93          	slli	s9,a1,0xc
        flags = PTE_FLAGS(*pte);
    8020171c:	3ff77c13          	andi	s8,a4,1023
        if((mem = kalloc()) == 0)
    80201720:	00000097          	auipc	ra,0x0
    80201724:	648080e7          	jalr	1608(ra) # 80201d68 <kalloc>
    80201728:	84aa                	mv	s1,a0
    8020172a:	cd21                	beqz	a0,80201782 <uvmcopy+0xb2>
            goto err;
        memmove(mem, (char*)pa, PGSIZE);
    8020172c:	6605                	lui	a2,0x1
    8020172e:	85e6                	mv	a1,s9
    80201730:	fffff097          	auipc	ra,0xfffff
    80201734:	180080e7          	jalr	384(ra) # 802008b0 <memmove>
        if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0){
    80201738:	8762                	mv	a4,s8
    8020173a:	86a6                	mv	a3,s1
    8020173c:	6605                	lui	a2,0x1
    8020173e:	85ca                	mv	a1,s2
    80201740:	8552                	mv	a0,s4
    80201742:	00000097          	auipc	ra,0x0
    80201746:	a62080e7          	jalr	-1438(ra) # 802011a4 <mappages>
    8020174a:	e51d                	bnez	a0,80201778 <uvmcopy+0xa8>
    for(i = 0; i < sz; i += PGSIZE){
    8020174c:	6785                	lui	a5,0x1
    8020174e:	993e                	add	s2,s2,a5
    80201750:	05397363          	bgeu	s2,s3,80201796 <uvmcopy+0xc6>
        if((pte = walk(old, i, 0)) == 0)
    80201754:	4601                	li	a2,0
    80201756:	85ca                	mv	a1,s2
    80201758:	8556                	mv	a0,s5
    8020175a:	00000097          	auipc	ra,0x0
    8020175e:	93a080e7          	jalr	-1734(ra) # 80201094 <walk>
    80201762:	84aa                	mv	s1,a0
    80201764:	d14d                	beqz	a0,80201706 <uvmcopy+0x36>
        if((*pte & PTE_V) == 0)
    80201766:	609c                	ld	a5,0(s1)
    80201768:	8b85                	andi	a5,a5,1
    8020176a:	f7c5                	bnez	a5,80201712 <uvmcopy+0x42>
            panic("uvmcopy: page not present");
    8020176c:	855a                	mv	a0,s6
    8020176e:	fffff097          	auipc	ra,0xfffff
    80201772:	910080e7          	jalr	-1776(ra) # 8020007e <panic>
    80201776:	bf71                	j	80201712 <uvmcopy+0x42>
            kfree(mem);
    80201778:	8526                	mv	a0,s1
    8020177a:	00000097          	auipc	ra,0x0
    8020177e:	4c0080e7          	jalr	1216(ra) # 80201c3a <kfree>
        }
    }
    return 0;

    err:
    uvmunmap(new, 0, i / PGSIZE, 1);
    80201782:	4685                	li	a3,1
    80201784:	00c95613          	srli	a2,s2,0xc
    80201788:	4581                	li	a1,0
    8020178a:	8552                	mv	a0,s4
    8020178c:	00000097          	auipc	ra,0x0
    80201790:	b9a080e7          	jalr	-1126(ra) # 80201326 <uvmunmap>
    return -1;
    80201794:	557d                	li	a0,-1
}
    80201796:	60e6                	ld	ra,88(sp)
    80201798:	6446                	ld	s0,80(sp)
    8020179a:	64a6                	ld	s1,72(sp)
    8020179c:	6906                	ld	s2,64(sp)
    8020179e:	79e2                	ld	s3,56(sp)
    802017a0:	7a42                	ld	s4,48(sp)
    802017a2:	7aa2                	ld	s5,40(sp)
    802017a4:	7b02                	ld	s6,32(sp)
    802017a6:	6be2                	ld	s7,24(sp)
    802017a8:	6c42                	ld	s8,16(sp)
    802017aa:	6ca2                	ld	s9,8(sp)
    802017ac:	6125                	addi	sp,sp,96
    802017ae:	8082                	ret
    return 0;
    802017b0:	4501                	li	a0,0
}
    802017b2:	8082                	ret

00000000802017b4 <copyout>:
// Copy len bytes from src to virtual address dstva in a given page table.
// Return 0 on success, -1 on error.
int copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len) {
    uint64 n, va0, pa0;

    while (len > 0) {
    802017b4:	c6bd                	beqz	a3,80201822 <copyout+0x6e>
int copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len) {
    802017b6:	715d                	addi	sp,sp,-80
    802017b8:	e486                	sd	ra,72(sp)
    802017ba:	e0a2                	sd	s0,64(sp)
    802017bc:	fc26                	sd	s1,56(sp)
    802017be:	f84a                	sd	s2,48(sp)
    802017c0:	f44e                	sd	s3,40(sp)
    802017c2:	f052                	sd	s4,32(sp)
    802017c4:	ec56                	sd	s5,24(sp)
    802017c6:	e85a                	sd	s6,16(sp)
    802017c8:	e45e                	sd	s7,8(sp)
    802017ca:	e062                	sd	s8,0(sp)
    802017cc:	0880                	addi	s0,sp,80
    802017ce:	8b2a                	mv	s6,a0
    802017d0:	8c2e                	mv	s8,a1
    802017d2:	8a32                	mv	s4,a2
    802017d4:	89b6                	mv	s3,a3
        va0 = PGROUNDDOWN(dstva);
    802017d6:	7bfd                	lui	s7,0xfffff
        pa0 = walkaddr(pagetable, va0);
        if (pa0 == 0)
            return -1;
        n = PGSIZE - (dstva - va0);
    802017d8:	6a85                	lui	s5,0x1
    802017da:	a015                	j	802017fe <copyout+0x4a>
        if (n > len)
            n = len;
        memmove((void *) (pa0 + (dstva - va0)), src, n);
    802017dc:	9562                	add	a0,a0,s8
    802017de:	0004861b          	sext.w	a2,s1
    802017e2:	85d2                	mv	a1,s4
    802017e4:	41250533          	sub	a0,a0,s2
    802017e8:	fffff097          	auipc	ra,0xfffff
    802017ec:	0c8080e7          	jalr	200(ra) # 802008b0 <memmove>

        len -= n;
    802017f0:	409989b3          	sub	s3,s3,s1
        src += n;
    802017f4:	9a26                	add	s4,s4,s1
        dstva = va0 + PGSIZE;
    802017f6:	01590c33          	add	s8,s2,s5
    while (len > 0) {
    802017fa:	02098263          	beqz	s3,8020181e <copyout+0x6a>
        va0 = PGROUNDDOWN(dstva);
    802017fe:	017c7933          	and	s2,s8,s7
        pa0 = walkaddr(pagetable, va0);
    80201802:	85ca                	mv	a1,s2
    80201804:	855a                	mv	a0,s6
    80201806:	00000097          	auipc	ra,0x0
    8020180a:	938080e7          	jalr	-1736(ra) # 8020113e <walkaddr>
        if (pa0 == 0)
    8020180e:	cd01                	beqz	a0,80201826 <copyout+0x72>
        n = PGSIZE - (dstva - va0);
    80201810:	418904b3          	sub	s1,s2,s8
    80201814:	94d6                	add	s1,s1,s5
        if (n > len)
    80201816:	fc99f3e3          	bgeu	s3,s1,802017dc <copyout+0x28>
    8020181a:	84ce                	mv	s1,s3
    8020181c:	b7c1                	j	802017dc <copyout+0x28>
    }
    return 0;
    8020181e:	4501                	li	a0,0
    80201820:	a021                	j	80201828 <copyout+0x74>
    80201822:	4501                	li	a0,0
}
    80201824:	8082                	ret
            return -1;
    80201826:	557d                	li	a0,-1
}
    80201828:	60a6                	ld	ra,72(sp)
    8020182a:	6406                	ld	s0,64(sp)
    8020182c:	74e2                	ld	s1,56(sp)
    8020182e:	7942                	ld	s2,48(sp)
    80201830:	79a2                	ld	s3,40(sp)
    80201832:	7a02                	ld	s4,32(sp)
    80201834:	6ae2                	ld	s5,24(sp)
    80201836:	6b42                	ld	s6,16(sp)
    80201838:	6ba2                	ld	s7,8(sp)
    8020183a:	6c02                	ld	s8,0(sp)
    8020183c:	6161                	addi	sp,sp,80
    8020183e:	8082                	ret

0000000080201840 <copyin>:
// Copy len bytes to dst from virtual address srcva in a given page table.
// Return 0 on success, -1 on error.
int copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len) {
    uint64 n, va0, pa0;

    while (len > 0) {
    80201840:	caa5                	beqz	a3,802018b0 <copyin+0x70>
int copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len) {
    80201842:	715d                	addi	sp,sp,-80
    80201844:	e486                	sd	ra,72(sp)
    80201846:	e0a2                	sd	s0,64(sp)
    80201848:	fc26                	sd	s1,56(sp)
    8020184a:	f84a                	sd	s2,48(sp)
    8020184c:	f44e                	sd	s3,40(sp)
    8020184e:	f052                	sd	s4,32(sp)
    80201850:	ec56                	sd	s5,24(sp)
    80201852:	e85a                	sd	s6,16(sp)
    80201854:	e45e                	sd	s7,8(sp)
    80201856:	e062                	sd	s8,0(sp)
    80201858:	0880                	addi	s0,sp,80
    8020185a:	8b2a                	mv	s6,a0
    8020185c:	8a2e                	mv	s4,a1
    8020185e:	8c32                	mv	s8,a2
    80201860:	89b6                	mv	s3,a3
        va0 = PGROUNDDOWN(srcva);
    80201862:	7bfd                	lui	s7,0xfffff
        pa0 = walkaddr(pagetable, va0);
        if (pa0 == 0)
            return -1;
        n = PGSIZE - (srcva - va0);
    80201864:	6a85                	lui	s5,0x1
    80201866:	a01d                	j	8020188c <copyin+0x4c>
        if (n > len)
            n = len;
        memmove(dst, (void *) (pa0 + (srcva - va0)), n);
    80201868:	018505b3          	add	a1,a0,s8
    8020186c:	0004861b          	sext.w	a2,s1
    80201870:	412585b3          	sub	a1,a1,s2
    80201874:	8552                	mv	a0,s4
    80201876:	fffff097          	auipc	ra,0xfffff
    8020187a:	03a080e7          	jalr	58(ra) # 802008b0 <memmove>

        len -= n;
    8020187e:	409989b3          	sub	s3,s3,s1
        dst += n;
    80201882:	9a26                	add	s4,s4,s1
        srcva = va0 + PGSIZE;
    80201884:	01590c33          	add	s8,s2,s5
    while (len > 0) {
    80201888:	02098263          	beqz	s3,802018ac <copyin+0x6c>
        va0 = PGROUNDDOWN(srcva);
    8020188c:	017c7933          	and	s2,s8,s7
        pa0 = walkaddr(pagetable, va0);
    80201890:	85ca                	mv	a1,s2
    80201892:	855a                	mv	a0,s6
    80201894:	00000097          	auipc	ra,0x0
    80201898:	8aa080e7          	jalr	-1878(ra) # 8020113e <walkaddr>
        if (pa0 == 0)
    8020189c:	cd01                	beqz	a0,802018b4 <copyin+0x74>
        n = PGSIZE - (srcva - va0);
    8020189e:	418904b3          	sub	s1,s2,s8
    802018a2:	94d6                	add	s1,s1,s5
        if (n > len)
    802018a4:	fc99f2e3          	bgeu	s3,s1,80201868 <copyin+0x28>
    802018a8:	84ce                	mv	s1,s3
    802018aa:	bf7d                	j	80201868 <copyin+0x28>
    }
    return 0;
    802018ac:	4501                	li	a0,0
    802018ae:	a021                	j	802018b6 <copyin+0x76>
    802018b0:	4501                	li	a0,0
}
    802018b2:	8082                	ret
            return -1;
    802018b4:	557d                	li	a0,-1
}
    802018b6:	60a6                	ld	ra,72(sp)
    802018b8:	6406                	ld	s0,64(sp)
    802018ba:	74e2                	ld	s1,56(sp)
    802018bc:	7942                	ld	s2,48(sp)
    802018be:	79a2                	ld	s3,40(sp)
    802018c0:	7a02                	ld	s4,32(sp)
    802018c2:	6ae2                	ld	s5,24(sp)
    802018c4:	6b42                	ld	s6,16(sp)
    802018c6:	6ba2                	ld	s7,8(sp)
    802018c8:	6c02                	ld	s8,0(sp)
    802018ca:	6161                	addi	sp,sp,80
    802018cc:	8082                	ret

00000000802018ce <copyinstr>:

// Copy a null-terminated string from user to kernel.
// Copy bytes to dst from virtual address srcva in a given page table,
// until a '\0', or max.
// Return 0 on success, -1 on error.
int copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max) {
    802018ce:	715d                	addi	sp,sp,-80
    802018d0:	e486                	sd	ra,72(sp)
    802018d2:	e0a2                	sd	s0,64(sp)
    802018d4:	fc26                	sd	s1,56(sp)
    802018d6:	f84a                	sd	s2,48(sp)
    802018d8:	f44e                	sd	s3,40(sp)
    802018da:	f052                	sd	s4,32(sp)
    802018dc:	ec56                	sd	s5,24(sp)
    802018de:	e85a                	sd	s6,16(sp)
    802018e0:	e45e                	sd	s7,8(sp)
    802018e2:	e062                	sd	s8,0(sp)
    802018e4:	0880                	addi	s0,sp,80
    uint64 n, va0, pa0;
    int got_null = 0, len = 0;

    while (got_null == 0 && max > 0) {
    802018e6:	c6c9                	beqz	a3,80201970 <copyinstr+0xa2>
    802018e8:	8aaa                	mv	s5,a0
    802018ea:	8bae                	mv	s7,a1
    802018ec:	8c32                	mv	s8,a2
    802018ee:	8936                	mv	s2,a3
    int got_null = 0, len = 0;
    802018f0:	4481                	li	s1,0
        va0 = PGROUNDDOWN(srcva);
    802018f2:	7b7d                	lui	s6,0xfffff
        pa0 = walkaddr(pagetable, va0);
        if (pa0 == 0)
            return -1;
        n = PGSIZE - (srcva - va0);
    802018f4:	6a05                	lui	s4,0x1
    802018f6:	a025                	j	8020191e <copyinstr+0x50>
            n = max;

        char *p = (char *) (pa0 + (srcva - va0));
        while (n > 0) {
            if (*p == '\0') {
                *dst = '\0';
    802018f8:	00078023          	sb	zero,0(a5) # 1000 <_entry-0x801ff000>
        }

        srcva = va0 + PGSIZE;
    }
    return len;
}
    802018fc:	8526                	mv	a0,s1
    802018fe:	60a6                	ld	ra,72(sp)
    80201900:	6406                	ld	s0,64(sp)
    80201902:	74e2                	ld	s1,56(sp)
    80201904:	7942                	ld	s2,48(sp)
    80201906:	79a2                	ld	s3,40(sp)
    80201908:	7a02                	ld	s4,32(sp)
    8020190a:	6ae2                	ld	s5,24(sp)
    8020190c:	6b42                	ld	s6,16(sp)
    8020190e:	6ba2                	ld	s7,8(sp)
    80201910:	6c02                	ld	s8,0(sp)
    80201912:	6161                	addi	sp,sp,80
    80201914:	8082                	ret
        srcva = va0 + PGSIZE;
    80201916:	01498c33          	add	s8,s3,s4
    while (got_null == 0 && max > 0) {
    8020191a:	fe0901e3          	beqz	s2,802018fc <copyinstr+0x2e>
        va0 = PGROUNDDOWN(srcva);
    8020191e:	016c79b3          	and	s3,s8,s6
        pa0 = walkaddr(pagetable, va0);
    80201922:	85ce                	mv	a1,s3
    80201924:	8556                	mv	a0,s5
    80201926:	00000097          	auipc	ra,0x0
    8020192a:	818080e7          	jalr	-2024(ra) # 8020113e <walkaddr>
        if (pa0 == 0)
    8020192e:	c139                	beqz	a0,80201974 <copyinstr+0xa6>
        n = PGSIZE - (srcva - va0);
    80201930:	41898833          	sub	a6,s3,s8
    80201934:	9852                	add	a6,a6,s4
        if (n > max)
    80201936:	01097363          	bgeu	s2,a6,8020193c <copyinstr+0x6e>
    8020193a:	884a                	mv	a6,s2
        char *p = (char *) (pa0 + (srcva - va0));
    8020193c:	9562                	add	a0,a0,s8
    8020193e:	41350533          	sub	a0,a0,s3
        while (n > 0) {
    80201942:	fc080ae3          	beqz	a6,80201916 <copyinstr+0x48>
    80201946:	985e                	add	a6,a6,s7
    80201948:	87de                	mv	a5,s7
            if (*p == '\0') {
    8020194a:	41750633          	sub	a2,a0,s7
    8020194e:	197d                	addi	s2,s2,-1
    80201950:	9bca                	add	s7,s7,s2
    80201952:	00f60733          	add	a4,a2,a5
    80201956:	00074703          	lbu	a4,0(a4) # fffffffffffff000 <e_bss+0xffffffff7fcd9000>
    8020195a:	df59                	beqz	a4,802018f8 <copyinstr+0x2a>
                *dst = *p;
    8020195c:	00e78023          	sb	a4,0(a5)
            --max;
    80201960:	40fb8933          	sub	s2,s7,a5
            dst++;
    80201964:	0785                	addi	a5,a5,1
            len++;
    80201966:	2485                	addiw	s1,s1,1
        while (n > 0) {
    80201968:	ff0795e3          	bne	a5,a6,80201952 <copyinstr+0x84>
            dst++;
    8020196c:	8bc2                	mv	s7,a6
    8020196e:	b765                	j	80201916 <copyinstr+0x48>
    int got_null = 0, len = 0;
    80201970:	4481                	li	s1,0
    80201972:	b769                	j	802018fc <copyinstr+0x2e>
            return -1;
    80201974:	54fd                	li	s1,-1
    80201976:	b759                	j	802018fc <copyinstr+0x2e>

0000000080201978 <printint>:

#include <stdarg.h>
static char digits[] = "0123456789abcdef";

static void
printint(int xx, int base, int sign) {
    80201978:	7179                	addi	sp,sp,-48
    8020197a:	f406                	sd	ra,40(sp)
    8020197c:	f022                	sd	s0,32(sp)
    8020197e:	ec26                	sd	s1,24(sp)
    80201980:	e84a                	sd	s2,16(sp)
    80201982:	1800                	addi	s0,sp,48
    char buf[16];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    80201984:	c219                	beqz	a2,8020198a <printint+0x12>
    80201986:	08054663          	bltz	a0,80201a12 <printint+0x9a>
        x = -xx;
    else
        x = xx;
    8020198a:	2501                	sext.w	a0,a0
    8020198c:	4881                	li	a7,0
    8020198e:	fd040693          	addi	a3,s0,-48

    i = 0;
    80201992:	4701                	li	a4,0
    do {
        buf[i++] = digits[x % base];
    80201994:	2581                	sext.w	a1,a1
    80201996:	00003617          	auipc	a2,0x3
    8020199a:	b6260613          	addi	a2,a2,-1182 # 802044f8 <digits>
    8020199e:	883a                	mv	a6,a4
    802019a0:	2705                	addiw	a4,a4,1
    802019a2:	02b577bb          	remuw	a5,a0,a1
    802019a6:	1782                	slli	a5,a5,0x20
    802019a8:	9381                	srli	a5,a5,0x20
    802019aa:	97b2                	add	a5,a5,a2
    802019ac:	0007c783          	lbu	a5,0(a5)
    802019b0:	00f68023          	sb	a5,0(a3) # 1000 <_entry-0x801ff000>
    } while ((x /= base) != 0);
    802019b4:	0005079b          	sext.w	a5,a0
    802019b8:	02b5553b          	divuw	a0,a0,a1
    802019bc:	0685                	addi	a3,a3,1
    802019be:	feb7f0e3          	bgeu	a5,a1,8020199e <printint+0x26>

    if (sign)
    802019c2:	00088b63          	beqz	a7,802019d8 <printint+0x60>
        buf[i++] = '-';
    802019c6:	fe040793          	addi	a5,s0,-32
    802019ca:	973e                	add	a4,a4,a5
    802019cc:	02d00793          	li	a5,45
    802019d0:	fef70823          	sb	a5,-16(a4)
    802019d4:	0028071b          	addiw	a4,a6,2

    while (--i >= 0)
    802019d8:	02e05763          	blez	a4,80201a06 <printint+0x8e>
    802019dc:	fd040793          	addi	a5,s0,-48
    802019e0:	00e784b3          	add	s1,a5,a4
    802019e4:	fff78913          	addi	s2,a5,-1
    802019e8:	993a                	add	s2,s2,a4
    802019ea:	377d                	addiw	a4,a4,-1
    802019ec:	1702                	slli	a4,a4,0x20
    802019ee:	9301                	srli	a4,a4,0x20
    802019f0:	40e90933          	sub	s2,s2,a4
        consputc(buf[i]);
    802019f4:	fff4c503          	lbu	a0,-1(s1)
    802019f8:	fffff097          	auipc	ra,0xfffff
    802019fc:	00a080e7          	jalr	10(ra) # 80200a02 <consputc>
    while (--i >= 0)
    80201a00:	14fd                	addi	s1,s1,-1
    80201a02:	ff2499e3          	bne	s1,s2,802019f4 <printint+0x7c>
}
    80201a06:	70a2                	ld	ra,40(sp)
    80201a08:	7402                	ld	s0,32(sp)
    80201a0a:	64e2                	ld	s1,24(sp)
    80201a0c:	6942                	ld	s2,16(sp)
    80201a0e:	6145                	addi	sp,sp,48
    80201a10:	8082                	ret
        x = -xx;
    80201a12:	40a0053b          	negw	a0,a0
    if (sign && (sign = xx < 0))
    80201a16:	4885                	li	a7,1
        x = -xx;
    80201a18:	bf9d                	j	8020198e <printint+0x16>

0000000080201a1a <printf>:
    for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
        consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(char *fmt, ...) {
    80201a1a:	7131                	addi	sp,sp,-192
    80201a1c:	fc86                	sd	ra,120(sp)
    80201a1e:	f8a2                	sd	s0,112(sp)
    80201a20:	f4a6                	sd	s1,104(sp)
    80201a22:	f0ca                	sd	s2,96(sp)
    80201a24:	ecce                	sd	s3,88(sp)
    80201a26:	e8d2                	sd	s4,80(sp)
    80201a28:	e4d6                	sd	s5,72(sp)
    80201a2a:	e0da                	sd	s6,64(sp)
    80201a2c:	fc5e                	sd	s7,56(sp)
    80201a2e:	f862                	sd	s8,48(sp)
    80201a30:	f466                	sd	s9,40(sp)
    80201a32:	f06a                	sd	s10,32(sp)
    80201a34:	ec6e                	sd	s11,24(sp)
    80201a36:	0100                	addi	s0,sp,128
    80201a38:	8a2a                	mv	s4,a0
    80201a3a:	e40c                	sd	a1,8(s0)
    80201a3c:	e810                	sd	a2,16(s0)
    80201a3e:	ec14                	sd	a3,24(s0)
    80201a40:	f018                	sd	a4,32(s0)
    80201a42:	f41c                	sd	a5,40(s0)
    80201a44:	03043823          	sd	a6,48(s0)
    80201a48:	03143c23          	sd	a7,56(s0)
    va_list ap;
    int i, c;
    char *s;

    if (fmt == 0)
    80201a4c:	c915                	beqz	a0,80201a80 <printf+0x66>
        panic("null fmt");

    va_start(ap, fmt);
    80201a4e:	00840793          	addi	a5,s0,8
    80201a52:	f8f43423          	sd	a5,-120(s0)
    for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
    80201a56:	000a4503          	lbu	a0,0(s4) # 1000 <_entry-0x801ff000>
    80201a5a:	14050863          	beqz	a0,80201baa <printf+0x190>
    80201a5e:	4981                	li	s3,0
        if (c != '%') {
    80201a60:	02500a93          	li	s5,37
            continue;
        }
        c = fmt[++i] & 0xff;
        if (c == 0)
            break;
        switch (c) {
    80201a64:	07000b93          	li	s7,112
    consputc('x');
    80201a68:	4d41                	li	s10,16
        consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    80201a6a:	00003b17          	auipc	s6,0x3
    80201a6e:	a8eb0b13          	addi	s6,s6,-1394 # 802044f8 <digits>
        switch (c) {
    80201a72:	07300c93          	li	s9,115
                printptr(va_arg(ap, uint64));
                break;
            case 's':
                if ((s = va_arg(ap, char *)) == 0)
                    s = "(null)";
                for (; *s; s++)
    80201a76:	02800d93          	li	s11,40
        switch (c) {
    80201a7a:	06400c13          	li	s8,100
    80201a7e:	a02d                	j	80201aa8 <printf+0x8e>
        panic("null fmt");
    80201a80:	00003517          	auipc	a0,0x3
    80201a84:	a4850513          	addi	a0,a0,-1464 # 802044c8 <e_text+0x4c8>
    80201a88:	ffffe097          	auipc	ra,0xffffe
    80201a8c:	5f6080e7          	jalr	1526(ra) # 8020007e <panic>
    80201a90:	bf7d                	j	80201a4e <printf+0x34>
            consputc(c);
    80201a92:	fffff097          	auipc	ra,0xfffff
    80201a96:	f70080e7          	jalr	-144(ra) # 80200a02 <consputc>
    for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
    80201a9a:	2985                	addiw	s3,s3,1
    80201a9c:	013a07b3          	add	a5,s4,s3
    80201aa0:	0007c503          	lbu	a0,0(a5)
    80201aa4:	10050363          	beqz	a0,80201baa <printf+0x190>
        if (c != '%') {
    80201aa8:	ff5515e3          	bne	a0,s5,80201a92 <printf+0x78>
        c = fmt[++i] & 0xff;
    80201aac:	2985                	addiw	s3,s3,1
    80201aae:	013a07b3          	add	a5,s4,s3
    80201ab2:	0007c783          	lbu	a5,0(a5)
    80201ab6:	0007849b          	sext.w	s1,a5
        if (c == 0)
    80201aba:	cbe5                	beqz	a5,80201baa <printf+0x190>
        switch (c) {
    80201abc:	05778a63          	beq	a5,s7,80201b10 <printf+0xf6>
    80201ac0:	02fbf663          	bgeu	s7,a5,80201aec <printf+0xd2>
    80201ac4:	09978863          	beq	a5,s9,80201b54 <printf+0x13a>
    80201ac8:	07800713          	li	a4,120
    80201acc:	0ce79463          	bne	a5,a4,80201b94 <printf+0x17a>
                printint(va_arg(ap, int), 16, 1);
    80201ad0:	f8843783          	ld	a5,-120(s0)
    80201ad4:	00878713          	addi	a4,a5,8
    80201ad8:	f8e43423          	sd	a4,-120(s0)
    80201adc:	4605                	li	a2,1
    80201ade:	85ea                	mv	a1,s10
    80201ae0:	4388                	lw	a0,0(a5)
    80201ae2:	00000097          	auipc	ra,0x0
    80201ae6:	e96080e7          	jalr	-362(ra) # 80201978 <printint>
                break;
    80201aea:	bf45                	j	80201a9a <printf+0x80>
        switch (c) {
    80201aec:	09578e63          	beq	a5,s5,80201b88 <printf+0x16e>
    80201af0:	0b879263          	bne	a5,s8,80201b94 <printf+0x17a>
                printint(va_arg(ap, int), 10, 1);
    80201af4:	f8843783          	ld	a5,-120(s0)
    80201af8:	00878713          	addi	a4,a5,8
    80201afc:	f8e43423          	sd	a4,-120(s0)
    80201b00:	4605                	li	a2,1
    80201b02:	45a9                	li	a1,10
    80201b04:	4388                	lw	a0,0(a5)
    80201b06:	00000097          	auipc	ra,0x0
    80201b0a:	e72080e7          	jalr	-398(ra) # 80201978 <printint>
                break;
    80201b0e:	b771                	j	80201a9a <printf+0x80>
                printptr(va_arg(ap, uint64));
    80201b10:	f8843783          	ld	a5,-120(s0)
    80201b14:	00878713          	addi	a4,a5,8
    80201b18:	f8e43423          	sd	a4,-120(s0)
    80201b1c:	0007b903          	ld	s2,0(a5)
    consputc('0');
    80201b20:	03000513          	li	a0,48
    80201b24:	fffff097          	auipc	ra,0xfffff
    80201b28:	ede080e7          	jalr	-290(ra) # 80200a02 <consputc>
    consputc('x');
    80201b2c:	07800513          	li	a0,120
    80201b30:	fffff097          	auipc	ra,0xfffff
    80201b34:	ed2080e7          	jalr	-302(ra) # 80200a02 <consputc>
    80201b38:	84ea                	mv	s1,s10
        consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    80201b3a:	03c95793          	srli	a5,s2,0x3c
    80201b3e:	97da                	add	a5,a5,s6
    80201b40:	0007c503          	lbu	a0,0(a5)
    80201b44:	fffff097          	auipc	ra,0xfffff
    80201b48:	ebe080e7          	jalr	-322(ra) # 80200a02 <consputc>
    for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    80201b4c:	0912                	slli	s2,s2,0x4
    80201b4e:	34fd                	addiw	s1,s1,-1
    80201b50:	f4ed                	bnez	s1,80201b3a <printf+0x120>
    80201b52:	b7a1                	j	80201a9a <printf+0x80>
                if ((s = va_arg(ap, char *)) == 0)
    80201b54:	f8843783          	ld	a5,-120(s0)
    80201b58:	00878713          	addi	a4,a5,8
    80201b5c:	f8e43423          	sd	a4,-120(s0)
    80201b60:	6384                	ld	s1,0(a5)
    80201b62:	cc89                	beqz	s1,80201b7c <printf+0x162>
                for (; *s; s++)
    80201b64:	0004c503          	lbu	a0,0(s1)
    80201b68:	d90d                	beqz	a0,80201a9a <printf+0x80>
                    consputc(*s);
    80201b6a:	fffff097          	auipc	ra,0xfffff
    80201b6e:	e98080e7          	jalr	-360(ra) # 80200a02 <consputc>
                for (; *s; s++)
    80201b72:	0485                	addi	s1,s1,1
    80201b74:	0004c503          	lbu	a0,0(s1)
    80201b78:	f96d                	bnez	a0,80201b6a <printf+0x150>
    80201b7a:	b705                	j	80201a9a <printf+0x80>
                    s = "(null)";
    80201b7c:	00003497          	auipc	s1,0x3
    80201b80:	94448493          	addi	s1,s1,-1724 # 802044c0 <e_text+0x4c0>
                for (; *s; s++)
    80201b84:	856e                	mv	a0,s11
    80201b86:	b7d5                	j	80201b6a <printf+0x150>
                break;
            case '%':
                consputc('%');
    80201b88:	8556                	mv	a0,s5
    80201b8a:	fffff097          	auipc	ra,0xfffff
    80201b8e:	e78080e7          	jalr	-392(ra) # 80200a02 <consputc>
                break;
    80201b92:	b721                	j	80201a9a <printf+0x80>
            default:
                // Print unknown % sequence to draw attention.
                consputc('%');
    80201b94:	8556                	mv	a0,s5
    80201b96:	fffff097          	auipc	ra,0xfffff
    80201b9a:	e6c080e7          	jalr	-404(ra) # 80200a02 <consputc>
                consputc(c);
    80201b9e:	8526                	mv	a0,s1
    80201ba0:	fffff097          	auipc	ra,0xfffff
    80201ba4:	e62080e7          	jalr	-414(ra) # 80200a02 <consputc>
                break;
    80201ba8:	bdcd                	j	80201a9a <printf+0x80>
        }
    }
}
    80201baa:	70e6                	ld	ra,120(sp)
    80201bac:	7446                	ld	s0,112(sp)
    80201bae:	74a6                	ld	s1,104(sp)
    80201bb0:	7906                	ld	s2,96(sp)
    80201bb2:	69e6                	ld	s3,88(sp)
    80201bb4:	6a46                	ld	s4,80(sp)
    80201bb6:	6aa6                	ld	s5,72(sp)
    80201bb8:	6b06                	ld	s6,64(sp)
    80201bba:	7be2                	ld	s7,56(sp)
    80201bbc:	7c42                	ld	s8,48(sp)
    80201bbe:	7ca2                	ld	s9,40(sp)
    80201bc0:	7d02                	ld	s10,32(sp)
    80201bc2:	6de2                	ld	s11,24(sp)
    80201bc4:	6129                	addi	sp,sp,192
    80201bc6:	8082                	ret

0000000080201bc8 <console_putchar>:
                 : "r"(a0), "r"(a1), "r"(a2), "r"(a7)
                 : "memory");
    return a0;
}

void console_putchar(int c) {
    80201bc8:	1141                	addi	sp,sp,-16
    80201bca:	e422                	sd	s0,8(sp)
    80201bcc:	0800                	addi	s0,sp,16
    register uint64 a1 asm("a1") = arg1;
    80201bce:	4581                	li	a1,0
    register uint64 a2 asm("a2") = arg2;
    80201bd0:	4601                	li	a2,0
    register uint64 a7 asm("a7") = which;
    80201bd2:	4885                	li	a7,1
    asm volatile("ecall"
    80201bd4:	00000073          	ecall
    sbi_call(SBI_CONSOLE_PUTCHAR, c, 0, 0);
}
    80201bd8:	6422                	ld	s0,8(sp)
    80201bda:	0141                	addi	sp,sp,16
    80201bdc:	8082                	ret

0000000080201bde <console_getchar>:

int console_getchar() {
    80201bde:	1141                	addi	sp,sp,-16
    80201be0:	e422                	sd	s0,8(sp)
    80201be2:	0800                	addi	s0,sp,16
    register uint64 a0 asm("a0") = arg0;
    80201be4:	4501                	li	a0,0
    register uint64 a1 asm("a1") = arg1;
    80201be6:	4581                	li	a1,0
    register uint64 a2 asm("a2") = arg2;
    80201be8:	4601                	li	a2,0
    register uint64 a7 asm("a7") = which;
    80201bea:	4889                	li	a7,2
    asm volatile("ecall"
    80201bec:	00000073          	ecall
    return sbi_call(SBI_CONSOLE_GETCHAR, 0, 0, 0);
}
    80201bf0:	2501                	sext.w	a0,a0
    80201bf2:	6422                	ld	s0,8(sp)
    80201bf4:	0141                	addi	sp,sp,16
    80201bf6:	8082                	ret

0000000080201bf8 <shutdown>:

void shutdown() {
    80201bf8:	1141                	addi	sp,sp,-16
    80201bfa:	e406                	sd	ra,8(sp)
    80201bfc:	e022                	sd	s0,0(sp)
    80201bfe:	0800                	addi	s0,sp,16
    register uint64 a0 asm("a0") = arg0;
    80201c00:	4501                	li	a0,0
    register uint64 a1 asm("a1") = arg1;
    80201c02:	4581                	li	a1,0
    register uint64 a2 asm("a2") = arg2;
    80201c04:	4601                	li	a2,0
    register uint64 a7 asm("a7") = which;
    80201c06:	48a1                	li	a7,8
    asm volatile("ecall"
    80201c08:	00000073          	ecall
    sbi_call(SBI_SHUTDOWN, 0, 0, 0);
    panic("shutdown");
    80201c0c:	00003517          	auipc	a0,0x3
    80201c10:	90450513          	addi	a0,a0,-1788 # 80204510 <digits+0x18>
    80201c14:	ffffe097          	auipc	ra,0xffffe
    80201c18:	46a080e7          	jalr	1130(ra) # 8020007e <panic>
}
    80201c1c:	60a2                	ld	ra,8(sp)
    80201c1e:	6402                	ld	s0,0(sp)
    80201c20:	0141                	addi	sp,sp,16
    80201c22:	8082                	ret

0000000080201c24 <set_timer>:

void set_timer(uint64 stime) {
    80201c24:	1141                	addi	sp,sp,-16
    80201c26:	e422                	sd	s0,8(sp)
    80201c28:	0800                	addi	s0,sp,16
    register uint64 a1 asm("a1") = arg1;
    80201c2a:	4581                	li	a1,0
    register uint64 a2 asm("a2") = arg2;
    80201c2c:	4601                	li	a2,0
    register uint64 a7 asm("a7") = which;
    80201c2e:	4881                	li	a7,0
    asm volatile("ecall"
    80201c30:	00000073          	ecall
    sbi_call(SBI_SET_TIMER, stime, 0, 0);
}
    80201c34:	6422                	ld	s0,8(sp)
    80201c36:	0141                	addi	sp,sp,16
    80201c38:	8082                	ret

0000000080201c3a <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(void *pa)
{
    80201c3a:	1101                	addi	sp,sp,-32
    80201c3c:	ec06                	sd	ra,24(sp)
    80201c3e:	e822                	sd	s0,16(sp)
    80201c40:	e426                	sd	s1,8(sp)
    80201c42:	1000                	addi	s0,sp,32
    80201c44:	84aa                	mv	s1,a0
    struct linklist *l;
    if(((uint64)pa % PGSIZE) != 0 || (char*)pa < ekernel || (uint64)pa >= PHYSTOP)
    80201c46:	03451793          	slli	a5,a0,0x34
    80201c4a:	0347d593          	srli	a1,a5,0x34
    80201c4e:	eb99                	bnez	a5,80201c64 <kfree+0x2a>
    80201c50:	00124797          	auipc	a5,0x124
    80201c54:	3b078793          	addi	a5,a5,944 # 80326000 <e_bss>
    80201c58:	00f56663          	bltu	a0,a5,80201c64 <kfree+0x2a>
    80201c5c:	47c5                	li	a5,17
    80201c5e:	07ee                	slli	a5,a5,0x1b
    80201c60:	06f56a63          	bltu	a0,a5,80201cd4 <kfree+0x9a>
        {
            printf("1 is %d \n",((uint64)pa % PGSIZE));
    80201c64:	00003517          	auipc	a0,0x3
    80201c68:	8bc50513          	addi	a0,a0,-1860 # 80204520 <digits+0x28>
    80201c6c:	00000097          	auipc	ra,0x0
    80201c70:	dae080e7          	jalr	-594(ra) # 80201a1a <printf>
            printf("2 is %d \n",((char*)pa < ekernel));
    80201c74:	00124597          	auipc	a1,0x124
    80201c78:	38c58593          	addi	a1,a1,908 # 80326000 <e_bss>
    80201c7c:	00b4b5b3          	sltu	a1,s1,a1
    80201c80:	00003517          	auipc	a0,0x3
    80201c84:	8b050513          	addi	a0,a0,-1872 # 80204530 <digits+0x38>
    80201c88:	00000097          	auipc	ra,0x0
    80201c8c:	d92080e7          	jalr	-622(ra) # 80201a1a <printf>
            printf("3 is %d \n",((uint64)pa >= PHYSTOP));
    80201c90:	45c5                	li	a1,17
    80201c92:	05ee                	slli	a1,a1,0x1b
    80201c94:	00b4b5b3          	sltu	a1,s1,a1
    80201c98:	0015c593          	xori	a1,a1,1
    80201c9c:	2581                	sext.w	a1,a1
    80201c9e:	00003517          	auipc	a0,0x3
    80201ca2:	8a250513          	addi	a0,a0,-1886 # 80204540 <digits+0x48>
    80201ca6:	00000097          	auipc	ra,0x0
    80201caa:	d74080e7          	jalr	-652(ra) # 80201a1a <printf>
            printf("%p , %p\n",pa,PHYSTOP);
    80201cae:	88000637          	lui	a2,0x88000
    80201cb2:	85a6                	mv	a1,s1
    80201cb4:	00003517          	auipc	a0,0x3
    80201cb8:	89c50513          	addi	a0,a0,-1892 # 80204550 <digits+0x58>
    80201cbc:	00000097          	auipc	ra,0x0
    80201cc0:	d5e080e7          	jalr	-674(ra) # 80201a1a <printf>

            panic("kfree");
    80201cc4:	00003517          	auipc	a0,0x3
    80201cc8:	89c50513          	addi	a0,a0,-1892 # 80204560 <digits+0x68>
    80201ccc:	ffffe097          	auipc	ra,0xffffe
    80201cd0:	3b2080e7          	jalr	946(ra) # 8020007e <panic>
        }
    // Fill with junk to catch dangling refs.
    memset(pa, 1, PGSIZE);
    80201cd4:	6605                	lui	a2,0x1
    80201cd6:	4585                	li	a1,1
    80201cd8:	8526                	mv	a0,s1
    80201cda:	fffff097          	auipc	ra,0xfffff
    80201cde:	b7a080e7          	jalr	-1158(ra) # 80200854 <memset>
    l = (struct linklist*)pa;
    l->next = kmem.freelist;
    80201ce2:	00123797          	auipc	a5,0x123
    80201ce6:	3ee78793          	addi	a5,a5,1006 # 803250d0 <kmem>
    80201cea:	6398                	ld	a4,0(a5)
    80201cec:	e098                	sd	a4,0(s1)
    kmem.freelist = l;
    80201cee:	e384                	sd	s1,0(a5)
}
    80201cf0:	60e2                	ld	ra,24(sp)
    80201cf2:	6442                	ld	s0,16(sp)
    80201cf4:	64a2                	ld	s1,8(sp)
    80201cf6:	6105                	addi	sp,sp,32
    80201cf8:	8082                	ret

0000000080201cfa <freerange>:
{
    80201cfa:	7179                	addi	sp,sp,-48
    80201cfc:	f406                	sd	ra,40(sp)
    80201cfe:	f022                	sd	s0,32(sp)
    80201d00:	ec26                	sd	s1,24(sp)
    80201d02:	e84a                	sd	s2,16(sp)
    80201d04:	e44e                	sd	s3,8(sp)
    80201d06:	e052                	sd	s4,0(sp)
    80201d08:	1800                	addi	s0,sp,48
    p = (char*)PGROUNDUP((uint64)pa_start);
    80201d0a:	6785                	lui	a5,0x1
    80201d0c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x801ff001>
    80201d10:	94aa                	add	s1,s1,a0
    80201d12:	757d                	lui	a0,0xfffff
    80201d14:	8ce9                	and	s1,s1,a0
    for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    80201d16:	94be                	add	s1,s1,a5
    80201d18:	0095ee63          	bltu	a1,s1,80201d34 <freerange+0x3a>
    80201d1c:	892e                	mv	s2,a1
        kfree(p);
    80201d1e:	7a7d                	lui	s4,0xfffff
    for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    80201d20:	6985                	lui	s3,0x1
        kfree(p);
    80201d22:	01448533          	add	a0,s1,s4
    80201d26:	00000097          	auipc	ra,0x0
    80201d2a:	f14080e7          	jalr	-236(ra) # 80201c3a <kfree>
    for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    80201d2e:	94ce                	add	s1,s1,s3
    80201d30:	fe9979e3          	bgeu	s2,s1,80201d22 <freerange+0x28>
}
    80201d34:	70a2                	ld	ra,40(sp)
    80201d36:	7402                	ld	s0,32(sp)
    80201d38:	64e2                	ld	s1,24(sp)
    80201d3a:	6942                	ld	s2,16(sp)
    80201d3c:	69a2                	ld	s3,8(sp)
    80201d3e:	6a02                	ld	s4,0(sp)
    80201d40:	6145                	addi	sp,sp,48
    80201d42:	8082                	ret

0000000080201d44 <kinit>:
{
    80201d44:	1141                	addi	sp,sp,-16
    80201d46:	e406                	sd	ra,8(sp)
    80201d48:	e022                	sd	s0,0(sp)
    80201d4a:	0800                	addi	s0,sp,16
    freerange(ekernel, (void*)PHYSTOP);
    80201d4c:	45c5                	li	a1,17
    80201d4e:	05ee                	slli	a1,a1,0x1b
    80201d50:	00124517          	auipc	a0,0x124
    80201d54:	2b050513          	addi	a0,a0,688 # 80326000 <e_bss>
    80201d58:	00000097          	auipc	ra,0x0
    80201d5c:	fa2080e7          	jalr	-94(ra) # 80201cfa <freerange>
}
    80201d60:	60a2                	ld	ra,8(sp)
    80201d62:	6402                	ld	s0,0(sp)
    80201d64:	0141                	addi	sp,sp,16
    80201d66:	8082                	ret

0000000080201d68 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void *
kalloc(void)
{
    80201d68:	1101                	addi	sp,sp,-32
    80201d6a:	ec06                	sd	ra,24(sp)
    80201d6c:	e822                	sd	s0,16(sp)
    80201d6e:	e426                	sd	s1,8(sp)
    80201d70:	1000                	addi	s0,sp,32
    struct linklist *l;
    l = kmem.freelist;
    80201d72:	00123497          	auipc	s1,0x123
    80201d76:	35e4b483          	ld	s1,862(s1) # 803250d0 <kmem>
    if(l) {
    80201d7a:	cc89                	beqz	s1,80201d94 <kalloc+0x2c>
        kmem.freelist = l->next;
    80201d7c:	609c                	ld	a5,0(s1)
    80201d7e:	00123717          	auipc	a4,0x123
    80201d82:	34f73923          	sd	a5,850(a4) # 803250d0 <kmem>
        memset((char *) l, 5, PGSIZE);// fill with junk
    80201d86:	6605                	lui	a2,0x1
    80201d88:	4595                	li	a1,5
    80201d8a:	8526                	mv	a0,s1
    80201d8c:	fffff097          	auipc	ra,0xfffff
    80201d90:	ac8080e7          	jalr	-1336(ra) # 80200854 <memset>
    }
    return (void*)l;
    80201d94:	8526                	mv	a0,s1
    80201d96:	60e2                	ld	ra,24(sp)
    80201d98:	6442                	ld	s0,16(sp)
    80201d9a:	64a2                	ld	s1,8(sp)
    80201d9c:	6105                	addi	sp,sp,32
    80201d9e:	8082                	ret

0000000080201da0 <curr_proc>:
struct proc idle;
int curr_pid = 0;



struct proc* curr_proc() {
    80201da0:	1141                	addi	sp,sp,-16
    80201da2:	e422                	sd	s0,8(sp)
    80201da4:	0800                	addi	s0,sp,16
    if(current_proc == 0)
    80201da6:	00123517          	auipc	a0,0x123
    80201daa:	33a53503          	ld	a0,826(a0) # 803250e0 <current_proc>
    80201dae:	c501                	beqz	a0,80201db6 <curr_proc+0x16>
        return &idle;
    return current_proc;
}
    80201db0:	6422                	ld	s0,8(sp)
    80201db2:	0141                	addi	sp,sp,16
    80201db4:	8082                	ret
        return &idle;
    80201db6:	00016517          	auipc	a0,0x16
    80201dba:	a1a50513          	addi	a0,a0,-1510 # 802177d0 <idle>
    80201dbe:	bfcd                	j	80201db0 <curr_proc+0x10>

0000000080201dc0 <procinit>:

void
procinit(void)
{
    80201dc0:	1141                	addi	sp,sp,-16
    80201dc2:	e422                	sd	s0,8(sp)
    80201dc4:	0800                	addi	s0,sp,16
    struct proc *p;
    for(p = pool; p < &pool[NPROC]; p++) {
    80201dc6:	00116717          	auipc	a4,0x116
    80201dca:	aea70713          	addi	a4,a4,-1302 # 803178b0 <pool>
        p->state = UNUSED;
        p->kstack = (uint64) kstack[p - pool];
    80201dce:	853a                	mv	a0,a4
    80201dd0:	00003597          	auipc	a1,0x3
    80201dd4:	8985b583          	ld	a1,-1896(a1) # 80204668 <TICKS_PER_SEC+0x8>
    80201dd8:	00016617          	auipc	a2,0x16
    80201ddc:	ad860613          	addi	a2,a2,-1320 # 802178b0 <kstack>
    for(p = pool; p < &pool[NPROC]; p++) {
    80201de0:	00123697          	auipc	a3,0x123
    80201de4:	2d068693          	addi	a3,a3,720 # 803250b0 <fin>
        p->state = UNUSED;
    80201de8:	00072023          	sw	zero,0(a4)
        p->kstack = (uint64) kstack[p - pool];
    80201dec:	40a707b3          	sub	a5,a4,a0
    80201df0:	878d                	srai	a5,a5,0x3
    80201df2:	02b787b3          	mul	a5,a5,a1
    80201df6:	07b2                	slli	a5,a5,0xc
    80201df8:	97b2                	add	a5,a5,a2
    80201dfa:	f31c                	sd	a5,32(a4)
    for(p = pool; p < &pool[NPROC]; p++) {
    80201dfc:	0d870713          	addi	a4,a4,216
    80201e00:	fed714e3          	bne	a4,a3,80201de8 <procinit+0x28>

    }
    idle.kstack = (uint64)boot_stack_top;
    80201e04:	00016797          	auipc	a5,0x16
    80201e08:	9cc78793          	addi	a5,a5,-1588 # 802177d0 <idle>
    80201e0c:	00015717          	auipc	a4,0x15
    80201e10:	1f470713          	addi	a4,a4,500 # 80217000 <names>
    80201e14:	f398                	sd	a4,32(a5)
    idle.pid = 0;
    80201e16:	0007a423          	sw	zero,8(a5)
    idle.killed = 0;
    80201e1a:	0007a223          	sw	zero,4(a5)
}
    80201e1e:	6422                	ld	s0,8(sp)
    80201e20:	0141                	addi	sp,sp,16
    80201e22:	8082                	ret

0000000080201e24 <allocpid>:

int allocpid() {
    80201e24:	1141                	addi	sp,sp,-16
    80201e26:	e422                	sd	s0,8(sp)
    80201e28:	0800                	addi	s0,sp,16
    static int PID = 1;
    return PID++;
    80201e2a:	00004797          	auipc	a5,0x4
    80201e2e:	3ea78793          	addi	a5,a5,1002 # 80206214 <PID.0>
    80201e32:	4388                	lw	a0,0(a5)
    80201e34:	0015071b          	addiw	a4,a0,1
    80201e38:	c398                	sw	a4,0(a5)
}
    80201e3a:	6422                	ld	s0,8(sp)
    80201e3c:	0141                	addi	sp,sp,16
    80201e3e:	8082                	ret

0000000080201e40 <proc_pagetable>:

pagetable_t
proc_pagetable(struct proc *p)
{
    80201e40:	1101                	addi	sp,sp,-32
    80201e42:	ec06                	sd	ra,24(sp)
    80201e44:	e822                	sd	s0,16(sp)
    80201e46:	e426                	sd	s1,8(sp)
    80201e48:	e04a                	sd	s2,0(sp)
    80201e4a:	1000                	addi	s0,sp,32
    80201e4c:	892a                	mv	s2,a0
    pagetable_t pagetable;

    // An empty page table.
    pagetable = uvmcreate();
    80201e4e:	fffff097          	auipc	ra,0xfffff
    80201e52:	5ba080e7          	jalr	1466(ra) # 80201408 <uvmcreate>
    80201e56:	84aa                	mv	s1,a0
    if(pagetable == 0)
    80201e58:	cd39                	beqz	a0,80201eb6 <proc_pagetable+0x76>
        panic("");

    if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80201e5a:	4729                	li	a4,10
    80201e5c:	00001697          	auipc	a3,0x1
    80201e60:	1a468693          	addi	a3,a3,420 # 80203000 <trampoline>
    80201e64:	6605                	lui	a2,0x1
    80201e66:	040005b7          	lui	a1,0x4000
    80201e6a:	15fd                	addi	a1,a1,-1
    80201e6c:	05b2                	slli	a1,a1,0xc
    80201e6e:	8526                	mv	a0,s1
    80201e70:	fffff097          	auipc	ra,0xfffff
    80201e74:	334080e7          	jalr	820(ra) # 802011a4 <mappages>
    80201e78:	04054863          	bltz	a0,80201ec8 <proc_pagetable+0x88>
                (uint64)trampoline, PTE_R | PTE_X) < 0){
        uvmfree(pagetable, 0);
        return 0;
    }

    if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    80201e7c:	00000097          	auipc	ra,0x0
    80201e80:	eec080e7          	jalr	-276(ra) # 80201d68 <kalloc>
    80201e84:	02a93423          	sd	a0,40(s2) # 1028 <_entry-0x801fefd8>
    80201e88:	c921                	beqz	a0,80201ed8 <proc_pagetable+0x98>
        panic("kalloc\n");
    }
    // map the trapframe just below TRAMPOLINE, for trampoline.S.
    if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80201e8a:	4719                	li	a4,6
    80201e8c:	02893683          	ld	a3,40(s2)
    80201e90:	6605                	lui	a2,0x1
    80201e92:	020005b7          	lui	a1,0x2000
    80201e96:	15fd                	addi	a1,a1,-1
    80201e98:	05b6                	slli	a1,a1,0xd
    80201e9a:	8526                	mv	a0,s1
    80201e9c:	fffff097          	auipc	ra,0xfffff
    80201ea0:	308080e7          	jalr	776(ra) # 802011a4 <mappages>
    80201ea4:	04054363          	bltz	a0,80201eea <proc_pagetable+0xaa>
                (uint64)(p->trapframe), PTE_R | PTE_W) < 0){;
        panic("");
    }

    return pagetable;
}
    80201ea8:	8526                	mv	a0,s1
    80201eaa:	60e2                	ld	ra,24(sp)
    80201eac:	6442                	ld	s0,16(sp)
    80201eae:	64a2                	ld	s1,8(sp)
    80201eb0:	6902                	ld	s2,0(sp)
    80201eb2:	6105                	addi	sp,sp,32
    80201eb4:	8082                	ret
        panic("");
    80201eb6:	00002517          	auipc	a0,0x2
    80201eba:	24250513          	addi	a0,a0,578 # 802040f8 <e_text+0xf8>
    80201ebe:	ffffe097          	auipc	ra,0xffffe
    80201ec2:	1c0080e7          	jalr	448(ra) # 8020007e <panic>
    80201ec6:	bf51                	j	80201e5a <proc_pagetable+0x1a>
        uvmfree(pagetable, 0);
    80201ec8:	4581                	li	a1,0
    80201eca:	8526                	mv	a0,s1
    80201ecc:	fffff097          	auipc	ra,0xfffff
    80201ed0:	792080e7          	jalr	1938(ra) # 8020165e <uvmfree>
        return 0;
    80201ed4:	4481                	li	s1,0
    80201ed6:	bfc9                	j	80201ea8 <proc_pagetable+0x68>
        panic("kalloc\n");
    80201ed8:	00002517          	auipc	a0,0x2
    80201edc:	69050513          	addi	a0,a0,1680 # 80204568 <digits+0x70>
    80201ee0:	ffffe097          	auipc	ra,0xffffe
    80201ee4:	19e080e7          	jalr	414(ra) # 8020007e <panic>
    80201ee8:	b74d                	j	80201e8a <proc_pagetable+0x4a>
        panic("");
    80201eea:	00002517          	auipc	a0,0x2
    80201eee:	20e50513          	addi	a0,a0,526 # 802040f8 <e_text+0xf8>
    80201ef2:	ffffe097          	auipc	ra,0xffffe
    80201ef6:	18c080e7          	jalr	396(ra) # 8020007e <panic>
    80201efa:	b77d                	j	80201ea8 <proc_pagetable+0x68>

0000000080201efc <proc_freepagetable>:

// Free a process's page table, and free the
// physical memory it refers to.
void
proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
    80201efc:	1101                	addi	sp,sp,-32
    80201efe:	ec06                	sd	ra,24(sp)
    80201f00:	e822                	sd	s0,16(sp)
    80201f02:	e426                	sd	s1,8(sp)
    80201f04:	e04a                	sd	s2,0(sp)
    80201f06:	1000                	addi	s0,sp,32
    80201f08:	84aa                	mv	s1,a0
    80201f0a:	892e                	mv	s2,a1
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201f0c:	4681                	li	a3,0
    80201f0e:	4605                	li	a2,1
    80201f10:	040005b7          	lui	a1,0x4000
    80201f14:	15fd                	addi	a1,a1,-1
    80201f16:	05b2                	slli	a1,a1,0xc
    80201f18:	fffff097          	auipc	ra,0xfffff
    80201f1c:	40e080e7          	jalr	1038(ra) # 80201326 <uvmunmap>
    uvmunmap(pagetable, TRAPFRAME, 1, 0);
    80201f20:	4681                	li	a3,0
    80201f22:	4605                	li	a2,1
    80201f24:	020005b7          	lui	a1,0x2000
    80201f28:	15fd                	addi	a1,a1,-1
    80201f2a:	05b6                	slli	a1,a1,0xd
    80201f2c:	8526                	mv	a0,s1
    80201f2e:	fffff097          	auipc	ra,0xfffff
    80201f32:	3f8080e7          	jalr	1016(ra) # 80201326 <uvmunmap>
    uvmfree(pagetable, sz);
    80201f36:	85ca                	mv	a1,s2
    80201f38:	8526                	mv	a0,s1
    80201f3a:	fffff097          	auipc	ra,0xfffff
    80201f3e:	724080e7          	jalr	1828(ra) # 8020165e <uvmfree>
}
    80201f42:	60e2                	ld	ra,24(sp)
    80201f44:	6442                	ld	s0,16(sp)
    80201f46:	64a2                	ld	s1,8(sp)
    80201f48:	6902                	ld	s2,0(sp)
    80201f4a:	6105                	addi	sp,sp,32
    80201f4c:	8082                	ret

0000000080201f4e <allocproc>:
    p->state = UNUSED;
}


struct proc* allocproc(void)
{
    80201f4e:	1101                	addi	sp,sp,-32
    80201f50:	ec06                	sd	ra,24(sp)
    80201f52:	e822                	sd	s0,16(sp)
    80201f54:	e426                	sd	s1,8(sp)
    80201f56:	1000                	addi	s0,sp,32
    struct proc *p;
    for(p = pool; p < &pool[NPROC]; p++) {
    80201f58:	00116497          	auipc	s1,0x116
    80201f5c:	95848493          	addi	s1,s1,-1704 # 803178b0 <pool>
    80201f60:	00123717          	auipc	a4,0x123
    80201f64:	15070713          	addi	a4,a4,336 # 803250b0 <fin>
        if(p->state == UNUSED) {
    80201f68:	409c                	lw	a5,0(s1)
    80201f6a:	c799                	beqz	a5,80201f78 <allocproc+0x2a>
    for(p = pool; p < &pool[NPROC]; p++) {
    80201f6c:	0d848493          	addi	s1,s1,216
    80201f70:	fee49ce3          	bne	s1,a4,80201f68 <allocproc+0x1a>
            goto found;
        }
    }
    return 0;
    80201f74:	4481                	li	s1,0
    80201f76:	a085                	j	80201fd6 <allocproc+0x88>

    found:
    p->pid = allocpid();
    80201f78:	00000097          	auipc	ra,0x0
    80201f7c:	eac080e7          	jalr	-340(ra) # 80201e24 <allocpid>
    80201f80:	c488                	sw	a0,8(s1)
    p->state = USED;
    80201f82:	4785                	li	a5,1
    80201f84:	c09c                	sw	a5,0(s1)
    p->sz = 0;
    80201f86:	0a04b023          	sd	zero,160(s1)
    p->exit_code = -1;
    80201f8a:	57fd                	li	a5,-1
    80201f8c:	f8dc                	sd	a5,176(s1)
    p->parent = 0;
    80201f8e:	0a04b423          	sd	zero,168(s1)
    p->ustack = 0;
    80201f92:	0004bc23          	sd	zero,24(s1)
    p->pagetable = proc_pagetable(p);
    80201f96:	8526                	mv	a0,s1
    80201f98:	00000097          	auipc	ra,0x0
    80201f9c:	ea8080e7          	jalr	-344(ra) # 80201e40 <proc_pagetable>
    80201fa0:	e888                	sd	a0,16(s1)
    if(p->pagetable == 0){
    80201fa2:	c121                	beqz	a0,80201fe2 <allocproc+0x94>
        panic("");
    }
    memset(&p->context, 0, sizeof(p->context));
    80201fa4:	07000613          	li	a2,112
    80201fa8:	4581                	li	a1,0
    80201faa:	03048513          	addi	a0,s1,48
    80201fae:	fffff097          	auipc	ra,0xfffff
    80201fb2:	8a6080e7          	jalr	-1882(ra) # 80200854 <memset>
    // memset(p->trapframe, 0, PAGE_SIZE);
    memset((void*)p->kstack, 0, KSTACK_SIZE);
    80201fb6:	6605                	lui	a2,0x1
    80201fb8:	4581                	li	a1,0
    80201fba:	7088                	ld	a0,32(s1)
    80201fbc:	fffff097          	auipc	ra,0xfffff
    80201fc0:	898080e7          	jalr	-1896(ra) # 80200854 <memset>
    p->context.ra = (uint64)usertrapret;
    80201fc4:	ffffe797          	auipc	a5,0xffffe
    80201fc8:	23478793          	addi	a5,a5,564 # 802001f8 <usertrapret>
    80201fcc:	f89c                	sd	a5,48(s1)
    p->context.sp = p->kstack + PGSIZE;
    80201fce:	709c                	ld	a5,32(s1)
    80201fd0:	6705                	lui	a4,0x1
    80201fd2:	97ba                	add	a5,a5,a4
    80201fd4:	fc9c                	sd	a5,56(s1)
    // p->prio = 16; //default prio
    // p->pass=INT_MAX/16;
    // p->stride = 0;
    return p;
}
    80201fd6:	8526                	mv	a0,s1
    80201fd8:	60e2                	ld	ra,24(sp)
    80201fda:	6442                	ld	s0,16(sp)
    80201fdc:	64a2                	ld	s1,8(sp)
    80201fde:	6105                	addi	sp,sp,32
    80201fe0:	8082                	ret
        panic("");
    80201fe2:	00002517          	auipc	a0,0x2
    80201fe6:	11650513          	addi	a0,a0,278 # 802040f8 <e_text+0xf8>
    80201fea:	ffffe097          	auipc	ra,0xffffe
    80201fee:	094080e7          	jalr	148(ra) # 8020007e <panic>
    80201ff2:	bf4d                	j	80201fa4 <allocproc+0x56>

0000000080201ff4 <scheduler>:

void
scheduler(void)
{
    80201ff4:	715d                	addi	sp,sp,-80
    80201ff6:	e486                	sd	ra,72(sp)
    80201ff8:	e0a2                	sd	s0,64(sp)
    80201ffa:	fc26                	sd	s1,56(sp)
    80201ffc:	f84a                	sd	s2,48(sp)
    80201ffe:	f44e                	sd	s3,40(sp)
    80202000:	f052                	sd	s4,32(sp)
    80202002:	ec56                	sd	s5,24(sp)
    80202004:	e85a                	sd	s6,16(sp)
    80202006:	e45e                	sd	s7,8(sp)
    80202008:	e062                	sd	s8,0(sp)
    8020200a:	0880                	addi	s0,sp,80
        int all_done = 1;
        for(p = pool; p < &pool[NPROC]; p++) {
            if(p->state == RUNNABLE) {
                all_done = 0;
                p->state = RUNNING;
                current_proc = p;
    8020200c:	00123c17          	auipc	s8,0x123
    80202010:	0d4c0c13          	addi	s8,s8,212 # 803250e0 <current_proc>
                curr_pid = p->pid;
    80202014:	00123b97          	auipc	s7,0x123
    80202018:	0c4b8b93          	addi	s7,s7,196 # 803250d8 <curr_pid>
                // info("switch to next proc %d\n", p->pid);
                swtch(&idle.context, &p->context);
    8020201c:	00015b17          	auipc	s6,0x15
    80202020:	7e4b0b13          	addi	s6,s6,2020 # 80217800 <idle+0x30>
                all_done = 0;
    80202024:	4a81                	li	s5,0
        for(p = pool; p < &pool[NPROC]; p++) {
    80202026:	00123997          	auipc	s3,0x123
    8020202a:	08a98993          	addi	s3,s3,138 # 803250b0 <fin>
    8020202e:	a80d                	j	80202060 <scheduler+0x6c>
    80202030:	0d848493          	addi	s1,s1,216
    80202034:	03348563          	beq	s1,s3,8020205e <scheduler+0x6a>
            if(p->state == RUNNABLE) {
    80202038:	409c                	lw	a5,0(s1)
    8020203a:	ff279be3          	bne	a5,s2,80202030 <scheduler+0x3c>
                p->state = RUNNING;
    8020203e:	0144a023          	sw	s4,0(s1)
                current_proc = p;
    80202042:	009c3023          	sd	s1,0(s8)
                curr_pid = p->pid;
    80202046:	449c                	lw	a5,8(s1)
    80202048:	00fba023          	sw	a5,0(s7)
                swtch(&idle.context, &p->context);
    8020204c:	03048593          	addi	a1,s1,48
    80202050:	855a                	mv	a0,s6
    80202052:	ffffe097          	auipc	ra,0xffffe
    80202056:	fba080e7          	jalr	-70(ra) # 8020000c <swtch>
                all_done = 0;
    8020205a:	8756                	mv	a4,s5
    8020205c:	bfd1                	j	80202030 <scheduler+0x3c>
            }
        }
        if(all_done)
    8020205e:	eb09                	bnez	a4,80202070 <scheduler+0x7c>
        int all_done = 1;
    80202060:	4705                	li	a4,1
        for(p = pool; p < &pool[NPROC]; p++) {
    80202062:	00116497          	auipc	s1,0x116
    80202066:	84e48493          	addi	s1,s1,-1970 # 803178b0 <pool>
            if(p->state == RUNNABLE) {
    8020206a:	490d                	li	s2,3
                p->state = RUNNING;
    8020206c:	4a11                	li	s4,4
    8020206e:	b7e9                	j	80202038 <scheduler+0x44>
            panic("all apps over\n");
    80202070:	00002517          	auipc	a0,0x2
    80202074:	50050513          	addi	a0,a0,1280 # 80204570 <digits+0x78>
    80202078:	ffffe097          	auipc	ra,0xffffe
    8020207c:	006080e7          	jalr	6(ra) # 8020007e <panic>
    80202080:	b7c5                	j	80202060 <scheduler+0x6c>

0000000080202082 <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    80202082:	1101                	addi	sp,sp,-32
    80202084:	ec06                	sd	ra,24(sp)
    80202086:	e822                	sd	s0,16(sp)
    80202088:	e426                	sd	s1,8(sp)
    8020208a:	1000                	addi	s0,sp,32
    struct proc *p = curr_proc();
    8020208c:	00000097          	auipc	ra,0x0
    80202090:	d14080e7          	jalr	-748(ra) # 80201da0 <curr_proc>
    80202094:	84aa                	mv	s1,a0
    if(p->state == RUNNING)
    80202096:	4118                	lw	a4,0(a0)
    80202098:	4791                	li	a5,4
    8020209a:	02f70163          	beq	a4,a5,802020bc <sched+0x3a>
        panic("sched running");
    swtch(&p->context, &idle.context);
    8020209e:	00015597          	auipc	a1,0x15
    802020a2:	76258593          	addi	a1,a1,1890 # 80217800 <idle+0x30>
    802020a6:	03048513          	addi	a0,s1,48
    802020aa:	ffffe097          	auipc	ra,0xffffe
    802020ae:	f62080e7          	jalr	-158(ra) # 8020000c <swtch>
}
    802020b2:	60e2                	ld	ra,24(sp)
    802020b4:	6442                	ld	s0,16(sp)
    802020b6:	64a2                	ld	s1,8(sp)
    802020b8:	6105                	addi	sp,sp,32
    802020ba:	8082                	ret
        panic("sched running");
    802020bc:	00002517          	auipc	a0,0x2
    802020c0:	4c450513          	addi	a0,a0,1220 # 80204580 <digits+0x88>
    802020c4:	ffffe097          	auipc	ra,0xffffe
    802020c8:	fba080e7          	jalr	-70(ra) # 8020007e <panic>
    802020cc:	bfc9                	j	8020209e <sched+0x1c>

00000000802020ce <yield>:

// Give up the CPU for one scheduling round.
void yield(void)
{
    802020ce:	1141                	addi	sp,sp,-16
    802020d0:	e406                	sd	ra,8(sp)
    802020d2:	e022                	sd	s0,0(sp)
    802020d4:	0800                	addi	s0,sp,16
    current_proc->state = RUNNABLE;
    802020d6:	00123797          	auipc	a5,0x123
    802020da:	00a7b783          	ld	a5,10(a5) # 803250e0 <current_proc>
    802020de:	470d                	li	a4,3
    802020e0:	c398                	sw	a4,0(a5)
    sched();
    802020e2:	00000097          	auipc	ra,0x0
    802020e6:	fa0080e7          	jalr	-96(ra) # 80202082 <sched>
}
    802020ea:	60a2                	ld	ra,8(sp)
    802020ec:	6402                	ld	s0,0(sp)
    802020ee:	0141                	addi	sp,sp,16
    802020f0:	8082                	ret

00000000802020f2 <fork>:

int
fork(void)
{
    802020f2:	1101                	addi	sp,sp,-32
    802020f4:	ec06                	sd	ra,24(sp)
    802020f6:	e822                	sd	s0,16(sp)
    802020f8:	e426                	sd	s1,8(sp)
    802020fa:	e04a                	sd	s2,0(sp)
    802020fc:	1000                	addi	s0,sp,32
    int pid;
    struct proc *np;
    struct proc *p = curr_proc();
    802020fe:	00000097          	auipc	ra,0x0
    80202102:	ca2080e7          	jalr	-862(ra) # 80201da0 <curr_proc>
    80202106:	892a                	mv	s2,a0

    // Allocate process.
    if((np = allocproc()) == 0){
    80202108:	00000097          	auipc	ra,0x0
    8020210c:	e46080e7          	jalr	-442(ra) # 80201f4e <allocproc>
    80202110:	84aa                	mv	s1,a0
    80202112:	c13d                	beqz	a0,80202178 <fork+0x86>
        panic("allocproc\n");
    }

    // Copy user memory from parent to child.
    if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    80202114:	0a093603          	ld	a2,160(s2)
    80202118:	688c                	ld	a1,16(s1)
    8020211a:	01093503          	ld	a0,16(s2)
    8020211e:	fffff097          	auipc	ra,0xfffff
    80202122:	5b2080e7          	jalr	1458(ra) # 802016d0 <uvmcopy>
    80202126:	06054263          	bltz	a0,8020218a <fork+0x98>
        panic("uvmcopy\n");
    }
    np->sz = p->sz;
    8020212a:	0a093783          	ld	a5,160(s2)
    8020212e:	f0dc                	sd	a5,160(s1)

    // copy saved user registers.
    *(np->trapframe) = *(p->trapframe);
    80202130:	02893683          	ld	a3,40(s2)
    80202134:	87b6                	mv	a5,a3
    80202136:	7498                	ld	a4,40(s1)
    80202138:	12068693          	addi	a3,a3,288
    8020213c:	0007b803          	ld	a6,0(a5)
    80202140:	6788                	ld	a0,8(a5)
    80202142:	6b8c                	ld	a1,16(a5)
    80202144:	6f90                	ld	a2,24(a5)
    80202146:	01073023          	sd	a6,0(a4) # 1000 <_entry-0x801ff000>
    8020214a:	e708                	sd	a0,8(a4)
    8020214c:	eb0c                	sd	a1,16(a4)
    8020214e:	ef10                	sd	a2,24(a4)
    80202150:	02078793          	addi	a5,a5,32
    80202154:	02070713          	addi	a4,a4,32
    80202158:	fed792e3          	bne	a5,a3,8020213c <fork+0x4a>

    // Cause fork to return 0 in the child.
    np->trapframe->a0 = 0;
    8020215c:	749c                	ld	a5,40(s1)
    8020215e:	0607b823          	sd	zero,112(a5)
    pid = np->pid;
    np->parent = p;
    80202162:	0b24b423          	sd	s2,168(s1)
    np->state = RUNNABLE;
    80202166:	478d                	li	a5,3
    80202168:	c09c                	sw	a5,0(s1)
    return pid;
}
    8020216a:	4488                	lw	a0,8(s1)
    8020216c:	60e2                	ld	ra,24(sp)
    8020216e:	6442                	ld	s0,16(sp)
    80202170:	64a2                	ld	s1,8(sp)
    80202172:	6902                	ld	s2,0(sp)
    80202174:	6105                	addi	sp,sp,32
    80202176:	8082                	ret
        panic("allocproc\n");
    80202178:	00002517          	auipc	a0,0x2
    8020217c:	41850513          	addi	a0,a0,1048 # 80204590 <digits+0x98>
    80202180:	ffffe097          	auipc	ra,0xffffe
    80202184:	efe080e7          	jalr	-258(ra) # 8020007e <panic>
    80202188:	b771                	j	80202114 <fork+0x22>
        panic("uvmcopy\n");
    8020218a:	00002517          	auipc	a0,0x2
    8020218e:	41650513          	addi	a0,a0,1046 # 802045a0 <digits+0xa8>
    80202192:	ffffe097          	auipc	ra,0xffffe
    80202196:	eec080e7          	jalr	-276(ra) # 8020007e <panic>
    8020219a:	bf41                	j	8020212a <fork+0x38>

000000008020219c <exec>:

int exec(char* name) {
    8020219c:	1101                	addi	sp,sp,-32
    8020219e:	ec06                	sd	ra,24(sp)
    802021a0:	e822                	sd	s0,16(sp)
    802021a2:	e426                	sd	s1,8(sp)
    802021a4:	e04a                	sd	s2,0(sp)
    802021a6:	1000                	addi	s0,sp,32
    int id = get_id_by_name(name);
    802021a8:	ffffe097          	auipc	ra,0xffffe
    802021ac:	3a8080e7          	jalr	936(ra) # 80200550 <get_id_by_name>
    if(id < 0)
    802021b0:	04054d63          	bltz	a0,8020220a <exec+0x6e>
    802021b4:	892a                	mv	s2,a0
        return -1;
    struct proc *p = curr_proc();
    802021b6:	00000097          	auipc	ra,0x0
    802021ba:	bea080e7          	jalr	-1046(ra) # 80201da0 <curr_proc>
    802021be:	84aa                	mv	s1,a0
    proc_freepagetable(p->pagetable, p->sz);
    802021c0:	714c                	ld	a1,160(a0)
    802021c2:	6908                	ld	a0,16(a0)
    802021c4:	00000097          	auipc	ra,0x0
    802021c8:	d38080e7          	jalr	-712(ra) # 80201efc <proc_freepagetable>
    p->sz = 0;
    802021cc:	0a04b023          	sd	zero,160(s1)
    p->pagetable = proc_pagetable(p);
    802021d0:	8526                	mv	a0,s1
    802021d2:	00000097          	auipc	ra,0x0
    802021d6:	c6e080e7          	jalr	-914(ra) # 80201e40 <proc_pagetable>
    802021da:	e888                	sd	a0,16(s1)
    if(p->pagetable == 0){
    802021dc:	cd11                	beqz	a0,802021f8 <exec+0x5c>
        panic("");
    }
    loader(id, p);
    802021de:	85a6                	mv	a1,s1
    802021e0:	854a                	mv	a0,s2
    802021e2:	ffffe097          	auipc	ra,0xffffe
    802021e6:	592080e7          	jalr	1426(ra) # 80200774 <loader>
    return 0;
    802021ea:	4501                	li	a0,0
}
    802021ec:	60e2                	ld	ra,24(sp)
    802021ee:	6442                	ld	s0,16(sp)
    802021f0:	64a2                	ld	s1,8(sp)
    802021f2:	6902                	ld	s2,0(sp)
    802021f4:	6105                	addi	sp,sp,32
    802021f6:	8082                	ret
        panic("");
    802021f8:	00002517          	auipc	a0,0x2
    802021fc:	f0050513          	addi	a0,a0,-256 # 802040f8 <e_text+0xf8>
    80202200:	ffffe097          	auipc	ra,0xffffe
    80202204:	e7e080e7          	jalr	-386(ra) # 8020007e <panic>
    80202208:	bfd9                	j	802021de <exec+0x42>
        return -1;
    8020220a:	557d                	li	a0,-1
    8020220c:	b7c5                	j	802021ec <exec+0x50>

000000008020220e <wait>:

int
wait(int pid, int* code)
{
    8020220e:	715d                	addi	sp,sp,-80
    80202210:	e486                	sd	ra,72(sp)
    80202212:	e0a2                	sd	s0,64(sp)
    80202214:	fc26                	sd	s1,56(sp)
    80202216:	f84a                	sd	s2,48(sp)
    80202218:	f44e                	sd	s3,40(sp)
    8020221a:	f052                	sd	s4,32(sp)
    8020221c:	ec56                	sd	s5,24(sp)
    8020221e:	e85a                	sd	s6,16(sp)
    80202220:	e45e                	sd	s7,8(sp)
    80202222:	e062                	sd	s8,0(sp)
    80202224:	0880                	addi	s0,sp,80
    80202226:	89aa                	mv	s3,a0
    80202228:	8b2e                	mv	s6,a1
    struct proc *np;
    int havekids;
    struct proc *p = curr_proc();
    8020222a:	00000097          	auipc	ra,0x0
    8020222e:	b76080e7          	jalr	-1162(ra) # 80201da0 <curr_proc>
    80202232:	892a                	mv	s2,a0

    for(;;){
        // Scan through table looking for exited children.
        havekids = 0;
    80202234:	4b81                	li	s7,0
        for(np = pool; np < &pool[NPROC]; np++){
            if(np->state != UNUSED && np->parent == p && (pid <= 0 || np->pid == pid)){
                havekids = 1;
                if(np->state == ZOMBIE){
    80202236:	4a15                	li	s4,5
                havekids = 1;
    80202238:	4a85                	li	s5,1
        for(np = pool; np < &pool[NPROC]; np++){
    8020223a:	00123497          	auipc	s1,0x123
    8020223e:	e7648493          	addi	s1,s1,-394 # 803250b0 <fin>
            }
        }
        if(!havekids){
            return -1;
        }
        p->state = RUNNABLE;
    80202242:	4c0d                	li	s8,3
        havekids = 0;
    80202244:	865e                	mv	a2,s7
        for(np = pool; np < &pool[NPROC]; np++){
    80202246:	00115797          	auipc	a5,0x115
    8020224a:	66a78793          	addi	a5,a5,1642 # 803178b0 <pool>
    8020224e:	a801                	j	8020225e <wait+0x50>
                if(np->state == ZOMBIE){
    80202250:	03470263          	beq	a4,s4,80202274 <wait+0x66>
                havekids = 1;
    80202254:	8656                	mv	a2,s5
        for(np = pool; np < &pool[NPROC]; np++){
    80202256:	0d878793          	addi	a5,a5,216
    8020225a:	02978463          	beq	a5,s1,80202282 <wait+0x74>
            if(np->state != UNUSED && np->parent == p && (pid <= 0 || np->pid == pid)){
    8020225e:	4398                	lw	a4,0(a5)
    80202260:	db7d                	beqz	a4,80202256 <wait+0x48>
    80202262:	77d4                	ld	a3,168(a5)
    80202264:	ff2699e3          	bne	a3,s2,80202256 <wait+0x48>
    80202268:	ff3054e3          	blez	s3,80202250 <wait+0x42>
    8020226c:	4794                	lw	a3,8(a5)
    8020226e:	ff3694e3          	bne	a3,s3,80202256 <wait+0x48>
    80202272:	bff9                	j	80202250 <wait+0x42>
                    np->state = UNUSED;
    80202274:	0007a023          	sw	zero,0(a5)
                    pid = np->pid;
    80202278:	4788                	lw	a0,8(a5)
                    *code = np->exit_code;
    8020227a:	7bdc                	ld	a5,176(a5)
    8020227c:	00fb2023          	sw	a5,0(s6)
                    return pid;
    80202280:	a019                	j	80202286 <wait+0x78>
        if(!havekids){
    80202282:	ee11                	bnez	a2,8020229e <wait+0x90>
            return -1;
    80202284:	557d                	li	a0,-1
        sched();
    }
}
    80202286:	60a6                	ld	ra,72(sp)
    80202288:	6406                	ld	s0,64(sp)
    8020228a:	74e2                	ld	s1,56(sp)
    8020228c:	7942                	ld	s2,48(sp)
    8020228e:	79a2                	ld	s3,40(sp)
    80202290:	7a02                	ld	s4,32(sp)
    80202292:	6ae2                	ld	s5,24(sp)
    80202294:	6b42                	ld	s6,16(sp)
    80202296:	6ba2                	ld	s7,8(sp)
    80202298:	6c02                	ld	s8,0(sp)
    8020229a:	6161                	addi	sp,sp,80
    8020229c:	8082                	ret
        p->state = RUNNABLE;
    8020229e:	01892023          	sw	s8,0(s2)
        sched();
    802022a2:	00000097          	auipc	ra,0x0
    802022a6:	de0080e7          	jalr	-544(ra) # 80202082 <sched>
        havekids = 0;
    802022aa:	bf69                	j	80202244 <wait+0x36>

00000000802022ac <exit>:

void exit(int code) {
    802022ac:	1101                	addi	sp,sp,-32
    802022ae:	ec06                	sd	ra,24(sp)
    802022b0:	e822                	sd	s0,16(sp)
    802022b2:	e426                	sd	s1,8(sp)
    802022b4:	e04a                	sd	s2,0(sp)
    802022b6:	1000                	addi	s0,sp,32
    802022b8:	892a                	mv	s2,a0
    struct proc *p = curr_proc();
    802022ba:	00000097          	auipc	ra,0x0
    802022be:	ae6080e7          	jalr	-1306(ra) # 80201da0 <curr_proc>
    802022c2:	84aa                	mv	s1,a0
    p->exit_code = code;
    802022c4:	0b253823          	sd	s2,176(a0)
    info("proc %d exit with %d\n", p->pid, code);
    802022c8:	00004717          	auipc	a4,0x4
    802022cc:	f4872703          	lw	a4,-184(a4) # 80206210 <debug_level>
    802022d0:	4785                	li	a5,1
    802022d2:	04e7d963          	bge	a5,a4,80202324 <exit+0x78>
    if(p->trapframe)
    802022d6:	7488                	ld	a0,40(s1)
    802022d8:	c509                	beqz	a0,802022e2 <exit+0x36>
        kfree((void*)p->trapframe);
    802022da:	00000097          	auipc	ra,0x0
    802022de:	960080e7          	jalr	-1696(ra) # 80201c3a <kfree>
    p->trapframe = 0;
    802022e2:	0204b423          	sd	zero,40(s1)
    if(p->pagetable)
    802022e6:	6888                	ld	a0,16(s1)
    802022e8:	c511                	beqz	a0,802022f4 <exit+0x48>
        proc_freepagetable(p->pagetable, p->sz);
    802022ea:	70cc                	ld	a1,160(s1)
    802022ec:	00000097          	auipc	ra,0x0
    802022f0:	c10080e7          	jalr	-1008(ra) # 80201efc <proc_freepagetable>
    p->pagetable = 0;
    802022f4:	0004b823          	sd	zero,16(s1)
    p->state = UNUSED;
    802022f8:	0004a023          	sw	zero,0(s1)
    freeproc(p);
    if(p->parent != 0) {
    802022fc:	74dc                	ld	a5,168(s1)
    802022fe:	cb89                	beqz	a5,80202310 <exit+0x64>
        trace("wait for parent to clean\n");
    80202300:	00004797          	auipc	a5,0x4
    80202304:	f107a783          	lw	a5,-240(a5) # 80206210 <debug_level>
    80202308:	04f05563          	blez	a5,80202352 <exit+0xa6>
        p->state = ZOMBIE;
    8020230c:	4795                	li	a5,5
    8020230e:	c09c                	sw	a5,0(s1)
    }
    sched();
    80202310:	00000097          	auipc	ra,0x0
    80202314:	d72080e7          	jalr	-654(ra) # 80202082 <sched>
}
    80202318:	60e2                	ld	ra,24(sp)
    8020231a:	6442                	ld	s0,16(sp)
    8020231c:	64a2                	ld	s1,8(sp)
    8020231e:	6902                	ld	s2,0(sp)
    80202320:	6105                	addi	sp,sp,32
    80202322:	8082                	ret
    info("proc %d exit with %d\n", p->pid, code);
    80202324:	87ca                	mv	a5,s2
    80202326:	4518                	lw	a4,8(a0)
    80202328:	00123697          	auipc	a3,0x123
    8020232c:	db06a683          	lw	a3,-592(a3) # 803250d8 <curr_pid>
    80202330:	00003617          	auipc	a2,0x3
    80202334:	cd863603          	ld	a2,-808(a2) # 80205008 <LEVEL+0x8>
    80202338:	00003597          	auipc	a1,0x3
    8020233c:	cec5a583          	lw	a1,-788(a1) # 80205024 <COLOR+0x4>
    80202340:	00002517          	auipc	a0,0x2
    80202344:	27050513          	addi	a0,a0,624 # 802045b0 <digits+0xb8>
    80202348:	fffff097          	auipc	ra,0xfffff
    8020234c:	6d2080e7          	jalr	1746(ra) # 80201a1a <printf>
    80202350:	b759                	j	802022d6 <exit+0x2a>
        trace("wait for parent to clean\n");
    80202352:	00123697          	auipc	a3,0x123
    80202356:	d866a683          	lw	a3,-634(a3) # 803250d8 <curr_pid>
    8020235a:	00003617          	auipc	a2,0x3
    8020235e:	ca663603          	ld	a2,-858(a2) # 80205000 <LEVEL>
    80202362:	00003597          	auipc	a1,0x3
    80202366:	cbe5a583          	lw	a1,-834(a1) # 80205020 <COLOR>
    8020236a:	00002517          	auipc	a0,0x2
    8020236e:	26e50513          	addi	a0,a0,622 # 802045d8 <digits+0xe0>
    80202372:	fffff097          	auipc	ra,0xfffff
    80202376:	6a8080e7          	jalr	1704(ra) # 80201a1a <printf>
    8020237a:	bf49                	j	8020230c <exit+0x60>

000000008020237c <set_priority>:
uint64 set_priority(int code) {
    struct proc *p = curr_proc();
    // printf("code is %d",code);
    if(code>=2&&code<=2147483647){
    8020237c:	4785                	li	a5,1
    8020237e:	02a7da63          	bge	a5,a0,802023b2 <set_priority+0x36>
uint64 set_priority(int code) {
    80202382:	1101                	addi	sp,sp,-32
    80202384:	ec06                	sd	ra,24(sp)
    80202386:	e822                	sd	s0,16(sp)
    80202388:	e426                	sd	s1,8(sp)
    8020238a:	1000                	addi	s0,sp,32
    8020238c:	84aa                	mv	s1,a0
    struct proc *p = curr_proc();
    8020238e:	00000097          	auipc	ra,0x0
    80202392:	a12080e7          	jalr	-1518(ra) # 80201da0 <curr_proc>
    80202396:	872a                	mv	a4,a0
        p->prio=code;
    80202398:	8526                	mv	a0,s1
    8020239a:	e364                	sd	s1,192(a4)
        p->pass = INT_MAX/p->prio;
    8020239c:	67e1                	lui	a5,0x18
    8020239e:	6a078793          	addi	a5,a5,1696 # 186a0 <_entry-0x801e7960>
    802023a2:	0297d4b3          	divu	s1,a5,s1
    802023a6:	e764                	sd	s1,200(a4)
        return code;
    }
    else{
        return -1;
    }
}
    802023a8:	60e2                	ld	ra,24(sp)
    802023aa:	6442                	ld	s0,16(sp)
    802023ac:	64a2                	ld	s1,8(sp)
    802023ae:	6105                	addi	sp,sp,32
    802023b0:	8082                	ret
        return -1;
    802023b2:	557d                	li	a0,-1
}
    802023b4:	8082                	ret

00000000802023b6 <get_time>:

uint64 get_time(TimeVal* ts, int tz) {
    802023b6:	1101                	addi	sp,sp,-32
    802023b8:	ec06                	sd	ra,24(sp)
    802023ba:	e822                	sd	s0,16(sp)
    802023bc:	e426                	sd	s1,8(sp)
    802023be:	e04a                	sd	s2,0(sp)
    802023c0:	1000                	addi	s0,sp,32
    802023c2:	84aa                	mv	s1,a0
    ts->sec = get_cycle()/12500000;
    802023c4:	00000097          	auipc	ra,0x0
    802023c8:	042080e7          	jalr	66(ra) # 80202406 <get_cycle>
    802023cc:	00bec937          	lui	s2,0xbec
    802023d0:	c2090913          	addi	s2,s2,-992 # bebc20 <_entry-0x7f6143e0>
    802023d4:	03255533          	divu	a0,a0,s2
    802023d8:	e088                	sd	a0,0(s1)
    ts->usec = (get_cycle()%12500000)*10/125;
    802023da:	00000097          	auipc	ra,0x0
    802023de:	02c080e7          	jalr	44(ra) # 80202406 <get_cycle>
    802023e2:	03257533          	remu	a0,a0,s2
    802023e6:	00251793          	slli	a5,a0,0x2
    802023ea:	97aa                	add	a5,a5,a0
    802023ec:	0786                	slli	a5,a5,0x1
    802023ee:	07d00713          	li	a4,125
    802023f2:	02e7d7b3          	divu	a5,a5,a4
    802023f6:	e49c                	sd	a5,8(s1)
    // printf("hi2");
    return 0;
    802023f8:	4501                	li	a0,0
    802023fa:	60e2                	ld	ra,24(sp)
    802023fc:	6442                	ld	s0,16(sp)
    802023fe:	64a2                	ld	s1,8(sp)
    80202400:	6902                	ld	s2,0(sp)
    80202402:	6105                	addi	sp,sp,32
    80202404:	8082                	ret

0000000080202406 <get_cycle>:

const uint64 TICKS_PER_SEC = 100;
const uint64 MSEC_PER_SEC = 1000;
const uint64 CPU_FREQ = 12500000;

uint64 get_cycle() {
    80202406:	1141                	addi	sp,sp,-16
    80202408:	e422                	sd	s0,8(sp)
    8020240a:	0800                	addi	s0,sp,16
    asm volatile("csrr %0, time"
    8020240c:	c0102573          	rdtime	a0
    return r_time();
}
    80202410:	6422                	ld	s0,8(sp)
    80202412:	0141                	addi	sp,sp,16
    80202414:	8082                	ret

0000000080202416 <set_next_timer>:
    w_sie(r_sie() | SIE_STIE);
    set_next_timer();
}

/// Set the next timer interrupt
void set_next_timer() {
    80202416:	1141                	addi	sp,sp,-16
    80202418:	e406                	sd	ra,8(sp)
    8020241a:	e022                	sd	s0,0(sp)
    8020241c:	0800                	addi	s0,sp,16
    8020241e:	c0102573          	rdtime	a0
    // 100Hz @ QEMU
    uint64 timebase = 2500000000ULL;
    set_timer(get_cycle() + timebase);
    80202422:	095037b7          	lui	a5,0x9503
    80202426:	0792                	slli	a5,a5,0x4
    80202428:	90078793          	addi	a5,a5,-1792 # 9502900 <_entry-0x76cfd700>
    8020242c:	953e                	add	a0,a0,a5
    8020242e:	fffff097          	auipc	ra,0xfffff
    80202432:	7f6080e7          	jalr	2038(ra) # 80201c24 <set_timer>
}
    80202436:	60a2                	ld	ra,8(sp)
    80202438:	6402                	ld	s0,0(sp)
    8020243a:	0141                	addi	sp,sp,16
    8020243c:	8082                	ret

000000008020243e <timerinit>:
void timerinit() {
    8020243e:	1141                	addi	sp,sp,-16
    80202440:	e406                	sd	ra,8(sp)
    80202442:	e022                	sd	s0,0(sp)
    80202444:	0800                	addi	s0,sp,16
    asm volatile("csrr %0, sie"
    80202446:	104027f3          	csrr	a5,sie
    w_sie(r_sie() | SIE_STIE);
    8020244a:	0207e793          	ori	a5,a5,32
static inline void w_sie(uint64 x) { asm volatile("csrw sie, %0"
    8020244e:	10479073          	csrw	sie,a5
    set_next_timer();
    80202452:	00000097          	auipc	ra,0x0
    80202456:	fc4080e7          	jalr	-60(ra) # 80202416 <set_next_timer>
}
    8020245a:	60a2                	ld	ra,8(sp)
    8020245c:	6402                	ld	s0,0(sp)
    8020245e:	0141                	addi	sp,sp,16
    80202460:	8082                	ret

0000000080202462 <get_time_ms>:

uint64 get_time_ms() {
    80202462:	1141                	addi	sp,sp,-16
    80202464:	e422                	sd	s0,8(sp)
    80202466:	0800                	addi	s0,sp,16
    asm volatile("csrr %0, time"
    80202468:	c0102573          	rdtime	a0
    return get_cycle() / (CPU_FREQ / MSEC_PER_SEC);
    8020246c:	678d                	lui	a5,0x3
    8020246e:	0d478793          	addi	a5,a5,212 # 30d4 <_entry-0x801fcf2c>
    80202472:	02f55533          	divu	a0,a0,a5
    80202476:	6422                	ld	s0,8(sp)
    80202478:	0141                	addi	sp,sp,16
    8020247a:	8082                	ret
	...

0000000080203000 <trampoline>:
    80203000:	14051573          	csrrw	a0,sscratch,a0
    80203004:	02153423          	sd	ra,40(a0)
    80203008:	02253823          	sd	sp,48(a0)
    8020300c:	02353c23          	sd	gp,56(a0)
    80203010:	04453023          	sd	tp,64(a0)
    80203014:	04553423          	sd	t0,72(a0)
    80203018:	04653823          	sd	t1,80(a0)
    8020301c:	04753c23          	sd	t2,88(a0)
    80203020:	f120                	sd	s0,96(a0)
    80203022:	f524                	sd	s1,104(a0)
    80203024:	fd2c                	sd	a1,120(a0)
    80203026:	e150                	sd	a2,128(a0)
    80203028:	e554                	sd	a3,136(a0)
    8020302a:	e958                	sd	a4,144(a0)
    8020302c:	ed5c                	sd	a5,152(a0)
    8020302e:	0b053023          	sd	a6,160(a0)
    80203032:	0b153423          	sd	a7,168(a0)
    80203036:	0b253823          	sd	s2,176(a0)
    8020303a:	0b353c23          	sd	s3,184(a0)
    8020303e:	0d453023          	sd	s4,192(a0)
    80203042:	0d553423          	sd	s5,200(a0)
    80203046:	0d653823          	sd	s6,208(a0)
    8020304a:	0d753c23          	sd	s7,216(a0)
    8020304e:	0f853023          	sd	s8,224(a0)
    80203052:	0f953423          	sd	s9,232(a0)
    80203056:	0fa53823          	sd	s10,240(a0)
    8020305a:	0fb53c23          	sd	s11,248(a0)
    8020305e:	11c53023          	sd	t3,256(a0)
    80203062:	11d53423          	sd	t4,264(a0)
    80203066:	11e53823          	sd	t5,272(a0)
    8020306a:	11f53c23          	sd	t6,280(a0)
    8020306e:	140022f3          	csrr	t0,sscratch
    80203072:	06553823          	sd	t0,112(a0)
    80203076:	14102373          	csrr	t1,sepc
    8020307a:	00653c23          	sd	t1,24(a0)
    8020307e:	00853103          	ld	sp,8(a0)
    80203082:	02053203          	ld	tp,32(a0)
    80203086:	01053283          	ld	t0,16(a0)
    8020308a:	00053303          	ld	t1,0(a0)
    8020308e:	18031073          	csrw	satp,t1
    80203092:	12000073          	sfence.vma
    80203096:	8282                	jr	t0

0000000080203098 <userret>:
    80203098:	18059073          	csrw	satp,a1
    8020309c:	12000073          	sfence.vma
    802030a0:	07053283          	ld	t0,112(a0)
    802030a4:	14029073          	csrw	sscratch,t0
    802030a8:	02853083          	ld	ra,40(a0)
    802030ac:	03053103          	ld	sp,48(a0)
    802030b0:	03853183          	ld	gp,56(a0)
    802030b4:	04053203          	ld	tp,64(a0)
    802030b8:	04853283          	ld	t0,72(a0)
    802030bc:	05053303          	ld	t1,80(a0)
    802030c0:	05853383          	ld	t2,88(a0)
    802030c4:	7120                	ld	s0,96(a0)
    802030c6:	7524                	ld	s1,104(a0)
    802030c8:	7d2c                	ld	a1,120(a0)
    802030ca:	6150                	ld	a2,128(a0)
    802030cc:	6554                	ld	a3,136(a0)
    802030ce:	6958                	ld	a4,144(a0)
    802030d0:	6d5c                	ld	a5,152(a0)
    802030d2:	0a053803          	ld	a6,160(a0)
    802030d6:	0a853883          	ld	a7,168(a0)
    802030da:	0b053903          	ld	s2,176(a0)
    802030de:	0b853983          	ld	s3,184(a0)
    802030e2:	0c053a03          	ld	s4,192(a0)
    802030e6:	0c853a83          	ld	s5,200(a0)
    802030ea:	0d053b03          	ld	s6,208(a0)
    802030ee:	0d853b83          	ld	s7,216(a0)
    802030f2:	0e053c03          	ld	s8,224(a0)
    802030f6:	0e853c83          	ld	s9,232(a0)
    802030fa:	0f053d03          	ld	s10,240(a0)
    802030fe:	0f853d83          	ld	s11,248(a0)
    80203102:	10053e03          	ld	t3,256(a0)
    80203106:	10853e83          	ld	t4,264(a0)
    8020310a:	11053f03          	ld	t5,272(a0)
    8020310e:	11853f83          	ld	t6,280(a0)
    80203112:	14051573          	csrrw	a0,sscratch,a0
    80203116:	10200073          	sret
	...
