
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch5_exit1:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0240006f          	j	1026 <__start_main>

0000000000001006 <main>:
/*
辅助测例，正常退出，不输出 FAIL 即可。
*/

int main()
{
    1006:	1141                	addi	sp,sp,-16
    exit(-233);
    1008:	f1700513          	li	a0,-233
{
    100c:	e406                	sd	ra,8(sp)
    exit(-233);
    100e:	092000ef          	jal	ra,10a0 <exit>
    panic("FAIL: T.T\n");
    1012:	00001517          	auipc	a0,0x1
    1016:	f4e50513          	addi	a0,a0,-178 # 1f60 <stpncpy+0x226>
    101a:	020000ef          	jal	ra,103a <panic>
    return 0;
    101e:	60a2                	ld	ra,8(sp)
    1020:	4501                	li	a0,0
    1022:	0141                	addi	sp,sp,16
    1024:	8082                	ret

0000000000001026 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1026:	1141                	addi	sp,sp,-16
    1028:	e406                	sd	ra,8(sp)
    exit(main());
    102a:	fddff0ef          	jal	ra,1006 <main>
    102e:	072000ef          	jal	ra,10a0 <exit>
    return 0;
}
    1032:	60a2                	ld	ra,8(sp)
    1034:	4501                	li	a0,0
    1036:	0141                	addi	sp,sp,16
    1038:	8082                	ret

000000000000103a <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    103a:	1141                	addi	sp,sp,-16
    103c:	e406                	sd	ra,8(sp)
    puts(m);
    103e:	22a000ef          	jal	ra,1268 <puts>
    exit(-100);
}
    1042:	60a2                	ld	ra,8(sp)
    exit(-100);
    1044:	f9c00513          	li	a0,-100
}
    1048:	0141                	addi	sp,sp,16
    exit(-100);
    104a:	0560006f          	j	10a0 <exit>

000000000000104e <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    104e:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1052:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1054:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1058:	2501                	sext.w	a0,a0
    105a:	8082                	ret

000000000000105c <close>:
    register long a7 __asm__("a7") = n;
    105c:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1060:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1064:	2501                	sext.w	a0,a0
    1066:	8082                	ret

0000000000001068 <read>:
    register long a7 __asm__("a7") = n;
    1068:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    106c:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1070:	8082                	ret

0000000000001072 <write>:
    register long a7 __asm__("a7") = n;
    1072:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1076:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    107a:	8082                	ret

000000000000107c <getpid>:
    register long a7 __asm__("a7") = n;
    107c:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1080:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1084:	2501                	sext.w	a0,a0
    1086:	8082                	ret

0000000000001088 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1088:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    108c:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1090:	2501                	sext.w	a0,a0
    1092:	8082                	ret

0000000000001094 <fork>:
    register long a7 __asm__("a7") = n;
    1094:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1098:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    109c:	2501                	sext.w	a0,a0
    109e:	8082                	ret

00000000000010a0 <exit>:
    register long a7 __asm__("a7") = n;
    10a0:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    10a4:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    10a8:	8082                	ret

00000000000010aa <waitpid>:
    register long a7 __asm__("a7") = n;
    10aa:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    10ae:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    10b2:	2501                	sext.w	a0,a0
    10b4:	8082                	ret

00000000000010b6 <exec>:
    register long a7 __asm__("a7") = n;
    10b6:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    10ba:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    10be:	2501                	sext.w	a0,a0
    10c0:	8082                	ret

00000000000010c2 <get_time>:

