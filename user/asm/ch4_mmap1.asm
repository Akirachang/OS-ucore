
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch4_mmap1:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	03c0006f          	j	103e <__start_main>

0000000000001006 <main>:
/*
理想结果：程序触发访存异常，被杀死。不输出 error 就算过。
*/

int main()
{
    1006:	1141                	addi	sp,sp,-16
    uint64 start = 0x10000000;
    uint64 len = 4096;
    int prot = 1;
    assert(len == mmap((void *)start, len, prot));
    1008:	4605                	li	a2,1
    100a:	6585                	lui	a1,0x1
    100c:	10000537          	lui	a0,0x10000
{
    1010:	e406                	sd	ra,8(sp)
    assert(len == mmap((void *)start, len, prot));
    1012:	6a5000ef          	jal	ra,1eb6 <mmap>
    1016:	6785                	lui	a5,0x1
    1018:	00f50563          	beq	a0,a5,1022 <main+0x1c>
    101c:	557d                	li	a0,-1
    101e:	5b5000ef          	jal	ra,1dd2 <exit>
    uint8 *addr = (uint8 *)start;
    *addr = (uint8)start;
    1022:	100007b7          	lui	a5,0x10000
    1026:	00078023          	sb	zero,0(a5) # 10000000 <digits+0xfffe058>
    puts("Should cause error, Test 04_2 fail!");
    102a:	00001517          	auipc	a0,0x1
    102e:	f3650513          	addi	a0,a0,-202 # 1f60 <unlink+0x16>
    1032:	05c000ef          	jal	ra,108e <puts>
    return 0;
    1036:	60a2                	ld	ra,8(sp)
    1038:	4501                	li	a0,0
    103a:	0141                	addi	sp,sp,16
    103c:	8082                	ret

000000000000103e <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    103e:	1141                	addi	sp,sp,-16
    1040:	e406                	sd	ra,8(sp)
    exit(main());
    1042:	fc5ff0ef          	jal	ra,1006 <main>
    1046:	58d000ef          	jal	ra,1dd2 <exit>
    return 0;
}
    104a:	60a2                	ld	ra,8(sp)
    104c:	4501                	li	a0,0
    104e:	0141                	addi	sp,sp,16
    1050:	8082                	ret

0000000000001052 <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    1052:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    1054:	00f10593          	addi	a1,sp,15
    1058:	4605                	li	a2,1
    105a:	4501                	li	a0,0
{
    105c:	ec06                	sd	ra,24(sp)
    char byte = 0;
    105e:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1062:	539000ef          	jal	ra,1d9a <read>
    return byte;
}
    1066:	60e2                	ld	ra,24(sp)
    1068:	00f14503          	lbu	a0,15(sp)
    106c:	6105                	addi	sp,sp,32
    106e:	8082                	ret

0000000000001070 <putchar>:

int putchar(int c)
{
    1070:	1101                	addi	sp,sp,-32
    1072:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    1074:	00f10593          	addi	a1,sp,15
    1078:	4605                	li	a2,1
    107a:	4505                	li	a0,1
{
    107c:	ec06                	sd	ra,24(sp)
    char byte = c;
    107e:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1082:	523000ef          	jal	ra,1da4 <write>
}
    1086:	60e2                	ld	ra,24(sp)
    1088:	2501                	sext.w	a0,a0
    108a:	6105                	addi	sp,sp,32
    108c:	8082                	ret

000000000000108e <puts>:

int puts(const char *s)
{
    108e:	1101                	addi	sp,sp,-32
    1090:	e822                	sd	s0,16(sp)
    1092:	ec06                	sd	ra,24(sp)
    1094:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    1096:	145000ef          	jal	ra,19da <strlen>
    109a:	862a                	mv	a2,a0
    109c:	85a2                	mv	a1,s0
    109e:	4505                	li	a0,1
    10a0:	505000ef          	jal	ra,1da4 <write>
    10a4:	00055763          	bgez	a0,10b2 <puts+0x24>
    return r;
}
    10a8:	60e2                	ld	ra,24(sp)
    10aa:	6442                	ld	s0,16(sp)
    10ac:	557d                	li	a0,-1
    10ae:	6105                	addi	sp,sp,32
    10b0:	8082                	ret
    return write(stdout, &byte, 1);
    10b2:	00f10593          	addi	a1,sp,15
    char byte = c;
    10b6:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    10b8:	4605                	li	a2,1
    10ba:	4505                	li	a0,1
    char byte = c;
    10bc:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    10c0:	4e5000ef          	jal	ra,1da4 <write>
}
    10c4:	60e2                	ld	ra,24(sp)
    10c6:	6442                	ld	s0,16(sp)
    10c8:	41f5551b          	sraiw	a0,a0,0x1f
    10cc:	6105                	addi	sp,sp,32
    10ce:	8082                	ret

00000000000010d0 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    10d0:	7131                	addi	sp,sp,-192
    10d2:	ecce                	sd	s3,88(sp)
    10d4:	e8d2                	sd	s4,80(sp)
    10d6:	e4d6                	sd	s5,72(sp)
    10d8:	e0da                	sd	s6,64(sp)
    10da:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    10dc:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    10de:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    10e0:	6ae1                	lui	s5,0x18
    10e2:	000f4a37          	lui	s4,0xf4
    10e6:	00989b37          	lui	s6,0x989
{
    10ea:	fc86                	sd	ra,120(sp)
    10ec:	f8a2                	sd	s0,112(sp)
    10ee:	f4a6                	sd	s1,104(sp)
    10f0:	f0ca                	sd	s2,96(sp)
    10f2:	fc5e                	sd	s7,56(sp)
    10f4:	e52e                	sd	a1,136(sp)
    10f6:	e932                	sd	a2,144(sp)
    10f8:	ed36                	sd	a3,152(sp)
    10fa:	f13a                	sd	a4,160(sp)
    10fc:	f942                	sd	a6,176(sp)
    10fe:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1100:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    1102:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x767>
    1106:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x166f7>
    110a:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf2297>
    110e:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x9876d7>
    for (;;)
    {
        if (!*s)
    1112:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    1116:	02500913          	li	s2,37
        if (!*s)
    111a:	1a078f63          	beqz	a5,12d8 <printf+0x208>
    111e:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1120:	17278e63          	beq	a5,s2,129c <printf+0x1cc>
    1124:	00164783          	lbu	a5,1(a2)
    1128:	0605                	addi	a2,a2,1
    112a:	fbfd                	bnez	a5,1120 <printf+0x50>
    112c:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    112e:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1132:	85aa                	mv	a1,a0
    1134:	8622                	mv	a2,s0
    1136:	4505                	li	a0,1
    1138:	46d000ef          	jal	ra,1da4 <write>
        out(f, a, l);
        if (l)
    113c:	18041963          	bnez	s0,12ce <printf+0x1fe>
            continue;
        if (s[1] == 0)
    1140:	0014c783          	lbu	a5,1(s1)
    1144:	18078a63          	beqz	a5,12d8 <printf+0x208>
            break;
        switch (s[1])
    1148:	07300713          	li	a4,115
    114c:	28e78e63          	beq	a5,a4,13e8 <printf+0x318>
    1150:	18f76f63          	bltu	a4,a5,12ee <printf+0x21e>
    1154:	06400713          	li	a4,100
    1158:	2ae78c63          	beq	a5,a4,1410 <printf+0x340>
    115c:	07000713          	li	a4,112
    1160:	3ce79c63          	bne	a5,a4,1538 <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1164:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1166:	00001797          	auipc	a5,0x1
    116a:	e4278793          	addi	a5,a5,-446 # 1fa8 <digits>
            printptr(va_arg(ap, uint64));
    116e:	6298                	ld	a4,0(a3)
    1170:	00868093          	addi	ra,a3,8
    1174:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1176:	00471293          	slli	t0,a4,0x4
    117a:	00c71f13          	slli	t5,a4,0xc
    117e:	01471e13          	slli	t3,a4,0x14
    1182:	01c71893          	slli	a7,a4,0x1c
    1186:	02471813          	slli	a6,a4,0x24
    118a:	02871513          	slli	a0,a4,0x28
    118e:	02c71593          	slli	a1,a4,0x2c
    1192:	03071693          	slli	a3,a4,0x30
    1196:	00871f93          	slli	t6,a4,0x8
    119a:	01071e93          	slli	t4,a4,0x10
    119e:	01871313          	slli	t1,a4,0x18
    11a2:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    11a6:	03c2d293          	srli	t0,t0,0x3c
    11aa:	03cf5f13          	srli	t5,t5,0x3c
    11ae:	03ce5e13          	srli	t3,t3,0x3c
    11b2:	03c8d893          	srli	a7,a7,0x3c
    11b6:	03c85813          	srli	a6,a6,0x3c
    11ba:	9171                	srli	a0,a0,0x3c
    11bc:	91f1                	srli	a1,a1,0x3c
    11be:	92f1                	srli	a3,a3,0x3c
    11c0:	92be                	add	t0,t0,a5
    11c2:	9f3e                	add	t5,t5,a5
    11c4:	9e3e                	add	t3,t3,a5
    11c6:	98be                	add	a7,a7,a5
    11c8:	983e                	add	a6,a6,a5
    11ca:	953e                	add	a0,a0,a5
    11cc:	95be                	add	a1,a1,a5
    11ce:	96be                	add	a3,a3,a5
    11d0:	03c75393          	srli	t2,a4,0x3c
    11d4:	01c75b9b          	srliw	s7,a4,0x1c
    11d8:	03cfdf93          	srli	t6,t6,0x3c
    11dc:	03cede93          	srli	t4,t4,0x3c
    11e0:	03c35313          	srli	t1,t1,0x3c
    11e4:	9271                	srli	a2,a2,0x3c
    11e6:	0002c403          	lbu	s0,0(t0)
    11ea:	93be                	add	t2,t2,a5
    11ec:	000f4283          	lbu	t0,0(t5)
    11f0:	9fbe                	add	t6,t6,a5
    11f2:	000e4f03          	lbu	t5,0(t3)
    11f6:	9ebe                	add	t4,t4,a5
    11f8:	0008ce03          	lbu	t3,0(a7)
    11fc:	933e                	add	t1,t1,a5
    11fe:	00084883          	lbu	a7,0(a6)
    1202:	9bbe                	add	s7,s7,a5
    1204:	00054803          	lbu	a6,0(a0)
    1208:	963e                	add	a2,a2,a5
    120a:	0005c503          	lbu	a0,0(a1) # 1000 <_start>
    120e:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1212:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1216:	0003c903          	lbu	s2,0(t2)
    121a:	00064603          	lbu	a2,0(a2)
    121e:	000fc383          	lbu	t2,0(t6)
    1222:	8b3d                	andi	a4,a4,15
    1224:	000ecf83          	lbu	t6,0(t4)
    1228:	92f1                	srli	a3,a3,0x3c
    122a:	00034e83          	lbu	t4,0(t1)
    122e:	000bc303          	lbu	t1,0(s7)
    1232:	96be                	add	a3,a3,a5
    1234:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    1236:	7761                	lui	a4,0xffff8
    1238:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    123c:	00710623          	sb	t2,12(sp)
    1240:	005106a3          	sb	t0,13(sp)
    1244:	01f10723          	sb	t6,14(sp)
    1248:	01e107a3          	sb	t5,15(sp)
    124c:	01d10823          	sb	t4,16(sp)
    1250:	01c108a3          	sb	t3,17(sp)
    1254:	00610923          	sb	t1,18(sp)
    1258:	011109a3          	sb	a7,19(sp)
    125c:	01010a23          	sb	a6,20(sp)
    1260:	00a10aa3          	sb	a0,21(sp)
    1264:	00b10b23          	sb	a1,22(sp)
    1268:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    126c:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1270:	01210523          	sb	s2,10(sp)
    1274:	008105a3          	sb	s0,11(sp)
    1278:	0006c703          	lbu	a4,0(a3)
    127c:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1280:	4649                	li	a2,18
    1282:	002c                	addi	a1,sp,8
    1284:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1286:	00e10c23          	sb	a4,24(sp)
    128a:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    128e:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1292:	313000ef          	jal	ra,1da4 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1296:	00248513          	addi	a0,s1,2
    129a:	bda5                	j	1112 <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    129c:	00064783          	lbu	a5,0(a2)
    12a0:	84b2                	mv	s1,a2
    12a2:	01278963          	beq	a5,s2,12b4 <printf+0x1e4>
    12a6:	b561                	j	112e <printf+0x5e>
    12a8:	0024c783          	lbu	a5,2(s1)
    12ac:	0605                	addi	a2,a2,1
    12ae:	0489                	addi	s1,s1,2
    12b0:	e7279fe3          	bne	a5,s2,112e <printf+0x5e>
    12b4:	0014c783          	lbu	a5,1(s1)
    12b8:	ff2788e3          	beq	a5,s2,12a8 <printf+0x1d8>
        l = z - a;
    12bc:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    12c0:	85aa                	mv	a1,a0
    12c2:	8622                	mv	a2,s0
    12c4:	4505                	li	a0,1
    12c6:	2df000ef          	jal	ra,1da4 <write>
        if (l)
    12ca:	e6040be3          	beqz	s0,1140 <printf+0x70>
    12ce:	8526                	mv	a0,s1
        if (!*s)
    12d0:	00054783          	lbu	a5,0(a0)
    12d4:	e40795e3          	bnez	a5,111e <printf+0x4e>
    }
    va_end(ap);
    12d8:	70e6                	ld	ra,120(sp)
    12da:	7446                	ld	s0,112(sp)
    12dc:	74a6                	ld	s1,104(sp)
    12de:	7906                	ld	s2,96(sp)
    12e0:	69e6                	ld	s3,88(sp)
    12e2:	6a46                	ld	s4,80(sp)
    12e4:	6aa6                	ld	s5,72(sp)
    12e6:	6b06                	ld	s6,64(sp)
    12e8:	7be2                	ld	s7,56(sp)
    12ea:	6129                	addi	sp,sp,192
    12ec:	8082                	ret
        switch (s[1])
    12ee:	07800713          	li	a4,120
    12f2:	24e79363          	bne	a5,a4,1538 <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    12f6:	6782                	ld	a5,0(sp)
    12f8:	4394                	lw	a3,0(a5)
    12fa:	07a1                	addi	a5,a5,8
    12fc:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    12fe:	2606c263          	bltz	a3,1562 <printf+0x492>
        buf[i--] = digits[x % base];
    1302:	00001797          	auipc	a5,0x1
    1306:	ca678793          	addi	a5,a5,-858 # 1fa8 <digits>
    130a:	00f6f713          	andi	a4,a3,15
    130e:	973e                	add	a4,a4,a5
    1310:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff6058>
    buf[16] = 0;
    1314:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1318:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    131a:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    131e:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    1322:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    1326:	0046d51b          	srliw	a0,a3,0x4
    132a:	0ad5d563          	bge	a1,a3,13d4 <printf+0x304>
        buf[i--] = digits[x % base];
    132e:	8a3d                	andi	a2,a2,15
    1330:	963e                	add	a2,a2,a5
    1332:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1336:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    133a:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    133e:	30a5fe63          	bgeu	a1,a0,165a <printf+0x58a>
        buf[i--] = digits[x % base];
    1342:	00f77613          	andi	a2,a4,15
    1346:	963e                	add	a2,a2,a5
    1348:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    134c:	45bd                	li	a1,15
    134e:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    1352:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    1356:	00475513          	srli	a0,a4,0x4
    135a:	30e5f963          	bgeu	a1,a4,166c <printf+0x59c>
        buf[i--] = digits[x % base];
    135e:	8a3d                	andi	a2,a2,15
    1360:	963e                	add	a2,a2,a5
    1362:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    1366:	00875893          	srli	a7,a4,0x8
    136a:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    136e:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    1372:	30a5fd63          	bgeu	a1,a0,168c <printf+0x5bc>
        buf[i--] = digits[x % base];
    1376:	8a3d                	andi	a2,a2,15
    1378:	963e                	add	a2,a2,a5
    137a:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    137e:	00c75813          	srli	a6,a4,0xc
    1382:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    1386:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    138a:	3315fe63          	bgeu	a1,a7,16c6 <printf+0x5f6>
        buf[i--] = digits[x % base];
    138e:	8a3d                	andi	a2,a2,15
    1390:	963e                	add	a2,a2,a5
    1392:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1396:	01075893          	srli	a7,a4,0x10
    139a:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    139e:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    13a2:	3305ff63          	bgeu	a1,a6,16e0 <printf+0x610>
        buf[i--] = digits[x % base];
    13a6:	8a3d                	andi	a2,a2,15
    13a8:	963e                	add	a2,a2,a5
    13aa:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    13ae:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    13b2:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    13b6:	3515f863          	bgeu	a1,a7,1706 <printf+0x636>
        buf[i--] = digits[x % base];
    13ba:	97ba                	add	a5,a5,a4
    13bc:	0007c783          	lbu	a5,0(a5)
    13c0:	45a1                	li	a1,8
    13c2:	00f10823          	sb	a5,16(sp)
    if (sign)
    13c6:	0006d763          	bgez	a3,13d4 <printf+0x304>
        buf[i--] = '-';
    13ca:	02d00793          	li	a5,45
    13ce:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    13d2:	459d                	li	a1,7
    write(f, s, l);
    13d4:	4641                	li	a2,16
    13d6:	003c                	addi	a5,sp,8
    13d8:	9e0d                	subw	a2,a2,a1
    13da:	4505                	li	a0,1
    13dc:	95be                	add	a1,a1,a5
    13de:	1c7000ef          	jal	ra,1da4 <write>
        s += 2;
    13e2:	00248513          	addi	a0,s1,2
    13e6:	b335                	j	1112 <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    13e8:	6782                	ld	a5,0(sp)
    13ea:	6380                	ld	s0,0(a5)
    13ec:	07a1                	addi	a5,a5,8
    13ee:	e03e                	sd	a5,0(sp)
    13f0:	22040a63          	beqz	s0,1624 <printf+0x554>
            l = strnlen(a, 200);
    13f4:	0c800593          	li	a1,200
    13f8:	8522                	mv	a0,s0
    13fa:	6cc000ef          	jal	ra,1ac6 <strnlen>
    write(f, s, l);
    13fe:	0005061b          	sext.w	a2,a0
    1402:	85a2                	mv	a1,s0
    1404:	4505                	li	a0,1
    1406:	19f000ef          	jal	ra,1da4 <write>
        s += 2;
    140a:	00248513          	addi	a0,s1,2
    140e:	b311                	j	1112 <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    1410:	6782                	ld	a5,0(sp)
    1412:	4390                	lw	a2,0(a5)
    1414:	07a1                	addi	a5,a5,8
    1416:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1418:	1a064363          	bltz	a2,15be <printf+0x4ee>
        buf[i--] = digits[x % base];
    141c:	46a9                	li	a3,10
    141e:	02d6773b          	remuw	a4,a2,a3
    1422:	00001797          	auipc	a5,0x1
    1426:	b8678793          	addi	a5,a5,-1146 # 1fa8 <digits>
    buf[16] = 0;
    142a:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    142e:	4525                	li	a0,9
        x = xx;
    1430:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    1434:	973e                	add	a4,a4,a5
    1436:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    143a:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    143e:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1442:	2cc55063          	bge	a0,a2,1702 <printf+0x632>
    1446:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    144a:	02d5f73b          	remuw	a4,a1,a3
    144e:	1702                	slli	a4,a4,0x20
    1450:	9301                	srli	a4,a4,0x20
    1452:	973e                	add	a4,a4,a5
    1454:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    1458:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    145c:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    1460:	1f057d63          	bgeu	a0,a6,165a <printf+0x58a>
        buf[i--] = digits[x % base];
    1464:	4529                	li	a0,10
    } while ((x /= base) != 0);
    1466:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1468:	02a5f73b          	remuw	a4,a1,a0
    146c:	973e                	add	a4,a4,a5
    146e:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    1472:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    1476:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    147a:	1ab6f163          	bgeu	a3,a1,161c <printf+0x54c>
    147e:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    1482:	02a776bb          	remuw	a3,a4,a0
    1486:	96be                	add	a3,a3,a5
    1488:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    148c:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1490:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1494:	20b87c63          	bgeu	a6,a1,16ac <printf+0x5dc>
    1498:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    149c:	02a776bb          	remuw	a3,a4,a0
    14a0:	96be                	add	a3,a3,a5
    14a2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14a6:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14aa:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    14ae:	20b87363          	bgeu	a6,a1,16b4 <printf+0x5e4>
        buf[i--] = digits[x % base];
    14b2:	02a776bb          	remuw	a3,a4,a0
    14b6:	96be                	add	a3,a3,a5
    14b8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14bc:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14c0:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    14c4:	20b9f563          	bgeu	s3,a1,16ce <printf+0x5fe>
        buf[i--] = digits[x % base];
    14c8:	02a776bb          	remuw	a3,a4,a0
    14cc:	96be                	add	a3,a3,a5
    14ce:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14d2:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14d6:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    14da:	20bafb63          	bgeu	s5,a1,16f0 <printf+0x620>
        buf[i--] = digits[x % base];
    14de:	02a776bb          	remuw	a3,a4,a0
    14e2:	96be                	add	a3,a3,a5
    14e4:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14e8:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14ec:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    14f0:	1eba7c63          	bgeu	s4,a1,16e8 <printf+0x618>
        buf[i--] = digits[x % base];
    14f4:	02a776bb          	remuw	a3,a4,a0
    14f8:	96be                	add	a3,a3,a5
    14fa:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14fe:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1502:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1506:	14bb7163          	bgeu	s6,a1,1648 <printf+0x578>
        buf[i--] = digits[x % base];
    150a:	1702                	slli	a4,a4,0x20
    150c:	9301                	srli	a4,a4,0x20
    150e:	97ba                	add	a5,a5,a4
    1510:	0007c783          	lbu	a5,0(a5)
    1514:	4599                	li	a1,6
    1516:	00f10723          	sb	a5,14(sp)
    if (sign)
    151a:	ea065de3          	bgez	a2,13d4 <printf+0x304>
        buf[i--] = '-';
    151e:	02d00793          	li	a5,45
    1522:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1526:	4595                	li	a1,5
    write(f, s, l);
    1528:	003c                	addi	a5,sp,8
    152a:	4641                	li	a2,16
    152c:	9e0d                	subw	a2,a2,a1
    152e:	4505                	li	a0,1
    1530:	95be                	add	a1,a1,a5
    1532:	073000ef          	jal	ra,1da4 <write>
    1536:	b575                	j	13e2 <printf+0x312>
    char byte = c;
    1538:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    153c:	4605                	li	a2,1
    153e:	002c                	addi	a1,sp,8
    1540:	4505                	li	a0,1
    char byte = c;
    1542:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1546:	05f000ef          	jal	ra,1da4 <write>
    char byte = c;
    154a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    154e:	4605                	li	a2,1
    1550:	002c                	addi	a1,sp,8
    1552:	4505                	li	a0,1
    char byte = c;
    1554:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1558:	04d000ef          	jal	ra,1da4 <write>
        s += 2;
    155c:	00248513          	addi	a0,s1,2
    1560:	be4d                	j	1112 <printf+0x42>
        x = -xx;
    1562:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    1566:	00001797          	auipc	a5,0x1
    156a:	a4278793          	addi	a5,a5,-1470 # 1fa8 <digits>
    156e:	00f77613          	andi	a2,a4,15
    1572:	963e                	add	a2,a2,a5
    1574:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    1578:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    157c:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    157e:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1582:	0047551b          	srliw	a0,a4,0x4
    1586:	0047561b          	srliw	a2,a4,0x4
    158a:	0ab6d263          	bge	a3,a1,162e <printf+0x55e>
        buf[i--] = digits[x % base];
    158e:	8a3d                	andi	a2,a2,15
    1590:	963e                	add	a2,a2,a5
    1592:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    1596:	463d                	li	a2,15
    1598:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    159c:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    15a0:	daa661e3          	bltu	a2,a0,1342 <printf+0x272>
        buf[i--] = '-';
    15a4:	02d00793          	li	a5,45
    15a8:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    15ac:	45b5                	li	a1,13
    write(f, s, l);
    15ae:	003c                	addi	a5,sp,8
    15b0:	4641                	li	a2,16
    15b2:	9e0d                	subw	a2,a2,a1
    15b4:	4505                	li	a0,1
    15b6:	95be                	add	a1,a1,a5
    15b8:	7ec000ef          	jal	ra,1da4 <write>
    15bc:	b51d                	j	13e2 <printf+0x312>
        x = -xx;
    15be:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    15c2:	46a9                	li	a3,10
    15c4:	02d875bb          	remuw	a1,a6,a3
    15c8:	00001797          	auipc	a5,0x1
    15cc:	9e078793          	addi	a5,a5,-1568 # 1fa8 <digits>
    buf[16] = 0;
    15d0:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    15d4:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    15d6:	95be                	add	a1,a1,a5
    15d8:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    15dc:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    15e0:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    15e4:	04a65563          	bge	a2,a0,162e <printf+0x55e>
    15e8:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    15ec:	02d775bb          	remuw	a1,a4,a3
    15f0:	95be                	add	a1,a1,a5
    15f2:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    15f6:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    15fa:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    15fe:	fb0573e3          	bgeu	a0,a6,15a4 <printf+0x4d4>
        buf[i--] = digits[x % base];
    1602:	4529                	li	a0,10
    } while ((x /= base) != 0);
    1604:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1606:	02a5f73b          	remuw	a4,a1,a0
    160a:	973e                	add	a4,a4,a5
    160c:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    1610:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    1614:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    1618:	e6b6e3e3          	bltu	a3,a1,147e <printf+0x3ae>
        buf[i--] = digits[x % base];
    161c:	45b5                	li	a1,13
    if (sign)
    161e:	da065be3          	bgez	a2,13d4 <printf+0x304>
    1622:	a881                	j	1672 <printf+0x5a2>
                a = "(null)";
    1624:	00001417          	auipc	s0,0x1
    1628:	96440413          	addi	s0,s0,-1692 # 1f88 <unlink+0x3e>
    162c:	b3e1                	j	13f4 <printf+0x324>
        buf[i--] = '-';
    162e:	02d00793          	li	a5,45
    1632:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1636:	45b9                	li	a1,14
    write(f, s, l);
    1638:	003c                	addi	a5,sp,8
    163a:	4641                	li	a2,16
    163c:	9e0d                	subw	a2,a2,a1
    163e:	4505                	li	a0,1
    1640:	95be                	add	a1,a1,a5
    1642:	762000ef          	jal	ra,1da4 <write>
    1646:	bb71                	j	13e2 <printf+0x312>
        buf[i--] = digits[x % base];
    1648:	459d                	li	a1,7
    if (sign)
    164a:	d80655e3          	bgez	a2,13d4 <printf+0x304>
        buf[i--] = '-';
    164e:	02d00793          	li	a5,45
    1652:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1656:	4599                	li	a1,6
    1658:	bbb5                	j	13d4 <printf+0x304>
    165a:	45b9                	li	a1,14
    write(f, s, l);
    165c:	003c                	addi	a5,sp,8
    165e:	4641                	li	a2,16
    1660:	9e0d                	subw	a2,a2,a1
    1662:	4505                	li	a0,1
    1664:	95be                	add	a1,a1,a5
    1666:	73e000ef          	jal	ra,1da4 <write>
    166a:	bba5                	j	13e2 <printf+0x312>
        buf[i--] = digits[x % base];
    166c:	45b5                	li	a1,13
    if (sign)
    166e:	d606d3e3          	bgez	a3,13d4 <printf+0x304>
        buf[i--] = '-';
    1672:	02d00793          	li	a5,45
    1676:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    167a:	45b1                	li	a1,12
    write(f, s, l);
    167c:	003c                	addi	a5,sp,8
    167e:	4641                	li	a2,16
    1680:	9e0d                	subw	a2,a2,a1
    1682:	4505                	li	a0,1
    1684:	95be                	add	a1,a1,a5
    1686:	71e000ef          	jal	ra,1da4 <write>
    168a:	bba1                	j	13e2 <printf+0x312>
        buf[i--] = digits[x % base];
    168c:	45b1                	li	a1,12
    if (sign)
    168e:	d406d3e3          	bgez	a3,13d4 <printf+0x304>
        buf[i--] = '-';
    1692:	02d00793          	li	a5,45
    1696:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    169a:	45ad                	li	a1,11
    write(f, s, l);
    169c:	003c                	addi	a5,sp,8
    169e:	4641                	li	a2,16
    16a0:	9e0d                	subw	a2,a2,a1
    16a2:	4505                	li	a0,1
    16a4:	95be                	add	a1,a1,a5
    16a6:	6fe000ef          	jal	ra,1da4 <write>
    16aa:	bb25                	j	13e2 <printf+0x312>
        buf[i--] = digits[x % base];
    16ac:	45b1                	li	a1,12
    if (sign)
    16ae:	d20653e3          	bgez	a2,13d4 <printf+0x304>
    16b2:	b7c5                	j	1692 <printf+0x5c2>
        buf[i--] = digits[x % base];
    16b4:	45ad                	li	a1,11
    if (sign)
    16b6:	d0065fe3          	bgez	a2,13d4 <printf+0x304>
        buf[i--] = '-';
    16ba:	02d00793          	li	a5,45
    16be:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    16c2:	45a9                	li	a1,10
    16c4:	bb01                	j	13d4 <printf+0x304>
    16c6:	45ad                	li	a1,11
    if (sign)
    16c8:	d006d6e3          	bgez	a3,13d4 <printf+0x304>
    16cc:	b7fd                	j	16ba <printf+0x5ea>
        buf[i--] = digits[x % base];
    16ce:	45a9                	li	a1,10
    if (sign)
    16d0:	d00652e3          	bgez	a2,13d4 <printf+0x304>
        buf[i--] = '-';
    16d4:	02d00793          	li	a5,45
    16d8:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    16dc:	45a5                	li	a1,9
    16de:	b9dd                	j	13d4 <printf+0x304>
    16e0:	45a9                	li	a1,10
    if (sign)
    16e2:	ce06d9e3          	bgez	a3,13d4 <printf+0x304>
    16e6:	b7fd                	j	16d4 <printf+0x604>
        buf[i--] = digits[x % base];
    16e8:	45a1                	li	a1,8
    if (sign)
    16ea:	ce0655e3          	bgez	a2,13d4 <printf+0x304>
    16ee:	b9f1                	j	13ca <printf+0x2fa>
        buf[i--] = digits[x % base];
    16f0:	45a5                	li	a1,9
    if (sign)
    16f2:	ce0651e3          	bgez	a2,13d4 <printf+0x304>
        buf[i--] = '-';
    16f6:	02d00793          	li	a5,45
    16fa:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    16fe:	45a1                	li	a1,8
    1700:	b9d1                	j	13d4 <printf+0x304>
    i = 15;
    1702:	45bd                	li	a1,15
    1704:	b9c1                	j	13d4 <printf+0x304>
        buf[i--] = digits[x % base];
    1706:	45a5                	li	a1,9
    if (sign)
    1708:	cc06d6e3          	bgez	a3,13d4 <printf+0x304>
    170c:	b7ed                	j	16f6 <printf+0x626>

