
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch4_unmap:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0b60006f          	j	10b8 <__start_main>

0000000000001006 <main>:
/*
理想结果：输出 Test 04_5 ummap OK!
*/

int main()
{
    1006:	1101                	addi	sp,sp,-32
    uint64 start = 0x10000000;
    uint64 len = 4096;
    int prot = 3;
    assert(len == mmap((void *)start, len, prot));
    1008:	460d                	li	a2,3
    100a:	6585                	lui	a1,0x1
    100c:	10000537          	lui	a0,0x10000
{
    1010:	ec06                	sd	ra,24(sp)
    1012:	e822                	sd	s0,16(sp)
    1014:	e426                	sd	s1,8(sp)
    assert(len == mmap((void *)start, len, prot));
    1016:	71b000ef          	jal	ra,1f30 <mmap>
    101a:	6785                	lui	a5,0x1
    101c:	00f50563          	beq	a0,a5,1026 <main+0x20>
    1020:	557d                	li	a0,-1
    1022:	62b000ef          	jal	ra,1e4c <exit>
    assert(mmap((void *)(start + len), len * 2, prot) == (len * 2));
    1026:	460d                	li	a2,3
    1028:	6589                	lui	a1,0x2
    102a:	10001537          	lui	a0,0x10001
    102e:	703000ef          	jal	ra,1f30 <mmap>
    1032:	6789                	lui	a5,0x2
    1034:	00f50563          	beq	a0,a5,103e <main+0x38>
    1038:	557d                	li	a0,-1
    103a:	613000ef          	jal	ra,1e4c <exit>
    assert(munmap((void *)start, len) == len);
    103e:	6585                	lui	a1,0x1
    1040:	10000537          	lui	a0,0x10000
    1044:	6f9000ef          	jal	ra,1f3c <munmap>
    1048:	6785                	lui	a5,0x1
    104a:	00f50563          	beq	a0,a5,1054 <main+0x4e>
    104e:	557d                	li	a0,-1
    1050:	5fd000ef          	jal	ra,1e4c <exit>
    assert(mmap((void *)(start - len), len + 1, prot) == (len * 2));
    1054:	6585                	lui	a1,0x1
    1056:	460d                	li	a2,3
    1058:	0585                	addi	a1,a1,1
    105a:	0ffff537          	lui	a0,0xffff
    105e:	6d3000ef          	jal	ra,1f30 <mmap>
    1062:	6789                	lui	a5,0x2
    1064:	00f50563          	beq	a0,a5,106e <main+0x68>
    1068:	557d                	li	a0,-1
    106a:	5e3000ef          	jal	ra,1e4c <exit>
{
    106e:	0ffff7b7          	lui	a5,0xffff
    for (uint64 i = (start - len); i < (start + len * 3); ++i)
    1072:	10003737          	lui	a4,0x10003
    {
        uint8 *addr = (uint8 *)i;
        *addr = (uint8)i;
    1076:	00f78023          	sb	a5,0(a5) # ffff000 <digits+0xfffcff0>
    for (uint64 i = (start - len); i < (start + len * 3); ++i)
    107a:	0785                	addi	a5,a5,1
    107c:	fee79de3          	bne	a5,a4,1076 <main+0x70>
    }
    for (uint64 i = (start - len); i < (start + len * 3); ++i)
    1080:	0ffff437          	lui	s0,0xffff
    1084:	100034b7          	lui	s1,0x10003
    {
        uint8 *addr = (uint8 *)i;
        assert(*addr == (uint8)i);
    1088:	00044703          	lbu	a4,0(s0) # ffff000 <digits+0xfffcff0>
    108c:	0ff47793          	andi	a5,s0,255
    1090:	557d                	li	a0,-1
    for (uint64 i = (start - len); i < (start + len * 3); ++i)
    1092:	0405                	addi	s0,s0,1
        assert(*addr == (uint8)i);
    1094:	00f70463          	beq	a4,a5,109c <main+0x96>
    1098:	5b5000ef          	jal	ra,1e4c <exit>
    for (uint64 i = (start - len); i < (start + len * 3); ++i)
    109c:	fe9416e3          	bne	s0,s1,1088 <main+0x82>
    }
    puts("Test 04_5 ummap OK!");
    10a0:	00001517          	auipc	a0,0x1
    10a4:	f3850513          	addi	a0,a0,-200 # 1fd8 <unlink+0x14>
    10a8:	060000ef          	jal	ra,1108 <puts>
    return 0;
    10ac:	60e2                	ld	ra,24(sp)
    10ae:	6442                	ld	s0,16(sp)
    10b0:	64a2                	ld	s1,8(sp)
    10b2:	4501                	li	a0,0
    10b4:	6105                	addi	sp,sp,32
    10b6:	8082                	ret

00000000000010b8 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10b8:	1141                	addi	sp,sp,-16
    10ba:	e406                	sd	ra,8(sp)
    exit(main());
    10bc:	f4bff0ef          	jal	ra,1006 <main>
    10c0:	58d000ef          	jal	ra,1e4c <exit>
    return 0;
}
    10c4:	60a2                	ld	ra,8(sp)
    10c6:	4501                	li	a0,0
    10c8:	0141                	addi	sp,sp,16
    10ca:	8082                	ret

00000000000010cc <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    10cc:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    10ce:	00f10593          	addi	a1,sp,15
    10d2:	4605                	li	a2,1
    10d4:	4501                	li	a0,0
{
    10d6:	ec06                	sd	ra,24(sp)
    char byte = 0;
    10d8:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    10dc:	539000ef          	jal	ra,1e14 <read>
    return byte;
}
    10e0:	60e2                	ld	ra,24(sp)
    10e2:	00f14503          	lbu	a0,15(sp)
    10e6:	6105                	addi	sp,sp,32
    10e8:	8082                	ret

00000000000010ea <putchar>:

int putchar(int c)
{
    10ea:	1101                	addi	sp,sp,-32
    10ec:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    10ee:	00f10593          	addi	a1,sp,15
    10f2:	4605                	li	a2,1
    10f4:	4505                	li	a0,1
{
    10f6:	ec06                	sd	ra,24(sp)
    char byte = c;
    10f8:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    10fc:	523000ef          	jal	ra,1e1e <write>
}
    1100:	60e2                	ld	ra,24(sp)
    1102:	2501                	sext.w	a0,a0
    1104:	6105                	addi	sp,sp,32
    1106:	8082                	ret

0000000000001108 <puts>:

int puts(const char *s)
{
    1108:	1101                	addi	sp,sp,-32
    110a:	e822                	sd	s0,16(sp)
    110c:	ec06                	sd	ra,24(sp)
    110e:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    1110:	145000ef          	jal	ra,1a54 <strlen>
    1114:	862a                	mv	a2,a0
    1116:	85a2                	mv	a1,s0
    1118:	4505                	li	a0,1
    111a:	505000ef          	jal	ra,1e1e <write>
    111e:	00055763          	bgez	a0,112c <puts+0x24>
    return r;
}
    1122:	60e2                	ld	ra,24(sp)
    1124:	6442                	ld	s0,16(sp)
    1126:	557d                	li	a0,-1
    1128:	6105                	addi	sp,sp,32
    112a:	8082                	ret
    return write(stdout, &byte, 1);
    112c:	00f10593          	addi	a1,sp,15
    char byte = c;
    1130:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    1132:	4605                	li	a2,1
    1134:	4505                	li	a0,1
    char byte = c;
    1136:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    113a:	4e5000ef          	jal	ra,1e1e <write>
}
    113e:	60e2                	ld	ra,24(sp)
    1140:	6442                	ld	s0,16(sp)
    1142:	41f5551b          	sraiw	a0,a0,0x1f
    1146:	6105                	addi	sp,sp,32
    1148:	8082                	ret

000000000000114a <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    114a:	7131                	addi	sp,sp,-192
    114c:	ecce                	sd	s3,88(sp)
    114e:	e8d2                	sd	s4,80(sp)
    1150:	e4d6                	sd	s5,72(sp)
    1152:	e0da                	sd	s6,64(sp)
    1154:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    1156:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1158:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    115a:	6ae1                	lui	s5,0x18
    115c:	000f4a37          	lui	s4,0xf4
    1160:	00989b37          	lui	s6,0x989
{
    1164:	fc86                	sd	ra,120(sp)
    1166:	f8a2                	sd	s0,112(sp)
    1168:	f4a6                	sd	s1,104(sp)
    116a:	f0ca                	sd	s2,96(sp)
    116c:	fc5e                	sd	s7,56(sp)
    116e:	e52e                	sd	a1,136(sp)
    1170:	e932                	sd	a2,144(sp)
    1172:	ed36                	sd	a3,152(sp)
    1174:	f13a                	sd	a4,160(sp)
    1176:	f942                	sd	a6,176(sp)
    1178:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    117a:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    117c:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x6ff>
    1180:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x1668f>
    1184:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf222f>
    1188:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x98766f>
    for (;;)
    {
        if (!*s)
    118c:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    1190:	02500913          	li	s2,37
        if (!*s)
    1194:	1a078f63          	beqz	a5,1352 <printf+0x208>
    1198:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    119a:	17278e63          	beq	a5,s2,1316 <printf+0x1cc>
    119e:	00164783          	lbu	a5,1(a2)
    11a2:	0605                	addi	a2,a2,1
    11a4:	fbfd                	bnez	a5,119a <printf+0x50>
    11a6:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    11a8:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    11ac:	85aa                	mv	a1,a0
    11ae:	8622                	mv	a2,s0
    11b0:	4505                	li	a0,1
    11b2:	46d000ef          	jal	ra,1e1e <write>
        out(f, a, l);
        if (l)
    11b6:	18041963          	bnez	s0,1348 <printf+0x1fe>
            continue;
        if (s[1] == 0)
    11ba:	0014c783          	lbu	a5,1(s1) # 10003001 <digits+0x10000ff1>
    11be:	18078a63          	beqz	a5,1352 <printf+0x208>
            break;
        switch (s[1])
    11c2:	07300713          	li	a4,115
    11c6:	28e78e63          	beq	a5,a4,1462 <printf+0x318>
    11ca:	18f76f63          	bltu	a4,a5,1368 <printf+0x21e>
    11ce:	06400713          	li	a4,100
    11d2:	2ae78c63          	beq	a5,a4,148a <printf+0x340>
    11d6:	07000713          	li	a4,112
    11da:	3ce79c63          	bne	a5,a4,15b2 <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    11de:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    11e0:	00001797          	auipc	a5,0x1
    11e4:	e3078793          	addi	a5,a5,-464 # 2010 <digits>
            printptr(va_arg(ap, uint64));
    11e8:	6298                	ld	a4,0(a3)
    11ea:	00868093          	addi	ra,a3,8
    11ee:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    11f0:	00471293          	slli	t0,a4,0x4
    11f4:	00c71f13          	slli	t5,a4,0xc
    11f8:	01471e13          	slli	t3,a4,0x14
    11fc:	01c71893          	slli	a7,a4,0x1c
    1200:	02471813          	slli	a6,a4,0x24
    1204:	02871513          	slli	a0,a4,0x28
    1208:	02c71593          	slli	a1,a4,0x2c
    120c:	03071693          	slli	a3,a4,0x30
    1210:	00871f93          	slli	t6,a4,0x8
    1214:	01071e93          	slli	t4,a4,0x10
    1218:	01871313          	slli	t1,a4,0x18
    121c:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1220:	03c2d293          	srli	t0,t0,0x3c
    1224:	03cf5f13          	srli	t5,t5,0x3c
    1228:	03ce5e13          	srli	t3,t3,0x3c
    122c:	03c8d893          	srli	a7,a7,0x3c
    1230:	03c85813          	srli	a6,a6,0x3c
    1234:	9171                	srli	a0,a0,0x3c
    1236:	91f1                	srli	a1,a1,0x3c
    1238:	92f1                	srli	a3,a3,0x3c
    123a:	92be                	add	t0,t0,a5
    123c:	9f3e                	add	t5,t5,a5
    123e:	9e3e                	add	t3,t3,a5
    1240:	98be                	add	a7,a7,a5
    1242:	983e                	add	a6,a6,a5
    1244:	953e                	add	a0,a0,a5
    1246:	95be                	add	a1,a1,a5
    1248:	96be                	add	a3,a3,a5
    124a:	03c75393          	srli	t2,a4,0x3c
    124e:	01c75b9b          	srliw	s7,a4,0x1c
    1252:	03cfdf93          	srli	t6,t6,0x3c
    1256:	03cede93          	srli	t4,t4,0x3c
    125a:	03c35313          	srli	t1,t1,0x3c
    125e:	9271                	srli	a2,a2,0x3c
    1260:	0002c403          	lbu	s0,0(t0)
    1264:	93be                	add	t2,t2,a5
    1266:	000f4283          	lbu	t0,0(t5)
    126a:	9fbe                	add	t6,t6,a5
    126c:	000e4f03          	lbu	t5,0(t3)
    1270:	9ebe                	add	t4,t4,a5
    1272:	0008ce03          	lbu	t3,0(a7)
    1276:	933e                	add	t1,t1,a5
    1278:	00084883          	lbu	a7,0(a6)
    127c:	9bbe                	add	s7,s7,a5
    127e:	00054803          	lbu	a6,0(a0)
    1282:	963e                	add	a2,a2,a5
    1284:	0005c503          	lbu	a0,0(a1) # 1000 <_start>
    1288:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    128c:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1290:	0003c903          	lbu	s2,0(t2)
    1294:	00064603          	lbu	a2,0(a2)
    1298:	000fc383          	lbu	t2,0(t6)
    129c:	8b3d                	andi	a4,a4,15
    129e:	000ecf83          	lbu	t6,0(t4)
    12a2:	92f1                	srli	a3,a3,0x3c
    12a4:	00034e83          	lbu	t4,0(t1)
    12a8:	000bc303          	lbu	t1,0(s7)
    12ac:	96be                	add	a3,a3,a5
    12ae:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    12b0:	7761                	lui	a4,0xffff8
    12b2:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12b6:	00710623          	sb	t2,12(sp)
    12ba:	005106a3          	sb	t0,13(sp)
    12be:	01f10723          	sb	t6,14(sp)
    12c2:	01e107a3          	sb	t5,15(sp)
    12c6:	01d10823          	sb	t4,16(sp)
    12ca:	01c108a3          	sb	t3,17(sp)
    12ce:	00610923          	sb	t1,18(sp)
    12d2:	011109a3          	sb	a7,19(sp)
    12d6:	01010a23          	sb	a6,20(sp)
    12da:	00a10aa3          	sb	a0,21(sp)
    12de:	00b10b23          	sb	a1,22(sp)
    12e2:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    12e6:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12ea:	01210523          	sb	s2,10(sp)
    12ee:	008105a3          	sb	s0,11(sp)
    12f2:	0006c703          	lbu	a4,0(a3)
    12f6:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    12fa:	4649                	li	a2,18
    12fc:	002c                	addi	a1,sp,8
    12fe:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1300:	00e10c23          	sb	a4,24(sp)
    1304:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1308:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    130c:	313000ef          	jal	ra,1e1e <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1310:	00248513          	addi	a0,s1,2
    1314:	bda5                	j	118c <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1316:	00064783          	lbu	a5,0(a2)
    131a:	84b2                	mv	s1,a2
    131c:	01278963          	beq	a5,s2,132e <printf+0x1e4>
    1320:	b561                	j	11a8 <printf+0x5e>
    1322:	0024c783          	lbu	a5,2(s1)
    1326:	0605                	addi	a2,a2,1
    1328:	0489                	addi	s1,s1,2
    132a:	e7279fe3          	bne	a5,s2,11a8 <printf+0x5e>
    132e:	0014c783          	lbu	a5,1(s1)
    1332:	ff2788e3          	beq	a5,s2,1322 <printf+0x1d8>
        l = z - a;
    1336:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    133a:	85aa                	mv	a1,a0
    133c:	8622                	mv	a2,s0
    133e:	4505                	li	a0,1
    1340:	2df000ef          	jal	ra,1e1e <write>
        if (l)
    1344:	e6040be3          	beqz	s0,11ba <printf+0x70>
    1348:	8526                	mv	a0,s1
        if (!*s)
    134a:	00054783          	lbu	a5,0(a0)
    134e:	e40795e3          	bnez	a5,1198 <printf+0x4e>
    }
    va_end(ap);
    1352:	70e6                	ld	ra,120(sp)
    1354:	7446                	ld	s0,112(sp)
    1356:	74a6                	ld	s1,104(sp)
    1358:	7906                	ld	s2,96(sp)
    135a:	69e6                	ld	s3,88(sp)
    135c:	6a46                	ld	s4,80(sp)
    135e:	6aa6                	ld	s5,72(sp)
    1360:	6b06                	ld	s6,64(sp)
    1362:	7be2                	ld	s7,56(sp)
    1364:	6129                	addi	sp,sp,192
    1366:	8082                	ret
        switch (s[1])
    1368:	07800713          	li	a4,120
    136c:	24e79363          	bne	a5,a4,15b2 <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    1370:	6782                	ld	a5,0(sp)
    1372:	4394                	lw	a3,0(a5)
    1374:	07a1                	addi	a5,a5,8
    1376:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1378:	2606c263          	bltz	a3,15dc <printf+0x492>
        buf[i--] = digits[x % base];
    137c:	00001797          	auipc	a5,0x1
    1380:	c9478793          	addi	a5,a5,-876 # 2010 <digits>
    1384:	00f6f713          	andi	a4,a3,15
    1388:	973e                	add	a4,a4,a5
    138a:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff5ff0>
    buf[16] = 0;
    138e:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1392:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    1394:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1398:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    139c:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    13a0:	0046d51b          	srliw	a0,a3,0x4
    13a4:	0ad5d563          	bge	a1,a3,144e <printf+0x304>
        buf[i--] = digits[x % base];
    13a8:	8a3d                	andi	a2,a2,15
    13aa:	963e                	add	a2,a2,a5
    13ac:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    13b0:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    13b4:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    13b8:	30a5fe63          	bgeu	a1,a0,16d4 <printf+0x58a>
        buf[i--] = digits[x % base];
    13bc:	00f77613          	andi	a2,a4,15
    13c0:	963e                	add	a2,a2,a5
    13c2:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13c6:	45bd                	li	a1,15
    13c8:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    13cc:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    13d0:	00475513          	srli	a0,a4,0x4
    13d4:	30e5f963          	bgeu	a1,a4,16e6 <printf+0x59c>
        buf[i--] = digits[x % base];
    13d8:	8a3d                	andi	a2,a2,15
    13da:	963e                	add	a2,a2,a5
    13dc:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    13e0:	00875893          	srli	a7,a4,0x8
    13e4:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    13e8:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    13ec:	30a5fd63          	bgeu	a1,a0,1706 <printf+0x5bc>
        buf[i--] = digits[x % base];
    13f0:	8a3d                	andi	a2,a2,15
    13f2:	963e                	add	a2,a2,a5
    13f4:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13f8:	00c75813          	srli	a6,a4,0xc
    13fc:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    1400:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    1404:	3315fe63          	bgeu	a1,a7,1740 <printf+0x5f6>
        buf[i--] = digits[x % base];
    1408:	8a3d                	andi	a2,a2,15
    140a:	963e                	add	a2,a2,a5
    140c:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1410:	01075893          	srli	a7,a4,0x10
    1414:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    1418:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    141c:	3305ff63          	bgeu	a1,a6,175a <printf+0x610>
        buf[i--] = digits[x % base];
    1420:	8a3d                	andi	a2,a2,15
    1422:	963e                	add	a2,a2,a5
    1424:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1428:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    142c:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1430:	3515f863          	bgeu	a1,a7,1780 <printf+0x636>
        buf[i--] = digits[x % base];
    1434:	97ba                	add	a5,a5,a4
    1436:	0007c783          	lbu	a5,0(a5)
    143a:	45a1                	li	a1,8
    143c:	00f10823          	sb	a5,16(sp)
    if (sign)
    1440:	0006d763          	bgez	a3,144e <printf+0x304>
        buf[i--] = '-';
    1444:	02d00793          	li	a5,45
    1448:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    144c:	459d                	li	a1,7
    write(f, s, l);
    144e:	4641                	li	a2,16
    1450:	003c                	addi	a5,sp,8
    1452:	9e0d                	subw	a2,a2,a1
    1454:	4505                	li	a0,1
    1456:	95be                	add	a1,a1,a5
    1458:	1c7000ef          	jal	ra,1e1e <write>
        s += 2;
    145c:	00248513          	addi	a0,s1,2
    1460:	b335                	j	118c <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    1462:	6782                	ld	a5,0(sp)
    1464:	6380                	ld	s0,0(a5)
    1466:	07a1                	addi	a5,a5,8
    1468:	e03e                	sd	a5,0(sp)
    146a:	22040a63          	beqz	s0,169e <printf+0x554>
            l = strnlen(a, 200);
    146e:	0c800593          	li	a1,200
    1472:	8522                	mv	a0,s0
    1474:	6cc000ef          	jal	ra,1b40 <strnlen>
    write(f, s, l);
    1478:	0005061b          	sext.w	a2,a0
    147c:	85a2                	mv	a1,s0
    147e:	4505                	li	a0,1
    1480:	19f000ef          	jal	ra,1e1e <write>
        s += 2;
    1484:	00248513          	addi	a0,s1,2
    1488:	b311                	j	118c <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    148a:	6782                	ld	a5,0(sp)
    148c:	4390                	lw	a2,0(a5)
    148e:	07a1                	addi	a5,a5,8
    1490:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1492:	1a064363          	bltz	a2,1638 <printf+0x4ee>
        buf[i--] = digits[x % base];
    1496:	46a9                	li	a3,10
    1498:	02d6773b          	remuw	a4,a2,a3
    149c:	00001797          	auipc	a5,0x1
    14a0:	b7478793          	addi	a5,a5,-1164 # 2010 <digits>
    buf[16] = 0;
    14a4:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    14a8:	4525                	li	a0,9
        x = xx;
    14aa:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    14ae:	973e                	add	a4,a4,a5
    14b0:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    14b4:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    14b8:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    14bc:	2cc55063          	bge	a0,a2,177c <printf+0x632>
    14c0:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    14c4:	02d5f73b          	remuw	a4,a1,a3
    14c8:	1702                	slli	a4,a4,0x20
    14ca:	9301                	srli	a4,a4,0x20
    14cc:	973e                	add	a4,a4,a5
    14ce:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    14d2:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    14d6:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    14da:	1f057d63          	bgeu	a0,a6,16d4 <printf+0x58a>
        buf[i--] = digits[x % base];
    14de:	4529                	li	a0,10
    } while ((x /= base) != 0);
    14e0:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    14e2:	02a5f73b          	remuw	a4,a1,a0
    14e6:	973e                	add	a4,a4,a5
    14e8:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    14ec:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    14f0:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    14f4:	1ab6f163          	bgeu	a3,a1,1696 <printf+0x54c>
    14f8:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    14fc:	02a776bb          	remuw	a3,a4,a0
    1500:	96be                	add	a3,a3,a5
    1502:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1506:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    150a:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    150e:	20b87c63          	bgeu	a6,a1,1726 <printf+0x5dc>
    1512:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    1516:	02a776bb          	remuw	a3,a4,a0
    151a:	96be                	add	a3,a3,a5
    151c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1520:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1524:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1528:	20b87363          	bgeu	a6,a1,172e <printf+0x5e4>
        buf[i--] = digits[x % base];
    152c:	02a776bb          	remuw	a3,a4,a0
    1530:	96be                	add	a3,a3,a5
    1532:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1536:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    153a:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    153e:	20b9f563          	bgeu	s3,a1,1748 <printf+0x5fe>
        buf[i--] = digits[x % base];
    1542:	02a776bb          	remuw	a3,a4,a0
    1546:	96be                	add	a3,a3,a5
    1548:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    154c:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1550:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1554:	20bafb63          	bgeu	s5,a1,176a <printf+0x620>
        buf[i--] = digits[x % base];
    1558:	02a776bb          	remuw	a3,a4,a0
    155c:	96be                	add	a3,a3,a5
    155e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1562:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1566:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    156a:	1eba7c63          	bgeu	s4,a1,1762 <printf+0x618>
        buf[i--] = digits[x % base];
    156e:	02a776bb          	remuw	a3,a4,a0
    1572:	96be                	add	a3,a3,a5
    1574:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1578:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    157c:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1580:	14bb7163          	bgeu	s6,a1,16c2 <printf+0x578>
        buf[i--] = digits[x % base];
    1584:	1702                	slli	a4,a4,0x20
    1586:	9301                	srli	a4,a4,0x20
    1588:	97ba                	add	a5,a5,a4
    158a:	0007c783          	lbu	a5,0(a5)
    158e:	4599                	li	a1,6
    1590:	00f10723          	sb	a5,14(sp)
    if (sign)
    1594:	ea065de3          	bgez	a2,144e <printf+0x304>
        buf[i--] = '-';
    1598:	02d00793          	li	a5,45
    159c:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    15a0:	4595                	li	a1,5
    write(f, s, l);
    15a2:	003c                	addi	a5,sp,8
    15a4:	4641                	li	a2,16
    15a6:	9e0d                	subw	a2,a2,a1
    15a8:	4505                	li	a0,1
    15aa:	95be                	add	a1,a1,a5
    15ac:	073000ef          	jal	ra,1e1e <write>
    15b0:	b575                	j	145c <printf+0x312>
    char byte = c;
    15b2:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    15b6:	4605                	li	a2,1
    15b8:	002c                	addi	a1,sp,8
    15ba:	4505                	li	a0,1
    char byte = c;
    15bc:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15c0:	05f000ef          	jal	ra,1e1e <write>
    char byte = c;
    15c4:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15c8:	4605                	li	a2,1
    15ca:	002c                	addi	a1,sp,8
    15cc:	4505                	li	a0,1
    char byte = c;
    15ce:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15d2:	04d000ef          	jal	ra,1e1e <write>
        s += 2;
    15d6:	00248513          	addi	a0,s1,2
    15da:	be4d                	j	118c <printf+0x42>
        x = -xx;
    15dc:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    15e0:	00001797          	auipc	a5,0x1
    15e4:	a3078793          	addi	a5,a5,-1488 # 2010 <digits>
    15e8:	00f77613          	andi	a2,a4,15
    15ec:	963e                	add	a2,a2,a5
    15ee:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    15f2:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    15f6:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    15f8:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    15fc:	0047551b          	srliw	a0,a4,0x4
    1600:	0047561b          	srliw	a2,a4,0x4
    1604:	0ab6d263          	bge	a3,a1,16a8 <printf+0x55e>
        buf[i--] = digits[x % base];
    1608:	8a3d                	andi	a2,a2,15
    160a:	963e                	add	a2,a2,a5
    160c:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    1610:	463d                	li	a2,15
    1612:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    1616:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    161a:	daa661e3          	bltu	a2,a0,13bc <printf+0x272>
        buf[i--] = '-';
    161e:	02d00793          	li	a5,45
    1622:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1626:	45b5                	li	a1,13
    write(f, s, l);
    1628:	003c                	addi	a5,sp,8
    162a:	4641                	li	a2,16
    162c:	9e0d                	subw	a2,a2,a1
    162e:	4505                	li	a0,1
    1630:	95be                	add	a1,a1,a5
    1632:	7ec000ef          	jal	ra,1e1e <write>
    1636:	b51d                	j	145c <printf+0x312>
        x = -xx;
    1638:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    163c:	46a9                	li	a3,10
    163e:	02d875bb          	remuw	a1,a6,a3
    1642:	00001797          	auipc	a5,0x1
    1646:	9ce78793          	addi	a5,a5,-1586 # 2010 <digits>
    buf[16] = 0;
    164a:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    164e:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    1650:	95be                	add	a1,a1,a5
    1652:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    1656:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    165a:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    165e:	04a65563          	bge	a2,a0,16a8 <printf+0x55e>
    1662:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1666:	02d775bb          	remuw	a1,a4,a3
    166a:	95be                	add	a1,a1,a5
    166c:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    1670:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    1674:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    1678:	fb0573e3          	bgeu	a0,a6,161e <printf+0x4d4>
        buf[i--] = digits[x % base];
    167c:	4529                	li	a0,10
    } while ((x /= base) != 0);
    167e:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1680:	02a5f73b          	remuw	a4,a1,a0
    1684:	973e                	add	a4,a4,a5
    1686:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    168a:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    168e:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    1692:	e6b6e3e3          	bltu	a3,a1,14f8 <printf+0x3ae>
        buf[i--] = digits[x % base];
    1696:	45b5                	li	a1,13
    if (sign)
    1698:	da065be3          	bgez	a2,144e <printf+0x304>
    169c:	a881                	j	16ec <printf+0x5a2>
                a = "(null)";
    169e:	00001417          	auipc	s0,0x1
    16a2:	95240413          	addi	s0,s0,-1710 # 1ff0 <unlink+0x2c>
    16a6:	b3e1                	j	146e <printf+0x324>
        buf[i--] = '-';
    16a8:	02d00793          	li	a5,45
    16ac:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    16b0:	45b9                	li	a1,14
    write(f, s, l);
    16b2:	003c                	addi	a5,sp,8
    16b4:	4641                	li	a2,16
    16b6:	9e0d                	subw	a2,a2,a1
    16b8:	4505                	li	a0,1
    16ba:	95be                	add	a1,a1,a5
    16bc:	762000ef          	jal	ra,1e1e <write>
    16c0:	bb71                	j	145c <printf+0x312>
        buf[i--] = digits[x % base];
    16c2:	459d                	li	a1,7
    if (sign)
    16c4:	d80655e3          	bgez	a2,144e <printf+0x304>
        buf[i--] = '-';
    16c8:	02d00793          	li	a5,45
    16cc:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    16d0:	4599                	li	a1,6
    16d2:	bbb5                	j	144e <printf+0x304>
    16d4:	45b9                	li	a1,14
    write(f, s, l);
    16d6:	003c                	addi	a5,sp,8
    16d8:	4641                	li	a2,16
    16da:	9e0d                	subw	a2,a2,a1
    16dc:	4505                	li	a0,1
    16de:	95be                	add	a1,a1,a5
    16e0:	73e000ef          	jal	ra,1e1e <write>
    16e4:	bba5                	j	145c <printf+0x312>
        buf[i--] = digits[x % base];
    16e6:	45b5                	li	a1,13
    if (sign)
    16e8:	d606d3e3          	bgez	a3,144e <printf+0x304>
        buf[i--] = '-';
    16ec:	02d00793          	li	a5,45
    16f0:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    16f4:	45b1                	li	a1,12
    write(f, s, l);
    16f6:	003c                	addi	a5,sp,8
    16f8:	4641                	li	a2,16
    16fa:	9e0d                	subw	a2,a2,a1
    16fc:	4505                	li	a0,1
    16fe:	95be                	add	a1,a1,a5
    1700:	71e000ef          	jal	ra,1e1e <write>
    1704:	bba1                	j	145c <printf+0x312>
        buf[i--] = digits[x % base];
    1706:	45b1                	li	a1,12
    if (sign)
    1708:	d406d3e3          	bgez	a3,144e <printf+0x304>
        buf[i--] = '-';
    170c:	02d00793          	li	a5,45
    1710:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1714:	45ad                	li	a1,11
    write(f, s, l);
    1716:	003c                	addi	a5,sp,8
    1718:	4641                	li	a2,16
    171a:	9e0d                	subw	a2,a2,a1
    171c:	4505                	li	a0,1
    171e:	95be                	add	a1,a1,a5
    1720:	6fe000ef          	jal	ra,1e1e <write>
    1724:	bb25                	j	145c <printf+0x312>
        buf[i--] = digits[x % base];
    1726:	45b1                	li	a1,12
    if (sign)
    1728:	d20653e3          	bgez	a2,144e <printf+0x304>
    172c:	b7c5                	j	170c <printf+0x5c2>
        buf[i--] = digits[x % base];
    172e:	45ad                	li	a1,11
    if (sign)
    1730:	d0065fe3          	bgez	a2,144e <printf+0x304>
        buf[i--] = '-';
    1734:	02d00793          	li	a5,45
    1738:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    173c:	45a9                	li	a1,10
    173e:	bb01                	j	144e <printf+0x304>
    1740:	45ad                	li	a1,11
    if (sign)
    1742:	d006d6e3          	bgez	a3,144e <printf+0x304>
    1746:	b7fd                	j	1734 <printf+0x5ea>
        buf[i--] = digits[x % base];
    1748:	45a9                	li	a1,10
    if (sign)
    174a:	d00652e3          	bgez	a2,144e <printf+0x304>
        buf[i--] = '-';
    174e:	02d00793          	li	a5,45
    1752:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1756:	45a5                	li	a1,9
    1758:	b9dd                	j	144e <printf+0x304>
    175a:	45a9                	li	a1,10
    if (sign)
    175c:	ce06d9e3          	bgez	a3,144e <printf+0x304>
    1760:	b7fd                	j	174e <printf+0x604>
        buf[i--] = digits[x % base];
    1762:	45a1                	li	a1,8
    if (sign)
    1764:	ce0655e3          	bgez	a2,144e <printf+0x304>
    1768:	b9f1                	j	1444 <printf+0x2fa>
        buf[i--] = digits[x % base];
    176a:	45a5                	li	a1,9
    if (sign)
    176c:	ce0651e3          	bgez	a2,144e <printf+0x304>
        buf[i--] = '-';
    1770:	02d00793          	li	a5,45
    1774:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1778:	45a1                	li	a1,8
    177a:	b9d1                	j	144e <printf+0x304>
    i = 15;
    177c:	45bd                	li	a1,15
    177e:	b9c1                	j	144e <printf+0x304>
        buf[i--] = digits[x % base];
    1780:	45a5                	li	a1,9
    if (sign)
    1782:	cc06d6e3          	bgez	a3,144e <printf+0x304>
    1786:	b7ed                	j	1770 <printf+0x626>

0000000000001788 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1788:	02000793          	li	a5,32
    178c:	00f50663          	beq	a0,a5,1798 <isspace+0x10>
    1790:	355d                	addiw	a0,a0,-9
    1792:	00553513          	sltiu	a0,a0,5
    1796:	8082                	ret
    1798:	4505                	li	a0,1
}
    179a:	8082                	ret

