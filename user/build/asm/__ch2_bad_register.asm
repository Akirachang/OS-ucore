
/home/akira/Desktop/compare/OS2/user/build/riscv64/__ch2_bad_register:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	00c0006f          	j	100e <__start_main>

0000000000001006 <main>:
#include <unistd.h>

int main(void)
{
    uint64 x;
    asm volatile("csrr %0, sstatus": "=r"(x));
    1006:	100027f3          	csrr	a5,sstatus
    return 0;
    100a:	4501                	li	a0,0
    100c:	8082                	ret

000000000000100e <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    100e:	1141                	addi	sp,sp,-16
    1010:	e406                	sd	ra,8(sp)
    exit(main());
    1012:	ff5ff0ef          	jal	ra,1006 <main>
    1016:	05e000ef          	jal	ra,1074 <exit>
    return 0;
}
    101a:	60a2                	ld	ra,8(sp)
    101c:	4501                	li	a0,0
    101e:	0141                	addi	sp,sp,16
    1020:	8082                	ret

0000000000001022 <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1022:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1026:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1028:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    102c:	2501                	sext.w	a0,a0
    102e:	8082                	ret

0000000000001030 <close>:
    register long a7 __asm__("a7") = n;
    1030:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1034:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1038:	2501                	sext.w	a0,a0
    103a:	8082                	ret

000000000000103c <read>:
    register long a7 __asm__("a7") = n;
    103c:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1040:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1044:	8082                	ret

0000000000001046 <write>:
    register long a7 __asm__("a7") = n;
    1046:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    104a:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    104e:	8082                	ret

0000000000001050 <getpid>:
    register long a7 __asm__("a7") = n;
    1050:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1054:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1058:	2501                	sext.w	a0,a0
    105a:	8082                	ret

000000000000105c <sched_yield>:
    register long a7 __asm__("a7") = n;
    105c:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1060:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1064:	2501                	sext.w	a0,a0
    1066:	8082                	ret

0000000000001068 <fork>:
    register long a7 __asm__("a7") = n;
    1068:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    106c:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1070:	2501                	sext.w	a0,a0
    1072:	8082                	ret

0000000000001074 <exit>:
    register long a7 __asm__("a7") = n;
    1074:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1078:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    107c:	8082                	ret

000000000000107e <waitpid>:
    register long a7 __asm__("a7") = n;
    107e:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1082:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1086:	2501                	sext.w	a0,a0
    1088:	8082                	ret

000000000000108a <exec>:
    register long a7 __asm__("a7") = n;
    108a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    108e:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1092:	2501                	sext.w	a0,a0
    1094:	8082                	ret

0000000000001096 <get_time>:

int64 get_time()
{
    1096:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1098:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    109c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    109e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    10a0:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    10a4:	2501                	sext.w	a0,a0
    10a6:	ed09                	bnez	a0,10c0 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    10a8:	67a2                	ld	a5,8(sp)
    10aa:	3e800713          	li	a4,1000
    10ae:	00015503          	lhu	a0,0(sp)
    10b2:	02e7d7b3          	divu	a5,a5,a4
    10b6:	02e50533          	mul	a0,a0,a4
    10ba:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    10bc:	0141                	addi	sp,sp,16
    10be:	8082                	ret
        return -1;
    10c0:	557d                	li	a0,-1
    10c2:	bfed                	j	10bc <get_time+0x26>

00000000000010c4 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    10c4:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    10c8:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    10cc:	2501                	sext.w	a0,a0
    10ce:	8082                	ret

00000000000010d0 <sleep>:

int sleep(unsigned long long time)
{
    10d0:	1141                	addi	sp,sp,-16
    10d2:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    10d4:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    10d8:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    10da:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    10dc:	00000073          	ecall
    if (err == 0)
    10e0:	2501                	sext.w	a0,a0
    10e2:	e13d                	bnez	a0,1148 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    10e4:	6722                	ld	a4,8(sp)
    10e6:	3e800693          	li	a3,1000
    10ea:	00015783          	lhu	a5,0(sp)
    10ee:	02d75733          	divu	a4,a4,a3
    10f2:	02d787b3          	mul	a5,a5,a3
    10f6:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    10f8:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    10fc:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    10fe:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1100:	00000073          	ecall
    if (err == 0)
    1104:	2501                	sext.w	a0,a0
    1106:	ed15                	bnez	a0,1142 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1108:	6841                	lui	a6,0x10
    110a:	963e                	add	a2,a2,a5
    110c:	187d                	addi	a6,a6,-1
    110e:	3e800693          	li	a3,1000
    1112:	a819                	j	1128 <sleep+0x58>
    __asm_syscall("r"(a7))
    1114:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1118:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    111c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    111e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1120:	00000073          	ecall
    if (err == 0)
    1124:	2501                	sext.w	a0,a0
    1126:	ed11                	bnez	a0,1142 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1128:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    112a:	07c00893          	li	a7,124
    112e:	02d7d733          	divu	a4,a5,a3
    1132:	6782                	ld	a5,0(sp)
    1134:	0107f7b3          	and	a5,a5,a6
    1138:	02d787b3          	mul	a5,a5,a3
    113c:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    113e:	fcc7ebe3          	bltu	a5,a2,1114 <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1142:	4501                	li	a0,0
    1144:	0141                	addi	sp,sp,16
    1146:	8082                	ret
    1148:	57fd                	li	a5,-1
    114a:	b77d                	j	10f8 <sleep+0x28>

000000000000114c <set_priority>:
    register long a7 __asm__("a7") = n;
    114c:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1150:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1154:	2501                	sext.w	a0,a0
    1156:	8082                	ret

0000000000001158 <mmap>:
    register long a7 __asm__("a7") = n;
    1158:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    115c:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1160:	2501                	sext.w	a0,a0
    1162:	8082                	ret

0000000000001164 <munmap>:
    register long a7 __asm__("a7") = n;
    1164:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1168:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    116c:	2501                	sext.w	a0,a0
    116e:	8082                	ret

0000000000001170 <wait>:

int wait(int *code)
{
    1170:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1172:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1176:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1178:	00000073          	ecall
    return waitpid(-1, code);
}
    117c:	2501                	sext.w	a0,a0
    117e:	8082                	ret

0000000000001180 <spawn>:
    register long a7 __asm__("a7") = n;
    1180:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1184:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1188:	2501                	sext.w	a0,a0
    118a:	8082                	ret

000000000000118c <mailread>:
    register long a7 __asm__("a7") = n;
    118c:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1190:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1194:	2501                	sext.w	a0,a0
    1196:	8082                	ret

0000000000001198 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1198:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    119c:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    11a0:	2501                	sext.w	a0,a0
    11a2:	8082                	ret

00000000000011a4 <fstat>:
    register long a7 __asm__("a7") = n;
    11a4:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    11a8:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    11ac:	2501                	sext.w	a0,a0
    11ae:	8082                	ret

00000000000011b0 <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    11b0:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    11b2:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    11b6:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    11b8:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    11bc:	2501                	sext.w	a0,a0
    11be:	8082                	ret

00000000000011c0 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    11c0:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    11c2:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    11c6:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    11c8:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    11cc:	2501                	sext.w	a0,a0
    11ce:	8082                	ret

00000000000011d0 <link>:

int link(char *old_path, char *new_path)
{
    11d0:	87aa                	mv	a5,a0
    11d2:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    11d4:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    11d8:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    11dc:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    11de:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    11e2:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    11e4:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    11e8:	2501                	sext.w	a0,a0
    11ea:	8082                	ret

00000000000011ec <unlink>:

int unlink(char *path)
{
    11ec:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    11ee:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    11f2:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    11f6:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    11f8:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    11fc:	2501                	sext.w	a0,a0
    11fe:	8082                	ret
