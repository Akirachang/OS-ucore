
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch5_getchar:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0720006f          	j	1074 <__start_main>

0000000000001006 <main>:
*/

const uint64 N = 10;

int main()
{
    1006:	7179                	addi	sp,sp,-48
    printf("please enter %d letters.\n", N);
    1008:	45a9                	li	a1,10
    100a:	00001517          	auipc	a0,0x1
    100e:	f8e50513          	addi	a0,a0,-114 # 1f98 <unlink+0x18>
{
    1012:	f406                	sd	ra,40(sp)
    1014:	f022                	sd	s0,32(sp)
    1016:	ec26                	sd	s1,24(sp)
    1018:	e84a                	sd	s2,16(sp)
    printf("please enter %d letters.\n", N);
    101a:	0ec000ef          	jal	ra,1106 <printf>
    char line[N];
    memset(line, 0, N);
    101e:	850a                	mv	a0,sp
    1020:	842a                	mv	s0,a0
    1022:	4629                	li	a2,10
    1024:	4581                	li	a1,0
    1026:	7e4000ef          	jal	ra,180a <memset>
    for (int idx = 0; idx < N; ++idx)
    102a:	00a10913          	addi	s2,sp,10
    memset(line, 0, N);
    102e:	84a2                	mv	s1,s0
    {
        char c = getchar();
    1030:	058000ef          	jal	ra,1088 <getchar>
    1034:	00a48023          	sb	a0,0(s1)
    for (int idx = 0; idx < N; ++idx)
    1038:	0485                	addi	s1,s1,1
    103a:	ff249be3          	bne	s1,s2,1030 <main+0x2a>
        line[idx] = c;
    }
    printf("%d letters entered\n", N);
    103e:	45a9                	li	a1,10
    1040:	00001517          	auipc	a0,0x1
    1044:	f7850513          	addi	a0,a0,-136 # 1fb8 <unlink+0x38>
    1048:	0be000ef          	jal	ra,1106 <printf>
    for (int idx = 0; idx < N; ++idx)
    {
        putchar(line[idx]);
    104c:	00044503          	lbu	a0,0(s0)
    1050:	0405                	addi	s0,s0,1
    1052:	054000ef          	jal	ra,10a6 <putchar>
    for (int idx = 0; idx < N; ++idx)
    1056:	ff241be3          	bne	s0,s2,104c <main+0x46>
    }
    puts("Test getchar passed!");
    105a:	00001517          	auipc	a0,0x1
    105e:	f7650513          	addi	a0,a0,-138 # 1fd0 <unlink+0x50>
    1062:	062000ef          	jal	ra,10c4 <puts>
    return 0;
    1066:	70a2                	ld	ra,40(sp)
    1068:	7402                	ld	s0,32(sp)
    106a:	64e2                	ld	s1,24(sp)
    106c:	6942                	ld	s2,16(sp)
    106e:	4501                	li	a0,0
    1070:	6145                	addi	sp,sp,48
    1072:	8082                	ret

0000000000001074 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1074:	1141                	addi	sp,sp,-16
    1076:	e406                	sd	ra,8(sp)
    exit(main());
    1078:	f8fff0ef          	jal	ra,1006 <main>
    107c:	58d000ef          	jal	ra,1e08 <exit>
    return 0;
}
    1080:	60a2                	ld	ra,8(sp)
    1082:	4501                	li	a0,0
    1084:	0141                	addi	sp,sp,16
    1086:	8082                	ret

0000000000001088 <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    1088:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    108a:	00f10593          	addi	a1,sp,15
    108e:	4605                	li	a2,1
    1090:	4501                	li	a0,0
{
    1092:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1094:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1098:	539000ef          	jal	ra,1dd0 <read>
    return byte;
}
    109c:	60e2                	ld	ra,24(sp)
    109e:	00f14503          	lbu	a0,15(sp)
    10a2:	6105                	addi	sp,sp,32
    10a4:	8082                	ret

00000000000010a6 <putchar>:

int putchar(int c)
{
    10a6:	1101                	addi	sp,sp,-32
    10a8:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    10aa:	00f10593          	addi	a1,sp,15
    10ae:	4605                	li	a2,1
    10b0:	4505                	li	a0,1
{
    10b2:	ec06                	sd	ra,24(sp)
    char byte = c;
    10b4:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    10b8:	523000ef          	jal	ra,1dda <write>
}
    10bc:	60e2                	ld	ra,24(sp)
    10be:	2501                	sext.w	a0,a0
    10c0:	6105                	addi	sp,sp,32
    10c2:	8082                	ret

00000000000010c4 <puts>:

int puts(const char *s)
{
    10c4:	1101                	addi	sp,sp,-32
    10c6:	e822                	sd	s0,16(sp)
    10c8:	ec06                	sd	ra,24(sp)
    10ca:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    10cc:	145000ef          	jal	ra,1a10 <strlen>
    10d0:	862a                	mv	a2,a0
    10d2:	85a2                	mv	a1,s0
    10d4:	4505                	li	a0,1
    10d6:	505000ef          	jal	ra,1dda <write>
    10da:	00055763          	bgez	a0,10e8 <puts+0x24>
    return r;
}
    10de:	60e2                	ld	ra,24(sp)
    10e0:	6442                	ld	s0,16(sp)
    10e2:	557d                	li	a0,-1
    10e4:	6105                	addi	sp,sp,32
    10e6:	8082                	ret
    return write(stdout, &byte, 1);
    10e8:	00f10593          	addi	a1,sp,15
    char byte = c;
    10ec:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    10ee:	4605                	li	a2,1
    10f0:	4505                	li	a0,1
    char byte = c;
    10f2:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    10f6:	4e5000ef          	jal	ra,1dda <write>
}
    10fa:	60e2                	ld	ra,24(sp)
    10fc:	6442                	ld	s0,16(sp)
    10fe:	41f5551b          	sraiw	a0,a0,0x1f
    1102:	6105                	addi	sp,sp,32
    1104:	8082                	ret

0000000000001106 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1106:	7131                	addi	sp,sp,-192
    1108:	ecce                	sd	s3,88(sp)
    110a:	e8d2                	sd	s4,80(sp)
    110c:	e4d6                	sd	s5,72(sp)
    110e:	e0da                	sd	s6,64(sp)
    1110:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    1112:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1114:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    1116:	6ae1                	lui	s5,0x18
    1118:	000f4a37          	lui	s4,0xf4
    111c:	00989b37          	lui	s6,0x989
{
    1120:	fc86                	sd	ra,120(sp)
    1122:	f8a2                	sd	s0,112(sp)
    1124:	f4a6                	sd	s1,104(sp)
    1126:	f0ca                	sd	s2,96(sp)
    1128:	fc5e                	sd	s7,56(sp)
    112a:	e52e                	sd	a1,136(sp)
    112c:	e932                	sd	a2,144(sp)
    112e:	ed36                	sd	a3,152(sp)
    1130:	f13a                	sd	a4,160(sp)
    1132:	f942                	sd	a6,176(sp)
    1134:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1136:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    1138:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x6ff>
    113c:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x1668f>
    1140:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf222f>
    1144:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x98766f>
    for (;;)
    {
        if (!*s)
    1148:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    114c:	02500913          	li	s2,37
        if (!*s)
    1150:	1a078f63          	beqz	a5,130e <printf+0x208>
    1154:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1156:	17278e63          	beq	a5,s2,12d2 <printf+0x1cc>
    115a:	00164783          	lbu	a5,1(a2)
    115e:	0605                	addi	a2,a2,1
    1160:	fbfd                	bnez	a5,1156 <printf+0x50>
    1162:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    1164:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1168:	85aa                	mv	a1,a0
    116a:	8622                	mv	a2,s0
    116c:	4505                	li	a0,1
    116e:	46d000ef          	jal	ra,1dda <write>
        out(f, a, l);
        if (l)
    1172:	18041963          	bnez	s0,1304 <printf+0x1fe>
            continue;
        if (s[1] == 0)
    1176:	0014c783          	lbu	a5,1(s1)
    117a:	18078a63          	beqz	a5,130e <printf+0x208>
            break;
        switch (s[1])
    117e:	07300713          	li	a4,115
    1182:	28e78e63          	beq	a5,a4,141e <printf+0x318>
    1186:	18f76f63          	bltu	a4,a5,1324 <printf+0x21e>
    118a:	06400713          	li	a4,100
    118e:	2ae78c63          	beq	a5,a4,1446 <printf+0x340>
    1192:	07000713          	li	a4,112
    1196:	3ce79c63          	bne	a5,a4,156e <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    119a:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    119c:	00001797          	auipc	a5,0x1
    11a0:	e7478793          	addi	a5,a5,-396 # 2010 <digits>
            printptr(va_arg(ap, uint64));
    11a4:	6298                	ld	a4,0(a3)
    11a6:	00868093          	addi	ra,a3,8
    11aa:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    11ac:	00471293          	slli	t0,a4,0x4
    11b0:	00c71f13          	slli	t5,a4,0xc
    11b4:	01471e13          	slli	t3,a4,0x14
    11b8:	01c71893          	slli	a7,a4,0x1c
    11bc:	02471813          	slli	a6,a4,0x24
    11c0:	02871513          	slli	a0,a4,0x28
    11c4:	02c71593          	slli	a1,a4,0x2c
    11c8:	03071693          	slli	a3,a4,0x30
    11cc:	00871f93          	slli	t6,a4,0x8
    11d0:	01071e93          	slli	t4,a4,0x10
    11d4:	01871313          	slli	t1,a4,0x18
    11d8:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    11dc:	03c2d293          	srli	t0,t0,0x3c
    11e0:	03cf5f13          	srli	t5,t5,0x3c
    11e4:	03ce5e13          	srli	t3,t3,0x3c
    11e8:	03c8d893          	srli	a7,a7,0x3c
    11ec:	03c85813          	srli	a6,a6,0x3c
    11f0:	9171                	srli	a0,a0,0x3c
    11f2:	91f1                	srli	a1,a1,0x3c
    11f4:	92f1                	srli	a3,a3,0x3c
    11f6:	92be                	add	t0,t0,a5
    11f8:	9f3e                	add	t5,t5,a5
    11fa:	9e3e                	add	t3,t3,a5
    11fc:	98be                	add	a7,a7,a5
    11fe:	983e                	add	a6,a6,a5
    1200:	953e                	add	a0,a0,a5
    1202:	95be                	add	a1,a1,a5
    1204:	96be                	add	a3,a3,a5
    1206:	03c75393          	srli	t2,a4,0x3c
    120a:	01c75b9b          	srliw	s7,a4,0x1c
    120e:	03cfdf93          	srli	t6,t6,0x3c
    1212:	03cede93          	srli	t4,t4,0x3c
    1216:	03c35313          	srli	t1,t1,0x3c
    121a:	9271                	srli	a2,a2,0x3c
    121c:	0002c403          	lbu	s0,0(t0)
    1220:	93be                	add	t2,t2,a5
    1222:	000f4283          	lbu	t0,0(t5)
    1226:	9fbe                	add	t6,t6,a5
    1228:	000e4f03          	lbu	t5,0(t3)
    122c:	9ebe                	add	t4,t4,a5
    122e:	0008ce03          	lbu	t3,0(a7)
    1232:	933e                	add	t1,t1,a5
    1234:	00084883          	lbu	a7,0(a6)
    1238:	9bbe                	add	s7,s7,a5
    123a:	00054803          	lbu	a6,0(a0)
    123e:	963e                	add	a2,a2,a5
    1240:	0005c503          	lbu	a0,0(a1)
    1244:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1248:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    124c:	0003c903          	lbu	s2,0(t2)
    1250:	00064603          	lbu	a2,0(a2)
    1254:	000fc383          	lbu	t2,0(t6)
    1258:	8b3d                	andi	a4,a4,15
    125a:	000ecf83          	lbu	t6,0(t4)
    125e:	92f1                	srli	a3,a3,0x3c
    1260:	00034e83          	lbu	t4,0(t1)
    1264:	000bc303          	lbu	t1,0(s7)
    1268:	96be                	add	a3,a3,a5
    126a:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    126c:	7761                	lui	a4,0xffff8
    126e:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1272:	00710623          	sb	t2,12(sp)
    1276:	005106a3          	sb	t0,13(sp)
    127a:	01f10723          	sb	t6,14(sp)
    127e:	01e107a3          	sb	t5,15(sp)
    1282:	01d10823          	sb	t4,16(sp)
    1286:	01c108a3          	sb	t3,17(sp)
    128a:	00610923          	sb	t1,18(sp)
    128e:	011109a3          	sb	a7,19(sp)
    1292:	01010a23          	sb	a6,20(sp)
    1296:	00a10aa3          	sb	a0,21(sp)
    129a:	00b10b23          	sb	a1,22(sp)
    129e:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    12a2:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12a6:	01210523          	sb	s2,10(sp)
    12aa:	008105a3          	sb	s0,11(sp)
    12ae:	0006c703          	lbu	a4,0(a3)
    12b2:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    12b6:	4649                	li	a2,18
    12b8:	002c                	addi	a1,sp,8
    12ba:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12bc:	00e10c23          	sb	a4,24(sp)
    12c0:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    12c4:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    12c8:	313000ef          	jal	ra,1dda <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    12cc:	00248513          	addi	a0,s1,2
    12d0:	bda5                	j	1148 <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    12d2:	00064783          	lbu	a5,0(a2)
    12d6:	84b2                	mv	s1,a2
    12d8:	01278963          	beq	a5,s2,12ea <printf+0x1e4>
    12dc:	b561                	j	1164 <printf+0x5e>
    12de:	0024c783          	lbu	a5,2(s1)
    12e2:	0605                	addi	a2,a2,1
    12e4:	0489                	addi	s1,s1,2
    12e6:	e7279fe3          	bne	a5,s2,1164 <printf+0x5e>
    12ea:	0014c783          	lbu	a5,1(s1)
    12ee:	ff2788e3          	beq	a5,s2,12de <printf+0x1d8>
        l = z - a;
    12f2:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    12f6:	85aa                	mv	a1,a0
    12f8:	8622                	mv	a2,s0
    12fa:	4505                	li	a0,1
    12fc:	2df000ef          	jal	ra,1dda <write>
        if (l)
    1300:	e6040be3          	beqz	s0,1176 <printf+0x70>
    1304:	8526                	mv	a0,s1
        if (!*s)
    1306:	00054783          	lbu	a5,0(a0)
    130a:	e40795e3          	bnez	a5,1154 <printf+0x4e>
    }
    va_end(ap);
    130e:	70e6                	ld	ra,120(sp)
    1310:	7446                	ld	s0,112(sp)
    1312:	74a6                	ld	s1,104(sp)
    1314:	7906                	ld	s2,96(sp)
    1316:	69e6                	ld	s3,88(sp)
    1318:	6a46                	ld	s4,80(sp)
    131a:	6aa6                	ld	s5,72(sp)
    131c:	6b06                	ld	s6,64(sp)
    131e:	7be2                	ld	s7,56(sp)
    1320:	6129                	addi	sp,sp,192
    1322:	8082                	ret
        switch (s[1])
    1324:	07800713          	li	a4,120
    1328:	24e79363          	bne	a5,a4,156e <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    132c:	6782                	ld	a5,0(sp)
    132e:	4394                	lw	a3,0(a5)
    1330:	07a1                	addi	a5,a5,8
    1332:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1334:	2606c263          	bltz	a3,1598 <printf+0x492>
        buf[i--] = digits[x % base];
    1338:	00001797          	auipc	a5,0x1
    133c:	cd878793          	addi	a5,a5,-808 # 2010 <digits>
    1340:	00f6f713          	andi	a4,a3,15
    1344:	973e                	add	a4,a4,a5
    1346:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff5ff0>
    buf[16] = 0;
    134a:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    134e:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    1350:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1354:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    1358:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    135c:	0046d51b          	srliw	a0,a3,0x4
    1360:	0ad5d563          	bge	a1,a3,140a <printf+0x304>
        buf[i--] = digits[x % base];
    1364:	8a3d                	andi	a2,a2,15
    1366:	963e                	add	a2,a2,a5
    1368:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    136c:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    1370:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1374:	30a5fe63          	bgeu	a1,a0,1690 <printf+0x58a>
        buf[i--] = digits[x % base];
    1378:	00f77613          	andi	a2,a4,15
    137c:	963e                	add	a2,a2,a5
    137e:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1382:	45bd                	li	a1,15
    1384:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    1388:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    138c:	00475513          	srli	a0,a4,0x4
    1390:	30e5f963          	bgeu	a1,a4,16a2 <printf+0x59c>
        buf[i--] = digits[x % base];
    1394:	8a3d                	andi	a2,a2,15
    1396:	963e                	add	a2,a2,a5
    1398:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    139c:	00875893          	srli	a7,a4,0x8
    13a0:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    13a4:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    13a8:	30a5fd63          	bgeu	a1,a0,16c2 <printf+0x5bc>
        buf[i--] = digits[x % base];
    13ac:	8a3d                	andi	a2,a2,15
    13ae:	963e                	add	a2,a2,a5
    13b0:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13b4:	00c75813          	srli	a6,a4,0xc
    13b8:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    13bc:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    13c0:	3315fe63          	bgeu	a1,a7,16fc <printf+0x5f6>
        buf[i--] = digits[x % base];
    13c4:	8a3d                	andi	a2,a2,15
    13c6:	963e                	add	a2,a2,a5
    13c8:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13cc:	01075893          	srli	a7,a4,0x10
    13d0:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    13d4:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    13d8:	3305ff63          	bgeu	a1,a6,1716 <printf+0x610>
        buf[i--] = digits[x % base];
    13dc:	8a3d                	andi	a2,a2,15
    13de:	963e                	add	a2,a2,a5
    13e0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    13e4:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    13e8:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    13ec:	3515f863          	bgeu	a1,a7,173c <printf+0x636>
        buf[i--] = digits[x % base];
    13f0:	97ba                	add	a5,a5,a4
    13f2:	0007c783          	lbu	a5,0(a5)
    13f6:	45a1                	li	a1,8
    13f8:	00f10823          	sb	a5,16(sp)
    if (sign)
    13fc:	0006d763          	bgez	a3,140a <printf+0x304>
        buf[i--] = '-';
    1400:	02d00793          	li	a5,45
    1404:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1408:	459d                	li	a1,7
    write(f, s, l);
    140a:	4641                	li	a2,16
    140c:	003c                	addi	a5,sp,8
    140e:	9e0d                	subw	a2,a2,a1
    1410:	4505                	li	a0,1
    1412:	95be                	add	a1,a1,a5
    1414:	1c7000ef          	jal	ra,1dda <write>
        s += 2;
    1418:	00248513          	addi	a0,s1,2
    141c:	b335                	j	1148 <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    141e:	6782                	ld	a5,0(sp)
    1420:	6380                	ld	s0,0(a5)
    1422:	07a1                	addi	a5,a5,8
    1424:	e03e                	sd	a5,0(sp)
    1426:	22040a63          	beqz	s0,165a <printf+0x554>
            l = strnlen(a, 200);
    142a:	0c800593          	li	a1,200
    142e:	8522                	mv	a0,s0
    1430:	6cc000ef          	jal	ra,1afc <strnlen>
    write(f, s, l);
    1434:	0005061b          	sext.w	a2,a0
    1438:	85a2                	mv	a1,s0
    143a:	4505                	li	a0,1
    143c:	19f000ef          	jal	ra,1dda <write>
        s += 2;
    1440:	00248513          	addi	a0,s1,2
    1444:	b311                	j	1148 <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    1446:	6782                	ld	a5,0(sp)
    1448:	4390                	lw	a2,0(a5)
    144a:	07a1                	addi	a5,a5,8
    144c:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    144e:	1a064363          	bltz	a2,15f4 <printf+0x4ee>
        buf[i--] = digits[x % base];
    1452:	46a9                	li	a3,10
    1454:	02d6773b          	remuw	a4,a2,a3
    1458:	00001797          	auipc	a5,0x1
    145c:	bb878793          	addi	a5,a5,-1096 # 2010 <digits>
    buf[16] = 0;
    1460:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1464:	4525                	li	a0,9
        x = xx;
    1466:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    146a:	973e                	add	a4,a4,a5
    146c:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    1470:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    1474:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1478:	2cc55063          	bge	a0,a2,1738 <printf+0x632>
    147c:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1480:	02d5f73b          	remuw	a4,a1,a3
    1484:	1702                	slli	a4,a4,0x20
    1486:	9301                	srli	a4,a4,0x20
    1488:	973e                	add	a4,a4,a5
    148a:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    148e:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    1492:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    1496:	1f057d63          	bgeu	a0,a6,1690 <printf+0x58a>
        buf[i--] = digits[x % base];
    149a:	4529                	li	a0,10
    } while ((x /= base) != 0);
    149c:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    149e:	02a5f73b          	remuw	a4,a1,a0
    14a2:	973e                	add	a4,a4,a5
    14a4:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    14a8:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    14ac:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    14b0:	1ab6f163          	bgeu	a3,a1,1652 <printf+0x54c>
    14b4:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    14b8:	02a776bb          	remuw	a3,a4,a0
    14bc:	96be                	add	a3,a3,a5
    14be:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14c2:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14c6:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    14ca:	20b87c63          	bgeu	a6,a1,16e2 <printf+0x5dc>
    14ce:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    14d2:	02a776bb          	remuw	a3,a4,a0
    14d6:	96be                	add	a3,a3,a5
    14d8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14dc:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14e0:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    14e4:	20b87363          	bgeu	a6,a1,16ea <printf+0x5e4>
        buf[i--] = digits[x % base];
    14e8:	02a776bb          	remuw	a3,a4,a0
    14ec:	96be                	add	a3,a3,a5
    14ee:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14f2:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14f6:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    14fa:	20b9f563          	bgeu	s3,a1,1704 <printf+0x5fe>
        buf[i--] = digits[x % base];
    14fe:	02a776bb          	remuw	a3,a4,a0
    1502:	96be                	add	a3,a3,a5
    1504:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1508:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    150c:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1510:	20bafb63          	bgeu	s5,a1,1726 <printf+0x620>
        buf[i--] = digits[x % base];
    1514:	02a776bb          	remuw	a3,a4,a0
    1518:	96be                	add	a3,a3,a5
    151a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    151e:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1522:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1526:	1eba7c63          	bgeu	s4,a1,171e <printf+0x618>
        buf[i--] = digits[x % base];
    152a:	02a776bb          	remuw	a3,a4,a0
    152e:	96be                	add	a3,a3,a5
    1530:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1534:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1538:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    153c:	14bb7163          	bgeu	s6,a1,167e <printf+0x578>
        buf[i--] = digits[x % base];
    1540:	1702                	slli	a4,a4,0x20
    1542:	9301                	srli	a4,a4,0x20
    1544:	97ba                	add	a5,a5,a4
    1546:	0007c783          	lbu	a5,0(a5)
    154a:	4599                	li	a1,6
    154c:	00f10723          	sb	a5,14(sp)
    if (sign)
    1550:	ea065de3          	bgez	a2,140a <printf+0x304>
        buf[i--] = '-';
    1554:	02d00793          	li	a5,45
    1558:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    155c:	4595                	li	a1,5
    write(f, s, l);
    155e:	003c                	addi	a5,sp,8
    1560:	4641                	li	a2,16
    1562:	9e0d                	subw	a2,a2,a1
    1564:	4505                	li	a0,1
    1566:	95be                	add	a1,a1,a5
    1568:	073000ef          	jal	ra,1dda <write>
    156c:	b575                	j	1418 <printf+0x312>
    char byte = c;
    156e:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1572:	4605                	li	a2,1
    1574:	002c                	addi	a1,sp,8
    1576:	4505                	li	a0,1
    char byte = c;
    1578:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    157c:	05f000ef          	jal	ra,1dda <write>
    char byte = c;
    1580:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1584:	4605                	li	a2,1
    1586:	002c                	addi	a1,sp,8
    1588:	4505                	li	a0,1
    char byte = c;
    158a:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    158e:	04d000ef          	jal	ra,1dda <write>
        s += 2;
    1592:	00248513          	addi	a0,s1,2
    1596:	be4d                	j	1148 <printf+0x42>
        x = -xx;
    1598:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    159c:	00001797          	auipc	a5,0x1
    15a0:	a7478793          	addi	a5,a5,-1420 # 2010 <digits>
    15a4:	00f77613          	andi	a2,a4,15
    15a8:	963e                	add	a2,a2,a5
    15aa:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    15ae:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    15b2:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    15b4:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    15b8:	0047551b          	srliw	a0,a4,0x4
    15bc:	0047561b          	srliw	a2,a4,0x4
    15c0:	0ab6d263          	bge	a3,a1,1664 <printf+0x55e>
        buf[i--] = digits[x % base];
    15c4:	8a3d                	andi	a2,a2,15
    15c6:	963e                	add	a2,a2,a5
    15c8:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    15cc:	463d                	li	a2,15
    15ce:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    15d2:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    15d6:	daa661e3          	bltu	a2,a0,1378 <printf+0x272>
        buf[i--] = '-';
    15da:	02d00793          	li	a5,45
    15de:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    15e2:	45b5                	li	a1,13
    write(f, s, l);
    15e4:	003c                	addi	a5,sp,8
    15e6:	4641                	li	a2,16
    15e8:	9e0d                	subw	a2,a2,a1
    15ea:	4505                	li	a0,1
    15ec:	95be                	add	a1,a1,a5
    15ee:	7ec000ef          	jal	ra,1dda <write>
    15f2:	b51d                	j	1418 <printf+0x312>
        x = -xx;
    15f4:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    15f8:	46a9                	li	a3,10
    15fa:	02d875bb          	remuw	a1,a6,a3
    15fe:	00001797          	auipc	a5,0x1
    1602:	a1278793          	addi	a5,a5,-1518 # 2010 <digits>
    buf[16] = 0;
    1606:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    160a:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    160c:	95be                	add	a1,a1,a5
    160e:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    1612:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    1616:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    161a:	04a65563          	bge	a2,a0,1664 <printf+0x55e>
    161e:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1622:	02d775bb          	remuw	a1,a4,a3
    1626:	95be                	add	a1,a1,a5
    1628:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    162c:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    1630:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    1634:	fb0573e3          	bgeu	a0,a6,15da <printf+0x4d4>
        buf[i--] = digits[x % base];
    1638:	4529                	li	a0,10
    } while ((x /= base) != 0);
    163a:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    163c:	02a5f73b          	remuw	a4,a1,a0
    1640:	973e                	add	a4,a4,a5
    1642:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    1646:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    164a:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    164e:	e6b6e3e3          	bltu	a3,a1,14b4 <printf+0x3ae>
        buf[i--] = digits[x % base];
    1652:	45b5                	li	a1,13
    if (sign)
    1654:	da065be3          	bgez	a2,140a <printf+0x304>
    1658:	a881                	j	16a8 <printf+0x5a2>
                a = "(null)";
    165a:	00001417          	auipc	s0,0x1
    165e:	98e40413          	addi	s0,s0,-1650 # 1fe8 <unlink+0x68>
    1662:	b3e1                	j	142a <printf+0x324>
        buf[i--] = '-';
    1664:	02d00793          	li	a5,45
    1668:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    166c:	45b9                	li	a1,14
    write(f, s, l);
    166e:	003c                	addi	a5,sp,8
    1670:	4641                	li	a2,16
    1672:	9e0d                	subw	a2,a2,a1
    1674:	4505                	li	a0,1
    1676:	95be                	add	a1,a1,a5
    1678:	762000ef          	jal	ra,1dda <write>
    167c:	bb71                	j	1418 <printf+0x312>
        buf[i--] = digits[x % base];
    167e:	459d                	li	a1,7
    if (sign)
    1680:	d80655e3          	bgez	a2,140a <printf+0x304>
        buf[i--] = '-';
    1684:	02d00793          	li	a5,45
    1688:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    168c:	4599                	li	a1,6
    168e:	bbb5                	j	140a <printf+0x304>
    1690:	45b9                	li	a1,14
    write(f, s, l);
    1692:	003c                	addi	a5,sp,8
    1694:	4641                	li	a2,16
    1696:	9e0d                	subw	a2,a2,a1
    1698:	4505                	li	a0,1
    169a:	95be                	add	a1,a1,a5
    169c:	73e000ef          	jal	ra,1dda <write>
    16a0:	bba5                	j	1418 <printf+0x312>
        buf[i--] = digits[x % base];
    16a2:	45b5                	li	a1,13
    if (sign)
    16a4:	d606d3e3          	bgez	a3,140a <printf+0x304>
        buf[i--] = '-';
    16a8:	02d00793          	li	a5,45
    16ac:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    16b0:	45b1                	li	a1,12
    write(f, s, l);
    16b2:	003c                	addi	a5,sp,8
    16b4:	4641                	li	a2,16
    16b6:	9e0d                	subw	a2,a2,a1
    16b8:	4505                	li	a0,1
    16ba:	95be                	add	a1,a1,a5
    16bc:	71e000ef          	jal	ra,1dda <write>
    16c0:	bba1                	j	1418 <printf+0x312>
        buf[i--] = digits[x % base];
    16c2:	45b1                	li	a1,12
    if (sign)
    16c4:	d406d3e3          	bgez	a3,140a <printf+0x304>
        buf[i--] = '-';
    16c8:	02d00793          	li	a5,45
    16cc:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    16d0:	45ad                	li	a1,11
    write(f, s, l);
    16d2:	003c                	addi	a5,sp,8
    16d4:	4641                	li	a2,16
    16d6:	9e0d                	subw	a2,a2,a1
    16d8:	4505                	li	a0,1
    16da:	95be                	add	a1,a1,a5
    16dc:	6fe000ef          	jal	ra,1dda <write>
    16e0:	bb25                	j	1418 <printf+0x312>
        buf[i--] = digits[x % base];
    16e2:	45b1                	li	a1,12
    if (sign)
    16e4:	d20653e3          	bgez	a2,140a <printf+0x304>
    16e8:	b7c5                	j	16c8 <printf+0x5c2>
        buf[i--] = digits[x % base];
    16ea:	45ad                	li	a1,11
    if (sign)
    16ec:	d0065fe3          	bgez	a2,140a <printf+0x304>
        buf[i--] = '-';
    16f0:	02d00793          	li	a5,45
    16f4:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    16f8:	45a9                	li	a1,10
    16fa:	bb01                	j	140a <printf+0x304>
    16fc:	45ad                	li	a1,11
    if (sign)
    16fe:	d006d6e3          	bgez	a3,140a <printf+0x304>
    1702:	b7fd                	j	16f0 <printf+0x5ea>
        buf[i--] = digits[x % base];
    1704:	45a9                	li	a1,10
    if (sign)
    1706:	d00652e3          	bgez	a2,140a <printf+0x304>
        buf[i--] = '-';
    170a:	02d00793          	li	a5,45
    170e:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1712:	45a5                	li	a1,9
    1714:	b9dd                	j	140a <printf+0x304>
    1716:	45a9                	li	a1,10
    if (sign)
    1718:	ce06d9e3          	bgez	a3,140a <printf+0x304>
    171c:	b7fd                	j	170a <printf+0x604>
        buf[i--] = digits[x % base];
    171e:	45a1                	li	a1,8
    if (sign)
    1720:	ce0655e3          	bgez	a2,140a <printf+0x304>
    1724:	b9f1                	j	1400 <printf+0x2fa>
        buf[i--] = digits[x % base];
    1726:	45a5                	li	a1,9
    if (sign)
    1728:	ce0651e3          	bgez	a2,140a <printf+0x304>
        buf[i--] = '-';
    172c:	02d00793          	li	a5,45
    1730:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1734:	45a1                	li	a1,8
    1736:	b9d1                	j	140a <printf+0x304>
    i = 15;
    1738:	45bd                	li	a1,15
    173a:	b9c1                	j	140a <printf+0x304>
        buf[i--] = digits[x % base];
    173c:	45a5                	li	a1,9
    if (sign)
    173e:	cc06d6e3          	bgez	a3,140a <printf+0x304>
    1742:	b7ed                	j	172c <printf+0x626>

