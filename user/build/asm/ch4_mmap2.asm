
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch4_mmap2:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0460006f          	j	1048 <__start_main>

0000000000001006 <main>:
/*
理想结果：程序触发访存异常，被杀死。不输出 error 就算过。
*/

int main()
{
    1006:	1141                	addi	sp,sp,-16
    uint64 start = 0x10000000;
    uint64 len = 4096;
    int prot = 2;
    assert(len == mmap((void *)start, len, prot));
    1008:	4609                	li	a2,2
    100a:	6585                	lui	a1,0x1
    100c:	10000537          	lui	a0,0x10000
{
    1010:	e406                	sd	ra,8(sp)
    assert(len == mmap((void *)start, len, prot));
    1012:	6af000ef          	jal	ra,1ec0 <mmap>
    1016:	6785                	lui	a5,0x1
    1018:	00f50563          	beq	a0,a5,1022 <main+0x1c>
    101c:	557d                	li	a0,-1
    101e:	5bf000ef          	jal	ra,1ddc <exit>
    uint8 *addr = (uint8 *)start;
    // *addr = (uint8)start; // can't write, R == 0 && W == 1 is illegal in riscv
    assert(*addr != 0);
    1022:	100007b7          	lui	a5,0x10000
    1026:	0007c783          	lbu	a5,0(a5) # 10000000 <digits+0xfffe050>
    102a:	cb99                	beqz	a5,1040 <main+0x3a>
    puts("Should cause error, Test 04_2 fail!");
    102c:	00001517          	auipc	a0,0x1
    1030:	f3c50513          	addi	a0,a0,-196 # 1f68 <unlink+0x14>
    1034:	064000ef          	jal	ra,1098 <puts>
    return 0;
}
    1038:	60a2                	ld	ra,8(sp)
    103a:	4501                	li	a0,0
    103c:	0141                	addi	sp,sp,16
    103e:	8082                	ret
    assert(*addr != 0);
    1040:	557d                	li	a0,-1
    1042:	59b000ef          	jal	ra,1ddc <exit>
    1046:	b7dd                	j	102c <main+0x26>

0000000000001048 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1048:	1141                	addi	sp,sp,-16
    104a:	e406                	sd	ra,8(sp)
    exit(main());
    104c:	fbbff0ef          	jal	ra,1006 <main>
    1050:	58d000ef          	jal	ra,1ddc <exit>
    return 0;
}
    1054:	60a2                	ld	ra,8(sp)
    1056:	4501                	li	a0,0
    1058:	0141                	addi	sp,sp,16
    105a:	8082                	ret

000000000000105c <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    105c:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    105e:	00f10593          	addi	a1,sp,15
    1062:	4605                	li	a2,1
    1064:	4501                	li	a0,0
{
    1066:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1068:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    106c:	539000ef          	jal	ra,1da4 <read>
    return byte;
}
    1070:	60e2                	ld	ra,24(sp)
    1072:	00f14503          	lbu	a0,15(sp)
    1076:	6105                	addi	sp,sp,32
    1078:	8082                	ret

000000000000107a <putchar>:

int putchar(int c)
{
    107a:	1101                	addi	sp,sp,-32
    107c:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    107e:	00f10593          	addi	a1,sp,15
    1082:	4605                	li	a2,1
    1084:	4505                	li	a0,1
{
    1086:	ec06                	sd	ra,24(sp)
    char byte = c;
    1088:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    108c:	523000ef          	jal	ra,1dae <write>
}
    1090:	60e2                	ld	ra,24(sp)
    1092:	2501                	sext.w	a0,a0
    1094:	6105                	addi	sp,sp,32
    1096:	8082                	ret

0000000000001098 <puts>:

int puts(const char *s)
{
    1098:	1101                	addi	sp,sp,-32
    109a:	e822                	sd	s0,16(sp)
    109c:	ec06                	sd	ra,24(sp)
    109e:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    10a0:	145000ef          	jal	ra,19e4 <strlen>
    10a4:	862a                	mv	a2,a0
    10a6:	85a2                	mv	a1,s0
    10a8:	4505                	li	a0,1
    10aa:	505000ef          	jal	ra,1dae <write>
    10ae:	00055763          	bgez	a0,10bc <puts+0x24>
    return r;
}
    10b2:	60e2                	ld	ra,24(sp)
    10b4:	6442                	ld	s0,16(sp)
    10b6:	557d                	li	a0,-1
    10b8:	6105                	addi	sp,sp,32
    10ba:	8082                	ret
    return write(stdout, &byte, 1);
    10bc:	00f10593          	addi	a1,sp,15
    char byte = c;
    10c0:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    10c2:	4605                	li	a2,1
    10c4:	4505                	li	a0,1
    char byte = c;
    10c6:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    10ca:	4e5000ef          	jal	ra,1dae <write>
}
    10ce:	60e2                	ld	ra,24(sp)
    10d0:	6442                	ld	s0,16(sp)
    10d2:	41f5551b          	sraiw	a0,a0,0x1f
    10d6:	6105                	addi	sp,sp,32
    10d8:	8082                	ret