int64 get_time()
{
    10c2:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    10c4:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    10c8:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    10ca:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    10cc:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    10d0:	2501                	sext.w	a0,a0
    10d2:	ed09                	bnez	a0,10ec <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    10d4:	67a2                	ld	a5,8(sp)
    10d6:	3e800713          	li	a4,1000
    10da:	00015503          	lhu	a0,0(sp)
    10de:	02e7d7b3          	divu	a5,a5,a4
    10e2:	02e50533          	mul	a0,a0,a4
    10e6:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    10e8:	0141                	addi	sp,sp,16
    10ea:	8082                	ret
        return -1;
    10ec:	557d                	li	a0,-1
    10ee:	bfed                	j	10e8 <get_time+0x26>

00000000000010f0 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    10f0:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    10f4:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    10f8:	2501                	sext.w	a0,a0
    10fa:	8082                	ret

00000000000010fc <sleep>:

int sleep(unsigned long long time)
{
    10fc:	1141                	addi	sp,sp,-16
    10fe:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1100:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1104:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1106:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1108:	00000073          	ecall
    if (err == 0)
    110c:	2501                	sext.w	a0,a0
    110e:	e13d                	bnez	a0,1174 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1110:	6722                	ld	a4,8(sp)
    1112:	3e800693          	li	a3,1000
    1116:	00015783          	lhu	a5,0(sp)
    111a:	02d75733          	divu	a4,a4,a3
    111e:	02d787b3          	mul	a5,a5,a3
    1122:	97ba                	add	a5,a5,a4
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
    1132:	ed15                	bnez	a0,116e <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1134:	6841                	lui	a6,0x10
    1136:	963e                	add	a2,a2,a5
    1138:	187d                	addi	a6,a6,-1
    113a:	3e800693          	li	a3,1000
    113e:	a819                	j	1154 <sleep+0x58>
    __asm_syscall("r"(a7))
    1140:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1144:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1148:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    114a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    114c:	00000073          	ecall
    if (err == 0)
    1150:	2501                	sext.w	a0,a0
    1152:	ed11                	bnez	a0,116e <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1154:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1156:	07c00893          	li	a7,124
    115a:	02d7d733          	divu	a4,a5,a3
    115e:	6782                	ld	a5,0(sp)
    1160:	0107f7b3          	and	a5,a5,a6
    1164:	02d787b3          	mul	a5,a5,a3
    1168:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    116a:	fcc7ebe3          	bltu	a5,a2,1140 <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    116e:	4501                	li	a0,0
    1170:	0141                	addi	sp,sp,16
    1172:	8082                	ret
    1174:	57fd                	li	a5,-1
    1176:	b77d                	j	1124 <sleep+0x28>

0000000000001178 <set_priority>:
    register long a7 __asm__("a7") = n;
    1178:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    117c:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1180:	2501                	sext.w	a0,a0
    1182:	8082                	ret

0000000000001184 <mmap>:
    register long a7 __asm__("a7") = n;
    1184:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1188:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    118c:	2501                	sext.w	a0,a0
    118e:	8082                	ret

0000000000001190 <munmap>:
    register long a7 __asm__("a7") = n;
    1190:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1194:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1198:	2501                	sext.w	a0,a0
    119a:	8082                	ret

000000000000119c <wait>:

int wait(int *code)
{
    119c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    119e:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    11a2:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    11a4:	00000073          	ecall
    return waitpid(-1, code);
}
    11a8:	2501                	sext.w	a0,a0
    11aa:	8082                	ret

00000000000011ac <spawn>:
    register long a7 __asm__("a7") = n;
    11ac:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    11b0:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    11b4:	2501                	sext.w	a0,a0
    11b6:	8082                	ret

00000000000011b8 <mailread>:
    register long a7 __asm__("a7") = n;
    11b8:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    11bc:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    11c0:	2501                	sext.w	a0,a0
    11c2:	8082                	ret

00000000000011c4 <mailwrite>:
    register long a7 __asm__("a7") = n;
    11c4:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    11c8:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    11cc:	2501                	sext.w	a0,a0
    11ce:	8082                	ret

00000000000011d0 <fstat>:
    register long a7 __asm__("a7") = n;
    11d0:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    11d4:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    11d8:	2501                	sext.w	a0,a0
    11da:	8082                	ret

00000000000011dc <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    11dc:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    11de:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    11e2:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    11e4:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    11e8:	2501                	sext.w	a0,a0
    11ea:	8082                	ret

00000000000011ec <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    11ec:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    11ee:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    11f2:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    11f4:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    11f8:	2501                	sext.w	a0,a0
    11fa:	8082                	ret

00000000000011fc <link>:

int link(char *old_path, char *new_path)
{
    11fc:	87aa                	mv	a5,a0
    11fe:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1200:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1204:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1208:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    120a:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    120e:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1210:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1214:	2501                	sext.w	a0,a0
    1216:	8082                	ret

0000000000001218 <unlink>:

int unlink(char *path)
{
    1218:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    121a:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    121e:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1222:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1224:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1228:	2501                	sext.w	a0,a0
    122a:	8082                	ret

000000000000122c <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    122c:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    122e:	00f10593          	addi	a1,sp,15
    1232:	4605                	li	a2,1
    1234:	4501                	li	a0,0
{
    1236:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1238:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    123c:	e2dff0ef          	jal	ra,1068 <read>
    return byte;
}
    1240:	60e2                	ld	ra,24(sp)
    1242:	00f14503          	lbu	a0,15(sp)
    1246:	6105                	addi	sp,sp,32
    1248:	8082                	ret

000000000000124a <putchar>:

int putchar(int c)
{
    124a:	1101                	addi	sp,sp,-32
    124c:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    124e:	00f10593          	addi	a1,sp,15
    1252:	4605                	li	a2,1
    1254:	4505                	li	a0,1
{
    1256:	ec06                	sd	ra,24(sp)
    char byte = c;
    1258:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    125c:	e17ff0ef          	jal	ra,1072 <write>
}
    1260:	60e2                	ld	ra,24(sp)
    1262:	2501                	sext.w	a0,a0
    1264:	6105                	addi	sp,sp,32
    1266:	8082                	ret

0000000000001268 <puts>:

int puts(const char *s)
{
    1268:	1101                	addi	sp,sp,-32
    126a:	e822                	sd	s0,16(sp)
    126c:	ec06                	sd	ra,24(sp)
    126e:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    1270:	145000ef          	jal	ra,1bb4 <strlen>
    1274:	862a                	mv	a2,a0
    1276:	85a2                	mv	a1,s0
    1278:	4505                	li	a0,1
    127a:	df9ff0ef          	jal	ra,1072 <write>
    127e:	00055763          	bgez	a0,128c <puts+0x24>
    return r;
}
    1282:	60e2                	ld	ra,24(sp)
    1284:	6442                	ld	s0,16(sp)
    1286:	557d                	li	a0,-1
    1288:	6105                	addi	sp,sp,32
    128a:	8082                	ret
    return write(stdout, &byte, 1);
    128c:	00f10593          	addi	a1,sp,15
    char byte = c;
    1290:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    1292:	4605                	li	a2,1
    1294:	4505                	li	a0,1
    char byte = c;
    1296:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    129a:	dd9ff0ef          	jal	ra,1072 <write>
}
    129e:	60e2                	ld	ra,24(sp)
    12a0:	6442                	ld	s0,16(sp)
    12a2:	41f5551b          	sraiw	a0,a0,0x1f
    12a6:	6105                	addi	sp,sp,32
    12a8:	8082                	ret

00000000000012aa <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12aa:	7131                	addi	sp,sp,-192
    12ac:	ecce                	sd	s3,88(sp)
    12ae:	e8d2                	sd	s4,80(sp)
    12b0:	e4d6                	sd	s5,72(sp)
    12b2:	e0da                	sd	s6,64(sp)
    12b4:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    12b6:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12b8:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    12ba:	6ae1                	lui	s5,0x18
    12bc:	000f4a37          	lui	s4,0xf4
    12c0:	00989b37          	lui	s6,0x989
{
    12c4:	fc86                	sd	ra,120(sp)
    12c6:	f8a2                	sd	s0,112(sp)
    12c8:	f4a6                	sd	s1,104(sp)
    12ca:	f0ca                	sd	s2,96(sp)
    12cc:	fc5e                	sd	s7,56(sp)
    12ce:	e52e                	sd	a1,136(sp)
    12d0:	e932                	sd	a2,144(sp)
    12d2:	ed36                	sd	a3,152(sp)
    12d4:	f13a                	sd	a4,160(sp)
    12d6:	f942                	sd	a6,176(sp)
    12d8:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    12da:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    12dc:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x77f>
    12e0:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x1670f>
    12e4:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf22af>
    12e8:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x9876ef>
    for (;;)
    {
        if (!*s)
    12ec:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    12f0:	02500913          	li	s2,37
        if (!*s)
    12f4:	1a078f63          	beqz	a5,14b2 <printf+0x208>
    12f8:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    12fa:	17278e63          	beq	a5,s2,1476 <printf+0x1cc>
    12fe:	00164783          	lbu	a5,1(a2)
    1302:	0605                	addi	a2,a2,1
    1304:	fbfd                	bnez	a5,12fa <printf+0x50>
    1306:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    1308:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    130c:	85aa                	mv	a1,a0
    130e:	8622                	mv	a2,s0
    1310:	4505                	li	a0,1
    1312:	d61ff0ef          	jal	ra,1072 <write>
        out(f, a, l);
        if (l)
    1316:	18041963          	bnez	s0,14a8 <printf+0x1fe>
            continue;
        if (s[1] == 0)
    131a:	0014c783          	lbu	a5,1(s1)
    131e:	18078a63          	beqz	a5,14b2 <printf+0x208>
            break;
        switch (s[1])
    1322:	07300713          	li	a4,115
    1326:	28e78e63          	beq	a5,a4,15c2 <printf+0x318>
    132a:	18f76f63          	bltu	a4,a5,14c8 <printf+0x21e>
    132e:	06400713          	li	a4,100
    1332:	2ae78c63          	beq	a5,a4,15ea <printf+0x340>
    1336:	07000713          	li	a4,112
    133a:	3ce79c63          	bne	a5,a4,1712 <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    133e:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1340:	00001797          	auipc	a5,0x1
    1344:	c5078793          	addi	a5,a5,-944 # 1f90 <digits>
            printptr(va_arg(ap, uint64));
    1348:	6298                	ld	a4,0(a3)
    134a:	00868093          	addi	ra,a3,8
    134e:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1350:	00471293          	slli	t0,a4,0x4
    1354:	00c71f13          	slli	t5,a4,0xc
    1358:	01471e13          	slli	t3,a4,0x14
    135c:	01c71893          	slli	a7,a4,0x1c
    1360:	02471813          	slli	a6,a4,0x24
    1364:	02871513          	slli	a0,a4,0x28
    1368:	02c71593          	slli	a1,a4,0x2c
    136c:	03071693          	slli	a3,a4,0x30
    1370:	00871f93          	slli	t6,a4,0x8
    1374:	01071e93          	slli	t4,a4,0x10
    1378:	01871313          	slli	t1,a4,0x18
    137c:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1380:	03c2d293          	srli	t0,t0,0x3c
    1384:	03cf5f13          	srli	t5,t5,0x3c
    1388:	03ce5e13          	srli	t3,t3,0x3c
    138c:	03c8d893          	srli	a7,a7,0x3c
    1390:	03c85813          	srli	a6,a6,0x3c
    1394:	9171                	srli	a0,a0,0x3c
    1396:	91f1                	srli	a1,a1,0x3c
    1398:	92f1                	srli	a3,a3,0x3c
    139a:	92be                	add	t0,t0,a5
    139c:	9f3e                	add	t5,t5,a5
    139e:	9e3e                	add	t3,t3,a5
    13a0:	98be                	add	a7,a7,a5
    13a2:	983e                	add	a6,a6,a5
    13a4:	953e                	add	a0,a0,a5
    13a6:	95be                	add	a1,a1,a5
    13a8:	96be                	add	a3,a3,a5
    13aa:	03c75393          	srli	t2,a4,0x3c
    13ae:	01c75b9b          	srliw	s7,a4,0x1c
    13b2:	03cfdf93          	srli	t6,t6,0x3c
    13b6:	03cede93          	srli	t4,t4,0x3c
    13ba:	03c35313          	srli	t1,t1,0x3c
    13be:	9271                	srli	a2,a2,0x3c
    13c0:	0002c403          	lbu	s0,0(t0)
    13c4:	93be                	add	t2,t2,a5
    13c6:	000f4283          	lbu	t0,0(t5)
    13ca:	9fbe                	add	t6,t6,a5
    13cc:	000e4f03          	lbu	t5,0(t3)
    13d0:	9ebe                	add	t4,t4,a5
    13d2:	0008ce03          	lbu	t3,0(a7)
    13d6:	933e                	add	t1,t1,a5
    13d8:	00084883          	lbu	a7,0(a6) # 10000 <digits+0xe070>
    13dc:	9bbe                	add	s7,s7,a5
    13de:	00054803          	lbu	a6,0(a0)
    13e2:	963e                	add	a2,a2,a5
    13e4:	0005c503          	lbu	a0,0(a1)
    13e8:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13ec:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13f0:	0003c903          	lbu	s2,0(t2)
    13f4:	00064603          	lbu	a2,0(a2)
    13f8:	000fc383          	lbu	t2,0(t6)
    13fc:	8b3d                	andi	a4,a4,15
    13fe:	000ecf83          	lbu	t6,0(t4)
    1402:	92f1                	srli	a3,a3,0x3c
    1404:	00034e83          	lbu	t4,0(t1)
    1408:	000bc303          	lbu	t1,0(s7)
    140c:	96be                	add	a3,a3,a5
    140e:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    1410:	7761                	lui	a4,0xffff8
    1412:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1416:	00710623          	sb	t2,12(sp)
    141a:	005106a3          	sb	t0,13(sp)
    141e:	01f10723          	sb	t6,14(sp)
    1422:	01e107a3          	sb	t5,15(sp)
    1426:	01d10823          	sb	t4,16(sp)
    142a:	01c108a3          	sb	t3,17(sp)
    142e:	00610923          	sb	t1,18(sp)
    1432:	011109a3          	sb	a7,19(sp)
    1436:	01010a23          	sb	a6,20(sp)
    143a:	00a10aa3          	sb	a0,21(sp)
    143e:	00b10b23          	sb	a1,22(sp)
    1442:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    1446:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    144a:	01210523          	sb	s2,10(sp)
    144e:	008105a3          	sb	s0,11(sp)
    1452:	0006c703          	lbu	a4,0(a3)
    1456:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    145a:	4649                	li	a2,18
    145c:	002c                	addi	a1,sp,8
    145e:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1460:	00e10c23          	sb	a4,24(sp)
    1464:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1468:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    146c:	c07ff0ef          	jal	ra,1072 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1470:	00248513          	addi	a0,s1,2
    1474:	bda5                	j	12ec <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1476:	00064783          	lbu	a5,0(a2)
    147a:	84b2                	mv	s1,a2
    147c:	01278963          	beq	a5,s2,148e <printf+0x1e4>
    1480:	b561                	j	1308 <printf+0x5e>
    1482:	0024c783          	lbu	a5,2(s1)
    1486:	0605                	addi	a2,a2,1
    1488:	0489                	addi	s1,s1,2
    148a:	e7279fe3          	bne	a5,s2,1308 <printf+0x5e>
    148e:	0014c783          	lbu	a5,1(s1)
    1492:	ff2788e3          	beq	a5,s2,1482 <printf+0x1d8>
        l = z - a;
    1496:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    149a:	85aa                	mv	a1,a0
    149c:	8622                	mv	a2,s0
    149e:	4505                	li	a0,1
    14a0:	bd3ff0ef          	jal	ra,1072 <write>
        if (l)
    14a4:	e6040be3          	beqz	s0,131a <printf+0x70>
    14a8:	8526                	mv	a0,s1
        if (!*s)
    14aa:	00054783          	lbu	a5,0(a0)
    14ae:	e40795e3          	bnez	a5,12f8 <printf+0x4e>
    }
    va_end(ap);
    14b2:	70e6                	ld	ra,120(sp)
    14b4:	7446                	ld	s0,112(sp)
    14b6:	74a6                	ld	s1,104(sp)
    14b8:	7906                	ld	s2,96(sp)
    14ba:	69e6                	ld	s3,88(sp)
    14bc:	6a46                	ld	s4,80(sp)
    14be:	6aa6                	ld	s5,72(sp)
    14c0:	6b06                	ld	s6,64(sp)
    14c2:	7be2                	ld	s7,56(sp)
    14c4:	6129                	addi	sp,sp,192
    14c6:	8082                	ret
        switch (s[1])
    14c8:	07800713          	li	a4,120
    14cc:	24e79363          	bne	a5,a4,1712 <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    14d0:	6782                	ld	a5,0(sp)
    14d2:	4394                	lw	a3,0(a5)
    14d4:	07a1                	addi	a5,a5,8
    14d6:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    14d8:	2606c263          	bltz	a3,173c <printf+0x492>
        buf[i--] = digits[x % base];
    14dc:	00001797          	auipc	a5,0x1
    14e0:	ab478793          	addi	a5,a5,-1356 # 1f90 <digits>
    14e4:	00f6f713          	andi	a4,a3,15
    14e8:	973e                	add	a4,a4,a5
    14ea:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff6070>
    buf[16] = 0;
    14ee:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    14f2:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    14f4:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    14f8:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    14fc:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    1500:	0046d51b          	srliw	a0,a3,0x4
    1504:	0ad5d563          	bge	a1,a3,15ae <printf+0x304>
        buf[i--] = digits[x % base];
    1508:	8a3d                	andi	a2,a2,15
    150a:	963e                	add	a2,a2,a5
    150c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1510:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    1514:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1518:	30a5fe63          	bgeu	a1,a0,1834 <printf+0x58a>
        buf[i--] = digits[x % base];
    151c:	00f77613          	andi	a2,a4,15
    1520:	963e                	add	a2,a2,a5
    1522:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1526:	45bd                	li	a1,15
    1528:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    152c:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    1530:	00475513          	srli	a0,a4,0x4
    1534:	30e5f963          	bgeu	a1,a4,1846 <printf+0x59c>
        buf[i--] = digits[x % base];
    1538:	8a3d                	andi	a2,a2,15
    153a:	963e                	add	a2,a2,a5
    153c:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    1540:	00875893          	srli	a7,a4,0x8
    1544:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    1548:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    154c:	30a5fd63          	bgeu	a1,a0,1866 <printf+0x5bc>
        buf[i--] = digits[x % base];
    1550:	8a3d                	andi	a2,a2,15
    1552:	963e                	add	a2,a2,a5
    1554:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1558:	00c75813          	srli	a6,a4,0xc
    155c:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    1560:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    1564:	3315fe63          	bgeu	a1,a7,18a0 <printf+0x5f6>
        buf[i--] = digits[x % base];
    1568:	8a3d                	andi	a2,a2,15
    156a:	963e                	add	a2,a2,a5
    156c:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1570:	01075893          	srli	a7,a4,0x10
    1574:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    1578:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    157c:	3305ff63          	bgeu	a1,a6,18ba <printf+0x610>
        buf[i--] = digits[x % base];
    1580:	8a3d                	andi	a2,a2,15
    1582:	963e                	add	a2,a2,a5
    1584:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1588:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    158c:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1590:	3515f863          	bgeu	a1,a7,18e0 <printf+0x636>
        buf[i--] = digits[x % base];
    1594:	97ba                	add	a5,a5,a4
    1596:	0007c783          	lbu	a5,0(a5)
    159a:	45a1                	li	a1,8
    159c:	00f10823          	sb	a5,16(sp)
    if (sign)
    15a0:	0006d763          	bgez	a3,15ae <printf+0x304>
        buf[i--] = '-';
    15a4:	02d00793          	li	a5,45
    15a8:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    15ac:	459d                	li	a1,7
    write(f, s, l);
    15ae:	4641                	li	a2,16
    15b0:	003c                	addi	a5,sp,8
    15b2:	9e0d                	subw	a2,a2,a1
    15b4:	4505                	li	a0,1
    15b6:	95be                	add	a1,a1,a5
    15b8:	abbff0ef          	jal	ra,1072 <write>
        s += 2;
    15bc:	00248513          	addi	a0,s1,2
    15c0:	b335                	j	12ec <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    15c2:	6782                	ld	a5,0(sp)
    15c4:	6380                	ld	s0,0(a5)
    15c6:	07a1                	addi	a5,a5,8
    15c8:	e03e                	sd	a5,0(sp)
    15ca:	22040a63          	beqz	s0,17fe <printf+0x554>
            l = strnlen(a, 200);
    15ce:	0c800593          	li	a1,200
    15d2:	8522                	mv	a0,s0
    15d4:	6cc000ef          	jal	ra,1ca0 <strnlen>
    write(f, s, l);
    15d8:	0005061b          	sext.w	a2,a0
    15dc:	85a2                	mv	a1,s0
    15de:	4505                	li	a0,1
    15e0:	a93ff0ef          	jal	ra,1072 <write>
        s += 2;
    15e4:	00248513          	addi	a0,s1,2
    15e8:	b311                	j	12ec <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    15ea:	6782                	ld	a5,0(sp)
    15ec:	4390                	lw	a2,0(a5)
    15ee:	07a1                	addi	a5,a5,8
    15f0:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    15f2:	1a064363          	bltz	a2,1798 <printf+0x4ee>
        buf[i--] = digits[x % base];
    15f6:	46a9                	li	a3,10
    15f8:	02d6773b          	remuw	a4,a2,a3
    15fc:	00001797          	auipc	a5,0x1
    1600:	99478793          	addi	a5,a5,-1644 # 1f90 <digits>
    buf[16] = 0;
    1604:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1608:	4525                	li	a0,9
        x = xx;
    160a:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    160e:	973e                	add	a4,a4,a5
    1610:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    1614:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    1618:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    161c:	2cc55063          	bge	a0,a2,18dc <printf+0x632>
    1620:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1624:	02d5f73b          	remuw	a4,a1,a3
    1628:	1702                	slli	a4,a4,0x20
    162a:	9301                	srli	a4,a4,0x20
    162c:	973e                	add	a4,a4,a5
    162e:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    1632:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    1636:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    163a:	1f057d63          	bgeu	a0,a6,1834 <printf+0x58a>
        buf[i--] = digits[x % base];
    163e:	4529                	li	a0,10
    } while ((x /= base) != 0);
    1640:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1642:	02a5f73b          	remuw	a4,a1,a0
    1646:	973e                	add	a4,a4,a5
    1648:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    164c:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    1650:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    1654:	1ab6f163          	bgeu	a3,a1,17f6 <printf+0x54c>
    1658:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    165c:	02a776bb          	remuw	a3,a4,a0
    1660:	96be                	add	a3,a3,a5
    1662:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1666:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    166a:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    166e:	20b87c63          	bgeu	a6,a1,1886 <printf+0x5dc>
    1672:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    1676:	02a776bb          	remuw	a3,a4,a0
    167a:	96be                	add	a3,a3,a5
    167c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1680:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1684:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1688:	20b87363          	bgeu	a6,a1,188e <printf+0x5e4>
        buf[i--] = digits[x % base];
    168c:	02a776bb          	remuw	a3,a4,a0
    1690:	96be                	add	a3,a3,a5
    1692:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1696:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    169a:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    169e:	20b9f563          	bgeu	s3,a1,18a8 <printf+0x5fe>
        buf[i--] = digits[x % base];
    16a2:	02a776bb          	remuw	a3,a4,a0
    16a6:	96be                	add	a3,a3,a5
    16a8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    16ac:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    16b0:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    16b4:	20bafb63          	bgeu	s5,a1,18ca <printf+0x620>
        buf[i--] = digits[x % base];
    16b8:	02a776bb          	remuw	a3,a4,a0
    16bc:	96be                	add	a3,a3,a5
    16be:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    16c2:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    16c6:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    16ca:	1eba7c63          	bgeu	s4,a1,18c2 <printf+0x618>
        buf[i--] = digits[x % base];
    16ce:	02a776bb          	remuw	a3,a4,a0
    16d2:	96be                	add	a3,a3,a5
    16d4:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    16d8:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    16dc:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    16e0:	14bb7163          	bgeu	s6,a1,1822 <printf+0x578>
        buf[i--] = digits[x % base];
    16e4:	1702                	slli	a4,a4,0x20
    16e6:	9301                	srli	a4,a4,0x20
    16e8:	97ba                	add	a5,a5,a4
    16ea:	0007c783          	lbu	a5,0(a5)
    16ee:	4599                	li	a1,6
    16f0:	00f10723          	sb	a5,14(sp)
    if (sign)
    16f4:	ea065de3          	bgez	a2,15ae <printf+0x304>
        buf[i--] = '-';
    16f8:	02d00793          	li	a5,45
    16fc:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1700:	4595                	li	a1,5
    write(f, s, l);
    1702:	003c                	addi	a5,sp,8
    1704:	4641                	li	a2,16
    1706:	9e0d                	subw	a2,a2,a1
    1708:	4505                	li	a0,1
    170a:	95be                	add	a1,a1,a5
    170c:	967ff0ef          	jal	ra,1072 <write>
    1710:	b575                	j	15bc <printf+0x312>
    char byte = c;
    1712:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1716:	4605                	li	a2,1
    1718:	002c                	addi	a1,sp,8
    171a:	4505                	li	a0,1
    char byte = c;
    171c:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1720:	953ff0ef          	jal	ra,1072 <write>
    char byte = c;
    1724:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1728:	4605                	li	a2,1
    172a:	002c                	addi	a1,sp,8
    172c:	4505                	li	a0,1
    char byte = c;
    172e:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1732:	941ff0ef          	jal	ra,1072 <write>
        s += 2;
    1736:	00248513          	addi	a0,s1,2
    173a:	be4d                	j	12ec <printf+0x42>
        x = -xx;
    173c:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    1740:	00001797          	auipc	a5,0x1
    1744:	85078793          	addi	a5,a5,-1968 # 1f90 <digits>
    1748:	00f77613          	andi	a2,a4,15
    174c:	963e                	add	a2,a2,a5
    174e:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    1752:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1756:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    1758:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    175c:	0047551b          	srliw	a0,a4,0x4
    1760:	0047561b          	srliw	a2,a4,0x4
    1764:	0ab6d263          	bge	a3,a1,1808 <printf+0x55e>
        buf[i--] = digits[x % base];
    1768:	8a3d                	andi	a2,a2,15
    176a:	963e                	add	a2,a2,a5
    176c:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    1770:	463d                	li	a2,15
    1772:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    1776:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    177a:	daa661e3          	bltu	a2,a0,151c <printf+0x272>
        buf[i--] = '-';
    177e:	02d00793          	li	a5,45
    1782:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1786:	45b5                	li	a1,13
    write(f, s, l);
    1788:	003c                	addi	a5,sp,8
    178a:	4641                	li	a2,16
    178c:	9e0d                	subw	a2,a2,a1
    178e:	4505                	li	a0,1
    1790:	95be                	add	a1,a1,a5
    1792:	8e1ff0ef          	jal	ra,1072 <write>
    1796:	b51d                	j	15bc <printf+0x312>
        x = -xx;
    1798:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    179c:	46a9                	li	a3,10
    179e:	02d875bb          	remuw	a1,a6,a3
    17a2:	00000797          	auipc	a5,0x0
    17a6:	7ee78793          	addi	a5,a5,2030 # 1f90 <digits>
    buf[16] = 0;
    17aa:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    17ae:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    17b0:	95be                	add	a1,a1,a5
    17b2:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    17b6:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    17ba:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    17be:	04a65563          	bge	a2,a0,1808 <printf+0x55e>
    17c2:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    17c6:	02d775bb          	remuw	a1,a4,a3
    17ca:	95be                	add	a1,a1,a5
    17cc:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    17d0:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    17d4:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    17d8:	fb0573e3          	bgeu	a0,a6,177e <printf+0x4d4>
        buf[i--] = digits[x % base];
    17dc:	4529                	li	a0,10
    } while ((x /= base) != 0);
    17de:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    17e0:	02a5f73b          	remuw	a4,a1,a0
    17e4:	973e                	add	a4,a4,a5
    17e6:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    17ea:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    17ee:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    17f2:	e6b6e3e3          	bltu	a3,a1,1658 <printf+0x3ae>
        buf[i--] = digits[x % base];
    17f6:	45b5                	li	a1,13
    if (sign)
    17f8:	da065be3          	bgez	a2,15ae <printf+0x304>
    17fc:	a881                	j	184c <printf+0x5a2>
                a = "(null)";
    17fe:	00000417          	auipc	s0,0x0
    1802:	77240413          	addi	s0,s0,1906 # 1f70 <stpncpy+0x236>
    1806:	b3e1                	j	15ce <printf+0x324>
        buf[i--] = '-';
    1808:	02d00793          	li	a5,45
    180c:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1810:	45b9                	li	a1,14
    write(f, s, l);
    1812:	003c                	addi	a5,sp,8
    1814:	4641                	li	a2,16
    1816:	9e0d                	subw	a2,a2,a1
    1818:	4505                	li	a0,1
    181a:	95be                	add	a1,a1,a5
    181c:	857ff0ef          	jal	ra,1072 <write>
    1820:	bb71                	j	15bc <printf+0x312>
        buf[i--] = digits[x % base];
    1822:	459d                	li	a1,7
    if (sign)
    1824:	d80655e3          	bgez	a2,15ae <printf+0x304>
        buf[i--] = '-';
    1828:	02d00793          	li	a5,45
    182c:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1830:	4599                	li	a1,6
    1832:	bbb5                	j	15ae <printf+0x304>
    1834:	45b9                	li	a1,14
    write(f, s, l);
    1836:	003c                	addi	a5,sp,8
    1838:	4641                	li	a2,16
    183a:	9e0d                	subw	a2,a2,a1
    183c:	4505                	li	a0,1
    183e:	95be                	add	a1,a1,a5
    1840:	833ff0ef          	jal	ra,1072 <write>
    1844:	bba5                	j	15bc <printf+0x312>
        buf[i--] = digits[x % base];
    1846:	45b5                	li	a1,13
    if (sign)
    1848:	d606d3e3          	bgez	a3,15ae <printf+0x304>
        buf[i--] = '-';
    184c:	02d00793          	li	a5,45
    1850:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1854:	45b1                	li	a1,12
    write(f, s, l);
    1856:	003c                	addi	a5,sp,8
    1858:	4641                	li	a2,16
    185a:	9e0d                	subw	a2,a2,a1
    185c:	4505                	li	a0,1
    185e:	95be                	add	a1,a1,a5
    1860:	813ff0ef          	jal	ra,1072 <write>
    1864:	bba1                	j	15bc <printf+0x312>
        buf[i--] = digits[x % base];
    1866:	45b1                	li	a1,12
    if (sign)
    1868:	d406d3e3          	bgez	a3,15ae <printf+0x304>
        buf[i--] = '-';
    186c:	02d00793          	li	a5,45
    1870:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1874:	45ad                	li	a1,11
    write(f, s, l);
    1876:	003c                	addi	a5,sp,8
    1878:	4641                	li	a2,16
    187a:	9e0d                	subw	a2,a2,a1
    187c:	4505                	li	a0,1
    187e:	95be                	add	a1,a1,a5
    1880:	ff2ff0ef          	jal	ra,1072 <write>
    1884:	bb25                	j	15bc <printf+0x312>
        buf[i--] = digits[x % base];
    1886:	45b1                	li	a1,12
    if (sign)
    1888:	d20653e3          	bgez	a2,15ae <printf+0x304>
    188c:	b7c5                	j	186c <printf+0x5c2>
        buf[i--] = digits[x % base];
    188e:	45ad                	li	a1,11
    if (sign)
    1890:	d0065fe3          	bgez	a2,15ae <printf+0x304>
        buf[i--] = '-';
    1894:	02d00793          	li	a5,45
    1898:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    189c:	45a9                	li	a1,10
    189e:	bb01                	j	15ae <printf+0x304>
    18a0:	45ad                	li	a1,11
    if (sign)
    18a2:	d006d6e3          	bgez	a3,15ae <printf+0x304>
    18a6:	b7fd                	j	1894 <printf+0x5ea>
        buf[i--] = digits[x % base];
    18a8:	45a9                	li	a1,10
    if (sign)
    18aa:	d00652e3          	bgez	a2,15ae <printf+0x304>
        buf[i--] = '-';
    18ae:	02d00793          	li	a5,45
    18b2:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    18b6:	45a5                	li	a1,9
    18b8:	b9dd                	j	15ae <printf+0x304>
    18ba:	45a9                	li	a1,10
    if (sign)
    18bc:	ce06d9e3          	bgez	a3,15ae <printf+0x304>
    18c0:	b7fd                	j	18ae <printf+0x604>
        buf[i--] = digits[x % base];
    18c2:	45a1                	li	a1,8
    if (sign)
    18c4:	ce0655e3          	bgez	a2,15ae <printf+0x304>
    18c8:	b9f1                	j	15a4 <printf+0x2fa>
        buf[i--] = digits[x % base];
    18ca:	45a5                	li	a1,9
    if (sign)
    18cc:	ce0651e3          	bgez	a2,15ae <printf+0x304>
        buf[i--] = '-';
    18d0:	02d00793          	li	a5,45
    18d4:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    18d8:	45a1                	li	a1,8
    18da:	b9d1                	j	15ae <printf+0x304>
    i = 15;
    18dc:	45bd                	li	a1,15
    18de:	b9c1                	j	15ae <printf+0x304>
        buf[i--] = digits[x % base];
    18e0:	45a5                	li	a1,9
    if (sign)
    18e2:	cc06d6e3          	bgez	a3,15ae <printf+0x304>
    18e6:	b7ed                	j	18d0 <printf+0x626>

00000000000018e8 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    18e8:	02000793          	li	a5,32
    18ec:	00f50663          	beq	a0,a5,18f8 <isspace+0x10>
    18f0:	355d                	addiw	a0,a0,-9
    18f2:	00553513          	sltiu	a0,a0,5
    18f6:	8082                	ret
    18f8:	4505                	li	a0,1
}
    18fa:	8082                	ret

00000000000018fc <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    18fc:	fd05051b          	addiw	a0,a0,-48
}
    1900:	00a53513          	sltiu	a0,a0,10
    1904:	8082                	ret

0000000000001906 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1906:	02000613          	li	a2,32
    190a:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    190c:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1910:	ff77069b          	addiw	a3,a4,-9
    1914:	04c70d63          	beq	a4,a2,196e <atoi+0x68>
    1918:	0007079b          	sext.w	a5,a4
    191c:	04d5f963          	bgeu	a1,a3,196e <atoi+0x68>
        s++;
    switch (*s)
    1920:	02b00693          	li	a3,43
    1924:	04d70a63          	beq	a4,a3,1978 <atoi+0x72>
    1928:	02d00693          	li	a3,45
    192c:	06d70463          	beq	a4,a3,1994 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1930:	fd07859b          	addiw	a1,a5,-48
    1934:	4625                	li	a2,9
    1936:	873e                	mv	a4,a5
    1938:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    193a:	4e01                	li	t3,0
    while (isdigit(*s))
    193c:	04b66a63          	bltu	a2,a1,1990 <atoi+0x8a>
    int n = 0, neg = 0;
    1940:	4501                	li	a0,0
    while (isdigit(*s))
    1942:	4825                	li	a6,9
    1944:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1948:	0025179b          	slliw	a5,a0,0x2
    194c:	9d3d                	addw	a0,a0,a5
    194e:	fd07031b          	addiw	t1,a4,-48
    1952:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1956:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    195a:	0685                	addi	a3,a3,1
    195c:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1960:	0006071b          	sext.w	a4,a2
    1964:	feb870e3          	bgeu	a6,a1,1944 <atoi+0x3e>
    return neg ? n : -n;
    1968:	000e0563          	beqz	t3,1972 <atoi+0x6c>
}
    196c:	8082                	ret
        s++;
    196e:	0505                	addi	a0,a0,1
    1970:	bf71                	j	190c <atoi+0x6>
    1972:	4113053b          	subw	a0,t1,a7
    1976:	8082                	ret
    while (isdigit(*s))
    1978:	00154783          	lbu	a5,1(a0)
    197c:	4625                	li	a2,9
        s++;
    197e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1982:	fd07859b          	addiw	a1,a5,-48
    1986:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    198a:	4e01                	li	t3,0
    while (isdigit(*s))
    198c:	fab67ae3          	bgeu	a2,a1,1940 <atoi+0x3a>
    1990:	4501                	li	a0,0
}
    1992:	8082                	ret
    while (isdigit(*s))
    1994:	00154783          	lbu	a5,1(a0)
    1998:	4625                	li	a2,9
        s++;
    199a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    199e:	fd07859b          	addiw	a1,a5,-48
    19a2:	0007871b          	sext.w	a4,a5
    19a6:	feb665e3          	bltu	a2,a1,1990 <atoi+0x8a>
        neg = 1;
    19aa:	4e05                	li	t3,1
    19ac:	bf51                	j	1940 <atoi+0x3a>

