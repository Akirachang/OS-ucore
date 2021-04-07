
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch5_usershell:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	1500006f          	j	1152 <__start_main>

0000000000001006 <main>:
const char BS = 0x08;

int tail = 0;

int main()
{
    1006:	b9010113          	addi	sp,sp,-1136
    char line[1024];
    puts("C user shell");
    100a:	00001517          	auipc	a0,0x1
    100e:	06e50513          	addi	a0,a0,110 # 2078 <unlink+0x1a>
{
    1012:	46113423          	sd	ra,1128(sp)
    1016:	44913c23          	sd	s1,1112(sp)
    101a:	45213823          	sd	s2,1104(sp)
    101e:	45313423          	sd	s3,1096(sp)
    1022:	45413023          	sd	s4,1088(sp)
    1026:	43513c23          	sd	s5,1080(sp)
    102a:	43613823          	sd	s6,1072(sp)
    102e:	43713423          	sd	s7,1064(sp)
    1032:	43813023          	sd	s8,1056(sp)
    1036:	41913c23          	sd	s9,1048(sp)
    103a:	46813023          	sd	s0,1120(sp)
    puts("C user shell");
    103e:	164000ef          	jal	ra,11a2 <puts>
    printf(">> ");
    1042:	00001517          	auipc	a0,0x1
    1046:	04650513          	addi	a0,a0,70 # 2088 <unlink+0x2a>
    104a:	19a000ef          	jal	ra,11e4 <printf>
    104e:	00001917          	auipc	s2,0x1
    1052:	0ba90913          	addi	s2,s2,186 # 2108 <tail>
    for (;;)
    {
        char c = getchar();
        switch (c)
    1056:	44b5                	li	s1,13
        {
        case LF:
        case CR:
            printf("\n");
    1058:	00001a97          	auipc	s5,0x1
    105c:	038a8a93          	addi	s5,s5,56 # 2090 <unlink+0x32>
                        break;
                    }
                }
                tail = 0;
            }
            printf(">> ");
    1060:	00001b17          	auipc	s6,0x1
    1064:	028b0b13          	addi	s6,s6,40 # 2088 <unlink+0x2a>
                    if (exit_pid == -1)
    1068:	59fd                	li	s3,-1
                        printf("Shell: Process %d exited with code %d\n", cpid, xstate);
    106a:	00001b97          	auipc	s7,0x1
    106e:	046b8b93          	addi	s7,s7,70 # 20b0 <unlink+0x52>
                    printf("invalid file name\n");
    1072:	00001c97          	auipc	s9,0x1
    1076:	026c8c93          	addi	s9,s9,38 # 2098 <unlink+0x3a>
        case BS:
        case DL:
            if (tail != 0)
            {
                putchar(BS);
                printf(" ");
    107a:	00001c17          	auipc	s8,0x1
    107e:	05ec0c13          	addi	s8,s8,94 # 20d8 <unlink+0x7a>
        switch (c)
    1082:	07f00a13          	li	s4,127
        char c = getchar();
    1086:	0e0000ef          	jal	ra,1166 <getchar>
    108a:	842a                	mv	s0,a0
        switch (c)
    108c:	0ff57513          	andi	a0,a0,255
    1090:	00950a63          	beq	a0,s1,10a4 <main+0x9e>
    1094:	06a4c963          	blt	s1,a0,1106 <main+0x100>
    1098:	47a1                	li	a5,8
    109a:	08f50663          	beq	a0,a5,1126 <main+0x120>
    109e:	47a9                	li	a5,10
    10a0:	06f51563          	bne	a0,a5,110a <main+0x104>
            printf("\n");
    10a4:	8556                	mv	a0,s5
    10a6:	13e000ef          	jal	ra,11e4 <printf>
            if (tail != 0)
    10aa:	00092783          	lw	a5,0(s2)
    10ae:	cba1                	beqz	a5,10fe <main+0xf8>
                line[tail++] = '\0';
    10b0:	41010693          	addi	a3,sp,1040
    10b4:	0017871b          	addiw	a4,a5,1
                int cpid = spawn(line);
    10b8:	0808                	addi	a0,sp,16
                line[tail++] = '\0';
    10ba:	97b6                	add	a5,a5,a3
    10bc:	00e92023          	sw	a4,0(s2)
    10c0:	c0078023          	sb	zero,-1024(a5)
                int cpid = spawn(line);
    10c4:	72f000ef          	jal	ra,1ff2 <spawn>
    10c8:	842a                	mv	s0,a0
                if (cpid < 0)
    10ca:	08054063          	bltz	a0,114a <main+0x144>
                int xstate = 0, exit_pid = 0;
    10ce:	c602                	sw	zero,12(sp)
    10d0:	a019                	j	10d6 <main+0xd0>
                        sched_yield();
    10d2:	5fd000ef          	jal	ra,1ece <sched_yield>
                    exit_pid = waitpid(cpid, &xstate);
    10d6:	006c                	addi	a1,sp,12
    10d8:	8522                	mv	a0,s0
    10da:	617000ef          	jal	ra,1ef0 <waitpid>
                    if (exit_pid == -1)
    10de:	ff350ae3          	beq	a0,s3,10d2 <main+0xcc>
                        assert(cpid == exit_pid);
    10e2:	00a40563          	beq	s0,a0,10ec <main+0xe6>
    10e6:	557d                	li	a0,-1
    10e8:	5ff000ef          	jal	ra,1ee6 <exit>
                        printf("Shell: Process %d exited with code %d\n", cpid, xstate);
    10ec:	4632                	lw	a2,12(sp)
    10ee:	85a2                	mv	a1,s0
    10f0:	855e                	mv	a0,s7
    10f2:	0f2000ef          	jal	ra,11e4 <printf>
                tail = 0;
    10f6:	00001797          	auipc	a5,0x1
    10fa:	0007a923          	sw	zero,18(a5) # 2108 <tail>
            printf(">> ");
    10fe:	855a                	mv	a0,s6
    1100:	0e4000ef          	jal	ra,11e4 <printf>
            break;
    1104:	b749                	j	1086 <main+0x80>
        switch (c)
    1106:	03450063          	beq	a0,s4,1126 <main+0x120>
                putchar(BS);
                --tail;
            }
            break;
        default:
            putchar(c);
    110a:	07a000ef          	jal	ra,1184 <putchar>
            line[tail++] = c;
    110e:	00092783          	lw	a5,0(s2)
    1112:	41010693          	addi	a3,sp,1040
    1116:	0017871b          	addiw	a4,a5,1
    111a:	97b6                	add	a5,a5,a3
    111c:	00e92023          	sw	a4,0(s2)
        char c = getchar();
    1120:	c0878023          	sb	s0,-1024(a5)
            break;
    1124:	b78d                	j	1086 <main+0x80>
            if (tail != 0)
    1126:	00092783          	lw	a5,0(s2)
    112a:	dfb1                	beqz	a5,1086 <main+0x80>
                putchar(BS);
    112c:	4521                	li	a0,8
    112e:	056000ef          	jal	ra,1184 <putchar>
                printf(" ");
    1132:	8562                	mv	a0,s8
    1134:	0b0000ef          	jal	ra,11e4 <printf>
                putchar(BS);
    1138:	4521                	li	a0,8
    113a:	04a000ef          	jal	ra,1184 <putchar>
                --tail;
    113e:	00092783          	lw	a5,0(s2)
    1142:	37fd                	addiw	a5,a5,-1
    1144:	00f92023          	sw	a5,0(s2)
    1148:	bf3d                	j	1086 <main+0x80>
                    printf("invalid file name\n");
    114a:	8566                	mv	a0,s9
    114c:	098000ef          	jal	ra,11e4 <printf>
                    continue;
    1150:	bf1d                	j	1086 <main+0x80>

0000000000001152 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1152:	1141                	addi	sp,sp,-16
    1154:	e406                	sd	ra,8(sp)
    exit(main());
    1156:	eb1ff0ef          	jal	ra,1006 <main>
    115a:	58d000ef          	jal	ra,1ee6 <exit>
    return 0;
}
    115e:	60a2                	ld	ra,8(sp)
    1160:	4501                	li	a0,0
    1162:	0141                	addi	sp,sp,16
    1164:	8082                	ret

0000000000001166 <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    1166:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    1168:	00f10593          	addi	a1,sp,15
    116c:	4605                	li	a2,1
    116e:	4501                	li	a0,0
{
    1170:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1172:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1176:	539000ef          	jal	ra,1eae <read>
    return byte;
}
    117a:	60e2                	ld	ra,24(sp)
    117c:	00f14503          	lbu	a0,15(sp)
    1180:	6105                	addi	sp,sp,32
    1182:	8082                	ret

0000000000001184 <putchar>:

int putchar(int c)
{
    1184:	1101                	addi	sp,sp,-32
    1186:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    1188:	00f10593          	addi	a1,sp,15
    118c:	4605                	li	a2,1
    118e:	4505                	li	a0,1
{
    1190:	ec06                	sd	ra,24(sp)
    char byte = c;
    1192:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1196:	523000ef          	jal	ra,1eb8 <write>
}
    119a:	60e2                	ld	ra,24(sp)
    119c:	2501                	sext.w	a0,a0
    119e:	6105                	addi	sp,sp,32
    11a0:	8082                	ret

00000000000011a2 <puts>:

int puts(const char *s)
{
    11a2:	1101                	addi	sp,sp,-32
    11a4:	e822                	sd	s0,16(sp)
    11a6:	ec06                	sd	ra,24(sp)
    11a8:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    11aa:	145000ef          	jal	ra,1aee <strlen>
    11ae:	862a                	mv	a2,a0
    11b0:	85a2                	mv	a1,s0
    11b2:	4505                	li	a0,1
    11b4:	505000ef          	jal	ra,1eb8 <write>
    11b8:	00055763          	bgez	a0,11c6 <puts+0x24>
    return r;
}
    11bc:	60e2                	ld	ra,24(sp)
    11be:	6442                	ld	s0,16(sp)
    11c0:	557d                	li	a0,-1
    11c2:	6105                	addi	sp,sp,32
    11c4:	8082                	ret
    return write(stdout, &byte, 1);
    11c6:	00f10593          	addi	a1,sp,15
    char byte = c;
    11ca:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    11cc:	4605                	li	a2,1
    11ce:	4505                	li	a0,1
    char byte = c;
    11d0:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    11d4:	4e5000ef          	jal	ra,1eb8 <write>
}
    11d8:	60e2                	ld	ra,24(sp)
    11da:	6442                	ld	s0,16(sp)
    11dc:	41f5551b          	sraiw	a0,a0,0x1f
    11e0:	6105                	addi	sp,sp,32
    11e2:	8082                	ret