00000000000010da <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    10da:	7131                	addi	sp,sp,-192
    10dc:	ecce                	sd	s3,88(sp)
    10de:	e8d2                	sd	s4,80(sp)
    10e0:	e4d6                	sd	s5,72(sp)
    10e2:	e0da                	sd	s6,64(sp)
    10e4:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    10e6:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    10e8:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    10ea:	6ae1                	lui	s5,0x18
    10ec:	000f4a37          	lui	s4,0xf4
    10f0:	00989b37          	lui	s6,0x989
{
    10f4:	fc86                	sd	ra,120(sp)
    10f6:	f8a2                	sd	s0,112(sp)
    10f8:	f4a6                	sd	s1,104(sp)
    10fa:	f0ca                	sd	s2,96(sp)
    10fc:	fc5e                	sd	s7,56(sp)
    10fe:	e52e                	sd	a1,136(sp)
    1100:	e932                	sd	a2,144(sp)
    1102:	ed36                	sd	a3,152(sp)
    1104:	f13a                	sd	a4,160(sp)
    1106:	f942                	sd	a6,176(sp)
    1108:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    110a:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    110c:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x75f>
    1110:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x166ef>
    1114:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf228f>
    1118:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x9876cf>
    for (;;)
    {
        if (!*s)
    111c:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    1120:	02500913          	li	s2,37
        if (!*s)
    1124:	1a078f63          	beqz	a5,12e2 <printf+0x208>
    1128:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    112a:	17278e63          	beq	a5,s2,12a6 <printf+0x1cc>
    112e:	00164783          	lbu	a5,1(a2)
    1132:	0605                	addi	a2,a2,1
    1134:	fbfd                	bnez	a5,112a <printf+0x50>
    1136:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    1138:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    113c:	85aa                	mv	a1,a0
    113e:	8622                	mv	a2,s0
    1140:	4505                	li	a0,1
    1142:	46d000ef          	jal	ra,1dae <write>
        out(f, a, l);
        if (l)
    1146:	18041963          	bnez	s0,12d8 <printf+0x1fe>
            continue;
        if (s[1] == 0)
    114a:	0014c783          	lbu	a5,1(s1)
    114e:	18078a63          	beqz	a5,12e2 <printf+0x208>
            break;
        switch (s[1])
    1152:	07300713          	li	a4,115
    1156:	28e78e63          	beq	a5,a4,13f2 <printf+0x318>
    115a:	18f76f63          	bltu	a4,a5,12f8 <printf+0x21e>
    115e:	06400713          	li	a4,100
    1162:	2ae78c63          	beq	a5,a4,141a <printf+0x340>
    1166:	07000713          	li	a4,112
    116a:	3ce79c63          	bne	a5,a4,1542 <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    116e:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1170:	00001797          	auipc	a5,0x1
    1174:	e4078793          	addi	a5,a5,-448 # 1fb0 <digits>
            printptr(va_arg(ap, uint64));
    1178:	6298                	ld	a4,0(a3)
    117a:	00868093          	addi	ra,a3,8
    117e:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1180:	00471293          	slli	t0,a4,0x4
    1184:	00c71f13          	slli	t5,a4,0xc
    1188:	01471e13          	slli	t3,a4,0x14
    118c:	01c71893          	slli	a7,a4,0x1c
    1190:	02471813          	slli	a6,a4,0x24
    1194:	02871513          	slli	a0,a4,0x28
    1198:	02c71593          	slli	a1,a4,0x2c
    119c:	03071693          	slli	a3,a4,0x30
    11a0:	00871f93          	slli	t6,a4,0x8
    11a4:	01071e93          	slli	t4,a4,0x10
    11a8:	01871313          	slli	t1,a4,0x18
    11ac:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    11b0:	03c2d293          	srli	t0,t0,0x3c
    11b4:	03cf5f13          	srli	t5,t5,0x3c
    11b8:	03ce5e13          	srli	t3,t3,0x3c
    11bc:	03c8d893          	srli	a7,a7,0x3c
    11c0:	03c85813          	srli	a6,a6,0x3c
    11c4:	9171                	srli	a0,a0,0x3c
    11c6:	91f1                	srli	a1,a1,0x3c
    11c8:	92f1                	srli	a3,a3,0x3c
    11ca:	92be                	add	t0,t0,a5
    11cc:	9f3e                	add	t5,t5,a5
    11ce:	9e3e                	add	t3,t3,a5
    11d0:	98be                	add	a7,a7,a5
    11d2:	983e                	add	a6,a6,a5
    11d4:	953e                	add	a0,a0,a5
    11d6:	95be                	add	a1,a1,a5
    11d8:	96be                	add	a3,a3,a5
    11da:	03c75393          	srli	t2,a4,0x3c
    11de:	01c75b9b          	srliw	s7,a4,0x1c
    11e2:	03cfdf93          	srli	t6,t6,0x3c
    11e6:	03cede93          	srli	t4,t4,0x3c
    11ea:	03c35313          	srli	t1,t1,0x3c
    11ee:	9271                	srli	a2,a2,0x3c
    11f0:	0002c403          	lbu	s0,0(t0)
    11f4:	93be                	add	t2,t2,a5
    11f6:	000f4283          	lbu	t0,0(t5)
    11fa:	9fbe                	add	t6,t6,a5
    11fc:	000e4f03          	lbu	t5,0(t3)
    1200:	9ebe                	add	t4,t4,a5
    1202:	0008ce03          	lbu	t3,0(a7)
    1206:	933e                	add	t1,t1,a5
    1208:	00084883          	lbu	a7,0(a6)
    120c:	9bbe                	add	s7,s7,a5
    120e:	00054803          	lbu	a6,0(a0)
    1212:	963e                	add	a2,a2,a5
    1214:	0005c503          	lbu	a0,0(a1) # 1000 <_start>
    1218:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    121c:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1220:	0003c903          	lbu	s2,0(t2)
    1224:	00064603          	lbu	a2,0(a2)
    1228:	000fc383          	lbu	t2,0(t6)
    122c:	8b3d                	andi	a4,a4,15
    122e:	000ecf83          	lbu	t6,0(t4)
    1232:	92f1                	srli	a3,a3,0x3c
    1234:	00034e83          	lbu	t4,0(t1)
    1238:	000bc303          	lbu	t1,0(s7)
    123c:	96be                	add	a3,a3,a5
    123e:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    1240:	7761                	lui	a4,0xffff8
    1242:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1246:	00710623          	sb	t2,12(sp)
    124a:	005106a3          	sb	t0,13(sp)
    124e:	01f10723          	sb	t6,14(sp)
    1252:	01e107a3          	sb	t5,15(sp)
    1256:	01d10823          	sb	t4,16(sp)
    125a:	01c108a3          	sb	t3,17(sp)
    125e:	00610923          	sb	t1,18(sp)
    1262:	011109a3          	sb	a7,19(sp)
    1266:	01010a23          	sb	a6,20(sp)
    126a:	00a10aa3          	sb	a0,21(sp)
    126e:	00b10b23          	sb	a1,22(sp)
    1272:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    1276:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    127a:	01210523          	sb	s2,10(sp)
    127e:	008105a3          	sb	s0,11(sp)
    1282:	0006c703          	lbu	a4,0(a3)
    1286:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    128a:	4649                	li	a2,18
    128c:	002c                	addi	a1,sp,8
    128e:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1290:	00e10c23          	sb	a4,24(sp)
    1294:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1298:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    129c:	313000ef          	jal	ra,1dae <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    12a0:	00248513          	addi	a0,s1,2
    12a4:	bda5                	j	111c <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    12a6:	00064783          	lbu	a5,0(a2)
    12aa:	84b2                	mv	s1,a2
    12ac:	01278963          	beq	a5,s2,12be <printf+0x1e4>
    12b0:	b561                	j	1138 <printf+0x5e>
    12b2:	0024c783          	lbu	a5,2(s1)
    12b6:	0605                	addi	a2,a2,1
    12b8:	0489                	addi	s1,s1,2
    12ba:	e7279fe3          	bne	a5,s2,1138 <printf+0x5e>
    12be:	0014c783          	lbu	a5,1(s1)
    12c2:	ff2788e3          	beq	a5,s2,12b2 <printf+0x1d8>
        l = z - a;
    12c6:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    12ca:	85aa                	mv	a1,a0
    12cc:	8622                	mv	a2,s0
    12ce:	4505                	li	a0,1
    12d0:	2df000ef          	jal	ra,1dae <write>
        if (l)
    12d4:	e6040be3          	beqz	s0,114a <printf+0x70>
    12d8:	8526                	mv	a0,s1
        if (!*s)
    12da:	00054783          	lbu	a5,0(a0)
    12de:	e40795e3          	bnez	a5,1128 <printf+0x4e>
    }
    va_end(ap);
    12e2:	70e6                	ld	ra,120(sp)
    12e4:	7446                	ld	s0,112(sp)
    12e6:	74a6                	ld	s1,104(sp)
    12e8:	7906                	ld	s2,96(sp)
    12ea:	69e6                	ld	s3,88(sp)
    12ec:	6a46                	ld	s4,80(sp)
    12ee:	6aa6                	ld	s5,72(sp)
    12f0:	6b06                	ld	s6,64(sp)
    12f2:	7be2                	ld	s7,56(sp)
    12f4:	6129                	addi	sp,sp,192
    12f6:	8082                	ret
        switch (s[1])
    12f8:	07800713          	li	a4,120
    12fc:	24e79363          	bne	a5,a4,1542 <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    1300:	6782                	ld	a5,0(sp)
    1302:	4394                	lw	a3,0(a5)
    1304:	07a1                	addi	a5,a5,8
    1306:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1308:	2606c263          	bltz	a3,156c <printf+0x492>
        buf[i--] = digits[x % base];
    130c:	00001797          	auipc	a5,0x1
    1310:	ca478793          	addi	a5,a5,-860 # 1fb0 <digits>
    1314:	00f6f713          	andi	a4,a3,15
    1318:	973e                	add	a4,a4,a5
    131a:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff6050>
    buf[16] = 0;
    131e:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1322:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    1324:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1328:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    132c:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    1330:	0046d51b          	srliw	a0,a3,0x4
    1334:	0ad5d563          	bge	a1,a3,13de <printf+0x304>
        buf[i--] = digits[x % base];
    1338:	8a3d                	andi	a2,a2,15
    133a:	963e                	add	a2,a2,a5
    133c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1340:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    1344:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1348:	30a5fe63          	bgeu	a1,a0,1664 <printf+0x58a>
        buf[i--] = digits[x % base];
    134c:	00f77613          	andi	a2,a4,15
    1350:	963e                	add	a2,a2,a5
    1352:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1356:	45bd                	li	a1,15
    1358:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    135c:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    1360:	00475513          	srli	a0,a4,0x4
    1364:	30e5f963          	bgeu	a1,a4,1676 <printf+0x59c>
        buf[i--] = digits[x % base];
    1368:	8a3d                	andi	a2,a2,15
    136a:	963e                	add	a2,a2,a5
    136c:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    1370:	00875893          	srli	a7,a4,0x8
    1374:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    1378:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    137c:	30a5fd63          	bgeu	a1,a0,1696 <printf+0x5bc>
        buf[i--] = digits[x % base];
    1380:	8a3d                	andi	a2,a2,15
    1382:	963e                	add	a2,a2,a5
    1384:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1388:	00c75813          	srli	a6,a4,0xc
    138c:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    1390:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    1394:	3315fe63          	bgeu	a1,a7,16d0 <printf+0x5f6>
        buf[i--] = digits[x % base];
    1398:	8a3d                	andi	a2,a2,15
    139a:	963e                	add	a2,a2,a5
    139c:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13a0:	01075893          	srli	a7,a4,0x10
    13a4:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    13a8:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    13ac:	3305ff63          	bgeu	a1,a6,16ea <printf+0x610>
        buf[i--] = digits[x % base];
    13b0:	8a3d                	andi	a2,a2,15
    13b2:	963e                	add	a2,a2,a5
    13b4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    13b8:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    13bc:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    13c0:	3515f863          	bgeu	a1,a7,1710 <printf+0x636>
        buf[i--] = digits[x % base];
    13c4:	97ba                	add	a5,a5,a4
    13c6:	0007c783          	lbu	a5,0(a5)
    13ca:	45a1                	li	a1,8
    13cc:	00f10823          	sb	a5,16(sp)
    if (sign)
    13d0:	0006d763          	bgez	a3,13de <printf+0x304>
        buf[i--] = '-';
    13d4:	02d00793          	li	a5,45
    13d8:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    13dc:	459d                	li	a1,7
    write(f, s, l);
    13de:	4641                	li	a2,16
    13e0:	003c                	addi	a5,sp,8
    13e2:	9e0d                	subw	a2,a2,a1
    13e4:	4505                	li	a0,1
    13e6:	95be                	add	a1,a1,a5
    13e8:	1c7000ef          	jal	ra,1dae <write>
        s += 2;
    13ec:	00248513          	addi	a0,s1,2
    13f0:	b335                	j	111c <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    13f2:	6782                	ld	a5,0(sp)
    13f4:	6380                	ld	s0,0(a5)
    13f6:	07a1                	addi	a5,a5,8
    13f8:	e03e                	sd	a5,0(sp)
    13fa:	22040a63          	beqz	s0,162e <printf+0x554>
            l = strnlen(a, 200);
    13fe:	0c800593          	li	a1,200
    1402:	8522                	mv	a0,s0
    1404:	6cc000ef          	jal	ra,1ad0 <strnlen>
    write(f, s, l);
    1408:	0005061b          	sext.w	a2,a0
    140c:	85a2                	mv	a1,s0
    140e:	4505                	li	a0,1
    1410:	19f000ef          	jal	ra,1dae <write>
        s += 2;
    1414:	00248513          	addi	a0,s1,2
    1418:	b311                	j	111c <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    141a:	6782                	ld	a5,0(sp)
    141c:	4390                	lw	a2,0(a5)
    141e:	07a1                	addi	a5,a5,8
    1420:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1422:	1a064363          	bltz	a2,15c8 <printf+0x4ee>
        buf[i--] = digits[x % base];
    1426:	46a9                	li	a3,10
    1428:	02d6773b          	remuw	a4,a2,a3
    142c:	00001797          	auipc	a5,0x1
    1430:	b8478793          	addi	a5,a5,-1148 # 1fb0 <digits>
    buf[16] = 0;
    1434:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1438:	4525                	li	a0,9
        x = xx;
    143a:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    143e:	973e                	add	a4,a4,a5
    1440:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    1444:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    1448:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    144c:	2cc55063          	bge	a0,a2,170c <printf+0x632>
    1450:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1454:	02d5f73b          	remuw	a4,a1,a3
    1458:	1702                	slli	a4,a4,0x20
    145a:	9301                	srli	a4,a4,0x20
    145c:	973e                	add	a4,a4,a5
    145e:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    1462:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    1466:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    146a:	1f057d63          	bgeu	a0,a6,1664 <printf+0x58a>
        buf[i--] = digits[x % base];
    146e:	4529                	li	a0,10
    } while ((x /= base) != 0);
    1470:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1472:	02a5f73b          	remuw	a4,a1,a0
    1476:	973e                	add	a4,a4,a5
    1478:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    147c:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    1480:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    1484:	1ab6f163          	bgeu	a3,a1,1626 <printf+0x54c>
    1488:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    148c:	02a776bb          	remuw	a3,a4,a0
    1490:	96be                	add	a3,a3,a5
    1492:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1496:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    149a:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    149e:	20b87c63          	bgeu	a6,a1,16b6 <printf+0x5dc>
    14a2:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    14a6:	02a776bb          	remuw	a3,a4,a0
    14aa:	96be                	add	a3,a3,a5
    14ac:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14b0:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14b4:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    14b8:	20b87363          	bgeu	a6,a1,16be <printf+0x5e4>
        buf[i--] = digits[x % base];
    14bc:	02a776bb          	remuw	a3,a4,a0
    14c0:	96be                	add	a3,a3,a5
    14c2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14c6:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14ca:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    14ce:	20b9f563          	bgeu	s3,a1,16d8 <printf+0x5fe>
        buf[i--] = digits[x % base];
    14d2:	02a776bb          	remuw	a3,a4,a0
    14d6:	96be                	add	a3,a3,a5
    14d8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14dc:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14e0:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    14e4:	20bafb63          	bgeu	s5,a1,16fa <printf+0x620>
        buf[i--] = digits[x % base];
    14e8:	02a776bb          	remuw	a3,a4,a0
    14ec:	96be                	add	a3,a3,a5
    14ee:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14f2:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14f6:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    14fa:	1eba7c63          	bgeu	s4,a1,16f2 <printf+0x618>
        buf[i--] = digits[x % base];
    14fe:	02a776bb          	remuw	a3,a4,a0
    1502:	96be                	add	a3,a3,a5
    1504:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1508:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    150c:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1510:	14bb7163          	bgeu	s6,a1,1652 <printf+0x578>
        buf[i--] = digits[x % base];
    1514:	1702                	slli	a4,a4,0x20
    1516:	9301                	srli	a4,a4,0x20
    1518:	97ba                	add	a5,a5,a4
    151a:	0007c783          	lbu	a5,0(a5)
    151e:	4599                	li	a1,6
    1520:	00f10723          	sb	a5,14(sp)
    if (sign)
    1524:	ea065de3          	bgez	a2,13de <printf+0x304>
        buf[i--] = '-';
    1528:	02d00793          	li	a5,45
    152c:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1530:	4595                	li	a1,5
    write(f, s, l);
    1532:	003c                	addi	a5,sp,8
    1534:	4641                	li	a2,16
    1536:	9e0d                	subw	a2,a2,a1
    1538:	4505                	li	a0,1
    153a:	95be                	add	a1,a1,a5
    153c:	073000ef          	jal	ra,1dae <write>
    1540:	b575                	j	13ec <printf+0x312>
    char byte = c;
    1542:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1546:	4605                	li	a2,1
    1548:	002c                	addi	a1,sp,8
    154a:	4505                	li	a0,1
    char byte = c;
    154c:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1550:	05f000ef          	jal	ra,1dae <write>
    char byte = c;
    1554:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1558:	4605                	li	a2,1
    155a:	002c                	addi	a1,sp,8
    155c:	4505                	li	a0,1
    char byte = c;
    155e:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1562:	04d000ef          	jal	ra,1dae <write>
        s += 2;
    1566:	00248513          	addi	a0,s1,2
    156a:	be4d                	j	111c <printf+0x42>
        x = -xx;
    156c:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    1570:	00001797          	auipc	a5,0x1
    1574:	a4078793          	addi	a5,a5,-1472 # 1fb0 <digits>
    1578:	00f77613          	andi	a2,a4,15
    157c:	963e                	add	a2,a2,a5
    157e:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    1582:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1586:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    1588:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    158c:	0047551b          	srliw	a0,a4,0x4
    1590:	0047561b          	srliw	a2,a4,0x4
    1594:	0ab6d263          	bge	a3,a1,1638 <printf+0x55e>
        buf[i--] = digits[x % base];
    1598:	8a3d                	andi	a2,a2,15
    159a:	963e                	add	a2,a2,a5
    159c:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    15a0:	463d                	li	a2,15
    15a2:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    15a6:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    15aa:	daa661e3          	bltu	a2,a0,134c <printf+0x272>
        buf[i--] = '-';
    15ae:	02d00793          	li	a5,45
    15b2:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    15b6:	45b5                	li	a1,13
    write(f, s, l);
    15b8:	003c                	addi	a5,sp,8
    15ba:	4641                	li	a2,16
    15bc:	9e0d                	subw	a2,a2,a1
    15be:	4505                	li	a0,1
    15c0:	95be                	add	a1,a1,a5
    15c2:	7ec000ef          	jal	ra,1dae <write>
    15c6:	b51d                	j	13ec <printf+0x312>
        x = -xx;
    15c8:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    15cc:	46a9                	li	a3,10
    15ce:	02d875bb          	remuw	a1,a6,a3
    15d2:	00001797          	auipc	a5,0x1
    15d6:	9de78793          	addi	a5,a5,-1570 # 1fb0 <digits>
    buf[16] = 0;
    15da:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    15de:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    15e0:	95be                	add	a1,a1,a5
    15e2:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    15e6:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    15ea:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    15ee:	04a65563          	bge	a2,a0,1638 <printf+0x55e>
    15f2:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    15f6:	02d775bb          	remuw	a1,a4,a3
    15fa:	95be                	add	a1,a1,a5
    15fc:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    1600:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    1604:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    1608:	fb0573e3          	bgeu	a0,a6,15ae <printf+0x4d4>
        buf[i--] = digits[x % base];
    160c:	4529                	li	a0,10
    } while ((x /= base) != 0);
    160e:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1610:	02a5f73b          	remuw	a4,a1,a0
    1614:	973e                	add	a4,a4,a5
    1616:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    161a:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    161e:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    1622:	e6b6e3e3          	bltu	a3,a1,1488 <printf+0x3ae>
        buf[i--] = digits[x % base];
    1626:	45b5                	li	a1,13
    if (sign)
    1628:	da065be3          	bgez	a2,13de <printf+0x304>
    162c:	a881                	j	167c <printf+0x5a2>
                a = "(null)";
    162e:	00001417          	auipc	s0,0x1
    1632:	96240413          	addi	s0,s0,-1694 # 1f90 <unlink+0x3c>
    1636:	b3e1                	j	13fe <printf+0x324>
        buf[i--] = '-';
    1638:	02d00793          	li	a5,45
    163c:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1640:	45b9                	li	a1,14
    write(f, s, l);
    1642:	003c                	addi	a5,sp,8
    1644:	4641                	li	a2,16
    1646:	9e0d                	subw	a2,a2,a1
    1648:	4505                	li	a0,1
    164a:	95be                	add	a1,a1,a5
    164c:	762000ef          	jal	ra,1dae <write>
    1650:	bb71                	j	13ec <printf+0x312>
        buf[i--] = digits[x % base];
    1652:	459d                	li	a1,7
    if (sign)
    1654:	d80655e3          	bgez	a2,13de <printf+0x304>
        buf[i--] = '-';
    1658:	02d00793          	li	a5,45
    165c:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1660:	4599                	li	a1,6
    1662:	bbb5                	j	13de <printf+0x304>
    1664:	45b9                	li	a1,14
    write(f, s, l);
    1666:	003c                	addi	a5,sp,8
    1668:	4641                	li	a2,16
    166a:	9e0d                	subw	a2,a2,a1
    166c:	4505                	li	a0,1
    166e:	95be                	add	a1,a1,a5
    1670:	73e000ef          	jal	ra,1dae <write>
    1674:	bba5                	j	13ec <printf+0x312>
        buf[i--] = digits[x % base];
    1676:	45b5                	li	a1,13
    if (sign)
    1678:	d606d3e3          	bgez	a3,13de <printf+0x304>
        buf[i--] = '-';
    167c:	02d00793          	li	a5,45
    1680:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1684:	45b1                	li	a1,12
    write(f, s, l);
    1686:	003c                	addi	a5,sp,8
    1688:	4641                	li	a2,16
    168a:	9e0d                	subw	a2,a2,a1
    168c:	4505                	li	a0,1
    168e:	95be                	add	a1,a1,a5
    1690:	71e000ef          	jal	ra,1dae <write>
    1694:	bba1                	j	13ec <printf+0x312>
        buf[i--] = digits[x % base];
    1696:	45b1                	li	a1,12
    if (sign)
    1698:	d406d3e3          	bgez	a3,13de <printf+0x304>
        buf[i--] = '-';
    169c:	02d00793          	li	a5,45
    16a0:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    16a4:	45ad                	li	a1,11
    write(f, s, l);
    16a6:	003c                	addi	a5,sp,8
    16a8:	4641                	li	a2,16
    16aa:	9e0d                	subw	a2,a2,a1
    16ac:	4505                	li	a0,1
    16ae:	95be                	add	a1,a1,a5
    16b0:	6fe000ef          	jal	ra,1dae <write>
    16b4:	bb25                	j	13ec <printf+0x312>
        buf[i--] = digits[x % base];
    16b6:	45b1                	li	a1,12
    if (sign)
    16b8:	d20653e3          	bgez	a2,13de <printf+0x304>
    16bc:	b7c5                	j	169c <printf+0x5c2>
        buf[i--] = digits[x % base];
    16be:	45ad                	li	a1,11
    if (sign)
    16c0:	d0065fe3          	bgez	a2,13de <printf+0x304>
        buf[i--] = '-';
    16c4:	02d00793          	li	a5,45
    16c8:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    16cc:	45a9                	li	a1,10
    16ce:	bb01                	j	13de <printf+0x304>
    16d0:	45ad                	li	a1,11
    if (sign)
    16d2:	d006d6e3          	bgez	a3,13de <printf+0x304>
    16d6:	b7fd                	j	16c4 <printf+0x5ea>
        buf[i--] = digits[x % base];
    16d8:	45a9                	li	a1,10
    if (sign)
    16da:	d00652e3          	bgez	a2,13de <printf+0x304>
        buf[i--] = '-';
    16de:	02d00793          	li	a5,45
    16e2:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    16e6:	45a5                	li	a1,9
    16e8:	b9dd                	j	13de <printf+0x304>
    16ea:	45a9                	li	a1,10
    if (sign)
    16ec:	ce06d9e3          	bgez	a3,13de <printf+0x304>
    16f0:	b7fd                	j	16de <printf+0x604>
        buf[i--] = digits[x % base];
    16f2:	45a1                	li	a1,8
    if (sign)
    16f4:	ce0655e3          	bgez	a2,13de <printf+0x304>
    16f8:	b9f1                	j	13d4 <printf+0x2fa>
        buf[i--] = digits[x % base];
    16fa:	45a5                	li	a1,9
    if (sign)
    16fc:	ce0651e3          	bgez	a2,13de <printf+0x304>
        buf[i--] = '-';
    1700:	02d00793          	li	a5,45
    1704:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1708:	45a1                	li	a1,8
    170a:	b9d1                	j	13de <printf+0x304>
    i = 15;
    170c:	45bd                	li	a1,15
    170e:	b9c1                	j	13de <printf+0x304>
        buf[i--] = digits[x % base];
    1710:	45a5                	li	a1,9
    if (sign)
    1712:	cc06d6e3          	bgez	a3,13de <printf+0x304>
    1716:	b7ed                	j	1700 <printf+0x626>

