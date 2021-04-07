
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch3_2_stride4:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0700006f          	j	1072 <__start_main>

0000000000001006 <spin_delay>:
    int j = 1;
    for (int _ = 0; _ < 10; ++_)
    {
        j = !j;
    }
}
    1006:	8082                	ret

0000000000001008 <count_during>:

// to get enough accuracy, MAX_TIME (the running time of each process) should > 1000 mseconds.
const int MAX_TIME = 1000;
int count_during(int prio)
{
    1008:	7179                	addi	sp,sp,-48
    100a:	f406                	sd	ra,40(sp)
    100c:	f022                	sd	s0,32(sp)
    100e:	ec26                	sd	s1,24(sp)
    1010:	842a                	mv	s0,a0
    1012:	e84a                	sd	s2,16(sp)
    1014:	e44e                	sd	s3,8(sp)
    uint64 start_time = get_time();
    1016:	613000ef          	jal	ra,1e28 <get_time>
    101a:	892a                	mv	s2,a0
    int acc = 0;
    set_priority(prio);
    101c:	8522                	mv	a0,s0
    101e:	6c1000ef          	jal	ra,1ede <set_priority>
    for (;;)
    {
        spin_delay();
        acc += 1;
    1022:	4405                	li	s0,1
    1024:	19000493          	li	s1,400
        if (acc % 400 == 0)
        {
            uint64 time = get_time() - start_time;
            if (time > MAX_TIME)
    1028:	3e800993          	li	s3,1000
        acc += 1;
    102c:	2405                	addiw	s0,s0,1
        if (acc % 400 == 0)
    102e:	0294673b          	remw	a4,s0,s1
    1032:	ff6d                	bnez	a4,102c <count_during+0x24>
            uint64 time = get_time() - start_time;
    1034:	5f5000ef          	jal	ra,1e28 <get_time>
    1038:	41250533          	sub	a0,a0,s2
            if (time > MAX_TIME)
    103c:	fea9f8e3          	bgeu	s3,a0,102c <count_during+0x24>
            {
                return acc;
            }
        }
    }
}
    1040:	70a2                	ld	ra,40(sp)
    1042:	8522                	mv	a0,s0
    1044:	7402                	ld	s0,32(sp)
    1046:	64e2                	ld	s1,24(sp)
    1048:	6942                	ld	s2,16(sp)
    104a:	69a2                	ld	s3,8(sp)
    104c:	6145                	addi	sp,sp,48
    104e:	8082                	ret

0000000000001050 <main>:

int main()
{
    1050:	1141                	addi	sp,sp,-16
    int prio = 9;
    int count = count_during(prio);
    1052:	4525                	li	a0,9
{
    1054:	e406                	sd	ra,8(sp)
    int count = count_during(prio);
    1056:	fb3ff0ef          	jal	ra,1008 <count_during>
    105a:	862a                	mv	a2,a0
    printf("priority = %d, exitcode = %d\n", prio, count);
    105c:	45a5                	li	a1,9
    105e:	00001517          	auipc	a0,0x1
    1062:	f3a50513          	addi	a0,a0,-198 # 1f98 <unlink+0x1a>
    1066:	09e000ef          	jal	ra,1104 <printf>
    return 0;
    106a:	60a2                	ld	ra,8(sp)
    106c:	4501                	li	a0,0
    106e:	0141                	addi	sp,sp,16
    1070:	8082                	ret

0000000000001072 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1072:	1141                	addi	sp,sp,-16
    1074:	e406                	sd	ra,8(sp)
    exit(main());
    1076:	fdbff0ef          	jal	ra,1050 <main>
    107a:	58d000ef          	jal	ra,1e06 <exit>
    return 0;
}
    107e:	60a2                	ld	ra,8(sp)
    1080:	4501                	li	a0,0
    1082:	0141                	addi	sp,sp,16
    1084:	8082                	ret

0000000000001086 <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    1086:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    1088:	00f10593          	addi	a1,sp,15
    108c:	4605                	li	a2,1
    108e:	4501                	li	a0,0
{
    1090:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1092:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1096:	539000ef          	jal	ra,1dce <read>
    return byte;
}
    109a:	60e2                	ld	ra,24(sp)
    109c:	00f14503          	lbu	a0,15(sp)
    10a0:	6105                	addi	sp,sp,32
    10a2:	8082                	ret

00000000000010a4 <putchar>:

int putchar(int c)
{
    10a4:	1101                	addi	sp,sp,-32
    10a6:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    10a8:	00f10593          	addi	a1,sp,15
    10ac:	4605                	li	a2,1
    10ae:	4505                	li	a0,1
{
    10b0:	ec06                	sd	ra,24(sp)
    char byte = c;
    10b2:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    10b6:	523000ef          	jal	ra,1dd8 <write>
}
    10ba:	60e2                	ld	ra,24(sp)
    10bc:	2501                	sext.w	a0,a0
    10be:	6105                	addi	sp,sp,32
    10c0:	8082                	ret

00000000000010c2 <puts>:

int puts(const char *s)
{
    10c2:	1101                	addi	sp,sp,-32
    10c4:	e822                	sd	s0,16(sp)
    10c6:	ec06                	sd	ra,24(sp)
    10c8:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    10ca:	145000ef          	jal	ra,1a0e <strlen>
    10ce:	862a                	mv	a2,a0
    10d0:	85a2                	mv	a1,s0
    10d2:	4505                	li	a0,1
    10d4:	505000ef          	jal	ra,1dd8 <write>
    10d8:	00055763          	bgez	a0,10e6 <puts+0x24>
    return r;
}
    10dc:	60e2                	ld	ra,24(sp)
    10de:	6442                	ld	s0,16(sp)
    10e0:	557d                	li	a0,-1
    10e2:	6105                	addi	sp,sp,32
    10e4:	8082                	ret
    return write(stdout, &byte, 1);
    10e6:	00f10593          	addi	a1,sp,15
    char byte = c;
    10ea:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    10ec:	4605                	li	a2,1
    10ee:	4505                	li	a0,1
    char byte = c;
    10f0:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    10f4:	4e5000ef          	jal	ra,1dd8 <write>
}
    10f8:	60e2                	ld	ra,24(sp)
    10fa:	6442                	ld	s0,16(sp)
    10fc:	41f5551b          	sraiw	a0,a0,0x1f
    1100:	6105                	addi	sp,sp,32
    1102:	8082                	ret

0000000000001104 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1104:	7131                	addi	sp,sp,-192
    1106:	ecce                	sd	s3,88(sp)
    1108:	e8d2                	sd	s4,80(sp)
    110a:	e4d6                	sd	s5,72(sp)
    110c:	e0da                	sd	s6,64(sp)
    110e:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    1110:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1112:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    1114:	6ae1                	lui	s5,0x18
    1116:	000f4a37          	lui	s4,0xf4
    111a:	00989b37          	lui	s6,0x989
{
    111e:	fc86                	sd	ra,120(sp)
    1120:	f8a2                	sd	s0,112(sp)
    1122:	f4a6                	sd	s1,104(sp)
    1124:	f0ca                	sd	s2,96(sp)
    1126:	fc5e                	sd	s7,56(sp)
    1128:	e52e                	sd	a1,136(sp)
    112a:	e932                	sd	a2,144(sp)
    112c:	ed36                	sd	a3,152(sp)
    112e:	f13a                	sd	a4,160(sp)
    1130:	f942                	sd	a6,176(sp)
    1132:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1134:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    1136:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x72f>
    113a:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x166bf>
    113e:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf225f>
    1142:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x98769f>
    for (;;)
    {
        if (!*s)
    1146:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    114a:	02500913          	li	s2,37
        if (!*s)
    114e:	1a078f63          	beqz	a5,130c <printf+0x208>
    1152:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1154:	17278e63          	beq	a5,s2,12d0 <printf+0x1cc>
    1158:	00164783          	lbu	a5,1(a2)
    115c:	0605                	addi	a2,a2,1
    115e:	fbfd                	bnez	a5,1154 <printf+0x50>
    1160:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    1162:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1166:	85aa                	mv	a1,a0
    1168:	8622                	mv	a2,s0
    116a:	4505                	li	a0,1
    116c:	46d000ef          	jal	ra,1dd8 <write>
        out(f, a, l);
        if (l)
    1170:	18041963          	bnez	s0,1302 <printf+0x1fe>
            continue;
        if (s[1] == 0)
    1174:	0014c783          	lbu	a5,1(s1)
    1178:	18078a63          	beqz	a5,130c <printf+0x208>
            break;
        switch (s[1])
    117c:	07300713          	li	a4,115
    1180:	28e78e63          	beq	a5,a4,141c <printf+0x318>
    1184:	18f76f63          	bltu	a4,a5,1322 <printf+0x21e>
    1188:	06400713          	li	a4,100
    118c:	2ae78c63          	beq	a5,a4,1444 <printf+0x340>
    1190:	07000713          	li	a4,112
    1194:	3ce79c63          	bne	a5,a4,156c <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1198:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    119a:	00001797          	auipc	a5,0x1
    119e:	e4678793          	addi	a5,a5,-442 # 1fe0 <digits>
            printptr(va_arg(ap, uint64));
    11a2:	6298                	ld	a4,0(a3)
    11a4:	00868093          	addi	ra,a3,8
    11a8:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    11aa:	00471293          	slli	t0,a4,0x4
    11ae:	00c71f13          	slli	t5,a4,0xc
    11b2:	01471e13          	slli	t3,a4,0x14
    11b6:	01c71893          	slli	a7,a4,0x1c
    11ba:	02471813          	slli	a6,a4,0x24
    11be:	02871513          	slli	a0,a4,0x28
    11c2:	02c71593          	slli	a1,a4,0x2c
    11c6:	03071693          	slli	a3,a4,0x30
    11ca:	00871f93          	slli	t6,a4,0x8
    11ce:	01071e93          	slli	t4,a4,0x10
    11d2:	01871313          	slli	t1,a4,0x18
    11d6:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    11da:	03c2d293          	srli	t0,t0,0x3c
    11de:	03cf5f13          	srli	t5,t5,0x3c
    11e2:	03ce5e13          	srli	t3,t3,0x3c
    11e6:	03c8d893          	srli	a7,a7,0x3c
    11ea:	03c85813          	srli	a6,a6,0x3c
    11ee:	9171                	srli	a0,a0,0x3c
    11f0:	91f1                	srli	a1,a1,0x3c
    11f2:	92f1                	srli	a3,a3,0x3c
    11f4:	92be                	add	t0,t0,a5
    11f6:	9f3e                	add	t5,t5,a5
    11f8:	9e3e                	add	t3,t3,a5
    11fa:	98be                	add	a7,a7,a5
    11fc:	983e                	add	a6,a6,a5
    11fe:	953e                	add	a0,a0,a5
    1200:	95be                	add	a1,a1,a5
    1202:	96be                	add	a3,a3,a5
    1204:	03c75393          	srli	t2,a4,0x3c
    1208:	01c75b9b          	srliw	s7,a4,0x1c
    120c:	03cfdf93          	srli	t6,t6,0x3c
    1210:	03cede93          	srli	t4,t4,0x3c
    1214:	03c35313          	srli	t1,t1,0x3c
    1218:	9271                	srli	a2,a2,0x3c
    121a:	0002c403          	lbu	s0,0(t0)
    121e:	93be                	add	t2,t2,a5
    1220:	000f4283          	lbu	t0,0(t5)
    1224:	9fbe                	add	t6,t6,a5
    1226:	000e4f03          	lbu	t5,0(t3)
    122a:	9ebe                	add	t4,t4,a5
    122c:	0008ce03          	lbu	t3,0(a7)
    1230:	933e                	add	t1,t1,a5
    1232:	00084883          	lbu	a7,0(a6)
    1236:	9bbe                	add	s7,s7,a5
    1238:	00054803          	lbu	a6,0(a0)
    123c:	963e                	add	a2,a2,a5
    123e:	0005c503          	lbu	a0,0(a1)
    1242:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1246:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    124a:	0003c903          	lbu	s2,0(t2)
    124e:	00064603          	lbu	a2,0(a2)
    1252:	000fc383          	lbu	t2,0(t6)
    1256:	8b3d                	andi	a4,a4,15
    1258:	000ecf83          	lbu	t6,0(t4)
    125c:	92f1                	srli	a3,a3,0x3c
    125e:	00034e83          	lbu	t4,0(t1)
    1262:	000bc303          	lbu	t1,0(s7)
    1266:	96be                	add	a3,a3,a5
    1268:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    126a:	7761                	lui	a4,0xffff8
    126c:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1270:	00710623          	sb	t2,12(sp)
    1274:	005106a3          	sb	t0,13(sp)
    1278:	01f10723          	sb	t6,14(sp)
    127c:	01e107a3          	sb	t5,15(sp)
    1280:	01d10823          	sb	t4,16(sp)
    1284:	01c108a3          	sb	t3,17(sp)
    1288:	00610923          	sb	t1,18(sp)
    128c:	011109a3          	sb	a7,19(sp)
    1290:	01010a23          	sb	a6,20(sp)
    1294:	00a10aa3          	sb	a0,21(sp)
    1298:	00b10b23          	sb	a1,22(sp)
    129c:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    12a0:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12a4:	01210523          	sb	s2,10(sp)
    12a8:	008105a3          	sb	s0,11(sp)
    12ac:	0006c703          	lbu	a4,0(a3)
    12b0:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    12b4:	4649                	li	a2,18
    12b6:	002c                	addi	a1,sp,8
    12b8:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12ba:	00e10c23          	sb	a4,24(sp)
    12be:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    12c2:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    12c6:	313000ef          	jal	ra,1dd8 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    12ca:	00248513          	addi	a0,s1,2
    12ce:	bda5                	j	1146 <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    12d0:	00064783          	lbu	a5,0(a2)
    12d4:	84b2                	mv	s1,a2
    12d6:	01278963          	beq	a5,s2,12e8 <printf+0x1e4>
    12da:	b561                	j	1162 <printf+0x5e>
    12dc:	0024c783          	lbu	a5,2(s1)
    12e0:	0605                	addi	a2,a2,1
    12e2:	0489                	addi	s1,s1,2
    12e4:	e7279fe3          	bne	a5,s2,1162 <printf+0x5e>
    12e8:	0014c783          	lbu	a5,1(s1)
    12ec:	ff2788e3          	beq	a5,s2,12dc <printf+0x1d8>
        l = z - a;
    12f0:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    12f4:	85aa                	mv	a1,a0
    12f6:	8622                	mv	a2,s0
    12f8:	4505                	li	a0,1
    12fa:	2df000ef          	jal	ra,1dd8 <write>
        if (l)
    12fe:	e6040be3          	beqz	s0,1174 <printf+0x70>
    1302:	8526                	mv	a0,s1
        if (!*s)
    1304:	00054783          	lbu	a5,0(a0)
    1308:	e40795e3          	bnez	a5,1152 <printf+0x4e>
    }
    va_end(ap);
    130c:	70e6                	ld	ra,120(sp)
    130e:	7446                	ld	s0,112(sp)
    1310:	74a6                	ld	s1,104(sp)
    1312:	7906                	ld	s2,96(sp)
    1314:	69e6                	ld	s3,88(sp)
    1316:	6a46                	ld	s4,80(sp)
    1318:	6aa6                	ld	s5,72(sp)
    131a:	6b06                	ld	s6,64(sp)
    131c:	7be2                	ld	s7,56(sp)
    131e:	6129                	addi	sp,sp,192
    1320:	8082                	ret
        switch (s[1])
    1322:	07800713          	li	a4,120
    1326:	24e79363          	bne	a5,a4,156c <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    132a:	6782                	ld	a5,0(sp)
    132c:	4394                	lw	a3,0(a5)
    132e:	07a1                	addi	a5,a5,8
    1330:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1332:	2606c263          	bltz	a3,1596 <printf+0x492>
        buf[i--] = digits[x % base];
    1336:	00001797          	auipc	a5,0x1
    133a:	caa78793          	addi	a5,a5,-854 # 1fe0 <digits>
    133e:	00f6f713          	andi	a4,a3,15
    1342:	973e                	add	a4,a4,a5
    1344:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff6020>
    buf[16] = 0;
    1348:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    134c:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    134e:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1352:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    1356:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    135a:	0046d51b          	srliw	a0,a3,0x4
    135e:	0ad5d563          	bge	a1,a3,1408 <printf+0x304>
        buf[i--] = digits[x % base];
    1362:	8a3d                	andi	a2,a2,15
    1364:	963e                	add	a2,a2,a5
    1366:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    136a:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    136e:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1372:	30a5fe63          	bgeu	a1,a0,168e <printf+0x58a>
        buf[i--] = digits[x % base];
    1376:	00f77613          	andi	a2,a4,15
    137a:	963e                	add	a2,a2,a5
    137c:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1380:	45bd                	li	a1,15
    1382:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    1386:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    138a:	00475513          	srli	a0,a4,0x4
    138e:	30e5f963          	bgeu	a1,a4,16a0 <printf+0x59c>
        buf[i--] = digits[x % base];
    1392:	8a3d                	andi	a2,a2,15
    1394:	963e                	add	a2,a2,a5
    1396:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    139a:	00875893          	srli	a7,a4,0x8
    139e:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    13a2:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    13a6:	30a5fd63          	bgeu	a1,a0,16c0 <printf+0x5bc>
        buf[i--] = digits[x % base];
    13aa:	8a3d                	andi	a2,a2,15
    13ac:	963e                	add	a2,a2,a5
    13ae:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13b2:	00c75813          	srli	a6,a4,0xc
    13b6:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    13ba:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    13be:	3315fe63          	bgeu	a1,a7,16fa <printf+0x5f6>
        buf[i--] = digits[x % base];
    13c2:	8a3d                	andi	a2,a2,15
    13c4:	963e                	add	a2,a2,a5
    13c6:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13ca:	01075893          	srli	a7,a4,0x10
    13ce:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    13d2:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    13d6:	3305ff63          	bgeu	a1,a6,1714 <printf+0x610>
        buf[i--] = digits[x % base];
    13da:	8a3d                	andi	a2,a2,15
    13dc:	963e                	add	a2,a2,a5
    13de:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    13e2:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    13e6:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    13ea:	3515f863          	bgeu	a1,a7,173a <printf+0x636>
        buf[i--] = digits[x % base];
    13ee:	97ba                	add	a5,a5,a4
    13f0:	0007c783          	lbu	a5,0(a5)
    13f4:	45a1                	li	a1,8
    13f6:	00f10823          	sb	a5,16(sp)
    if (sign)
    13fa:	0006d763          	bgez	a3,1408 <printf+0x304>
        buf[i--] = '-';
    13fe:	02d00793          	li	a5,45
    1402:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1406:	459d                	li	a1,7
    write(f, s, l);
    1408:	4641                	li	a2,16
    140a:	003c                	addi	a5,sp,8
    140c:	9e0d                	subw	a2,a2,a1
    140e:	4505                	li	a0,1
    1410:	95be                	add	a1,a1,a5
    1412:	1c7000ef          	jal	ra,1dd8 <write>
        s += 2;
    1416:	00248513          	addi	a0,s1,2
    141a:	b335                	j	1146 <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    141c:	6782                	ld	a5,0(sp)
    141e:	6380                	ld	s0,0(a5)
    1420:	07a1                	addi	a5,a5,8
    1422:	e03e                	sd	a5,0(sp)
    1424:	22040a63          	beqz	s0,1658 <printf+0x554>
            l = strnlen(a, 200);
    1428:	0c800593          	li	a1,200
    142c:	8522                	mv	a0,s0
    142e:	6cc000ef          	jal	ra,1afa <strnlen>
    write(f, s, l);
    1432:	0005061b          	sext.w	a2,a0
    1436:	85a2                	mv	a1,s0
    1438:	4505                	li	a0,1
    143a:	19f000ef          	jal	ra,1dd8 <write>
        s += 2;
    143e:	00248513          	addi	a0,s1,2
    1442:	b311                	j	1146 <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    1444:	6782                	ld	a5,0(sp)
    1446:	4390                	lw	a2,0(a5)
    1448:	07a1                	addi	a5,a5,8
    144a:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    144c:	1a064363          	bltz	a2,15f2 <printf+0x4ee>
        buf[i--] = digits[x % base];
    1450:	46a9                	li	a3,10
    1452:	02d6773b          	remuw	a4,a2,a3
    1456:	00001797          	auipc	a5,0x1
    145a:	b8a78793          	addi	a5,a5,-1142 # 1fe0 <digits>
    buf[16] = 0;
    145e:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1462:	4525                	li	a0,9
        x = xx;
    1464:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    1468:	973e                	add	a4,a4,a5
    146a:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    146e:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    1472:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1476:	2cc55063          	bge	a0,a2,1736 <printf+0x632>
    147a:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    147e:	02d5f73b          	remuw	a4,a1,a3
    1482:	1702                	slli	a4,a4,0x20
    1484:	9301                	srli	a4,a4,0x20
    1486:	973e                	add	a4,a4,a5
    1488:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    148c:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    1490:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    1494:	1f057d63          	bgeu	a0,a6,168e <printf+0x58a>
        buf[i--] = digits[x % base];
    1498:	4529                	li	a0,10
    } while ((x /= base) != 0);
    149a:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    149c:	02a5f73b          	remuw	a4,a1,a0
    14a0:	973e                	add	a4,a4,a5
    14a2:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    14a6:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    14aa:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    14ae:	1ab6f163          	bgeu	a3,a1,1650 <printf+0x54c>
    14b2:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    14b6:	02a776bb          	remuw	a3,a4,a0
    14ba:	96be                	add	a3,a3,a5
    14bc:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14c0:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14c4:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    14c8:	20b87c63          	bgeu	a6,a1,16e0 <printf+0x5dc>
    14cc:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    14d0:	02a776bb          	remuw	a3,a4,a0
    14d4:	96be                	add	a3,a3,a5
    14d6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14da:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14de:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    14e2:	20b87363          	bgeu	a6,a1,16e8 <printf+0x5e4>
        buf[i--] = digits[x % base];
    14e6:	02a776bb          	remuw	a3,a4,a0
    14ea:	96be                	add	a3,a3,a5
    14ec:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14f0:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14f4:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    14f8:	20b9f563          	bgeu	s3,a1,1702 <printf+0x5fe>
        buf[i--] = digits[x % base];
    14fc:	02a776bb          	remuw	a3,a4,a0
    1500:	96be                	add	a3,a3,a5
    1502:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1506:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    150a:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    150e:	20bafb63          	bgeu	s5,a1,1724 <printf+0x620>
        buf[i--] = digits[x % base];
    1512:	02a776bb          	remuw	a3,a4,a0
    1516:	96be                	add	a3,a3,a5
    1518:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    151c:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1520:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1524:	1eba7c63          	bgeu	s4,a1,171c <printf+0x618>
        buf[i--] = digits[x % base];
    1528:	02a776bb          	remuw	a3,a4,a0
    152c:	96be                	add	a3,a3,a5
    152e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1532:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1536:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    153a:	14bb7163          	bgeu	s6,a1,167c <printf+0x578>
        buf[i--] = digits[x % base];
    153e:	1702                	slli	a4,a4,0x20
    1540:	9301                	srli	a4,a4,0x20
    1542:	97ba                	add	a5,a5,a4
    1544:	0007c783          	lbu	a5,0(a5)
    1548:	4599                	li	a1,6
    154a:	00f10723          	sb	a5,14(sp)
    if (sign)
    154e:	ea065de3          	bgez	a2,1408 <printf+0x304>
        buf[i--] = '-';
    1552:	02d00793          	li	a5,45
    1556:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    155a:	4595                	li	a1,5
    write(f, s, l);
    155c:	003c                	addi	a5,sp,8
    155e:	4641                	li	a2,16
    1560:	9e0d                	subw	a2,a2,a1
    1562:	4505                	li	a0,1
    1564:	95be                	add	a1,a1,a5
    1566:	073000ef          	jal	ra,1dd8 <write>
    156a:	b575                	j	1416 <printf+0x312>
    char byte = c;
    156c:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1570:	4605                	li	a2,1
    1572:	002c                	addi	a1,sp,8
    1574:	4505                	li	a0,1
    char byte = c;
    1576:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    157a:	05f000ef          	jal	ra,1dd8 <write>
    char byte = c;
    157e:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1582:	4605                	li	a2,1
    1584:	002c                	addi	a1,sp,8
    1586:	4505                	li	a0,1
    char byte = c;
    1588:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    158c:	04d000ef          	jal	ra,1dd8 <write>
        s += 2;
    1590:	00248513          	addi	a0,s1,2
    1594:	be4d                	j	1146 <printf+0x42>
        x = -xx;
    1596:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    159a:	00001797          	auipc	a5,0x1
    159e:	a4678793          	addi	a5,a5,-1466 # 1fe0 <digits>
    15a2:	00f77613          	andi	a2,a4,15
    15a6:	963e                	add	a2,a2,a5
    15a8:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    15ac:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    15b0:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    15b2:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    15b6:	0047551b          	srliw	a0,a4,0x4
    15ba:	0047561b          	srliw	a2,a4,0x4
    15be:	0ab6d263          	bge	a3,a1,1662 <printf+0x55e>
        buf[i--] = digits[x % base];
    15c2:	8a3d                	andi	a2,a2,15
    15c4:	963e                	add	a2,a2,a5
    15c6:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    15ca:	463d                	li	a2,15
    15cc:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    15d0:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    15d4:	daa661e3          	bltu	a2,a0,1376 <printf+0x272>
        buf[i--] = '-';
    15d8:	02d00793          	li	a5,45
    15dc:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    15e0:	45b5                	li	a1,13
    write(f, s, l);
    15e2:	003c                	addi	a5,sp,8
    15e4:	4641                	li	a2,16
    15e6:	9e0d                	subw	a2,a2,a1
    15e8:	4505                	li	a0,1
    15ea:	95be                	add	a1,a1,a5
    15ec:	7ec000ef          	jal	ra,1dd8 <write>
    15f0:	b51d                	j	1416 <printf+0x312>
        x = -xx;
    15f2:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    15f6:	46a9                	li	a3,10
    15f8:	02d875bb          	remuw	a1,a6,a3
    15fc:	00001797          	auipc	a5,0x1
    1600:	9e478793          	addi	a5,a5,-1564 # 1fe0 <digits>
    buf[16] = 0;
    1604:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1608:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    160a:	95be                	add	a1,a1,a5
    160c:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    1610:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    1614:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    1618:	04a65563          	bge	a2,a0,1662 <printf+0x55e>
    161c:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1620:	02d775bb          	remuw	a1,a4,a3
    1624:	95be                	add	a1,a1,a5
    1626:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    162a:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    162e:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    1632:	fb0573e3          	bgeu	a0,a6,15d8 <printf+0x4d4>
        buf[i--] = digits[x % base];
    1636:	4529                	li	a0,10
    } while ((x /= base) != 0);
    1638:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    163a:	02a5f73b          	remuw	a4,a1,a0
    163e:	973e                	add	a4,a4,a5
    1640:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    1644:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    1648:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    164c:	e6b6e3e3          	bltu	a3,a1,14b2 <printf+0x3ae>
        buf[i--] = digits[x % base];
    1650:	45b5                	li	a1,13
    if (sign)
    1652:	da065be3          	bgez	a2,1408 <printf+0x304>
    1656:	a881                	j	16a6 <printf+0x5a2>
                a = "(null)";
    1658:	00001417          	auipc	s0,0x1
    165c:	96040413          	addi	s0,s0,-1696 # 1fb8 <unlink+0x3a>
    1660:	b3e1                	j	1428 <printf+0x324>
        buf[i--] = '-';
    1662:	02d00793          	li	a5,45
    1666:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    166a:	45b9                	li	a1,14
    write(f, s, l);
    166c:	003c                	addi	a5,sp,8
    166e:	4641                	li	a2,16
    1670:	9e0d                	subw	a2,a2,a1
    1672:	4505                	li	a0,1
    1674:	95be                	add	a1,a1,a5
    1676:	762000ef          	jal	ra,1dd8 <write>
    167a:	bb71                	j	1416 <printf+0x312>
        buf[i--] = digits[x % base];
    167c:	459d                	li	a1,7
    if (sign)
    167e:	d80655e3          	bgez	a2,1408 <printf+0x304>
        buf[i--] = '-';
    1682:	02d00793          	li	a5,45
    1686:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    168a:	4599                	li	a1,6
    168c:	bbb5                	j	1408 <printf+0x304>
    168e:	45b9                	li	a1,14
    write(f, s, l);
    1690:	003c                	addi	a5,sp,8
    1692:	4641                	li	a2,16
    1694:	9e0d                	subw	a2,a2,a1
    1696:	4505                	li	a0,1
    1698:	95be                	add	a1,a1,a5
    169a:	73e000ef          	jal	ra,1dd8 <write>
    169e:	bba5                	j	1416 <printf+0x312>
        buf[i--] = digits[x % base];
    16a0:	45b5                	li	a1,13
    if (sign)
    16a2:	d606d3e3          	bgez	a3,1408 <printf+0x304>
        buf[i--] = '-';
    16a6:	02d00793          	li	a5,45
    16aa:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    16ae:	45b1                	li	a1,12
    write(f, s, l);
    16b0:	003c                	addi	a5,sp,8
    16b2:	4641                	li	a2,16
    16b4:	9e0d                	subw	a2,a2,a1
    16b6:	4505                	li	a0,1
    16b8:	95be                	add	a1,a1,a5
    16ba:	71e000ef          	jal	ra,1dd8 <write>
    16be:	bba1                	j	1416 <printf+0x312>
        buf[i--] = digits[x % base];
    16c0:	45b1                	li	a1,12
    if (sign)
    16c2:	d406d3e3          	bgez	a3,1408 <printf+0x304>
        buf[i--] = '-';
    16c6:	02d00793          	li	a5,45
    16ca:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    16ce:	45ad                	li	a1,11
    write(f, s, l);
    16d0:	003c                	addi	a5,sp,8
    16d2:	4641                	li	a2,16
    16d4:	9e0d                	subw	a2,a2,a1
    16d6:	4505                	li	a0,1
    16d8:	95be                	add	a1,a1,a5
    16da:	6fe000ef          	jal	ra,1dd8 <write>
    16de:	bb25                	j	1416 <printf+0x312>
        buf[i--] = digits[x % base];
    16e0:	45b1                	li	a1,12
    if (sign)
    16e2:	d20653e3          	bgez	a2,1408 <printf+0x304>
    16e6:	b7c5                	j	16c6 <printf+0x5c2>
        buf[i--] = digits[x % base];
    16e8:	45ad                	li	a1,11
    if (sign)
    16ea:	d0065fe3          	bgez	a2,1408 <printf+0x304>
        buf[i--] = '-';
    16ee:	02d00793          	li	a5,45
    16f2:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    16f6:	45a9                	li	a1,10
    16f8:	bb01                	j	1408 <printf+0x304>
    16fa:	45ad                	li	a1,11
    if (sign)
    16fc:	d006d6e3          	bgez	a3,1408 <printf+0x304>
    1700:	b7fd                	j	16ee <printf+0x5ea>
        buf[i--] = digits[x % base];
    1702:	45a9                	li	a1,10
    if (sign)
    1704:	d00652e3          	bgez	a2,1408 <printf+0x304>
        buf[i--] = '-';
    1708:	02d00793          	li	a5,45
    170c:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1710:	45a5                	li	a1,9
    1712:	b9dd                	j	1408 <printf+0x304>
    1714:	45a9                	li	a1,10
    if (sign)
    1716:	ce06d9e3          	bgez	a3,1408 <printf+0x304>
    171a:	b7fd                	j	1708 <printf+0x604>
        buf[i--] = digits[x % base];
    171c:	45a1                	li	a1,8
    if (sign)
    171e:	ce0655e3          	bgez	a2,1408 <printf+0x304>
    1722:	b9f1                	j	13fe <printf+0x2fa>
        buf[i--] = digits[x % base];
    1724:	45a5                	li	a1,9
    if (sign)
    1726:	ce0651e3          	bgez	a2,1408 <printf+0x304>
        buf[i--] = '-';
    172a:	02d00793          	li	a5,45
    172e:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1732:	45a1                	li	a1,8
    1734:	b9d1                	j	1408 <printf+0x304>
    i = 15;
    1736:	45bd                	li	a1,15
    1738:	b9c1                	j	1408 <printf+0x304>
        buf[i--] = digits[x % base];
    173a:	45a5                	li	a1,9
    if (sign)
    173c:	cc06d6e3          	bgez	a3,1408 <printf+0x304>
    1740:	b7ed                	j	172a <printf+0x626>

