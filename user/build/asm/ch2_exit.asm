
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch2_exit:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0180006f          	j	101a <__start_main>

0000000000001006 <main>:
const int MAGIC = 1234;

/// 正确输出： 不输出 FAIL，以 1234 退出

int main(void)
{
    1006:	1141                	addi	sp,sp,-16
    exit(MAGIC);
    1008:	4d200513          	li	a0,1234
{
    100c:	e406                	sd	ra,8(sp)
    exit(MAGIC);
    100e:	072000ef          	jal	ra,1080 <exit>
    return 0;
}
    1012:	60a2                	ld	ra,8(sp)
    1014:	4501                	li	a0,0
    1016:	0141                	addi	sp,sp,16
    1018:	8082                	ret

000000000000101a <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    101a:	1141                	addi	sp,sp,-16
    101c:	e406                	sd	ra,8(sp)
    exit(main());
    101e:	fe9ff0ef          	jal	ra,1006 <main>
    1022:	05e000ef          	jal	ra,1080 <exit>
    return 0;
}
    1026:	60a2                	ld	ra,8(sp)
    1028:	4501                	li	a0,0
    102a:	0141                	addi	sp,sp,16
    102c:	8082                	ret

000000000000102e <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    102e:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1032:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1034:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1038:	2501                	sext.w	a0,a0
    103a:	8082                	ret

000000000000103c <close>:
    register long a7 __asm__("a7") = n;
    103c:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1040:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1044:	2501                	sext.w	a0,a0
    1046:	8082                	ret

0000000000001048 <read>:
    register long a7 __asm__("a7") = n;
    1048:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    104c:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1050:	8082                	ret

0000000000001052 <write>:
    register long a7 __asm__("a7") = n;
    1052:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1056:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    105a:	8082                	ret

000000000000105c <getpid>:
    register long a7 __asm__("a7") = n;
    105c:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1060:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1064:	2501                	sext.w	a0,a0
    1066:	8082                	ret

0000000000001068 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1068:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    106c:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1070:	2501                	sext.w	a0,a0
    1072:	8082                	ret

0000000000001074 <fork>:
    register long a7 __asm__("a7") = n;
    1074:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1078:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    107c:	2501                	sext.w	a0,a0
    107e:	8082                	ret

0000000000001080 <exit>:
    register long a7 __asm__("a7") = n;
    1080:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1084:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1088:	8082                	ret

000000000000108a <waitpid>:
    register long a7 __asm__("a7") = n;
    108a:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    108e:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1092:	2501                	sext.w	a0,a0
    1094:	8082                	ret

0000000000001096 <exec>:
    register long a7 __asm__("a7") = n;
    1096:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    109a:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    109e:	2501                	sext.w	a0,a0
    10a0:	8082                	ret

00000000000010a2 <get_time>:

int64 get_time()
{
    10a2:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    10a4:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    10a8:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    10aa:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    10ac:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    10b0:	2501                	sext.w	a0,a0
    10b2:	ed09                	bnez	a0,10cc <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    10b4:	67a2                	ld	a5,8(sp)
    10b6:	3e800713          	li	a4,1000
    10ba:	00015503          	lhu	a0,0(sp)
    10be:	02e7d7b3          	divu	a5,a5,a4
    10c2:	02e50533          	mul	a0,a0,a4
    10c6:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    10c8:	0141                	addi	sp,sp,16
    10ca:	8082                	ret
        return -1;
    10cc:	557d                	li	a0,-1
    10ce:	bfed                	j	10c8 <get_time+0x26>

00000000000010d0 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    10d0:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    10d4:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    10d8:	2501                	sext.w	a0,a0
    10da:	8082                	ret

00000000000010dc <sleep>:

int sleep(unsigned long long time)
{
    10dc:	1141                	addi	sp,sp,-16
    10de:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    10e0:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    10e4:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    10e6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    10e8:	00000073          	ecall
    if (err == 0)
    10ec:	2501                	sext.w	a0,a0
    10ee:	e13d                	bnez	a0,1154 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    10f0:	6722                	ld	a4,8(sp)
    10f2:	3e800693          	li	a3,1000
    10f6:	00015783          	lhu	a5,0(sp)
    10fa:	02d75733          	divu	a4,a4,a3
    10fe:	02d787b3          	mul	a5,a5,a3
    1102:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1104:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1108:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    110a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    110c:	00000073          	ecall
    if (err == 0)
    1110:	2501                	sext.w	a0,a0
    1112:	ed15                	bnez	a0,114e <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1114:	6841                	lui	a6,0x10
    1116:	963e                	add	a2,a2,a5
    1118:	187d                	addi	a6,a6,-1
    111a:	3e800693          	li	a3,1000
    111e:	a819                	j	1134 <sleep+0x58>
    __asm_syscall("r"(a7))
    1120:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1124:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1128:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    112a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    112c:	00000073          	ecall
    if (err == 0)
    1130:	2501                	sext.w	a0,a0
    1132:	ed11                	bnez	a0,114e <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1134:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1136:	07c00893          	li	a7,124
    113a:	02d7d733          	divu	a4,a5,a3
    113e:	6782                	ld	a5,0(sp)
    1140:	0107f7b3          	and	a5,a5,a6
    1144:	02d787b3          	mul	a5,a5,a3
    1148:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    114a:	fcc7ebe3          	bltu	a5,a2,1120 <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    114e:	4501                	li	a0,0
    1150:	0141                	addi	sp,sp,16
    1152:	8082                	ret
    1154:	57fd                	li	a5,-1
    1156:	b77d                	j	1104 <sleep+0x28>

0000000000001158 <set_priority>:
    register long a7 __asm__("a7") = n;
    1158:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    115c:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1160:	2501                	sext.w	a0,a0
    1162:	8082                	ret

0000000000001164 <mmap>:
    register long a7 __asm__("a7") = n;
    1164:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1168:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    116c:	2501                	sext.w	a0,a0
    116e:	8082                	ret

0000000000001170 <munmap>:
    register long a7 __asm__("a7") = n;
    1170:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1174:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1178:	2501                	sext.w	a0,a0
    117a:	8082                	ret

000000000000117c <wait>:

int wait(int *code)
{
    117c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    117e:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1182:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1184:	00000073          	ecall
    return waitpid(-1, code);
}
    1188:	2501                	sext.w	a0,a0
    118a:	8082                	ret

000000000000118c <spawn>:
    register long a7 __asm__("a7") = n;
    118c:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1190:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1194:	2501                	sext.w	a0,a0
    1196:	8082                	ret

0000000000001198 <mailread>:
    register long a7 __asm__("a7") = n;
    1198:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    119c:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    11a0:	2501                	sext.w	a0,a0
    11a2:	8082                	ret

00000000000011a4 <mailwrite>:
    register long a7 __asm__("a7") = n;
    11a4:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    11a8:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    11ac:	2501                	sext.w	a0,a0
    11ae:	8082                	ret

00000000000011b0 <fstat>:
    register long a7 __asm__("a7") = n;
    11b0:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    11b4:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    11b8:	2501                	sext.w	a0,a0
    11ba:	8082                	ret

00000000000011bc <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    11bc:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    11be:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    11c2:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    11c4:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    11c8:	2501                	sext.w	a0,a0
    11ca:	8082                	ret

00000000000011cc <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    11cc:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    11ce:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    11d2:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    11d4:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    11d8:	2501                	sext.w	a0,a0
    11da:	8082                	ret

00000000000011dc <link>:

int link(char *old_path, char *new_path)
{
    11dc:	87aa                	mv	a5,a0
    11de:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    11e0:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    11e4:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    11e8:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    11ea:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    11ee:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    11f0:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    11f4:	2501                	sext.w	a0,a0
    11f6:	8082                	ret

00000000000011f8 <unlink>:

int unlink(char *path)
{
    11f8:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    11fa:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    11fe:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1202:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1204:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1208:	2501                	sext.w	a0,a0
    120a:	8082                	ret