0000000000001744 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1744:	02000793          	li	a5,32
    1748:	00f50663          	beq	a0,a5,1754 <isspace+0x10>
    174c:	355d                	addiw	a0,a0,-9
    174e:	00553513          	sltiu	a0,a0,5
    1752:	8082                	ret
    1754:	4505                	li	a0,1
}
    1756:	8082                	ret

0000000000001758 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1758:	fd05051b          	addiw	a0,a0,-48
}
    175c:	00a53513          	sltiu	a0,a0,10
    1760:	8082                	ret

0000000000001762 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1762:	02000613          	li	a2,32
    1766:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1768:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    176c:	ff77069b          	addiw	a3,a4,-9
    1770:	04c70d63          	beq	a4,a2,17ca <atoi+0x68>
    1774:	0007079b          	sext.w	a5,a4
    1778:	04d5f963          	bgeu	a1,a3,17ca <atoi+0x68>
        s++;
    switch (*s)
    177c:	02b00693          	li	a3,43
    1780:	04d70a63          	beq	a4,a3,17d4 <atoi+0x72>
    1784:	02d00693          	li	a3,45
    1788:	06d70463          	beq	a4,a3,17f0 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    178c:	fd07859b          	addiw	a1,a5,-48
    1790:	4625                	li	a2,9
    1792:	873e                	mv	a4,a5
    1794:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1796:	4e01                	li	t3,0
    while (isdigit(*s))
    1798:	04b66a63          	bltu	a2,a1,17ec <atoi+0x8a>
    int n = 0, neg = 0;
    179c:	4501                	li	a0,0
    while (isdigit(*s))
    179e:	4825                	li	a6,9
    17a0:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    17a4:	0025179b          	slliw	a5,a0,0x2
    17a8:	9d3d                	addw	a0,a0,a5
    17aa:	fd07031b          	addiw	t1,a4,-48
    17ae:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    17b2:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    17b6:	0685                	addi	a3,a3,1
    17b8:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    17bc:	0006071b          	sext.w	a4,a2
    17c0:	feb870e3          	bgeu	a6,a1,17a0 <atoi+0x3e>
    return neg ? n : -n;
    17c4:	000e0563          	beqz	t3,17ce <atoi+0x6c>
}
    17c8:	8082                	ret
        s++;
    17ca:	0505                	addi	a0,a0,1
    17cc:	bf71                	j	1768 <atoi+0x6>
    17ce:	4113053b          	subw	a0,t1,a7
    17d2:	8082                	ret
    while (isdigit(*s))
    17d4:	00154783          	lbu	a5,1(a0)
    17d8:	4625                	li	a2,9
        s++;
    17da:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17de:	fd07859b          	addiw	a1,a5,-48
    17e2:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    17e6:	4e01                	li	t3,0
    while (isdigit(*s))
    17e8:	fab67ae3          	bgeu	a2,a1,179c <atoi+0x3a>
    17ec:	4501                	li	a0,0
}
    17ee:	8082                	ret
    while (isdigit(*s))
    17f0:	00154783          	lbu	a5,1(a0)
    17f4:	4625                	li	a2,9
        s++;
    17f6:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17fa:	fd07859b          	addiw	a1,a5,-48
    17fe:	0007871b          	sext.w	a4,a5
    1802:	feb665e3          	bltu	a2,a1,17ec <atoi+0x8a>
        neg = 1;
    1806:	4e05                	li	t3,1
    1808:	bf51                	j	179c <atoi+0x3a>