0000000000001742 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1742:	02000793          	li	a5,32
    1746:	00f50663          	beq	a0,a5,1752 <isspace+0x10>
    174a:	355d                	addiw	a0,a0,-9
    174c:	00553513          	sltiu	a0,a0,5
    1750:	8082                	ret
    1752:	4505                	li	a0,1
}
    1754:	8082                	ret

0000000000001756 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1756:	fd05051b          	addiw	a0,a0,-48
}
    175a:	00a53513          	sltiu	a0,a0,10
    175e:	8082                	ret

0000000000001760 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1760:	02000613          	li	a2,32
    1764:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1766:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    176a:	ff77069b          	addiw	a3,a4,-9
    176e:	04c70d63          	beq	a4,a2,17c8 <atoi+0x68>
    1772:	0007079b          	sext.w	a5,a4
    1776:	04d5f963          	bgeu	a1,a3,17c8 <atoi+0x68>
        s++;
    switch (*s)
    177a:	02b00693          	li	a3,43
    177e:	04d70a63          	beq	a4,a3,17d2 <atoi+0x72>
    1782:	02d00693          	li	a3,45
    1786:	06d70463          	beq	a4,a3,17ee <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    178a:	fd07859b          	addiw	a1,a5,-48
    178e:	4625                	li	a2,9
    1790:	873e                	mv	a4,a5
    1792:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1794:	4e01                	li	t3,0
    while (isdigit(*s))
    1796:	04b66a63          	bltu	a2,a1,17ea <atoi+0x8a>
    int n = 0, neg = 0;
    179a:	4501                	li	a0,0
    while (isdigit(*s))
    179c:	4825                	li	a6,9
    179e:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    17a2:	0025179b          	slliw	a5,a0,0x2
    17a6:	9d3d                	addw	a0,a0,a5
    17a8:	fd07031b          	addiw	t1,a4,-48
    17ac:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    17b0:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    17b4:	0685                	addi	a3,a3,1
    17b6:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    17ba:	0006071b          	sext.w	a4,a2
    17be:	feb870e3          	bgeu	a6,a1,179e <atoi+0x3e>
    return neg ? n : -n;
    17c2:	000e0563          	beqz	t3,17cc <atoi+0x6c>
}
    17c6:	8082                	ret
        s++;
    17c8:	0505                	addi	a0,a0,1
    17ca:	bf71                	j	1766 <atoi+0x6>
    17cc:	4113053b          	subw	a0,t1,a7
    17d0:	8082                	ret
    while (isdigit(*s))
    17d2:	00154783          	lbu	a5,1(a0)
    17d6:	4625                	li	a2,9
        s++;
    17d8:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17dc:	fd07859b          	addiw	a1,a5,-48
    17e0:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    17e4:	4e01                	li	t3,0
    while (isdigit(*s))
    17e6:	fab67ae3          	bgeu	a2,a1,179a <atoi+0x3a>
    17ea:	4501                	li	a0,0
}
    17ec:	8082                	ret
    while (isdigit(*s))
    17ee:	00154783          	lbu	a5,1(a0)
    17f2:	4625                	li	a2,9
        s++;
    17f4:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17f8:	fd07859b          	addiw	a1,a5,-48
    17fc:	0007871b          	sext.w	a4,a5
    1800:	feb665e3          	bltu	a2,a1,17ea <atoi+0x8a>
        neg = 1;
    1804:	4e05                	li	t3,1
    1806:	bf51                	j	179a <atoi+0x3a>

