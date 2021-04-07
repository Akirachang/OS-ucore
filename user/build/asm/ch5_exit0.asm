
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch5_exit0:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0260006f          	j	1028 <__start_main>

0000000000001006 <main>:
辅助测例，正常退出，不输出 FAIL 即可。
*/

int main()
{
    exit(66778);
    1006:	6541                	lui	a0,0x10
{
    1008:	1141                	addi	sp,sp,-16
    exit(66778);
    100a:	4da50513          	addi	a0,a0,1242 # 104da <digits+0xe54a>
{
    100e:	e406                	sd	ra,8(sp)
    exit(66778);
    1010:	092000ef          	jal	ra,10a2 <exit>
    panic("FAIL: T.T\n");
    1014:	00001517          	auipc	a0,0x1
    1018:	f4c50513          	addi	a0,a0,-180 # 1f60 <stpncpy+0x224>
    101c:	020000ef          	jal	ra,103c <panic>
    return 0;
    1020:	60a2                	ld	ra,8(sp)
    1022:	4501                	li	a0,0
    1024:	0141                	addi	sp,sp,16
    1026:	8082                	ret

0000000000001028 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1028:	1141                	addi	sp,sp,-16
    102a:	e406                	sd	ra,8(sp)
    exit(main());
    102c:	fdbff0ef          	jal	ra,1006 <main>
    1030:	072000ef          	jal	ra,10a2 <exit>
    return 0;
}
    1034:	60a2                	ld	ra,8(sp)
    1036:	4501                	li	a0,0
    1038:	0141                	addi	sp,sp,16
    103a:	8082                	ret

000000000000103c <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    103c:	1141                	addi	sp,sp,-16
    103e:	e406                	sd	ra,8(sp)
    puts(m);
    1040:	22a000ef          	jal	ra,126a <puts>
    exit(-100);
}
    1044:	60a2                	ld	ra,8(sp)
    exit(-100);
    1046:	f9c00513          	li	a0,-100
}
    104a:	0141                	addi	sp,sp,16
    exit(-100);
    104c:	0560006f          	j	10a2 <exit>

0000000000001050 <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1050:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1054:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1056:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    105a:	2501                	sext.w	a0,a0
    105c:	8082                	ret

000000000000105e <close>:
    register long a7 __asm__("a7") = n;
    105e:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1062:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1066:	2501                	sext.w	a0,a0
    1068:	8082                	ret

000000000000106a <read>:
    register long a7 __asm__("a7") = n;
    106a:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    106e:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1072:	8082                	ret

0000000000001074 <write>:
    register long a7 __asm__("a7") = n;
    1074:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1078:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    107c:	8082                	ret

000000000000107e <getpid>:
    register long a7 __asm__("a7") = n;
    107e:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1082:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1086:	2501                	sext.w	a0,a0
    1088:	8082                	ret

000000000000108a <sched_yield>:
    register long a7 __asm__("a7") = n;
    108a:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    108e:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1092:	2501                	sext.w	a0,a0
    1094:	8082                	ret

0000000000001096 <fork>:
    register long a7 __asm__("a7") = n;
    1096:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    109a:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    109e:	2501                	sext.w	a0,a0
    10a0:	8082                	ret

00000000000010a2 <exit>:
    register long a7 __asm__("a7") = n;
    10a2:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    10a6:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    10aa:	8082                	ret

00000000000010ac <waitpid>:
    register long a7 __asm__("a7") = n;
    10ac:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    10b0:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    10b4:	2501                	sext.w	a0,a0
    10b6:	8082                	ret

00000000000010b8 <exec>:
    register long a7 __asm__("a7") = n;
    10b8:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    10bc:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    10c0:	2501                	sext.w	a0,a0
    10c2:	8082                	ret

00000000000010c4 <get_time>:

int64 get_time()
{
    10c4:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    10c6:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    10ca:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    10cc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    10ce:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    10d2:	2501                	sext.w	a0,a0
    10d4:	ed09                	bnez	a0,10ee <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    10d6:	67a2                	ld	a5,8(sp)
    10d8:	3e800713          	li	a4,1000
    10dc:	00015503          	lhu	a0,0(sp)
    10e0:	02e7d7b3          	divu	a5,a5,a4
    10e4:	02e50533          	mul	a0,a0,a4
    10e8:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    10ea:	0141                	addi	sp,sp,16
    10ec:	8082                	ret
        return -1;
    10ee:	557d                	li	a0,-1
    10f0:	bfed                	j	10ea <get_time+0x26>

00000000000010f2 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    10f2:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    10f6:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    10fa:	2501                	sext.w	a0,a0
    10fc:	8082                	ret

00000000000010fe <sleep>:

int sleep(unsigned long long time)
{
    10fe:	1141                	addi	sp,sp,-16
    1100:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1102:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1106:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1108:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    110a:	00000073          	ecall
    if (err == 0)
    110e:	2501                	sext.w	a0,a0
    1110:	e13d                	bnez	a0,1176 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1112:	6722                	ld	a4,8(sp)
    1114:	3e800693          	li	a3,1000
    1118:	00015783          	lhu	a5,0(sp)
    111c:	02d75733          	divu	a4,a4,a3
    1120:	02d787b3          	mul	a5,a5,a3
    1124:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1126:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    112a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    112c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    112e:	00000073          	ecall
    if (err == 0)
    1132:	2501                	sext.w	a0,a0
    1134:	ed15                	bnez	a0,1170 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1136:	6841                	lui	a6,0x10
    1138:	963e                	add	a2,a2,a5
    113a:	187d                	addi	a6,a6,-1
    113c:	3e800693          	li	a3,1000
    1140:	a819                	j	1156 <sleep+0x58>
    __asm_syscall("r"(a7))
    1142:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1146:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    114a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    114c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    114e:	00000073          	ecall
    if (err == 0)
    1152:	2501                	sext.w	a0,a0
    1154:	ed11                	bnez	a0,1170 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1156:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1158:	07c00893          	li	a7,124
    115c:	02d7d733          	divu	a4,a5,a3
    1160:	6782                	ld	a5,0(sp)
    1162:	0107f7b3          	and	a5,a5,a6
    1166:	02d787b3          	mul	a5,a5,a3
    116a:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    116c:	fcc7ebe3          	bltu	a5,a2,1142 <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1170:	4501                	li	a0,0
    1172:	0141                	addi	sp,sp,16
    1174:	8082                	ret
    1176:	57fd                	li	a5,-1
    1178:	b77d                	j	1126 <sleep+0x28>

000000000000117a <set_priority>:
    register long a7 __asm__("a7") = n;
    117a:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    117e:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1182:	2501                	sext.w	a0,a0
    1184:	8082                	ret

0000000000001186 <mmap>:
    register long a7 __asm__("a7") = n;
    1186:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    118a:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    118e:	2501                	sext.w	a0,a0
    1190:	8082                	ret

0000000000001192 <munmap>:
    register long a7 __asm__("a7") = n;
    1192:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1196:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    119a:	2501                	sext.w	a0,a0
    119c:	8082                	ret

000000000000119e <wait>:

int wait(int *code)
{
    119e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    11a0:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    11a4:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    11a6:	00000073          	ecall
    return waitpid(-1, code);
}
    11aa:	2501                	sext.w	a0,a0
    11ac:	8082                	ret

00000000000011ae <spawn>:
    register long a7 __asm__("a7") = n;
    11ae:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    11b2:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    11b6:	2501                	sext.w	a0,a0
    11b8:	8082                	ret

00000000000011ba <mailread>:
    register long a7 __asm__("a7") = n;
    11ba:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    11be:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    11c2:	2501                	sext.w	a0,a0
    11c4:	8082                	ret

00000000000011c6 <mailwrite>:
    register long a7 __asm__("a7") = n;
    11c6:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    11ca:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    11ce:	2501                	sext.w	a0,a0
    11d0:	8082                	ret

00000000000011d2 <fstat>:
    register long a7 __asm__("a7") = n;
    11d2:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    11d6:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    11da:	2501                	sext.w	a0,a0
    11dc:	8082                	ret

00000000000011de <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    11de:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    11e0:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    11e4:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    11e6:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    11ea:	2501                	sext.w	a0,a0
    11ec:	8082                	ret

00000000000011ee <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    11ee:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    11f0:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    11f4:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    11f6:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    11fa:	2501                	sext.w	a0,a0
    11fc:	8082                	ret

00000000000011fe <link>:

int link(char *old_path, char *new_path)
{
    11fe:	87aa                	mv	a5,a0
    1200:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1202:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1206:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    120a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    120c:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1210:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1212:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1216:	2501                	sext.w	a0,a0
    1218:	8082                	ret

000000000000121a <unlink>:

int unlink(char *path)
{
    121a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    121c:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1220:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1224:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1226:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    122a:	2501                	sext.w	a0,a0
    122c:	8082                	ret

000000000000122e <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    122e:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    1230:	00f10593          	addi	a1,sp,15
    1234:	4605                	li	a2,1
    1236:	4501                	li	a0,0
{
    1238:	ec06                	sd	ra,24(sp)
    char byte = 0;
    123a:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    123e:	e2dff0ef          	jal	ra,106a <read>
    return byte;
}
    1242:	60e2                	ld	ra,24(sp)
    1244:	00f14503          	lbu	a0,15(sp)
    1248:	6105                	addi	sp,sp,32
    124a:	8082                	ret

000000000000124c <putchar>:

int putchar(int c)
{
    124c:	1101                	addi	sp,sp,-32
    124e:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    1250:	00f10593          	addi	a1,sp,15
    1254:	4605                	li	a2,1
    1256:	4505                	li	a0,1
{
    1258:	ec06                	sd	ra,24(sp)
    char byte = c;
    125a:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    125e:	e17ff0ef          	jal	ra,1074 <write>
}
    1262:	60e2                	ld	ra,24(sp)
    1264:	2501                	sext.w	a0,a0
    1266:	6105                	addi	sp,sp,32
    1268:	8082                	ret

000000000000126a <puts>:

int puts(const char *s)
{
    126a:	1101                	addi	sp,sp,-32
    126c:	e822                	sd	s0,16(sp)
    126e:	ec06                	sd	ra,24(sp)
    1270:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    1272:	145000ef          	jal	ra,1bb6 <strlen>
    1276:	862a                	mv	a2,a0
    1278:	85a2                	mv	a1,s0
    127a:	4505                	li	a0,1
    127c:	df9ff0ef          	jal	ra,1074 <write>
    1280:	00055763          	bgez	a0,128e <puts+0x24>
    return r;
}
    1284:	60e2                	ld	ra,24(sp)
    1286:	6442                	ld	s0,16(sp)
    1288:	557d                	li	a0,-1
    128a:	6105                	addi	sp,sp,32
    128c:	8082                	ret
    return write(stdout, &byte, 1);
    128e:	00f10593          	addi	a1,sp,15
    char byte = c;
    1292:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    1294:	4605                	li	a2,1
    1296:	4505                	li	a0,1
    char byte = c;
    1298:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    129c:	dd9ff0ef          	jal	ra,1074 <write>
}
    12a0:	60e2                	ld	ra,24(sp)
    12a2:	6442                	ld	s0,16(sp)
    12a4:	41f5551b          	sraiw	a0,a0,0x1f
    12a8:	6105                	addi	sp,sp,32
    12aa:	8082                	ret

00000000000012ac <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12ac:	7131                	addi	sp,sp,-192
    12ae:	ecce                	sd	s3,88(sp)
    12b0:	e8d2                	sd	s4,80(sp)
    12b2:	e4d6                	sd	s5,72(sp)
    12b4:	e0da                	sd	s6,64(sp)
    12b6:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    12b8:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12ba:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    12bc:	6ae1                	lui	s5,0x18
    12be:	000f4a37          	lui	s4,0xf4
    12c2:	00989b37          	lui	s6,0x989
{
    12c6:	fc86                	sd	ra,120(sp)
    12c8:	f8a2                	sd	s0,112(sp)
    12ca:	f4a6                	sd	s1,104(sp)
    12cc:	f0ca                	sd	s2,96(sp)
    12ce:	fc5e                	sd	s7,56(sp)
    12d0:	e52e                	sd	a1,136(sp)
    12d2:	e932                	sd	a2,144(sp)
    12d4:	ed36                	sd	a3,152(sp)
    12d6:	f13a                	sd	a4,160(sp)
    12d8:	f942                	sd	a6,176(sp)
    12da:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    12dc:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    12de:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x77f>
    12e2:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x1670f>
    12e6:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf22af>
    12ea:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x9876ef>
    for (;;)
    {
        if (!*s)
    12ee:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    12f2:	02500913          	li	s2,37
        if (!*s)
    12f6:	1a078f63          	beqz	a5,14b4 <printf+0x208>
    12fa:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    12fc:	17278e63          	beq	a5,s2,1478 <printf+0x1cc>
    1300:	00164783          	lbu	a5,1(a2)
    1304:	0605                	addi	a2,a2,1
    1306:	fbfd                	bnez	a5,12fc <printf+0x50>
    1308:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    130a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    130e:	85aa                	mv	a1,a0
    1310:	8622                	mv	a2,s0
    1312:	4505                	li	a0,1
    1314:	d61ff0ef          	jal	ra,1074 <write>
        out(f, a, l);
        if (l)
    1318:	18041963          	bnez	s0,14aa <printf+0x1fe>
            continue;
        if (s[1] == 0)
    131c:	0014c783          	lbu	a5,1(s1)
    1320:	18078a63          	beqz	a5,14b4 <printf+0x208>
            break;
        switch (s[1])
    1324:	07300713          	li	a4,115
    1328:	28e78e63          	beq	a5,a4,15c4 <printf+0x318>
    132c:	18f76f63          	bltu	a4,a5,14ca <printf+0x21e>
    1330:	06400713          	li	a4,100
    1334:	2ae78c63          	beq	a5,a4,15ec <printf+0x340>
    1338:	07000713          	li	a4,112
    133c:	3ce79c63          	bne	a5,a4,1714 <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1340:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1342:	00001797          	auipc	a5,0x1
    1346:	c4e78793          	addi	a5,a5,-946 # 1f90 <digits>
            printptr(va_arg(ap, uint64));
    134a:	6298                	ld	a4,0(a3)
    134c:	00868093          	addi	ra,a3,8
    1350:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1352:	00471293          	slli	t0,a4,0x4
    1356:	00c71f13          	slli	t5,a4,0xc
    135a:	01471e13          	slli	t3,a4,0x14
    135e:	01c71893          	slli	a7,a4,0x1c
    1362:	02471813          	slli	a6,a4,0x24
    1366:	02871513          	slli	a0,a4,0x28
    136a:	02c71593          	slli	a1,a4,0x2c
    136e:	03071693          	slli	a3,a4,0x30
    1372:	00871f93          	slli	t6,a4,0x8
    1376:	01071e93          	slli	t4,a4,0x10
    137a:	01871313          	slli	t1,a4,0x18
    137e:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1382:	03c2d293          	srli	t0,t0,0x3c
    1386:	03cf5f13          	srli	t5,t5,0x3c
    138a:	03ce5e13          	srli	t3,t3,0x3c
    138e:	03c8d893          	srli	a7,a7,0x3c
    1392:	03c85813          	srli	a6,a6,0x3c
    1396:	9171                	srli	a0,a0,0x3c
    1398:	91f1                	srli	a1,a1,0x3c
    139a:	92f1                	srli	a3,a3,0x3c
    139c:	92be                	add	t0,t0,a5
    139e:	9f3e                	add	t5,t5,a5
    13a0:	9e3e                	add	t3,t3,a5
    13a2:	98be                	add	a7,a7,a5
    13a4:	983e                	add	a6,a6,a5
    13a6:	953e                	add	a0,a0,a5
    13a8:	95be                	add	a1,a1,a5
    13aa:	96be                	add	a3,a3,a5
    13ac:	03c75393          	srli	t2,a4,0x3c
    13b0:	01c75b9b          	srliw	s7,a4,0x1c
    13b4:	03cfdf93          	srli	t6,t6,0x3c
    13b8:	03cede93          	srli	t4,t4,0x3c
    13bc:	03c35313          	srli	t1,t1,0x3c
    13c0:	9271                	srli	a2,a2,0x3c
    13c2:	0002c403          	lbu	s0,0(t0)
    13c6:	93be                	add	t2,t2,a5
    13c8:	000f4283          	lbu	t0,0(t5)
    13cc:	9fbe                	add	t6,t6,a5
    13ce:	000e4f03          	lbu	t5,0(t3)
    13d2:	9ebe                	add	t4,t4,a5
    13d4:	0008ce03          	lbu	t3,0(a7)
    13d8:	933e                	add	t1,t1,a5
    13da:	00084883          	lbu	a7,0(a6) # 10000 <digits+0xe070>
    13de:	9bbe                	add	s7,s7,a5
    13e0:	00054803          	lbu	a6,0(a0)
    13e4:	963e                	add	a2,a2,a5
    13e6:	0005c503          	lbu	a0,0(a1)
    13ea:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13ee:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13f2:	0003c903          	lbu	s2,0(t2)
    13f6:	00064603          	lbu	a2,0(a2)
    13fa:	000fc383          	lbu	t2,0(t6)
    13fe:	8b3d                	andi	a4,a4,15
    1400:	000ecf83          	lbu	t6,0(t4)
    1404:	92f1                	srli	a3,a3,0x3c
    1406:	00034e83          	lbu	t4,0(t1)
    140a:	000bc303          	lbu	t1,0(s7)
    140e:	96be                	add	a3,a3,a5
    1410:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    1412:	7761                	lui	a4,0xffff8
    1414:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1418:	00710623          	sb	t2,12(sp)
    141c:	005106a3          	sb	t0,13(sp)
    1420:	01f10723          	sb	t6,14(sp)
    1424:	01e107a3          	sb	t5,15(sp)
    1428:	01d10823          	sb	t4,16(sp)
    142c:	01c108a3          	sb	t3,17(sp)
    1430:	00610923          	sb	t1,18(sp)
    1434:	011109a3          	sb	a7,19(sp)
    1438:	01010a23          	sb	a6,20(sp)
    143c:	00a10aa3          	sb	a0,21(sp)
    1440:	00b10b23          	sb	a1,22(sp)
    1444:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    1448:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    144c:	01210523          	sb	s2,10(sp)
    1450:	008105a3          	sb	s0,11(sp)
    1454:	0006c703          	lbu	a4,0(a3)
    1458:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    145c:	4649                	li	a2,18
    145e:	002c                	addi	a1,sp,8
    1460:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1462:	00e10c23          	sb	a4,24(sp)
    1466:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    146a:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    146e:	c07ff0ef          	jal	ra,1074 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1472:	00248513          	addi	a0,s1,2
    1476:	bda5                	j	12ee <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1478:	00064783          	lbu	a5,0(a2)
    147c:	84b2                	mv	s1,a2
    147e:	01278963          	beq	a5,s2,1490 <printf+0x1e4>
    1482:	b561                	j	130a <printf+0x5e>
    1484:	0024c783          	lbu	a5,2(s1)
    1488:	0605                	addi	a2,a2,1
    148a:	0489                	addi	s1,s1,2
    148c:	e7279fe3          	bne	a5,s2,130a <printf+0x5e>
    1490:	0014c783          	lbu	a5,1(s1)
    1494:	ff2788e3          	beq	a5,s2,1484 <printf+0x1d8>
        l = z - a;
    1498:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    149c:	85aa                	mv	a1,a0
    149e:	8622                	mv	a2,s0
    14a0:	4505                	li	a0,1
    14a2:	bd3ff0ef          	jal	ra,1074 <write>
        if (l)
    14a6:	e6040be3          	beqz	s0,131c <printf+0x70>
    14aa:	8526                	mv	a0,s1
        if (!*s)
    14ac:	00054783          	lbu	a5,0(a0)
    14b0:	e40795e3          	bnez	a5,12fa <printf+0x4e>
    }
    va_end(ap);
    14b4:	70e6                	ld	ra,120(sp)
    14b6:	7446                	ld	s0,112(sp)
    14b8:	74a6                	ld	s1,104(sp)
    14ba:	7906                	ld	s2,96(sp)
    14bc:	69e6                	ld	s3,88(sp)
    14be:	6a46                	ld	s4,80(sp)
    14c0:	6aa6                	ld	s5,72(sp)
    14c2:	6b06                	ld	s6,64(sp)
    14c4:	7be2                	ld	s7,56(sp)
    14c6:	6129                	addi	sp,sp,192
    14c8:	8082                	ret
        switch (s[1])
    14ca:	07800713          	li	a4,120
    14ce:	24e79363          	bne	a5,a4,1714 <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    14d2:	6782                	ld	a5,0(sp)
    14d4:	4394                	lw	a3,0(a5)
    14d6:	07a1                	addi	a5,a5,8
    14d8:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    14da:	2606c263          	bltz	a3,173e <printf+0x492>
        buf[i--] = digits[x % base];
    14de:	00001797          	auipc	a5,0x1
    14e2:	ab278793          	addi	a5,a5,-1358 # 1f90 <digits>
    14e6:	00f6f713          	andi	a4,a3,15
    14ea:	973e                	add	a4,a4,a5
    14ec:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff6070>
    buf[16] = 0;
    14f0:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    14f4:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    14f6:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    14fa:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    14fe:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    1502:	0046d51b          	srliw	a0,a3,0x4
    1506:	0ad5d563          	bge	a1,a3,15b0 <printf+0x304>
        buf[i--] = digits[x % base];
    150a:	8a3d                	andi	a2,a2,15
    150c:	963e                	add	a2,a2,a5
    150e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1512:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    1516:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    151a:	30a5fe63          	bgeu	a1,a0,1836 <printf+0x58a>
        buf[i--] = digits[x % base];
    151e:	00f77613          	andi	a2,a4,15
    1522:	963e                	add	a2,a2,a5
    1524:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1528:	45bd                	li	a1,15
    152a:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    152e:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    1532:	00475513          	srli	a0,a4,0x4
    1536:	30e5f963          	bgeu	a1,a4,1848 <printf+0x59c>
        buf[i--] = digits[x % base];
    153a:	8a3d                	andi	a2,a2,15
    153c:	963e                	add	a2,a2,a5
    153e:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    1542:	00875893          	srli	a7,a4,0x8
    1546:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    154a:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    154e:	30a5fd63          	bgeu	a1,a0,1868 <printf+0x5bc>
        buf[i--] = digits[x % base];
    1552:	8a3d                	andi	a2,a2,15
    1554:	963e                	add	a2,a2,a5
    1556:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    155a:	00c75813          	srli	a6,a4,0xc
    155e:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    1562:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    1566:	3315fe63          	bgeu	a1,a7,18a2 <printf+0x5f6>
        buf[i--] = digits[x % base];
    156a:	8a3d                	andi	a2,a2,15
    156c:	963e                	add	a2,a2,a5
    156e:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1572:	01075893          	srli	a7,a4,0x10
    1576:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    157a:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    157e:	3305ff63          	bgeu	a1,a6,18bc <printf+0x610>
        buf[i--] = digits[x % base];
    1582:	8a3d                	andi	a2,a2,15
    1584:	963e                	add	a2,a2,a5
    1586:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    158a:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    158e:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1592:	3515f863          	bgeu	a1,a7,18e2 <printf+0x636>
        buf[i--] = digits[x % base];
    1596:	97ba                	add	a5,a5,a4
    1598:	0007c783          	lbu	a5,0(a5)
    159c:	45a1                	li	a1,8
    159e:	00f10823          	sb	a5,16(sp)
    if (sign)
    15a2:	0006d763          	bgez	a3,15b0 <printf+0x304>
        buf[i--] = '-';
    15a6:	02d00793          	li	a5,45
    15aa:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    15ae:	459d                	li	a1,7
    write(f, s, l);
    15b0:	4641                	li	a2,16
    15b2:	003c                	addi	a5,sp,8
    15b4:	9e0d                	subw	a2,a2,a1
    15b6:	4505                	li	a0,1
    15b8:	95be                	add	a1,a1,a5
    15ba:	abbff0ef          	jal	ra,1074 <write>
        s += 2;
    15be:	00248513          	addi	a0,s1,2
    15c2:	b335                	j	12ee <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    15c4:	6782                	ld	a5,0(sp)
    15c6:	6380                	ld	s0,0(a5)
    15c8:	07a1                	addi	a5,a5,8
    15ca:	e03e                	sd	a5,0(sp)
    15cc:	22040a63          	beqz	s0,1800 <printf+0x554>
            l = strnlen(a, 200);
    15d0:	0c800593          	li	a1,200
    15d4:	8522                	mv	a0,s0
    15d6:	6cc000ef          	jal	ra,1ca2 <strnlen>
    write(f, s, l);
    15da:	0005061b          	sext.w	a2,a0
    15de:	85a2                	mv	a1,s0
    15e0:	4505                	li	a0,1
    15e2:	a93ff0ef          	jal	ra,1074 <write>
        s += 2;
    15e6:	00248513          	addi	a0,s1,2
    15ea:	b311                	j	12ee <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    15ec:	6782                	ld	a5,0(sp)
    15ee:	4390                	lw	a2,0(a5)
    15f0:	07a1                	addi	a5,a5,8
    15f2:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    15f4:	1a064363          	bltz	a2,179a <printf+0x4ee>
        buf[i--] = digits[x % base];
    15f8:	46a9                	li	a3,10
    15fa:	02d6773b          	remuw	a4,a2,a3
    15fe:	00001797          	auipc	a5,0x1
    1602:	99278793          	addi	a5,a5,-1646 # 1f90 <digits>
    buf[16] = 0;
    1606:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    160a:	4525                	li	a0,9
        x = xx;
    160c:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    1610:	973e                	add	a4,a4,a5
    1612:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    1616:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    161a:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    161e:	2cc55063          	bge	a0,a2,18de <printf+0x632>
    1622:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1626:	02d5f73b          	remuw	a4,a1,a3
    162a:	1702                	slli	a4,a4,0x20
    162c:	9301                	srli	a4,a4,0x20
    162e:	973e                	add	a4,a4,a5
    1630:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    1634:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    1638:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    163c:	1f057d63          	bgeu	a0,a6,1836 <printf+0x58a>
        buf[i--] = digits[x % base];
    1640:	4529                	li	a0,10
    } while ((x /= base) != 0);
    1642:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1644:	02a5f73b          	remuw	a4,a1,a0
    1648:	973e                	add	a4,a4,a5
    164a:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    164e:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    1652:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    1656:	1ab6f163          	bgeu	a3,a1,17f8 <printf+0x54c>
    165a:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    165e:	02a776bb          	remuw	a3,a4,a0
    1662:	96be                	add	a3,a3,a5
    1664:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1668:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    166c:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1670:	20b87c63          	bgeu	a6,a1,1888 <printf+0x5dc>
    1674:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    1678:	02a776bb          	remuw	a3,a4,a0
    167c:	96be                	add	a3,a3,a5
    167e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1682:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1686:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    168a:	20b87363          	bgeu	a6,a1,1890 <printf+0x5e4>
        buf[i--] = digits[x % base];
    168e:	02a776bb          	remuw	a3,a4,a0
    1692:	96be                	add	a3,a3,a5
    1694:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1698:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    169c:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    16a0:	20b9f563          	bgeu	s3,a1,18aa <printf+0x5fe>
        buf[i--] = digits[x % base];
    16a4:	02a776bb          	remuw	a3,a4,a0
    16a8:	96be                	add	a3,a3,a5
    16aa:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    16ae:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    16b2:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    16b6:	20bafb63          	bgeu	s5,a1,18cc <printf+0x620>
        buf[i--] = digits[x % base];
    16ba:	02a776bb          	remuw	a3,a4,a0
    16be:	96be                	add	a3,a3,a5
    16c0:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    16c4:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    16c8:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    16cc:	1eba7c63          	bgeu	s4,a1,18c4 <printf+0x618>
        buf[i--] = digits[x % base];
    16d0:	02a776bb          	remuw	a3,a4,a0
    16d4:	96be                	add	a3,a3,a5
    16d6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    16da:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    16de:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    16e2:	14bb7163          	bgeu	s6,a1,1824 <printf+0x578>
        buf[i--] = digits[x % base];
    16e6:	1702                	slli	a4,a4,0x20
    16e8:	9301                	srli	a4,a4,0x20
    16ea:	97ba                	add	a5,a5,a4
    16ec:	0007c783          	lbu	a5,0(a5)
    16f0:	4599                	li	a1,6
    16f2:	00f10723          	sb	a5,14(sp)
    if (sign)
    16f6:	ea065de3          	bgez	a2,15b0 <printf+0x304>
        buf[i--] = '-';
    16fa:	02d00793          	li	a5,45
    16fe:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1702:	4595                	li	a1,5
    write(f, s, l);
    1704:	003c                	addi	a5,sp,8
    1706:	4641                	li	a2,16
    1708:	9e0d                	subw	a2,a2,a1
    170a:	4505                	li	a0,1
    170c:	95be                	add	a1,a1,a5
    170e:	967ff0ef          	jal	ra,1074 <write>
    1712:	b575                	j	15be <printf+0x312>
    char byte = c;
    1714:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1718:	4605                	li	a2,1
    171a:	002c                	addi	a1,sp,8
    171c:	4505                	li	a0,1
    char byte = c;
    171e:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1722:	953ff0ef          	jal	ra,1074 <write>
    char byte = c;
    1726:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    172a:	4605                	li	a2,1
    172c:	002c                	addi	a1,sp,8
    172e:	4505                	li	a0,1
    char byte = c;
    1730:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1734:	941ff0ef          	jal	ra,1074 <write>
        s += 2;
    1738:	00248513          	addi	a0,s1,2
    173c:	be4d                	j	12ee <printf+0x42>
        x = -xx;
    173e:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    1742:	00001797          	auipc	a5,0x1
    1746:	84e78793          	addi	a5,a5,-1970 # 1f90 <digits>
    174a:	00f77613          	andi	a2,a4,15
    174e:	963e                	add	a2,a2,a5
    1750:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    1754:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1758:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    175a:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    175e:	0047551b          	srliw	a0,a4,0x4
    1762:	0047561b          	srliw	a2,a4,0x4
    1766:	0ab6d263          	bge	a3,a1,180a <printf+0x55e>
        buf[i--] = digits[x % base];
    176a:	8a3d                	andi	a2,a2,15
    176c:	963e                	add	a2,a2,a5
    176e:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    1772:	463d                	li	a2,15
    1774:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    1778:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    177c:	daa661e3          	bltu	a2,a0,151e <printf+0x272>
        buf[i--] = '-';
    1780:	02d00793          	li	a5,45
    1784:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1788:	45b5                	li	a1,13
    write(f, s, l);
    178a:	003c                	addi	a5,sp,8
    178c:	4641                	li	a2,16
    178e:	9e0d                	subw	a2,a2,a1
    1790:	4505                	li	a0,1
    1792:	95be                	add	a1,a1,a5
    1794:	8e1ff0ef          	jal	ra,1074 <write>
    1798:	b51d                	j	15be <printf+0x312>
        x = -xx;
    179a:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    179e:	46a9                	li	a3,10
    17a0:	02d875bb          	remuw	a1,a6,a3
    17a4:	00000797          	auipc	a5,0x0
    17a8:	7ec78793          	addi	a5,a5,2028 # 1f90 <digits>
    buf[16] = 0;
    17ac:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    17b0:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    17b2:	95be                	add	a1,a1,a5
    17b4:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    17b8:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    17bc:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    17c0:	04a65563          	bge	a2,a0,180a <printf+0x55e>
    17c4:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    17c8:	02d775bb          	remuw	a1,a4,a3
    17cc:	95be                	add	a1,a1,a5
    17ce:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    17d2:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    17d6:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    17da:	fb0573e3          	bgeu	a0,a6,1780 <printf+0x4d4>
        buf[i--] = digits[x % base];
    17de:	4529                	li	a0,10
    } while ((x /= base) != 0);
    17e0:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    17e2:	02a5f73b          	remuw	a4,a1,a0
    17e6:	973e                	add	a4,a4,a5
    17e8:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    17ec:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    17f0:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    17f4:	e6b6e3e3          	bltu	a3,a1,165a <printf+0x3ae>
        buf[i--] = digits[x % base];
    17f8:	45b5                	li	a1,13
    if (sign)
    17fa:	da065be3          	bgez	a2,15b0 <printf+0x304>
    17fe:	a881                	j	184e <printf+0x5a2>
                a = "(null)";
    1800:	00000417          	auipc	s0,0x0
    1804:	77040413          	addi	s0,s0,1904 # 1f70 <stpncpy+0x234>
    1808:	b3e1                	j	15d0 <printf+0x324>
        buf[i--] = '-';
    180a:	02d00793          	li	a5,45
    180e:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1812:	45b9                	li	a1,14
    write(f, s, l);
    1814:	003c                	addi	a5,sp,8
    1816:	4641                	li	a2,16
    1818:	9e0d                	subw	a2,a2,a1
    181a:	4505                	li	a0,1
    181c:	95be                	add	a1,a1,a5
    181e:	857ff0ef          	jal	ra,1074 <write>
    1822:	bb71                	j	15be <printf+0x312>
        buf[i--] = digits[x % base];
    1824:	459d                	li	a1,7
    if (sign)
    1826:	d80655e3          	bgez	a2,15b0 <printf+0x304>
        buf[i--] = '-';
    182a:	02d00793          	li	a5,45
    182e:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1832:	4599                	li	a1,6
    1834:	bbb5                	j	15b0 <printf+0x304>
    1836:	45b9                	li	a1,14
    write(f, s, l);
    1838:	003c                	addi	a5,sp,8
    183a:	4641                	li	a2,16
    183c:	9e0d                	subw	a2,a2,a1
    183e:	4505                	li	a0,1
    1840:	95be                	add	a1,a1,a5
    1842:	833ff0ef          	jal	ra,1074 <write>
    1846:	bba5                	j	15be <printf+0x312>
        buf[i--] = digits[x % base];
    1848:	45b5                	li	a1,13
    if (sign)
    184a:	d606d3e3          	bgez	a3,15b0 <printf+0x304>
        buf[i--] = '-';
    184e:	02d00793          	li	a5,45
    1852:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1856:	45b1                	li	a1,12
    write(f, s, l);
    1858:	003c                	addi	a5,sp,8
    185a:	4641                	li	a2,16
    185c:	9e0d                	subw	a2,a2,a1
    185e:	4505                	li	a0,1
    1860:	95be                	add	a1,a1,a5
    1862:	813ff0ef          	jal	ra,1074 <write>
    1866:	bba1                	j	15be <printf+0x312>
        buf[i--] = digits[x % base];
    1868:	45b1                	li	a1,12
    if (sign)
    186a:	d406d3e3          	bgez	a3,15b0 <printf+0x304>
        buf[i--] = '-';
    186e:	02d00793          	li	a5,45
    1872:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1876:	45ad                	li	a1,11
    write(f, s, l);
    1878:	003c                	addi	a5,sp,8
    187a:	4641                	li	a2,16
    187c:	9e0d                	subw	a2,a2,a1
    187e:	4505                	li	a0,1
    1880:	95be                	add	a1,a1,a5
    1882:	ff2ff0ef          	jal	ra,1074 <write>
    1886:	bb25                	j	15be <printf+0x312>
        buf[i--] = digits[x % base];
    1888:	45b1                	li	a1,12
    if (sign)
    188a:	d20653e3          	bgez	a2,15b0 <printf+0x304>
    188e:	b7c5                	j	186e <printf+0x5c2>
        buf[i--] = digits[x % base];
    1890:	45ad                	li	a1,11
    if (sign)
    1892:	d0065fe3          	bgez	a2,15b0 <printf+0x304>
        buf[i--] = '-';
    1896:	02d00793          	li	a5,45
    189a:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    189e:	45a9                	li	a1,10
    18a0:	bb01                	j	15b0 <printf+0x304>
    18a2:	45ad                	li	a1,11
    if (sign)
    18a4:	d006d6e3          	bgez	a3,15b0 <printf+0x304>
    18a8:	b7fd                	j	1896 <printf+0x5ea>
        buf[i--] = digits[x % base];
    18aa:	45a9                	li	a1,10
    if (sign)
    18ac:	d00652e3          	bgez	a2,15b0 <printf+0x304>
        buf[i--] = '-';
    18b0:	02d00793          	li	a5,45
    18b4:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    18b8:	45a5                	li	a1,9
    18ba:	b9dd                	j	15b0 <printf+0x304>
    18bc:	45a9                	li	a1,10
    if (sign)
    18be:	ce06d9e3          	bgez	a3,15b0 <printf+0x304>
    18c2:	b7fd                	j	18b0 <printf+0x604>
        buf[i--] = digits[x % base];
    18c4:	45a1                	li	a1,8
    if (sign)
    18c6:	ce0655e3          	bgez	a2,15b0 <printf+0x304>
    18ca:	b9f1                	j	15a6 <printf+0x2fa>
        buf[i--] = digits[x % base];
    18cc:	45a5                	li	a1,9
    if (sign)
    18ce:	ce0651e3          	bgez	a2,15b0 <printf+0x304>
        buf[i--] = '-';
    18d2:	02d00793          	li	a5,45
    18d6:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    18da:	45a1                	li	a1,8
    18dc:	b9d1                	j	15b0 <printf+0x304>
    i = 15;
    18de:	45bd                	li	a1,15
    18e0:	b9c1                	j	15b0 <printf+0x304>
        buf[i--] = digits[x % base];
    18e2:	45a5                	li	a1,9
    if (sign)
    18e4:	cc06d6e3          	bgez	a3,15b0 <printf+0x304>
    18e8:	b7ed                	j	18d2 <printf+0x626>

00000000000018ea <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    18ea:	02000793          	li	a5,32
    18ee:	00f50663          	beq	a0,a5,18fa <isspace+0x10>
    18f2:	355d                	addiw	a0,a0,-9
    18f4:	00553513          	sltiu	a0,a0,5
    18f8:	8082                	ret
    18fa:	4505                	li	a0,1
}
    18fc:	8082                	ret

00000000000018fe <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    18fe:	fd05051b          	addiw	a0,a0,-48
}
    1902:	00a53513          	sltiu	a0,a0,10
    1906:	8082                	ret

0000000000001908 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1908:	02000613          	li	a2,32
    190c:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    190e:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1912:	ff77069b          	addiw	a3,a4,-9
    1916:	04c70d63          	beq	a4,a2,1970 <atoi+0x68>
    191a:	0007079b          	sext.w	a5,a4
    191e:	04d5f963          	bgeu	a1,a3,1970 <atoi+0x68>
        s++;
    switch (*s)
    1922:	02b00693          	li	a3,43
    1926:	04d70a63          	beq	a4,a3,197a <atoi+0x72>
    192a:	02d00693          	li	a3,45
    192e:	06d70463          	beq	a4,a3,1996 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1932:	fd07859b          	addiw	a1,a5,-48
    1936:	4625                	li	a2,9
    1938:	873e                	mv	a4,a5
    193a:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    193c:	4e01                	li	t3,0
    while (isdigit(*s))
    193e:	04b66a63          	bltu	a2,a1,1992 <atoi+0x8a>
    int n = 0, neg = 0;
    1942:	4501                	li	a0,0
    while (isdigit(*s))
    1944:	4825                	li	a6,9
    1946:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    194a:	0025179b          	slliw	a5,a0,0x2
    194e:	9d3d                	addw	a0,a0,a5
    1950:	fd07031b          	addiw	t1,a4,-48
    1954:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1958:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    195c:	0685                	addi	a3,a3,1
    195e:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1962:	0006071b          	sext.w	a4,a2
    1966:	feb870e3          	bgeu	a6,a1,1946 <atoi+0x3e>
    return neg ? n : -n;
    196a:	000e0563          	beqz	t3,1974 <atoi+0x6c>
}
    196e:	8082                	ret
        s++;
    1970:	0505                	addi	a0,a0,1
    1972:	bf71                	j	190e <atoi+0x6>
    1974:	4113053b          	subw	a0,t1,a7
    1978:	8082                	ret
    while (isdigit(*s))
    197a:	00154783          	lbu	a5,1(a0)
    197e:	4625                	li	a2,9
        s++;
    1980:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1984:	fd07859b          	addiw	a1,a5,-48
    1988:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    198c:	4e01                	li	t3,0
    while (isdigit(*s))
    198e:	fab67ae3          	bgeu	a2,a1,1942 <atoi+0x3a>
    1992:	4501                	li	a0,0
}
    1994:	8082                	ret
    while (isdigit(*s))
    1996:	00154783          	lbu	a5,1(a0)
    199a:	4625                	li	a2,9
        s++;
    199c:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    19a0:	fd07859b          	addiw	a1,a5,-48
    19a4:	0007871b          	sext.w	a4,a5
    19a8:	feb665e3          	bltu	a2,a1,1992 <atoi+0x8a>
        neg = 1;
    19ac:	4e05                	li	t3,1
    19ae:	bf51                	j	1942 <atoi+0x3a>