0000000000001718 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1718:	02000793          	li	a5,32
    171c:	00f50663          	beq	a0,a5,1728 <isspace+0x10>
    1720:	355d                	addiw	a0,a0,-9
    1722:	00553513          	sltiu	a0,a0,5
    1726:	8082                	ret
    1728:	4505                	li	a0,1
}
    172a:	8082                	ret

000000000000172c <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    172c:	fd05051b          	addiw	a0,a0,-48
}
    1730:	00a53513          	sltiu	a0,a0,10
    1734:	8082                	ret

0000000000001736 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1736:	02000613          	li	a2,32
    173a:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    173c:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1740:	ff77069b          	addiw	a3,a4,-9
    1744:	04c70d63          	beq	a4,a2,179e <atoi+0x68>
    1748:	0007079b          	sext.w	a5,a4
    174c:	04d5f963          	bgeu	a1,a3,179e <atoi+0x68>
        s++;
    switch (*s)
    1750:	02b00693          	li	a3,43
    1754:	04d70a63          	beq	a4,a3,17a8 <atoi+0x72>
    1758:	02d00693          	li	a3,45
    175c:	06d70463          	beq	a4,a3,17c4 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1760:	fd07859b          	addiw	a1,a5,-48
    1764:	4625                	li	a2,9
    1766:	873e                	mv	a4,a5
    1768:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    176a:	4e01                	li	t3,0
    while (isdigit(*s))
    176c:	04b66a63          	bltu	a2,a1,17c0 <atoi+0x8a>
    int n = 0, neg = 0;
    1770:	4501                	li	a0,0
    while (isdigit(*s))
    1772:	4825                	li	a6,9
    1774:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1778:	0025179b          	slliw	a5,a0,0x2
    177c:	9d3d                	addw	a0,a0,a5
    177e:	fd07031b          	addiw	t1,a4,-48
    1782:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1786:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    178a:	0685                	addi	a3,a3,1
    178c:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1790:	0006071b          	sext.w	a4,a2
    1794:	feb870e3          	bgeu	a6,a1,1774 <atoi+0x3e>
    return neg ? n : -n;
    1798:	000e0563          	beqz	t3,17a2 <atoi+0x6c>
}
    179c:	8082                	ret
        s++;
    179e:	0505                	addi	a0,a0,1
    17a0:	bf71                	j	173c <atoi+0x6>
    17a2:	4113053b          	subw	a0,t1,a7
    17a6:	8082                	ret
    while (isdigit(*s))
    17a8:	00154783          	lbu	a5,1(a0)
    17ac:	4625                	li	a2,9
        s++;
    17ae:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17b2:	fd07859b          	addiw	a1,a5,-48
    17b6:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    17ba:	4e01                	li	t3,0
    while (isdigit(*s))
    17bc:	fab67ae3          	bgeu	a2,a1,1770 <atoi+0x3a>
    17c0:	4501                	li	a0,0
}
    17c2:	8082                	ret
    while (isdigit(*s))
    17c4:	00154783          	lbu	a5,1(a0)
    17c8:	4625                	li	a2,9
        s++;
    17ca:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17ce:	fd07859b          	addiw	a1,a5,-48
    17d2:	0007871b          	sext.w	a4,a5
    17d6:	feb665e3          	bltu	a2,a1,17c0 <atoi+0x8a>
        neg = 1;
    17da:	4e05                	li	t3,1
    17dc:	bf51                	j	1770 <atoi+0x3a>