0000000000001808 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1808:	16060d63          	beqz	a2,1982 <memset+0x17a>
    180c:	40a007b3          	neg	a5,a0
    1810:	8b9d                	andi	a5,a5,7
    1812:	00778713          	addi	a4,a5,7
    1816:	482d                	li	a6,11
    1818:	0ff5f593          	andi	a1,a1,255
    181c:	fff60693          	addi	a3,a2,-1
    1820:	17076263          	bltu	a4,a6,1984 <memset+0x17c>
    1824:	16e6ea63          	bltu	a3,a4,1998 <memset+0x190>
    1828:	16078563          	beqz	a5,1992 <memset+0x18a>
    182c:	00b50023          	sb	a1,0(a0)
    1830:	4705                	li	a4,1
    1832:	00150e93          	addi	t4,a0,1
    1836:	14e78c63          	beq	a5,a4,198e <memset+0x186>
    183a:	00b500a3          	sb	a1,1(a0)
    183e:	4709                	li	a4,2
    1840:	00250e93          	addi	t4,a0,2
    1844:	14e78d63          	beq	a5,a4,199e <memset+0x196>
    1848:	00b50123          	sb	a1,2(a0)
    184c:	470d                	li	a4,3
    184e:	00350e93          	addi	t4,a0,3
    1852:	12e78b63          	beq	a5,a4,1988 <memset+0x180>
    1856:	00b501a3          	sb	a1,3(a0)
    185a:	4711                	li	a4,4
    185c:	00450e93          	addi	t4,a0,4
    1860:	14e78163          	beq	a5,a4,19a2 <memset+0x19a>
    1864:	00b50223          	sb	a1,4(a0)
    1868:	4715                	li	a4,5
    186a:	00550e93          	addi	t4,a0,5
    186e:	12e78c63          	beq	a5,a4,19a6 <memset+0x19e>
    1872:	00b502a3          	sb	a1,5(a0)
    1876:	471d                	li	a4,7
    1878:	00650e93          	addi	t4,a0,6
    187c:	12e79763          	bne	a5,a4,19aa <memset+0x1a2>
    1880:	00750e93          	addi	t4,a0,7
    1884:	00b50323          	sb	a1,6(a0)
    1888:	4f1d                	li	t5,7
    188a:	00859713          	slli	a4,a1,0x8
    188e:	8f4d                	or	a4,a4,a1
    1890:	01059e13          	slli	t3,a1,0x10
    1894:	01c76e33          	or	t3,a4,t3
    1898:	01859313          	slli	t1,a1,0x18
    189c:	006e6333          	or	t1,t3,t1
    18a0:	02059893          	slli	a7,a1,0x20
    18a4:	011368b3          	or	a7,t1,a7
    18a8:	02859813          	slli	a6,a1,0x28
    18ac:	40f60333          	sub	t1,a2,a5
    18b0:	0108e833          	or	a6,a7,a6
    18b4:	03059693          	slli	a3,a1,0x30
    18b8:	00d866b3          	or	a3,a6,a3
    18bc:	03859713          	slli	a4,a1,0x38
    18c0:	97aa                	add	a5,a5,a0
    18c2:	ff837813          	andi	a6,t1,-8
    18c6:	8f55                	or	a4,a4,a3
    18c8:	00f806b3          	add	a3,a6,a5
    18cc:	e398                	sd	a4,0(a5)
    18ce:	07a1                	addi	a5,a5,8
    18d0:	fed79ee3          	bne	a5,a3,18cc <memset+0xc4>
    18d4:	ff837693          	andi	a3,t1,-8
    18d8:	00de87b3          	add	a5,t4,a3
    18dc:	01e6873b          	addw	a4,a3,t5
    18e0:	0ad30663          	beq	t1,a3,198c <memset+0x184>
    18e4:	00b78023          	sb	a1,0(a5)
    18e8:	0017069b          	addiw	a3,a4,1
    18ec:	08c6fb63          	bgeu	a3,a2,1982 <memset+0x17a>
    18f0:	00b780a3          	sb	a1,1(a5)
    18f4:	0027069b          	addiw	a3,a4,2
    18f8:	08c6f563          	bgeu	a3,a2,1982 <memset+0x17a>
    18fc:	00b78123          	sb	a1,2(a5)
    1900:	0037069b          	addiw	a3,a4,3
    1904:	06c6ff63          	bgeu	a3,a2,1982 <memset+0x17a>
    1908:	00b781a3          	sb	a1,3(a5)
    190c:	0047069b          	addiw	a3,a4,4
    1910:	06c6f963          	bgeu	a3,a2,1982 <memset+0x17a>
    1914:	00b78223          	sb	a1,4(a5)
    1918:	0057069b          	addiw	a3,a4,5
    191c:	06c6f363          	bgeu	a3,a2,1982 <memset+0x17a>
    1920:	00b782a3          	sb	a1,5(a5)
    1924:	0067069b          	addiw	a3,a4,6
    1928:	04c6fd63          	bgeu	a3,a2,1982 <memset+0x17a>
    192c:	00b78323          	sb	a1,6(a5)
    1930:	0077069b          	addiw	a3,a4,7
    1934:	04c6f763          	bgeu	a3,a2,1982 <memset+0x17a>
    1938:	00b783a3          	sb	a1,7(a5)
    193c:	0087069b          	addiw	a3,a4,8
    1940:	04c6f163          	bgeu	a3,a2,1982 <memset+0x17a>
    1944:	00b78423          	sb	a1,8(a5)
    1948:	0097069b          	addiw	a3,a4,9
    194c:	02c6fb63          	bgeu	a3,a2,1982 <memset+0x17a>
    1950:	00b784a3          	sb	a1,9(a5)
    1954:	00a7069b          	addiw	a3,a4,10
    1958:	02c6f563          	bgeu	a3,a2,1982 <memset+0x17a>
    195c:	00b78523          	sb	a1,10(a5)
    1960:	00b7069b          	addiw	a3,a4,11
    1964:	00c6ff63          	bgeu	a3,a2,1982 <memset+0x17a>
    1968:	00b785a3          	sb	a1,11(a5)
    196c:	00c7069b          	addiw	a3,a4,12
    1970:	00c6f963          	bgeu	a3,a2,1982 <memset+0x17a>
    1974:	00b78623          	sb	a1,12(a5)
    1978:	2735                	addiw	a4,a4,13
    197a:	00c77463          	bgeu	a4,a2,1982 <memset+0x17a>
    197e:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1982:	8082                	ret
    1984:	472d                	li	a4,11
    1986:	bd79                	j	1824 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1988:	4f0d                	li	t5,3
    198a:	b701                	j	188a <memset+0x82>
    198c:	8082                	ret
    198e:	4f05                	li	t5,1
    1990:	bded                	j	188a <memset+0x82>
    1992:	8eaa                	mv	t4,a0
    1994:	4f01                	li	t5,0
    1996:	bdd5                	j	188a <memset+0x82>
    1998:	87aa                	mv	a5,a0
    199a:	4701                	li	a4,0
    199c:	b7a1                	j	18e4 <memset+0xdc>
    199e:	4f09                	li	t5,2
    19a0:	b5ed                	j	188a <memset+0x82>
    19a2:	4f11                	li	t5,4
    19a4:	b5dd                	j	188a <memset+0x82>
    19a6:	4f15                	li	t5,5
    19a8:	b5cd                	j	188a <memset+0x82>
    19aa:	4f19                	li	t5,6
    19ac:	bdf9                	j	188a <memset+0x82>