00000000000011e4 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    11e4:	7131                	addi	sp,sp,-192
    11e6:	ecce                	sd	s3,88(sp)
    11e8:	e8d2                	sd	s4,80(sp)
    11ea:	e4d6                	sd	s5,72(sp)
    11ec:	e0da                	sd	s6,64(sp)
    11ee:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    11f0:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    11f2:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    11f4:	6ae1                	lui	s5,0x18
    11f6:	000f4a37          	lui	s4,0xf4
    11fa:	00989b37          	lui	s6,0x989
{
    11fe:	fc86                	sd	ra,120(sp)
    1200:	f8a2                	sd	s0,112(sp)
    1202:	f4a6                	sd	s1,104(sp)
    1204:	f0ca                	sd	s2,96(sp)
    1206:	fc5e                	sd	s7,56(sp)
    1208:	e52e                	sd	a1,136(sp)
    120a:	e932                	sd	a2,144(sp)
    120c:	ed36                	sd	a3,152(sp)
    120e:	f13a                	sd	a4,160(sp)
    1210:	f942                	sd	a6,176(sp)
    1212:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1214:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    1216:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x5ff>
    121a:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x1658f>
    121e:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf212f>
    1222:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x98756f>
    for (;;)
    {
        if (!*s)
    1226:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    122a:	02500913          	li	s2,37
        if (!*s)
    122e:	1a078f63          	beqz	a5,13ec <printf+0x208>
    1232:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1234:	17278e63          	beq	a5,s2,13b0 <printf+0x1cc>
    1238:	00164783          	lbu	a5,1(a2)
    123c:	0605                	addi	a2,a2,1
    123e:	fbfd                	bnez	a5,1234 <printf+0x50>
    1240:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    1242:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1246:	85aa                	mv	a1,a0
    1248:	8622                	mv	a2,s0
    124a:	4505                	li	a0,1
    124c:	46d000ef          	jal	ra,1eb8 <write>
        out(f, a, l);
        if (l)
    1250:	18041963          	bnez	s0,13e2 <printf+0x1fe>
            continue;
        if (s[1] == 0)
    1254:	0014c783          	lbu	a5,1(s1)
    1258:	18078a63          	beqz	a5,13ec <printf+0x208>
            break;
        switch (s[1])
    125c:	07300713          	li	a4,115
    1260:	28e78e63          	beq	a5,a4,14fc <printf+0x318>
    1264:	18f76f63          	bltu	a4,a5,1402 <printf+0x21e>
    1268:	06400713          	li	a4,100
    126c:	2ae78c63          	beq	a5,a4,1524 <printf+0x340>
    1270:	07000713          	li	a4,112
    1274:	3ce79c63          	bne	a5,a4,164c <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1278:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    127a:	00001797          	auipc	a5,0x1
    127e:	e9678793          	addi	a5,a5,-362 # 2110 <digits>
            printptr(va_arg(ap, uint64));
    1282:	6298                	ld	a4,0(a3)
    1284:	00868093          	addi	ra,a3,8
    1288:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    128a:	00471293          	slli	t0,a4,0x4
    128e:	00c71f13          	slli	t5,a4,0xc
    1292:	01471e13          	slli	t3,a4,0x14
    1296:	01c71893          	slli	a7,a4,0x1c
    129a:	02471813          	slli	a6,a4,0x24
    129e:	02871513          	slli	a0,a4,0x28
    12a2:	02c71593          	slli	a1,a4,0x2c
    12a6:	03071693          	slli	a3,a4,0x30
    12aa:	00871f93          	slli	t6,a4,0x8
    12ae:	01071e93          	slli	t4,a4,0x10
    12b2:	01871313          	slli	t1,a4,0x18
    12b6:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12ba:	03c2d293          	srli	t0,t0,0x3c
    12be:	03cf5f13          	srli	t5,t5,0x3c
    12c2:	03ce5e13          	srli	t3,t3,0x3c
    12c6:	03c8d893          	srli	a7,a7,0x3c
    12ca:	03c85813          	srli	a6,a6,0x3c
    12ce:	9171                	srli	a0,a0,0x3c
    12d0:	91f1                	srli	a1,a1,0x3c
    12d2:	92f1                	srli	a3,a3,0x3c
    12d4:	92be                	add	t0,t0,a5
    12d6:	9f3e                	add	t5,t5,a5
    12d8:	9e3e                	add	t3,t3,a5
    12da:	98be                	add	a7,a7,a5
    12dc:	983e                	add	a6,a6,a5
    12de:	953e                	add	a0,a0,a5
    12e0:	95be                	add	a1,a1,a5
    12e2:	96be                	add	a3,a3,a5
    12e4:	03c75393          	srli	t2,a4,0x3c
    12e8:	01c75b9b          	srliw	s7,a4,0x1c
    12ec:	03cfdf93          	srli	t6,t6,0x3c
    12f0:	03cede93          	srli	t4,t4,0x3c
    12f4:	03c35313          	srli	t1,t1,0x3c
    12f8:	9271                	srli	a2,a2,0x3c
    12fa:	0002c403          	lbu	s0,0(t0)
    12fe:	93be                	add	t2,t2,a5
    1300:	000f4283          	lbu	t0,0(t5)
    1304:	9fbe                	add	t6,t6,a5
    1306:	000e4f03          	lbu	t5,0(t3)
    130a:	9ebe                	add	t4,t4,a5
    130c:	0008ce03          	lbu	t3,0(a7)
    1310:	933e                	add	t1,t1,a5
    1312:	00084883          	lbu	a7,0(a6)
    1316:	9bbe                	add	s7,s7,a5
    1318:	00054803          	lbu	a6,0(a0)
    131c:	963e                	add	a2,a2,a5
    131e:	0005c503          	lbu	a0,0(a1)
    1322:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1326:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    132a:	0003c903          	lbu	s2,0(t2)
    132e:	00064603          	lbu	a2,0(a2)
    1332:	000fc383          	lbu	t2,0(t6)
    1336:	8b3d                	andi	a4,a4,15
    1338:	000ecf83          	lbu	t6,0(t4)
    133c:	92f1                	srli	a3,a3,0x3c
    133e:	00034e83          	lbu	t4,0(t1)
    1342:	000bc303          	lbu	t1,0(s7)
    1346:	96be                	add	a3,a3,a5
    1348:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    134a:	7761                	lui	a4,0xffff8
    134c:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1350:	00710623          	sb	t2,12(sp)
    1354:	005106a3          	sb	t0,13(sp)
    1358:	01f10723          	sb	t6,14(sp)
    135c:	01e107a3          	sb	t5,15(sp)
    1360:	01d10823          	sb	t4,16(sp)
    1364:	01c108a3          	sb	t3,17(sp)
    1368:	00610923          	sb	t1,18(sp)
    136c:	011109a3          	sb	a7,19(sp)
    1370:	01010a23          	sb	a6,20(sp)
    1374:	00a10aa3          	sb	a0,21(sp)
    1378:	00b10b23          	sb	a1,22(sp)
    137c:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    1380:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1384:	01210523          	sb	s2,10(sp)
    1388:	008105a3          	sb	s0,11(sp)
    138c:	0006c703          	lbu	a4,0(a3)
    1390:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1394:	4649                	li	a2,18
    1396:	002c                	addi	a1,sp,8
    1398:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    139a:	00e10c23          	sb	a4,24(sp)
    139e:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    13a2:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    13a6:	313000ef          	jal	ra,1eb8 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    13aa:	00248513          	addi	a0,s1,2
    13ae:	bda5                	j	1226 <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    13b0:	00064783          	lbu	a5,0(a2)
    13b4:	84b2                	mv	s1,a2
    13b6:	01278963          	beq	a5,s2,13c8 <printf+0x1e4>
    13ba:	b561                	j	1242 <printf+0x5e>
    13bc:	0024c783          	lbu	a5,2(s1)
    13c0:	0605                	addi	a2,a2,1
    13c2:	0489                	addi	s1,s1,2
    13c4:	e7279fe3          	bne	a5,s2,1242 <printf+0x5e>
    13c8:	0014c783          	lbu	a5,1(s1)
    13cc:	ff2788e3          	beq	a5,s2,13bc <printf+0x1d8>
        l = z - a;
    13d0:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13d4:	85aa                	mv	a1,a0
    13d6:	8622                	mv	a2,s0
    13d8:	4505                	li	a0,1
    13da:	2df000ef          	jal	ra,1eb8 <write>
        if (l)
    13de:	e6040be3          	beqz	s0,1254 <printf+0x70>
    13e2:	8526                	mv	a0,s1
        if (!*s)
    13e4:	00054783          	lbu	a5,0(a0)
    13e8:	e40795e3          	bnez	a5,1232 <printf+0x4e>
    }
    va_end(ap);
    13ec:	70e6                	ld	ra,120(sp)
    13ee:	7446                	ld	s0,112(sp)
    13f0:	74a6                	ld	s1,104(sp)
    13f2:	7906                	ld	s2,96(sp)
    13f4:	69e6                	ld	s3,88(sp)
    13f6:	6a46                	ld	s4,80(sp)
    13f8:	6aa6                	ld	s5,72(sp)
    13fa:	6b06                	ld	s6,64(sp)
    13fc:	7be2                	ld	s7,56(sp)
    13fe:	6129                	addi	sp,sp,192
    1400:	8082                	ret
        switch (s[1])
    1402:	07800713          	li	a4,120
    1406:	24e79363          	bne	a5,a4,164c <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    140a:	6782                	ld	a5,0(sp)
    140c:	4394                	lw	a3,0(a5)
    140e:	07a1                	addi	a5,a5,8
    1410:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1412:	2606c263          	bltz	a3,1676 <printf+0x492>
        buf[i--] = digits[x % base];
    1416:	00001797          	auipc	a5,0x1
    141a:	cfa78793          	addi	a5,a5,-774 # 2110 <digits>
    141e:	00f6f713          	andi	a4,a3,15
    1422:	973e                	add	a4,a4,a5
    1424:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff5ef0>
    buf[16] = 0;
    1428:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    142c:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    142e:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1432:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    1436:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    143a:	0046d51b          	srliw	a0,a3,0x4
    143e:	0ad5d563          	bge	a1,a3,14e8 <printf+0x304>
        buf[i--] = digits[x % base];
    1442:	8a3d                	andi	a2,a2,15
    1444:	963e                	add	a2,a2,a5
    1446:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    144a:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    144e:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1452:	30a5fe63          	bgeu	a1,a0,176e <printf+0x58a>
        buf[i--] = digits[x % base];
    1456:	00f77613          	andi	a2,a4,15
    145a:	963e                	add	a2,a2,a5
    145c:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1460:	45bd                	li	a1,15
    1462:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    1466:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    146a:	00475513          	srli	a0,a4,0x4
    146e:	30e5f963          	bgeu	a1,a4,1780 <printf+0x59c>
        buf[i--] = digits[x % base];
    1472:	8a3d                	andi	a2,a2,15
    1474:	963e                	add	a2,a2,a5
    1476:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    147a:	00875893          	srli	a7,a4,0x8
    147e:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    1482:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    1486:	30a5fd63          	bgeu	a1,a0,17a0 <printf+0x5bc>
        buf[i--] = digits[x % base];
    148a:	8a3d                	andi	a2,a2,15
    148c:	963e                	add	a2,a2,a5
    148e:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1492:	00c75813          	srli	a6,a4,0xc
    1496:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    149a:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    149e:	3315fe63          	bgeu	a1,a7,17da <printf+0x5f6>
        buf[i--] = digits[x % base];
    14a2:	8a3d                	andi	a2,a2,15
    14a4:	963e                	add	a2,a2,a5
    14a6:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    14aa:	01075893          	srli	a7,a4,0x10
    14ae:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    14b2:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    14b6:	3305ff63          	bgeu	a1,a6,17f4 <printf+0x610>
        buf[i--] = digits[x % base];
    14ba:	8a3d                	andi	a2,a2,15
    14bc:	963e                	add	a2,a2,a5
    14be:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    14c2:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    14c6:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    14ca:	3515f863          	bgeu	a1,a7,181a <printf+0x636>
        buf[i--] = digits[x % base];
    14ce:	97ba                	add	a5,a5,a4
    14d0:	0007c783          	lbu	a5,0(a5)
    14d4:	45a1                	li	a1,8
    14d6:	00f10823          	sb	a5,16(sp)
    if (sign)
    14da:	0006d763          	bgez	a3,14e8 <printf+0x304>
        buf[i--] = '-';
    14de:	02d00793          	li	a5,45
    14e2:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    14e6:	459d                	li	a1,7
    write(f, s, l);
    14e8:	4641                	li	a2,16
    14ea:	003c                	addi	a5,sp,8
    14ec:	9e0d                	subw	a2,a2,a1
    14ee:	4505                	li	a0,1
    14f0:	95be                	add	a1,a1,a5
    14f2:	1c7000ef          	jal	ra,1eb8 <write>
        s += 2;
    14f6:	00248513          	addi	a0,s1,2
    14fa:	b335                	j	1226 <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    14fc:	6782                	ld	a5,0(sp)
    14fe:	6380                	ld	s0,0(a5)
    1500:	07a1                	addi	a5,a5,8
    1502:	e03e                	sd	a5,0(sp)
    1504:	22040a63          	beqz	s0,1738 <printf+0x554>
            l = strnlen(a, 200);
    1508:	0c800593          	li	a1,200
    150c:	8522                	mv	a0,s0
    150e:	6cc000ef          	jal	ra,1bda <strnlen>
    write(f, s, l);
    1512:	0005061b          	sext.w	a2,a0
    1516:	85a2                	mv	a1,s0
    1518:	4505                	li	a0,1
    151a:	19f000ef          	jal	ra,1eb8 <write>
        s += 2;
    151e:	00248513          	addi	a0,s1,2
    1522:	b311                	j	1226 <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    1524:	6782                	ld	a5,0(sp)
    1526:	4390                	lw	a2,0(a5)
    1528:	07a1                	addi	a5,a5,8
    152a:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    152c:	1a064363          	bltz	a2,16d2 <printf+0x4ee>
        buf[i--] = digits[x % base];
    1530:	46a9                	li	a3,10
    1532:	02d6773b          	remuw	a4,a2,a3
    1536:	00001797          	auipc	a5,0x1
    153a:	bda78793          	addi	a5,a5,-1062 # 2110 <digits>
    buf[16] = 0;
    153e:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1542:	4525                	li	a0,9
        x = xx;
    1544:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    1548:	973e                	add	a4,a4,a5
    154a:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    154e:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    1552:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1556:	2cc55063          	bge	a0,a2,1816 <printf+0x632>
    155a:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    155e:	02d5f73b          	remuw	a4,a1,a3
    1562:	1702                	slli	a4,a4,0x20
    1564:	9301                	srli	a4,a4,0x20
    1566:	973e                	add	a4,a4,a5
    1568:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    156c:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    1570:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    1574:	1f057d63          	bgeu	a0,a6,176e <printf+0x58a>
        buf[i--] = digits[x % base];
    1578:	4529                	li	a0,10
    } while ((x /= base) != 0);
    157a:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    157c:	02a5f73b          	remuw	a4,a1,a0
    1580:	973e                	add	a4,a4,a5
    1582:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    1586:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    158a:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    158e:	1ab6f163          	bgeu	a3,a1,1730 <printf+0x54c>
    1592:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    1596:	02a776bb          	remuw	a3,a4,a0
    159a:	96be                	add	a3,a3,a5
    159c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    15a0:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    15a4:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    15a8:	20b87c63          	bgeu	a6,a1,17c0 <printf+0x5dc>
    15ac:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    15b0:	02a776bb          	remuw	a3,a4,a0
    15b4:	96be                	add	a3,a3,a5
    15b6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    15ba:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    15be:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    15c2:	20b87363          	bgeu	a6,a1,17c8 <printf+0x5e4>
        buf[i--] = digits[x % base];
    15c6:	02a776bb          	remuw	a3,a4,a0
    15ca:	96be                	add	a3,a3,a5
    15cc:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    15d0:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    15d4:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    15d8:	20b9f563          	bgeu	s3,a1,17e2 <printf+0x5fe>
        buf[i--] = digits[x % base];
    15dc:	02a776bb          	remuw	a3,a4,a0
    15e0:	96be                	add	a3,a3,a5
    15e2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    15e6:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    15ea:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    15ee:	20bafb63          	bgeu	s5,a1,1804 <printf+0x620>
        buf[i--] = digits[x % base];
    15f2:	02a776bb          	remuw	a3,a4,a0
    15f6:	96be                	add	a3,a3,a5
    15f8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    15fc:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1600:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1604:	1eba7c63          	bgeu	s4,a1,17fc <printf+0x618>
        buf[i--] = digits[x % base];
    1608:	02a776bb          	remuw	a3,a4,a0
    160c:	96be                	add	a3,a3,a5
    160e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1612:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1616:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    161a:	14bb7163          	bgeu	s6,a1,175c <printf+0x578>
        buf[i--] = digits[x % base];
    161e:	1702                	slli	a4,a4,0x20
    1620:	9301                	srli	a4,a4,0x20
    1622:	97ba                	add	a5,a5,a4
    1624:	0007c783          	lbu	a5,0(a5)
    1628:	4599                	li	a1,6
    162a:	00f10723          	sb	a5,14(sp)
    if (sign)
    162e:	ea065de3          	bgez	a2,14e8 <printf+0x304>
        buf[i--] = '-';
    1632:	02d00793          	li	a5,45
    1636:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    163a:	4595                	li	a1,5
    write(f, s, l);
    163c:	003c                	addi	a5,sp,8
    163e:	4641                	li	a2,16
    1640:	9e0d                	subw	a2,a2,a1
    1642:	4505                	li	a0,1
    1644:	95be                	add	a1,a1,a5
    1646:	073000ef          	jal	ra,1eb8 <write>
    164a:	b575                	j	14f6 <printf+0x312>
    char byte = c;
    164c:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1650:	4605                	li	a2,1
    1652:	002c                	addi	a1,sp,8
    1654:	4505                	li	a0,1
    char byte = c;
    1656:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    165a:	05f000ef          	jal	ra,1eb8 <write>
    char byte = c;
    165e:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1662:	4605                	li	a2,1
    1664:	002c                	addi	a1,sp,8
    1666:	4505                	li	a0,1
    char byte = c;
    1668:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    166c:	04d000ef          	jal	ra,1eb8 <write>
        s += 2;
    1670:	00248513          	addi	a0,s1,2
    1674:	be4d                	j	1226 <printf+0x42>
        x = -xx;
    1676:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    167a:	00001797          	auipc	a5,0x1
    167e:	a9678793          	addi	a5,a5,-1386 # 2110 <digits>
    1682:	00f77613          	andi	a2,a4,15
    1686:	963e                	add	a2,a2,a5
    1688:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    168c:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1690:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    1692:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1696:	0047551b          	srliw	a0,a4,0x4
    169a:	0047561b          	srliw	a2,a4,0x4
    169e:	0ab6d263          	bge	a3,a1,1742 <printf+0x55e>
        buf[i--] = digits[x % base];
    16a2:	8a3d                	andi	a2,a2,15
    16a4:	963e                	add	a2,a2,a5
    16a6:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    16aa:	463d                	li	a2,15
    16ac:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    16b0:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    16b4:	daa661e3          	bltu	a2,a0,1456 <printf+0x272>
        buf[i--] = '-';
    16b8:	02d00793          	li	a5,45
    16bc:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    16c0:	45b5                	li	a1,13
    write(f, s, l);
    16c2:	003c                	addi	a5,sp,8
    16c4:	4641                	li	a2,16
    16c6:	9e0d                	subw	a2,a2,a1
    16c8:	4505                	li	a0,1
    16ca:	95be                	add	a1,a1,a5
    16cc:	7ec000ef          	jal	ra,1eb8 <write>
    16d0:	b51d                	j	14f6 <printf+0x312>
        x = -xx;
    16d2:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    16d6:	46a9                	li	a3,10
    16d8:	02d875bb          	remuw	a1,a6,a3
    16dc:	00001797          	auipc	a5,0x1
    16e0:	a3478793          	addi	a5,a5,-1484 # 2110 <digits>
    buf[16] = 0;
    16e4:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    16e8:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    16ea:	95be                	add	a1,a1,a5
    16ec:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    16f0:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    16f4:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    16f8:	04a65563          	bge	a2,a0,1742 <printf+0x55e>
    16fc:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1700:	02d775bb          	remuw	a1,a4,a3
    1704:	95be                	add	a1,a1,a5
    1706:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    170a:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    170e:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    1712:	fb0573e3          	bgeu	a0,a6,16b8 <printf+0x4d4>
        buf[i--] = digits[x % base];
    1716:	4529                	li	a0,10
    } while ((x /= base) != 0);
    1718:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    171a:	02a5f73b          	remuw	a4,a1,a0
    171e:	973e                	add	a4,a4,a5
    1720:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    1724:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    1728:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    172c:	e6b6e3e3          	bltu	a3,a1,1592 <printf+0x3ae>
        buf[i--] = digits[x % base];
    1730:	45b5                	li	a1,13
    if (sign)
    1732:	da065be3          	bgez	a2,14e8 <printf+0x304>
    1736:	a881                	j	1786 <printf+0x5a2>
                a = "(null)";
    1738:	00001417          	auipc	s0,0x1
    173c:	9a840413          	addi	s0,s0,-1624 # 20e0 <unlink+0x82>
    1740:	b3e1                	j	1508 <printf+0x324>
        buf[i--] = '-';
    1742:	02d00793          	li	a5,45
    1746:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    174a:	45b9                	li	a1,14
    write(f, s, l);
    174c:	003c                	addi	a5,sp,8
    174e:	4641                	li	a2,16
    1750:	9e0d                	subw	a2,a2,a1
    1752:	4505                	li	a0,1
    1754:	95be                	add	a1,a1,a5
    1756:	762000ef          	jal	ra,1eb8 <write>
    175a:	bb71                	j	14f6 <printf+0x312>
        buf[i--] = digits[x % base];
    175c:	459d                	li	a1,7
    if (sign)
    175e:	d80655e3          	bgez	a2,14e8 <printf+0x304>
        buf[i--] = '-';
    1762:	02d00793          	li	a5,45
    1766:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    176a:	4599                	li	a1,6
    176c:	bbb5                	j	14e8 <printf+0x304>
    176e:	45b9                	li	a1,14
    write(f, s, l);
    1770:	003c                	addi	a5,sp,8
    1772:	4641                	li	a2,16
    1774:	9e0d                	subw	a2,a2,a1
    1776:	4505                	li	a0,1
    1778:	95be                	add	a1,a1,a5
    177a:	73e000ef          	jal	ra,1eb8 <write>
    177e:	bba5                	j	14f6 <printf+0x312>
        buf[i--] = digits[x % base];
    1780:	45b5                	li	a1,13
    if (sign)
    1782:	d606d3e3          	bgez	a3,14e8 <printf+0x304>
        buf[i--] = '-';
    1786:	02d00793          	li	a5,45
    178a:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    178e:	45b1                	li	a1,12
    write(f, s, l);
    1790:	003c                	addi	a5,sp,8
    1792:	4641                	li	a2,16
    1794:	9e0d                	subw	a2,a2,a1
    1796:	4505                	li	a0,1
    1798:	95be                	add	a1,a1,a5
    179a:	71e000ef          	jal	ra,1eb8 <write>
    179e:	bba1                	j	14f6 <printf+0x312>
        buf[i--] = digits[x % base];
    17a0:	45b1                	li	a1,12
    if (sign)
    17a2:	d406d3e3          	bgez	a3,14e8 <printf+0x304>
        buf[i--] = '-';
    17a6:	02d00793          	li	a5,45
    17aa:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    17ae:	45ad                	li	a1,11
    write(f, s, l);
    17b0:	003c                	addi	a5,sp,8
    17b2:	4641                	li	a2,16
    17b4:	9e0d                	subw	a2,a2,a1
    17b6:	4505                	li	a0,1
    17b8:	95be                	add	a1,a1,a5
    17ba:	6fe000ef          	jal	ra,1eb8 <write>
    17be:	bb25                	j	14f6 <printf+0x312>
        buf[i--] = digits[x % base];
    17c0:	45b1                	li	a1,12
    if (sign)
    17c2:	d20653e3          	bgez	a2,14e8 <printf+0x304>
    17c6:	b7c5                	j	17a6 <printf+0x5c2>
        buf[i--] = digits[x % base];
    17c8:	45ad                	li	a1,11
    if (sign)
    17ca:	d0065fe3          	bgez	a2,14e8 <printf+0x304>
        buf[i--] = '-';
    17ce:	02d00793          	li	a5,45
    17d2:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    17d6:	45a9                	li	a1,10
    17d8:	bb01                	j	14e8 <printf+0x304>
    17da:	45ad                	li	a1,11
    if (sign)
    17dc:	d006d6e3          	bgez	a3,14e8 <printf+0x304>
    17e0:	b7fd                	j	17ce <printf+0x5ea>
        buf[i--] = digits[x % base];
    17e2:	45a9                	li	a1,10
    if (sign)
    17e4:	d00652e3          	bgez	a2,14e8 <printf+0x304>
        buf[i--] = '-';
    17e8:	02d00793          	li	a5,45
    17ec:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    17f0:	45a5                	li	a1,9
    17f2:	b9dd                	j	14e8 <printf+0x304>
    17f4:	45a9                	li	a1,10
    if (sign)
    17f6:	ce06d9e3          	bgez	a3,14e8 <printf+0x304>
    17fa:	b7fd                	j	17e8 <printf+0x604>
        buf[i--] = digits[x % base];
    17fc:	45a1                	li	a1,8
    if (sign)
    17fe:	ce0655e3          	bgez	a2,14e8 <printf+0x304>
    1802:	b9f1                	j	14de <printf+0x2fa>
        buf[i--] = digits[x % base];
    1804:	45a5                	li	a1,9
    if (sign)
    1806:	ce0651e3          	bgez	a2,14e8 <printf+0x304>
        buf[i--] = '-';
    180a:	02d00793          	li	a5,45
    180e:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1812:	45a1                	li	a1,8
    1814:	b9d1                	j	14e8 <printf+0x304>
    i = 15;
    1816:	45bd                	li	a1,15
    1818:	b9c1                	j	14e8 <printf+0x304>
        buf[i--] = digits[x % base];
    181a:	45a5                	li	a1,9
    if (sign)
    181c:	cc06d6e3          	bgez	a3,14e8 <printf+0x304>
    1820:	b7ed                	j	180a <printf+0x626>

