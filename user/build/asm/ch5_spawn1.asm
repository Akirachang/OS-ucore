
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch5_spawn1:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0da0006f          	j	10dc <__start_main>

0000000000001006 <main>:
/// new child i
/// Test wait OK!
/// Test waitpid OK!

int main()
{
    1006:	7179                	addi	sp,sp,-48
    int cpid = spawn("ch5_exit0\0");
    1008:	00001517          	auipc	a0,0x1
    100c:	05050513          	addi	a0,a0,80 # 2058 <unlink+0x70>
{
    1010:	f022                	sd	s0,32(sp)
    1012:	f406                	sd	ra,40(sp)
    1014:	ec26                	sd	s1,24(sp)
    int cpid = spawn("ch5_exit0\0");
    1016:	767000ef          	jal	ra,1f7c <spawn>
    101a:	842a                	mv	s0,a0
    assert(cpid >= 0); // "child pid invalid"
    101c:	0a054c63          	bltz	a0,10d4 <main+0xce>
    printf("new child %d\n", cpid);
    1020:	00001517          	auipc	a0,0x1
    1024:	fe050513          	addi	a0,a0,-32 # 2000 <unlink+0x18>
    1028:	85a2                	mv	a1,s0
    102a:	144000ef          	jal	ra,116e <printf>
    int exit_code = 0;
    int exit_pid = wait(&exit_code);
    102e:	0068                	addi	a0,sp,12
    int exit_code = 0;
    1030:	c602                	sw	zero,12(sp)
    int exit_pid = wait(&exit_code);
    1032:	73b000ef          	jal	ra,1f6c <wait>
    assert(exit_pid == cpid);   // "error exit pid"
    1036:	00a40563          	beq	s0,a0,1040 <main+0x3a>
    103a:	557d                	li	a0,-1
    103c:	635000ef          	jal	ra,1e70 <exit>
    assert(exit_code == 66778); // "error exit code"
    1040:	4732                	lw	a4,12(sp)
    1042:	67c1                	lui	a5,0x10
    1044:	4da78793          	addi	a5,a5,1242 # 104da <digits+0xe462>
    1048:	00f70563          	beq	a4,a5,1052 <main+0x4c>
    104c:	557d                	li	a0,-1
    104e:	623000ef          	jal	ra,1e70 <exit>
    puts("Test wait OK!\n");
    1052:	00001517          	auipc	a0,0x1
    1056:	fbe50513          	addi	a0,a0,-66 # 2010 <unlink+0x28>
    105a:	0d2000ef          	jal	ra,112c <puts>
    int cpid0 = spawn("ch5_exit0\0");
    105e:	00001517          	auipc	a0,0x1
    1062:	ffa50513          	addi	a0,a0,-6 # 2058 <unlink+0x70>
    1066:	717000ef          	jal	ra,1f7c <spawn>
    106a:	842a                	mv	s0,a0
    int cpid1 = spawn("ch5_exit1\0");
    106c:	00001517          	auipc	a0,0x1
    1070:	ffc50513          	addi	a0,a0,-4 # 2068 <unlink+0x80>
    1074:	709000ef          	jal	ra,1f7c <spawn>
    exit_pid = waitpid(cpid1, &exit_code);
    1078:	006c                	addi	a1,sp,12
    int cpid1 = spawn("ch5_exit1\0");
    107a:	84aa                	mv	s1,a0
    exit_pid = waitpid(cpid1, &exit_code);
    107c:	5ff000ef          	jal	ra,1e7a <waitpid>
    assert(exit_pid == cpid1); // "error exit pid"
    1080:	00a48563          	beq	s1,a0,108a <main+0x84>
    1084:	557d                	li	a0,-1
    1086:	5eb000ef          	jal	ra,1e70 <exit>
    assert(exit_code == -233); // "error exit code"
    108a:	4732                	lw	a4,12(sp)
    108c:	f1700793          	li	a5,-233
    1090:	00f70563          	beq	a4,a5,109a <main+0x94>
    1094:	557d                	li	a0,-1
    1096:	5db000ef          	jal	ra,1e70 <exit>
    exit_pid = wait(&exit_code);
    109a:	0068                	addi	a0,sp,12
    109c:	6d1000ef          	jal	ra,1f6c <wait>
    assert(exit_pid == cpid0);  // "error exit pid"
    10a0:	00a40563          	beq	s0,a0,10aa <main+0xa4>
    10a4:	557d                	li	a0,-1
    10a6:	5cb000ef          	jal	ra,1e70 <exit>
    assert(exit_code == 66778); // "error exit code"
    10aa:	4732                	lw	a4,12(sp)
    10ac:	67c1                	lui	a5,0x10
    10ae:	4da78793          	addi	a5,a5,1242 # 104da <digits+0xe462>
    10b2:	00f70563          	beq	a4,a5,10bc <main+0xb6>
    10b6:	557d                	li	a0,-1
    10b8:	5b9000ef          	jal	ra,1e70 <exit>
    puts("Test waitpid OK!");
    10bc:	00001517          	auipc	a0,0x1
    10c0:	f6450513          	addi	a0,a0,-156 # 2020 <unlink+0x38>
    10c4:	068000ef          	jal	ra,112c <puts>
    return 0;
    10c8:	70a2                	ld	ra,40(sp)
    10ca:	7402                	ld	s0,32(sp)
    10cc:	64e2                	ld	s1,24(sp)
    10ce:	4501                	li	a0,0
    10d0:	6145                	addi	sp,sp,48
    10d2:	8082                	ret
    assert(cpid >= 0); // "child pid invalid"
    10d4:	557d                	li	a0,-1
    10d6:	59b000ef          	jal	ra,1e70 <exit>
    10da:	b799                	j	1020 <main+0x1a>

00000000000010dc <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10dc:	1141                	addi	sp,sp,-16
    10de:	e406                	sd	ra,8(sp)
    exit(main());
    10e0:	f27ff0ef          	jal	ra,1006 <main>
    10e4:	58d000ef          	jal	ra,1e70 <exit>
    return 0;
}
    10e8:	60a2                	ld	ra,8(sp)
    10ea:	4501                	li	a0,0
    10ec:	0141                	addi	sp,sp,16
    10ee:	8082                	ret

00000000000010f0 <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    10f0:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    10f2:	00f10593          	addi	a1,sp,15
    10f6:	4605                	li	a2,1
    10f8:	4501                	li	a0,0
{
    10fa:	ec06                	sd	ra,24(sp)
    char byte = 0;
    10fc:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1100:	539000ef          	jal	ra,1e38 <read>
    return byte;
}
    1104:	60e2                	ld	ra,24(sp)
    1106:	00f14503          	lbu	a0,15(sp)
    110a:	6105                	addi	sp,sp,32
    110c:	8082                	ret

000000000000110e <putchar>:

int putchar(int c)
{
    110e:	1101                	addi	sp,sp,-32
    1110:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    1112:	00f10593          	addi	a1,sp,15
    1116:	4605                	li	a2,1
    1118:	4505                	li	a0,1
{
    111a:	ec06                	sd	ra,24(sp)
    char byte = c;
    111c:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1120:	523000ef          	jal	ra,1e42 <write>
}
    1124:	60e2                	ld	ra,24(sp)
    1126:	2501                	sext.w	a0,a0
    1128:	6105                	addi	sp,sp,32
    112a:	8082                	ret

000000000000112c <puts>:

int puts(const char *s)
{
    112c:	1101                	addi	sp,sp,-32
    112e:	e822                	sd	s0,16(sp)
    1130:	ec06                	sd	ra,24(sp)
    1132:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    1134:	145000ef          	jal	ra,1a78 <strlen>
    1138:	862a                	mv	a2,a0
    113a:	85a2                	mv	a1,s0
    113c:	4505                	li	a0,1
    113e:	505000ef          	jal	ra,1e42 <write>
    1142:	00055763          	bgez	a0,1150 <puts+0x24>
    return r;
}
    1146:	60e2                	ld	ra,24(sp)
    1148:	6442                	ld	s0,16(sp)
    114a:	557d                	li	a0,-1
    114c:	6105                	addi	sp,sp,32
    114e:	8082                	ret
    return write(stdout, &byte, 1);
    1150:	00f10593          	addi	a1,sp,15
    char byte = c;
    1154:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    1156:	4605                	li	a2,1
    1158:	4505                	li	a0,1
    char byte = c;
    115a:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    115e:	4e5000ef          	jal	ra,1e42 <write>
}
    1162:	60e2                	ld	ra,24(sp)
    1164:	6442                	ld	s0,16(sp)
    1166:	41f5551b          	sraiw	a0,a0,0x1f
    116a:	6105                	addi	sp,sp,32
    116c:	8082                	ret

000000000000116e <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    116e:	7131                	addi	sp,sp,-192
    1170:	ecce                	sd	s3,88(sp)
    1172:	e8d2                	sd	s4,80(sp)
    1174:	e4d6                	sd	s5,72(sp)
    1176:	e0da                	sd	s6,64(sp)
    1178:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    117a:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    117c:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    117e:	6ae1                	lui	s5,0x18
    1180:	000f4a37          	lui	s4,0xf4
    1184:	00989b37          	lui	s6,0x989
{
    1188:	fc86                	sd	ra,120(sp)
    118a:	f8a2                	sd	s0,112(sp)
    118c:	f4a6                	sd	s1,104(sp)
    118e:	f0ca                	sd	s2,96(sp)
    1190:	fc5e                	sd	s7,56(sp)
    1192:	e52e                	sd	a1,136(sp)
    1194:	e932                	sd	a2,144(sp)
    1196:	ed36                	sd	a3,152(sp)
    1198:	f13a                	sd	a4,160(sp)
    119a:	f942                	sd	a6,176(sp)
    119c:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    119e:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    11a0:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x697>
    11a4:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x16627>
    11a8:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf21c7>
    11ac:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x987607>
    for (;;)
    {
        if (!*s)
    11b0:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    11b4:	02500913          	li	s2,37
        if (!*s)
    11b8:	1a078f63          	beqz	a5,1376 <printf+0x208>
    11bc:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    11be:	17278e63          	beq	a5,s2,133a <printf+0x1cc>
    11c2:	00164783          	lbu	a5,1(a2)
    11c6:	0605                	addi	a2,a2,1
    11c8:	fbfd                	bnez	a5,11be <printf+0x50>
    11ca:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    11cc:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    11d0:	85aa                	mv	a1,a0
    11d2:	8622                	mv	a2,s0
    11d4:	4505                	li	a0,1
    11d6:	46d000ef          	jal	ra,1e42 <write>
        out(f, a, l);
        if (l)
    11da:	18041963          	bnez	s0,136c <printf+0x1fe>
            continue;
        if (s[1] == 0)
    11de:	0014c783          	lbu	a5,1(s1)
    11e2:	18078a63          	beqz	a5,1376 <printf+0x208>
            break;
        switch (s[1])
    11e6:	07300713          	li	a4,115
    11ea:	28e78e63          	beq	a5,a4,1486 <printf+0x318>
    11ee:	18f76f63          	bltu	a4,a5,138c <printf+0x21e>
    11f2:	06400713          	li	a4,100
    11f6:	2ae78c63          	beq	a5,a4,14ae <printf+0x340>
    11fa:	07000713          	li	a4,112
    11fe:	3ce79c63          	bne	a5,a4,15d6 <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1202:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1204:	00001797          	auipc	a5,0x1
    1208:	e7478793          	addi	a5,a5,-396 # 2078 <digits>
            printptr(va_arg(ap, uint64));
    120c:	6298                	ld	a4,0(a3)
    120e:	00868093          	addi	ra,a3,8
    1212:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1214:	00471293          	slli	t0,a4,0x4
    1218:	00c71f13          	slli	t5,a4,0xc
    121c:	01471e13          	slli	t3,a4,0x14
    1220:	01c71893          	slli	a7,a4,0x1c
    1224:	02471813          	slli	a6,a4,0x24
    1228:	02871513          	slli	a0,a4,0x28
    122c:	02c71593          	slli	a1,a4,0x2c
    1230:	03071693          	slli	a3,a4,0x30
    1234:	00871f93          	slli	t6,a4,0x8
    1238:	01071e93          	slli	t4,a4,0x10
    123c:	01871313          	slli	t1,a4,0x18
    1240:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1244:	03c2d293          	srli	t0,t0,0x3c
    1248:	03cf5f13          	srli	t5,t5,0x3c
    124c:	03ce5e13          	srli	t3,t3,0x3c
    1250:	03c8d893          	srli	a7,a7,0x3c
    1254:	03c85813          	srli	a6,a6,0x3c
    1258:	9171                	srli	a0,a0,0x3c
    125a:	91f1                	srli	a1,a1,0x3c
    125c:	92f1                	srli	a3,a3,0x3c
    125e:	92be                	add	t0,t0,a5
    1260:	9f3e                	add	t5,t5,a5
    1262:	9e3e                	add	t3,t3,a5
    1264:	98be                	add	a7,a7,a5
    1266:	983e                	add	a6,a6,a5
    1268:	953e                	add	a0,a0,a5
    126a:	95be                	add	a1,a1,a5
    126c:	96be                	add	a3,a3,a5
    126e:	03c75393          	srli	t2,a4,0x3c
    1272:	01c75b9b          	srliw	s7,a4,0x1c
    1276:	03cfdf93          	srli	t6,t6,0x3c
    127a:	03cede93          	srli	t4,t4,0x3c
    127e:	03c35313          	srli	t1,t1,0x3c
    1282:	9271                	srli	a2,a2,0x3c
    1284:	0002c403          	lbu	s0,0(t0)
    1288:	93be                	add	t2,t2,a5
    128a:	000f4283          	lbu	t0,0(t5)
    128e:	9fbe                	add	t6,t6,a5
    1290:	000e4f03          	lbu	t5,0(t3)
    1294:	9ebe                	add	t4,t4,a5
    1296:	0008ce03          	lbu	t3,0(a7)
    129a:	933e                	add	t1,t1,a5
    129c:	00084883          	lbu	a7,0(a6)
    12a0:	9bbe                	add	s7,s7,a5
    12a2:	00054803          	lbu	a6,0(a0)
    12a6:	963e                	add	a2,a2,a5
    12a8:	0005c503          	lbu	a0,0(a1)
    12ac:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    12b0:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12b4:	0003c903          	lbu	s2,0(t2)
    12b8:	00064603          	lbu	a2,0(a2)
    12bc:	000fc383          	lbu	t2,0(t6)
    12c0:	8b3d                	andi	a4,a4,15
    12c2:	000ecf83          	lbu	t6,0(t4)
    12c6:	92f1                	srli	a3,a3,0x3c
    12c8:	00034e83          	lbu	t4,0(t1)
    12cc:	000bc303          	lbu	t1,0(s7)
    12d0:	96be                	add	a3,a3,a5
    12d2:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    12d4:	7761                	lui	a4,0xffff8
    12d6:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12da:	00710623          	sb	t2,12(sp)
    12de:	005106a3          	sb	t0,13(sp)
    12e2:	01f10723          	sb	t6,14(sp)
    12e6:	01e107a3          	sb	t5,15(sp)
    12ea:	01d10823          	sb	t4,16(sp)
    12ee:	01c108a3          	sb	t3,17(sp)
    12f2:	00610923          	sb	t1,18(sp)
    12f6:	011109a3          	sb	a7,19(sp)
    12fa:	01010a23          	sb	a6,20(sp)
    12fe:	00a10aa3          	sb	a0,21(sp)
    1302:	00b10b23          	sb	a1,22(sp)
    1306:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    130a:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    130e:	01210523          	sb	s2,10(sp)
    1312:	008105a3          	sb	s0,11(sp)
    1316:	0006c703          	lbu	a4,0(a3)
    131a:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    131e:	4649                	li	a2,18
    1320:	002c                	addi	a1,sp,8
    1322:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1324:	00e10c23          	sb	a4,24(sp)
    1328:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    132c:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1330:	313000ef          	jal	ra,1e42 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1334:	00248513          	addi	a0,s1,2
    1338:	bda5                	j	11b0 <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    133a:	00064783          	lbu	a5,0(a2)
    133e:	84b2                	mv	s1,a2
    1340:	01278963          	beq	a5,s2,1352 <printf+0x1e4>
    1344:	b561                	j	11cc <printf+0x5e>
    1346:	0024c783          	lbu	a5,2(s1)
    134a:	0605                	addi	a2,a2,1
    134c:	0489                	addi	s1,s1,2
    134e:	e7279fe3          	bne	a5,s2,11cc <printf+0x5e>
    1352:	0014c783          	lbu	a5,1(s1)
    1356:	ff2788e3          	beq	a5,s2,1346 <printf+0x1d8>
        l = z - a;
    135a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    135e:	85aa                	mv	a1,a0
    1360:	8622                	mv	a2,s0
    1362:	4505                	li	a0,1
    1364:	2df000ef          	jal	ra,1e42 <write>
        if (l)
    1368:	e6040be3          	beqz	s0,11de <printf+0x70>
    136c:	8526                	mv	a0,s1
        if (!*s)
    136e:	00054783          	lbu	a5,0(a0)
    1372:	e40795e3          	bnez	a5,11bc <printf+0x4e>
    }
    va_end(ap);
    1376:	70e6                	ld	ra,120(sp)
    1378:	7446                	ld	s0,112(sp)
    137a:	74a6                	ld	s1,104(sp)
    137c:	7906                	ld	s2,96(sp)
    137e:	69e6                	ld	s3,88(sp)
    1380:	6a46                	ld	s4,80(sp)
    1382:	6aa6                	ld	s5,72(sp)
    1384:	6b06                	ld	s6,64(sp)
    1386:	7be2                	ld	s7,56(sp)
    1388:	6129                	addi	sp,sp,192
    138a:	8082                	ret
        switch (s[1])
    138c:	07800713          	li	a4,120
    1390:	24e79363          	bne	a5,a4,15d6 <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    1394:	6782                	ld	a5,0(sp)
    1396:	4394                	lw	a3,0(a5)
    1398:	07a1                	addi	a5,a5,8
    139a:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    139c:	2606c263          	bltz	a3,1600 <printf+0x492>
        buf[i--] = digits[x % base];
    13a0:	00001797          	auipc	a5,0x1
    13a4:	cd878793          	addi	a5,a5,-808 # 2078 <digits>
    13a8:	00f6f713          	andi	a4,a3,15
    13ac:	973e                	add	a4,a4,a5
    13ae:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff5f88>
    buf[16] = 0;
    13b2:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    13b6:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    13b8:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    13bc:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    13c0:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    13c4:	0046d51b          	srliw	a0,a3,0x4
    13c8:	0ad5d563          	bge	a1,a3,1472 <printf+0x304>
        buf[i--] = digits[x % base];
    13cc:	8a3d                	andi	a2,a2,15
    13ce:	963e                	add	a2,a2,a5
    13d0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    13d4:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    13d8:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    13dc:	30a5fe63          	bgeu	a1,a0,16f8 <printf+0x58a>
        buf[i--] = digits[x % base];
    13e0:	00f77613          	andi	a2,a4,15
    13e4:	963e                	add	a2,a2,a5
    13e6:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13ea:	45bd                	li	a1,15
    13ec:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    13f0:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    13f4:	00475513          	srli	a0,a4,0x4
    13f8:	30e5f963          	bgeu	a1,a4,170a <printf+0x59c>
        buf[i--] = digits[x % base];
    13fc:	8a3d                	andi	a2,a2,15
    13fe:	963e                	add	a2,a2,a5
    1400:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    1404:	00875893          	srli	a7,a4,0x8
    1408:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    140c:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    1410:	30a5fd63          	bgeu	a1,a0,172a <printf+0x5bc>
        buf[i--] = digits[x % base];
    1414:	8a3d                	andi	a2,a2,15
    1416:	963e                	add	a2,a2,a5
    1418:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    141c:	00c75813          	srli	a6,a4,0xc
    1420:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    1424:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    1428:	3315fe63          	bgeu	a1,a7,1764 <printf+0x5f6>
        buf[i--] = digits[x % base];
    142c:	8a3d                	andi	a2,a2,15
    142e:	963e                	add	a2,a2,a5
    1430:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1434:	01075893          	srli	a7,a4,0x10
    1438:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    143c:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    1440:	3305ff63          	bgeu	a1,a6,177e <printf+0x610>
        buf[i--] = digits[x % base];
    1444:	8a3d                	andi	a2,a2,15
    1446:	963e                	add	a2,a2,a5
    1448:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    144c:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    1450:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1454:	3515f863          	bgeu	a1,a7,17a4 <printf+0x636>
        buf[i--] = digits[x % base];
    1458:	97ba                	add	a5,a5,a4
    145a:	0007c783          	lbu	a5,0(a5)
    145e:	45a1                	li	a1,8
    1460:	00f10823          	sb	a5,16(sp)
    if (sign)
    1464:	0006d763          	bgez	a3,1472 <printf+0x304>
        buf[i--] = '-';
    1468:	02d00793          	li	a5,45
    146c:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1470:	459d                	li	a1,7
    write(f, s, l);
    1472:	4641                	li	a2,16
    1474:	003c                	addi	a5,sp,8
    1476:	9e0d                	subw	a2,a2,a1
    1478:	4505                	li	a0,1
    147a:	95be                	add	a1,a1,a5
    147c:	1c7000ef          	jal	ra,1e42 <write>
        s += 2;
    1480:	00248513          	addi	a0,s1,2
    1484:	b335                	j	11b0 <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    1486:	6782                	ld	a5,0(sp)
    1488:	6380                	ld	s0,0(a5)
    148a:	07a1                	addi	a5,a5,8
    148c:	e03e                	sd	a5,0(sp)
    148e:	22040a63          	beqz	s0,16c2 <printf+0x554>
            l = strnlen(a, 200);
    1492:	0c800593          	li	a1,200
    1496:	8522                	mv	a0,s0
    1498:	6cc000ef          	jal	ra,1b64 <strnlen>
    write(f, s, l);
    149c:	0005061b          	sext.w	a2,a0
    14a0:	85a2                	mv	a1,s0
    14a2:	4505                	li	a0,1
    14a4:	19f000ef          	jal	ra,1e42 <write>
        s += 2;
    14a8:	00248513          	addi	a0,s1,2
    14ac:	b311                	j	11b0 <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    14ae:	6782                	ld	a5,0(sp)
    14b0:	4390                	lw	a2,0(a5)
    14b2:	07a1                	addi	a5,a5,8
    14b4:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    14b6:	1a064363          	bltz	a2,165c <printf+0x4ee>
        buf[i--] = digits[x % base];
    14ba:	46a9                	li	a3,10
    14bc:	02d6773b          	remuw	a4,a2,a3
    14c0:	00001797          	auipc	a5,0x1
    14c4:	bb878793          	addi	a5,a5,-1096 # 2078 <digits>
    buf[16] = 0;
    14c8:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    14cc:	4525                	li	a0,9
        x = xx;
    14ce:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    14d2:	973e                	add	a4,a4,a5
    14d4:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    14d8:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    14dc:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    14e0:	2cc55063          	bge	a0,a2,17a0 <printf+0x632>
    14e4:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    14e8:	02d5f73b          	remuw	a4,a1,a3
    14ec:	1702                	slli	a4,a4,0x20
    14ee:	9301                	srli	a4,a4,0x20
    14f0:	973e                	add	a4,a4,a5
    14f2:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    14f6:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    14fa:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    14fe:	1f057d63          	bgeu	a0,a6,16f8 <printf+0x58a>
        buf[i--] = digits[x % base];
    1502:	4529                	li	a0,10
    } while ((x /= base) != 0);
    1504:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1506:	02a5f73b          	remuw	a4,a1,a0
    150a:	973e                	add	a4,a4,a5
    150c:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    1510:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    1514:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    1518:	1ab6f163          	bgeu	a3,a1,16ba <printf+0x54c>
    151c:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    1520:	02a776bb          	remuw	a3,a4,a0
    1524:	96be                	add	a3,a3,a5
    1526:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    152a:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    152e:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1532:	20b87c63          	bgeu	a6,a1,174a <printf+0x5dc>
    1536:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    153a:	02a776bb          	remuw	a3,a4,a0
    153e:	96be                	add	a3,a3,a5
    1540:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1544:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1548:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    154c:	20b87363          	bgeu	a6,a1,1752 <printf+0x5e4>
        buf[i--] = digits[x % base];
    1550:	02a776bb          	remuw	a3,a4,a0
    1554:	96be                	add	a3,a3,a5
    1556:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    155a:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    155e:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1562:	20b9f563          	bgeu	s3,a1,176c <printf+0x5fe>
        buf[i--] = digits[x % base];
    1566:	02a776bb          	remuw	a3,a4,a0
    156a:	96be                	add	a3,a3,a5
    156c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1570:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1574:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1578:	20bafb63          	bgeu	s5,a1,178e <printf+0x620>
        buf[i--] = digits[x % base];
    157c:	02a776bb          	remuw	a3,a4,a0
    1580:	96be                	add	a3,a3,a5
    1582:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1586:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    158a:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    158e:	1eba7c63          	bgeu	s4,a1,1786 <printf+0x618>
        buf[i--] = digits[x % base];
    1592:	02a776bb          	remuw	a3,a4,a0
    1596:	96be                	add	a3,a3,a5
    1598:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    159c:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    15a0:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    15a4:	14bb7163          	bgeu	s6,a1,16e6 <printf+0x578>
        buf[i--] = digits[x % base];
    15a8:	1702                	slli	a4,a4,0x20
    15aa:	9301                	srli	a4,a4,0x20
    15ac:	97ba                	add	a5,a5,a4
    15ae:	0007c783          	lbu	a5,0(a5)
    15b2:	4599                	li	a1,6
    15b4:	00f10723          	sb	a5,14(sp)
    if (sign)
    15b8:	ea065de3          	bgez	a2,1472 <printf+0x304>
        buf[i--] = '-';
    15bc:	02d00793          	li	a5,45
    15c0:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    15c4:	4595                	li	a1,5
    write(f, s, l);
    15c6:	003c                	addi	a5,sp,8
    15c8:	4641                	li	a2,16
    15ca:	9e0d                	subw	a2,a2,a1
    15cc:	4505                	li	a0,1
    15ce:	95be                	add	a1,a1,a5
    15d0:	073000ef          	jal	ra,1e42 <write>
    15d4:	b575                	j	1480 <printf+0x312>
    char byte = c;
    15d6:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    15da:	4605                	li	a2,1
    15dc:	002c                	addi	a1,sp,8
    15de:	4505                	li	a0,1
    char byte = c;
    15e0:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15e4:	05f000ef          	jal	ra,1e42 <write>
    char byte = c;
    15e8:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15ec:	4605                	li	a2,1
    15ee:	002c                	addi	a1,sp,8
    15f0:	4505                	li	a0,1
    char byte = c;
    15f2:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15f6:	04d000ef          	jal	ra,1e42 <write>
        s += 2;
    15fa:	00248513          	addi	a0,s1,2
    15fe:	be4d                	j	11b0 <printf+0x42>
        x = -xx;
    1600:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    1604:	00001797          	auipc	a5,0x1
    1608:	a7478793          	addi	a5,a5,-1420 # 2078 <digits>
    160c:	00f77613          	andi	a2,a4,15
    1610:	963e                	add	a2,a2,a5
    1612:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    1616:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    161a:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    161c:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1620:	0047551b          	srliw	a0,a4,0x4
    1624:	0047561b          	srliw	a2,a4,0x4
    1628:	0ab6d263          	bge	a3,a1,16cc <printf+0x55e>
        buf[i--] = digits[x % base];
    162c:	8a3d                	andi	a2,a2,15
    162e:	963e                	add	a2,a2,a5
    1630:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    1634:	463d                	li	a2,15
    1636:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    163a:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    163e:	daa661e3          	bltu	a2,a0,13e0 <printf+0x272>
        buf[i--] = '-';
    1642:	02d00793          	li	a5,45
    1646:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    164a:	45b5                	li	a1,13
    write(f, s, l);
    164c:	003c                	addi	a5,sp,8
    164e:	4641                	li	a2,16
    1650:	9e0d                	subw	a2,a2,a1
    1652:	4505                	li	a0,1
    1654:	95be                	add	a1,a1,a5
    1656:	7ec000ef          	jal	ra,1e42 <write>
    165a:	b51d                	j	1480 <printf+0x312>
        x = -xx;
    165c:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    1660:	46a9                	li	a3,10
    1662:	02d875bb          	remuw	a1,a6,a3
    1666:	00001797          	auipc	a5,0x1
    166a:	a1278793          	addi	a5,a5,-1518 # 2078 <digits>
    buf[16] = 0;
    166e:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1672:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    1674:	95be                	add	a1,a1,a5
    1676:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    167a:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    167e:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    1682:	04a65563          	bge	a2,a0,16cc <printf+0x55e>
    1686:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    168a:	02d775bb          	remuw	a1,a4,a3
    168e:	95be                	add	a1,a1,a5
    1690:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    1694:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    1698:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    169c:	fb0573e3          	bgeu	a0,a6,1642 <printf+0x4d4>
        buf[i--] = digits[x % base];
    16a0:	4529                	li	a0,10
    } while ((x /= base) != 0);
    16a2:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    16a4:	02a5f73b          	remuw	a4,a1,a0
    16a8:	973e                	add	a4,a4,a5
    16aa:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    16ae:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    16b2:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    16b6:	e6b6e3e3          	bltu	a3,a1,151c <printf+0x3ae>
        buf[i--] = digits[x % base];
    16ba:	45b5                	li	a1,13
    if (sign)
    16bc:	da065be3          	bgez	a2,1472 <printf+0x304>
    16c0:	a881                	j	1710 <printf+0x5a2>
                a = "(null)";
    16c2:	00001417          	auipc	s0,0x1
    16c6:	97640413          	addi	s0,s0,-1674 # 2038 <unlink+0x50>
    16ca:	b3e1                	j	1492 <printf+0x324>
        buf[i--] = '-';
    16cc:	02d00793          	li	a5,45
    16d0:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    16d4:	45b9                	li	a1,14
    write(f, s, l);
    16d6:	003c                	addi	a5,sp,8
    16d8:	4641                	li	a2,16
    16da:	9e0d                	subw	a2,a2,a1
    16dc:	4505                	li	a0,1
    16de:	95be                	add	a1,a1,a5
    16e0:	762000ef          	jal	ra,1e42 <write>
    16e4:	bb71                	j	1480 <printf+0x312>
        buf[i--] = digits[x % base];
    16e6:	459d                	li	a1,7
    if (sign)
    16e8:	d80655e3          	bgez	a2,1472 <printf+0x304>
        buf[i--] = '-';
    16ec:	02d00793          	li	a5,45
    16f0:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    16f4:	4599                	li	a1,6
    16f6:	bbb5                	j	1472 <printf+0x304>
    16f8:	45b9                	li	a1,14
    write(f, s, l);
    16fa:	003c                	addi	a5,sp,8
    16fc:	4641                	li	a2,16
    16fe:	9e0d                	subw	a2,a2,a1
    1700:	4505                	li	a0,1
    1702:	95be                	add	a1,a1,a5
    1704:	73e000ef          	jal	ra,1e42 <write>
    1708:	bba5                	j	1480 <printf+0x312>
        buf[i--] = digits[x % base];
    170a:	45b5                	li	a1,13
    if (sign)
    170c:	d606d3e3          	bgez	a3,1472 <printf+0x304>
        buf[i--] = '-';
    1710:	02d00793          	li	a5,45
    1714:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1718:	45b1                	li	a1,12
    write(f, s, l);
    171a:	003c                	addi	a5,sp,8
    171c:	4641                	li	a2,16
    171e:	9e0d                	subw	a2,a2,a1
    1720:	4505                	li	a0,1
    1722:	95be                	add	a1,a1,a5
    1724:	71e000ef          	jal	ra,1e42 <write>
    1728:	bba1                	j	1480 <printf+0x312>
        buf[i--] = digits[x % base];
    172a:	45b1                	li	a1,12
    if (sign)
    172c:	d406d3e3          	bgez	a3,1472 <printf+0x304>
        buf[i--] = '-';
    1730:	02d00793          	li	a5,45
    1734:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1738:	45ad                	li	a1,11
    write(f, s, l);
    173a:	003c                	addi	a5,sp,8
    173c:	4641                	li	a2,16
    173e:	9e0d                	subw	a2,a2,a1
    1740:	4505                	li	a0,1
    1742:	95be                	add	a1,a1,a5
    1744:	6fe000ef          	jal	ra,1e42 <write>
    1748:	bb25                	j	1480 <printf+0x312>
        buf[i--] = digits[x % base];
    174a:	45b1                	li	a1,12
    if (sign)
    174c:	d20653e3          	bgez	a2,1472 <printf+0x304>
    1750:	b7c5                	j	1730 <printf+0x5c2>
        buf[i--] = digits[x % base];
    1752:	45ad                	li	a1,11
    if (sign)
    1754:	d0065fe3          	bgez	a2,1472 <printf+0x304>
        buf[i--] = '-';
    1758:	02d00793          	li	a5,45
    175c:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1760:	45a9                	li	a1,10
    1762:	bb01                	j	1472 <printf+0x304>
    1764:	45ad                	li	a1,11
    if (sign)
    1766:	d006d6e3          	bgez	a3,1472 <printf+0x304>
    176a:	b7fd                	j	1758 <printf+0x5ea>
        buf[i--] = digits[x % base];
    176c:	45a9                	li	a1,10
    if (sign)
    176e:	d00652e3          	bgez	a2,1472 <printf+0x304>
        buf[i--] = '-';
    1772:	02d00793          	li	a5,45
    1776:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    177a:	45a5                	li	a1,9
    177c:	b9dd                	j	1472 <printf+0x304>
    177e:	45a9                	li	a1,10
    if (sign)
    1780:	ce06d9e3          	bgez	a3,1472 <printf+0x304>
    1784:	b7fd                	j	1772 <printf+0x604>
        buf[i--] = digits[x % base];
    1786:	45a1                	li	a1,8
    if (sign)
    1788:	ce0655e3          	bgez	a2,1472 <printf+0x304>
    178c:	b9f1                	j	1468 <printf+0x2fa>
        buf[i--] = digits[x % base];
    178e:	45a5                	li	a1,9
    if (sign)
    1790:	ce0651e3          	bgez	a2,1472 <printf+0x304>
        buf[i--] = '-';
    1794:	02d00793          	li	a5,45
    1798:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    179c:	45a1                	li	a1,8
    179e:	b9d1                	j	1472 <printf+0x304>
    i = 15;
    17a0:	45bd                	li	a1,15
    17a2:	b9c1                	j	1472 <printf+0x304>
        buf[i--] = digits[x % base];
    17a4:	45a5                	li	a1,9
    if (sign)
    17a6:	cc06d6e3          	bgez	a3,1472 <printf+0x304>
    17aa:	b7ed                	j	1794 <printf+0x626>