00000000000019ae <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    19ae:	00054783          	lbu	a5,0(a0)
    19b2:	0005c703          	lbu	a4,0(a1)
    19b6:	00e79863          	bne	a5,a4,19c6 <strcmp+0x18>
    19ba:	0505                	addi	a0,a0,1
    19bc:	0585                	addi	a1,a1,1
    19be:	fbe5                	bnez	a5,19ae <strcmp>
    19c0:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    19c2:	9d19                	subw	a0,a0,a4
    19c4:	8082                	ret
    19c6:	0007851b          	sext.w	a0,a5
    19ca:	bfe5                	j	19c2 <strcmp+0x14>

00000000000019cc <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    19cc:	ce05                	beqz	a2,1a04 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19ce:	00054703          	lbu	a4,0(a0)
    19d2:	0005c783          	lbu	a5,0(a1)
    19d6:	cb0d                	beqz	a4,1a08 <strncmp+0x3c>
    if (!n--)
    19d8:	167d                	addi	a2,a2,-1
    19da:	00c506b3          	add	a3,a0,a2
    19de:	a819                	j	19f4 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19e0:	00a68e63          	beq	a3,a0,19fc <strncmp+0x30>
    19e4:	0505                	addi	a0,a0,1
    19e6:	00e79b63          	bne	a5,a4,19fc <strncmp+0x30>
    19ea:	00054703          	lbu	a4,0(a0)
    19ee:	0005c783          	lbu	a5,0(a1)
    19f2:	cb19                	beqz	a4,1a08 <strncmp+0x3c>
    19f4:	0005c783          	lbu	a5,0(a1)
    19f8:	0585                	addi	a1,a1,1
    19fa:	f3fd                	bnez	a5,19e0 <strncmp+0x14>
        ;
    return *l - *r;
    19fc:	0007051b          	sext.w	a0,a4
    1a00:	9d1d                	subw	a0,a0,a5
    1a02:	8082                	ret
        return 0;
    1a04:	4501                	li	a0,0
}
    1a06:	8082                	ret
    1a08:	4501                	li	a0,0
    return *l - *r;
    1a0a:	9d1d                	subw	a0,a0,a5
    1a0c:	8082                	ret