000000000000180a <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    180a:	16060d63          	beqz	a2,1984 <memset+0x17a>
    180e:	40a007b3          	neg	a5,a0
    1812:	8b9d                	andi	a5,a5,7
    1814:	00778713          	addi	a4,a5,7
    1818:	482d                	li	a6,11
    181a:	0ff5f593          	andi	a1,a1,255
    181e:	fff60693          	addi	a3,a2,-1
    1822:	17076263          	bltu	a4,a6,1986 <memset+0x17c>
    1826:	16e6ea63          	bltu	a3,a4,199a <memset+0x190>
    182a:	16078563          	beqz	a5,1994 <memset+0x18a>
    182e:	00b50023          	sb	a1,0(a0)
    1832:	4705                	li	a4,1
    1834:	00150e93          	addi	t4,a0,1
    1838:	14e78c63          	beq	a5,a4,1990 <memset+0x186>
    183c:	00b500a3          	sb	a1,1(a0)
    1840:	4709                	li	a4,2
    1842:	00250e93          	addi	t4,a0,2
    1846:	14e78d63          	beq	a5,a4,19a0 <memset+0x196>
    184a:	00b50123          	sb	a1,2(a0)
    184e:	470d                	li	a4,3
    1850:	00350e93          	addi	t4,a0,3
    1854:	12e78b63          	beq	a5,a4,198a <memset+0x180>
    1858:	00b501a3          	sb	a1,3(a0)
    185c:	4711                	li	a4,4
    185e:	00450e93          	addi	t4,a0,4
    1862:	14e78163          	beq	a5,a4,19a4 <memset+0x19a>
    1866:	00b50223          	sb	a1,4(a0)
    186a:	4715                	li	a4,5
    186c:	00550e93          	addi	t4,a0,5
    1870:	12e78c63          	beq	a5,a4,19a8 <memset+0x19e>
    1874:	00b502a3          	sb	a1,5(a0)
    1878:	471d                	li	a4,7
    187a:	00650e93          	addi	t4,a0,6
    187e:	12e79763          	bne	a5,a4,19ac <memset+0x1a2>
    1882:	00750e93          	addi	t4,a0,7
    1886:	00b50323          	sb	a1,6(a0)
    188a:	4f1d                	li	t5,7
    188c:	00859713          	slli	a4,a1,0x8
    1890:	8f4d                	or	a4,a4,a1
    1892:	01059e13          	slli	t3,a1,0x10
    1896:	01c76e33          	or	t3,a4,t3
    189a:	01859313          	slli	t1,a1,0x18
    189e:	006e6333          	or	t1,t3,t1
    18a2:	02059893          	slli	a7,a1,0x20
    18a6:	011368b3          	or	a7,t1,a7
    18aa:	02859813          	slli	a6,a1,0x28
    18ae:	40f60333          	sub	t1,a2,a5
    18b2:	0108e833          	or	a6,a7,a6
    18b6:	03059693          	slli	a3,a1,0x30
    18ba:	00d866b3          	or	a3,a6,a3
    18be:	03859713          	slli	a4,a1,0x38
    18c2:	97aa                	add	a5,a5,a0
    18c4:	ff837813          	andi	a6,t1,-8
    18c8:	8f55                	or	a4,a4,a3
    18ca:	00f806b3          	add	a3,a6,a5
    18ce:	e398                	sd	a4,0(a5)
    18d0:	07a1                	addi	a5,a5,8
    18d2:	fed79ee3          	bne	a5,a3,18ce <memset+0xc4>
    18d6:	ff837693          	andi	a3,t1,-8
    18da:	00de87b3          	add	a5,t4,a3
    18de:	01e6873b          	addw	a4,a3,t5
    18e2:	0ad30663          	beq	t1,a3,198e <memset+0x184>
    18e6:	00b78023          	sb	a1,0(a5)
    18ea:	0017069b          	addiw	a3,a4,1
    18ee:	08c6fb63          	bgeu	a3,a2,1984 <memset+0x17a>
    18f2:	00b780a3          	sb	a1,1(a5)
    18f6:	0027069b          	addiw	a3,a4,2
    18fa:	08c6f563          	bgeu	a3,a2,1984 <memset+0x17a>
    18fe:	00b78123          	sb	a1,2(a5)
    1902:	0037069b          	addiw	a3,a4,3
    1906:	06c6ff63          	bgeu	a3,a2,1984 <memset+0x17a>
    190a:	00b781a3          	sb	a1,3(a5)
    190e:	0047069b          	addiw	a3,a4,4
    1912:	06c6f963          	bgeu	a3,a2,1984 <memset+0x17a>
    1916:	00b78223          	sb	a1,4(a5)
    191a:	0057069b          	addiw	a3,a4,5
    191e:	06c6f363          	bgeu	a3,a2,1984 <memset+0x17a>
    1922:	00b782a3          	sb	a1,5(a5)
    1926:	0067069b          	addiw	a3,a4,6
    192a:	04c6fd63          	bgeu	a3,a2,1984 <memset+0x17a>
    192e:	00b78323          	sb	a1,6(a5)
    1932:	0077069b          	addiw	a3,a4,7
    1936:	04c6f763          	bgeu	a3,a2,1984 <memset+0x17a>
    193a:	00b783a3          	sb	a1,7(a5)
    193e:	0087069b          	addiw	a3,a4,8
    1942:	04c6f163          	bgeu	a3,a2,1984 <memset+0x17a>
    1946:	00b78423          	sb	a1,8(a5)
    194a:	0097069b          	addiw	a3,a4,9
    194e:	02c6fb63          	bgeu	a3,a2,1984 <memset+0x17a>
    1952:	00b784a3          	sb	a1,9(a5)
    1956:	00a7069b          	addiw	a3,a4,10
    195a:	02c6f563          	bgeu	a3,a2,1984 <memset+0x17a>
    195e:	00b78523          	sb	a1,10(a5)
    1962:	00b7069b          	addiw	a3,a4,11
    1966:	00c6ff63          	bgeu	a3,a2,1984 <memset+0x17a>
    196a:	00b785a3          	sb	a1,11(a5)
    196e:	00c7069b          	addiw	a3,a4,12
    1972:	00c6f963          	bgeu	a3,a2,1984 <memset+0x17a>
    1976:	00b78623          	sb	a1,12(a5)
    197a:	2735                	addiw	a4,a4,13
    197c:	00c77463          	bgeu	a4,a2,1984 <memset+0x17a>
    1980:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1984:	8082                	ret
    1986:	472d                	li	a4,11
    1988:	bd79                	j	1826 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    198a:	4f0d                	li	t5,3
    198c:	b701                	j	188c <memset+0x82>
    198e:	8082                	ret
    1990:	4f05                	li	t5,1
    1992:	bded                	j	188c <memset+0x82>
    1994:	8eaa                	mv	t4,a0
    1996:	4f01                	li	t5,0
    1998:	bdd5                	j	188c <memset+0x82>
    199a:	87aa                	mv	a5,a0
    199c:	4701                	li	a4,0
    199e:	b7a1                	j	18e6 <memset+0xdc>
    19a0:	4f09                	li	t5,2
    19a2:	b5ed                	j	188c <memset+0x82>
    19a4:	4f11                	li	t5,4
    19a6:	b5dd                	j	188c <memset+0x82>
    19a8:	4f15                	li	t5,5
    19aa:	b5cd                	j	188c <memset+0x82>
    19ac:	4f19                	li	t5,6
    19ae:	bdf9                	j	188c <memset+0x82>