000000000000170e <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    170e:	02000793          	li	a5,32
    1712:	00f50663          	beq	a0,a5,171e <isspace+0x10>
    1716:	355d                	addiw	a0,a0,-9
    1718:	00553513          	sltiu	a0,a0,5
    171c:	8082                	ret
    171e:	4505                	li	a0,1
}
    1720:	8082                	ret

0000000000001722 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1722:	fd05051b          	addiw	a0,a0,-48
}
    1726:	00a53513          	sltiu	a0,a0,10
    172a:	8082                	ret

000000000000172c <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    172c:	02000613          	li	a2,32
    1730:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1732:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1736:	ff77069b          	addiw	a3,a4,-9
    173a:	04c70d63          	beq	a4,a2,1794 <atoi+0x68>
    173e:	0007079b          	sext.w	a5,a4
    1742:	04d5f963          	bgeu	a1,a3,1794 <atoi+0x68>
        s++;
    switch (*s)
    1746:	02b00693          	li	a3,43
    174a:	04d70a63          	beq	a4,a3,179e <atoi+0x72>
    174e:	02d00693          	li	a3,45
    1752:	06d70463          	beq	a4,a3,17ba <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1756:	fd07859b          	addiw	a1,a5,-48
    175a:	4625                	li	a2,9
    175c:	873e                	mv	a4,a5
    175e:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1760:	4e01                	li	t3,0
    while (isdigit(*s))
    1762:	04b66a63          	bltu	a2,a1,17b6 <atoi+0x8a>
    int n = 0, neg = 0;
    1766:	4501                	li	a0,0
    while (isdigit(*s))
    1768:	4825                	li	a6,9
    176a:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    176e:	0025179b          	slliw	a5,a0,0x2
    1772:	9d3d                	addw	a0,a0,a5
    1774:	fd07031b          	addiw	t1,a4,-48
    1778:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    177c:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1780:	0685                	addi	a3,a3,1
    1782:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1786:	0006071b          	sext.w	a4,a2
    178a:	feb870e3          	bgeu	a6,a1,176a <atoi+0x3e>
    return neg ? n : -n;
    178e:	000e0563          	beqz	t3,1798 <atoi+0x6c>
}
    1792:	8082                	ret
        s++;
    1794:	0505                	addi	a0,a0,1
    1796:	bf71                	j	1732 <atoi+0x6>
    1798:	4113053b          	subw	a0,t1,a7
    179c:	8082                	ret
    while (isdigit(*s))
    179e:	00154783          	lbu	a5,1(a0)
    17a2:	4625                	li	a2,9
        s++;
    17a4:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17a8:	fd07859b          	addiw	a1,a5,-48
    17ac:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    17b0:	4e01                	li	t3,0
    while (isdigit(*s))
    17b2:	fab67ae3          	bgeu	a2,a1,1766 <atoi+0x3a>
    17b6:	4501                	li	a0,0
}
    17b8:	8082                	ret
    while (isdigit(*s))
    17ba:	00154783          	lbu	a5,1(a0)
    17be:	4625                	li	a2,9
        s++;
    17c0:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17c4:	fd07859b          	addiw	a1,a5,-48
    17c8:	0007871b          	sext.w	a4,a5
    17cc:	feb665e3          	bltu	a2,a1,17b6 <atoi+0x8a>
        neg = 1;
    17d0:	4e05                	li	t3,1
    17d2:	bf51                	j	1766 <atoi+0x3a>