00000000000019b0 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    19b0:	16060d63          	beqz	a2,1b2a <memset+0x17a>
    19b4:	40a007b3          	neg	a5,a0
    19b8:	8b9d                	andi	a5,a5,7
    19ba:	00778713          	addi	a4,a5,7
    19be:	482d                	li	a6,11
    19c0:	0ff5f593          	andi	a1,a1,255
    19c4:	fff60693          	addi	a3,a2,-1
    19c8:	17076263          	bltu	a4,a6,1b2c <memset+0x17c>
    19cc:	16e6ea63          	bltu	a3,a4,1b40 <memset+0x190>
    19d0:	16078563          	beqz	a5,1b3a <memset+0x18a>
    19d4:	00b50023          	sb	a1,0(a0)
    19d8:	4705                	li	a4,1
    19da:	00150e93          	addi	t4,a0,1
    19de:	14e78c63          	beq	a5,a4,1b36 <memset+0x186>
    19e2:	00b500a3          	sb	a1,1(a0)
    19e6:	4709                	li	a4,2
    19e8:	00250e93          	addi	t4,a0,2
    19ec:	14e78d63          	beq	a5,a4,1b46 <memset+0x196>
    19f0:	00b50123          	sb	a1,2(a0)
    19f4:	470d                	li	a4,3
    19f6:	00350e93          	addi	t4,a0,3
    19fa:	12e78b63          	beq	a5,a4,1b30 <memset+0x180>
    19fe:	00b501a3          	sb	a1,3(a0)
    1a02:	4711                	li	a4,4
    1a04:	00450e93          	addi	t4,a0,4
    1a08:	14e78163          	beq	a5,a4,1b4a <memset+0x19a>
    1a0c:	00b50223          	sb	a1,4(a0)
    1a10:	4715                	li	a4,5
    1a12:	00550e93          	addi	t4,a0,5
    1a16:	12e78c63          	beq	a5,a4,1b4e <memset+0x19e>
    1a1a:	00b502a3          	sb	a1,5(a0)
    1a1e:	471d                	li	a4,7
    1a20:	00650e93          	addi	t4,a0,6
    1a24:	12e79763          	bne	a5,a4,1b52 <memset+0x1a2>
    1a28:	00750e93          	addi	t4,a0,7
    1a2c:	00b50323          	sb	a1,6(a0)
    1a30:	4f1d                	li	t5,7
    1a32:	00859713          	slli	a4,a1,0x8
    1a36:	8f4d                	or	a4,a4,a1
    1a38:	01059e13          	slli	t3,a1,0x10
    1a3c:	01c76e33          	or	t3,a4,t3
    1a40:	01859313          	slli	t1,a1,0x18
    1a44:	006e6333          	or	t1,t3,t1
    1a48:	02059893          	slli	a7,a1,0x20
    1a4c:	011368b3          	or	a7,t1,a7
    1a50:	02859813          	slli	a6,a1,0x28
    1a54:	40f60333          	sub	t1,a2,a5
    1a58:	0108e833          	or	a6,a7,a6
    1a5c:	03059693          	slli	a3,a1,0x30
    1a60:	00d866b3          	or	a3,a6,a3
    1a64:	03859713          	slli	a4,a1,0x38
    1a68:	97aa                	add	a5,a5,a0
    1a6a:	ff837813          	andi	a6,t1,-8
    1a6e:	8f55                	or	a4,a4,a3
    1a70:	00f806b3          	add	a3,a6,a5
    1a74:	e398                	sd	a4,0(a5)
    1a76:	07a1                	addi	a5,a5,8
    1a78:	fed79ee3          	bne	a5,a3,1a74 <memset+0xc4>
    1a7c:	ff837693          	andi	a3,t1,-8
    1a80:	00de87b3          	add	a5,t4,a3
    1a84:	01e6873b          	addw	a4,a3,t5
    1a88:	0ad30663          	beq	t1,a3,1b34 <memset+0x184>
    1a8c:	00b78023          	sb	a1,0(a5)
    1a90:	0017069b          	addiw	a3,a4,1
    1a94:	08c6fb63          	bgeu	a3,a2,1b2a <memset+0x17a>
    1a98:	00b780a3          	sb	a1,1(a5)
    1a9c:	0027069b          	addiw	a3,a4,2
    1aa0:	08c6f563          	bgeu	a3,a2,1b2a <memset+0x17a>
    1aa4:	00b78123          	sb	a1,2(a5)
    1aa8:	0037069b          	addiw	a3,a4,3
    1aac:	06c6ff63          	bgeu	a3,a2,1b2a <memset+0x17a>
    1ab0:	00b781a3          	sb	a1,3(a5)
    1ab4:	0047069b          	addiw	a3,a4,4
    1ab8:	06c6f963          	bgeu	a3,a2,1b2a <memset+0x17a>
    1abc:	00b78223          	sb	a1,4(a5)
    1ac0:	0057069b          	addiw	a3,a4,5
    1ac4:	06c6f363          	bgeu	a3,a2,1b2a <memset+0x17a>
    1ac8:	00b782a3          	sb	a1,5(a5)
    1acc:	0067069b          	addiw	a3,a4,6
    1ad0:	04c6fd63          	bgeu	a3,a2,1b2a <memset+0x17a>
    1ad4:	00b78323          	sb	a1,6(a5)
    1ad8:	0077069b          	addiw	a3,a4,7
    1adc:	04c6f763          	bgeu	a3,a2,1b2a <memset+0x17a>
    1ae0:	00b783a3          	sb	a1,7(a5)
    1ae4:	0087069b          	addiw	a3,a4,8
    1ae8:	04c6f163          	bgeu	a3,a2,1b2a <memset+0x17a>
    1aec:	00b78423          	sb	a1,8(a5)
    1af0:	0097069b          	addiw	a3,a4,9
    1af4:	02c6fb63          	bgeu	a3,a2,1b2a <memset+0x17a>
    1af8:	00b784a3          	sb	a1,9(a5)
    1afc:	00a7069b          	addiw	a3,a4,10
    1b00:	02c6f563          	bgeu	a3,a2,1b2a <memset+0x17a>
    1b04:	00b78523          	sb	a1,10(a5)
    1b08:	00b7069b          	addiw	a3,a4,11
    1b0c:	00c6ff63          	bgeu	a3,a2,1b2a <memset+0x17a>
    1b10:	00b785a3          	sb	a1,11(a5)
    1b14:	00c7069b          	addiw	a3,a4,12
    1b18:	00c6f963          	bgeu	a3,a2,1b2a <memset+0x17a>
    1b1c:	00b78623          	sb	a1,12(a5)
    1b20:	2735                	addiw	a4,a4,13
    1b22:	00c77463          	bgeu	a4,a2,1b2a <memset+0x17a>
    1b26:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1b2a:	8082                	ret
    1b2c:	472d                	li	a4,11
    1b2e:	bd79                	j	19cc <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b30:	4f0d                	li	t5,3
    1b32:	b701                	j	1a32 <memset+0x82>
    1b34:	8082                	ret
    1b36:	4f05                	li	t5,1
    1b38:	bded                	j	1a32 <memset+0x82>
    1b3a:	8eaa                	mv	t4,a0
    1b3c:	4f01                	li	t5,0
    1b3e:	bdd5                	j	1a32 <memset+0x82>
    1b40:	87aa                	mv	a5,a0
    1b42:	4701                	li	a4,0
    1b44:	b7a1                	j	1a8c <memset+0xdc>
    1b46:	4f09                	li	t5,2
    1b48:	b5ed                	j	1a32 <memset+0x82>
    1b4a:	4f11                	li	t5,4
    1b4c:	b5dd                	j	1a32 <memset+0x82>
    1b4e:	4f15                	li	t5,5
    1b50:	b5cd                	j	1a32 <memset+0x82>
    1b52:	4f19                	li	t5,6
    1b54:	bdf9                	j	1a32 <memset+0x82>