0000000000001822 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1822:	02000793          	li	a5,32
    1826:	00f50663          	beq	a0,a5,1832 <isspace+0x10>
    182a:	355d                	addiw	a0,a0,-9
    182c:	00553513          	sltiu	a0,a0,5
    1830:	8082                	ret
    1832:	4505                	li	a0,1
}
    1834:	8082                	ret

0000000000001836 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1836:	fd05051b          	addiw	a0,a0,-48
}
    183a:	00a53513          	sltiu	a0,a0,10
    183e:	8082                	ret

0000000000001840 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1840:	02000613          	li	a2,32
    1844:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1846:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    184a:	ff77069b          	addiw	a3,a4,-9
    184e:	04c70d63          	beq	a4,a2,18a8 <atoi+0x68>
    1852:	0007079b          	sext.w	a5,a4
    1856:	04d5f963          	bgeu	a1,a3,18a8 <atoi+0x68>
        s++;
    switch (*s)
    185a:	02b00693          	li	a3,43
    185e:	04d70a63          	beq	a4,a3,18b2 <atoi+0x72>
    1862:	02d00693          	li	a3,45
    1866:	06d70463          	beq	a4,a3,18ce <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    186a:	fd07859b          	addiw	a1,a5,-48
    186e:	4625                	li	a2,9
    1870:	873e                	mv	a4,a5
    1872:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1874:	4e01                	li	t3,0
    while (isdigit(*s))
    1876:	04b66a63          	bltu	a2,a1,18ca <atoi+0x8a>
    int n = 0, neg = 0;
    187a:	4501                	li	a0,0
    while (isdigit(*s))
    187c:	4825                	li	a6,9
    187e:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1882:	0025179b          	slliw	a5,a0,0x2
    1886:	9d3d                	addw	a0,a0,a5
    1888:	fd07031b          	addiw	t1,a4,-48
    188c:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1890:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1894:	0685                	addi	a3,a3,1
    1896:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    189a:	0006071b          	sext.w	a4,a2
    189e:	feb870e3          	bgeu	a6,a1,187e <atoi+0x3e>
    return neg ? n : -n;
    18a2:	000e0563          	beqz	t3,18ac <atoi+0x6c>
}
    18a6:	8082                	ret
        s++;
    18a8:	0505                	addi	a0,a0,1
    18aa:	bf71                	j	1846 <atoi+0x6>
    18ac:	4113053b          	subw	a0,t1,a7
    18b0:	8082                	ret
    while (isdigit(*s))
    18b2:	00154783          	lbu	a5,1(a0)
    18b6:	4625                	li	a2,9
        s++;
    18b8:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    18bc:	fd07859b          	addiw	a1,a5,-48
    18c0:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    18c4:	4e01                	li	t3,0
    while (isdigit(*s))
    18c6:	fab67ae3          	bgeu	a2,a1,187a <atoi+0x3a>
    18ca:	4501                	li	a0,0
}
    18cc:	8082                	ret
    while (isdigit(*s))
    18ce:	00154783          	lbu	a5,1(a0)
    18d2:	4625                	li	a2,9
        s++;
    18d4:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    18d8:	fd07859b          	addiw	a1,a5,-48
    18dc:	0007871b          	sext.w	a4,a5
    18e0:	feb665e3          	bltu	a2,a1,18ca <atoi+0x8a>
        neg = 1;
    18e4:	4e05                	li	t3,1
    18e6:	bf51                	j	187a <atoi+0x3a>