0000000000001a0e <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1a0e:	00757793          	andi	a5,a0,7
    1a12:	cf89                	beqz	a5,1a2c <strlen+0x1e>
    1a14:	87aa                	mv	a5,a0
    1a16:	a029                	j	1a20 <strlen+0x12>
    1a18:	0785                	addi	a5,a5,1
    1a1a:	0077f713          	andi	a4,a5,7
    1a1e:	cb01                	beqz	a4,1a2e <strlen+0x20>
        if (!*s)
    1a20:	0007c703          	lbu	a4,0(a5)
    1a24:	fb75                	bnez	a4,1a18 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1a26:	40a78533          	sub	a0,a5,a0
}
    1a2a:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1a2c:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1a2e:	6394                	ld	a3,0(a5)
    1a30:	00000597          	auipc	a1,0x0
    1a34:	5985b583          	ld	a1,1432(a1) # 1fc8 <MAX_TIME+0x8>
    1a38:	00000617          	auipc	a2,0x0
    1a3c:	59863603          	ld	a2,1432(a2) # 1fd0 <MAX_TIME+0x10>
    1a40:	a019                	j	1a46 <strlen+0x38>
    1a42:	6794                	ld	a3,8(a5)
    1a44:	07a1                	addi	a5,a5,8
    1a46:	00b68733          	add	a4,a3,a1
    1a4a:	fff6c693          	not	a3,a3
    1a4e:	8f75                	and	a4,a4,a3
    1a50:	8f71                	and	a4,a4,a2
    1a52:	db65                	beqz	a4,1a42 <strlen+0x34>
    for (; *s; s++)
    1a54:	0007c703          	lbu	a4,0(a5)
    1a58:	d779                	beqz	a4,1a26 <strlen+0x18>
    1a5a:	0017c703          	lbu	a4,1(a5)
    1a5e:	0785                	addi	a5,a5,1
    1a60:	d379                	beqz	a4,1a26 <strlen+0x18>
    1a62:	0017c703          	lbu	a4,1(a5)
    1a66:	0785                	addi	a5,a5,1
    1a68:	fb6d                	bnez	a4,1a5a <strlen+0x4c>
    1a6a:	bf75                	j	1a26 <strlen+0x18>

0000000000001a6c <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a6c:	00757713          	andi	a4,a0,7
{
    1a70:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1a72:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a76:	cb19                	beqz	a4,1a8c <memchr+0x20>
    1a78:	ce25                	beqz	a2,1af0 <memchr+0x84>
    1a7a:	0007c703          	lbu	a4,0(a5)
    1a7e:	04b70e63          	beq	a4,a1,1ada <memchr+0x6e>
    1a82:	0785                	addi	a5,a5,1
    1a84:	0077f713          	andi	a4,a5,7
    1a88:	167d                	addi	a2,a2,-1
    1a8a:	f77d                	bnez	a4,1a78 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1a8c:	4501                	li	a0,0
    if (n && *s != c)
    1a8e:	c235                	beqz	a2,1af2 <memchr+0x86>
    1a90:	0007c703          	lbu	a4,0(a5)
    1a94:	04b70363          	beq	a4,a1,1ada <memchr+0x6e>
        size_t k = ONES * c;
    1a98:	00000517          	auipc	a0,0x0
    1a9c:	54053503          	ld	a0,1344(a0) # 1fd8 <MAX_TIME+0x18>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1aa0:	471d                	li	a4,7
        size_t k = ONES * c;
    1aa2:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1aa6:	02c77a63          	bgeu	a4,a2,1ada <memchr+0x6e>
    1aaa:	00000897          	auipc	a7,0x0
    1aae:	51e8b883          	ld	a7,1310(a7) # 1fc8 <MAX_TIME+0x8>
    1ab2:	00000817          	auipc	a6,0x0
    1ab6:	51e83803          	ld	a6,1310(a6) # 1fd0 <MAX_TIME+0x10>
    1aba:	431d                	li	t1,7
    1abc:	a029                	j	1ac6 <memchr+0x5a>
    1abe:	1661                	addi	a2,a2,-8
    1ac0:	07a1                	addi	a5,a5,8
    1ac2:	02c37963          	bgeu	t1,a2,1af4 <memchr+0x88>
    1ac6:	6398                	ld	a4,0(a5)
    1ac8:	8f29                	xor	a4,a4,a0
    1aca:	011706b3          	add	a3,a4,a7
    1ace:	fff74713          	not	a4,a4
    1ad2:	8f75                	and	a4,a4,a3
    1ad4:	01077733          	and	a4,a4,a6
    1ad8:	d37d                	beqz	a4,1abe <memchr+0x52>
    1ada:	853e                	mv	a0,a5
    1adc:	97b2                	add	a5,a5,a2
    1ade:	a021                	j	1ae6 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1ae0:	0505                	addi	a0,a0,1
    1ae2:	00f50763          	beq	a0,a5,1af0 <memchr+0x84>
    1ae6:	00054703          	lbu	a4,0(a0)
    1aea:	feb71be3          	bne	a4,a1,1ae0 <memchr+0x74>
    1aee:	8082                	ret
    return n ? (void *)s : 0;
    1af0:	4501                	li	a0,0
}
    1af2:	8082                	ret
    return n ? (void *)s : 0;
    1af4:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1af6:	f275                	bnez	a2,1ada <memchr+0x6e>
}
    1af8:	8082                	ret

0000000000001afa <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1afa:	1101                	addi	sp,sp,-32
    1afc:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1afe:	862e                	mv	a2,a1
{
    1b00:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1b02:	4581                	li	a1,0
{
    1b04:	e426                	sd	s1,8(sp)
    1b06:	ec06                	sd	ra,24(sp)
    1b08:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1b0a:	f63ff0ef          	jal	ra,1a6c <memchr>
    return p ? p - s : n;
    1b0e:	c519                	beqz	a0,1b1c <strnlen+0x22>
}
    1b10:	60e2                	ld	ra,24(sp)
    1b12:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1b14:	8d05                	sub	a0,a0,s1
}
    1b16:	64a2                	ld	s1,8(sp)
    1b18:	6105                	addi	sp,sp,32
    1b1a:	8082                	ret
    1b1c:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1b1e:	8522                	mv	a0,s0
}
    1b20:	6442                	ld	s0,16(sp)
    1b22:	64a2                	ld	s1,8(sp)
    1b24:	6105                	addi	sp,sp,32
    1b26:	8082                	ret

0000000000001b28 <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1b28:	00b547b3          	xor	a5,a0,a1
    1b2c:	8b9d                	andi	a5,a5,7
    1b2e:	eb95                	bnez	a5,1b62 <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1b30:	0075f793          	andi	a5,a1,7
    1b34:	e7b1                	bnez	a5,1b80 <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1b36:	6198                	ld	a4,0(a1)
    1b38:	00000617          	auipc	a2,0x0
    1b3c:	49063603          	ld	a2,1168(a2) # 1fc8 <MAX_TIME+0x8>
    1b40:	00000817          	auipc	a6,0x0
    1b44:	49083803          	ld	a6,1168(a6) # 1fd0 <MAX_TIME+0x10>
    1b48:	a029                	j	1b52 <stpcpy+0x2a>
    1b4a:	e118                	sd	a4,0(a0)
    1b4c:	6598                	ld	a4,8(a1)
    1b4e:	05a1                	addi	a1,a1,8
    1b50:	0521                	addi	a0,a0,8
    1b52:	00c707b3          	add	a5,a4,a2
    1b56:	fff74693          	not	a3,a4
    1b5a:	8ff5                	and	a5,a5,a3
    1b5c:	0107f7b3          	and	a5,a5,a6
    1b60:	d7ed                	beqz	a5,1b4a <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b62:	0005c783          	lbu	a5,0(a1)
    1b66:	00f50023          	sb	a5,0(a0)
    1b6a:	c785                	beqz	a5,1b92 <stpcpy+0x6a>
    1b6c:	0015c783          	lbu	a5,1(a1)
    1b70:	0505                	addi	a0,a0,1
    1b72:	0585                	addi	a1,a1,1
    1b74:	00f50023          	sb	a5,0(a0)
    1b78:	fbf5                	bnez	a5,1b6c <stpcpy+0x44>
        ;
    return d;
}
    1b7a:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1b7c:	0505                	addi	a0,a0,1
    1b7e:	df45                	beqz	a4,1b36 <stpcpy+0xe>
            if (!(*d = *s))
    1b80:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1b84:	0585                	addi	a1,a1,1
    1b86:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1b8a:	00f50023          	sb	a5,0(a0)
    1b8e:	f7fd                	bnez	a5,1b7c <stpcpy+0x54>
}
    1b90:	8082                	ret
    1b92:	8082                	ret