00000000000019b0 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    19b0:	00054783          	lbu	a5,0(a0)
    19b4:	0005c703          	lbu	a4,0(a1)
    19b8:	00e79863          	bne	a5,a4,19c8 <strcmp+0x18>
    19bc:	0505                	addi	a0,a0,1
    19be:	0585                	addi	a1,a1,1
    19c0:	fbe5                	bnez	a5,19b0 <strcmp>
    19c2:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    19c4:	9d19                	subw	a0,a0,a4
    19c6:	8082                	ret
    19c8:	0007851b          	sext.w	a0,a5
    19cc:	bfe5                	j	19c4 <strcmp+0x14>

00000000000019ce <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    19ce:	ce05                	beqz	a2,1a06 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19d0:	00054703          	lbu	a4,0(a0)
    19d4:	0005c783          	lbu	a5,0(a1)
    19d8:	cb0d                	beqz	a4,1a0a <strncmp+0x3c>
    if (!n--)
    19da:	167d                	addi	a2,a2,-1
    19dc:	00c506b3          	add	a3,a0,a2
    19e0:	a819                	j	19f6 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19e2:	00a68e63          	beq	a3,a0,19fe <strncmp+0x30>
    19e6:	0505                	addi	a0,a0,1
    19e8:	00e79b63          	bne	a5,a4,19fe <strncmp+0x30>
    19ec:	00054703          	lbu	a4,0(a0)
    19f0:	0005c783          	lbu	a5,0(a1)
    19f4:	cb19                	beqz	a4,1a0a <strncmp+0x3c>
    19f6:	0005c783          	lbu	a5,0(a1)
    19fa:	0585                	addi	a1,a1,1
    19fc:	f3fd                	bnez	a5,19e2 <strncmp+0x14>
        ;
    return *l - *r;
    19fe:	0007051b          	sext.w	a0,a4
    1a02:	9d1d                	subw	a0,a0,a5
    1a04:	8082                	ret
        return 0;
    1a06:	4501                	li	a0,0
}
    1a08:	8082                	ret
    1a0a:	4501                	li	a0,0
    return *l - *r;
    1a0c:	9d1d                	subw	a0,a0,a5
    1a0e:	8082                	ret