00000000000018e8 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    18e8:	16060d63          	beqz	a2,1a62 <memset+0x17a>
    18ec:	40a007b3          	neg	a5,a0
    18f0:	8b9d                	andi	a5,a5,7
    18f2:	00778713          	addi	a4,a5,7
    18f6:	482d                	li	a6,11
    18f8:	0ff5f593          	andi	a1,a1,255
    18fc:	fff60693          	addi	a3,a2,-1
    1900:	17076263          	bltu	a4,a6,1a64 <memset+0x17c>
    1904:	16e6ea63          	bltu	a3,a4,1a78 <memset+0x190>
    1908:	16078563          	beqz	a5,1a72 <memset+0x18a>
    190c:	00b50023          	sb	a1,0(a0)
    1910:	4705                	li	a4,1
    1912:	00150e93          	addi	t4,a0,1
    1916:	14e78c63          	beq	a5,a4,1a6e <memset+0x186>
    191a:	00b500a3          	sb	a1,1(a0)
    191e:	4709                	li	a4,2
    1920:	00250e93          	addi	t4,a0,2
    1924:	14e78d63          	beq	a5,a4,1a7e <memset+0x196>
    1928:	00b50123          	sb	a1,2(a0)
    192c:	470d                	li	a4,3
    192e:	00350e93          	addi	t4,a0,3
    1932:	12e78b63          	beq	a5,a4,1a68 <memset+0x180>
    1936:	00b501a3          	sb	a1,3(a0)
    193a:	4711                	li	a4,4
    193c:	00450e93          	addi	t4,a0,4
    1940:	14e78163          	beq	a5,a4,1a82 <memset+0x19a>
    1944:	00b50223          	sb	a1,4(a0)
    1948:	4715                	li	a4,5
    194a:	00550e93          	addi	t4,a0,5
    194e:	12e78c63          	beq	a5,a4,1a86 <memset+0x19e>
    1952:	00b502a3          	sb	a1,5(a0)
    1956:	471d                	li	a4,7
    1958:	00650e93          	addi	t4,a0,6
    195c:	12e79763          	bne	a5,a4,1a8a <memset+0x1a2>
    1960:	00750e93          	addi	t4,a0,7
    1964:	00b50323          	sb	a1,6(a0)
    1968:	4f1d                	li	t5,7
    196a:	00859713          	slli	a4,a1,0x8
    196e:	8f4d                	or	a4,a4,a1
    1970:	01059e13          	slli	t3,a1,0x10
    1974:	01c76e33          	or	t3,a4,t3
    1978:	01859313          	slli	t1,a1,0x18
    197c:	006e6333          	or	t1,t3,t1
    1980:	02059893          	slli	a7,a1,0x20
    1984:	011368b3          	or	a7,t1,a7
    1988:	02859813          	slli	a6,a1,0x28
    198c:	40f60333          	sub	t1,a2,a5
    1990:	0108e833          	or	a6,a7,a6
    1994:	03059693          	slli	a3,a1,0x30
    1998:	00d866b3          	or	a3,a6,a3
    199c:	03859713          	slli	a4,a1,0x38
    19a0:	97aa                	add	a5,a5,a0
    19a2:	ff837813          	andi	a6,t1,-8
    19a6:	8f55                	or	a4,a4,a3
    19a8:	00f806b3          	add	a3,a6,a5
    19ac:	e398                	sd	a4,0(a5)
    19ae:	07a1                	addi	a5,a5,8
    19b0:	fed79ee3          	bne	a5,a3,19ac <memset+0xc4>
    19b4:	ff837693          	andi	a3,t1,-8
    19b8:	00de87b3          	add	a5,t4,a3
    19bc:	01e6873b          	addw	a4,a3,t5
    19c0:	0ad30663          	beq	t1,a3,1a6c <memset+0x184>
    19c4:	00b78023          	sb	a1,0(a5)
    19c8:	0017069b          	addiw	a3,a4,1
    19cc:	08c6fb63          	bgeu	a3,a2,1a62 <memset+0x17a>
    19d0:	00b780a3          	sb	a1,1(a5)
    19d4:	0027069b          	addiw	a3,a4,2
    19d8:	08c6f563          	bgeu	a3,a2,1a62 <memset+0x17a>
    19dc:	00b78123          	sb	a1,2(a5)
    19e0:	0037069b          	addiw	a3,a4,3
    19e4:	06c6ff63          	bgeu	a3,a2,1a62 <memset+0x17a>
    19e8:	00b781a3          	sb	a1,3(a5)
    19ec:	0047069b          	addiw	a3,a4,4
    19f0:	06c6f963          	bgeu	a3,a2,1a62 <memset+0x17a>
    19f4:	00b78223          	sb	a1,4(a5)
    19f8:	0057069b          	addiw	a3,a4,5
    19fc:	06c6f363          	bgeu	a3,a2,1a62 <memset+0x17a>
    1a00:	00b782a3          	sb	a1,5(a5)
    1a04:	0067069b          	addiw	a3,a4,6
    1a08:	04c6fd63          	bgeu	a3,a2,1a62 <memset+0x17a>
    1a0c:	00b78323          	sb	a1,6(a5)
    1a10:	0077069b          	addiw	a3,a4,7
    1a14:	04c6f763          	bgeu	a3,a2,1a62 <memset+0x17a>
    1a18:	00b783a3          	sb	a1,7(a5)
    1a1c:	0087069b          	addiw	a3,a4,8
    1a20:	04c6f163          	bgeu	a3,a2,1a62 <memset+0x17a>
    1a24:	00b78423          	sb	a1,8(a5)
    1a28:	0097069b          	addiw	a3,a4,9
    1a2c:	02c6fb63          	bgeu	a3,a2,1a62 <memset+0x17a>
    1a30:	00b784a3          	sb	a1,9(a5)
    1a34:	00a7069b          	addiw	a3,a4,10
    1a38:	02c6f563          	bgeu	a3,a2,1a62 <memset+0x17a>
    1a3c:	00b78523          	sb	a1,10(a5)
    1a40:	00b7069b          	addiw	a3,a4,11
    1a44:	00c6ff63          	bgeu	a3,a2,1a62 <memset+0x17a>
    1a48:	00b785a3          	sb	a1,11(a5)
    1a4c:	00c7069b          	addiw	a3,a4,12
    1a50:	00c6f963          	bgeu	a3,a2,1a62 <memset+0x17a>
    1a54:	00b78623          	sb	a1,12(a5)
    1a58:	2735                	addiw	a4,a4,13
    1a5a:	00c77463          	bgeu	a4,a2,1a62 <memset+0x17a>
    1a5e:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1a62:	8082                	ret
    1a64:	472d                	li	a4,11
    1a66:	bd79                	j	1904 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a68:	4f0d                	li	t5,3
    1a6a:	b701                	j	196a <memset+0x82>
    1a6c:	8082                	ret
    1a6e:	4f05                	li	t5,1
    1a70:	bded                	j	196a <memset+0x82>
    1a72:	8eaa                	mv	t4,a0
    1a74:	4f01                	li	t5,0
    1a76:	bdd5                	j	196a <memset+0x82>
    1a78:	87aa                	mv	a5,a0
    1a7a:	4701                	li	a4,0
    1a7c:	b7a1                	j	19c4 <memset+0xdc>
    1a7e:	4f09                	li	t5,2
    1a80:	b5ed                	j	196a <memset+0x82>
    1a82:	4f11                	li	t5,4
    1a84:	b5dd                	j	196a <memset+0x82>
    1a86:	4f15                	li	t5,5
    1a88:	b5cd                	j	196a <memset+0x82>
    1a8a:	4f19                	li	t5,6
    1a8c:	bdf9                	j	196a <memset+0x82>