00000000000017de <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    17de:	16060d63          	beqz	a2,1958 <memset+0x17a>
    17e2:	40a007b3          	neg	a5,a0
    17e6:	8b9d                	andi	a5,a5,7
    17e8:	00778713          	addi	a4,a5,7
    17ec:	482d                	li	a6,11
    17ee:	0ff5f593          	andi	a1,a1,255
    17f2:	fff60693          	addi	a3,a2,-1
    17f6:	17076263          	bltu	a4,a6,195a <memset+0x17c>
    17fa:	16e6ea63          	bltu	a3,a4,196e <memset+0x190>
    17fe:	16078563          	beqz	a5,1968 <memset+0x18a>
    1802:	00b50023          	sb	a1,0(a0)
    1806:	4705                	li	a4,1
    1808:	00150e93          	addi	t4,a0,1
    180c:	14e78c63          	beq	a5,a4,1964 <memset+0x186>
    1810:	00b500a3          	sb	a1,1(a0)
    1814:	4709                	li	a4,2
    1816:	00250e93          	addi	t4,a0,2
    181a:	14e78d63          	beq	a5,a4,1974 <memset+0x196>
    181e:	00b50123          	sb	a1,2(a0)
    1822:	470d                	li	a4,3
    1824:	00350e93          	addi	t4,a0,3
    1828:	12e78b63          	beq	a5,a4,195e <memset+0x180>
    182c:	00b501a3          	sb	a1,3(a0)
    1830:	4711                	li	a4,4
    1832:	00450e93          	addi	t4,a0,4
    1836:	14e78163          	beq	a5,a4,1978 <memset+0x19a>
    183a:	00b50223          	sb	a1,4(a0)
    183e:	4715                	li	a4,5
    1840:	00550e93          	addi	t4,a0,5
    1844:	12e78c63          	beq	a5,a4,197c <memset+0x19e>
    1848:	00b502a3          	sb	a1,5(a0)
    184c:	471d                	li	a4,7
    184e:	00650e93          	addi	t4,a0,6
    1852:	12e79763          	bne	a5,a4,1980 <memset+0x1a2>
    1856:	00750e93          	addi	t4,a0,7
    185a:	00b50323          	sb	a1,6(a0)
    185e:	4f1d                	li	t5,7
    1860:	00859713          	slli	a4,a1,0x8
    1864:	8f4d                	or	a4,a4,a1
    1866:	01059e13          	slli	t3,a1,0x10
    186a:	01c76e33          	or	t3,a4,t3
    186e:	01859313          	slli	t1,a1,0x18
    1872:	006e6333          	or	t1,t3,t1
    1876:	02059893          	slli	a7,a1,0x20
    187a:	011368b3          	or	a7,t1,a7
    187e:	02859813          	slli	a6,a1,0x28
    1882:	40f60333          	sub	t1,a2,a5
    1886:	0108e833          	or	a6,a7,a6
    188a:	03059693          	slli	a3,a1,0x30
    188e:	00d866b3          	or	a3,a6,a3
    1892:	03859713          	slli	a4,a1,0x38
    1896:	97aa                	add	a5,a5,a0
    1898:	ff837813          	andi	a6,t1,-8
    189c:	8f55                	or	a4,a4,a3
    189e:	00f806b3          	add	a3,a6,a5
    18a2:	e398                	sd	a4,0(a5)
    18a4:	07a1                	addi	a5,a5,8
    18a6:	fed79ee3          	bne	a5,a3,18a2 <memset+0xc4>
    18aa:	ff837693          	andi	a3,t1,-8
    18ae:	00de87b3          	add	a5,t4,a3
    18b2:	01e6873b          	addw	a4,a3,t5
    18b6:	0ad30663          	beq	t1,a3,1962 <memset+0x184>
    18ba:	00b78023          	sb	a1,0(a5)
    18be:	0017069b          	addiw	a3,a4,1
    18c2:	08c6fb63          	bgeu	a3,a2,1958 <memset+0x17a>
    18c6:	00b780a3          	sb	a1,1(a5)
    18ca:	0027069b          	addiw	a3,a4,2
    18ce:	08c6f563          	bgeu	a3,a2,1958 <memset+0x17a>
    18d2:	00b78123          	sb	a1,2(a5)
    18d6:	0037069b          	addiw	a3,a4,3
    18da:	06c6ff63          	bgeu	a3,a2,1958 <memset+0x17a>
    18de:	00b781a3          	sb	a1,3(a5)
    18e2:	0047069b          	addiw	a3,a4,4
    18e6:	06c6f963          	bgeu	a3,a2,1958 <memset+0x17a>
    18ea:	00b78223          	sb	a1,4(a5)
    18ee:	0057069b          	addiw	a3,a4,5
    18f2:	06c6f363          	bgeu	a3,a2,1958 <memset+0x17a>
    18f6:	00b782a3          	sb	a1,5(a5)
    18fa:	0067069b          	addiw	a3,a4,6
    18fe:	04c6fd63          	bgeu	a3,a2,1958 <memset+0x17a>
    1902:	00b78323          	sb	a1,6(a5)
    1906:	0077069b          	addiw	a3,a4,7
    190a:	04c6f763          	bgeu	a3,a2,1958 <memset+0x17a>
    190e:	00b783a3          	sb	a1,7(a5)
    1912:	0087069b          	addiw	a3,a4,8
    1916:	04c6f163          	bgeu	a3,a2,1958 <memset+0x17a>
    191a:	00b78423          	sb	a1,8(a5)
    191e:	0097069b          	addiw	a3,a4,9
    1922:	02c6fb63          	bgeu	a3,a2,1958 <memset+0x17a>
    1926:	00b784a3          	sb	a1,9(a5)
    192a:	00a7069b          	addiw	a3,a4,10
    192e:	02c6f563          	bgeu	a3,a2,1958 <memset+0x17a>
    1932:	00b78523          	sb	a1,10(a5)
    1936:	00b7069b          	addiw	a3,a4,11
    193a:	00c6ff63          	bgeu	a3,a2,1958 <memset+0x17a>
    193e:	00b785a3          	sb	a1,11(a5)
    1942:	00c7069b          	addiw	a3,a4,12
    1946:	00c6f963          	bgeu	a3,a2,1958 <memset+0x17a>
    194a:	00b78623          	sb	a1,12(a5)
    194e:	2735                	addiw	a4,a4,13
    1950:	00c77463          	bgeu	a4,a2,1958 <memset+0x17a>
    1954:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1958:	8082                	ret
    195a:	472d                	li	a4,11
    195c:	bd79                	j	17fa <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    195e:	4f0d                	li	t5,3
    1960:	b701                	j	1860 <memset+0x82>
    1962:	8082                	ret
    1964:	4f05                	li	t5,1
    1966:	bded                	j	1860 <memset+0x82>
    1968:	8eaa                	mv	t4,a0
    196a:	4f01                	li	t5,0
    196c:	bdd5                	j	1860 <memset+0x82>
    196e:	87aa                	mv	a5,a0
    1970:	4701                	li	a4,0
    1972:	b7a1                	j	18ba <memset+0xdc>
    1974:	4f09                	li	t5,2
    1976:	b5ed                	j	1860 <memset+0x82>
    1978:	4f11                	li	t5,4
    197a:	b5dd                	j	1860 <memset+0x82>
    197c:	4f15                	li	t5,5
    197e:	b5cd                	j	1860 <memset+0x82>
    1980:	4f19                	li	t5,6
    1982:	bdf9                	j	1860 <memset+0x82>