000000000000179c <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    179c:	fd05051b          	addiw	a0,a0,-48
}
    17a0:	00a53513          	sltiu	a0,a0,10
    17a4:	8082                	ret

00000000000017a6 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    17a6:	02000613          	li	a2,32
    17aa:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    17ac:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    17b0:	ff77069b          	addiw	a3,a4,-9
    17b4:	04c70d63          	beq	a4,a2,180e <atoi+0x68>
    17b8:	0007079b          	sext.w	a5,a4
    17bc:	04d5f963          	bgeu	a1,a3,180e <atoi+0x68>
        s++;
    switch (*s)
    17c0:	02b00693          	li	a3,43
    17c4:	04d70a63          	beq	a4,a3,1818 <atoi+0x72>
    17c8:	02d00693          	li	a3,45
    17cc:	06d70463          	beq	a4,a3,1834 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    17d0:	fd07859b          	addiw	a1,a5,-48
    17d4:	4625                	li	a2,9
    17d6:	873e                	mv	a4,a5
    17d8:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    17da:	4e01                	li	t3,0
    while (isdigit(*s))
    17dc:	04b66a63          	bltu	a2,a1,1830 <atoi+0x8a>
    int n = 0, neg = 0;
    17e0:	4501                	li	a0,0
    while (isdigit(*s))
    17e2:	4825                	li	a6,9
    17e4:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    17e8:	0025179b          	slliw	a5,a0,0x2
    17ec:	9d3d                	addw	a0,a0,a5
    17ee:	fd07031b          	addiw	t1,a4,-48
    17f2:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    17f6:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    17fa:	0685                	addi	a3,a3,1
    17fc:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1800:	0006071b          	sext.w	a4,a2
    1804:	feb870e3          	bgeu	a6,a1,17e4 <atoi+0x3e>
    return neg ? n : -n;
    1808:	000e0563          	beqz	t3,1812 <atoi+0x6c>
}
    180c:	8082                	ret
        s++;
    180e:	0505                	addi	a0,a0,1
    1810:	bf71                	j	17ac <atoi+0x6>
    1812:	4113053b          	subw	a0,t1,a7
    1816:	8082                	ret
    while (isdigit(*s))
    1818:	00154783          	lbu	a5,1(a0)
    181c:	4625                	li	a2,9
        s++;
    181e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1822:	fd07859b          	addiw	a1,a5,-48
    1826:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    182a:	4e01                	li	t3,0
    while (isdigit(*s))
    182c:	fab67ae3          	bgeu	a2,a1,17e0 <atoi+0x3a>
    1830:	4501                	li	a0,0
}
    1832:	8082                	ret
    while (isdigit(*s))
    1834:	00154783          	lbu	a5,1(a0)
    1838:	4625                	li	a2,9
        s++;
    183a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    183e:	fd07859b          	addiw	a1,a5,-48
    1842:	0007871b          	sext.w	a4,a5
    1846:	feb665e3          	bltu	a2,a1,1830 <atoi+0x8a>
        neg = 1;
    184a:	4e05                	li	t3,1
    184c:	bf51                	j	17e0 <atoi+0x3a>