00000000000017ac <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    17ac:	02000793          	li	a5,32
    17b0:	00f50663          	beq	a0,a5,17bc <isspace+0x10>
    17b4:	355d                	addiw	a0,a0,-9
    17b6:	00553513          	sltiu	a0,a0,5
    17ba:	8082                	ret
    17bc:	4505                	li	a0,1
}
    17be:	8082                	ret

00000000000017c0 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    17c0:	fd05051b          	addiw	a0,a0,-48
}
    17c4:	00a53513          	sltiu	a0,a0,10
    17c8:	8082                	ret

00000000000017ca <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    17ca:	02000613          	li	a2,32
    17ce:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    17d0:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    17d4:	ff77069b          	addiw	a3,a4,-9
    17d8:	04c70d63          	beq	a4,a2,1832 <atoi+0x68>
    17dc:	0007079b          	sext.w	a5,a4
    17e0:	04d5f963          	bgeu	a1,a3,1832 <atoi+0x68>
        s++;
    switch (*s)
    17e4:	02b00693          	li	a3,43
    17e8:	04d70a63          	beq	a4,a3,183c <atoi+0x72>
    17ec:	02d00693          	li	a3,45
    17f0:	06d70463          	beq	a4,a3,1858 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    17f4:	fd07859b          	addiw	a1,a5,-48
    17f8:	4625                	li	a2,9
    17fa:	873e                	mv	a4,a5
    17fc:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    17fe:	4e01                	li	t3,0
    while (isdigit(*s))
    1800:	04b66a63          	bltu	a2,a1,1854 <atoi+0x8a>
    int n = 0, neg = 0;
    1804:	4501                	li	a0,0
    while (isdigit(*s))
    1806:	4825                	li	a6,9
    1808:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    180c:	0025179b          	slliw	a5,a0,0x2
    1810:	9d3d                	addw	a0,a0,a5
    1812:	fd07031b          	addiw	t1,a4,-48
    1816:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    181a:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    181e:	0685                	addi	a3,a3,1
    1820:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1824:	0006071b          	sext.w	a4,a2
    1828:	feb870e3          	bgeu	a6,a1,1808 <atoi+0x3e>
    return neg ? n : -n;
    182c:	000e0563          	beqz	t3,1836 <atoi+0x6c>
}
    1830:	8082                	ret
        s++;
    1832:	0505                	addi	a0,a0,1
    1834:	bf71                	j	17d0 <atoi+0x6>
    1836:	4113053b          	subw	a0,t1,a7
    183a:	8082                	ret
    while (isdigit(*s))
    183c:	00154783          	lbu	a5,1(a0)
    1840:	4625                	li	a2,9
        s++;
    1842:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1846:	fd07859b          	addiw	a1,a5,-48
    184a:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    184e:	4e01                	li	t3,0
    while (isdigit(*s))
    1850:	fab67ae3          	bgeu	a2,a1,1804 <atoi+0x3a>
    1854:	4501                	li	a0,0
}
    1856:	8082                	ret
    while (isdigit(*s))
    1858:	00154783          	lbu	a5,1(a0)
    185c:	4625                	li	a2,9
        s++;
    185e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1862:	fd07859b          	addiw	a1,a5,-48
    1866:	0007871b          	sext.w	a4,a5
    186a:	feb665e3          	bltu	a2,a1,1854 <atoi+0x8a>
        neg = 1;
    186e:	4e05                	li	t3,1
    1870:	bf51                	j	1804 <atoi+0x3a>