0000000000001984 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1984:	00054783          	lbu	a5,0(a0)
    1988:	0005c703          	lbu	a4,0(a1)
    198c:	00e79863          	bne	a5,a4,199c <strcmp+0x18>
    1990:	0505                	addi	a0,a0,1
    1992:	0585                	addi	a1,a1,1
    1994:	fbe5                	bnez	a5,1984 <strcmp>
    1996:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1998:	9d19                	subw	a0,a0,a4
    199a:	8082                	ret
    199c:	0007851b          	sext.w	a0,a5
    19a0:	bfe5                	j	1998 <strcmp+0x14>

00000000000019a2 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    19a2:	ce05                	beqz	a2,19da <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19a4:	00054703          	lbu	a4,0(a0)
    19a8:	0005c783          	lbu	a5,0(a1)
    19ac:	cb0d                	beqz	a4,19de <strncmp+0x3c>
    if (!n--)
    19ae:	167d                	addi	a2,a2,-1
    19b0:	00c506b3          	add	a3,a0,a2
    19b4:	a819                	j	19ca <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19b6:	00a68e63          	beq	a3,a0,19d2 <strncmp+0x30>
    19ba:	0505                	addi	a0,a0,1
    19bc:	00e79b63          	bne	a5,a4,19d2 <strncmp+0x30>
    19c0:	00054703          	lbu	a4,0(a0)
    19c4:	0005c783          	lbu	a5,0(a1)
    19c8:	cb19                	beqz	a4,19de <strncmp+0x3c>
    19ca:	0005c783          	lbu	a5,0(a1)
    19ce:	0585                	addi	a1,a1,1
    19d0:	f3fd                	bnez	a5,19b6 <strncmp+0x14>
        ;
    return *l - *r;
    19d2:	0007051b          	sext.w	a0,a4
    19d6:	9d1d                	subw	a0,a0,a5
    19d8:	8082                	ret
        return 0;
    19da:	4501                	li	a0,0
}
    19dc:	8082                	ret
    19de:	4501                	li	a0,0
    return *l - *r;
    19e0:	9d1d                	subw	a0,a0,a5
    19e2:	8082                	ret