000000000000184e <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    184e:	16060d63          	beqz	a2,19c8 <memset+0x17a>
    1852:	40a007b3          	neg	a5,a0
    1856:	8b9d                	andi	a5,a5,7
    1858:	00778713          	addi	a4,a5,7
    185c:	482d                	li	a6,11
    185e:	0ff5f593          	andi	a1,a1,255
    1862:	fff60693          	addi	a3,a2,-1
    1866:	17076263          	bltu	a4,a6,19ca <memset+0x17c>
    186a:	16e6ea63          	bltu	a3,a4,19de <memset+0x190>
    186e:	16078563          	beqz	a5,19d8 <memset+0x18a>
    1872:	00b50023          	sb	a1,0(a0)
    1876:	4705                	li	a4,1
    1878:	00150e93          	addi	t4,a0,1
    187c:	14e78c63          	beq	a5,a4,19d4 <memset+0x186>
    1880:	00b500a3          	sb	a1,1(a0)
    1884:	4709                	li	a4,2
    1886:	00250e93          	addi	t4,a0,2
    188a:	14e78d63          	beq	a5,a4,19e4 <memset+0x196>
    188e:	00b50123          	sb	a1,2(a0)
    1892:	470d                	li	a4,3
    1894:	00350e93          	addi	t4,a0,3
    1898:	12e78b63          	beq	a5,a4,19ce <memset+0x180>
    189c:	00b501a3          	sb	a1,3(a0)
    18a0:	4711                	li	a4,4
    18a2:	00450e93          	addi	t4,a0,4
    18a6:	14e78163          	beq	a5,a4,19e8 <memset+0x19a>
    18aa:	00b50223          	sb	a1,4(a0)
    18ae:	4715                	li	a4,5
    18b0:	00550e93          	addi	t4,a0,5
    18b4:	12e78c63          	beq	a5,a4,19ec <memset+0x19e>
    18b8:	00b502a3          	sb	a1,5(a0)
    18bc:	471d                	li	a4,7
    18be:	00650e93          	addi	t4,a0,6
    18c2:	12e79763          	bne	a5,a4,19f0 <memset+0x1a2>
    18c6:	00750e93          	addi	t4,a0,7
    18ca:	00b50323          	sb	a1,6(a0)
    18ce:	4f1d                	li	t5,7
    18d0:	00859713          	slli	a4,a1,0x8
    18d4:	8f4d                	or	a4,a4,a1
    18d6:	01059e13          	slli	t3,a1,0x10
    18da:	01c76e33          	or	t3,a4,t3
    18de:	01859313          	slli	t1,a1,0x18
    18e2:	006e6333          	or	t1,t3,t1
    18e6:	02059893          	slli	a7,a1,0x20
    18ea:	011368b3          	or	a7,t1,a7
    18ee:	02859813          	slli	a6,a1,0x28
    18f2:	40f60333          	sub	t1,a2,a5
    18f6:	0108e833          	or	a6,a7,a6
    18fa:	03059693          	slli	a3,a1,0x30
    18fe:	00d866b3          	or	a3,a6,a3
    1902:	03859713          	slli	a4,a1,0x38
    1906:	97aa                	add	a5,a5,a0
    1908:	ff837813          	andi	a6,t1,-8
    190c:	8f55                	or	a4,a4,a3
    190e:	00f806b3          	add	a3,a6,a5
    1912:	e398                	sd	a4,0(a5)
    1914:	07a1                	addi	a5,a5,8
    1916:	fed79ee3          	bne	a5,a3,1912 <memset+0xc4>
    191a:	ff837693          	andi	a3,t1,-8
    191e:	00de87b3          	add	a5,t4,a3
    1922:	01e6873b          	addw	a4,a3,t5
    1926:	0ad30663          	beq	t1,a3,19d2 <memset+0x184>
    192a:	00b78023          	sb	a1,0(a5)
    192e:	0017069b          	addiw	a3,a4,1
    1932:	08c6fb63          	bgeu	a3,a2,19c8 <memset+0x17a>
    1936:	00b780a3          	sb	a1,1(a5)
    193a:	0027069b          	addiw	a3,a4,2
    193e:	08c6f563          	bgeu	a3,a2,19c8 <memset+0x17a>
    1942:	00b78123          	sb	a1,2(a5)
    1946:	0037069b          	addiw	a3,a4,3
    194a:	06c6ff63          	bgeu	a3,a2,19c8 <memset+0x17a>
    194e:	00b781a3          	sb	a1,3(a5)
    1952:	0047069b          	addiw	a3,a4,4
    1956:	06c6f963          	bgeu	a3,a2,19c8 <memset+0x17a>
    195a:	00b78223          	sb	a1,4(a5)
    195e:	0057069b          	addiw	a3,a4,5
    1962:	06c6f363          	bgeu	a3,a2,19c8 <memset+0x17a>
    1966:	00b782a3          	sb	a1,5(a5)
    196a:	0067069b          	addiw	a3,a4,6
    196e:	04c6fd63          	bgeu	a3,a2,19c8 <memset+0x17a>
    1972:	00b78323          	sb	a1,6(a5)
    1976:	0077069b          	addiw	a3,a4,7
    197a:	04c6f763          	bgeu	a3,a2,19c8 <memset+0x17a>
    197e:	00b783a3          	sb	a1,7(a5)
    1982:	0087069b          	addiw	a3,a4,8
    1986:	04c6f163          	bgeu	a3,a2,19c8 <memset+0x17a>
    198a:	00b78423          	sb	a1,8(a5)
    198e:	0097069b          	addiw	a3,a4,9
    1992:	02c6fb63          	bgeu	a3,a2,19c8 <memset+0x17a>
    1996:	00b784a3          	sb	a1,9(a5)
    199a:	00a7069b          	addiw	a3,a4,10
    199e:	02c6f563          	bgeu	a3,a2,19c8 <memset+0x17a>
    19a2:	00b78523          	sb	a1,10(a5)
    19a6:	00b7069b          	addiw	a3,a4,11
    19aa:	00c6ff63          	bgeu	a3,a2,19c8 <memset+0x17a>
    19ae:	00b785a3          	sb	a1,11(a5)
    19b2:	00c7069b          	addiw	a3,a4,12
    19b6:	00c6f963          	bgeu	a3,a2,19c8 <memset+0x17a>
    19ba:	00b78623          	sb	a1,12(a5)
    19be:	2735                	addiw	a4,a4,13
    19c0:	00c77463          	bgeu	a4,a2,19c8 <memset+0x17a>
    19c4:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    19c8:	8082                	ret
    19ca:	472d                	li	a4,11
    19cc:	bd79                	j	186a <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    19ce:	4f0d                	li	t5,3
    19d0:	b701                	j	18d0 <memset+0x82>
    19d2:	8082                	ret
    19d4:	4f05                	li	t5,1
    19d6:	bded                	j	18d0 <memset+0x82>
    19d8:	8eaa                	mv	t4,a0
    19da:	4f01                	li	t5,0
    19dc:	bdd5                	j	18d0 <memset+0x82>
    19de:	87aa                	mv	a5,a0
    19e0:	4701                	li	a4,0
    19e2:	b7a1                	j	192a <memset+0xdc>
    19e4:	4f09                	li	t5,2
    19e6:	b5ed                	j	18d0 <memset+0x82>
    19e8:	4f11                	li	t5,4
    19ea:	b5dd                	j	18d0 <memset+0x82>
    19ec:	4f15                	li	t5,5
    19ee:	b5cd                	j	18d0 <memset+0x82>
    19f0:	4f19                	li	t5,6
    19f2:	bdf9                	j	18d0 <memset+0x82>