00000000000017d4 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    17d4:	16060d63          	beqz	a2,194e <memset+0x17a>
    17d8:	40a007b3          	neg	a5,a0
    17dc:	8b9d                	andi	a5,a5,7
    17de:	00778713          	addi	a4,a5,7
    17e2:	482d                	li	a6,11
    17e4:	0ff5f593          	andi	a1,a1,255
    17e8:	fff60693          	addi	a3,a2,-1
    17ec:	17076263          	bltu	a4,a6,1950 <memset+0x17c>
    17f0:	16e6ea63          	bltu	a3,a4,1964 <memset+0x190>
    17f4:	16078563          	beqz	a5,195e <memset+0x18a>
    17f8:	00b50023          	sb	a1,0(a0)
    17fc:	4705                	li	a4,1
    17fe:	00150e93          	addi	t4,a0,1
    1802:	14e78c63          	beq	a5,a4,195a <memset+0x186>
    1806:	00b500a3          	sb	a1,1(a0)
    180a:	4709                	li	a4,2
    180c:	00250e93          	addi	t4,a0,2
    1810:	14e78d63          	beq	a5,a4,196a <memset+0x196>
    1814:	00b50123          	sb	a1,2(a0)
    1818:	470d                	li	a4,3
    181a:	00350e93          	addi	t4,a0,3
    181e:	12e78b63          	beq	a5,a4,1954 <memset+0x180>
    1822:	00b501a3          	sb	a1,3(a0)
    1826:	4711                	li	a4,4
    1828:	00450e93          	addi	t4,a0,4
    182c:	14e78163          	beq	a5,a4,196e <memset+0x19a>
    1830:	00b50223          	sb	a1,4(a0)
    1834:	4715                	li	a4,5
    1836:	00550e93          	addi	t4,a0,5
    183a:	12e78c63          	beq	a5,a4,1972 <memset+0x19e>
    183e:	00b502a3          	sb	a1,5(a0)
    1842:	471d                	li	a4,7
    1844:	00650e93          	addi	t4,a0,6
    1848:	12e79763          	bne	a5,a4,1976 <memset+0x1a2>
    184c:	00750e93          	addi	t4,a0,7
    1850:	00b50323          	sb	a1,6(a0)
    1854:	4f1d                	li	t5,7
    1856:	00859713          	slli	a4,a1,0x8
    185a:	8f4d                	or	a4,a4,a1
    185c:	01059e13          	slli	t3,a1,0x10
    1860:	01c76e33          	or	t3,a4,t3
    1864:	01859313          	slli	t1,a1,0x18
    1868:	006e6333          	or	t1,t3,t1
    186c:	02059893          	slli	a7,a1,0x20
    1870:	011368b3          	or	a7,t1,a7
    1874:	02859813          	slli	a6,a1,0x28
    1878:	40f60333          	sub	t1,a2,a5
    187c:	0108e833          	or	a6,a7,a6
    1880:	03059693          	slli	a3,a1,0x30
    1884:	00d866b3          	or	a3,a6,a3
    1888:	03859713          	slli	a4,a1,0x38
    188c:	97aa                	add	a5,a5,a0
    188e:	ff837813          	andi	a6,t1,-8
    1892:	8f55                	or	a4,a4,a3
    1894:	00f806b3          	add	a3,a6,a5
    1898:	e398                	sd	a4,0(a5)
    189a:	07a1                	addi	a5,a5,8
    189c:	fed79ee3          	bne	a5,a3,1898 <memset+0xc4>
    18a0:	ff837693          	andi	a3,t1,-8
    18a4:	00de87b3          	add	a5,t4,a3
    18a8:	01e6873b          	addw	a4,a3,t5
    18ac:	0ad30663          	beq	t1,a3,1958 <memset+0x184>
    18b0:	00b78023          	sb	a1,0(a5)
    18b4:	0017069b          	addiw	a3,a4,1
    18b8:	08c6fb63          	bgeu	a3,a2,194e <memset+0x17a>
    18bc:	00b780a3          	sb	a1,1(a5)
    18c0:	0027069b          	addiw	a3,a4,2
    18c4:	08c6f563          	bgeu	a3,a2,194e <memset+0x17a>
    18c8:	00b78123          	sb	a1,2(a5)
    18cc:	0037069b          	addiw	a3,a4,3
    18d0:	06c6ff63          	bgeu	a3,a2,194e <memset+0x17a>
    18d4:	00b781a3          	sb	a1,3(a5)
    18d8:	0047069b          	addiw	a3,a4,4
    18dc:	06c6f963          	bgeu	a3,a2,194e <memset+0x17a>
    18e0:	00b78223          	sb	a1,4(a5)
    18e4:	0057069b          	addiw	a3,a4,5
    18e8:	06c6f363          	bgeu	a3,a2,194e <memset+0x17a>
    18ec:	00b782a3          	sb	a1,5(a5)
    18f0:	0067069b          	addiw	a3,a4,6
    18f4:	04c6fd63          	bgeu	a3,a2,194e <memset+0x17a>
    18f8:	00b78323          	sb	a1,6(a5)
    18fc:	0077069b          	addiw	a3,a4,7
    1900:	04c6f763          	bgeu	a3,a2,194e <memset+0x17a>
    1904:	00b783a3          	sb	a1,7(a5)
    1908:	0087069b          	addiw	a3,a4,8
    190c:	04c6f163          	bgeu	a3,a2,194e <memset+0x17a>
    1910:	00b78423          	sb	a1,8(a5)
    1914:	0097069b          	addiw	a3,a4,9
    1918:	02c6fb63          	bgeu	a3,a2,194e <memset+0x17a>
    191c:	00b784a3          	sb	a1,9(a5)
    1920:	00a7069b          	addiw	a3,a4,10
    1924:	02c6f563          	bgeu	a3,a2,194e <memset+0x17a>
    1928:	00b78523          	sb	a1,10(a5)
    192c:	00b7069b          	addiw	a3,a4,11
    1930:	00c6ff63          	bgeu	a3,a2,194e <memset+0x17a>
    1934:	00b785a3          	sb	a1,11(a5)
    1938:	00c7069b          	addiw	a3,a4,12
    193c:	00c6f963          	bgeu	a3,a2,194e <memset+0x17a>
    1940:	00b78623          	sb	a1,12(a5)
    1944:	2735                	addiw	a4,a4,13
    1946:	00c77463          	bgeu	a4,a2,194e <memset+0x17a>
    194a:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    194e:	8082                	ret
    1950:	472d                	li	a4,11
    1952:	bd79                	j	17f0 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1954:	4f0d                	li	t5,3
    1956:	b701                	j	1856 <memset+0x82>
    1958:	8082                	ret
    195a:	4f05                	li	t5,1
    195c:	bded                	j	1856 <memset+0x82>
    195e:	8eaa                	mv	t4,a0
    1960:	4f01                	li	t5,0
    1962:	bdd5                	j	1856 <memset+0x82>
    1964:	87aa                	mv	a5,a0
    1966:	4701                	li	a4,0
    1968:	b7a1                	j	18b0 <memset+0xdc>
    196a:	4f09                	li	t5,2
    196c:	b5ed                	j	1856 <memset+0x82>
    196e:	4f11                	li	t5,4
    1970:	b5dd                	j	1856 <memset+0x82>
    1972:	4f15                	li	t5,5
    1974:	b5cd                	j	1856 <memset+0x82>
    1976:	4f19                	li	t5,6
    1978:	bdf9                	j	1856 <memset+0x82>