0000000000001a10 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1a10:	00757793          	andi	a5,a0,7
    1a14:	cf89                	beqz	a5,1a2e <strlen+0x1e>
    1a16:	87aa                	mv	a5,a0
    1a18:	a029                	j	1a22 <strlen+0x12>
    1a1a:	0785                	addi	a5,a5,1
    1a1c:	0077f713          	andi	a4,a5,7
    1a20:	cb01                	beqz	a4,1a30 <strlen+0x20>
        if (!*s)
    1a22:	0007c703          	lbu	a4,0(a5)
    1a26:	fb75                	bnez	a4,1a1a <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1a28:	40a78533          	sub	a0,a5,a0
}
    1a2c:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1a2e:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1a30:	6394                	ld	a3,0(a5)
    1a32:	00000597          	auipc	a1,0x0
    1a36:	5c65b583          	ld	a1,1478(a1) # 1ff8 <N+0x8>
    1a3a:	00000617          	auipc	a2,0x0
    1a3e:	5c663603          	ld	a2,1478(a2) # 2000 <N+0x10>
    1a42:	a019                	j	1a48 <strlen+0x38>
    1a44:	6794                	ld	a3,8(a5)
    1a46:	07a1                	addi	a5,a5,8
    1a48:	00b68733          	add	a4,a3,a1
    1a4c:	fff6c693          	not	a3,a3
    1a50:	8f75                	and	a4,a4,a3
    1a52:	8f71                	and	a4,a4,a2
    1a54:	db65                	beqz	a4,1a44 <strlen+0x34>
    for (; *s; s++)
    1a56:	0007c703          	lbu	a4,0(a5)
    1a5a:	d779                	beqz	a4,1a28 <strlen+0x18>
    1a5c:	0017c703          	lbu	a4,1(a5)
    1a60:	0785                	addi	a5,a5,1
    1a62:	d379                	beqz	a4,1a28 <strlen+0x18>
    1a64:	0017c703          	lbu	a4,1(a5)
    1a68:	0785                	addi	a5,a5,1
    1a6a:	fb6d                	bnez	a4,1a5c <strlen+0x4c>
    1a6c:	bf75                	j	1a28 <strlen+0x18>