0000000000001b56 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1b56:	00054783          	lbu	a5,0(a0)
    1b5a:	0005c703          	lbu	a4,0(a1)
    1b5e:	00e79863          	bne	a5,a4,1b6e <strcmp+0x18>
    1b62:	0505                	addi	a0,a0,1
    1b64:	0585                	addi	a1,a1,1
    1b66:	fbe5                	bnez	a5,1b56 <strcmp>
    1b68:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1b6a:	9d19                	subw	a0,a0,a4
    1b6c:	8082                	ret
    1b6e:	0007851b          	sext.w	a0,a5
    1b72:	bfe5                	j	1b6a <strcmp+0x14>

0000000000001b74 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1b74:	ce05                	beqz	a2,1bac <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1b76:	00054703          	lbu	a4,0(a0)
    1b7a:	0005c783          	lbu	a5,0(a1)
    1b7e:	cb0d                	beqz	a4,1bb0 <strncmp+0x3c>
    if (!n--)
    1b80:	167d                	addi	a2,a2,-1
    1b82:	00c506b3          	add	a3,a0,a2
    1b86:	a819                	j	1b9c <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1b88:	00a68e63          	beq	a3,a0,1ba4 <strncmp+0x30>
    1b8c:	0505                	addi	a0,a0,1
    1b8e:	00e79b63          	bne	a5,a4,1ba4 <strncmp+0x30>
    1b92:	00054703          	lbu	a4,0(a0)
    1b96:	0005c783          	lbu	a5,0(a1)
    1b9a:	cb19                	beqz	a4,1bb0 <strncmp+0x3c>
    1b9c:	0005c783          	lbu	a5,0(a1)
    1ba0:	0585                	addi	a1,a1,1
    1ba2:	f3fd                	bnez	a5,1b88 <strncmp+0x14>
        ;
    return *l - *r;
    1ba4:	0007051b          	sext.w	a0,a4
    1ba8:	9d1d                	subw	a0,a0,a5
    1baa:	8082                	ret
        return 0;
    1bac:	4501                	li	a0,0
}
    1bae:	8082                	ret
    1bb0:	4501                	li	a0,0
    return *l - *r;
    1bb2:	9d1d                	subw	a0,a0,a5
    1bb4:	8082                	ret