00000000000019ae <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    19ae:	16060d63          	beqz	a2,1b28 <memset+0x17a>
    19b2:	40a007b3          	neg	a5,a0
    19b6:	8b9d                	andi	a5,a5,7
    19b8:	00778713          	addi	a4,a5,7
    19bc:	482d                	li	a6,11
    19be:	0ff5f593          	andi	a1,a1,255
    19c2:	fff60693          	addi	a3,a2,-1
    19c6:	17076263          	bltu	a4,a6,1b2a <memset+0x17c>
    19ca:	16e6ea63          	bltu	a3,a4,1b3e <memset+0x190>
    19ce:	16078563          	beqz	a5,1b38 <memset+0x18a>
    19d2:	00b50023          	sb	a1,0(a0)
    19d6:	4705                	li	a4,1
    19d8:	00150e93          	addi	t4,a0,1
    19dc:	14e78c63          	beq	a5,a4,1b34 <memset+0x186>
    19e0:	00b500a3          	sb	a1,1(a0)
    19e4:	4709                	li	a4,2
    19e6:	00250e93          	addi	t4,a0,2
    19ea:	14e78d63          	beq	a5,a4,1b44 <memset+0x196>
    19ee:	00b50123          	sb	a1,2(a0)
    19f2:	470d                	li	a4,3
    19f4:	00350e93          	addi	t4,a0,3
    19f8:	12e78b63          	beq	a5,a4,1b2e <memset+0x180>
    19fc:	00b501a3          	sb	a1,3(a0)
    1a00:	4711                	li	a4,4
    1a02:	00450e93          	addi	t4,a0,4
    1a06:	14e78163          	beq	a5,a4,1b48 <memset+0x19a>
    1a0a:	00b50223          	sb	a1,4(a0)
    1a0e:	4715                	li	a4,5
    1a10:	00550e93          	addi	t4,a0,5
    1a14:	12e78c63          	beq	a5,a4,1b4c <memset+0x19e>
    1a18:	00b502a3          	sb	a1,5(a0)
    1a1c:	471d                	li	a4,7
    1a1e:	00650e93          	addi	t4,a0,6
    1a22:	12e79763          	bne	a5,a4,1b50 <memset+0x1a2>
    1a26:	00750e93          	addi	t4,a0,7
    1a2a:	00b50323          	sb	a1,6(a0)
    1a2e:	4f1d                	li	t5,7
    1a30:	00859713          	slli	a4,a1,0x8
    1a34:	8f4d                	or	a4,a4,a1
    1a36:	01059e13          	slli	t3,a1,0x10
    1a3a:	01c76e33          	or	t3,a4,t3
    1a3e:	01859313          	slli	t1,a1,0x18
    1a42:	006e6333          	or	t1,t3,t1
    1a46:	02059893          	slli	a7,a1,0x20
    1a4a:	011368b3          	or	a7,t1,a7
    1a4e:	02859813          	slli	a6,a1,0x28
    1a52:	40f60333          	sub	t1,a2,a5
    1a56:	0108e833          	or	a6,a7,a6
    1a5a:	03059693          	slli	a3,a1,0x30
    1a5e:	00d866b3          	or	a3,a6,a3
    1a62:	03859713          	slli	a4,a1,0x38
    1a66:	97aa                	add	a5,a5,a0
    1a68:	ff837813          	andi	a6,t1,-8
    1a6c:	8f55                	or	a4,a4,a3
    1a6e:	00f806b3          	add	a3,a6,a5
    1a72:	e398                	sd	a4,0(a5)
    1a74:	07a1                	addi	a5,a5,8
    1a76:	fed79ee3          	bne	a5,a3,1a72 <memset+0xc4>
    1a7a:	ff837693          	andi	a3,t1,-8
    1a7e:	00de87b3          	add	a5,t4,a3
    1a82:	01e6873b          	addw	a4,a3,t5
    1a86:	0ad30663          	beq	t1,a3,1b32 <memset+0x184>
    1a8a:	00b78023          	sb	a1,0(a5)
    1a8e:	0017069b          	addiw	a3,a4,1
    1a92:	08c6fb63          	bgeu	a3,a2,1b28 <memset+0x17a>
    1a96:	00b780a3          	sb	a1,1(a5)
    1a9a:	0027069b          	addiw	a3,a4,2
    1a9e:	08c6f563          	bgeu	a3,a2,1b28 <memset+0x17a>
    1aa2:	00b78123          	sb	a1,2(a5)
    1aa6:	0037069b          	addiw	a3,a4,3
    1aaa:	06c6ff63          	bgeu	a3,a2,1b28 <memset+0x17a>
    1aae:	00b781a3          	sb	a1,3(a5)
    1ab2:	0047069b          	addiw	a3,a4,4
    1ab6:	06c6f963          	bgeu	a3,a2,1b28 <memset+0x17a>
    1aba:	00b78223          	sb	a1,4(a5)
    1abe:	0057069b          	addiw	a3,a4,5
    1ac2:	06c6f363          	bgeu	a3,a2,1b28 <memset+0x17a>
    1ac6:	00b782a3          	sb	a1,5(a5)
    1aca:	0067069b          	addiw	a3,a4,6
    1ace:	04c6fd63          	bgeu	a3,a2,1b28 <memset+0x17a>
    1ad2:	00b78323          	sb	a1,6(a5)
    1ad6:	0077069b          	addiw	a3,a4,7
    1ada:	04c6f763          	bgeu	a3,a2,1b28 <memset+0x17a>
    1ade:	00b783a3          	sb	a1,7(a5)
    1ae2:	0087069b          	addiw	a3,a4,8
    1ae6:	04c6f163          	bgeu	a3,a2,1b28 <memset+0x17a>
    1aea:	00b78423          	sb	a1,8(a5)
    1aee:	0097069b          	addiw	a3,a4,9
    1af2:	02c6fb63          	bgeu	a3,a2,1b28 <memset+0x17a>
    1af6:	00b784a3          	sb	a1,9(a5)
    1afa:	00a7069b          	addiw	a3,a4,10
    1afe:	02c6f563          	bgeu	a3,a2,1b28 <memset+0x17a>
    1b02:	00b78523          	sb	a1,10(a5)
    1b06:	00b7069b          	addiw	a3,a4,11
    1b0a:	00c6ff63          	bgeu	a3,a2,1b28 <memset+0x17a>
    1b0e:	00b785a3          	sb	a1,11(a5)
    1b12:	00c7069b          	addiw	a3,a4,12
    1b16:	00c6f963          	bgeu	a3,a2,1b28 <memset+0x17a>
    1b1a:	00b78623          	sb	a1,12(a5)
    1b1e:	2735                	addiw	a4,a4,13
    1b20:	00c77463          	bgeu	a4,a2,1b28 <memset+0x17a>
    1b24:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1b28:	8082                	ret
    1b2a:	472d                	li	a4,11
    1b2c:	bd79                	j	19ca <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b2e:	4f0d                	li	t5,3
    1b30:	b701                	j	1a30 <memset+0x82>
    1b32:	8082                	ret
    1b34:	4f05                	li	t5,1
    1b36:	bded                	j	1a30 <memset+0x82>
    1b38:	8eaa                	mv	t4,a0
    1b3a:	4f01                	li	t5,0
    1b3c:	bdd5                	j	1a30 <memset+0x82>
    1b3e:	87aa                	mv	a5,a0
    1b40:	4701                	li	a4,0
    1b42:	b7a1                	j	1a8a <memset+0xdc>
    1b44:	4f09                	li	t5,2
    1b46:	b5ed                	j	1a30 <memset+0x82>
    1b48:	4f11                	li	t5,4
    1b4a:	b5dd                	j	1a30 <memset+0x82>
    1b4c:	4f15                	li	t5,5
    1b4e:	b5cd                	j	1a30 <memset+0x82>
    1b50:	4f19                	li	t5,6
    1b52:	bdf9                	j	1a30 <memset+0x82>