000000000000197a <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    197a:	00054783          	lbu	a5,0(a0)
    197e:	0005c703          	lbu	a4,0(a1)
    1982:	00e79863          	bne	a5,a4,1992 <strcmp+0x18>
    1986:	0505                	addi	a0,a0,1
    1988:	0585                	addi	a1,a1,1
    198a:	fbe5                	bnez	a5,197a <strcmp>
    198c:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    198e:	9d19                	subw	a0,a0,a4
    1990:	8082                	ret
    1992:	0007851b          	sext.w	a0,a5
    1996:	bfe5                	j	198e <strcmp+0x14>

0000000000001998 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1998:	ce05                	beqz	a2,19d0 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    199a:	00054703          	lbu	a4,0(a0)
    199e:	0005c783          	lbu	a5,0(a1)
    19a2:	cb0d                	beqz	a4,19d4 <strncmp+0x3c>
    if (!n--)
    19a4:	167d                	addi	a2,a2,-1
    19a6:	00c506b3          	add	a3,a0,a2
    19aa:	a819                	j	19c0 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19ac:	00a68e63          	beq	a3,a0,19c8 <strncmp+0x30>
    19b0:	0505                	addi	a0,a0,1
    19b2:	00e79b63          	bne	a5,a4,19c8 <strncmp+0x30>
    19b6:	00054703          	lbu	a4,0(a0)
    19ba:	0005c783          	lbu	a5,0(a1)
    19be:	cb19                	beqz	a4,19d4 <strncmp+0x3c>
    19c0:	0005c783          	lbu	a5,0(a1)
    19c4:	0585                	addi	a1,a1,1
    19c6:	f3fd                	bnez	a5,19ac <strncmp+0x14>
        ;
    return *l - *r;
    19c8:	0007051b          	sext.w	a0,a4
    19cc:	9d1d                	subw	a0,a0,a5
    19ce:	8082                	ret
        return 0;
    19d0:	4501                	li	a0,0
}
    19d2:	8082                	ret
    19d4:	4501                	li	a0,0
    return *l - *r;
    19d6:	9d1d                	subw	a0,a0,a5
    19d8:	8082                	ret