0000000000001872 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1872:	16060d63          	beqz	a2,19ec <memset+0x17a>
    1876:	40a007b3          	neg	a5,a0
    187a:	8b9d                	andi	a5,a5,7
    187c:	00778713          	addi	a4,a5,7
    1880:	482d                	li	a6,11
    1882:	0ff5f593          	andi	a1,a1,255
    1886:	fff60693          	addi	a3,a2,-1
    188a:	17076263          	bltu	a4,a6,19ee <memset+0x17c>
    188e:	16e6ea63          	bltu	a3,a4,1a02 <memset+0x190>
    1892:	16078563          	beqz	a5,19fc <memset+0x18a>
    1896:	00b50023          	sb	a1,0(a0)
    189a:	4705                	li	a4,1
    189c:	00150e93          	addi	t4,a0,1
    18a0:	14e78c63          	beq	a5,a4,19f8 <memset+0x186>
    18a4:	00b500a3          	sb	a1,1(a0)
    18a8:	4709                	li	a4,2
    18aa:	00250e93          	addi	t4,a0,2
    18ae:	14e78d63          	beq	a5,a4,1a08 <memset+0x196>
    18b2:	00b50123          	sb	a1,2(a0)
    18b6:	470d                	li	a4,3
    18b8:	00350e93          	addi	t4,a0,3
    18bc:	12e78b63          	beq	a5,a4,19f2 <memset+0x180>
    18c0:	00b501a3          	sb	a1,3(a0)
    18c4:	4711                	li	a4,4
    18c6:	00450e93          	addi	t4,a0,4
    18ca:	14e78163          	beq	a5,a4,1a0c <memset+0x19a>
    18ce:	00b50223          	sb	a1,4(a0)
    18d2:	4715                	li	a4,5
    18d4:	00550e93          	addi	t4,a0,5
    18d8:	12e78c63          	beq	a5,a4,1a10 <memset+0x19e>
    18dc:	00b502a3          	sb	a1,5(a0)
    18e0:	471d                	li	a4,7
    18e2:	00650e93          	addi	t4,a0,6
    18e6:	12e79763          	bne	a5,a4,1a14 <memset+0x1a2>
    18ea:	00750e93          	addi	t4,a0,7
    18ee:	00b50323          	sb	a1,6(a0)
    18f2:	4f1d                	li	t5,7
    18f4:	00859713          	slli	a4,a1,0x8
    18f8:	8f4d                	or	a4,a4,a1
    18fa:	01059e13          	slli	t3,a1,0x10
    18fe:	01c76e33          	or	t3,a4,t3
    1902:	01859313          	slli	t1,a1,0x18
    1906:	006e6333          	or	t1,t3,t1
    190a:	02059893          	slli	a7,a1,0x20
    190e:	011368b3          	or	a7,t1,a7
    1912:	02859813          	slli	a6,a1,0x28
    1916:	40f60333          	sub	t1,a2,a5
    191a:	0108e833          	or	a6,a7,a6
    191e:	03059693          	slli	a3,a1,0x30
    1922:	00d866b3          	or	a3,a6,a3
    1926:	03859713          	slli	a4,a1,0x38
    192a:	97aa                	add	a5,a5,a0
    192c:	ff837813          	andi	a6,t1,-8
    1930:	8f55                	or	a4,a4,a3
    1932:	00f806b3          	add	a3,a6,a5
    1936:	e398                	sd	a4,0(a5)
    1938:	07a1                	addi	a5,a5,8
    193a:	fed79ee3          	bne	a5,a3,1936 <memset+0xc4>
    193e:	ff837693          	andi	a3,t1,-8
    1942:	00de87b3          	add	a5,t4,a3
    1946:	01e6873b          	addw	a4,a3,t5
    194a:	0ad30663          	beq	t1,a3,19f6 <memset+0x184>
    194e:	00b78023          	sb	a1,0(a5)
    1952:	0017069b          	addiw	a3,a4,1
    1956:	08c6fb63          	bgeu	a3,a2,19ec <memset+0x17a>
    195a:	00b780a3          	sb	a1,1(a5)
    195e:	0027069b          	addiw	a3,a4,2
    1962:	08c6f563          	bgeu	a3,a2,19ec <memset+0x17a>
    1966:	00b78123          	sb	a1,2(a5)
    196a:	0037069b          	addiw	a3,a4,3
    196e:	06c6ff63          	bgeu	a3,a2,19ec <memset+0x17a>
    1972:	00b781a3          	sb	a1,3(a5)
    1976:	0047069b          	addiw	a3,a4,4
    197a:	06c6f963          	bgeu	a3,a2,19ec <memset+0x17a>
    197e:	00b78223          	sb	a1,4(a5)
    1982:	0057069b          	addiw	a3,a4,5
    1986:	06c6f363          	bgeu	a3,a2,19ec <memset+0x17a>
    198a:	00b782a3          	sb	a1,5(a5)
    198e:	0067069b          	addiw	a3,a4,6
    1992:	04c6fd63          	bgeu	a3,a2,19ec <memset+0x17a>
    1996:	00b78323          	sb	a1,6(a5)
    199a:	0077069b          	addiw	a3,a4,7
    199e:	04c6f763          	bgeu	a3,a2,19ec <memset+0x17a>
    19a2:	00b783a3          	sb	a1,7(a5)
    19a6:	0087069b          	addiw	a3,a4,8
    19aa:	04c6f163          	bgeu	a3,a2,19ec <memset+0x17a>
    19ae:	00b78423          	sb	a1,8(a5)
    19b2:	0097069b          	addiw	a3,a4,9
    19b6:	02c6fb63          	bgeu	a3,a2,19ec <memset+0x17a>
    19ba:	00b784a3          	sb	a1,9(a5)
    19be:	00a7069b          	addiw	a3,a4,10
    19c2:	02c6f563          	bgeu	a3,a2,19ec <memset+0x17a>
    19c6:	00b78523          	sb	a1,10(a5)
    19ca:	00b7069b          	addiw	a3,a4,11
    19ce:	00c6ff63          	bgeu	a3,a2,19ec <memset+0x17a>
    19d2:	00b785a3          	sb	a1,11(a5)
    19d6:	00c7069b          	addiw	a3,a4,12
    19da:	00c6f963          	bgeu	a3,a2,19ec <memset+0x17a>
    19de:	00b78623          	sb	a1,12(a5)
    19e2:	2735                	addiw	a4,a4,13
    19e4:	00c77463          	bgeu	a4,a2,19ec <memset+0x17a>
    19e8:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    19ec:	8082                	ret
    19ee:	472d                	li	a4,11
    19f0:	bd79                	j	188e <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    19f2:	4f0d                	li	t5,3
    19f4:	b701                	j	18f4 <memset+0x82>
    19f6:	8082                	ret
    19f8:	4f05                	li	t5,1
    19fa:	bded                	j	18f4 <memset+0x82>
    19fc:	8eaa                	mv	t4,a0
    19fe:	4f01                	li	t5,0
    1a00:	bdd5                	j	18f4 <memset+0x82>
    1a02:	87aa                	mv	a5,a0
    1a04:	4701                	li	a4,0
    1a06:	b7a1                	j	194e <memset+0xdc>
    1a08:	4f09                	li	t5,2
    1a0a:	b5ed                	j	18f4 <memset+0x82>
    1a0c:	4f11                	li	t5,4
    1a0e:	b5dd                	j	18f4 <memset+0x82>
    1a10:	4f15                	li	t5,5
    1a12:	b5cd                	j	18f4 <memset+0x82>
    1a14:	4f19                	li	t5,6
    1a16:	bdf9                	j	18f4 <memset+0x82>