0000000000001b54 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1b54:	00054783          	lbu	a5,0(a0)
    1b58:	0005c703          	lbu	a4,0(a1)
    1b5c:	00e79863          	bne	a5,a4,1b6c <strcmp+0x18>
    1b60:	0505                	addi	a0,a0,1
    1b62:	0585                	addi	a1,a1,1
    1b64:	fbe5                	bnez	a5,1b54 <strcmp>
    1b66:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1b68:	9d19                	subw	a0,a0,a4
    1b6a:	8082                	ret
    1b6c:	0007851b          	sext.w	a0,a5
    1b70:	bfe5                	j	1b68 <strcmp+0x14>

0000000000001b72 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1b72:	ce05                	beqz	a2,1baa <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1b74:	00054703          	lbu	a4,0(a0)
    1b78:	0005c783          	lbu	a5,0(a1)
    1b7c:	cb0d                	beqz	a4,1bae <strncmp+0x3c>
    if (!n--)
    1b7e:	167d                	addi	a2,a2,-1
    1b80:	00c506b3          	add	a3,a0,a2
    1b84:	a819                	j	1b9a <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1b86:	00a68e63          	beq	a3,a0,1ba2 <strncmp+0x30>
    1b8a:	0505                	addi	a0,a0,1
    1b8c:	00e79b63          	bne	a5,a4,1ba2 <strncmp+0x30>
    1b90:	00054703          	lbu	a4,0(a0)
    1b94:	0005c783          	lbu	a5,0(a1)
    1b98:	cb19                	beqz	a4,1bae <strncmp+0x3c>
    1b9a:	0005c783          	lbu	a5,0(a1)
    1b9e:	0585                	addi	a1,a1,1
    1ba0:	f3fd                	bnez	a5,1b86 <strncmp+0x14>
        ;
    return *l - *r;
    1ba2:	0007051b          	sext.w	a0,a4
    1ba6:	9d1d                	subw	a0,a0,a5
    1ba8:	8082                	ret
        return 0;
    1baa:	4501                	li	a0,0
}
    1bac:	8082                	ret
    1bae:	4501                	li	a0,0
    return *l - *r;
    1bb0:	9d1d                	subw	a0,a0,a5
    1bb2:	8082                	ret