00000000000019da <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    19da:	00757793          	andi	a5,a0,7
    19de:	cf89                	beqz	a5,19f8 <strlen+0x1e>
    19e0:	87aa                	mv	a5,a0
    19e2:	a029                	j	19ec <strlen+0x12>
    19e4:	0785                	addi	a5,a5,1
    19e6:	0077f713          	andi	a4,a5,7
    19ea:	cb01                	beqz	a4,19fa <strlen+0x20>
        if (!*s)
    19ec:	0007c703          	lbu	a4,0(a5)
    19f0:	fb75                	bnez	a4,19e4 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    19f2:	40a78533          	sub	a0,a5,a0
}
    19f6:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    19f8:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    19fa:	6394                	ld	a3,0(a5)
    19fc:	00000597          	auipc	a1,0x0
    1a00:	5945b583          	ld	a1,1428(a1) # 1f90 <unlink+0x46>
    1a04:	00000617          	auipc	a2,0x0
    1a08:	59463603          	ld	a2,1428(a2) # 1f98 <unlink+0x4e>
    1a0c:	a019                	j	1a12 <strlen+0x38>
    1a0e:	6794                	ld	a3,8(a5)
    1a10:	07a1                	addi	a5,a5,8
    1a12:	00b68733          	add	a4,a3,a1
    1a16:	fff6c693          	not	a3,a3
    1a1a:	8f75                	and	a4,a4,a3
    1a1c:	8f71                	and	a4,a4,a2
    1a1e:	db65                	beqz	a4,1a0e <strlen+0x34>
    for (; *s; s++)
    1a20:	0007c703          	lbu	a4,0(a5)
    1a24:	d779                	beqz	a4,19f2 <strlen+0x18>
    1a26:	0017c703          	lbu	a4,1(a5)
    1a2a:	0785                	addi	a5,a5,1
    1a2c:	d379                	beqz	a4,19f2 <strlen+0x18>
    1a2e:	0017c703          	lbu	a4,1(a5)
    1a32:	0785                	addi	a5,a5,1
    1a34:	fb6d                	bnez	a4,1a26 <strlen+0x4c>
    1a36:	bf75                	j	19f2 <strlen+0x18>