0000000000001a18 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1a18:	00054783          	lbu	a5,0(a0)
    1a1c:	0005c703          	lbu	a4,0(a1)
    1a20:	00e79863          	bne	a5,a4,1a30 <strcmp+0x18>
    1a24:	0505                	addi	a0,a0,1
    1a26:	0585                	addi	a1,a1,1
    1a28:	fbe5                	bnez	a5,1a18 <strcmp>
    1a2a:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1a2c:	9d19                	subw	a0,a0,a4
    1a2e:	8082                	ret
    1a30:	0007851b          	sext.w	a0,a5
    1a34:	bfe5                	j	1a2c <strcmp+0x14>

0000000000001a36 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1a36:	ce05                	beqz	a2,1a6e <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1a38:	00054703          	lbu	a4,0(a0)
    1a3c:	0005c783          	lbu	a5,0(a1)
    1a40:	cb0d                	beqz	a4,1a72 <strncmp+0x3c>
    if (!n--)
    1a42:	167d                	addi	a2,a2,-1
    1a44:	00c506b3          	add	a3,a0,a2
    1a48:	a819                	j	1a5e <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1a4a:	00a68e63          	beq	a3,a0,1a66 <strncmp+0x30>
    1a4e:	0505                	addi	a0,a0,1
    1a50:	00e79b63          	bne	a5,a4,1a66 <strncmp+0x30>
    1a54:	00054703          	lbu	a4,0(a0)
    1a58:	0005c783          	lbu	a5,0(a1)
    1a5c:	cb19                	beqz	a4,1a72 <strncmp+0x3c>
    1a5e:	0005c783          	lbu	a5,0(a1)
    1a62:	0585                	addi	a1,a1,1
    1a64:	f3fd                	bnez	a5,1a4a <strncmp+0x14>
        ;
    return *l - *r;
    1a66:	0007051b          	sext.w	a0,a4
    1a6a:	9d1d                	subw	a0,a0,a5
    1a6c:	8082                	ret
        return 0;
    1a6e:	4501                	li	a0,0
}
    1a70:	8082                	ret
    1a72:	4501                	li	a0,0
    return *l - *r;
    1a74:	9d1d                	subw	a0,a0,a5
    1a76:	8082                	ret