0000000000001bb4 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1bb4:	00757793          	andi	a5,a0,7
    1bb8:	cf89                	beqz	a5,1bd2 <strlen+0x1e>
    1bba:	87aa                	mv	a5,a0
    1bbc:	a029                	j	1bc6 <strlen+0x12>
    1bbe:	0785                	addi	a5,a5,1
    1bc0:	0077f713          	andi	a4,a5,7
    1bc4:	cb01                	beqz	a4,1bd4 <strlen+0x20>
        if (!*s)
    1bc6:	0007c703          	lbu	a4,0(a5)
    1bca:	fb75                	bnez	a4,1bbe <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1bcc:	40a78533          	sub	a0,a5,a0
}
    1bd0:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1bd2:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1bd4:	6394                	ld	a3,0(a5)
    1bd6:	00000597          	auipc	a1,0x0
    1bda:	3a25b583          	ld	a1,930(a1) # 1f78 <stpncpy+0x23e>
    1bde:	00000617          	auipc	a2,0x0
    1be2:	3a263603          	ld	a2,930(a2) # 1f80 <stpncpy+0x246>
    1be6:	a019                	j	1bec <strlen+0x38>
    1be8:	6794                	ld	a3,8(a5)
    1bea:	07a1                	addi	a5,a5,8
    1bec:	00b68733          	add	a4,a3,a1
    1bf0:	fff6c693          	not	a3,a3
    1bf4:	8f75                	and	a4,a4,a3
    1bf6:	8f71                	and	a4,a4,a2
    1bf8:	db65                	beqz	a4,1be8 <strlen+0x34>
    for (; *s; s++)
    1bfa:	0007c703          	lbu	a4,0(a5)
    1bfe:	d779                	beqz	a4,1bcc <strlen+0x18>
    1c00:	0017c703          	lbu	a4,1(a5)
    1c04:	0785                	addi	a5,a5,1
    1c06:	d379                	beqz	a4,1bcc <strlen+0x18>
    1c08:	0017c703          	lbu	a4,1(a5)
    1c0c:	0785                	addi	a5,a5,1
    1c0e:	fb6d                	bnez	a4,1c00 <strlen+0x4c>
    1c10:	bf75                	j	1bcc <strlen+0x18>