00000000000019e4 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    19e4:	00757793          	andi	a5,a0,7
    19e8:	cf89                	beqz	a5,1a02 <strlen+0x1e>
    19ea:	87aa                	mv	a5,a0
    19ec:	a029                	j	19f6 <strlen+0x12>
    19ee:	0785                	addi	a5,a5,1
    19f0:	0077f713          	andi	a4,a5,7
    19f4:	cb01                	beqz	a4,1a04 <strlen+0x20>
        if (!*s)
    19f6:	0007c703          	lbu	a4,0(a5)
    19fa:	fb75                	bnez	a4,19ee <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    19fc:	40a78533          	sub	a0,a5,a0
}
    1a00:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1a02:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1a04:	6394                	ld	a3,0(a5)
    1a06:	00000597          	auipc	a1,0x0
    1a0a:	5925b583          	ld	a1,1426(a1) # 1f98 <unlink+0x44>
    1a0e:	00000617          	auipc	a2,0x0
    1a12:	59263603          	ld	a2,1426(a2) # 1fa0 <unlink+0x4c>
    1a16:	a019                	j	1a1c <strlen+0x38>
    1a18:	6794                	ld	a3,8(a5)
    1a1a:	07a1                	addi	a5,a5,8
    1a1c:	00b68733          	add	a4,a3,a1
    1a20:	fff6c693          	not	a3,a3
    1a24:	8f75                	and	a4,a4,a3
    1a26:	8f71                	and	a4,a4,a2
    1a28:	db65                	beqz	a4,1a18 <strlen+0x34>
    for (; *s; s++)
    1a2a:	0007c703          	lbu	a4,0(a5)
    1a2e:	d779                	beqz	a4,19fc <strlen+0x18>
    1a30:	0017c703          	lbu	a4,1(a5)
    1a34:	0785                	addi	a5,a5,1
    1a36:	d379                	beqz	a4,19fc <strlen+0x18>
    1a38:	0017c703          	lbu	a4,1(a5)
    1a3c:	0785                	addi	a5,a5,1
    1a3e:	fb6d                	bnez	a4,1a30 <strlen+0x4c>
    1a40:	bf75                	j	19fc <strlen+0x18>

0000000000001a42 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a42:	00757713          	andi	a4,a0,7
{
    1a46:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1a48:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a4c:	cb19                	beqz	a4,1a62 <memchr+0x20>
    1a4e:	ce25                	beqz	a2,1ac6 <memchr+0x84>
    1a50:	0007c703          	lbu	a4,0(a5)
    1a54:	04b70e63          	beq	a4,a1,1ab0 <memchr+0x6e>
    1a58:	0785                	addi	a5,a5,1
    1a5a:	0077f713          	andi	a4,a5,7
    1a5e:	167d                	addi	a2,a2,-1
    1a60:	f77d                	bnez	a4,1a4e <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1a62:	4501                	li	a0,0
    if (n && *s != c)
    1a64:	c235                	beqz	a2,1ac8 <memchr+0x86>
    1a66:	0007c703          	lbu	a4,0(a5)
    1a6a:	04b70363          	beq	a4,a1,1ab0 <memchr+0x6e>
        size_t k = ONES * c;
    1a6e:	00000517          	auipc	a0,0x0
    1a72:	53a53503          	ld	a0,1338(a0) # 1fa8 <unlink+0x54>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a76:	471d                	li	a4,7
        size_t k = ONES * c;
    1a78:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a7c:	02c77a63          	bgeu	a4,a2,1ab0 <memchr+0x6e>
    1a80:	00000897          	auipc	a7,0x0
    1a84:	5188b883          	ld	a7,1304(a7) # 1f98 <unlink+0x44>
    1a88:	00000817          	auipc	a6,0x0
    1a8c:	51883803          	ld	a6,1304(a6) # 1fa0 <unlink+0x4c>
    1a90:	431d                	li	t1,7
    1a92:	a029                	j	1a9c <memchr+0x5a>
    1a94:	1661                	addi	a2,a2,-8
    1a96:	07a1                	addi	a5,a5,8
    1a98:	02c37963          	bgeu	t1,a2,1aca <memchr+0x88>
    1a9c:	6398                	ld	a4,0(a5)
    1a9e:	8f29                	xor	a4,a4,a0
    1aa0:	011706b3          	add	a3,a4,a7
    1aa4:	fff74713          	not	a4,a4
    1aa8:	8f75                	and	a4,a4,a3
    1aaa:	01077733          	and	a4,a4,a6
    1aae:	d37d                	beqz	a4,1a94 <memchr+0x52>
    1ab0:	853e                	mv	a0,a5
    1ab2:	97b2                	add	a5,a5,a2
    1ab4:	a021                	j	1abc <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1ab6:	0505                	addi	a0,a0,1
    1ab8:	00f50763          	beq	a0,a5,1ac6 <memchr+0x84>
    1abc:	00054703          	lbu	a4,0(a0)
    1ac0:	feb71be3          	bne	a4,a1,1ab6 <memchr+0x74>
    1ac4:	8082                	ret
    return n ? (void *)s : 0;
    1ac6:	4501                	li	a0,0
}
    1ac8:	8082                	ret
    return n ? (void *)s : 0;
    1aca:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1acc:	f275                	bnez	a2,1ab0 <memchr+0x6e>
}
    1ace:	8082                	ret

0000000000001ad0 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1ad0:	1101                	addi	sp,sp,-32
    1ad2:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1ad4:	862e                	mv	a2,a1
{
    1ad6:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1ad8:	4581                	li	a1,0
{
    1ada:	e426                	sd	s1,8(sp)
    1adc:	ec06                	sd	ra,24(sp)
    1ade:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1ae0:	f63ff0ef          	jal	ra,1a42 <memchr>
    return p ? p - s : n;
    1ae4:	c519                	beqz	a0,1af2 <strnlen+0x22>
}
    1ae6:	60e2                	ld	ra,24(sp)
    1ae8:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1aea:	8d05                	sub	a0,a0,s1
}
    1aec:	64a2                	ld	s1,8(sp)
    1aee:	6105                	addi	sp,sp,32
    1af0:	8082                	ret
    1af2:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1af4:	8522                	mv	a0,s0
}
    1af6:	6442                	ld	s0,16(sp)
    1af8:	64a2                	ld	s1,8(sp)
    1afa:	6105                	addi	sp,sp,32
    1afc:	8082                	ret

0000000000001afe <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1afe:	00b547b3          	xor	a5,a0,a1
    1b02:	8b9d                	andi	a5,a5,7
    1b04:	eb95                	bnez	a5,1b38 <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1b06:	0075f793          	andi	a5,a1,7
    1b0a:	e7b1                	bnez	a5,1b56 <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1b0c:	6198                	ld	a4,0(a1)
    1b0e:	00000617          	auipc	a2,0x0
    1b12:	48a63603          	ld	a2,1162(a2) # 1f98 <unlink+0x44>
    1b16:	00000817          	auipc	a6,0x0
    1b1a:	48a83803          	ld	a6,1162(a6) # 1fa0 <unlink+0x4c>
    1b1e:	a029                	j	1b28 <stpcpy+0x2a>
    1b20:	e118                	sd	a4,0(a0)
    1b22:	6598                	ld	a4,8(a1)
    1b24:	05a1                	addi	a1,a1,8
    1b26:	0521                	addi	a0,a0,8
    1b28:	00c707b3          	add	a5,a4,a2
    1b2c:	fff74693          	not	a3,a4
    1b30:	8ff5                	and	a5,a5,a3
    1b32:	0107f7b3          	and	a5,a5,a6
    1b36:	d7ed                	beqz	a5,1b20 <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b38:	0005c783          	lbu	a5,0(a1)
    1b3c:	00f50023          	sb	a5,0(a0)
    1b40:	c785                	beqz	a5,1b68 <stpcpy+0x6a>
    1b42:	0015c783          	lbu	a5,1(a1)
    1b46:	0505                	addi	a0,a0,1
    1b48:	0585                	addi	a1,a1,1
    1b4a:	00f50023          	sb	a5,0(a0)
    1b4e:	fbf5                	bnez	a5,1b42 <stpcpy+0x44>
        ;
    return d;
}
    1b50:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1b52:	0505                	addi	a0,a0,1
    1b54:	df45                	beqz	a4,1b0c <stpcpy+0xe>
            if (!(*d = *s))
    1b56:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1b5a:	0585                	addi	a1,a1,1
    1b5c:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1b60:	00f50023          	sb	a5,0(a0)
    1b64:	f7fd                	bnez	a5,1b52 <stpcpy+0x54>
}
    1b66:	8082                	ret
    1b68:	8082                	ret