0000000000001bb6 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1bb6:	00757793          	andi	a5,a0,7
    1bba:	cf89                	beqz	a5,1bd4 <strlen+0x1e>
    1bbc:	87aa                	mv	a5,a0
    1bbe:	a029                	j	1bc8 <strlen+0x12>
    1bc0:	0785                	addi	a5,a5,1
    1bc2:	0077f713          	andi	a4,a5,7
    1bc6:	cb01                	beqz	a4,1bd6 <strlen+0x20>
        if (!*s)
    1bc8:	0007c703          	lbu	a4,0(a5)
    1bcc:	fb75                	bnez	a4,1bc0 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1bce:	40a78533          	sub	a0,a5,a0
}
    1bd2:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1bd4:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1bd6:	6394                	ld	a3,0(a5)
    1bd8:	00000597          	auipc	a1,0x0
    1bdc:	3a05b583          	ld	a1,928(a1) # 1f78 <stpncpy+0x23c>
    1be0:	00000617          	auipc	a2,0x0
    1be4:	3a063603          	ld	a2,928(a2) # 1f80 <stpncpy+0x244>
    1be8:	a019                	j	1bee <strlen+0x38>
    1bea:	6794                	ld	a3,8(a5)
    1bec:	07a1                	addi	a5,a5,8
    1bee:	00b68733          	add	a4,a3,a1
    1bf2:	fff6c693          	not	a3,a3
    1bf6:	8f75                	and	a4,a4,a3
    1bf8:	8f71                	and	a4,a4,a2
    1bfa:	db65                	beqz	a4,1bea <strlen+0x34>
    for (; *s; s++)
    1bfc:	0007c703          	lbu	a4,0(a5)
    1c00:	d779                	beqz	a4,1bce <strlen+0x18>
    1c02:	0017c703          	lbu	a4,1(a5)
    1c06:	0785                	addi	a5,a5,1
    1c08:	d379                	beqz	a4,1bce <strlen+0x18>
    1c0a:	0017c703          	lbu	a4,1(a5)
    1c0e:	0785                	addi	a5,a5,1
    1c10:	fb6d                	bnez	a4,1c02 <strlen+0x4c>
    1c12:	bf75                	j	1bce <strlen+0x18>