0000000000001b94 <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b94:	00b547b3          	xor	a5,a0,a1
    1b98:	8b9d                	andi	a5,a5,7
    1b9a:	1a079863          	bnez	a5,1d4a <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b9e:	0075f793          	andi	a5,a1,7
    1ba2:	16078463          	beqz	a5,1d0a <stpncpy+0x176>
    1ba6:	ea01                	bnez	a2,1bb6 <stpncpy+0x22>
    1ba8:	a421                	j	1db0 <stpncpy+0x21c>
    1baa:	167d                	addi	a2,a2,-1
    1bac:	0505                	addi	a0,a0,1
    1bae:	14070e63          	beqz	a4,1d0a <stpncpy+0x176>
    1bb2:	1a060863          	beqz	a2,1d62 <stpncpy+0x1ce>
    1bb6:	0005c783          	lbu	a5,0(a1)
    1bba:	0585                	addi	a1,a1,1
    1bbc:	0075f713          	andi	a4,a1,7
    1bc0:	00f50023          	sb	a5,0(a0)
    1bc4:	f3fd                	bnez	a5,1baa <stpncpy+0x16>
    1bc6:	4805                	li	a6,1
    1bc8:	1a061863          	bnez	a2,1d78 <stpncpy+0x1e4>
    1bcc:	40a007b3          	neg	a5,a0
    1bd0:	8b9d                	andi	a5,a5,7
    1bd2:	4681                	li	a3,0
    1bd4:	18061a63          	bnez	a2,1d68 <stpncpy+0x1d4>
    1bd8:	00778713          	addi	a4,a5,7
    1bdc:	45ad                	li	a1,11
    1bde:	18b76363          	bltu	a4,a1,1d64 <stpncpy+0x1d0>
    1be2:	1ae6eb63          	bltu	a3,a4,1d98 <stpncpy+0x204>
    1be6:	1a078363          	beqz	a5,1d8c <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bea:	00050023          	sb	zero,0(a0)
    1bee:	4685                	li	a3,1
    1bf0:	00150713          	addi	a4,a0,1
    1bf4:	18d78f63          	beq	a5,a3,1d92 <stpncpy+0x1fe>
    1bf8:	000500a3          	sb	zero,1(a0)
    1bfc:	4689                	li	a3,2
    1bfe:	00250713          	addi	a4,a0,2
    1c02:	18d78e63          	beq	a5,a3,1d9e <stpncpy+0x20a>
    1c06:	00050123          	sb	zero,2(a0)
    1c0a:	468d                	li	a3,3
    1c0c:	00350713          	addi	a4,a0,3
    1c10:	16d78c63          	beq	a5,a3,1d88 <stpncpy+0x1f4>
    1c14:	000501a3          	sb	zero,3(a0)
    1c18:	4691                	li	a3,4
    1c1a:	00450713          	addi	a4,a0,4
    1c1e:	18d78263          	beq	a5,a3,1da2 <stpncpy+0x20e>
    1c22:	00050223          	sb	zero,4(a0)
    1c26:	4695                	li	a3,5
    1c28:	00550713          	addi	a4,a0,5
    1c2c:	16d78d63          	beq	a5,a3,1da6 <stpncpy+0x212>
    1c30:	000502a3          	sb	zero,5(a0)
    1c34:	469d                	li	a3,7
    1c36:	00650713          	addi	a4,a0,6
    1c3a:	16d79863          	bne	a5,a3,1daa <stpncpy+0x216>
    1c3e:	00750713          	addi	a4,a0,7
    1c42:	00050323          	sb	zero,6(a0)
    1c46:	40f80833          	sub	a6,a6,a5
    1c4a:	ff887593          	andi	a1,a6,-8
    1c4e:	97aa                	add	a5,a5,a0
    1c50:	95be                	add	a1,a1,a5
    1c52:	0007b023          	sd	zero,0(a5)
    1c56:	07a1                	addi	a5,a5,8
    1c58:	feb79de3          	bne	a5,a1,1c52 <stpncpy+0xbe>
    1c5c:	ff887593          	andi	a1,a6,-8
    1c60:	9ead                	addw	a3,a3,a1
    1c62:	00b707b3          	add	a5,a4,a1
    1c66:	12b80863          	beq	a6,a1,1d96 <stpncpy+0x202>
    1c6a:	00078023          	sb	zero,0(a5)
    1c6e:	0016871b          	addiw	a4,a3,1
    1c72:	0ec77863          	bgeu	a4,a2,1d62 <stpncpy+0x1ce>
    1c76:	000780a3          	sb	zero,1(a5)
    1c7a:	0026871b          	addiw	a4,a3,2
    1c7e:	0ec77263          	bgeu	a4,a2,1d62 <stpncpy+0x1ce>
    1c82:	00078123          	sb	zero,2(a5)
    1c86:	0036871b          	addiw	a4,a3,3
    1c8a:	0cc77c63          	bgeu	a4,a2,1d62 <stpncpy+0x1ce>
    1c8e:	000781a3          	sb	zero,3(a5)
    1c92:	0046871b          	addiw	a4,a3,4
    1c96:	0cc77663          	bgeu	a4,a2,1d62 <stpncpy+0x1ce>
    1c9a:	00078223          	sb	zero,4(a5)
    1c9e:	0056871b          	addiw	a4,a3,5
    1ca2:	0cc77063          	bgeu	a4,a2,1d62 <stpncpy+0x1ce>
    1ca6:	000782a3          	sb	zero,5(a5)
    1caa:	0066871b          	addiw	a4,a3,6
    1cae:	0ac77a63          	bgeu	a4,a2,1d62 <stpncpy+0x1ce>
    1cb2:	00078323          	sb	zero,6(a5)
    1cb6:	0076871b          	addiw	a4,a3,7
    1cba:	0ac77463          	bgeu	a4,a2,1d62 <stpncpy+0x1ce>
    1cbe:	000783a3          	sb	zero,7(a5)
    1cc2:	0086871b          	addiw	a4,a3,8
    1cc6:	08c77e63          	bgeu	a4,a2,1d62 <stpncpy+0x1ce>
    1cca:	00078423          	sb	zero,8(a5)
    1cce:	0096871b          	addiw	a4,a3,9
    1cd2:	08c77863          	bgeu	a4,a2,1d62 <stpncpy+0x1ce>
    1cd6:	000784a3          	sb	zero,9(a5)
    1cda:	00a6871b          	addiw	a4,a3,10
    1cde:	08c77263          	bgeu	a4,a2,1d62 <stpncpy+0x1ce>
    1ce2:	00078523          	sb	zero,10(a5)
    1ce6:	00b6871b          	addiw	a4,a3,11
    1cea:	06c77c63          	bgeu	a4,a2,1d62 <stpncpy+0x1ce>
    1cee:	000785a3          	sb	zero,11(a5)
    1cf2:	00c6871b          	addiw	a4,a3,12
    1cf6:	06c77663          	bgeu	a4,a2,1d62 <stpncpy+0x1ce>
    1cfa:	00078623          	sb	zero,12(a5)
    1cfe:	26b5                	addiw	a3,a3,13
    1d00:	06c6f163          	bgeu	a3,a2,1d62 <stpncpy+0x1ce>
    1d04:	000786a3          	sb	zero,13(a5)
    1d08:	8082                	ret
            ;
        if (!n || !*s)
    1d0a:	c645                	beqz	a2,1db2 <stpncpy+0x21e>
    1d0c:	0005c783          	lbu	a5,0(a1)
    1d10:	ea078be3          	beqz	a5,1bc6 <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d14:	479d                	li	a5,7
    1d16:	02c7ff63          	bgeu	a5,a2,1d54 <stpncpy+0x1c0>
    1d1a:	00000897          	auipc	a7,0x0
    1d1e:	2ae8b883          	ld	a7,686(a7) # 1fc8 <MAX_TIME+0x8>
    1d22:	00000817          	auipc	a6,0x0
    1d26:	2ae83803          	ld	a6,686(a6) # 1fd0 <MAX_TIME+0x10>
    1d2a:	431d                	li	t1,7
    1d2c:	6198                	ld	a4,0(a1)
    1d2e:	011707b3          	add	a5,a4,a7
    1d32:	fff74693          	not	a3,a4
    1d36:	8ff5                	and	a5,a5,a3
    1d38:	0107f7b3          	and	a5,a5,a6
    1d3c:	ef81                	bnez	a5,1d54 <stpncpy+0x1c0>
            *wd = *ws;
    1d3e:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d40:	1661                	addi	a2,a2,-8
    1d42:	05a1                	addi	a1,a1,8
    1d44:	0521                	addi	a0,a0,8
    1d46:	fec363e3          	bltu	t1,a2,1d2c <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1d4a:	e609                	bnez	a2,1d54 <stpncpy+0x1c0>
    1d4c:	a08d                	j	1dae <stpncpy+0x21a>
    1d4e:	167d                	addi	a2,a2,-1
    1d50:	0505                	addi	a0,a0,1
    1d52:	ca01                	beqz	a2,1d62 <stpncpy+0x1ce>
    1d54:	0005c783          	lbu	a5,0(a1)
    1d58:	0585                	addi	a1,a1,1
    1d5a:	00f50023          	sb	a5,0(a0)
    1d5e:	fbe5                	bnez	a5,1d4e <stpncpy+0x1ba>
        ;