0000000000001a38 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a38:	00757713          	andi	a4,a0,7
{
    1a3c:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1a3e:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a42:	cb19                	beqz	a4,1a58 <memchr+0x20>
    1a44:	ce25                	beqz	a2,1abc <memchr+0x84>
    1a46:	0007c703          	lbu	a4,0(a5)
    1a4a:	04b70e63          	beq	a4,a1,1aa6 <memchr+0x6e>
    1a4e:	0785                	addi	a5,a5,1
    1a50:	0077f713          	andi	a4,a5,7
    1a54:	167d                	addi	a2,a2,-1
    1a56:	f77d                	bnez	a4,1a44 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1a58:	4501                	li	a0,0
    if (n && *s != c)
    1a5a:	c235                	beqz	a2,1abe <memchr+0x86>
    1a5c:	0007c703          	lbu	a4,0(a5)
    1a60:	04b70363          	beq	a4,a1,1aa6 <memchr+0x6e>
        size_t k = ONES * c;
    1a64:	00000517          	auipc	a0,0x0
    1a68:	53c53503          	ld	a0,1340(a0) # 1fa0 <unlink+0x56>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a6c:	471d                	li	a4,7
        size_t k = ONES * c;
    1a6e:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a72:	02c77a63          	bgeu	a4,a2,1aa6 <memchr+0x6e>
    1a76:	00000897          	auipc	a7,0x0
    1a7a:	51a8b883          	ld	a7,1306(a7) # 1f90 <unlink+0x46>
    1a7e:	00000817          	auipc	a6,0x0
    1a82:	51a83803          	ld	a6,1306(a6) # 1f98 <unlink+0x4e>
    1a86:	431d                	li	t1,7
    1a88:	a029                	j	1a92 <memchr+0x5a>
    1a8a:	1661                	addi	a2,a2,-8
    1a8c:	07a1                	addi	a5,a5,8
    1a8e:	02c37963          	bgeu	t1,a2,1ac0 <memchr+0x88>
    1a92:	6398                	ld	a4,0(a5)
    1a94:	8f29                	xor	a4,a4,a0
    1a96:	011706b3          	add	a3,a4,a7
    1a9a:	fff74713          	not	a4,a4
    1a9e:	8f75                	and	a4,a4,a3
    1aa0:	01077733          	and	a4,a4,a6
    1aa4:	d37d                	beqz	a4,1a8a <memchr+0x52>
    1aa6:	853e                	mv	a0,a5
    1aa8:	97b2                	add	a5,a5,a2
    1aaa:	a021                	j	1ab2 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1aac:	0505                	addi	a0,a0,1
    1aae:	00f50763          	beq	a0,a5,1abc <memchr+0x84>
    1ab2:	00054703          	lbu	a4,0(a0)
    1ab6:	feb71be3          	bne	a4,a1,1aac <memchr+0x74>
    1aba:	8082                	ret
    return n ? (void *)s : 0;
    1abc:	4501                	li	a0,0
}
    1abe:	8082                	ret
    return n ? (void *)s : 0;
    1ac0:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1ac2:	f275                	bnez	a2,1aa6 <memchr+0x6e>
}
    1ac4:	8082                	ret

0000000000001ac6 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1ac6:	1101                	addi	sp,sp,-32
    1ac8:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1aca:	862e                	mv	a2,a1
{
    1acc:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1ace:	4581                	li	a1,0
{
    1ad0:	e426                	sd	s1,8(sp)
    1ad2:	ec06                	sd	ra,24(sp)
    1ad4:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1ad6:	f63ff0ef          	jal	ra,1a38 <memchr>
    return p ? p - s : n;
    1ada:	c519                	beqz	a0,1ae8 <strnlen+0x22>
}
    1adc:	60e2                	ld	ra,24(sp)
    1ade:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1ae0:	8d05                	sub	a0,a0,s1
}
    1ae2:	64a2                	ld	s1,8(sp)
    1ae4:	6105                	addi	sp,sp,32
    1ae6:	8082                	ret
    1ae8:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1aea:	8522                	mv	a0,s0
}
    1aec:	6442                	ld	s0,16(sp)
    1aee:	64a2                	ld	s1,8(sp)
    1af0:	6105                	addi	sp,sp,32
    1af2:	8082                	ret

0000000000001af4 <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1af4:	00b547b3          	xor	a5,a0,a1
    1af8:	8b9d                	andi	a5,a5,7
    1afa:	eb95                	bnez	a5,1b2e <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1afc:	0075f793          	andi	a5,a1,7
    1b00:	e7b1                	bnez	a5,1b4c <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1b02:	6198                	ld	a4,0(a1)
    1b04:	00000617          	auipc	a2,0x0
    1b08:	48c63603          	ld	a2,1164(a2) # 1f90 <unlink+0x46>
    1b0c:	00000817          	auipc	a6,0x0
    1b10:	48c83803          	ld	a6,1164(a6) # 1f98 <unlink+0x4e>
    1b14:	a029                	j	1b1e <stpcpy+0x2a>
    1b16:	e118                	sd	a4,0(a0)
    1b18:	6598                	ld	a4,8(a1)
    1b1a:	05a1                	addi	a1,a1,8
    1b1c:	0521                	addi	a0,a0,8
    1b1e:	00c707b3          	add	a5,a4,a2
    1b22:	fff74693          	not	a3,a4
    1b26:	8ff5                	and	a5,a5,a3
    1b28:	0107f7b3          	and	a5,a5,a6
    1b2c:	d7ed                	beqz	a5,1b16 <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b2e:	0005c783          	lbu	a5,0(a1)
    1b32:	00f50023          	sb	a5,0(a0)
    1b36:	c785                	beqz	a5,1b5e <stpcpy+0x6a>
    1b38:	0015c783          	lbu	a5,1(a1)
    1b3c:	0505                	addi	a0,a0,1
    1b3e:	0585                	addi	a1,a1,1
    1b40:	00f50023          	sb	a5,0(a0)
    1b44:	fbf5                	bnez	a5,1b38 <stpcpy+0x44>
        ;
    return d;
}
    1b46:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1b48:	0505                	addi	a0,a0,1
    1b4a:	df45                	beqz	a4,1b02 <stpcpy+0xe>
            if (!(*d = *s))
    1b4c:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1b50:	0585                	addi	a1,a1,1
    1b52:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1b56:	00f50023          	sb	a5,0(a0)
    1b5a:	f7fd                	bnez	a5,1b48 <stpcpy+0x54>
}
    1b5c:	8082                	ret
    1b5e:	8082                	ret