0000000000001a8e <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1a8e:	00054783          	lbu	a5,0(a0)
    1a92:	0005c703          	lbu	a4,0(a1)
    1a96:	00e79863          	bne	a5,a4,1aa6 <strcmp+0x18>
    1a9a:	0505                	addi	a0,a0,1
    1a9c:	0585                	addi	a1,a1,1
    1a9e:	fbe5                	bnez	a5,1a8e <strcmp>
    1aa0:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1aa2:	9d19                	subw	a0,a0,a4
    1aa4:	8082                	ret
    1aa6:	0007851b          	sext.w	a0,a5
    1aaa:	bfe5                	j	1aa2 <strcmp+0x14>

0000000000001aac <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1aac:	ce05                	beqz	a2,1ae4 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1aae:	00054703          	lbu	a4,0(a0)
    1ab2:	0005c783          	lbu	a5,0(a1)
    1ab6:	cb0d                	beqz	a4,1ae8 <strncmp+0x3c>
    if (!n--)
    1ab8:	167d                	addi	a2,a2,-1
    1aba:	00c506b3          	add	a3,a0,a2
    1abe:	a819                	j	1ad4 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1ac0:	00a68e63          	beq	a3,a0,1adc <strncmp+0x30>
    1ac4:	0505                	addi	a0,a0,1
    1ac6:	00e79b63          	bne	a5,a4,1adc <strncmp+0x30>
    1aca:	00054703          	lbu	a4,0(a0)
    1ace:	0005c783          	lbu	a5,0(a1)
    1ad2:	cb19                	beqz	a4,1ae8 <strncmp+0x3c>
    1ad4:	0005c783          	lbu	a5,0(a1)
    1ad8:	0585                	addi	a1,a1,1
    1ada:	f3fd                	bnez	a5,1ac0 <strncmp+0x14>
        ;
    return *l - *r;
    1adc:	0007051b          	sext.w	a0,a4
    1ae0:	9d1d                	subw	a0,a0,a5
    1ae2:	8082                	ret
        return 0;
    1ae4:	4501                	li	a0,0
}
    1ae6:	8082                	ret
    1ae8:	4501                	li	a0,0
    return *l - *r;
    1aea:	9d1d                	subw	a0,a0,a5
    1aec:	8082                	ret