0000000000001c14 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1c14:	00757713          	andi	a4,a0,7
{
    1c18:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1c1a:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1c1e:	cb19                	beqz	a4,1c34 <memchr+0x20>
    1c20:	ce25                	beqz	a2,1c98 <memchr+0x84>
    1c22:	0007c703          	lbu	a4,0(a5)
    1c26:	04b70e63          	beq	a4,a1,1c82 <memchr+0x6e>
    1c2a:	0785                	addi	a5,a5,1
    1c2c:	0077f713          	andi	a4,a5,7
    1c30:	167d                	addi	a2,a2,-1
    1c32:	f77d                	bnez	a4,1c20 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1c34:	4501                	li	a0,0
    if (n && *s != c)
    1c36:	c235                	beqz	a2,1c9a <memchr+0x86>
    1c38:	0007c703          	lbu	a4,0(a5)
    1c3c:	04b70363          	beq	a4,a1,1c82 <memchr+0x6e>
        size_t k = ONES * c;
    1c40:	00000517          	auipc	a0,0x0
    1c44:	34853503          	ld	a0,840(a0) # 1f88 <stpncpy+0x24c>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1c48:	471d                	li	a4,7
        size_t k = ONES * c;
    1c4a:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1c4e:	02c77a63          	bgeu	a4,a2,1c82 <memchr+0x6e>
    1c52:	00000897          	auipc	a7,0x0
    1c56:	3268b883          	ld	a7,806(a7) # 1f78 <stpncpy+0x23c>
    1c5a:	00000817          	auipc	a6,0x0
    1c5e:	32683803          	ld	a6,806(a6) # 1f80 <stpncpy+0x244>
    1c62:	431d                	li	t1,7
    1c64:	a029                	j	1c6e <memchr+0x5a>
    1c66:	1661                	addi	a2,a2,-8
    1c68:	07a1                	addi	a5,a5,8
    1c6a:	02c37963          	bgeu	t1,a2,1c9c <memchr+0x88>
    1c6e:	6398                	ld	a4,0(a5)
    1c70:	8f29                	xor	a4,a4,a0
    1c72:	011706b3          	add	a3,a4,a7
    1c76:	fff74713          	not	a4,a4
    1c7a:	8f75                	and	a4,a4,a3
    1c7c:	01077733          	and	a4,a4,a6
    1c80:	d37d                	beqz	a4,1c66 <memchr+0x52>
    1c82:	853e                	mv	a0,a5
    1c84:	97b2                	add	a5,a5,a2
    1c86:	a021                	j	1c8e <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1c88:	0505                	addi	a0,a0,1
    1c8a:	00f50763          	beq	a0,a5,1c98 <memchr+0x84>
    1c8e:	00054703          	lbu	a4,0(a0)
    1c92:	feb71be3          	bne	a4,a1,1c88 <memchr+0x74>
    1c96:	8082                	ret
    return n ? (void *)s : 0;
    1c98:	4501                	li	a0,0
}
    1c9a:	8082                	ret
    return n ? (void *)s : 0;
    1c9c:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1c9e:	f275                	bnez	a2,1c82 <memchr+0x6e>
}
    1ca0:	8082                	ret