00000000000019f4 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    19f4:	00054783          	lbu	a5,0(a0)
    19f8:	0005c703          	lbu	a4,0(a1)
    19fc:	00e79863          	bne	a5,a4,1a0c <strcmp+0x18>
    1a00:	0505                	addi	a0,a0,1
    1a02:	0585                	addi	a1,a1,1
    1a04:	fbe5                	bnez	a5,19f4 <strcmp>
    1a06:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1a08:	9d19                	subw	a0,a0,a4
    1a0a:	8082                	ret
    1a0c:	0007851b          	sext.w	a0,a5
    1a10:	bfe5                	j	1a08 <strcmp+0x14>

0000000000001a12 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1a12:	ce05                	beqz	a2,1a4a <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1a14:	00054703          	lbu	a4,0(a0)
    1a18:	0005c783          	lbu	a5,0(a1)
    1a1c:	cb0d                	beqz	a4,1a4e <strncmp+0x3c>
    if (!n--)
    1a1e:	167d                	addi	a2,a2,-1
    1a20:	00c506b3          	add	a3,a0,a2
    1a24:	a819                	j	1a3a <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1a26:	00a68e63          	beq	a3,a0,1a42 <strncmp+0x30>
    1a2a:	0505                	addi	a0,a0,1
    1a2c:	00e79b63          	bne	a5,a4,1a42 <strncmp+0x30>
    1a30:	00054703          	lbu	a4,0(a0)
    1a34:	0005c783          	lbu	a5,0(a1)
    1a38:	cb19                	beqz	a4,1a4e <strncmp+0x3c>
    1a3a:	0005c783          	lbu	a5,0(a1)
    1a3e:	0585                	addi	a1,a1,1
    1a40:	f3fd                	bnez	a5,1a26 <strncmp+0x14>
        ;
    return *l - *r;
    1a42:	0007051b          	sext.w	a0,a4
    1a46:	9d1d                	subw	a0,a0,a5
    1a48:	8082                	ret
        return 0;
    1a4a:	4501                	li	a0,0
}
    1a4c:	8082                	ret
    1a4e:	4501                	li	a0,0
    return *l - *r;
    1a50:	9d1d                	subw	a0,a0,a5
    1a52:	8082                	ret