0000000000001a78 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1a78:	00757793          	andi	a5,a0,7
    1a7c:	cf89                	beqz	a5,1a96 <strlen+0x1e>
    1a7e:	87aa                	mv	a5,a0
    1a80:	a029                	j	1a8a <strlen+0x12>
    1a82:	0785                	addi	a5,a5,1
    1a84:	0077f713          	andi	a4,a5,7
    1a88:	cb01                	beqz	a4,1a98 <strlen+0x20>
        if (!*s)
    1a8a:	0007c703          	lbu	a4,0(a5)
    1a8e:	fb75                	bnez	a4,1a82 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1a90:	40a78533          	sub	a0,a5,a0
}
    1a94:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1a96:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1a98:	6394                	ld	a3,0(a5)
    1a9a:	00000597          	auipc	a1,0x0
    1a9e:	5a65b583          	ld	a1,1446(a1) # 2040 <unlink+0x58>
    1aa2:	00000617          	auipc	a2,0x0
    1aa6:	5a663603          	ld	a2,1446(a2) # 2048 <unlink+0x60>
    1aaa:	a019                	j	1ab0 <strlen+0x38>
    1aac:	6794                	ld	a3,8(a5)
    1aae:	07a1                	addi	a5,a5,8
    1ab0:	00b68733          	add	a4,a3,a1
    1ab4:	fff6c693          	not	a3,a3
    1ab8:	8f75                	and	a4,a4,a3
    1aba:	8f71                	and	a4,a4,a2
    1abc:	db65                	beqz	a4,1aac <strlen+0x34>
    for (; *s; s++)
    1abe:	0007c703          	lbu	a4,0(a5)
    1ac2:	d779                	beqz	a4,1a90 <strlen+0x18>
    1ac4:	0017c703          	lbu	a4,1(a5)
    1ac8:	0785                	addi	a5,a5,1
    1aca:	d379                	beqz	a4,1a90 <strlen+0x18>
    1acc:	0017c703          	lbu	a4,1(a5)
    1ad0:	0785                	addi	a5,a5,1
    1ad2:	fb6d                	bnez	a4,1ac4 <strlen+0x4c>
    1ad4:	bf75                	j	1a90 <strlen+0x18>