0000000000001aee <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1aee:	00757793          	andi	a5,a0,7
    1af2:	cf89                	beqz	a5,1b0c <strlen+0x1e>
    1af4:	87aa                	mv	a5,a0
    1af6:	a029                	j	1b00 <strlen+0x12>
    1af8:	0785                	addi	a5,a5,1
    1afa:	0077f713          	andi	a4,a5,7
    1afe:	cb01                	beqz	a4,1b0e <strlen+0x20>
        if (!*s)
    1b00:	0007c703          	lbu	a4,0(a5)
    1b04:	fb75                	bnez	a4,1af8 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1b06:	40a78533          	sub	a0,a5,a0
}
    1b0a:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1b0c:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1b0e:	6394                	ld	a3,0(a5)
    1b10:	00000597          	auipc	a1,0x0
    1b14:	5e05b583          	ld	a1,1504(a1) # 20f0 <LF+0x5>
    1b18:	00000617          	auipc	a2,0x0
    1b1c:	5e063603          	ld	a2,1504(a2) # 20f8 <LF+0xd>
    1b20:	a019                	j	1b26 <strlen+0x38>
    1b22:	6794                	ld	a3,8(a5)
    1b24:	07a1                	addi	a5,a5,8
    1b26:	00b68733          	add	a4,a3,a1
    1b2a:	fff6c693          	not	a3,a3
    1b2e:	8f75                	and	a4,a4,a3
    1b30:	8f71                	and	a4,a4,a2
    1b32:	db65                	beqz	a4,1b22 <strlen+0x34>
    for (; *s; s++)
    1b34:	0007c703          	lbu	a4,0(a5)
    1b38:	d779                	beqz	a4,1b06 <strlen+0x18>
    1b3a:	0017c703          	lbu	a4,1(a5)
    1b3e:	0785                	addi	a5,a5,1
    1b40:	d379                	beqz	a4,1b06 <strlen+0x18>
    1b42:	0017c703          	lbu	a4,1(a5)
    1b46:	0785                	addi	a5,a5,1
    1b48:	fb6d                	bnez	a4,1b3a <strlen+0x4c>
    1b4a:	bf75                	j	1b06 <strlen+0x18>

0000000000001b4c <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1b4c:	00757713          	andi	a4,a0,7
{
    1b50:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1b52:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1b56:	cb19                	beqz	a4,1b6c <memchr+0x20>
    1b58:	ce25                	beqz	a2,1bd0 <memchr+0x84>
    1b5a:	0007c703          	lbu	a4,0(a5)
    1b5e:	04b70e63          	beq	a4,a1,1bba <memchr+0x6e>
    1b62:	0785                	addi	a5,a5,1
    1b64:	0077f713          	andi	a4,a5,7
    1b68:	167d                	addi	a2,a2,-1
    1b6a:	f77d                	bnez	a4,1b58 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1b6c:	4501                	li	a0,0
    if (n && *s != c)
    1b6e:	c235                	beqz	a2,1bd2 <memchr+0x86>
    1b70:	0007c703          	lbu	a4,0(a5)
    1b74:	04b70363          	beq	a4,a1,1bba <memchr+0x6e>
        size_t k = ONES * c;
    1b78:	00000517          	auipc	a0,0x0
    1b7c:	58853503          	ld	a0,1416(a0) # 2100 <LF+0x15>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1b80:	471d                	li	a4,7
        size_t k = ONES * c;
    1b82:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1b86:	02c77a63          	bgeu	a4,a2,1bba <memchr+0x6e>
    1b8a:	00000897          	auipc	a7,0x0
    1b8e:	5668b883          	ld	a7,1382(a7) # 20f0 <LF+0x5>
    1b92:	00000817          	auipc	a6,0x0
    1b96:	56683803          	ld	a6,1382(a6) # 20f8 <LF+0xd>
    1b9a:	431d                	li	t1,7
    1b9c:	a029                	j	1ba6 <memchr+0x5a>
    1b9e:	1661                	addi	a2,a2,-8
    1ba0:	07a1                	addi	a5,a5,8
    1ba2:	02c37963          	bgeu	t1,a2,1bd4 <memchr+0x88>
    1ba6:	6398                	ld	a4,0(a5)
    1ba8:	8f29                	xor	a4,a4,a0
    1baa:	011706b3          	add	a3,a4,a7
    1bae:	fff74713          	not	a4,a4
    1bb2:	8f75                	and	a4,a4,a3
    1bb4:	01077733          	and	a4,a4,a6
    1bb8:	d37d                	beqz	a4,1b9e <memchr+0x52>
    1bba:	853e                	mv	a0,a5
    1bbc:	97b2                	add	a5,a5,a2
    1bbe:	a021                	j	1bc6 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1bc0:	0505                	addi	a0,a0,1
    1bc2:	00f50763          	beq	a0,a5,1bd0 <memchr+0x84>
    1bc6:	00054703          	lbu	a4,0(a0)
    1bca:	feb71be3          	bne	a4,a1,1bc0 <memchr+0x74>
    1bce:	8082                	ret
    return n ? (void *)s : 0;
    1bd0:	4501                	li	a0,0
}
    1bd2:	8082                	ret
    return n ? (void *)s : 0;
    1bd4:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1bd6:	f275                	bnez	a2,1bba <memchr+0x6e>
}
    1bd8:	8082                	ret

0000000000001bda <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1bda:	1101                	addi	sp,sp,-32
    1bdc:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1bde:	862e                	mv	a2,a1
{
    1be0:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1be2:	4581                	li	a1,0
{
    1be4:	e426                	sd	s1,8(sp)
    1be6:	ec06                	sd	ra,24(sp)
    1be8:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1bea:	f63ff0ef          	jal	ra,1b4c <memchr>
    return p ? p - s : n;
    1bee:	c519                	beqz	a0,1bfc <strnlen+0x22>
}
    1bf0:	60e2                	ld	ra,24(sp)
    1bf2:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1bf4:	8d05                	sub	a0,a0,s1
}
    1bf6:	64a2                	ld	s1,8(sp)
    1bf8:	6105                	addi	sp,sp,32
    1bfa:	8082                	ret
    1bfc:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1bfe:	8522                	mv	a0,s0
}
    1c00:	6442                	ld	s0,16(sp)
    1c02:	64a2                	ld	s1,8(sp)
    1c04:	6105                	addi	sp,sp,32
    1c06:	8082                	ret

0000000000001c08 <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1c08:	00b547b3          	xor	a5,a0,a1
    1c0c:	8b9d                	andi	a5,a5,7
    1c0e:	eb95                	bnez	a5,1c42 <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1c10:	0075f793          	andi	a5,a1,7
    1c14:	e7b1                	bnez	a5,1c60 <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1c16:	6198                	ld	a4,0(a1)
    1c18:	00000617          	auipc	a2,0x0
    1c1c:	4d863603          	ld	a2,1240(a2) # 20f0 <LF+0x5>
    1c20:	00000817          	auipc	a6,0x0
    1c24:	4d883803          	ld	a6,1240(a6) # 20f8 <LF+0xd>
    1c28:	a029                	j	1c32 <stpcpy+0x2a>
    1c2a:	e118                	sd	a4,0(a0)
    1c2c:	6598                	ld	a4,8(a1)
    1c2e:	05a1                	addi	a1,a1,8
    1c30:	0521                	addi	a0,a0,8
    1c32:	00c707b3          	add	a5,a4,a2
    1c36:	fff74693          	not	a3,a4
    1c3a:	8ff5                	and	a5,a5,a3
    1c3c:	0107f7b3          	and	a5,a5,a6
    1c40:	d7ed                	beqz	a5,1c2a <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1c42:	0005c783          	lbu	a5,0(a1)
    1c46:	00f50023          	sb	a5,0(a0)
    1c4a:	c785                	beqz	a5,1c72 <stpcpy+0x6a>
    1c4c:	0015c783          	lbu	a5,1(a1)
    1c50:	0505                	addi	a0,a0,1
    1c52:	0585                	addi	a1,a1,1
    1c54:	00f50023          	sb	a5,0(a0)
    1c58:	fbf5                	bnez	a5,1c4c <stpcpy+0x44>
        ;
    return d;
}
    1c5a:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1c5c:	0505                	addi	a0,a0,1
    1c5e:	df45                	beqz	a4,1c16 <stpcpy+0xe>
            if (!(*d = *s))
    1c60:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1c64:	0585                	addi	a1,a1,1
    1c66:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1c6a:	00f50023          	sb	a5,0(a0)
    1c6e:	f7fd                	bnez	a5,1c5c <stpcpy+0x54>
}
    1c70:	8082                	ret
    1c72:	8082                	ret