0000000000001a54 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1a54:	00757793          	andi	a5,a0,7
    1a58:	cf89                	beqz	a5,1a72 <strlen+0x1e>
    1a5a:	87aa                	mv	a5,a0
    1a5c:	a029                	j	1a66 <strlen+0x12>
    1a5e:	0785                	addi	a5,a5,1
    1a60:	0077f713          	andi	a4,a5,7
    1a64:	cb01                	beqz	a4,1a74 <strlen+0x20>
        if (!*s)
    1a66:	0007c703          	lbu	a4,0(a5)
    1a6a:	fb75                	bnez	a4,1a5e <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1a6c:	40a78533          	sub	a0,a5,a0
}
    1a70:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1a72:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1a74:	6394                	ld	a3,0(a5)
    1a76:	00000597          	auipc	a1,0x0
    1a7a:	5825b583          	ld	a1,1410(a1) # 1ff8 <unlink+0x34>
    1a7e:	00000617          	auipc	a2,0x0
    1a82:	58263603          	ld	a2,1410(a2) # 2000 <unlink+0x3c>
    1a86:	a019                	j	1a8c <strlen+0x38>
    1a88:	6794                	ld	a3,8(a5)
    1a8a:	07a1                	addi	a5,a5,8
    1a8c:	00b68733          	add	a4,a3,a1
    1a90:	fff6c693          	not	a3,a3
    1a94:	8f75                	and	a4,a4,a3
    1a96:	8f71                	and	a4,a4,a2
    1a98:	db65                	beqz	a4,1a88 <strlen+0x34>
    for (; *s; s++)
    1a9a:	0007c703          	lbu	a4,0(a5)
    1a9e:	d779                	beqz	a4,1a6c <strlen+0x18>
    1aa0:	0017c703          	lbu	a4,1(a5)
    1aa4:	0785                	addi	a5,a5,1
    1aa6:	d379                	beqz	a4,1a6c <strlen+0x18>
    1aa8:	0017c703          	lbu	a4,1(a5)
    1aac:	0785                	addi	a5,a5,1
    1aae:	fb6d                	bnez	a4,1aa0 <strlen+0x4c>
    1ab0:	bf75                	j	1a6c <strlen+0x18>