0000000000001ad6 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1ad6:	00757713          	andi	a4,a0,7
{
    1ada:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1adc:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1ae0:	cb19                	beqz	a4,1af6 <memchr+0x20>
    1ae2:	ce25                	beqz	a2,1b5a <memchr+0x84>
    1ae4:	0007c703          	lbu	a4,0(a5)
    1ae8:	04b70e63          	beq	a4,a1,1b44 <memchr+0x6e>
    1aec:	0785                	addi	a5,a5,1
    1aee:	0077f713          	andi	a4,a5,7
    1af2:	167d                	addi	a2,a2,-1
    1af4:	f77d                	bnez	a4,1ae2 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1af6:	4501                	li	a0,0
    if (n && *s != c)
    1af8:	c235                	beqz	a2,1b5c <memchr+0x86>
    1afa:	0007c703          	lbu	a4,0(a5)
    1afe:	04b70363          	beq	a4,a1,1b44 <memchr+0x6e>
        size_t k = ONES * c;
    1b02:	00000517          	auipc	a0,0x0
    1b06:	54e53503          	ld	a0,1358(a0) # 2050 <unlink+0x68>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1b0a:	471d                	li	a4,7
        size_t k = ONES * c;
    1b0c:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1b10:	02c77a63          	bgeu	a4,a2,1b44 <memchr+0x6e>
    1b14:	00000897          	auipc	a7,0x0
    1b18:	52c8b883          	ld	a7,1324(a7) # 2040 <unlink+0x58>
    1b1c:	00000817          	auipc	a6,0x0
    1b20:	52c83803          	ld	a6,1324(a6) # 2048 <unlink+0x60>
    1b24:	431d                	li	t1,7
    1b26:	a029                	j	1b30 <memchr+0x5a>
    1b28:	1661                	addi	a2,a2,-8
    1b2a:	07a1                	addi	a5,a5,8
    1b2c:	02c37963          	bgeu	t1,a2,1b5e <memchr+0x88>
    1b30:	6398                	ld	a4,0(a5)
    1b32:	8f29                	xor	a4,a4,a0
    1b34:	011706b3          	add	a3,a4,a7
    1b38:	fff74713          	not	a4,a4
    1b3c:	8f75                	and	a4,a4,a3
    1b3e:	01077733          	and	a4,a4,a6
    1b42:	d37d                	beqz	a4,1b28 <memchr+0x52>
    1b44:	853e                	mv	a0,a5
    1b46:	97b2                	add	a5,a5,a2
    1b48:	a021                	j	1b50 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1b4a:	0505                	addi	a0,a0,1
    1b4c:	00f50763          	beq	a0,a5,1b5a <memchr+0x84>
    1b50:	00054703          	lbu	a4,0(a0)
    1b54:	feb71be3          	bne	a4,a1,1b4a <memchr+0x74>
    1b58:	8082                	ret
    return n ? (void *)s : 0;
    1b5a:	4501                	li	a0,0
}
    1b5c:	8082                	ret
    return n ? (void *)s : 0;
    1b5e:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1b60:	f275                	bnez	a2,1b44 <memchr+0x6e>
}
    1b62:	8082                	ret

0000000000001b64 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1b64:	1101                	addi	sp,sp,-32
    1b66:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1b68:	862e                	mv	a2,a1
{
    1b6a:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1b6c:	4581                	li	a1,0
{
    1b6e:	e426                	sd	s1,8(sp)
    1b70:	ec06                	sd	ra,24(sp)
    1b72:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1b74:	f63ff0ef          	jal	ra,1ad6 <memchr>
    return p ? p - s : n;
    1b78:	c519                	beqz	a0,1b86 <strnlen+0x22>
}
    1b7a:	60e2                	ld	ra,24(sp)
    1b7c:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1b7e:	8d05                	sub	a0,a0,s1
}
    1b80:	64a2                	ld	s1,8(sp)
    1b82:	6105                	addi	sp,sp,32
    1b84:	8082                	ret
    1b86:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1b88:	8522                	mv	a0,s0
}
    1b8a:	6442                	ld	s0,16(sp)
    1b8c:	64a2                	ld	s1,8(sp)
    1b8e:	6105                	addi	sp,sp,32
    1b90:	8082                	ret

0000000000001b92 <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1b92:	00b547b3          	xor	a5,a0,a1
    1b96:	8b9d                	andi	a5,a5,7
    1b98:	eb95                	bnez	a5,1bcc <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1b9a:	0075f793          	andi	a5,a1,7
    1b9e:	e7b1                	bnez	a5,1bea <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1ba0:	6198                	ld	a4,0(a1)
    1ba2:	00000617          	auipc	a2,0x0
    1ba6:	49e63603          	ld	a2,1182(a2) # 2040 <unlink+0x58>
    1baa:	00000817          	auipc	a6,0x0
    1bae:	49e83803          	ld	a6,1182(a6) # 2048 <unlink+0x60>
    1bb2:	a029                	j	1bbc <stpcpy+0x2a>
    1bb4:	e118                	sd	a4,0(a0)
    1bb6:	6598                	ld	a4,8(a1)
    1bb8:	05a1                	addi	a1,a1,8
    1bba:	0521                	addi	a0,a0,8
    1bbc:	00c707b3          	add	a5,a4,a2
    1bc0:	fff74693          	not	a3,a4
    1bc4:	8ff5                	and	a5,a5,a3
    1bc6:	0107f7b3          	and	a5,a5,a6
    1bca:	d7ed                	beqz	a5,1bb4 <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1bcc:	0005c783          	lbu	a5,0(a1)
    1bd0:	00f50023          	sb	a5,0(a0)
    1bd4:	c785                	beqz	a5,1bfc <stpcpy+0x6a>
    1bd6:	0015c783          	lbu	a5,1(a1)
    1bda:	0505                	addi	a0,a0,1
    1bdc:	0585                	addi	a1,a1,1
    1bde:	00f50023          	sb	a5,0(a0)
    1be2:	fbf5                	bnez	a5,1bd6 <stpcpy+0x44>
        ;
    return d;
}
    1be4:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1be6:	0505                	addi	a0,a0,1
    1be8:	df45                	beqz	a4,1ba0 <stpcpy+0xe>
            if (!(*d = *s))
    1bea:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1bee:	0585                	addi	a1,a1,1
    1bf0:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1bf4:	00f50023          	sb	a5,0(a0)
    1bf8:	f7fd                	bnez	a5,1be6 <stpcpy+0x54>
}
    1bfa:	8082                	ret
    1bfc:	8082                	ret