0000000000001a6e <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a6e:	00757713          	andi	a4,a0,7
{
    1a72:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1a74:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a78:	cb19                	beqz	a4,1a8e <memchr+0x20>
    1a7a:	ce25                	beqz	a2,1af2 <memchr+0x84>
    1a7c:	0007c703          	lbu	a4,0(a5)
    1a80:	04b70e63          	beq	a4,a1,1adc <memchr+0x6e>
    1a84:	0785                	addi	a5,a5,1
    1a86:	0077f713          	andi	a4,a5,7
    1a8a:	167d                	addi	a2,a2,-1
    1a8c:	f77d                	bnez	a4,1a7a <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1a8e:	4501                	li	a0,0
    if (n && *s != c)
    1a90:	c235                	beqz	a2,1af4 <memchr+0x86>
    1a92:	0007c703          	lbu	a4,0(a5)
    1a96:	04b70363          	beq	a4,a1,1adc <memchr+0x6e>
        size_t k = ONES * c;
    1a9a:	00000517          	auipc	a0,0x0
    1a9e:	56e53503          	ld	a0,1390(a0) # 2008 <N+0x18>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1aa2:	471d                	li	a4,7
        size_t k = ONES * c;
    1aa4:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1aa8:	02c77a63          	bgeu	a4,a2,1adc <memchr+0x6e>
    1aac:	00000897          	auipc	a7,0x0
    1ab0:	54c8b883          	ld	a7,1356(a7) # 1ff8 <N+0x8>
    1ab4:	00000817          	auipc	a6,0x0
    1ab8:	54c83803          	ld	a6,1356(a6) # 2000 <N+0x10>
    1abc:	431d                	li	t1,7
    1abe:	a029                	j	1ac8 <memchr+0x5a>
    1ac0:	1661                	addi	a2,a2,-8
    1ac2:	07a1                	addi	a5,a5,8
    1ac4:	02c37963          	bgeu	t1,a2,1af6 <memchr+0x88>
    1ac8:	6398                	ld	a4,0(a5)
    1aca:	8f29                	xor	a4,a4,a0
    1acc:	011706b3          	add	a3,a4,a7
    1ad0:	fff74713          	not	a4,a4
    1ad4:	8f75                	and	a4,a4,a3
    1ad6:	01077733          	and	a4,a4,a6
    1ada:	d37d                	beqz	a4,1ac0 <memchr+0x52>
    1adc:	853e                	mv	a0,a5
    1ade:	97b2                	add	a5,a5,a2
    1ae0:	a021                	j	1ae8 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1ae2:	0505                	addi	a0,a0,1
    1ae4:	00f50763          	beq	a0,a5,1af2 <memchr+0x84>
    1ae8:	00054703          	lbu	a4,0(a0)
    1aec:	feb71be3          	bne	a4,a1,1ae2 <memchr+0x74>
    1af0:	8082                	ret
    return n ? (void *)s : 0;
    1af2:	4501                	li	a0,0
}
    1af4:	8082                	ret
    return n ? (void *)s : 0;
    1af6:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1af8:	f275                	bnez	a2,1adc <memchr+0x6e>
}
    1afa:	8082                	ret

0000000000001afc <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1afc:	1101                	addi	sp,sp,-32
    1afe:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1b00:	862e                	mv	a2,a1
{
    1b02:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1b04:	4581                	li	a1,0
{
    1b06:	e426                	sd	s1,8(sp)
    1b08:	ec06                	sd	ra,24(sp)
    1b0a:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1b0c:	f63ff0ef          	jal	ra,1a6e <memchr>
    return p ? p - s : n;
    1b10:	c519                	beqz	a0,1b1e <strnlen+0x22>
}
    1b12:	60e2                	ld	ra,24(sp)
    1b14:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1b16:	8d05                	sub	a0,a0,s1
}
    1b18:	64a2                	ld	s1,8(sp)
    1b1a:	6105                	addi	sp,sp,32
    1b1c:	8082                	ret
    1b1e:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1b20:	8522                	mv	a0,s0
}
    1b22:	6442                	ld	s0,16(sp)
    1b24:	64a2                	ld	s1,8(sp)
    1b26:	6105                	addi	sp,sp,32
    1b28:	8082                	ret

0000000000001b2a <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1b2a:	00b547b3          	xor	a5,a0,a1
    1b2e:	8b9d                	andi	a5,a5,7
    1b30:	eb95                	bnez	a5,1b64 <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1b32:	0075f793          	andi	a5,a1,7
    1b36:	e7b1                	bnez	a5,1b82 <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1b38:	6198                	ld	a4,0(a1)
    1b3a:	00000617          	auipc	a2,0x0
    1b3e:	4be63603          	ld	a2,1214(a2) # 1ff8 <N+0x8>
    1b42:	00000817          	auipc	a6,0x0
    1b46:	4be83803          	ld	a6,1214(a6) # 2000 <N+0x10>
    1b4a:	a029                	j	1b54 <stpcpy+0x2a>
    1b4c:	e118                	sd	a4,0(a0)
    1b4e:	6598                	ld	a4,8(a1)
    1b50:	05a1                	addi	a1,a1,8
    1b52:	0521                	addi	a0,a0,8
    1b54:	00c707b3          	add	a5,a4,a2
    1b58:	fff74693          	not	a3,a4
    1b5c:	8ff5                	and	a5,a5,a3
    1b5e:	0107f7b3          	and	a5,a5,a6
    1b62:	d7ed                	beqz	a5,1b4c <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b64:	0005c783          	lbu	a5,0(a1)
    1b68:	00f50023          	sb	a5,0(a0)
    1b6c:	c785                	beqz	a5,1b94 <stpcpy+0x6a>
    1b6e:	0015c783          	lbu	a5,1(a1)
    1b72:	0505                	addi	a0,a0,1
    1b74:	0585                	addi	a1,a1,1
    1b76:	00f50023          	sb	a5,0(a0)
    1b7a:	fbf5                	bnez	a5,1b6e <stpcpy+0x44>
        ;
    return d;
}
    1b7c:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1b7e:	0505                	addi	a0,a0,1
    1b80:	df45                	beqz	a4,1b38 <stpcpy+0xe>
            if (!(*d = *s))
    1b82:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1b86:	0585                	addi	a1,a1,1
    1b88:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1b8c:	00f50023          	sb	a5,0(a0)
    1b90:	f7fd                	bnez	a5,1b7e <stpcpy+0x54>
}
    1b92:	8082                	ret
    1b94:	8082                	ret