0000000000001c12 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1c12:	00757713          	andi	a4,a0,7
{
    1c16:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1c18:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1c1c:	cb19                	beqz	a4,1c32 <memchr+0x20>
    1c1e:	ce25                	beqz	a2,1c96 <memchr+0x84>
    1c20:	0007c703          	lbu	a4,0(a5)
    1c24:	04b70e63          	beq	a4,a1,1c80 <memchr+0x6e>
    1c28:	0785                	addi	a5,a5,1
    1c2a:	0077f713          	andi	a4,a5,7
    1c2e:	167d                	addi	a2,a2,-1
    1c30:	f77d                	bnez	a4,1c1e <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1c32:	4501                	li	a0,0
    if (n && *s != c)
    1c34:	c235                	beqz	a2,1c98 <memchr+0x86>
    1c36:	0007c703          	lbu	a4,0(a5)
    1c3a:	04b70363          	beq	a4,a1,1c80 <memchr+0x6e>
        size_t k = ONES * c;
    1c3e:	00000517          	auipc	a0,0x0
    1c42:	34a53503          	ld	a0,842(a0) # 1f88 <stpncpy+0x24e>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1c46:	471d                	li	a4,7
        size_t k = ONES * c;
    1c48:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1c4c:	02c77a63          	bgeu	a4,a2,1c80 <memchr+0x6e>
    1c50:	00000897          	auipc	a7,0x0
    1c54:	3288b883          	ld	a7,808(a7) # 1f78 <stpncpy+0x23e>
    1c58:	00000817          	auipc	a6,0x0
    1c5c:	32883803          	ld	a6,808(a6) # 1f80 <stpncpy+0x246>
    1c60:	431d                	li	t1,7
    1c62:	a029                	j	1c6c <memchr+0x5a>
    1c64:	1661                	addi	a2,a2,-8
    1c66:	07a1                	addi	a5,a5,8
    1c68:	02c37963          	bgeu	t1,a2,1c9a <memchr+0x88>
    1c6c:	6398                	ld	a4,0(a5)
    1c6e:	8f29                	xor	a4,a4,a0
    1c70:	011706b3          	add	a3,a4,a7
    1c74:	fff74713          	not	a4,a4
    1c78:	8f75                	and	a4,a4,a3
    1c7a:	01077733          	and	a4,a4,a6
    1c7e:	d37d                	beqz	a4,1c64 <memchr+0x52>
    1c80:	853e                	mv	a0,a5
    1c82:	97b2                	add	a5,a5,a2
    1c84:	a021                	j	1c8c <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1c86:	0505                	addi	a0,a0,1
    1c88:	00f50763          	beq	a0,a5,1c96 <memchr+0x84>
    1c8c:	00054703          	lbu	a4,0(a0)
    1c90:	feb71be3          	bne	a4,a1,1c86 <memchr+0x74>
    1c94:	8082                	ret
    return n ? (void *)s : 0;
    1c96:	4501                	li	a0,0
}
    1c98:	8082                	ret
    return n ? (void *)s : 0;
    1c9a:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1c9c:	f275                	bnez	a2,1c80 <memchr+0x6e>
}
    1c9e:	8082                	ret