0000000000001ca2 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1ca2:	1101                	addi	sp,sp,-32
    1ca4:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1ca6:	862e                	mv	a2,a1
{
    1ca8:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1caa:	4581                	li	a1,0
{
    1cac:	e426                	sd	s1,8(sp)
    1cae:	ec06                	sd	ra,24(sp)
    1cb0:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1cb2:	f63ff0ef          	jal	ra,1c14 <memchr>
    return p ? p - s : n;
    1cb6:	c519                	beqz	a0,1cc4 <strnlen+0x22>
}
    1cb8:	60e2                	ld	ra,24(sp)
    1cba:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1cbc:	8d05                	sub	a0,a0,s1
}
    1cbe:	64a2                	ld	s1,8(sp)
    1cc0:	6105                	addi	sp,sp,32
    1cc2:	8082                	ret
    1cc4:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1cc6:	8522                	mv	a0,s0
}
    1cc8:	6442                	ld	s0,16(sp)
    1cca:	64a2                	ld	s1,8(sp)
    1ccc:	6105                	addi	sp,sp,32
    1cce:	8082                	ret

0000000000001cd0 <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1cd0:	00b547b3          	xor	a5,a0,a1
    1cd4:	8b9d                	andi	a5,a5,7
    1cd6:	eb95                	bnez	a5,1d0a <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1cd8:	0075f793          	andi	a5,a1,7
    1cdc:	e7b1                	bnez	a5,1d28 <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1cde:	6198                	ld	a4,0(a1)
    1ce0:	00000617          	auipc	a2,0x0
    1ce4:	29863603          	ld	a2,664(a2) # 1f78 <stpncpy+0x23c>
    1ce8:	00000817          	auipc	a6,0x0
    1cec:	29883803          	ld	a6,664(a6) # 1f80 <stpncpy+0x244>
    1cf0:	a029                	j	1cfa <stpcpy+0x2a>
    1cf2:	e118                	sd	a4,0(a0)
    1cf4:	6598                	ld	a4,8(a1)
    1cf6:	05a1                	addi	a1,a1,8
    1cf8:	0521                	addi	a0,a0,8
    1cfa:	00c707b3          	add	a5,a4,a2
    1cfe:	fff74693          	not	a3,a4
    1d02:	8ff5                	and	a5,a5,a3
    1d04:	0107f7b3          	and	a5,a5,a6
    1d08:	d7ed                	beqz	a5,1cf2 <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1d0a:	0005c783          	lbu	a5,0(a1)
    1d0e:	00f50023          	sb	a5,0(a0)
    1d12:	c785                	beqz	a5,1d3a <stpcpy+0x6a>
    1d14:	0015c783          	lbu	a5,1(a1)
    1d18:	0505                	addi	a0,a0,1
    1d1a:	0585                	addi	a1,a1,1
    1d1c:	00f50023          	sb	a5,0(a0)
    1d20:	fbf5                	bnez	a5,1d14 <stpcpy+0x44>
        ;
    return d;
}
    1d22:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1d24:	0505                	addi	a0,a0,1
    1d26:	df45                	beqz	a4,1cde <stpcpy+0xe>
            if (!(*d = *s))
    1d28:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1d2c:	0585                	addi	a1,a1,1
    1d2e:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1d32:	00f50023          	sb	a5,0(a0)
    1d36:	f7fd                	bnez	a5,1d24 <stpcpy+0x54>
}
    1d38:	8082                	ret
    1d3a:	8082                	ret

