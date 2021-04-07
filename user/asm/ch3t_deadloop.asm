
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch3t_deadloop:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0060006f          	j	1008 <__start_main>

0000000000001006 <main>:
理想结果：执行一段时间之后被正确杀死，不会陷入死循环。
*/

int main()
{
    for (;;)
    1006:	a001                	j	1006 <main>

0000000000001008 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1008:	1141                	addi	sp,sp,-16
    100a:	e406                	sd	ra,8(sp)
    exit(main());
    100c:	ffbff0ef          	jal	ra,1006 <main>
    1010:	05e000ef          	jal	ra,106e <exit>
    return 0;
}
    1014:	60a2                	ld	ra,8(sp)
    1016:	4501                	li	a0,0
    1018:	0141                	addi	sp,sp,16
    101a:	8082                	ret

000000000000101c <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    101c:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1020:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1022:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1026:	2501                	sext.w	a0,a0
    1028:	8082                	ret

000000000000102a <close>:
    register long a7 __asm__("a7") = n;
    102a:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    102e:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1032:	2501                	sext.w	a0,a0
    1034:	8082                	ret

0000000000001036 <read>:
    register long a7 __asm__("a7") = n;
    1036:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    103a:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    103e:	8082                	ret

0000000000001040 <write>:
    register long a7 __asm__("a7") = n;
    1040:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1044:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1048:	8082                	ret

000000000000104a <getpid>:
    register long a7 __asm__("a7") = n;
    104a:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    104e:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1052:	2501                	sext.w	a0,a0
    1054:	8082                	ret

0000000000001056 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1056:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    105a:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    105e:	2501                	sext.w	a0,a0
    1060:	8082                	ret

0000000000001062 <fork>:
    register long a7 __asm__("a7") = n;
    1062:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1066:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    106a:	2501                	sext.w	a0,a0
    106c:	8082                	ret

000000000000106e <exit>:
    register long a7 __asm__("a7") = n;
    106e:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1072:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1076:	8082                	ret

0000000000001078 <waitpid>:
    register long a7 __asm__("a7") = n;
    1078:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    107c:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1080:	2501                	sext.w	a0,a0
    1082:	8082                	ret

0000000000001084 <exec>:
    register long a7 __asm__("a7") = n;
    1084:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1088:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    108c:	2501                	sext.w	a0,a0
    108e:	8082                	ret

0000000000001090 <get_time>:

int64 get_time()
{
    1090:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1092:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1096:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1098:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    109a:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    109e:	2501                	sext.w	a0,a0
    10a0:	ed09                	bnez	a0,10ba <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    10a2:	67a2                	ld	a5,8(sp)
    10a4:	3e800713          	li	a4,1000
    10a8:	00015503          	lhu	a0,0(sp)
    10ac:	02e7d7b3          	divu	a5,a5,a4
    10b0:	02e50533          	mul	a0,a0,a4
    10b4:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    10b6:	0141                	addi	sp,sp,16
    10b8:	8082                	ret
        return -1;
    10ba:	557d                	li	a0,-1
    10bc:	bfed                	j	10b6 <get_time+0x26>

00000000000010be <sys_get_time>:
    register long a7 __asm__("a7") = n;
    10be:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    10c2:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    10c6:	2501                	sext.w	a0,a0
    10c8:	8082                	ret

00000000000010ca <sleep>:

int sleep(unsigned long long time)
{
    10ca:	1141                	addi	sp,sp,-16
    10cc:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    10ce:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    10d2:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    10d4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    10d6:	00000073          	ecall
    if (err == 0)
    10da:	2501                	sext.w	a0,a0
    10dc:	e13d                	bnez	a0,1142 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    10de:	6722                	ld	a4,8(sp)
    10e0:	3e800693          	li	a3,1000
    10e4:	00015783          	lhu	a5,0(sp)
    10e8:	02d75733          	divu	a4,a4,a3
    10ec:	02d787b3          	mul	a5,a5,a3
    10f0:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    10f2:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    10f6:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    10f8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    10fa:	00000073          	ecall
    if (err == 0)
    10fe:	2501                	sext.w	a0,a0
    1100:	ed15                	bnez	a0,113c <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1102:	6841                	lui	a6,0x10
    1104:	963e                	add	a2,a2,a5
    1106:	187d                	addi	a6,a6,-1
    1108:	3e800693          	li	a3,1000
    110c:	a819                	j	1122 <sleep+0x58>
    __asm_syscall("r"(a7))
    110e:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1112:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1116:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1118:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    111a:	00000073          	ecall
    if (err == 0)
    111e:	2501                	sext.w	a0,a0
    1120:	ed11                	bnez	a0,113c <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1122:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1124:	07c00893          	li	a7,124
    1128:	02d7d733          	divu	a4,a5,a3
    112c:	6782                	ld	a5,0(sp)
    112e:	0107f7b3          	and	a5,a5,a6
    1132:	02d787b3          	mul	a5,a5,a3
    1136:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1138:	fcc7ebe3          	bltu	a5,a2,110e <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    113c:	4501                	li	a0,0
    113e:	0141                	addi	sp,sp,16
    1140:	8082                	ret
    1142:	57fd                	li	a5,-1
    1144:	b77d                	j	10f2 <sleep+0x28>

0000000000001146 <set_priority>:
    register long a7 __asm__("a7") = n;
    1146:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    114a:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    114e:	2501                	sext.w	a0,a0
    1150:	8082                	ret

0000000000001152 <mmap>:
    register long a7 __asm__("a7") = n;
    1152:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1156:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    115a:	2501                	sext.w	a0,a0
    115c:	8082                	ret

000000000000115e <munmap>:
    register long a7 __asm__("a7") = n;
    115e:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1162:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1166:	2501                	sext.w	a0,a0
    1168:	8082                	ret

000000000000116a <wait>:

int wait(int *code)
{
    116a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    116c:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1170:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1172:	00000073          	ecall
    return waitpid(-1, code);
}
    1176:	2501                	sext.w	a0,a0
    1178:	8082                	ret

000000000000117a <spawn>:
    register long a7 __asm__("a7") = n;
    117a:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    117e:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1182:	2501                	sext.w	a0,a0
    1184:	8082                	ret

0000000000001186 <mailread>:
    register long a7 __asm__("a7") = n;
    1186:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    118a:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    118e:	2501                	sext.w	a0,a0
    1190:	8082                	ret

0000000000001192 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1192:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1196:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    119a:	2501                	sext.w	a0,a0
    119c:	8082                	ret

000000000000119e <fstat>:
    register long a7 __asm__("a7") = n;
    119e:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    11a2:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    11a6:	2501                	sext.w	a0,a0
    11a8:	8082                	ret

00000000000011aa <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    11aa:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    11ac:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    11b0:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    11b2:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    11b6:	2501                	sext.w	a0,a0
    11b8:	8082                	ret

00000000000011ba <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    11ba:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    11bc:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    11c0:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    11c2:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    11c6:	2501                	sext.w	a0,a0
    11c8:	8082                	ret

00000000000011ca <link>:

int link(char *old_path, char *new_path)
{
    11ca:	87aa                	mv	a5,a0
    11cc:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    11ce:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    11d2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    11d6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    11d8:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    11dc:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    11de:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    11e2:	2501                	sext.w	a0,a0
    11e4:	8082                	ret

00000000000011e6 <unlink>:

int unlink(char *path)
{
    11e6:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    11e8:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    11ec:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    11f0:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    11f2:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    11f6:	2501                	sext.w	a0,a0
    11f8:	8082                	ret