0000000000001b96 <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b96:	00b547b3          	xor	a5,a0,a1
    1b9a:	8b9d                	andi	a5,a5,7
    1b9c:	1a079863          	bnez	a5,1d4c <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1ba0:	0075f793          	andi	a5,a1,7
    1ba4:	16078463          	beqz	a5,1d0c <stpncpy+0x176>
    1ba8:	ea01                	bnez	a2,1bb8 <stpncpy+0x22>
    1baa:	a421                	j	1db2 <stpncpy+0x21c>
    1bac:	167d                	addi	a2,a2,-1
    1bae:	0505                	addi	a0,a0,1
    1bb0:	14070e63          	beqz	a4,1d0c <stpncpy+0x176>
    1bb4:	1a060863          	beqz	a2,1d64 <stpncpy+0x1ce>
    1bb8:	0005c783          	lbu	a5,0(a1)
    1bbc:	0585                	addi	a1,a1,1
    1bbe:	0075f713          	andi	a4,a1,7
    1bc2:	00f50023          	sb	a5,0(a0)
    1bc6:	f3fd                	bnez	a5,1bac <stpncpy+0x16>
    1bc8:	4805                	li	a6,1
    1bca:	1a061863          	bnez	a2,1d7a <stpncpy+0x1e4>
    1bce:	40a007b3          	neg	a5,a0
    1bd2:	8b9d                	andi	a5,a5,7
    1bd4:	4681                	li	a3,0
    1bd6:	18061a63          	bnez	a2,1d6a <stpncpy+0x1d4>
    1bda:	00778713          	addi	a4,a5,7
    1bde:	45ad                	li	a1,11
    1be0:	18b76363          	bltu	a4,a1,1d66 <stpncpy+0x1d0>
    1be4:	1ae6eb63          	bltu	a3,a4,1d9a <stpncpy+0x204>
    1be8:	1a078363          	beqz	a5,1d8e <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bec:	00050023          	sb	zero,0(a0)
    1bf0:	4685                	li	a3,1
    1bf2:	00150713          	addi	a4,a0,1
    1bf6:	18d78f63          	beq	a5,a3,1d94 <stpncpy+0x1fe>
    1bfa:	000500a3          	sb	zero,1(a0)
    1bfe:	4689                	li	a3,2
    1c00:	00250713          	addi	a4,a0,2
    1c04:	18d78e63          	beq	a5,a3,1da0 <stpncpy+0x20a>
    1c08:	00050123          	sb	zero,2(a0)
    1c0c:	468d                	li	a3,3
    1c0e:	00350713          	addi	a4,a0,3
    1c12:	16d78c63          	beq	a5,a3,1d8a <stpncpy+0x1f4>
    1c16:	000501a3          	sb	zero,3(a0)
    1c1a:	4691                	li	a3,4
    1c1c:	00450713          	addi	a4,a0,4
    1c20:	18d78263          	beq	a5,a3,1da4 <stpncpy+0x20e>
    1c24:	00050223          	sb	zero,4(a0)
    1c28:	4695                	li	a3,5
    1c2a:	00550713          	addi	a4,a0,5
    1c2e:	16d78d63          	beq	a5,a3,1da8 <stpncpy+0x212>
    1c32:	000502a3          	sb	zero,5(a0)
    1c36:	469d                	li	a3,7
    1c38:	00650713          	addi	a4,a0,6
    1c3c:	16d79863          	bne	a5,a3,1dac <stpncpy+0x216>
    1c40:	00750713          	addi	a4,a0,7
    1c44:	00050323          	sb	zero,6(a0)
    1c48:	40f80833          	sub	a6,a6,a5
    1c4c:	ff887593          	andi	a1,a6,-8
    1c50:	97aa                	add	a5,a5,a0
    1c52:	95be                	add	a1,a1,a5
    1c54:	0007b023          	sd	zero,0(a5)
    1c58:	07a1                	addi	a5,a5,8
    1c5a:	feb79de3          	bne	a5,a1,1c54 <stpncpy+0xbe>
    1c5e:	ff887593          	andi	a1,a6,-8
    1c62:	9ead                	addw	a3,a3,a1
    1c64:	00b707b3          	add	a5,a4,a1
    1c68:	12b80863          	beq	a6,a1,1d98 <stpncpy+0x202>
    1c6c:	00078023          	sb	zero,0(a5)
    1c70:	0016871b          	addiw	a4,a3,1
    1c74:	0ec77863          	bgeu	a4,a2,1d64 <stpncpy+0x1ce>
    1c78:	000780a3          	sb	zero,1(a5)
    1c7c:	0026871b          	addiw	a4,a3,2
    1c80:	0ec77263          	bgeu	a4,a2,1d64 <stpncpy+0x1ce>
    1c84:	00078123          	sb	zero,2(a5)
    1c88:	0036871b          	addiw	a4,a3,3
    1c8c:	0cc77c63          	bgeu	a4,a2,1d64 <stpncpy+0x1ce>
    1c90:	000781a3          	sb	zero,3(a5)
    1c94:	0046871b          	addiw	a4,a3,4
    1c98:	0cc77663          	bgeu	a4,a2,1d64 <stpncpy+0x1ce>
    1c9c:	00078223          	sb	zero,4(a5)
    1ca0:	0056871b          	addiw	a4,a3,5
    1ca4:	0cc77063          	bgeu	a4,a2,1d64 <stpncpy+0x1ce>
    1ca8:	000782a3          	sb	zero,5(a5)
    1cac:	0066871b          	addiw	a4,a3,6
    1cb0:	0ac77a63          	bgeu	a4,a2,1d64 <stpncpy+0x1ce>
    1cb4:	00078323          	sb	zero,6(a5)
    1cb8:	0076871b          	addiw	a4,a3,7
    1cbc:	0ac77463          	bgeu	a4,a2,1d64 <stpncpy+0x1ce>
    1cc0:	000783a3          	sb	zero,7(a5)
    1cc4:	0086871b          	addiw	a4,a3,8
    1cc8:	08c77e63          	bgeu	a4,a2,1d64 <stpncpy+0x1ce>
    1ccc:	00078423          	sb	zero,8(a5)
    1cd0:	0096871b          	addiw	a4,a3,9
    1cd4:	08c77863          	bgeu	a4,a2,1d64 <stpncpy+0x1ce>
    1cd8:	000784a3          	sb	zero,9(a5)
    1cdc:	00a6871b          	addiw	a4,a3,10
    1ce0:	08c77263          	bgeu	a4,a2,1d64 <stpncpy+0x1ce>
    1ce4:	00078523          	sb	zero,10(a5)
    1ce8:	00b6871b          	addiw	a4,a3,11
    1cec:	06c77c63          	bgeu	a4,a2,1d64 <stpncpy+0x1ce>
    1cf0:	000785a3          	sb	zero,11(a5)
    1cf4:	00c6871b          	addiw	a4,a3,12
    1cf8:	06c77663          	bgeu	a4,a2,1d64 <stpncpy+0x1ce>
    1cfc:	00078623          	sb	zero,12(a5)
    1d00:	26b5                	addiw	a3,a3,13
    1d02:	06c6f163          	bgeu	a3,a2,1d64 <stpncpy+0x1ce>
    1d06:	000786a3          	sb	zero,13(a5)
    1d0a:	8082                	ret
            ;
        if (!n || !*s)
    1d0c:	c645                	beqz	a2,1db4 <stpncpy+0x21e>
    1d0e:	0005c783          	lbu	a5,0(a1)
    1d12:	ea078be3          	beqz	a5,1bc8 <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d16:	479d                	li	a5,7
    1d18:	02c7ff63          	bgeu	a5,a2,1d56 <stpncpy+0x1c0>
    1d1c:	00000897          	auipc	a7,0x0
    1d20:	2dc8b883          	ld	a7,732(a7) # 1ff8 <N+0x8>
    1d24:	00000817          	auipc	a6,0x0
    1d28:	2dc83803          	ld	a6,732(a6) # 2000 <N+0x10>
    1d2c:	431d                	li	t1,7
    1d2e:	6198                	ld	a4,0(a1)
    1d30:	011707b3          	add	a5,a4,a7
    1d34:	fff74693          	not	a3,a4
    1d38:	8ff5                	and	a5,a5,a3
    1d3a:	0107f7b3          	and	a5,a5,a6
    1d3e:	ef81                	bnez	a5,1d56 <stpncpy+0x1c0>
            *wd = *ws;
    1d40:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d42:	1661                	addi	a2,a2,-8
    1d44:	05a1                	addi	a1,a1,8
    1d46:	0521                	addi	a0,a0,8
    1d48:	fec363e3          	bltu	t1,a2,1d2e <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1d4c:	e609                	bnez	a2,1d56 <stpncpy+0x1c0>
    1d4e:	a08d                	j	1db0 <stpncpy+0x21a>
    1d50:	167d                	addi	a2,a2,-1
    1d52:	0505                	addi	a0,a0,1
    1d54:	ca01                	beqz	a2,1d64 <stpncpy+0x1ce>
    1d56:	0005c783          	lbu	a5,0(a1)
    1d5a:	0585                	addi	a1,a1,1
    1d5c:	00f50023          	sb	a5,0(a0)
    1d60:	fbe5                	bnez	a5,1d50 <stpncpy+0x1ba>
        ;