0000000000001bfe <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1bfe:	00b547b3          	xor	a5,a0,a1
    1c02:	8b9d                	andi	a5,a5,7
    1c04:	1a079863          	bnez	a5,1db4 <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1c08:	0075f793          	andi	a5,a1,7
    1c0c:	16078463          	beqz	a5,1d74 <stpncpy+0x176>
    1c10:	ea01                	bnez	a2,1c20 <stpncpy+0x22>
    1c12:	a421                	j	1e1a <stpncpy+0x21c>
    1c14:	167d                	addi	a2,a2,-1
    1c16:	0505                	addi	a0,a0,1
    1c18:	14070e63          	beqz	a4,1d74 <stpncpy+0x176>
    1c1c:	1a060863          	beqz	a2,1dcc <stpncpy+0x1ce>
    1c20:	0005c783          	lbu	a5,0(a1)
    1c24:	0585                	addi	a1,a1,1
    1c26:	0075f713          	andi	a4,a1,7
    1c2a:	00f50023          	sb	a5,0(a0)
    1c2e:	f3fd                	bnez	a5,1c14 <stpncpy+0x16>
    1c30:	4805                	li	a6,1
    1c32:	1a061863          	bnez	a2,1de2 <stpncpy+0x1e4>
    1c36:	40a007b3          	neg	a5,a0
    1c3a:	8b9d                	andi	a5,a5,7
    1c3c:	4681                	li	a3,0
    1c3e:	18061a63          	bnez	a2,1dd2 <stpncpy+0x1d4>
    1c42:	00778713          	addi	a4,a5,7
    1c46:	45ad                	li	a1,11
    1c48:	18b76363          	bltu	a4,a1,1dce <stpncpy+0x1d0>
    1c4c:	1ae6eb63          	bltu	a3,a4,1e02 <stpncpy+0x204>
    1c50:	1a078363          	beqz	a5,1df6 <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c54:	00050023          	sb	zero,0(a0)
    1c58:	4685                	li	a3,1
    1c5a:	00150713          	addi	a4,a0,1
    1c5e:	18d78f63          	beq	a5,a3,1dfc <stpncpy+0x1fe>
    1c62:	000500a3          	sb	zero,1(a0)
    1c66:	4689                	li	a3,2
    1c68:	00250713          	addi	a4,a0,2
    1c6c:	18d78e63          	beq	a5,a3,1e08 <stpncpy+0x20a>
    1c70:	00050123          	sb	zero,2(a0)
    1c74:	468d                	li	a3,3
    1c76:	00350713          	addi	a4,a0,3
    1c7a:	16d78c63          	beq	a5,a3,1df2 <stpncpy+0x1f4>
    1c7e:	000501a3          	sb	zero,3(a0)
    1c82:	4691                	li	a3,4
    1c84:	00450713          	addi	a4,a0,4
    1c88:	18d78263          	beq	a5,a3,1e0c <stpncpy+0x20e>
    1c8c:	00050223          	sb	zero,4(a0)
    1c90:	4695                	li	a3,5
    1c92:	00550713          	addi	a4,a0,5
    1c96:	16d78d63          	beq	a5,a3,1e10 <stpncpy+0x212>
    1c9a:	000502a3          	sb	zero,5(a0)
    1c9e:	469d                	li	a3,7
    1ca0:	00650713          	addi	a4,a0,6
    1ca4:	16d79863          	bne	a5,a3,1e14 <stpncpy+0x216>
    1ca8:	00750713          	addi	a4,a0,7
    1cac:	00050323          	sb	zero,6(a0)
    1cb0:	40f80833          	sub	a6,a6,a5
    1cb4:	ff887593          	andi	a1,a6,-8
    1cb8:	97aa                	add	a5,a5,a0
    1cba:	95be                	add	a1,a1,a5
    1cbc:	0007b023          	sd	zero,0(a5)
    1cc0:	07a1                	addi	a5,a5,8
    1cc2:	feb79de3          	bne	a5,a1,1cbc <stpncpy+0xbe>
    1cc6:	ff887593          	andi	a1,a6,-8
    1cca:	9ead                	addw	a3,a3,a1
    1ccc:	00b707b3          	add	a5,a4,a1
    1cd0:	12b80863          	beq	a6,a1,1e00 <stpncpy+0x202>
    1cd4:	00078023          	sb	zero,0(a5)
    1cd8:	0016871b          	addiw	a4,a3,1
    1cdc:	0ec77863          	bgeu	a4,a2,1dcc <stpncpy+0x1ce>
    1ce0:	000780a3          	sb	zero,1(a5)
    1ce4:	0026871b          	addiw	a4,a3,2
    1ce8:	0ec77263          	bgeu	a4,a2,1dcc <stpncpy+0x1ce>
    1cec:	00078123          	sb	zero,2(a5)
    1cf0:	0036871b          	addiw	a4,a3,3
    1cf4:	0cc77c63          	bgeu	a4,a2,1dcc <stpncpy+0x1ce>
    1cf8:	000781a3          	sb	zero,3(a5)
    1cfc:	0046871b          	addiw	a4,a3,4
    1d00:	0cc77663          	bgeu	a4,a2,1dcc <stpncpy+0x1ce>
    1d04:	00078223          	sb	zero,4(a5)
    1d08:	0056871b          	addiw	a4,a3,5
    1d0c:	0cc77063          	bgeu	a4,a2,1dcc <stpncpy+0x1ce>
    1d10:	000782a3          	sb	zero,5(a5)
    1d14:	0066871b          	addiw	a4,a3,6
    1d18:	0ac77a63          	bgeu	a4,a2,1dcc <stpncpy+0x1ce>
    1d1c:	00078323          	sb	zero,6(a5)
    1d20:	0076871b          	addiw	a4,a3,7
    1d24:	0ac77463          	bgeu	a4,a2,1dcc <stpncpy+0x1ce>
    1d28:	000783a3          	sb	zero,7(a5)
    1d2c:	0086871b          	addiw	a4,a3,8
    1d30:	08c77e63          	bgeu	a4,a2,1dcc <stpncpy+0x1ce>
    1d34:	00078423          	sb	zero,8(a5)
    1d38:	0096871b          	addiw	a4,a3,9
    1d3c:	08c77863          	bgeu	a4,a2,1dcc <stpncpy+0x1ce>
    1d40:	000784a3          	sb	zero,9(a5)
    1d44:	00a6871b          	addiw	a4,a3,10
    1d48:	08c77263          	bgeu	a4,a2,1dcc <stpncpy+0x1ce>
    1d4c:	00078523          	sb	zero,10(a5)
    1d50:	00b6871b          	addiw	a4,a3,11
    1d54:	06c77c63          	bgeu	a4,a2,1dcc <stpncpy+0x1ce>
    1d58:	000785a3          	sb	zero,11(a5)
    1d5c:	00c6871b          	addiw	a4,a3,12
    1d60:	06c77663          	bgeu	a4,a2,1dcc <stpncpy+0x1ce>
    1d64:	00078623          	sb	zero,12(a5)
    1d68:	26b5                	addiw	a3,a3,13
    1d6a:	06c6f163          	bgeu	a3,a2,1dcc <stpncpy+0x1ce>
    1d6e:	000786a3          	sb	zero,13(a5)
    1d72:	8082                	ret
            ;
        if (!n || !*s)
    1d74:	c645                	beqz	a2,1e1c <stpncpy+0x21e>
    1d76:	0005c783          	lbu	a5,0(a1)
    1d7a:	ea078be3          	beqz	a5,1c30 <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d7e:	479d                	li	a5,7
    1d80:	02c7ff63          	bgeu	a5,a2,1dbe <stpncpy+0x1c0>
    1d84:	00000897          	auipc	a7,0x0
    1d88:	2bc8b883          	ld	a7,700(a7) # 2040 <unlink+0x58>
    1d8c:	00000817          	auipc	a6,0x0
    1d90:	2bc83803          	ld	a6,700(a6) # 2048 <unlink+0x60>
    1d94:	431d                	li	t1,7
    1d96:	6198                	ld	a4,0(a1)
    1d98:	011707b3          	add	a5,a4,a7
    1d9c:	fff74693          	not	a3,a4
    1da0:	8ff5                	and	a5,a5,a3
    1da2:	0107f7b3          	and	a5,a5,a6
    1da6:	ef81                	bnez	a5,1dbe <stpncpy+0x1c0>
            *wd = *ws;
    1da8:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1daa:	1661                	addi	a2,a2,-8
    1dac:	05a1                	addi	a1,a1,8
    1dae:	0521                	addi	a0,a0,8
    1db0:	fec363e3          	bltu	t1,a2,1d96 <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1db4:	e609                	bnez	a2,1dbe <stpncpy+0x1c0>
    1db6:	a08d                	j	1e18 <stpncpy+0x21a>
    1db8:	167d                	addi	a2,a2,-1
    1dba:	0505                	addi	a0,a0,1
    1dbc:	ca01                	beqz	a2,1dcc <stpncpy+0x1ce>
    1dbe:	0005c783          	lbu	a5,0(a1)
    1dc2:	0585                	addi	a1,a1,1
    1dc4:	00f50023          	sb	a5,0(a0)
    1dc8:	fbe5                	bnez	a5,1db8 <stpncpy+0x1ba>
        ;