0000000000001d3c <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1d3c:	00b547b3          	xor	a5,a0,a1
    1d40:	8b9d                	andi	a5,a5,7
    1d42:	1a079863          	bnez	a5,1ef2 <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1d46:	0075f793          	andi	a5,a1,7
    1d4a:	16078463          	beqz	a5,1eb2 <stpncpy+0x176>
    1d4e:	ea01                	bnez	a2,1d5e <stpncpy+0x22>
    1d50:	a421                	j	1f58 <stpncpy+0x21c>
    1d52:	167d                	addi	a2,a2,-1
    1d54:	0505                	addi	a0,a0,1
    1d56:	14070e63          	beqz	a4,1eb2 <stpncpy+0x176>
    1d5a:	1a060863          	beqz	a2,1f0a <stpncpy+0x1ce>
    1d5e:	0005c783          	lbu	a5,0(a1)
    1d62:	0585                	addi	a1,a1,1
    1d64:	0075f713          	andi	a4,a1,7
    1d68:	00f50023          	sb	a5,0(a0)
    1d6c:	f3fd                	bnez	a5,1d52 <stpncpy+0x16>
    1d6e:	4805                	li	a6,1
    1d70:	1a061863          	bnez	a2,1f20 <stpncpy+0x1e4>
    1d74:	40a007b3          	neg	a5,a0
    1d78:	8b9d                	andi	a5,a5,7
    1d7a:	4681                	li	a3,0
    1d7c:	18061a63          	bnez	a2,1f10 <stpncpy+0x1d4>
    1d80:	00778713          	addi	a4,a5,7
    1d84:	45ad                	li	a1,11
    1d86:	18b76363          	bltu	a4,a1,1f0c <stpncpy+0x1d0>
    1d8a:	1ae6eb63          	bltu	a3,a4,1f40 <stpncpy+0x204>
    1d8e:	1a078363          	beqz	a5,1f34 <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d92:	00050023          	sb	zero,0(a0)
    1d96:	4685                	li	a3,1
    1d98:	00150713          	addi	a4,a0,1
    1d9c:	18d78f63          	beq	a5,a3,1f3a <stpncpy+0x1fe>
    1da0:	000500a3          	sb	zero,1(a0)
    1da4:	4689                	li	a3,2
    1da6:	00250713          	addi	a4,a0,2
    1daa:	18d78e63          	beq	a5,a3,1f46 <stpncpy+0x20a>
    1dae:	00050123          	sb	zero,2(a0)
    1db2:	468d                	li	a3,3
    1db4:	00350713          	addi	a4,a0,3
    1db8:	16d78c63          	beq	a5,a3,1f30 <stpncpy+0x1f4>
    1dbc:	000501a3          	sb	zero,3(a0)
    1dc0:	4691                	li	a3,4
    1dc2:	00450713          	addi	a4,a0,4
    1dc6:	18d78263          	beq	a5,a3,1f4a <stpncpy+0x20e>
    1dca:	00050223          	sb	zero,4(a0)
    1dce:	4695                	li	a3,5
    1dd0:	00550713          	addi	a4,a0,5
    1dd4:	16d78d63          	beq	a5,a3,1f4e <stpncpy+0x212>
    1dd8:	000502a3          	sb	zero,5(a0)
    1ddc:	469d                	li	a3,7
    1dde:	00650713          	addi	a4,a0,6
    1de2:	16d79863          	bne	a5,a3,1f52 <stpncpy+0x216>
    1de6:	00750713          	addi	a4,a0,7
    1dea:	00050323          	sb	zero,6(a0)
    1dee:	40f80833          	sub	a6,a6,a5
    1df2:	ff887593          	andi	a1,a6,-8
    1df6:	97aa                	add	a5,a5,a0
    1df8:	95be                	add	a1,a1,a5
    1dfa:	0007b023          	sd	zero,0(a5)
    1dfe:	07a1                	addi	a5,a5,8
    1e00:	feb79de3          	bne	a5,a1,1dfa <stpncpy+0xbe>
    1e04:	ff887593          	andi	a1,a6,-8
    1e08:	9ead                	addw	a3,a3,a1
    1e0a:	00b707b3          	add	a5,a4,a1
    1e0e:	12b80863          	beq	a6,a1,1f3e <stpncpy+0x202>
    1e12:	00078023          	sb	zero,0(a5)
    1e16:	0016871b          	addiw	a4,a3,1
    1e1a:	0ec77863          	bgeu	a4,a2,1f0a <stpncpy+0x1ce>
    1e1e:	000780a3          	sb	zero,1(a5)
    1e22:	0026871b          	addiw	a4,a3,2
    1e26:	0ec77263          	bgeu	a4,a2,1f0a <stpncpy+0x1ce>
    1e2a:	00078123          	sb	zero,2(a5)
    1e2e:	0036871b          	addiw	a4,a3,3
    1e32:	0cc77c63          	bgeu	a4,a2,1f0a <stpncpy+0x1ce>
    1e36:	000781a3          	sb	zero,3(a5)
    1e3a:	0046871b          	addiw	a4,a3,4
    1e3e:	0cc77663          	bgeu	a4,a2,1f0a <stpncpy+0x1ce>
    1e42:	00078223          	sb	zero,4(a5)
    1e46:	0056871b          	addiw	a4,a3,5
    1e4a:	0cc77063          	bgeu	a4,a2,1f0a <stpncpy+0x1ce>
    1e4e:	000782a3          	sb	zero,5(a5)
    1e52:	0066871b          	addiw	a4,a3,6
    1e56:	0ac77a63          	bgeu	a4,a2,1f0a <stpncpy+0x1ce>
    1e5a:	00078323          	sb	zero,6(a5)
    1e5e:	0076871b          	addiw	a4,a3,7
    1e62:	0ac77463          	bgeu	a4,a2,1f0a <stpncpy+0x1ce>
    1e66:	000783a3          	sb	zero,7(a5)
    1e6a:	0086871b          	addiw	a4,a3,8
    1e6e:	08c77e63          	bgeu	a4,a2,1f0a <stpncpy+0x1ce>
    1e72:	00078423          	sb	zero,8(a5)
    1e76:	0096871b          	addiw	a4,a3,9
    1e7a:	08c77863          	bgeu	a4,a2,1f0a <stpncpy+0x1ce>
    1e7e:	000784a3          	sb	zero,9(a5)
    1e82:	00a6871b          	addiw	a4,a3,10
    1e86:	08c77263          	bgeu	a4,a2,1f0a <stpncpy+0x1ce>
    1e8a:	00078523          	sb	zero,10(a5)
    1e8e:	00b6871b          	addiw	a4,a3,11
    1e92:	06c77c63          	bgeu	a4,a2,1f0a <stpncpy+0x1ce>
    1e96:	000785a3          	sb	zero,11(a5)
    1e9a:	00c6871b          	addiw	a4,a3,12
    1e9e:	06c77663          	bgeu	a4,a2,1f0a <stpncpy+0x1ce>
    1ea2:	00078623          	sb	zero,12(a5)
    1ea6:	26b5                	addiw	a3,a3,13
    1ea8:	06c6f163          	bgeu	a3,a2,1f0a <stpncpy+0x1ce>
    1eac:	000786a3          	sb	zero,13(a5)
    1eb0:	8082                	ret
            ;
        if (!n || !*s)
    1eb2:	c645                	beqz	a2,1f5a <stpncpy+0x21e>
    1eb4:	0005c783          	lbu	a5,0(a1)
    1eb8:	ea078be3          	beqz	a5,1d6e <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ebc:	479d                	li	a5,7
    1ebe:	02c7ff63          	bgeu	a5,a2,1efc <stpncpy+0x1c0>
    1ec2:	00000897          	auipc	a7,0x0
    1ec6:	0b68b883          	ld	a7,182(a7) # 1f78 <stpncpy+0x23c>
    1eca:	00000817          	auipc	a6,0x0
    1ece:	0b683803          	ld	a6,182(a6) # 1f80 <stpncpy+0x244>
    1ed2:	431d                	li	t1,7
    1ed4:	6198                	ld	a4,0(a1)
    1ed6:	011707b3          	add	a5,a4,a7
    1eda:	fff74693          	not	a3,a4
    1ede:	8ff5                	and	a5,a5,a3
    1ee0:	0107f7b3          	and	a5,a5,a6
    1ee4:	ef81                	bnez	a5,1efc <stpncpy+0x1c0>
            *wd = *ws;
    1ee6:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ee8:	1661                	addi	a2,a2,-8
    1eea:	05a1                	addi	a1,a1,8
    1eec:	0521                	addi	a0,a0,8
    1eee:	fec363e3          	bltu	t1,a2,1ed4 <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1ef2:	e609                	bnez	a2,1efc <stpncpy+0x1c0>
    1ef4:	a08d                	j	1f56 <stpncpy+0x21a>
    1ef6:	167d                	addi	a2,a2,-1
    1ef8:	0505                	addi	a0,a0,1
    1efa:	ca01                	beqz	a2,1f0a <stpncpy+0x1ce>
    1efc:	0005c783          	lbu	a5,0(a1)
    1f00:	0585                	addi	a1,a1,1
    1f02:	00f50023          	sb	a5,0(a0)
    1f06:	fbe5                	bnez	a5,1ef6 <stpncpy+0x1ba>
        ;
tail:
    1f08:	b59d                	j	1d6e <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1f0a:	8082                	ret
    1f0c:	472d                	li	a4,11
    1f0e:	bdb5                	j	1d8a <stpncpy+0x4e>
    1f10:	00778713          	addi	a4,a5,7
    1f14:	45ad                	li	a1,11
    1f16:	fff60693          	addi	a3,a2,-1
    1f1a:	e6b778e3          	bgeu	a4,a1,1d8a <stpncpy+0x4e>
    1f1e:	b7fd                	j	1f0c <stpncpy+0x1d0>
    1f20:	40a007b3          	neg	a5,a0
    1f24:	8832                	mv	a6,a2
    1f26:	8b9d                	andi	a5,a5,7
    1f28:	4681                	li	a3,0
    1f2a:	e4060be3          	beqz	a2,1d80 <stpncpy+0x44>
    1f2e:	b7cd                	j	1f10 <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1f30:	468d                	li	a3,3
    1f32:	bd75                	j	1dee <stpncpy+0xb2>
    1f34:	872a                	mv	a4,a0
    1f36:	4681                	li	a3,0
    1f38:	bd5d                	j	1dee <stpncpy+0xb2>
    1f3a:	4685                	li	a3,1
    1f3c:	bd4d                	j	1dee <stpncpy+0xb2>
    1f3e:	8082                	ret
    1f40:	87aa                	mv	a5,a0
    1f42:	4681                	li	a3,0
    1f44:	b5f9                	j	1e12 <stpncpy+0xd6>
    1f46:	4689                	li	a3,2
    1f48:	b55d                	j	1dee <stpncpy+0xb2>
    1f4a:	4691                	li	a3,4
    1f4c:	b54d                	j	1dee <stpncpy+0xb2>
    1f4e:	4695                	li	a3,5
    1f50:	bd79                	j	1dee <stpncpy+0xb2>
    1f52:	4699                	li	a3,6
    1f54:	bd69                	j	1dee <stpncpy+0xb2>
    1f56:	8082                	ret
    1f58:	8082                	ret
    1f5a:	8082                	ret