0000000000001ab2 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1ab2:	00757713          	andi	a4,a0,7
{
    1ab6:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1ab8:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1abc:	cb19                	beqz	a4,1ad2 <memchr+0x20>
    1abe:	ce25                	beqz	a2,1b36 <memchr+0x84>
    1ac0:	0007c703          	lbu	a4,0(a5)
    1ac4:	04b70e63          	beq	a4,a1,1b20 <memchr+0x6e>
    1ac8:	0785                	addi	a5,a5,1
    1aca:	0077f713          	andi	a4,a5,7
    1ace:	167d                	addi	a2,a2,-1
    1ad0:	f77d                	bnez	a4,1abe <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1ad2:	4501                	li	a0,0
    if (n && *s != c)
    1ad4:	c235                	beqz	a2,1b38 <memchr+0x86>
    1ad6:	0007c703          	lbu	a4,0(a5)
    1ada:	04b70363          	beq	a4,a1,1b20 <memchr+0x6e>
        size_t k = ONES * c;
    1ade:	00000517          	auipc	a0,0x0
    1ae2:	52a53503          	ld	a0,1322(a0) # 2008 <unlink+0x44>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1ae6:	471d                	li	a4,7
        size_t k = ONES * c;
    1ae8:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1aec:	02c77a63          	bgeu	a4,a2,1b20 <memchr+0x6e>
    1af0:	00000897          	auipc	a7,0x0
    1af4:	5088b883          	ld	a7,1288(a7) # 1ff8 <unlink+0x34>
    1af8:	00000817          	auipc	a6,0x0
    1afc:	50883803          	ld	a6,1288(a6) # 2000 <unlink+0x3c>
    1b00:	431d                	li	t1,7
    1b02:	a029                	j	1b0c <memchr+0x5a>
    1b04:	1661                	addi	a2,a2,-8
    1b06:	07a1                	addi	a5,a5,8
    1b08:	02c37963          	bgeu	t1,a2,1b3a <memchr+0x88>
    1b0c:	6398                	ld	a4,0(a5)
    1b0e:	8f29                	xor	a4,a4,a0
    1b10:	011706b3          	add	a3,a4,a7
    1b14:	fff74713          	not	a4,a4
    1b18:	8f75                	and	a4,a4,a3
    1b1a:	01077733          	and	a4,a4,a6
    1b1e:	d37d                	beqz	a4,1b04 <memchr+0x52>
    1b20:	853e                	mv	a0,a5
    1b22:	97b2                	add	a5,a5,a2
    1b24:	a021                	j	1b2c <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1b26:	0505                	addi	a0,a0,1
    1b28:	00f50763          	beq	a0,a5,1b36 <memchr+0x84>
    1b2c:	00054703          	lbu	a4,0(a0)
    1b30:	feb71be3          	bne	a4,a1,1b26 <memchr+0x74>
    1b34:	8082                	ret
    return n ? (void *)s : 0;
    1b36:	4501                	li	a0,0
}
    1b38:	8082                	ret
    return n ? (void *)s : 0;
    1b3a:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1b3c:	f275                	bnez	a2,1b20 <memchr+0x6e>
}
    1b3e:	8082                	ret

0000000000001b40 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1b40:	1101                	addi	sp,sp,-32
    1b42:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1b44:	862e                	mv	a2,a1
{
    1b46:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1b48:	4581                	li	a1,0
{
    1b4a:	e426                	sd	s1,8(sp)
    1b4c:	ec06                	sd	ra,24(sp)
    1b4e:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1b50:	f63ff0ef          	jal	ra,1ab2 <memchr>
    return p ? p - s : n;
    1b54:	c519                	beqz	a0,1b62 <strnlen+0x22>
}
    1b56:	60e2                	ld	ra,24(sp)
    1b58:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1b5a:	8d05                	sub	a0,a0,s1
}
    1b5c:	64a2                	ld	s1,8(sp)
    1b5e:	6105                	addi	sp,sp,32
    1b60:	8082                	ret
    1b62:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1b64:	8522                	mv	a0,s0
}
    1b66:	6442                	ld	s0,16(sp)
    1b68:	64a2                	ld	s1,8(sp)
    1b6a:	6105                	addi	sp,sp,32
    1b6c:	8082                	ret

0000000000001b6e <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1b6e:	00b547b3          	xor	a5,a0,a1
    1b72:	8b9d                	andi	a5,a5,7
    1b74:	eb95                	bnez	a5,1ba8 <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1b76:	0075f793          	andi	a5,a1,7
    1b7a:	e7b1                	bnez	a5,1bc6 <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1b7c:	6198                	ld	a4,0(a1)
    1b7e:	00000617          	auipc	a2,0x0
    1b82:	47a63603          	ld	a2,1146(a2) # 1ff8 <unlink+0x34>
    1b86:	00000817          	auipc	a6,0x0
    1b8a:	47a83803          	ld	a6,1146(a6) # 2000 <unlink+0x3c>
    1b8e:	a029                	j	1b98 <stpcpy+0x2a>
    1b90:	e118                	sd	a4,0(a0)
    1b92:	6598                	ld	a4,8(a1)
    1b94:	05a1                	addi	a1,a1,8
    1b96:	0521                	addi	a0,a0,8
    1b98:	00c707b3          	add	a5,a4,a2
    1b9c:	fff74693          	not	a3,a4
    1ba0:	8ff5                	and	a5,a5,a3
    1ba2:	0107f7b3          	and	a5,a5,a6
    1ba6:	d7ed                	beqz	a5,1b90 <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1ba8:	0005c783          	lbu	a5,0(a1)
    1bac:	00f50023          	sb	a5,0(a0)
    1bb0:	c785                	beqz	a5,1bd8 <stpcpy+0x6a>
    1bb2:	0015c783          	lbu	a5,1(a1)
    1bb6:	0505                	addi	a0,a0,1
    1bb8:	0585                	addi	a1,a1,1
    1bba:	00f50023          	sb	a5,0(a0)
    1bbe:	fbf5                	bnez	a5,1bb2 <stpcpy+0x44>
        ;
    return d;
}
    1bc0:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1bc2:	0505                	addi	a0,a0,1
    1bc4:	df45                	beqz	a4,1b7c <stpcpy+0xe>
            if (!(*d = *s))
    1bc6:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1bca:	0585                	addi	a1,a1,1
    1bcc:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1bd0:	00f50023          	sb	a5,0(a0)
    1bd4:	f7fd                	bnez	a5,1bc2 <stpcpy+0x54>
}
    1bd6:	8082                	ret
    1bd8:	8082                	ret