0000000000001b60 <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b60:	00b547b3          	xor	a5,a0,a1
    1b64:	8b9d                	andi	a5,a5,7
    1b66:	1a079863          	bnez	a5,1d16 <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b6a:	0075f793          	andi	a5,a1,7
    1b6e:	16078463          	beqz	a5,1cd6 <stpncpy+0x176>
    1b72:	ea01                	bnez	a2,1b82 <stpncpy+0x22>
    1b74:	a421                	j	1d7c <stpncpy+0x21c>
    1b76:	167d                	addi	a2,a2,-1
    1b78:	0505                	addi	a0,a0,1
    1b7a:	14070e63          	beqz	a4,1cd6 <stpncpy+0x176>
    1b7e:	1a060863          	beqz	a2,1d2e <stpncpy+0x1ce>
    1b82:	0005c783          	lbu	a5,0(a1)
    1b86:	0585                	addi	a1,a1,1
    1b88:	0075f713          	andi	a4,a1,7
    1b8c:	00f50023          	sb	a5,0(a0)
    1b90:	f3fd                	bnez	a5,1b76 <stpncpy+0x16>
    1b92:	4805                	li	a6,1
    1b94:	1a061863          	bnez	a2,1d44 <stpncpy+0x1e4>
    1b98:	40a007b3          	neg	a5,a0
    1b9c:	8b9d                	andi	a5,a5,7
    1b9e:	4681                	li	a3,0
    1ba0:	18061a63          	bnez	a2,1d34 <stpncpy+0x1d4>
    1ba4:	00778713          	addi	a4,a5,7
    1ba8:	45ad                	li	a1,11
    1baa:	18b76363          	bltu	a4,a1,1d30 <stpncpy+0x1d0>
    1bae:	1ae6eb63          	bltu	a3,a4,1d64 <stpncpy+0x204>
    1bb2:	1a078363          	beqz	a5,1d58 <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bb6:	00050023          	sb	zero,0(a0)
    1bba:	4685                	li	a3,1
    1bbc:	00150713          	addi	a4,a0,1
    1bc0:	18d78f63          	beq	a5,a3,1d5e <stpncpy+0x1fe>
    1bc4:	000500a3          	sb	zero,1(a0)
    1bc8:	4689                	li	a3,2
    1bca:	00250713          	addi	a4,a0,2
    1bce:	18d78e63          	beq	a5,a3,1d6a <stpncpy+0x20a>
    1bd2:	00050123          	sb	zero,2(a0)
    1bd6:	468d                	li	a3,3
    1bd8:	00350713          	addi	a4,a0,3
    1bdc:	16d78c63          	beq	a5,a3,1d54 <stpncpy+0x1f4>
    1be0:	000501a3          	sb	zero,3(a0)
    1be4:	4691                	li	a3,4
    1be6:	00450713          	addi	a4,a0,4
    1bea:	18d78263          	beq	a5,a3,1d6e <stpncpy+0x20e>
    1bee:	00050223          	sb	zero,4(a0)
    1bf2:	4695                	li	a3,5
    1bf4:	00550713          	addi	a4,a0,5
    1bf8:	16d78d63          	beq	a5,a3,1d72 <stpncpy+0x212>
    1bfc:	000502a3          	sb	zero,5(a0)
    1c00:	469d                	li	a3,7
    1c02:	00650713          	addi	a4,a0,6
    1c06:	16d79863          	bne	a5,a3,1d76 <stpncpy+0x216>
    1c0a:	00750713          	addi	a4,a0,7
    1c0e:	00050323          	sb	zero,6(a0)
    1c12:	40f80833          	sub	a6,a6,a5
    1c16:	ff887593          	andi	a1,a6,-8
    1c1a:	97aa                	add	a5,a5,a0
    1c1c:	95be                	add	a1,a1,a5
    1c1e:	0007b023          	sd	zero,0(a5)
    1c22:	07a1                	addi	a5,a5,8
    1c24:	feb79de3          	bne	a5,a1,1c1e <stpncpy+0xbe>
    1c28:	ff887593          	andi	a1,a6,-8
    1c2c:	9ead                	addw	a3,a3,a1
    1c2e:	00b707b3          	add	a5,a4,a1
    1c32:	12b80863          	beq	a6,a1,1d62 <stpncpy+0x202>
    1c36:	00078023          	sb	zero,0(a5)
    1c3a:	0016871b          	addiw	a4,a3,1
    1c3e:	0ec77863          	bgeu	a4,a2,1d2e <stpncpy+0x1ce>
    1c42:	000780a3          	sb	zero,1(a5)
    1c46:	0026871b          	addiw	a4,a3,2
    1c4a:	0ec77263          	bgeu	a4,a2,1d2e <stpncpy+0x1ce>
    1c4e:	00078123          	sb	zero,2(a5)
    1c52:	0036871b          	addiw	a4,a3,3
    1c56:	0cc77c63          	bgeu	a4,a2,1d2e <stpncpy+0x1ce>
    1c5a:	000781a3          	sb	zero,3(a5)
    1c5e:	0046871b          	addiw	a4,a3,4
    1c62:	0cc77663          	bgeu	a4,a2,1d2e <stpncpy+0x1ce>
    1c66:	00078223          	sb	zero,4(a5)
    1c6a:	0056871b          	addiw	a4,a3,5
    1c6e:	0cc77063          	bgeu	a4,a2,1d2e <stpncpy+0x1ce>
    1c72:	000782a3          	sb	zero,5(a5)
    1c76:	0066871b          	addiw	a4,a3,6
    1c7a:	0ac77a63          	bgeu	a4,a2,1d2e <stpncpy+0x1ce>
    1c7e:	00078323          	sb	zero,6(a5)
    1c82:	0076871b          	addiw	a4,a3,7
    1c86:	0ac77463          	bgeu	a4,a2,1d2e <stpncpy+0x1ce>
    1c8a:	000783a3          	sb	zero,7(a5)
    1c8e:	0086871b          	addiw	a4,a3,8
    1c92:	08c77e63          	bgeu	a4,a2,1d2e <stpncpy+0x1ce>
    1c96:	00078423          	sb	zero,8(a5)
    1c9a:	0096871b          	addiw	a4,a3,9
    1c9e:	08c77863          	bgeu	a4,a2,1d2e <stpncpy+0x1ce>
    1ca2:	000784a3          	sb	zero,9(a5)
    1ca6:	00a6871b          	addiw	a4,a3,10
    1caa:	08c77263          	bgeu	a4,a2,1d2e <stpncpy+0x1ce>
    1cae:	00078523          	sb	zero,10(a5)
    1cb2:	00b6871b          	addiw	a4,a3,11
    1cb6:	06c77c63          	bgeu	a4,a2,1d2e <stpncpy+0x1ce>
    1cba:	000785a3          	sb	zero,11(a5)
    1cbe:	00c6871b          	addiw	a4,a3,12
    1cc2:	06c77663          	bgeu	a4,a2,1d2e <stpncpy+0x1ce>
    1cc6:	00078623          	sb	zero,12(a5)
    1cca:	26b5                	addiw	a3,a3,13
    1ccc:	06c6f163          	bgeu	a3,a2,1d2e <stpncpy+0x1ce>
    1cd0:	000786a3          	sb	zero,13(a5)
    1cd4:	8082                	ret
            ;
        if (!n || !*s)
    1cd6:	c645                	beqz	a2,1d7e <stpncpy+0x21e>
    1cd8:	0005c783          	lbu	a5,0(a1)
    1cdc:	ea078be3          	beqz	a5,1b92 <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ce0:	479d                	li	a5,7
    1ce2:	02c7ff63          	bgeu	a5,a2,1d20 <stpncpy+0x1c0>
    1ce6:	00000897          	auipc	a7,0x0
    1cea:	2aa8b883          	ld	a7,682(a7) # 1f90 <unlink+0x46>
    1cee:	00000817          	auipc	a6,0x0
    1cf2:	2aa83803          	ld	a6,682(a6) # 1f98 <unlink+0x4e>
    1cf6:	431d                	li	t1,7
    1cf8:	6198                	ld	a4,0(a1)
    1cfa:	011707b3          	add	a5,a4,a7
    1cfe:	fff74693          	not	a3,a4
    1d02:	8ff5                	and	a5,a5,a3
    1d04:	0107f7b3          	and	a5,a5,a6
    1d08:	ef81                	bnez	a5,1d20 <stpncpy+0x1c0>
            *wd = *ws;
    1d0a:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d0c:	1661                	addi	a2,a2,-8
    1d0e:	05a1                	addi	a1,a1,8
    1d10:	0521                	addi	a0,a0,8
    1d12:	fec363e3          	bltu	t1,a2,1cf8 <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1d16:	e609                	bnez	a2,1d20 <stpncpy+0x1c0>
    1d18:	a08d                	j	1d7a <stpncpy+0x21a>
    1d1a:	167d                	addi	a2,a2,-1
    1d1c:	0505                	addi	a0,a0,1
    1d1e:	ca01                	beqz	a2,1d2e <stpncpy+0x1ce>
    1d20:	0005c783          	lbu	a5,0(a1)
    1d24:	0585                	addi	a1,a1,1
    1d26:	00f50023          	sb	a5,0(a0)
    1d2a:	fbe5                	bnez	a5,1d1a <stpncpy+0x1ba>
        ;