0000000000001c74 <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1c74:	00b547b3          	xor	a5,a0,a1
    1c78:	8b9d                	andi	a5,a5,7
    1c7a:	1a079863          	bnez	a5,1e2a <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1c7e:	0075f793          	andi	a5,a1,7
    1c82:	16078463          	beqz	a5,1dea <stpncpy+0x176>
    1c86:	ea01                	bnez	a2,1c96 <stpncpy+0x22>
    1c88:	a421                	j	1e90 <stpncpy+0x21c>
    1c8a:	167d                	addi	a2,a2,-1
    1c8c:	0505                	addi	a0,a0,1
    1c8e:	14070e63          	beqz	a4,1dea <stpncpy+0x176>
    1c92:	1a060863          	beqz	a2,1e42 <stpncpy+0x1ce>
    1c96:	0005c783          	lbu	a5,0(a1)
    1c9a:	0585                	addi	a1,a1,1
    1c9c:	0075f713          	andi	a4,a1,7
    1ca0:	00f50023          	sb	a5,0(a0)
    1ca4:	f3fd                	bnez	a5,1c8a <stpncpy+0x16>
    1ca6:	4805                	li	a6,1
    1ca8:	1a061863          	bnez	a2,1e58 <stpncpy+0x1e4>
    1cac:	40a007b3          	neg	a5,a0
    1cb0:	8b9d                	andi	a5,a5,7
    1cb2:	4681                	li	a3,0
    1cb4:	18061a63          	bnez	a2,1e48 <stpncpy+0x1d4>
    1cb8:	00778713          	addi	a4,a5,7
    1cbc:	45ad                	li	a1,11
    1cbe:	18b76363          	bltu	a4,a1,1e44 <stpncpy+0x1d0>
    1cc2:	1ae6eb63          	bltu	a3,a4,1e78 <stpncpy+0x204>
    1cc6:	1a078363          	beqz	a5,1e6c <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cca:	00050023          	sb	zero,0(a0)
    1cce:	4685                	li	a3,1
    1cd0:	00150713          	addi	a4,a0,1
    1cd4:	18d78f63          	beq	a5,a3,1e72 <stpncpy+0x1fe>
    1cd8:	000500a3          	sb	zero,1(a0)
    1cdc:	4689                	li	a3,2
    1cde:	00250713          	addi	a4,a0,2
    1ce2:	18d78e63          	beq	a5,a3,1e7e <stpncpy+0x20a>
    1ce6:	00050123          	sb	zero,2(a0)
    1cea:	468d                	li	a3,3
    1cec:	00350713          	addi	a4,a0,3
    1cf0:	16d78c63          	beq	a5,a3,1e68 <stpncpy+0x1f4>
    1cf4:	000501a3          	sb	zero,3(a0)
    1cf8:	4691                	li	a3,4
    1cfa:	00450713          	addi	a4,a0,4
    1cfe:	18d78263          	beq	a5,a3,1e82 <stpncpy+0x20e>
    1d02:	00050223          	sb	zero,4(a0)
    1d06:	4695                	li	a3,5
    1d08:	00550713          	addi	a4,a0,5
    1d0c:	16d78d63          	beq	a5,a3,1e86 <stpncpy+0x212>
    1d10:	000502a3          	sb	zero,5(a0)
    1d14:	469d                	li	a3,7
    1d16:	00650713          	addi	a4,a0,6
    1d1a:	16d79863          	bne	a5,a3,1e8a <stpncpy+0x216>
    1d1e:	00750713          	addi	a4,a0,7
    1d22:	00050323          	sb	zero,6(a0)
    1d26:	40f80833          	sub	a6,a6,a5
    1d2a:	ff887593          	andi	a1,a6,-8
    1d2e:	97aa                	add	a5,a5,a0
    1d30:	95be                	add	a1,a1,a5
    1d32:	0007b023          	sd	zero,0(a5)
    1d36:	07a1                	addi	a5,a5,8
    1d38:	feb79de3          	bne	a5,a1,1d32 <stpncpy+0xbe>
    1d3c:	ff887593          	andi	a1,a6,-8
    1d40:	9ead                	addw	a3,a3,a1
    1d42:	00b707b3          	add	a5,a4,a1
    1d46:	12b80863          	beq	a6,a1,1e76 <stpncpy+0x202>
    1d4a:	00078023          	sb	zero,0(a5)
    1d4e:	0016871b          	addiw	a4,a3,1
    1d52:	0ec77863          	bgeu	a4,a2,1e42 <stpncpy+0x1ce>
    1d56:	000780a3          	sb	zero,1(a5)
    1d5a:	0026871b          	addiw	a4,a3,2
    1d5e:	0ec77263          	bgeu	a4,a2,1e42 <stpncpy+0x1ce>
    1d62:	00078123          	sb	zero,2(a5)
    1d66:	0036871b          	addiw	a4,a3,3
    1d6a:	0cc77c63          	bgeu	a4,a2,1e42 <stpncpy+0x1ce>
    1d6e:	000781a3          	sb	zero,3(a5)
    1d72:	0046871b          	addiw	a4,a3,4
    1d76:	0cc77663          	bgeu	a4,a2,1e42 <stpncpy+0x1ce>
    1d7a:	00078223          	sb	zero,4(a5)
    1d7e:	0056871b          	addiw	a4,a3,5
    1d82:	0cc77063          	bgeu	a4,a2,1e42 <stpncpy+0x1ce>
    1d86:	000782a3          	sb	zero,5(a5)
    1d8a:	0066871b          	addiw	a4,a3,6
    1d8e:	0ac77a63          	bgeu	a4,a2,1e42 <stpncpy+0x1ce>
    1d92:	00078323          	sb	zero,6(a5)
    1d96:	0076871b          	addiw	a4,a3,7
    1d9a:	0ac77463          	bgeu	a4,a2,1e42 <stpncpy+0x1ce>
    1d9e:	000783a3          	sb	zero,7(a5)
    1da2:	0086871b          	addiw	a4,a3,8
    1da6:	08c77e63          	bgeu	a4,a2,1e42 <stpncpy+0x1ce>
    1daa:	00078423          	sb	zero,8(a5)
    1dae:	0096871b          	addiw	a4,a3,9
    1db2:	08c77863          	bgeu	a4,a2,1e42 <stpncpy+0x1ce>
    1db6:	000784a3          	sb	zero,9(a5)
    1dba:	00a6871b          	addiw	a4,a3,10
    1dbe:	08c77263          	bgeu	a4,a2,1e42 <stpncpy+0x1ce>
    1dc2:	00078523          	sb	zero,10(a5)
    1dc6:	00b6871b          	addiw	a4,a3,11
    1dca:	06c77c63          	bgeu	a4,a2,1e42 <stpncpy+0x1ce>
    1dce:	000785a3          	sb	zero,11(a5)
    1dd2:	00c6871b          	addiw	a4,a3,12
    1dd6:	06c77663          	bgeu	a4,a2,1e42 <stpncpy+0x1ce>
    1dda:	00078623          	sb	zero,12(a5)
    1dde:	26b5                	addiw	a3,a3,13
    1de0:	06c6f163          	bgeu	a3,a2,1e42 <stpncpy+0x1ce>
    1de4:	000786a3          	sb	zero,13(a5)
    1de8:	8082                	ret
            ;
        if (!n || !*s)
    1dea:	c645                	beqz	a2,1e92 <stpncpy+0x21e>
    1dec:	0005c783          	lbu	a5,0(a1)
    1df0:	ea078be3          	beqz	a5,1ca6 <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1df4:	479d                	li	a5,7
    1df6:	02c7ff63          	bgeu	a5,a2,1e34 <stpncpy+0x1c0>
    1dfa:	00000897          	auipc	a7,0x0
    1dfe:	2f68b883          	ld	a7,758(a7) # 20f0 <LF+0x5>
    1e02:	00000817          	auipc	a6,0x0
    1e06:	2f683803          	ld	a6,758(a6) # 20f8 <LF+0xd>
    1e0a:	431d                	li	t1,7
    1e0c:	6198                	ld	a4,0(a1)
    1e0e:	011707b3          	add	a5,a4,a7
    1e12:	fff74693          	not	a3,a4
    1e16:	8ff5                	and	a5,a5,a3
    1e18:	0107f7b3          	and	a5,a5,a6
    1e1c:	ef81                	bnez	a5,1e34 <stpncpy+0x1c0>
            *wd = *ws;
    1e1e:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1e20:	1661                	addi	a2,a2,-8
    1e22:	05a1                	addi	a1,a1,8
    1e24:	0521                	addi	a0,a0,8
    1e26:	fec363e3          	bltu	t1,a2,1e0c <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1e2a:	e609                	bnez	a2,1e34 <stpncpy+0x1c0>
    1e2c:	a08d                	j	1e8e <stpncpy+0x21a>
    1e2e:	167d                	addi	a2,a2,-1
    1e30:	0505                	addi	a0,a0,1
    1e32:	ca01                	beqz	a2,1e42 <stpncpy+0x1ce>
    1e34:	0005c783          	lbu	a5,0(a1)
    1e38:	0585                	addi	a1,a1,1
    1e3a:	00f50023          	sb	a5,0(a0)
    1e3e:	fbe5                	bnez	a5,1e2e <stpncpy+0x1ba>
        ;