0000000000001bda <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1bda:	00b547b3          	xor	a5,a0,a1
    1bde:	8b9d                	andi	a5,a5,7
    1be0:	1a079863          	bnez	a5,1d90 <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1be4:	0075f793          	andi	a5,a1,7
    1be8:	16078463          	beqz	a5,1d50 <stpncpy+0x176>
    1bec:	ea01                	bnez	a2,1bfc <stpncpy+0x22>
    1bee:	a421                	j	1df6 <stpncpy+0x21c>
    1bf0:	167d                	addi	a2,a2,-1
    1bf2:	0505                	addi	a0,a0,1
    1bf4:	14070e63          	beqz	a4,1d50 <stpncpy+0x176>
    1bf8:	1a060863          	beqz	a2,1da8 <stpncpy+0x1ce>
    1bfc:	0005c783          	lbu	a5,0(a1)
    1c00:	0585                	addi	a1,a1,1
    1c02:	0075f713          	andi	a4,a1,7
    1c06:	00f50023          	sb	a5,0(a0)
    1c0a:	f3fd                	bnez	a5,1bf0 <stpncpy+0x16>
    1c0c:	4805                	li	a6,1
    1c0e:	1a061863          	bnez	a2,1dbe <stpncpy+0x1e4>
    1c12:	40a007b3          	neg	a5,a0
    1c16:	8b9d                	andi	a5,a5,7
    1c18:	4681                	li	a3,0
    1c1a:	18061a63          	bnez	a2,1dae <stpncpy+0x1d4>
    1c1e:	00778713          	addi	a4,a5,7
    1c22:	45ad                	li	a1,11
    1c24:	18b76363          	bltu	a4,a1,1daa <stpncpy+0x1d0>
    1c28:	1ae6eb63          	bltu	a3,a4,1dde <stpncpy+0x204>
    1c2c:	1a078363          	beqz	a5,1dd2 <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c30:	00050023          	sb	zero,0(a0)
    1c34:	4685                	li	a3,1
    1c36:	00150713          	addi	a4,a0,1
    1c3a:	18d78f63          	beq	a5,a3,1dd8 <stpncpy+0x1fe>
    1c3e:	000500a3          	sb	zero,1(a0)
    1c42:	4689                	li	a3,2
    1c44:	00250713          	addi	a4,a0,2
    1c48:	18d78e63          	beq	a5,a3,1de4 <stpncpy+0x20a>
    1c4c:	00050123          	sb	zero,2(a0)
    1c50:	468d                	li	a3,3
    1c52:	00350713          	addi	a4,a0,3
    1c56:	16d78c63          	beq	a5,a3,1dce <stpncpy+0x1f4>
    1c5a:	000501a3          	sb	zero,3(a0)
    1c5e:	4691                	li	a3,4
    1c60:	00450713          	addi	a4,a0,4
    1c64:	18d78263          	beq	a5,a3,1de8 <stpncpy+0x20e>
    1c68:	00050223          	sb	zero,4(a0)
    1c6c:	4695                	li	a3,5
    1c6e:	00550713          	addi	a4,a0,5
    1c72:	16d78d63          	beq	a5,a3,1dec <stpncpy+0x212>
    1c76:	000502a3          	sb	zero,5(a0)
    1c7a:	469d                	li	a3,7
    1c7c:	00650713          	addi	a4,a0,6
    1c80:	16d79863          	bne	a5,a3,1df0 <stpncpy+0x216>
    1c84:	00750713          	addi	a4,a0,7
    1c88:	00050323          	sb	zero,6(a0)
    1c8c:	40f80833          	sub	a6,a6,a5
    1c90:	ff887593          	andi	a1,a6,-8
    1c94:	97aa                	add	a5,a5,a0
    1c96:	95be                	add	a1,a1,a5
    1c98:	0007b023          	sd	zero,0(a5)
    1c9c:	07a1                	addi	a5,a5,8
    1c9e:	feb79de3          	bne	a5,a1,1c98 <stpncpy+0xbe>
    1ca2:	ff887593          	andi	a1,a6,-8
    1ca6:	9ead                	addw	a3,a3,a1
    1ca8:	00b707b3          	add	a5,a4,a1
    1cac:	12b80863          	beq	a6,a1,1ddc <stpncpy+0x202>
    1cb0:	00078023          	sb	zero,0(a5)
    1cb4:	0016871b          	addiw	a4,a3,1
    1cb8:	0ec77863          	bgeu	a4,a2,1da8 <stpncpy+0x1ce>
    1cbc:	000780a3          	sb	zero,1(a5)
    1cc0:	0026871b          	addiw	a4,a3,2
    1cc4:	0ec77263          	bgeu	a4,a2,1da8 <stpncpy+0x1ce>
    1cc8:	00078123          	sb	zero,2(a5)
    1ccc:	0036871b          	addiw	a4,a3,3
    1cd0:	0cc77c63          	bgeu	a4,a2,1da8 <stpncpy+0x1ce>
    1cd4:	000781a3          	sb	zero,3(a5)
    1cd8:	0046871b          	addiw	a4,a3,4
    1cdc:	0cc77663          	bgeu	a4,a2,1da8 <stpncpy+0x1ce>
    1ce0:	00078223          	sb	zero,4(a5)
    1ce4:	0056871b          	addiw	a4,a3,5
    1ce8:	0cc77063          	bgeu	a4,a2,1da8 <stpncpy+0x1ce>
    1cec:	000782a3          	sb	zero,5(a5)
    1cf0:	0066871b          	addiw	a4,a3,6
    1cf4:	0ac77a63          	bgeu	a4,a2,1da8 <stpncpy+0x1ce>
    1cf8:	00078323          	sb	zero,6(a5)
    1cfc:	0076871b          	addiw	a4,a3,7
    1d00:	0ac77463          	bgeu	a4,a2,1da8 <stpncpy+0x1ce>
    1d04:	000783a3          	sb	zero,7(a5)
    1d08:	0086871b          	addiw	a4,a3,8
    1d0c:	08c77e63          	bgeu	a4,a2,1da8 <stpncpy+0x1ce>
    1d10:	00078423          	sb	zero,8(a5)
    1d14:	0096871b          	addiw	a4,a3,9
    1d18:	08c77863          	bgeu	a4,a2,1da8 <stpncpy+0x1ce>
    1d1c:	000784a3          	sb	zero,9(a5)
    1d20:	00a6871b          	addiw	a4,a3,10
    1d24:	08c77263          	bgeu	a4,a2,1da8 <stpncpy+0x1ce>
    1d28:	00078523          	sb	zero,10(a5)
    1d2c:	00b6871b          	addiw	a4,a3,11
    1d30:	06c77c63          	bgeu	a4,a2,1da8 <stpncpy+0x1ce>
    1d34:	000785a3          	sb	zero,11(a5)
    1d38:	00c6871b          	addiw	a4,a3,12
    1d3c:	06c77663          	bgeu	a4,a2,1da8 <stpncpy+0x1ce>
    1d40:	00078623          	sb	zero,12(a5)
    1d44:	26b5                	addiw	a3,a3,13
    1d46:	06c6f163          	bgeu	a3,a2,1da8 <stpncpy+0x1ce>
    1d4a:	000786a3          	sb	zero,13(a5)
    1d4e:	8082                	ret
            ;
        if (!n || !*s)
    1d50:	c645                	beqz	a2,1df8 <stpncpy+0x21e>
    1d52:	0005c783          	lbu	a5,0(a1)
    1d56:	ea078be3          	beqz	a5,1c0c <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d5a:	479d                	li	a5,7
    1d5c:	02c7ff63          	bgeu	a5,a2,1d9a <stpncpy+0x1c0>
    1d60:	00000897          	auipc	a7,0x0
    1d64:	2988b883          	ld	a7,664(a7) # 1ff8 <unlink+0x34>
    1d68:	00000817          	auipc	a6,0x0
    1d6c:	29883803          	ld	a6,664(a6) # 2000 <unlink+0x3c>
    1d70:	431d                	li	t1,7
    1d72:	6198                	ld	a4,0(a1)
    1d74:	011707b3          	add	a5,a4,a7
    1d78:	fff74693          	not	a3,a4
    1d7c:	8ff5                	and	a5,a5,a3
    1d7e:	0107f7b3          	and	a5,a5,a6
    1d82:	ef81                	bnez	a5,1d9a <stpncpy+0x1c0>
            *wd = *ws;
    1d84:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d86:	1661                	addi	a2,a2,-8
    1d88:	05a1                	addi	a1,a1,8
    1d8a:	0521                	addi	a0,a0,8
    1d8c:	fec363e3          	bltu	t1,a2,1d72 <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1d90:	e609                	bnez	a2,1d9a <stpncpy+0x1c0>
    1d92:	a08d                	j	1df4 <stpncpy+0x21a>
    1d94:	167d                	addi	a2,a2,-1
    1d96:	0505                	addi	a0,a0,1
    1d98:	ca01                	beqz	a2,1da8 <stpncpy+0x1ce>
    1d9a:	0005c783          	lbu	a5,0(a1)
    1d9e:	0585                	addi	a1,a1,1
    1da0:	00f50023          	sb	a5,0(a0)
    1da4:	fbe5                	bnez	a5,1d94 <stpncpy+0x1ba>
        ;