tail:
    1d2c:	b59d                	j	1b92 <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1d2e:	8082                	ret
    1d30:	472d                	li	a4,11
    1d32:	bdb5                	j	1bae <stpncpy+0x4e>
    1d34:	00778713          	addi	a4,a5,7
    1d38:	45ad                	li	a1,11
    1d3a:	fff60693          	addi	a3,a2,-1
    1d3e:	e6b778e3          	bgeu	a4,a1,1bae <stpncpy+0x4e>
    1d42:	b7fd                	j	1d30 <stpncpy+0x1d0>
    1d44:	40a007b3          	neg	a5,a0
    1d48:	8832                	mv	a6,a2
    1d4a:	8b9d                	andi	a5,a5,7
    1d4c:	4681                	li	a3,0
    1d4e:	e4060be3          	beqz	a2,1ba4 <stpncpy+0x44>
    1d52:	b7cd                	j	1d34 <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d54:	468d                	li	a3,3
    1d56:	bd75                	j	1c12 <stpncpy+0xb2>
    1d58:	872a                	mv	a4,a0
    1d5a:	4681                	li	a3,0
    1d5c:	bd5d                	j	1c12 <stpncpy+0xb2>
    1d5e:	4685                	li	a3,1
    1d60:	bd4d                	j	1c12 <stpncpy+0xb2>
    1d62:	8082                	ret
    1d64:	87aa                	mv	a5,a0
    1d66:	4681                	li	a3,0
    1d68:	b5f9                	j	1c36 <stpncpy+0xd6>
    1d6a:	4689                	li	a3,2
    1d6c:	b55d                	j	1c12 <stpncpy+0xb2>
    1d6e:	4691                	li	a3,4
    1d70:	b54d                	j	1c12 <stpncpy+0xb2>
    1d72:	4695                	li	a3,5
    1d74:	bd79                	j	1c12 <stpncpy+0xb2>
    1d76:	4699                	li	a3,6
    1d78:	bd69                	j	1c12 <stpncpy+0xb2>
    1d7a:	8082                	ret
    1d7c:	8082                	ret
    1d7e:	8082                	ret

0000000000001d80 <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1d80:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1d84:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d86:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1d8a:	2501                	sext.w	a0,a0
    1d8c:	8082                	ret

0000000000001d8e <close>:
    register long a7 __asm__("a7") = n;
    1d8e:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d92:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d96:	2501                	sext.w	a0,a0
    1d98:	8082                	ret

0000000000001d9a <read>:
    register long a7 __asm__("a7") = n;
    1d9a:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d9e:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1da2:	8082                	ret

0000000000001da4 <write>:
    register long a7 __asm__("a7") = n;
    1da4:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da8:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1dac:	8082                	ret

0000000000001dae <getpid>:
    register long a7 __asm__("a7") = n;
    1dae:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1db2:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1db6:	2501                	sext.w	a0,a0
    1db8:	8082                	ret

0000000000001dba <sched_yield>:
    register long a7 __asm__("a7") = n;
    1dba:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1dbe:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1dc2:	2501                	sext.w	a0,a0
    1dc4:	8082                	ret

0000000000001dc6 <fork>:
    register long a7 __asm__("a7") = n;
    1dc6:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1dca:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1dce:	2501                	sext.w	a0,a0
    1dd0:	8082                	ret

0000000000001dd2 <exit>:
    register long a7 __asm__("a7") = n;
    1dd2:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1dd6:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1dda:	8082                	ret

0000000000001ddc <waitpid>:
    register long a7 __asm__("a7") = n;
    1ddc:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de0:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1de4:	2501                	sext.w	a0,a0
    1de6:	8082                	ret

0000000000001de8 <exec>:
    register long a7 __asm__("a7") = n;
    1de8:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1dec:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <get_time>:

int64 get_time()
{
    1df4:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1df6:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1dfa:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1dfc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dfe:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e02:	2501                	sext.w	a0,a0
    1e04:	ed09                	bnez	a0,1e1e <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e06:	67a2                	ld	a5,8(sp)
    1e08:	3e800713          	li	a4,1000
    1e0c:	00015503          	lhu	a0,0(sp)
    1e10:	02e7d7b3          	divu	a5,a5,a4
    1e14:	02e50533          	mul	a0,a0,a4
    1e18:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e1a:	0141                	addi	sp,sp,16
    1e1c:	8082                	ret
        return -1;
    1e1e:	557d                	li	a0,-1
    1e20:	bfed                	j	1e1a <get_time+0x26>

0000000000001e22 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e22:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e26:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e2a:	2501                	sext.w	a0,a0
    1e2c:	8082                	ret

0000000000001e2e <sleep>:

int sleep(unsigned long long time)
{
    1e2e:	1141                	addi	sp,sp,-16
    1e30:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1e32:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e36:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e38:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e3a:	00000073          	ecall
    if (err == 0)
    1e3e:	2501                	sext.w	a0,a0
    1e40:	e13d                	bnez	a0,1ea6 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e42:	6722                	ld	a4,8(sp)
    1e44:	3e800693          	li	a3,1000
    1e48:	00015783          	lhu	a5,0(sp)
    1e4c:	02d75733          	divu	a4,a4,a3
    1e50:	02d787b3          	mul	a5,a5,a3
    1e54:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1e56:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e5a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e5c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5e:	00000073          	ecall
    if (err == 0)
    1e62:	2501                	sext.w	a0,a0
    1e64:	ed15                	bnez	a0,1ea0 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e66:	6841                	lui	a6,0x10
    1e68:	963e                	add	a2,a2,a5
    1e6a:	187d                	addi	a6,a6,-1
    1e6c:	3e800693          	li	a3,1000
    1e70:	a819                	j	1e86 <sleep+0x58>
    __asm_syscall("r"(a7))
    1e72:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1e76:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e7a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e7c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e7e:	00000073          	ecall
    if (err == 0)
    1e82:	2501                	sext.w	a0,a0
    1e84:	ed11                	bnez	a0,1ea0 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e86:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1e88:	07c00893          	li	a7,124
    1e8c:	02d7d733          	divu	a4,a5,a3
    1e90:	6782                	ld	a5,0(sp)
    1e92:	0107f7b3          	and	a5,a5,a6
    1e96:	02d787b3          	mul	a5,a5,a3
    1e9a:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1e9c:	fcc7ebe3          	bltu	a5,a2,1e72 <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1ea0:	4501                	li	a0,0
    1ea2:	0141                	addi	sp,sp,16
    1ea4:	8082                	ret
    1ea6:	57fd                	li	a5,-1
    1ea8:	b77d                	j	1e56 <sleep+0x28>

0000000000001eaa <set_priority>:
    register long a7 __asm__("a7") = n;
    1eaa:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1eae:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1eb2:	2501                	sext.w	a0,a0
    1eb4:	8082                	ret

0000000000001eb6 <mmap>:
    register long a7 __asm__("a7") = n;
    1eb6:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eba:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1ebe:	2501                	sext.w	a0,a0
    1ec0:	8082                	ret

0000000000001ec2 <munmap>:
    register long a7 __asm__("a7") = n;
    1ec2:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec6:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1eca:	2501                	sext.w	a0,a0
    1ecc:	8082                	ret

0000000000001ece <wait>:

int wait(int *code)
{
    1ece:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ed0:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1ed4:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed6:	00000073          	ecall
    return waitpid(-1, code);
}
    1eda:	2501                	sext.w	a0,a0
    1edc:	8082                	ret

0000000000001ede <spawn>:
    register long a7 __asm__("a7") = n;
    1ede:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1ee2:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1ee6:	2501                	sext.w	a0,a0
    1ee8:	8082                	ret

0000000000001eea <mailread>:
    register long a7 __asm__("a7") = n;
    1eea:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eee:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ef2:	2501                	sext.w	a0,a0
    1ef4:	8082                	ret

0000000000001ef6 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1ef6:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1efa:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1efe:	2501                	sext.w	a0,a0
    1f00:	8082                	ret

0000000000001f02 <fstat>:
    register long a7 __asm__("a7") = n;
    1f02:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f06:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f0a:	2501                	sext.w	a0,a0
    1f0c:	8082                	ret

0000000000001f0e <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1f0e:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f10:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f14:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f16:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f1a:	2501                	sext.w	a0,a0
    1f1c:	8082                	ret

0000000000001f1e <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f1e:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f20:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f24:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f26:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f2a:	2501                	sext.w	a0,a0
    1f2c:	8082                	ret

0000000000001f2e <link>:

int link(char *old_path, char *new_path)
{
    1f2e:	87aa                	mv	a5,a0
    1f30:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f32:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f36:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f3a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f3c:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f40:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f42:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f46:	2501                	sext.w	a0,a0
    1f48:	8082                	ret

0000000000001f4a <unlink>:

int unlink(char *path)
{
    1f4a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f4c:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f50:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f54:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f56:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f5a:	2501                	sext.w	a0,a0
    1f5c:	8082                	ret