0000000000001b6a <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b6a:	00b547b3          	xor	a5,a0,a1
    1b6e:	8b9d                	andi	a5,a5,7
    1b70:	1a079863          	bnez	a5,1d20 <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b74:	0075f793          	andi	a5,a1,7
    1b78:	16078463          	beqz	a5,1ce0 <stpncpy+0x176>
    1b7c:	ea01                	bnez	a2,1b8c <stpncpy+0x22>
    1b7e:	a421                	j	1d86 <stpncpy+0x21c>
    1b80:	167d                	addi	a2,a2,-1
    1b82:	0505                	addi	a0,a0,1
    1b84:	14070e63          	beqz	a4,1ce0 <stpncpy+0x176>
    1b88:	1a060863          	beqz	a2,1d38 <stpncpy+0x1ce>
    1b8c:	0005c783          	lbu	a5,0(a1)
    1b90:	0585                	addi	a1,a1,1
    1b92:	0075f713          	andi	a4,a1,7
    1b96:	00f50023          	sb	a5,0(a0)
    1b9a:	f3fd                	bnez	a5,1b80 <stpncpy+0x16>
    1b9c:	4805                	li	a6,1
    1b9e:	1a061863          	bnez	a2,1d4e <stpncpy+0x1e4>
    1ba2:	40a007b3          	neg	a5,a0
    1ba6:	8b9d                	andi	a5,a5,7
    1ba8:	4681                	li	a3,0
    1baa:	18061a63          	bnez	a2,1d3e <stpncpy+0x1d4>
    1bae:	00778713          	addi	a4,a5,7
    1bb2:	45ad                	li	a1,11
    1bb4:	18b76363          	bltu	a4,a1,1d3a <stpncpy+0x1d0>
    1bb8:	1ae6eb63          	bltu	a3,a4,1d6e <stpncpy+0x204>
    1bbc:	1a078363          	beqz	a5,1d62 <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bc0:	00050023          	sb	zero,0(a0)
    1bc4:	4685                	li	a3,1
    1bc6:	00150713          	addi	a4,a0,1
    1bca:	18d78f63          	beq	a5,a3,1d68 <stpncpy+0x1fe>
    1bce:	000500a3          	sb	zero,1(a0)
    1bd2:	4689                	li	a3,2
    1bd4:	00250713          	addi	a4,a0,2
    1bd8:	18d78e63          	beq	a5,a3,1d74 <stpncpy+0x20a>
    1bdc:	00050123          	sb	zero,2(a0)
    1be0:	468d                	li	a3,3
    1be2:	00350713          	addi	a4,a0,3
    1be6:	16d78c63          	beq	a5,a3,1d5e <stpncpy+0x1f4>
    1bea:	000501a3          	sb	zero,3(a0)
    1bee:	4691                	li	a3,4
    1bf0:	00450713          	addi	a4,a0,4
    1bf4:	18d78263          	beq	a5,a3,1d78 <stpncpy+0x20e>
    1bf8:	00050223          	sb	zero,4(a0)
    1bfc:	4695                	li	a3,5
    1bfe:	00550713          	addi	a4,a0,5
    1c02:	16d78d63          	beq	a5,a3,1d7c <stpncpy+0x212>
    1c06:	000502a3          	sb	zero,5(a0)
    1c0a:	469d                	li	a3,7
    1c0c:	00650713          	addi	a4,a0,6
    1c10:	16d79863          	bne	a5,a3,1d80 <stpncpy+0x216>
    1c14:	00750713          	addi	a4,a0,7
    1c18:	00050323          	sb	zero,6(a0)
    1c1c:	40f80833          	sub	a6,a6,a5
    1c20:	ff887593          	andi	a1,a6,-8
    1c24:	97aa                	add	a5,a5,a0
    1c26:	95be                	add	a1,a1,a5
    1c28:	0007b023          	sd	zero,0(a5)
    1c2c:	07a1                	addi	a5,a5,8
    1c2e:	feb79de3          	bne	a5,a1,1c28 <stpncpy+0xbe>
    1c32:	ff887593          	andi	a1,a6,-8
    1c36:	9ead                	addw	a3,a3,a1
    1c38:	00b707b3          	add	a5,a4,a1
    1c3c:	12b80863          	beq	a6,a1,1d6c <stpncpy+0x202>
    1c40:	00078023          	sb	zero,0(a5)
    1c44:	0016871b          	addiw	a4,a3,1
    1c48:	0ec77863          	bgeu	a4,a2,1d38 <stpncpy+0x1ce>
    1c4c:	000780a3          	sb	zero,1(a5)
    1c50:	0026871b          	addiw	a4,a3,2
    1c54:	0ec77263          	bgeu	a4,a2,1d38 <stpncpy+0x1ce>
    1c58:	00078123          	sb	zero,2(a5)
    1c5c:	0036871b          	addiw	a4,a3,3
    1c60:	0cc77c63          	bgeu	a4,a2,1d38 <stpncpy+0x1ce>
    1c64:	000781a3          	sb	zero,3(a5)
    1c68:	0046871b          	addiw	a4,a3,4
    1c6c:	0cc77663          	bgeu	a4,a2,1d38 <stpncpy+0x1ce>
    1c70:	00078223          	sb	zero,4(a5)
    1c74:	0056871b          	addiw	a4,a3,5
    1c78:	0cc77063          	bgeu	a4,a2,1d38 <stpncpy+0x1ce>
    1c7c:	000782a3          	sb	zero,5(a5)
    1c80:	0066871b          	addiw	a4,a3,6
    1c84:	0ac77a63          	bgeu	a4,a2,1d38 <stpncpy+0x1ce>
    1c88:	00078323          	sb	zero,6(a5)
    1c8c:	0076871b          	addiw	a4,a3,7
    1c90:	0ac77463          	bgeu	a4,a2,1d38 <stpncpy+0x1ce>
    1c94:	000783a3          	sb	zero,7(a5)
    1c98:	0086871b          	addiw	a4,a3,8
    1c9c:	08c77e63          	bgeu	a4,a2,1d38 <stpncpy+0x1ce>
    1ca0:	00078423          	sb	zero,8(a5)
    1ca4:	0096871b          	addiw	a4,a3,9
    1ca8:	08c77863          	bgeu	a4,a2,1d38 <stpncpy+0x1ce>
    1cac:	000784a3          	sb	zero,9(a5)
    1cb0:	00a6871b          	addiw	a4,a3,10
    1cb4:	08c77263          	bgeu	a4,a2,1d38 <stpncpy+0x1ce>
    1cb8:	00078523          	sb	zero,10(a5)
    1cbc:	00b6871b          	addiw	a4,a3,11
    1cc0:	06c77c63          	bgeu	a4,a2,1d38 <stpncpy+0x1ce>
    1cc4:	000785a3          	sb	zero,11(a5)
    1cc8:	00c6871b          	addiw	a4,a3,12
    1ccc:	06c77663          	bgeu	a4,a2,1d38 <stpncpy+0x1ce>
    1cd0:	00078623          	sb	zero,12(a5)
    1cd4:	26b5                	addiw	a3,a3,13
    1cd6:	06c6f163          	bgeu	a3,a2,1d38 <stpncpy+0x1ce>
    1cda:	000786a3          	sb	zero,13(a5)
    1cde:	8082                	ret
            ;
        if (!n || !*s)
    1ce0:	c645                	beqz	a2,1d88 <stpncpy+0x21e>
    1ce2:	0005c783          	lbu	a5,0(a1)
    1ce6:	ea078be3          	beqz	a5,1b9c <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1cea:	479d                	li	a5,7
    1cec:	02c7ff63          	bgeu	a5,a2,1d2a <stpncpy+0x1c0>
    1cf0:	00000897          	auipc	a7,0x0
    1cf4:	2a88b883          	ld	a7,680(a7) # 1f98 <unlink+0x44>
    1cf8:	00000817          	auipc	a6,0x0
    1cfc:	2a883803          	ld	a6,680(a6) # 1fa0 <unlink+0x4c>
    1d00:	431d                	li	t1,7
    1d02:	6198                	ld	a4,0(a1)
    1d04:	011707b3          	add	a5,a4,a7
    1d08:	fff74693          	not	a3,a4
    1d0c:	8ff5                	and	a5,a5,a3
    1d0e:	0107f7b3          	and	a5,a5,a6
    1d12:	ef81                	bnez	a5,1d2a <stpncpy+0x1c0>
            *wd = *ws;
    1d14:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d16:	1661                	addi	a2,a2,-8
    1d18:	05a1                	addi	a1,a1,8
    1d1a:	0521                	addi	a0,a0,8
    1d1c:	fec363e3          	bltu	t1,a2,1d02 <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1d20:	e609                	bnez	a2,1d2a <stpncpy+0x1c0>
    1d22:	a08d                	j	1d84 <stpncpy+0x21a>
    1d24:	167d                	addi	a2,a2,-1
    1d26:	0505                	addi	a0,a0,1
    1d28:	ca01                	beqz	a2,1d38 <stpncpy+0x1ce>
    1d2a:	0005c783          	lbu	a5,0(a1)
    1d2e:	0585                	addi	a1,a1,1
    1d30:	00f50023          	sb	a5,0(a0)
    1d34:	fbe5                	bnez	a5,1d24 <stpncpy+0x1ba>
        ;