tail:
    1d60:	b59d                	j	1bc6 <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1d62:	8082                	ret
    1d64:	472d                	li	a4,11
    1d66:	bdb5                	j	1be2 <stpncpy+0x4e>
    1d68:	00778713          	addi	a4,a5,7
    1d6c:	45ad                	li	a1,11
    1d6e:	fff60693          	addi	a3,a2,-1
    1d72:	e6b778e3          	bgeu	a4,a1,1be2 <stpncpy+0x4e>
    1d76:	b7fd                	j	1d64 <stpncpy+0x1d0>
    1d78:	40a007b3          	neg	a5,a0
    1d7c:	8832                	mv	a6,a2
    1d7e:	8b9d                	andi	a5,a5,7
    1d80:	4681                	li	a3,0
    1d82:	e4060be3          	beqz	a2,1bd8 <stpncpy+0x44>
    1d86:	b7cd                	j	1d68 <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d88:	468d                	li	a3,3
    1d8a:	bd75                	j	1c46 <stpncpy+0xb2>
    1d8c:	872a                	mv	a4,a0
    1d8e:	4681                	li	a3,0
    1d90:	bd5d                	j	1c46 <stpncpy+0xb2>
    1d92:	4685                	li	a3,1
    1d94:	bd4d                	j	1c46 <stpncpy+0xb2>
    1d96:	8082                	ret
    1d98:	87aa                	mv	a5,a0
    1d9a:	4681                	li	a3,0
    1d9c:	b5f9                	j	1c6a <stpncpy+0xd6>
    1d9e:	4689                	li	a3,2
    1da0:	b55d                	j	1c46 <stpncpy+0xb2>
    1da2:	4691                	li	a3,4
    1da4:	b54d                	j	1c46 <stpncpy+0xb2>
    1da6:	4695                	li	a3,5
    1da8:	bd79                	j	1c46 <stpncpy+0xb2>
    1daa:	4699                	li	a3,6
    1dac:	bd69                	j	1c46 <stpncpy+0xb2>
    1dae:	8082                	ret
    1db0:	8082                	ret
    1db2:	8082                	ret

0000000000001db4 <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1db4:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1db8:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dba:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <close>:
    register long a7 __asm__("a7") = n;
    1dc2:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1dc6:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <read>:
    register long a7 __asm__("a7") = n;
    1dce:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd2:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1dd6:	8082                	ret

0000000000001dd8 <write>:
    register long a7 __asm__("a7") = n;
    1dd8:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ddc:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1de0:	8082                	ret

0000000000001de2 <getpid>:
    register long a7 __asm__("a7") = n;
    1de2:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1de6:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1dea:	2501                	sext.w	a0,a0
    1dec:	8082                	ret

0000000000001dee <sched_yield>:
    register long a7 __asm__("a7") = n;
    1dee:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1df2:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1df6:	2501                	sext.w	a0,a0
    1df8:	8082                	ret

0000000000001dfa <fork>:
    register long a7 __asm__("a7") = n;
    1dfa:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1dfe:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1e02:	2501                	sext.w	a0,a0
    1e04:	8082                	ret

0000000000001e06 <exit>:
    register long a7 __asm__("a7") = n;
    1e06:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e0a:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e0e:	8082                	ret

0000000000001e10 <waitpid>:
    register long a7 __asm__("a7") = n;
    1e10:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e14:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1e18:	2501                	sext.w	a0,a0
    1e1a:	8082                	ret

0000000000001e1c <exec>:
    register long a7 __asm__("a7") = n;
    1e1c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e20:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e24:	2501                	sext.w	a0,a0
    1e26:	8082                	ret

0000000000001e28 <get_time>:

int64 get_time()
{
    1e28:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e2a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e2e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e30:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e32:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e36:	2501                	sext.w	a0,a0
    1e38:	ed09                	bnez	a0,1e52 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e3a:	67a2                	ld	a5,8(sp)
    1e3c:	3e800713          	li	a4,1000
    1e40:	00015503          	lhu	a0,0(sp)
    1e44:	02e7d7b3          	divu	a5,a5,a4
    1e48:	02e50533          	mul	a0,a0,a4
    1e4c:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e4e:	0141                	addi	sp,sp,16
    1e50:	8082                	ret
        return -1;
    1e52:	557d                	li	a0,-1
    1e54:	bfed                	j	1e4e <get_time+0x26>

0000000000001e56 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e56:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5a:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <sleep>:

int sleep(unsigned long long time)
{
    1e62:	1141                	addi	sp,sp,-16
    1e64:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1e66:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e6a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e6c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e6e:	00000073          	ecall
    if (err == 0)
    1e72:	2501                	sext.w	a0,a0
    1e74:	e13d                	bnez	a0,1eda <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e76:	6722                	ld	a4,8(sp)
    1e78:	3e800693          	li	a3,1000
    1e7c:	00015783          	lhu	a5,0(sp)
    1e80:	02d75733          	divu	a4,a4,a3
    1e84:	02d787b3          	mul	a5,a5,a3
    1e88:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1e8a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e8e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e90:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e92:	00000073          	ecall
    if (err == 0)
    1e96:	2501                	sext.w	a0,a0
    1e98:	ed15                	bnez	a0,1ed4 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e9a:	6841                	lui	a6,0x10
    1e9c:	963e                	add	a2,a2,a5
    1e9e:	187d                	addi	a6,a6,-1
    1ea0:	3e800693          	li	a3,1000
    1ea4:	a819                	j	1eba <sleep+0x58>
    __asm_syscall("r"(a7))
    1ea6:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1eaa:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1eae:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1eb0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb2:	00000073          	ecall
    if (err == 0)
    1eb6:	2501                	sext.w	a0,a0
    1eb8:	ed11                	bnez	a0,1ed4 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1eba:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1ebc:	07c00893          	li	a7,124
    1ec0:	02d7d733          	divu	a4,a5,a3
    1ec4:	6782                	ld	a5,0(sp)
    1ec6:	0107f7b3          	and	a5,a5,a6
    1eca:	02d787b3          	mul	a5,a5,a3
    1ece:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1ed0:	fcc7ebe3          	bltu	a5,a2,1ea6 <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1ed4:	4501                	li	a0,0
    1ed6:	0141                	addi	sp,sp,16
    1ed8:	8082                	ret
    1eda:	57fd                	li	a5,-1
    1edc:	b77d                	j	1e8a <sleep+0x28>

0000000000001ede <set_priority>:
    register long a7 __asm__("a7") = n;
    1ede:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1ee2:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1ee6:	2501                	sext.w	a0,a0
    1ee8:	8082                	ret

0000000000001eea <mmap>:
    register long a7 __asm__("a7") = n;
    1eea:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eee:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1ef2:	2501                	sext.w	a0,a0
    1ef4:	8082                	ret

0000000000001ef6 <munmap>:
    register long a7 __asm__("a7") = n;
    1ef6:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1efa:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1efe:	2501                	sext.w	a0,a0
    1f00:	8082                	ret

0000000000001f02 <wait>:

int wait(int *code)
{
    1f02:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f04:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1f08:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f0a:	00000073          	ecall
    return waitpid(-1, code);
}
    1f0e:	2501                	sext.w	a0,a0
    1f10:	8082                	ret

0000000000001f12 <spawn>:
    register long a7 __asm__("a7") = n;
    1f12:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1f16:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f1a:	2501                	sext.w	a0,a0
    1f1c:	8082                	ret

0000000000001f1e <mailread>:
    register long a7 __asm__("a7") = n;
    1f1e:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f22:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f26:	2501                	sext.w	a0,a0
    1f28:	8082                	ret

0000000000001f2a <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f2a:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f2e:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f32:	2501                	sext.w	a0,a0
    1f34:	8082                	ret

0000000000001f36 <fstat>:
    register long a7 __asm__("a7") = n;
    1f36:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f3a:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f3e:	2501                	sext.w	a0,a0
    1f40:	8082                	ret

0000000000001f42 <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1f42:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f44:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f48:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f4a:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f4e:	2501                	sext.w	a0,a0
    1f50:	8082                	ret

0000000000001f52 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f52:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f54:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f58:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f5a:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f5e:	2501                	sext.w	a0,a0
    1f60:	8082                	ret

0000000000001f62 <link>:

int link(char *old_path, char *new_path)
{
    1f62:	87aa                	mv	a5,a0
    1f64:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f66:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f6a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f6e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f70:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f74:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f76:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f7a:	2501                	sext.w	a0,a0
    1f7c:	8082                	ret

0000000000001f7e <unlink>:

int unlink(char *path)
{
    1f7e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f80:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f84:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f88:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f8a:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f8e:	2501                	sext.w	a0,a0
    1f90:	8082                	ret