tail:
    1d62:	b59d                	j	1bc8 <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1d64:	8082                	ret
    1d66:	472d                	li	a4,11
    1d68:	bdb5                	j	1be4 <stpncpy+0x4e>
    1d6a:	00778713          	addi	a4,a5,7
    1d6e:	45ad                	li	a1,11
    1d70:	fff60693          	addi	a3,a2,-1
    1d74:	e6b778e3          	bgeu	a4,a1,1be4 <stpncpy+0x4e>
    1d78:	b7fd                	j	1d66 <stpncpy+0x1d0>
    1d7a:	40a007b3          	neg	a5,a0
    1d7e:	8832                	mv	a6,a2
    1d80:	8b9d                	andi	a5,a5,7
    1d82:	4681                	li	a3,0
    1d84:	e4060be3          	beqz	a2,1bda <stpncpy+0x44>
    1d88:	b7cd                	j	1d6a <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d8a:	468d                	li	a3,3
    1d8c:	bd75                	j	1c48 <stpncpy+0xb2>
    1d8e:	872a                	mv	a4,a0
    1d90:	4681                	li	a3,0
    1d92:	bd5d                	j	1c48 <stpncpy+0xb2>
    1d94:	4685                	li	a3,1
    1d96:	bd4d                	j	1c48 <stpncpy+0xb2>
    1d98:	8082                	ret
    1d9a:	87aa                	mv	a5,a0
    1d9c:	4681                	li	a3,0
    1d9e:	b5f9                	j	1c6c <stpncpy+0xd6>
    1da0:	4689                	li	a3,2
    1da2:	b55d                	j	1c48 <stpncpy+0xb2>
    1da4:	4691                	li	a3,4
    1da6:	b54d                	j	1c48 <stpncpy+0xb2>
    1da8:	4695                	li	a3,5
    1daa:	bd79                	j	1c48 <stpncpy+0xb2>
    1dac:	4699                	li	a3,6
    1dae:	bd69                	j	1c48 <stpncpy+0xb2>
    1db0:	8082                	ret
    1db2:	8082                	ret
    1db4:	8082                	ret

0000000000001db6 <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1db6:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1dba:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dbc:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1dc0:	2501                	sext.w	a0,a0
    1dc2:	8082                	ret

0000000000001dc4 <close>:
    register long a7 __asm__("a7") = n;
    1dc4:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1dc8:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1dcc:	2501                	sext.w	a0,a0
    1dce:	8082                	ret

0000000000001dd0 <read>:
    register long a7 __asm__("a7") = n;
    1dd0:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd4:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1dd8:	8082                	ret

0000000000001dda <write>:
    register long a7 __asm__("a7") = n;
    1dda:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dde:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1de2:	8082                	ret

0000000000001de4 <getpid>:
    register long a7 __asm__("a7") = n;
    1de4:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1de8:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1dec:	2501                	sext.w	a0,a0
    1dee:	8082                	ret

0000000000001df0 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1df0:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1df4:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1df8:	2501                	sext.w	a0,a0
    1dfa:	8082                	ret

0000000000001dfc <fork>:
    register long a7 __asm__("a7") = n;
    1dfc:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1e00:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1e04:	2501                	sext.w	a0,a0
    1e06:	8082                	ret

0000000000001e08 <exit>:
    register long a7 __asm__("a7") = n;
    1e08:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e0c:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e10:	8082                	ret

0000000000001e12 <waitpid>:
    register long a7 __asm__("a7") = n;
    1e12:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e16:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1e1a:	2501                	sext.w	a0,a0
    1e1c:	8082                	ret

0000000000001e1e <exec>:
    register long a7 __asm__("a7") = n;
    1e1e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e22:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e26:	2501                	sext.w	a0,a0
    1e28:	8082                	ret

0000000000001e2a <get_time>:

int64 get_time()
{
    1e2a:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e2c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e30:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e32:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e34:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e38:	2501                	sext.w	a0,a0
    1e3a:	ed09                	bnez	a0,1e54 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e3c:	67a2                	ld	a5,8(sp)
    1e3e:	3e800713          	li	a4,1000
    1e42:	00015503          	lhu	a0,0(sp)
    1e46:	02e7d7b3          	divu	a5,a5,a4
    1e4a:	02e50533          	mul	a0,a0,a4
    1e4e:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e50:	0141                	addi	sp,sp,16
    1e52:	8082                	ret
        return -1;
    1e54:	557d                	li	a0,-1
    1e56:	bfed                	j	1e50 <get_time+0x26>

0000000000001e58 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e58:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e60:	2501                	sext.w	a0,a0
    1e62:	8082                	ret

0000000000001e64 <sleep>:

int sleep(unsigned long long time)
{
    1e64:	1141                	addi	sp,sp,-16
    1e66:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1e68:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e6c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e6e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e70:	00000073          	ecall
    if (err == 0)
    1e74:	2501                	sext.w	a0,a0
    1e76:	e13d                	bnez	a0,1edc <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e78:	6722                	ld	a4,8(sp)
    1e7a:	3e800693          	li	a3,1000
    1e7e:	00015783          	lhu	a5,0(sp)
    1e82:	02d75733          	divu	a4,a4,a3
    1e86:	02d787b3          	mul	a5,a5,a3
    1e8a:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1e8c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e90:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e92:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e94:	00000073          	ecall
    if (err == 0)
    1e98:	2501                	sext.w	a0,a0
    1e9a:	ed15                	bnez	a0,1ed6 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e9c:	6841                	lui	a6,0x10
    1e9e:	963e                	add	a2,a2,a5
    1ea0:	187d                	addi	a6,a6,-1
    1ea2:	3e800693          	li	a3,1000
    1ea6:	a819                	j	1ebc <sleep+0x58>
    __asm_syscall("r"(a7))
    1ea8:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1eac:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1eb0:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1eb2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb4:	00000073          	ecall
    if (err == 0)
    1eb8:	2501                	sext.w	a0,a0
    1eba:	ed11                	bnez	a0,1ed6 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ebc:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1ebe:	07c00893          	li	a7,124
    1ec2:	02d7d733          	divu	a4,a5,a3
    1ec6:	6782                	ld	a5,0(sp)
    1ec8:	0107f7b3          	and	a5,a5,a6
    1ecc:	02d787b3          	mul	a5,a5,a3
    1ed0:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1ed2:	fcc7ebe3          	bltu	a5,a2,1ea8 <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1ed6:	4501                	li	a0,0
    1ed8:	0141                	addi	sp,sp,16
    1eda:	8082                	ret
    1edc:	57fd                	li	a5,-1
    1ede:	b77d                	j	1e8c <sleep+0x28>

0000000000001ee0 <set_priority>:
    register long a7 __asm__("a7") = n;
    1ee0:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1ee4:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1ee8:	2501                	sext.w	a0,a0
    1eea:	8082                	ret

0000000000001eec <mmap>:
    register long a7 __asm__("a7") = n;
    1eec:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ef0:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1ef4:	2501                	sext.w	a0,a0
    1ef6:	8082                	ret

0000000000001ef8 <munmap>:
    register long a7 __asm__("a7") = n;
    1ef8:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1efc:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1f00:	2501                	sext.w	a0,a0
    1f02:	8082                	ret

0000000000001f04 <wait>:

int wait(int *code)
{
    1f04:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f06:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1f0a:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f0c:	00000073          	ecall
    return waitpid(-1, code);
}
    1f10:	2501                	sext.w	a0,a0
    1f12:	8082                	ret

0000000000001f14 <spawn>:
    register long a7 __asm__("a7") = n;
    1f14:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1f18:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f1c:	2501                	sext.w	a0,a0
    1f1e:	8082                	ret

0000000000001f20 <mailread>:
    register long a7 __asm__("a7") = n;
    1f20:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f24:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f28:	2501                	sext.w	a0,a0
    1f2a:	8082                	ret

0000000000001f2c <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f2c:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f30:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f34:	2501                	sext.w	a0,a0
    1f36:	8082                	ret

0000000000001f38 <fstat>:
    register long a7 __asm__("a7") = n;
    1f38:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f3c:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f40:	2501                	sext.w	a0,a0
    1f42:	8082                	ret

0000000000001f44 <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1f44:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f46:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f4a:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f4c:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f50:	2501                	sext.w	a0,a0
    1f52:	8082                	ret

0000000000001f54 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f54:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f56:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f5a:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f5c:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f60:	2501                	sext.w	a0,a0
    1f62:	8082                	ret

0000000000001f64 <link>:

int link(char *old_path, char *new_path)
{
    1f64:	87aa                	mv	a5,a0
    1f66:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f68:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f6c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f70:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f72:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f76:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f78:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f7c:	2501                	sext.w	a0,a0
    1f7e:	8082                	ret

0000000000001f80 <unlink>:

int unlink(char *path)
{
    1f80:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f82:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f86:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f8a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f8c:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f90:	2501                	sext.w	a0,a0
    1f92:	8082                	ret
