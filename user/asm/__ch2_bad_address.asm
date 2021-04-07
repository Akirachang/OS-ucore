
/home/akira/Desktop/compare/OS2/user/build/riscv64/__ch2_bad_address:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	00a0006f          	j	100c <__start_main>

0000000000001006 <main>:
#include <unistd.h>

int main(void)
{
    int* p = (int*)0;
    *p = 0;
    1006:	00002023          	sw	zero,0(zero) # 0 <_start-0x1000>
    100a:	9002                	ebreak

000000000000100c <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    100c:	1141                	addi	sp,sp,-16
    100e:	e406                	sd	ra,8(sp)
    exit(main());
    1010:	ff7ff0ef          	jal	ra,1006 <main>
    1014:	05e000ef          	jal	ra,1072 <exit>
    return 0;
}
    1018:	60a2                	ld	ra,8(sp)
    101a:	4501                	li	a0,0
    101c:	0141                	addi	sp,sp,16
    101e:	8082                	ret

0000000000001020 <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1020:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1024:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1026:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    102a:	2501                	sext.w	a0,a0
    102c:	8082                	ret

000000000000102e <close>:
    register long a7 __asm__("a7") = n;
    102e:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1032:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1036:	2501                	sext.w	a0,a0
    1038:	8082                	ret

000000000000103a <read>:
    register long a7 __asm__("a7") = n;
    103a:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    103e:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1042:	8082                	ret

0000000000001044 <write>:
    register long a7 __asm__("a7") = n;
    1044:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1048:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    104c:	8082                	ret

000000000000104e <getpid>:
    register long a7 __asm__("a7") = n;
    104e:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1052:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1056:	2501                	sext.w	a0,a0
    1058:	8082                	ret

000000000000105a <sched_yield>:
    register long a7 __asm__("a7") = n;
    105a:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    105e:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1062:	2501                	sext.w	a0,a0
    1064:	8082                	ret

0000000000001066 <fork>:
    register long a7 __asm__("a7") = n;
    1066:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    106a:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    106e:	2501                	sext.w	a0,a0
    1070:	8082                	ret

0000000000001072 <exit>:
    register long a7 __asm__("a7") = n;
    1072:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1076:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    107a:	8082                	ret

000000000000107c <waitpid>:
    register long a7 __asm__("a7") = n;
    107c:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1080:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1084:	2501                	sext.w	a0,a0
    1086:	8082                	ret

0000000000001088 <exec>:
    register long a7 __asm__("a7") = n;
    1088:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    108c:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1090:	2501                	sext.w	a0,a0
    1092:	8082                	ret

0000000000001094 <get_time>:

int64 get_time()
{
    1094:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1096:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    109a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    109c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    109e:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    10a2:	2501                	sext.w	a0,a0
    10a4:	ed09                	bnez	a0,10be <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    10a6:	67a2                	ld	a5,8(sp)
    10a8:	3e800713          	li	a4,1000
    10ac:	00015503          	lhu	a0,0(sp)
    10b0:	02e7d7b3          	divu	a5,a5,a4
    10b4:	02e50533          	mul	a0,a0,a4
    10b8:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    10ba:	0141                	addi	sp,sp,16
    10bc:	8082                	ret
        return -1;
    10be:	557d                	li	a0,-1
    10c0:	bfed                	j	10ba <get_time+0x26>

00000000000010c2 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    10c2:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    10c6:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    10ca:	2501                	sext.w	a0,a0
    10cc:	8082                	ret

00000000000010ce <sleep>:

int sleep(unsigned long long time)
{
    10ce:	1141                	addi	sp,sp,-16
    10d0:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    10d2:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    10d6:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    10d8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    10da:	00000073          	ecall
    if (err == 0)
    10de:	2501                	sext.w	a0,a0
    10e0:	e13d                	bnez	a0,1146 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    10e2:	6722                	ld	a4,8(sp)
    10e4:	3e800693          	li	a3,1000
    10e8:	00015783          	lhu	a5,0(sp)
    10ec:	02d75733          	divu	a4,a4,a3
    10f0:	02d787b3          	mul	a5,a5,a3
    10f4:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    10f6:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    10fa:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    10fc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    10fe:	00000073          	ecall
    if (err == 0)
    1102:	2501                	sext.w	a0,a0
    1104:	ed15                	bnez	a0,1140 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1106:	6841                	lui	a6,0x10
    1108:	963e                	add	a2,a2,a5
    110a:	187d                	addi	a6,a6,-1
    110c:	3e800693          	li	a3,1000
    1110:	a819                	j	1126 <sleep+0x58>
    __asm_syscall("r"(a7))
    1112:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1116:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    111a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    111c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    111e:	00000073          	ecall
    if (err == 0)
    1122:	2501                	sext.w	a0,a0
    1124:	ed11                	bnez	a0,1140 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1126:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1128:	07c00893          	li	a7,124
    112c:	02d7d733          	divu	a4,a5,a3
    1130:	6782                	ld	a5,0(sp)
    1132:	0107f7b3          	and	a5,a5,a6
    1136:	02d787b3          	mul	a5,a5,a3
    113a:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    113c:	fcc7ebe3          	bltu	a5,a2,1112 <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1140:	4501                	li	a0,0
    1142:	0141                	addi	sp,sp,16
    1144:	8082                	ret
    1146:	57fd                	li	a5,-1
    1148:	b77d                	j	10f6 <sleep+0x28>

000000000000114a <set_priority>:
    register long a7 __asm__("a7") = n;
    114a:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    114e:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1152:	2501                	sext.w	a0,a0
    1154:	8082                	ret

0000000000001156 <mmap>:
    register long a7 __asm__("a7") = n;
    1156:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    115a:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    115e:	2501                	sext.w	a0,a0
    1160:	8082                	ret

0000000000001162 <munmap>:
    register long a7 __asm__("a7") = n;
    1162:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1166:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    116a:	2501                	sext.w	a0,a0
    116c:	8082                	ret

000000000000116e <wait>:

int wait(int *code)
{
    116e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1170:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1174:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1176:	00000073          	ecall
    return waitpid(-1, code);
}
    117a:	2501                	sext.w	a0,a0
    117c:	8082                	ret

000000000000117e <spawn>:
    register long a7 __asm__("a7") = n;
    117e:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1182:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1186:	2501                	sext.w	a0,a0
    1188:	8082                	ret

000000000000118a <mailread>:
    register long a7 __asm__("a7") = n;
    118a:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    118e:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1192:	2501                	sext.w	a0,a0
    1194:	8082                	ret

0000000000001196 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1196:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    119a:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    119e:	2501                	sext.w	a0,a0
    11a0:	8082                	ret

00000000000011a2 <fstat>:
    register long a7 __asm__("a7") = n;
    11a2:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    11a6:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    11aa:	2501                	sext.w	a0,a0
    11ac:	8082                	ret

00000000000011ae <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    11ae:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    11b0:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    11b4:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    11b6:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    11ba:	2501                	sext.w	a0,a0
    11bc:	8082                	ret

00000000000011be <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    11be:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    11c0:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    11c4:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    11c6:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    11ca:	2501                	sext.w	a0,a0
    11cc:	8082                	ret

00000000000011ce <link>:

int link(char *old_path, char *new_path)
{
    11ce:	87aa                	mv	a5,a0
    11d0:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    11d2:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    11d6:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    11da:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    11dc:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    11e0:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    11e2:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    11e6:	2501                	sext.w	a0,a0
    11e8:	8082                	ret

00000000000011ea <unlink>:

int unlink(char *path)
{
    11ea:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    11ec:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    11f0:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    11f4:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    11f6:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    11fa:	2501                	sext.w	a0,a0
    11fc:	8082                	ret