0000000000001ca0 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1ca0:	1101                	addi	sp,sp,-32
    1ca2:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1ca4:	862e                	mv	a2,a1
{
    1ca6:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1ca8:	4581                	li	a1,0
{
    1caa:	e426                	sd	s1,8(sp)
    1cac:	ec06                	sd	ra,24(sp)
    1cae:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1cb0:	f63ff0ef          	jal	ra,1c12 <memchr>
    return p ? p - s : n;
    1cb4:	c519                	beqz	a0,1cc2 <strnlen+0x22>
}
    1cb6:	60e2                	ld	ra,24(sp)
    1cb8:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1cba:	8d05                	sub	a0,a0,s1
}
    1cbc:	64a2                	ld	s1,8(sp)
    1cbe:	6105                	addi	sp,sp,32
    1cc0:	8082                	ret
    1cc2:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1cc4:	8522                	mv	a0,s0
}
    1cc6:	6442                	ld	s0,16(sp)
    1cc8:	64a2                	ld	s1,8(sp)
    1cca:	6105                	addi	sp,sp,32
    1ccc:	8082                	ret

0000000000001cce <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1cce:	00b547b3          	xor	a5,a0,a1
    1cd2:	8b9d                	andi	a5,a5,7
    1cd4:	eb95                	bnez	a5,1d08 <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1cd6:	0075f793          	andi	a5,a1,7
    1cda:	e7b1                	bnez	a5,1d26 <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1cdc:	6198                	ld	a4,0(a1)
    1cde:	00000617          	auipc	a2,0x0
    1ce2:	29a63603          	ld	a2,666(a2) # 1f78 <stpncpy+0x23e>
    1ce6:	00000817          	auipc	a6,0x0
    1cea:	29a83803          	ld	a6,666(a6) # 1f80 <stpncpy+0x246>
    1cee:	a029                	j	1cf8 <stpcpy+0x2a>
    1cf0:	e118                	sd	a4,0(a0)
    1cf2:	6598                	ld	a4,8(a1)
    1cf4:	05a1                	addi	a1,a1,8
    1cf6:	0521                	addi	a0,a0,8
    1cf8:	00c707b3          	add	a5,a4,a2
    1cfc:	fff74693          	not	a3,a4
    1d00:	8ff5                	and	a5,a5,a3
    1d02:	0107f7b3          	and	a5,a5,a6
    1d06:	d7ed                	beqz	a5,1cf0 <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1d08:	0005c783          	lbu	a5,0(a1)
    1d0c:	00f50023          	sb	a5,0(a0)
    1d10:	c785                	beqz	a5,1d38 <stpcpy+0x6a>
    1d12:	0015c783          	lbu	a5,1(a1)
    1d16:	0505                	addi	a0,a0,1
    1d18:	0585                	addi	a1,a1,1
    1d1a:	00f50023          	sb	a5,0(a0)
    1d1e:	fbf5                	bnez	a5,1d12 <stpcpy+0x44>
        ;
    return d;
}
    1d20:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1d22:	0505                	addi	a0,a0,1
    1d24:	df45                	beqz	a4,1cdc <stpcpy+0xe>
            if (!(*d = *s))
    1d26:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1d2a:	0585                	addi	a1,a1,1
    1d2c:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1d30:	00f50023          	sb	a5,0(a0)
    1d34:	f7fd                	bnez	a5,1d22 <stpcpy+0x54>
}
    1d36:	8082                	ret
    1d38:	8082                	ret