tail:
    1e40:	b59d                	j	1ca6 <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1e42:	8082                	ret
    1e44:	472d                	li	a4,11
    1e46:	bdb5                	j	1cc2 <stpncpy+0x4e>
    1e48:	00778713          	addi	a4,a5,7
    1e4c:	45ad                	li	a1,11
    1e4e:	fff60693          	addi	a3,a2,-1
    1e52:	e6b778e3          	bgeu	a4,a1,1cc2 <stpncpy+0x4e>
    1e56:	b7fd                	j	1e44 <stpncpy+0x1d0>
    1e58:	40a007b3          	neg	a5,a0
    1e5c:	8832                	mv	a6,a2
    1e5e:	8b9d                	andi	a5,a5,7
    1e60:	4681                	li	a3,0
    1e62:	e4060be3          	beqz	a2,1cb8 <stpncpy+0x44>
    1e66:	b7cd                	j	1e48 <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1e68:	468d                	li	a3,3
    1e6a:	bd75                	j	1d26 <stpncpy+0xb2>
    1e6c:	872a                	mv	a4,a0
    1e6e:	4681                	li	a3,0
    1e70:	bd5d                	j	1d26 <stpncpy+0xb2>
    1e72:	4685                	li	a3,1
    1e74:	bd4d                	j	1d26 <stpncpy+0xb2>
    1e76:	8082                	ret
    1e78:	87aa                	mv	a5,a0
    1e7a:	4681                	li	a3,0
    1e7c:	b5f9                	j	1d4a <stpncpy+0xd6>
    1e7e:	4689                	li	a3,2
    1e80:	b55d                	j	1d26 <stpncpy+0xb2>
    1e82:	4691                	li	a3,4
    1e84:	b54d                	j	1d26 <stpncpy+0xb2>
    1e86:	4695                	li	a3,5
    1e88:	bd79                	j	1d26 <stpncpy+0xb2>
    1e8a:	4699                	li	a3,6
    1e8c:	bd69                	j	1d26 <stpncpy+0xb2>
    1e8e:	8082                	ret
    1e90:	8082                	ret
    1e92:	8082                	ret

0000000000001e94 <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1e94:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1e98:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e9a:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1e9e:	2501                	sext.w	a0,a0
    1ea0:	8082                	ret

0000000000001ea2 <close>:
    register long a7 __asm__("a7") = n;
    1ea2:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1ea6:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1eaa:	2501                	sext.w	a0,a0
    1eac:	8082                	ret

0000000000001eae <read>:
    register long a7 __asm__("a7") = n;
    1eae:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eb2:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1eb6:	8082                	ret

0000000000001eb8 <write>:
    register long a7 __asm__("a7") = n;
    1eb8:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ebc:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1ec0:	8082                	ret

0000000000001ec2 <getpid>:
    register long a7 __asm__("a7") = n;
    1ec2:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1ec6:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1eca:	2501                	sext.w	a0,a0
    1ecc:	8082                	ret

0000000000001ece <sched_yield>:
    register long a7 __asm__("a7") = n;
    1ece:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1ed2:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1ed6:	2501                	sext.w	a0,a0
    1ed8:	8082                	ret

0000000000001eda <fork>:
    register long a7 __asm__("a7") = n;
    1eda:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1ede:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1ee2:	2501                	sext.w	a0,a0
    1ee4:	8082                	ret

0000000000001ee6 <exit>:
    register long a7 __asm__("a7") = n;
    1ee6:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1eea:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1eee:	8082                	ret

0000000000001ef0 <waitpid>:
    register long a7 __asm__("a7") = n;
    1ef0:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef4:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1ef8:	2501                	sext.w	a0,a0
    1efa:	8082                	ret

0000000000001efc <exec>:
    register long a7 __asm__("a7") = n;
    1efc:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1f00:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1f04:	2501                	sext.w	a0,a0
    1f06:	8082                	ret

0000000000001f08 <get_time>:

int64 get_time()
{
    1f08:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1f0a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1f0e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1f10:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f12:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1f16:	2501                	sext.w	a0,a0
    1f18:	ed09                	bnez	a0,1f32 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1f1a:	67a2                	ld	a5,8(sp)
    1f1c:	3e800713          	li	a4,1000
    1f20:	00015503          	lhu	a0,0(sp)
    1f24:	02e7d7b3          	divu	a5,a5,a4
    1f28:	02e50533          	mul	a0,a0,a4
    1f2c:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1f2e:	0141                	addi	sp,sp,16
    1f30:	8082                	ret
        return -1;
    1f32:	557d                	li	a0,-1
    1f34:	bfed                	j	1f2e <get_time+0x26>

0000000000001f36 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1f36:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f3a:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1f3e:	2501                	sext.w	a0,a0
    1f40:	8082                	ret

0000000000001f42 <sleep>:

int sleep(unsigned long long time)
{
    1f42:	1141                	addi	sp,sp,-16
    1f44:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1f46:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1f4a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1f4c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f4e:	00000073          	ecall
    if (err == 0)
    1f52:	2501                	sext.w	a0,a0
    1f54:	e13d                	bnez	a0,1fba <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1f56:	6722                	ld	a4,8(sp)
    1f58:	3e800693          	li	a3,1000
    1f5c:	00015783          	lhu	a5,0(sp)
    1f60:	02d75733          	divu	a4,a4,a3
    1f64:	02d787b3          	mul	a5,a5,a3
    1f68:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1f6a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1f6e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1f70:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f72:	00000073          	ecall
    if (err == 0)
    1f76:	2501                	sext.w	a0,a0
    1f78:	ed15                	bnez	a0,1fb4 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1f7a:	6841                	lui	a6,0x10
    1f7c:	963e                	add	a2,a2,a5
    1f7e:	187d                	addi	a6,a6,-1
    1f80:	3e800693          	li	a3,1000
    1f84:	a819                	j	1f9a <sleep+0x58>
    __asm_syscall("r"(a7))
    1f86:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1f8a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1f8e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1f90:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f92:	00000073          	ecall
    if (err == 0)
    1f96:	2501                	sext.w	a0,a0
    1f98:	ed11                	bnez	a0,1fb4 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1f9a:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1f9c:	07c00893          	li	a7,124
    1fa0:	02d7d733          	divu	a4,a5,a3
    1fa4:	6782                	ld	a5,0(sp)
    1fa6:	0107f7b3          	and	a5,a5,a6
    1faa:	02d787b3          	mul	a5,a5,a3
    1fae:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1fb0:	fcc7ebe3          	bltu	a5,a2,1f86 <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1fb4:	4501                	li	a0,0
    1fb6:	0141                	addi	sp,sp,16
    1fb8:	8082                	ret
    1fba:	57fd                	li	a5,-1
    1fbc:	b77d                	j	1f6a <sleep+0x28>

0000000000001fbe <set_priority>:
    register long a7 __asm__("a7") = n;
    1fbe:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1fc2:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1fc6:	2501                	sext.w	a0,a0
    1fc8:	8082                	ret

0000000000001fca <mmap>:
    register long a7 __asm__("a7") = n;
    1fca:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fce:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1fd2:	2501                	sext.w	a0,a0
    1fd4:	8082                	ret

0000000000001fd6 <munmap>:
    register long a7 __asm__("a7") = n;
    1fd6:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fda:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1fde:	2501                	sext.w	a0,a0
    1fe0:	8082                	ret

0000000000001fe2 <wait>:

int wait(int *code)
{
    1fe2:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1fe4:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1fe8:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fea:	00000073          	ecall
    return waitpid(-1, code);
}
    1fee:	2501                	sext.w	a0,a0
    1ff0:	8082                	ret

0000000000001ff2 <spawn>:
    register long a7 __asm__("a7") = n;
    1ff2:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1ff6:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1ffa:	2501                	sext.w	a0,a0
    1ffc:	8082                	ret

0000000000001ffe <mailread>:
    register long a7 __asm__("a7") = n;
    1ffe:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2002:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    2006:	2501                	sext.w	a0,a0
    2008:	8082                	ret

000000000000200a <mailwrite>:
    register long a7 __asm__("a7") = n;
    200a:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    200e:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    2012:	2501                	sext.w	a0,a0
    2014:	8082                	ret

0000000000002016 <fstat>:
    register long a7 __asm__("a7") = n;
    2016:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    201a:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    201e:	2501                	sext.w	a0,a0
    2020:	8082                	ret

0000000000002022 <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    2022:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    2024:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    2028:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    202a:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    202e:	2501                	sext.w	a0,a0
    2030:	8082                	ret

0000000000002032 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    2032:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    2034:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    2038:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    203a:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    203e:	2501                	sext.w	a0,a0
    2040:	8082                	ret

0000000000002042 <link>:

int link(char *old_path, char *new_path)
{
    2042:	87aa                	mv	a5,a0
    2044:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    2046:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    204a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    204e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    2050:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    2054:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    2056:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    205a:	2501                	sext.w	a0,a0
    205c:	8082                	ret

000000000000205e <unlink>:

int unlink(char *path)
{
    205e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    2060:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    2064:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    2068:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    206a:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    206e:	2501                	sext.w	a0,a0
    2070:	8082                	ret