tail:
    1da6:	b59d                	j	1c0c <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1da8:	8082                	ret
    1daa:	472d                	li	a4,11
    1dac:	bdb5                	j	1c28 <stpncpy+0x4e>
    1dae:	00778713          	addi	a4,a5,7
    1db2:	45ad                	li	a1,11
    1db4:	fff60693          	addi	a3,a2,-1
    1db8:	e6b778e3          	bgeu	a4,a1,1c28 <stpncpy+0x4e>
    1dbc:	b7fd                	j	1daa <stpncpy+0x1d0>
    1dbe:	40a007b3          	neg	a5,a0
    1dc2:	8832                	mv	a6,a2
    1dc4:	8b9d                	andi	a5,a5,7
    1dc6:	4681                	li	a3,0
    1dc8:	e4060be3          	beqz	a2,1c1e <stpncpy+0x44>
    1dcc:	b7cd                	j	1dae <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1dce:	468d                	li	a3,3
    1dd0:	bd75                	j	1c8c <stpncpy+0xb2>
    1dd2:	872a                	mv	a4,a0
    1dd4:	4681                	li	a3,0
    1dd6:	bd5d                	j	1c8c <stpncpy+0xb2>
    1dd8:	4685                	li	a3,1
    1dda:	bd4d                	j	1c8c <stpncpy+0xb2>
    1ddc:	8082                	ret
    1dde:	87aa                	mv	a5,a0
    1de0:	4681                	li	a3,0
    1de2:	b5f9                	j	1cb0 <stpncpy+0xd6>
    1de4:	4689                	li	a3,2
    1de6:	b55d                	j	1c8c <stpncpy+0xb2>
    1de8:	4691                	li	a3,4
    1dea:	b54d                	j	1c8c <stpncpy+0xb2>
    1dec:	4695                	li	a3,5
    1dee:	bd79                	j	1c8c <stpncpy+0xb2>
    1df0:	4699                	li	a3,6
    1df2:	bd69                	j	1c8c <stpncpy+0xb2>
    1df4:	8082                	ret
    1df6:	8082                	ret
    1df8:	8082                	ret

0000000000001dfa <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1dfa:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1dfe:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e00:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1e04:	2501                	sext.w	a0,a0
    1e06:	8082                	ret

0000000000001e08 <close>:
    register long a7 __asm__("a7") = n;
    1e08:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1e0c:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <read>:
    register long a7 __asm__("a7") = n;
    1e14:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e18:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1e1c:	8082                	ret

0000000000001e1e <write>:
    register long a7 __asm__("a7") = n;
    1e1e:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e22:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1e26:	8082                	ret

0000000000001e28 <getpid>:
    register long a7 __asm__("a7") = n;
    1e28:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1e2c:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1e30:	2501                	sext.w	a0,a0
    1e32:	8082                	ret

0000000000001e34 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1e34:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1e38:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1e3c:	2501                	sext.w	a0,a0
    1e3e:	8082                	ret

0000000000001e40 <fork>:
    register long a7 __asm__("a7") = n;
    1e40:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1e44:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1e48:	2501                	sext.w	a0,a0
    1e4a:	8082                	ret

0000000000001e4c <exit>:
    register long a7 __asm__("a7") = n;
    1e4c:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e50:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e54:	8082                	ret

0000000000001e56 <waitpid>:
    register long a7 __asm__("a7") = n;
    1e56:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5a:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <exec>:
    register long a7 __asm__("a7") = n;
    1e62:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e66:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e6a:	2501                	sext.w	a0,a0
    1e6c:	8082                	ret

0000000000001e6e <get_time>:

int64 get_time()
{
    1e6e:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e70:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e74:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e76:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e78:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e7c:	2501                	sext.w	a0,a0
    1e7e:	ed09                	bnez	a0,1e98 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e80:	67a2                	ld	a5,8(sp)
    1e82:	3e800713          	li	a4,1000
    1e86:	00015503          	lhu	a0,0(sp)
    1e8a:	02e7d7b3          	divu	a5,a5,a4
    1e8e:	02e50533          	mul	a0,a0,a4
    1e92:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e94:	0141                	addi	sp,sp,16
    1e96:	8082                	ret
        return -1;
    1e98:	557d                	li	a0,-1
    1e9a:	bfed                	j	1e94 <get_time+0x26>

0000000000001e9c <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e9c:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea0:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1ea4:	2501                	sext.w	a0,a0
    1ea6:	8082                	ret

0000000000001ea8 <sleep>:

int sleep(unsigned long long time)
{
    1ea8:	1141                	addi	sp,sp,-16
    1eaa:	862a                	mv	a2,a0
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
    1eba:	e13d                	bnez	a0,1f20 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ebc:	6722                	ld	a4,8(sp)
    1ebe:	3e800693          	li	a3,1000
    1ec2:	00015783          	lhu	a5,0(sp)
    1ec6:	02d75733          	divu	a4,a4,a3
    1eca:	02d787b3          	mul	a5,a5,a3
    1ece:	97ba                	add	a5,a5,a4
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
    1ede:	ed15                	bnez	a0,1f1a <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ee0:	6841                	lui	a6,0x10
    1ee2:	963e                	add	a2,a2,a5
    1ee4:	187d                	addi	a6,a6,-1
    1ee6:	3e800693          	li	a3,1000
    1eea:	a819                	j	1f00 <sleep+0x58>
    __asm_syscall("r"(a7))
    1eec:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1ef0:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ef4:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ef6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef8:	00000073          	ecall
    if (err == 0)
    1efc:	2501                	sext.w	a0,a0
    1efe:	ed11                	bnez	a0,1f1a <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1f00:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1f02:	07c00893          	li	a7,124
    1f06:	02d7d733          	divu	a4,a5,a3
    1f0a:	6782                	ld	a5,0(sp)
    1f0c:	0107f7b3          	and	a5,a5,a6
    1f10:	02d787b3          	mul	a5,a5,a3
    1f14:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1f16:	fcc7ebe3          	bltu	a5,a2,1eec <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1f1a:	4501                	li	a0,0
    1f1c:	0141                	addi	sp,sp,16
    1f1e:	8082                	ret
    1f20:	57fd                	li	a5,-1
    1f22:	b77d                	j	1ed0 <sleep+0x28>

0000000000001f24 <set_priority>:
    register long a7 __asm__("a7") = n;
    1f24:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1f28:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1f2c:	2501                	sext.w	a0,a0
    1f2e:	8082                	ret

0000000000001f30 <mmap>:
    register long a7 __asm__("a7") = n;
    1f30:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f34:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1f38:	2501                	sext.w	a0,a0
    1f3a:	8082                	ret

0000000000001f3c <munmap>:
    register long a7 __asm__("a7") = n;
    1f3c:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f40:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1f44:	2501                	sext.w	a0,a0
    1f46:	8082                	ret

0000000000001f48 <wait>:

int wait(int *code)
{
    1f48:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f4a:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1f4e:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f50:	00000073          	ecall
    return waitpid(-1, code);
}
    1f54:	2501                	sext.w	a0,a0
    1f56:	8082                	ret

0000000000001f58 <spawn>:
    register long a7 __asm__("a7") = n;
    1f58:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1f5c:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f60:	2501                	sext.w	a0,a0
    1f62:	8082                	ret

0000000000001f64 <mailread>:
    register long a7 __asm__("a7") = n;
    1f64:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f68:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f6c:	2501                	sext.w	a0,a0
    1f6e:	8082                	ret

0000000000001f70 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f70:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f74:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f78:	2501                	sext.w	a0,a0
    1f7a:	8082                	ret

0000000000001f7c <fstat>:
    register long a7 __asm__("a7") = n;
    1f7c:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f80:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f84:	2501                	sext.w	a0,a0
    1f86:	8082                	ret

0000000000001f88 <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1f88:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f8a:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f8e:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f90:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f94:	2501                	sext.w	a0,a0
    1f96:	8082                	ret

0000000000001f98 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f98:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f9a:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f9e:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fa0:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1fa4:	2501                	sext.w	a0,a0
    1fa6:	8082                	ret

0000000000001fa8 <link>:

int link(char *old_path, char *new_path)
{
    1fa8:	87aa                	mv	a5,a0
    1faa:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1fac:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1fb0:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1fb4:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1fb6:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1fba:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fbc:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1fc0:	2501                	sext.w	a0,a0
    1fc2:	8082                	ret

0000000000001fc4 <unlink>:

int unlink(char *path)
{
    1fc4:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1fc6:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1fca:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1fce:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fd0:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1fd4:	2501                	sext.w	a0,a0
    1fd6:	8082                	ret