0000000000001d3a <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1d3a:	00b547b3          	xor	a5,a0,a1
    1d3e:	8b9d                	andi	a5,a5,7
    1d40:	1a079863          	bnez	a5,1ef0 <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1d44:	0075f793          	andi	a5,a1,7
    1d48:	16078463          	beqz	a5,1eb0 <stpncpy+0x176>
    1d4c:	ea01                	bnez	a2,1d5c <stpncpy+0x22>
    1d4e:	a421                	j	1f56 <stpncpy+0x21c>
    1d50:	167d                	addi	a2,a2,-1
    1d52:	0505                	addi	a0,a0,1
    1d54:	14070e63          	beqz	a4,1eb0 <stpncpy+0x176>
    1d58:	1a060863          	beqz	a2,1f08 <stpncpy+0x1ce>
    1d5c:	0005c783          	lbu	a5,0(a1)
    1d60:	0585                	addi	a1,a1,1
    1d62:	0075f713          	andi	a4,a1,7
    1d66:	00f50023          	sb	a5,0(a0)
    1d6a:	f3fd                	bnez	a5,1d50 <stpncpy+0x16>
    1d6c:	4805                	li	a6,1
    1d6e:	1a061863          	bnez	a2,1f1e <stpncpy+0x1e4>
    1d72:	40a007b3          	neg	a5,a0
    1d76:	8b9d                	andi	a5,a5,7
    1d78:	4681                	li	a3,0
    1d7a:	18061a63          	bnez	a2,1f0e <stpncpy+0x1d4>
    1d7e:	00778713          	addi	a4,a5,7
    1d82:	45ad                	li	a1,11
    1d84:	18b76363          	bltu	a4,a1,1f0a <stpncpy+0x1d0>
    1d88:	1ae6eb63          	bltu	a3,a4,1f3e <stpncpy+0x204>
    1d8c:	1a078363          	beqz	a5,1f32 <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d90:	00050023          	sb	zero,0(a0)
    1d94:	4685                	li	a3,1
    1d96:	00150713          	addi	a4,a0,1
    1d9a:	18d78f63          	beq	a5,a3,1f38 <stpncpy+0x1fe>
    1d9e:	000500a3          	sb	zero,1(a0)
    1da2:	4689                	li	a3,2
    1da4:	00250713          	addi	a4,a0,2
    1da8:	18d78e63          	beq	a5,a3,1f44 <stpncpy+0x20a>
    1dac:	00050123          	sb	zero,2(a0)
    1db0:	468d                	li	a3,3
    1db2:	00350713          	addi	a4,a0,3
    1db6:	16d78c63          	beq	a5,a3,1f2e <stpncpy+0x1f4>
    1dba:	000501a3          	sb	zero,3(a0)
    1dbe:	4691                	li	a3,4
    1dc0:	00450713          	addi	a4,a0,4
    1dc4:	18d78263          	beq	a5,a3,1f48 <stpncpy+0x20e>
    1dc8:	00050223          	sb	zero,4(a0)
    1dcc:	4695                	li	a3,5
    1dce:	00550713          	addi	a4,a0,5
    1dd2:	16d78d63          	beq	a5,a3,1f4c <stpncpy+0x212>
    1dd6:	000502a3          	sb	zero,5(a0)
    1dda:	469d                	li	a3,7
    1ddc:	00650713          	addi	a4,a0,6
    1de0:	16d79863          	bne	a5,a3,1f50 <stpncpy+0x216>
    1de4:	00750713          	addi	a4,a0,7
    1de8:	00050323          	sb	zero,6(a0)
    1dec:	40f80833          	sub	a6,a6,a5
    1df0:	ff887593          	andi	a1,a6,-8
    1df4:	97aa                	add	a5,a5,a0
    1df6:	95be                	add	a1,a1,a5
    1df8:	0007b023          	sd	zero,0(a5)
    1dfc:	07a1                	addi	a5,a5,8
    1dfe:	feb79de3          	bne	a5,a1,1df8 <stpncpy+0xbe>
    1e02:	ff887593          	andi	a1,a6,-8
    1e06:	9ead                	addw	a3,a3,a1
    1e08:	00b707b3          	add	a5,a4,a1
    1e0c:	12b80863          	beq	a6,a1,1f3c <stpncpy+0x202>
    1e10:	00078023          	sb	zero,0(a5)
    1e14:	0016871b          	addiw	a4,a3,1
    1e18:	0ec77863          	bgeu	a4,a2,1f08 <stpncpy+0x1ce>
    1e1c:	000780a3          	sb	zero,1(a5)
    1e20:	0026871b          	addiw	a4,a3,2
    1e24:	0ec77263          	bgeu	a4,a2,1f08 <stpncpy+0x1ce>
    1e28:	00078123          	sb	zero,2(a5)
    1e2c:	0036871b          	addiw	a4,a3,3
    1e30:	0cc77c63          	bgeu	a4,a2,1f08 <stpncpy+0x1ce>
    1e34:	000781a3          	sb	zero,3(a5)
    1e38:	0046871b          	addiw	a4,a3,4
    1e3c:	0cc77663          	bgeu	a4,a2,1f08 <stpncpy+0x1ce>
    1e40:	00078223          	sb	zero,4(a5)
    1e44:	0056871b          	addiw	a4,a3,5
    1e48:	0cc77063          	bgeu	a4,a2,1f08 <stpncpy+0x1ce>
    1e4c:	000782a3          	sb	zero,5(a5)
    1e50:	0066871b          	addiw	a4,a3,6
    1e54:	0ac77a63          	bgeu	a4,a2,1f08 <stpncpy+0x1ce>
    1e58:	00078323          	sb	zero,6(a5)
    1e5c:	0076871b          	addiw	a4,a3,7
    1e60:	0ac77463          	bgeu	a4,a2,1f08 <stpncpy+0x1ce>
    1e64:	000783a3          	sb	zero,7(a5)
    1e68:	0086871b          	addiw	a4,a3,8
    1e6c:	08c77e63          	bgeu	a4,a2,1f08 <stpncpy+0x1ce>
    1e70:	00078423          	sb	zero,8(a5)
    1e74:	0096871b          	addiw	a4,a3,9
    1e78:	08c77863          	bgeu	a4,a2,1f08 <stpncpy+0x1ce>
    1e7c:	000784a3          	sb	zero,9(a5)
    1e80:	00a6871b          	addiw	a4,a3,10
    1e84:	08c77263          	bgeu	a4,a2,1f08 <stpncpy+0x1ce>
    1e88:	00078523          	sb	zero,10(a5)
    1e8c:	00b6871b          	addiw	a4,a3,11
    1e90:	06c77c63          	bgeu	a4,a2,1f08 <stpncpy+0x1ce>
    1e94:	000785a3          	sb	zero,11(a5)
    1e98:	00c6871b          	addiw	a4,a3,12
    1e9c:	06c77663          	bgeu	a4,a2,1f08 <stpncpy+0x1ce>
    1ea0:	00078623          	sb	zero,12(a5)
    1ea4:	26b5                	addiw	a3,a3,13
    1ea6:	06c6f163          	bgeu	a3,a2,1f08 <stpncpy+0x1ce>
    1eaa:	000786a3          	sb	zero,13(a5)
    1eae:	8082                	ret
            ;
        if (!n || !*s)
    1eb0:	c645                	beqz	a2,1f58 <stpncpy+0x21e>
    1eb2:	0005c783          	lbu	a5,0(a1)
    1eb6:	ea078be3          	beqz	a5,1d6c <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1eba:	479d                	li	a5,7
    1ebc:	02c7ff63          	bgeu	a5,a2,1efa <stpncpy+0x1c0>
    1ec0:	00000897          	auipc	a7,0x0
    1ec4:	0b88b883          	ld	a7,184(a7) # 1f78 <stpncpy+0x23e>
    1ec8:	00000817          	auipc	a6,0x0
    1ecc:	0b883803          	ld	a6,184(a6) # 1f80 <stpncpy+0x246>
    1ed0:	431d                	li	t1,7
    1ed2:	6198                	ld	a4,0(a1)
    1ed4:	011707b3          	add	a5,a4,a7
    1ed8:	fff74693          	not	a3,a4
    1edc:	8ff5                	and	a5,a5,a3
    1ede:	0107f7b3          	and	a5,a5,a6
    1ee2:	ef81                	bnez	a5,1efa <stpncpy+0x1c0>
            *wd = *ws;
    1ee4:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ee6:	1661                	addi	a2,a2,-8
    1ee8:	05a1                	addi	a1,a1,8
    1eea:	0521                	addi	a0,a0,8
    1eec:	fec363e3          	bltu	t1,a2,1ed2 <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1ef0:	e609                	bnez	a2,1efa <stpncpy+0x1c0>
    1ef2:	a08d                	j	1f54 <stpncpy+0x21a>
    1ef4:	167d                	addi	a2,a2,-1
    1ef6:	0505                	addi	a0,a0,1
    1ef8:	ca01                	beqz	a2,1f08 <stpncpy+0x1ce>
    1efa:	0005c783          	lbu	a5,0(a1)
    1efe:	0585                	addi	a1,a1,1
    1f00:	00f50023          	sb	a5,0(a0)
    1f04:	fbe5                	bnez	a5,1ef4 <stpncpy+0x1ba>
        ;
tail:
    1f06:	b59d                	j	1d6c <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1f08:	8082                	ret
    1f0a:	472d                	li	a4,11
    1f0c:	bdb5                	j	1d88 <stpncpy+0x4e>
    1f0e:	00778713          	addi	a4,a5,7
    1f12:	45ad                	li	a1,11
    1f14:	fff60693          	addi	a3,a2,-1
    1f18:	e6b778e3          	bgeu	a4,a1,1d88 <stpncpy+0x4e>
    1f1c:	b7fd                	j	1f0a <stpncpy+0x1d0>
    1f1e:	40a007b3          	neg	a5,a0
    1f22:	8832                	mv	a6,a2
    1f24:	8b9d                	andi	a5,a5,7
    1f26:	4681                	li	a3,0
    1f28:	e4060be3          	beqz	a2,1d7e <stpncpy+0x44>
    1f2c:	b7cd                	j	1f0e <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1f2e:	468d                	li	a3,3
    1f30:	bd75                	j	1dec <stpncpy+0xb2>
    1f32:	872a                	mv	a4,a0
    1f34:	4681                	li	a3,0
    1f36:	bd5d                	j	1dec <stpncpy+0xb2>
    1f38:	4685                	li	a3,1
    1f3a:	bd4d                	j	1dec <stpncpy+0xb2>
    1f3c:	8082                	ret
    1f3e:	87aa                	mv	a5,a0
    1f40:	4681                	li	a3,0
    1f42:	b5f9                	j	1e10 <stpncpy+0xd6>
    1f44:	4689                	li	a3,2
    1f46:	b55d                	j	1dec <stpncpy+0xb2>
    1f48:	4691                	li	a3,4
    1f4a:	b54d                	j	1dec <stpncpy+0xb2>
    1f4c:	4695                	li	a3,5
    1f4e:	bd79                	j	1dec <stpncpy+0xb2>
    1f50:	4699                	li	a3,6
    1f52:	bd69                	j	1dec <stpncpy+0xb2>
    1f54:	8082                	ret
    1f56:	8082                	ret
    1f58:	8082                	ret