tail:
    1d36:	b59d                	j	1b9c <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1d38:	8082                	ret
    1d3a:	472d                	li	a4,11
    1d3c:	bdb5                	j	1bb8 <stpncpy+0x4e>
    1d3e:	00778713          	addi	a4,a5,7
    1d42:	45ad                	li	a1,11
    1d44:	fff60693          	addi	a3,a2,-1
    1d48:	e6b778e3          	bgeu	a4,a1,1bb8 <stpncpy+0x4e>
    1d4c:	b7fd                	j	1d3a <stpncpy+0x1d0>
    1d4e:	40a007b3          	neg	a5,a0
    1d52:	8832                	mv	a6,a2
    1d54:	8b9d                	andi	a5,a5,7
    1d56:	4681                	li	a3,0
    1d58:	e4060be3          	beqz	a2,1bae <stpncpy+0x44>
    1d5c:	b7cd                	j	1d3e <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d5e:	468d                	li	a3,3
    1d60:	bd75                	j	1c1c <stpncpy+0xb2>
    1d62:	872a                	mv	a4,a0
    1d64:	4681                	li	a3,0
    1d66:	bd5d                	j	1c1c <stpncpy+0xb2>
    1d68:	4685                	li	a3,1
    1d6a:	bd4d                	j	1c1c <stpncpy+0xb2>
    1d6c:	8082                	ret
    1d6e:	87aa                	mv	a5,a0
    1d70:	4681                	li	a3,0
    1d72:	b5f9                	j	1c40 <stpncpy+0xd6>
    1d74:	4689                	li	a3,2
    1d76:	b55d                	j	1c1c <stpncpy+0xb2>
    1d78:	4691                	li	a3,4
    1d7a:	b54d                	j	1c1c <stpncpy+0xb2>
    1d7c:	4695                	li	a3,5
    1d7e:	bd79                	j	1c1c <stpncpy+0xb2>
    1d80:	4699                	li	a3,6
    1d82:	bd69                	j	1c1c <stpncpy+0xb2>
    1d84:	8082                	ret
    1d86:	8082                	ret
    1d88:	8082                	ret

0000000000001d8a <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1d8a:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1d8e:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d90:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1d94:	2501                	sext.w	a0,a0
    1d96:	8082                	ret

0000000000001d98 <close>:
    register long a7 __asm__("a7") = n;
    1d98:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d9c:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1da0:	2501                	sext.w	a0,a0
    1da2:	8082                	ret

0000000000001da4 <read>:
    register long a7 __asm__("a7") = n;
    1da4:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da8:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1dac:	8082                	ret

0000000000001dae <write>:
    register long a7 __asm__("a7") = n;
    1dae:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db2:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1db6:	8082                	ret

0000000000001db8 <getpid>:
    register long a7 __asm__("a7") = n;
    1db8:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1dbc:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1dc0:	2501                	sext.w	a0,a0
    1dc2:	8082                	ret

0000000000001dc4 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1dc4:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1dc8:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1dcc:	2501                	sext.w	a0,a0
    1dce:	8082                	ret

0000000000001dd0 <fork>:
    register long a7 __asm__("a7") = n;
    1dd0:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1dd4:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1dd8:	2501                	sext.w	a0,a0
    1dda:	8082                	ret

0000000000001ddc <exit>:
    register long a7 __asm__("a7") = n;
    1ddc:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1de0:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1de4:	8082                	ret

0000000000001de6 <waitpid>:
    register long a7 __asm__("a7") = n;
    1de6:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dea:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1dee:	2501                	sext.w	a0,a0
    1df0:	8082                	ret

0000000000001df2 <exec>:
    register long a7 __asm__("a7") = n;
    1df2:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1df6:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1dfa:	2501                	sext.w	a0,a0
    1dfc:	8082                	ret

0000000000001dfe <get_time>:

int64 get_time()
{
    1dfe:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e00:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e04:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e06:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e08:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e0c:	2501                	sext.w	a0,a0
    1e0e:	ed09                	bnez	a0,1e28 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e10:	67a2                	ld	a5,8(sp)
    1e12:	3e800713          	li	a4,1000
    1e16:	00015503          	lhu	a0,0(sp)
    1e1a:	02e7d7b3          	divu	a5,a5,a4
    1e1e:	02e50533          	mul	a0,a0,a4
    1e22:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e24:	0141                	addi	sp,sp,16
    1e26:	8082                	ret
        return -1;
    1e28:	557d                	li	a0,-1
    1e2a:	bfed                	j	1e24 <get_time+0x26>

0000000000001e2c <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e2c:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e30:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <sleep>:

int sleep(unsigned long long time)
{
    1e38:	1141                	addi	sp,sp,-16
    1e3a:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1e3c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e40:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e42:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e44:	00000073          	ecall
    if (err == 0)
    1e48:	2501                	sext.w	a0,a0
    1e4a:	e13d                	bnez	a0,1eb0 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e4c:	6722                	ld	a4,8(sp)
    1e4e:	3e800693          	li	a3,1000
    1e52:	00015783          	lhu	a5,0(sp)
    1e56:	02d75733          	divu	a4,a4,a3
    1e5a:	02d787b3          	mul	a5,a5,a3
    1e5e:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1e60:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e64:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e66:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e68:	00000073          	ecall
    if (err == 0)
    1e6c:	2501                	sext.w	a0,a0
    1e6e:	ed15                	bnez	a0,1eaa <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e70:	6841                	lui	a6,0x10
    1e72:	963e                	add	a2,a2,a5
    1e74:	187d                	addi	a6,a6,-1
    1e76:	3e800693          	li	a3,1000
    1e7a:	a819                	j	1e90 <sleep+0x58>
    __asm_syscall("r"(a7))
    1e7c:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1e80:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e84:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e86:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e88:	00000073          	ecall
    if (err == 0)
    1e8c:	2501                	sext.w	a0,a0
    1e8e:	ed11                	bnez	a0,1eaa <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e90:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1e92:	07c00893          	li	a7,124
    1e96:	02d7d733          	divu	a4,a5,a3
    1e9a:	6782                	ld	a5,0(sp)
    1e9c:	0107f7b3          	and	a5,a5,a6
    1ea0:	02d787b3          	mul	a5,a5,a3
    1ea4:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1ea6:	fcc7ebe3          	bltu	a5,a2,1e7c <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1eaa:	4501                	li	a0,0
    1eac:	0141                	addi	sp,sp,16
    1eae:	8082                	ret
    1eb0:	57fd                	li	a5,-1
    1eb2:	b77d                	j	1e60 <sleep+0x28>

0000000000001eb4 <set_priority>:
    register long a7 __asm__("a7") = n;
    1eb4:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1eb8:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1ebc:	2501                	sext.w	a0,a0
    1ebe:	8082                	ret

0000000000001ec0 <mmap>:
    register long a7 __asm__("a7") = n;
    1ec0:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ec4:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1ec8:	2501                	sext.w	a0,a0
    1eca:	8082                	ret

0000000000001ecc <munmap>:
    register long a7 __asm__("a7") = n;
    1ecc:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed0:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1ed4:	2501                	sext.w	a0,a0
    1ed6:	8082                	ret

0000000000001ed8 <wait>:

int wait(int *code)
{
    1ed8:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1eda:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1ede:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ee0:	00000073          	ecall
    return waitpid(-1, code);
}
    1ee4:	2501                	sext.w	a0,a0
    1ee6:	8082                	ret

0000000000001ee8 <spawn>:
    register long a7 __asm__("a7") = n;
    1ee8:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1eec:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1ef0:	2501                	sext.w	a0,a0
    1ef2:	8082                	ret

0000000000001ef4 <mailread>:
    register long a7 __asm__("a7") = n;
    1ef4:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef8:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1efc:	2501                	sext.w	a0,a0
    1efe:	8082                	ret

0000000000001f00 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f00:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f04:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f08:	2501                	sext.w	a0,a0
    1f0a:	8082                	ret

0000000000001f0c <fstat>:
    register long a7 __asm__("a7") = n;
    1f0c:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f10:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f14:	2501                	sext.w	a0,a0
    1f16:	8082                	ret

0000000000001f18 <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1f18:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f1a:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f1e:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f20:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f24:	2501                	sext.w	a0,a0
    1f26:	8082                	ret

0000000000001f28 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f28:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f2a:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f2e:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f30:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f34:	2501                	sext.w	a0,a0
    1f36:	8082                	ret

0000000000001f38 <link>:

int link(char *old_path, char *new_path)
{
    1f38:	87aa                	mv	a5,a0
    1f3a:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f3c:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f40:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f44:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f46:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f4a:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f4c:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f50:	2501                	sext.w	a0,a0
    1f52:	8082                	ret

0000000000001f54 <unlink>:

int unlink(char *path)
{
    1f54:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f56:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f5a:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f5e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f60:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f64:	2501                	sext.w	a0,a0
    1f66:	8082                	ret