tail:
    1dca:	b59d                	j	1c30 <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1dcc:	8082                	ret
    1dce:	472d                	li	a4,11
    1dd0:	bdb5                	j	1c4c <stpncpy+0x4e>
    1dd2:	00778713          	addi	a4,a5,7
    1dd6:	45ad                	li	a1,11
    1dd8:	fff60693          	addi	a3,a2,-1
    1ddc:	e6b778e3          	bgeu	a4,a1,1c4c <stpncpy+0x4e>
    1de0:	b7fd                	j	1dce <stpncpy+0x1d0>
    1de2:	40a007b3          	neg	a5,a0
    1de6:	8832                	mv	a6,a2
    1de8:	8b9d                	andi	a5,a5,7
    1dea:	4681                	li	a3,0
    1dec:	e4060be3          	beqz	a2,1c42 <stpncpy+0x44>
    1df0:	b7cd                	j	1dd2 <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1df2:	468d                	li	a3,3
    1df4:	bd75                	j	1cb0 <stpncpy+0xb2>
    1df6:	872a                	mv	a4,a0
    1df8:	4681                	li	a3,0
    1dfa:	bd5d                	j	1cb0 <stpncpy+0xb2>
    1dfc:	4685                	li	a3,1
    1dfe:	bd4d                	j	1cb0 <stpncpy+0xb2>
    1e00:	8082                	ret
    1e02:	87aa                	mv	a5,a0
    1e04:	4681                	li	a3,0
    1e06:	b5f9                	j	1cd4 <stpncpy+0xd6>
    1e08:	4689                	li	a3,2
    1e0a:	b55d                	j	1cb0 <stpncpy+0xb2>
    1e0c:	4691                	li	a3,4
    1e0e:	b54d                	j	1cb0 <stpncpy+0xb2>
    1e10:	4695                	li	a3,5
    1e12:	bd79                	j	1cb0 <stpncpy+0xb2>
    1e14:	4699                	li	a3,6
    1e16:	bd69                	j	1cb0 <stpncpy+0xb2>
    1e18:	8082                	ret
    1e1a:	8082                	ret
    1e1c:	8082                	ret

0000000000001e1e <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1e1e:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1e22:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e24:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <close>:
    register long a7 __asm__("a7") = n;
    1e2c:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1e30:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <read>:
    register long a7 __asm__("a7") = n;
    1e38:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e3c:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1e40:	8082                	ret

0000000000001e42 <write>:
    register long a7 __asm__("a7") = n;
    1e42:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e46:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1e4a:	8082                	ret

0000000000001e4c <getpid>:
    register long a7 __asm__("a7") = n;
    1e4c:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1e50:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1e54:	2501                	sext.w	a0,a0
    1e56:	8082                	ret

0000000000001e58 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1e58:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1e5c:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1e60:	2501                	sext.w	a0,a0
    1e62:	8082                	ret

0000000000001e64 <fork>:
    register long a7 __asm__("a7") = n;
    1e64:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1e68:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1e6c:	2501                	sext.w	a0,a0
    1e6e:	8082                	ret

0000000000001e70 <exit>:
    register long a7 __asm__("a7") = n;
    1e70:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e74:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e78:	8082                	ret

0000000000001e7a <waitpid>:
    register long a7 __asm__("a7") = n;
    1e7a:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e7e:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1e82:	2501                	sext.w	a0,a0
    1e84:	8082                	ret

0000000000001e86 <exec>:
    register long a7 __asm__("a7") = n;
    1e86:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e8a:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e8e:	2501                	sext.w	a0,a0
    1e90:	8082                	ret

0000000000001e92 <get_time>:

int64 get_time()
{
    1e92:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e94:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e98:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e9a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e9c:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1ea0:	2501                	sext.w	a0,a0
    1ea2:	ed09                	bnez	a0,1ebc <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ea4:	67a2                	ld	a5,8(sp)
    1ea6:	3e800713          	li	a4,1000
    1eaa:	00015503          	lhu	a0,0(sp)
    1eae:	02e7d7b3          	divu	a5,a5,a4
    1eb2:	02e50533          	mul	a0,a0,a4
    1eb6:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1eb8:	0141                	addi	sp,sp,16
    1eba:	8082                	ret
        return -1;
    1ebc:	557d                	li	a0,-1
    1ebe:	bfed                	j	1eb8 <get_time+0x26>

0000000000001ec0 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1ec0:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec4:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1ec8:	2501                	sext.w	a0,a0
    1eca:	8082                	ret

0000000000001ecc <sleep>:

int sleep(unsigned long long time)
{
    1ecc:	1141                	addi	sp,sp,-16
    1ece:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1ed0:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ed4:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ed6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed8:	00000073          	ecall
    if (err == 0)
    1edc:	2501                	sext.w	a0,a0
    1ede:	e13d                	bnez	a0,1f44 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ee0:	6722                	ld	a4,8(sp)
    1ee2:	3e800693          	li	a3,1000
    1ee6:	00015783          	lhu	a5,0(sp)
    1eea:	02d75733          	divu	a4,a4,a3
    1eee:	02d787b3          	mul	a5,a5,a3
    1ef2:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1ef4:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ef8:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1efa:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1efc:	00000073          	ecall
    if (err == 0)
    1f00:	2501                	sext.w	a0,a0
    1f02:	ed15                	bnez	a0,1f3e <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1f04:	6841                	lui	a6,0x10
    1f06:	963e                	add	a2,a2,a5
    1f08:	187d                	addi	a6,a6,-1
    1f0a:	3e800693          	li	a3,1000
    1f0e:	a819                	j	1f24 <sleep+0x58>
    __asm_syscall("r"(a7))
    1f10:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1f14:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1f18:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1f1a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f1c:	00000073          	ecall
    if (err == 0)
    1f20:	2501                	sext.w	a0,a0
    1f22:	ed11                	bnez	a0,1f3e <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1f24:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1f26:	07c00893          	li	a7,124
    1f2a:	02d7d733          	divu	a4,a5,a3
    1f2e:	6782                	ld	a5,0(sp)
    1f30:	0107f7b3          	and	a5,a5,a6
    1f34:	02d787b3          	mul	a5,a5,a3
    1f38:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1f3a:	fcc7ebe3          	bltu	a5,a2,1f10 <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1f3e:	4501                	li	a0,0
    1f40:	0141                	addi	sp,sp,16
    1f42:	8082                	ret
    1f44:	57fd                	li	a5,-1
    1f46:	b77d                	j	1ef4 <sleep+0x28>

0000000000001f48 <set_priority>:
    register long a7 __asm__("a7") = n;
    1f48:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1f4c:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1f50:	2501                	sext.w	a0,a0
    1f52:	8082                	ret

0000000000001f54 <mmap>:
    register long a7 __asm__("a7") = n;
    1f54:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f58:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1f5c:	2501                	sext.w	a0,a0
    1f5e:	8082                	ret

0000000000001f60 <munmap>:
    register long a7 __asm__("a7") = n;
    1f60:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f64:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1f68:	2501                	sext.w	a0,a0
    1f6a:	8082                	ret

0000000000001f6c <wait>:

int wait(int *code)
{
    1f6c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f6e:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1f72:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f74:	00000073          	ecall
    return waitpid(-1, code);
}
    1f78:	2501                	sext.w	a0,a0
    1f7a:	8082                	ret

0000000000001f7c <spawn>:
    register long a7 __asm__("a7") = n;
    1f7c:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1f80:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f84:	2501                	sext.w	a0,a0
    1f86:	8082                	ret

0000000000001f88 <mailread>:
    register long a7 __asm__("a7") = n;
    1f88:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f8c:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f90:	2501                	sext.w	a0,a0
    1f92:	8082                	ret

0000000000001f94 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f94:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f98:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f9c:	2501                	sext.w	a0,a0
    1f9e:	8082                	ret

0000000000001fa0 <fstat>:
    register long a7 __asm__("a7") = n;
    1fa0:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fa4:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1fa8:	2501                	sext.w	a0,a0
    1faa:	8082                	ret

0000000000001fac <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1fac:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1fae:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1fb2:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fb4:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1fb8:	2501                	sext.w	a0,a0
    1fba:	8082                	ret

0000000000001fbc <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1fbc:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1fbe:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1fc2:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fc4:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1fc8:	2501                	sext.w	a0,a0
    1fca:	8082                	ret

0000000000001fcc <link>:

int link(char *old_path, char *new_path)
{
    1fcc:	87aa                	mv	a5,a0
    1fce:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1fd0:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1fd4:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1fd8:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1fda:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1fde:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fe0:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1fe4:	2501                	sext.w	a0,a0
    1fe6:	8082                	ret

0000000000001fe8 <unlink>:

int unlink(char *path)
{
    1fe8:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1fea:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1fee:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1ff2:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ff4:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1ff8:	2501                	sext.w	a0,a0
    1ffa:	8082                	ret
