
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch4_mmap3:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0980006f          	j	109a <__start_main>

0000000000001006 <main>:
/*
理想结果：对于错误的 mmap 返回 -1，最终输出 Test 04_4 test OK!
*/

int main()
{
    1006:	1141                	addi	sp,sp,-16
    uint64 start = 0x10000000;
    uint64 len = 4096;
    int prot = 3;
    assert(len == mmap((void *)start, len, prot));
    1008:	460d                	li	a2,3
    100a:	6585                	lui	a1,0x1
    100c:	10000537          	lui	a0,0x10000
{
    1010:	e406                	sd	ra,8(sp)
    assert(len == mmap((void *)start, len, prot));
    1012:	701000ef          	jal	ra,1f12 <mmap>
    1016:	6785                	lui	a5,0x1
    1018:	00f50563          	beq	a0,a5,1022 <main+0x1c>
    101c:	557d                	li	a0,-1
    101e:	611000ef          	jal	ra,1e2e <exit>
    assert(mmap((void *)(start - len), len + 1, prot) == -1);
    1022:	6585                	lui	a1,0x1
    1024:	460d                	li	a2,3
    1026:	0585                	addi	a1,a1,1
    1028:	0ffff537          	lui	a0,0xffff
    102c:	6e7000ef          	jal	ra,1f12 <mmap>
    1030:	57fd                	li	a5,-1
    1032:	00f50563          	beq	a0,a5,103c <main+0x36>
    1036:	557d                	li	a0,-1
    1038:	5f7000ef          	jal	ra,1e2e <exit>
    assert(mmap((void *)(start + len + 1), len, prot) == -1);
    103c:	10001537          	lui	a0,0x10001
    1040:	460d                	li	a2,3
    1042:	6585                	lui	a1,0x1
    1044:	0505                	addi	a0,a0,1
    1046:	6cd000ef          	jal	ra,1f12 <mmap>
    104a:	57fd                	li	a5,-1
    104c:	00f50563          	beq	a0,a5,1056 <main+0x50>
    1050:	557d                	li	a0,-1
    1052:	5dd000ef          	jal	ra,1e2e <exit>
    assert(mmap((void *)(start + len), len, 0) == -1);
    1056:	4601                	li	a2,0
    1058:	6585                	lui	a1,0x1
    105a:	10001537          	lui	a0,0x10001
    105e:	6b5000ef          	jal	ra,1f12 <mmap>
    1062:	57fd                	li	a5,-1
    1064:	00f50563          	beq	a0,a5,106e <main+0x68>
    1068:	557d                	li	a0,-1
    106a:	5c5000ef          	jal	ra,1e2e <exit>
    assert(mmap((void *)(start + len), len, prot | 8) == -1);
    106e:	462d                	li	a2,11
    1070:	6585                	lui	a1,0x1
    1072:	10001537          	lui	a0,0x10001
    1076:	69d000ef          	jal	ra,1f12 <mmap>
    107a:	57fd                	li	a5,-1
    107c:	00f50563          	beq	a0,a5,1086 <main+0x80>
    1080:	557d                	li	a0,-1
    1082:	5ad000ef          	jal	ra,1e2e <exit>
    puts("Test 04_4 test OK!");
    1086:	00001517          	auipc	a0,0x1
    108a:	f3a50513          	addi	a0,a0,-198 # 1fc0 <unlink+0x1a>
    108e:	05c000ef          	jal	ra,10ea <puts>
    return 0;
    1092:	60a2                	ld	ra,8(sp)
    1094:	4501                	li	a0,0
    1096:	0141                	addi	sp,sp,16
    1098:	8082                	ret

000000000000109a <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    109a:	1141                	addi	sp,sp,-16
    109c:	e406                	sd	ra,8(sp)
    exit(main());
    109e:	f69ff0ef          	jal	ra,1006 <main>
    10a2:	58d000ef          	jal	ra,1e2e <exit>
    return 0;
}
    10a6:	60a2                	ld	ra,8(sp)
    10a8:	4501                	li	a0,0
    10aa:	0141                	addi	sp,sp,16
    10ac:	8082                	ret

00000000000010ae <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    10ae:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    10b0:	00f10593          	addi	a1,sp,15
    10b4:	4605                	li	a2,1
    10b6:	4501                	li	a0,0
{
    10b8:	ec06                	sd	ra,24(sp)
    char byte = 0;
    10ba:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    10be:	539000ef          	jal	ra,1df6 <read>
    return byte;
}
    10c2:	60e2                	ld	ra,24(sp)
    10c4:	00f14503          	lbu	a0,15(sp)
    10c8:	6105                	addi	sp,sp,32
    10ca:	8082                	ret

00000000000010cc <putchar>:

int putchar(int c)
{
    10cc:	1101                	addi	sp,sp,-32
    10ce:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    10d0:	00f10593          	addi	a1,sp,15
    10d4:	4605                	li	a2,1
    10d6:	4505                	li	a0,1
{
    10d8:	ec06                	sd	ra,24(sp)
    char byte = c;
    10da:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    10de:	523000ef          	jal	ra,1e00 <write>
}
    10e2:	60e2                	ld	ra,24(sp)
    10e4:	2501                	sext.w	a0,a0
    10e6:	6105                	addi	sp,sp,32
    10e8:	8082                	ret

00000000000010ea <puts>:

int puts(const char *s)
{
    10ea:	1101                	addi	sp,sp,-32
    10ec:	e822                	sd	s0,16(sp)
    10ee:	ec06                	sd	ra,24(sp)
    10f0:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    10f2:	145000ef          	jal	ra,1a36 <strlen>
    10f6:	862a                	mv	a2,a0
    10f8:	85a2                	mv	a1,s0
    10fa:	4505                	li	a0,1
    10fc:	505000ef          	jal	ra,1e00 <write>
    1100:	00055763          	bgez	a0,110e <puts+0x24>
    return r;
}
    1104:	60e2                	ld	ra,24(sp)
    1106:	6442                	ld	s0,16(sp)
    1108:	557d                	li	a0,-1
    110a:	6105                	addi	sp,sp,32
    110c:	8082                	ret
    return write(stdout, &byte, 1);
    110e:	00f10593          	addi	a1,sp,15
    char byte = c;
    1112:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    1114:	4605                	li	a2,1
    1116:	4505                	li	a0,1
    char byte = c;
    1118:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    111c:	4e5000ef          	jal	ra,1e00 <write>
}
    1120:	60e2                	ld	ra,24(sp)
    1122:	6442                	ld	s0,16(sp)
    1124:	41f5551b          	sraiw	a0,a0,0x1f
    1128:	6105                	addi	sp,sp,32
    112a:	8082                	ret

000000000000112c <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    112c:	7131                	addi	sp,sp,-192
    112e:	ecce                	sd	s3,88(sp)
    1130:	e8d2                	sd	s4,80(sp)
    1132:	e4d6                	sd	s5,72(sp)
    1134:	e0da                	sd	s6,64(sp)
    1136:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    1138:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    113a:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    113c:	6ae1                	lui	s5,0x18
    113e:	000f4a37          	lui	s4,0xf4
    1142:	00989b37          	lui	s6,0x989
{
    1146:	fc86                	sd	ra,120(sp)
    1148:	f8a2                	sd	s0,112(sp)
    114a:	f4a6                	sd	s1,104(sp)
    114c:	f0ca                	sd	s2,96(sp)
    114e:	fc5e                	sd	s7,56(sp)
    1150:	e52e                	sd	a1,136(sp)
    1152:	e932                	sd	a2,144(sp)
    1154:	ed36                	sd	a3,152(sp)
    1156:	f13a                	sd	a4,160(sp)
    1158:	f942                	sd	a6,176(sp)
    115a:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    115c:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    115e:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x717>
    1162:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x166a7>
    1166:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf2247>
    116a:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x987687>
    for (;;)
    {
        if (!*s)
    116e:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    1172:	02500913          	li	s2,37
        if (!*s)
    1176:	1a078f63          	beqz	a5,1334 <printf+0x208>
    117a:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    117c:	17278e63          	beq	a5,s2,12f8 <printf+0x1cc>
    1180:	00164783          	lbu	a5,1(a2)
    1184:	0605                	addi	a2,a2,1
    1186:	fbfd                	bnez	a5,117c <printf+0x50>
    1188:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    118a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    118e:	85aa                	mv	a1,a0
    1190:	8622                	mv	a2,s0
    1192:	4505                	li	a0,1
    1194:	46d000ef          	jal	ra,1e00 <write>
        out(f, a, l);
        if (l)
    1198:	18041963          	bnez	s0,132a <printf+0x1fe>
            continue;
        if (s[1] == 0)
    119c:	0014c783          	lbu	a5,1(s1)
    11a0:	18078a63          	beqz	a5,1334 <printf+0x208>
            break;
        switch (s[1])
    11a4:	07300713          	li	a4,115
    11a8:	28e78e63          	beq	a5,a4,1444 <printf+0x318>
    11ac:	18f76f63          	bltu	a4,a5,134a <printf+0x21e>
    11b0:	06400713          	li	a4,100
    11b4:	2ae78c63          	beq	a5,a4,146c <printf+0x340>
    11b8:	07000713          	li	a4,112
    11bc:	3ce79c63          	bne	a5,a4,1594 <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    11c0:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    11c2:	00001797          	auipc	a5,0x1
    11c6:	e3678793          	addi	a5,a5,-458 # 1ff8 <digits>
            printptr(va_arg(ap, uint64));
    11ca:	6298                	ld	a4,0(a3)
    11cc:	00868093          	addi	ra,a3,8
    11d0:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    11d2:	00471293          	slli	t0,a4,0x4
    11d6:	00c71f13          	slli	t5,a4,0xc
    11da:	01471e13          	slli	t3,a4,0x14
    11de:	01c71893          	slli	a7,a4,0x1c
    11e2:	02471813          	slli	a6,a4,0x24
    11e6:	02871513          	slli	a0,a4,0x28
    11ea:	02c71593          	slli	a1,a4,0x2c
    11ee:	03071693          	slli	a3,a4,0x30
    11f2:	00871f93          	slli	t6,a4,0x8
    11f6:	01071e93          	slli	t4,a4,0x10
    11fa:	01871313          	slli	t1,a4,0x18
    11fe:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1202:	03c2d293          	srli	t0,t0,0x3c
    1206:	03cf5f13          	srli	t5,t5,0x3c
    120a:	03ce5e13          	srli	t3,t3,0x3c
    120e:	03c8d893          	srli	a7,a7,0x3c
    1212:	03c85813          	srli	a6,a6,0x3c
    1216:	9171                	srli	a0,a0,0x3c
    1218:	91f1                	srli	a1,a1,0x3c
    121a:	92f1                	srli	a3,a3,0x3c
    121c:	92be                	add	t0,t0,a5
    121e:	9f3e                	add	t5,t5,a5
    1220:	9e3e                	add	t3,t3,a5
    1222:	98be                	add	a7,a7,a5
    1224:	983e                	add	a6,a6,a5
    1226:	953e                	add	a0,a0,a5
    1228:	95be                	add	a1,a1,a5
    122a:	96be                	add	a3,a3,a5
    122c:	03c75393          	srli	t2,a4,0x3c
    1230:	01c75b9b          	srliw	s7,a4,0x1c
    1234:	03cfdf93          	srli	t6,t6,0x3c
    1238:	03cede93          	srli	t4,t4,0x3c
    123c:	03c35313          	srli	t1,t1,0x3c
    1240:	9271                	srli	a2,a2,0x3c
    1242:	0002c403          	lbu	s0,0(t0)
    1246:	93be                	add	t2,t2,a5
    1248:	000f4283          	lbu	t0,0(t5)
    124c:	9fbe                	add	t6,t6,a5
    124e:	000e4f03          	lbu	t5,0(t3)
    1252:	9ebe                	add	t4,t4,a5
    1254:	0008ce03          	lbu	t3,0(a7)
    1258:	933e                	add	t1,t1,a5
    125a:	00084883          	lbu	a7,0(a6)
    125e:	9bbe                	add	s7,s7,a5
    1260:	00054803          	lbu	a6,0(a0)
    1264:	963e                	add	a2,a2,a5
    1266:	0005c503          	lbu	a0,0(a1) # 1000 <_start>
    126a:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    126e:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1272:	0003c903          	lbu	s2,0(t2)
    1276:	00064603          	lbu	a2,0(a2)
    127a:	000fc383          	lbu	t2,0(t6)
    127e:	8b3d                	andi	a4,a4,15
    1280:	000ecf83          	lbu	t6,0(t4)
    1284:	92f1                	srli	a3,a3,0x3c
    1286:	00034e83          	lbu	t4,0(t1)
    128a:	000bc303          	lbu	t1,0(s7)
    128e:	96be                	add	a3,a3,a5
    1290:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    1292:	7761                	lui	a4,0xffff8
    1294:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1298:	00710623          	sb	t2,12(sp)
    129c:	005106a3          	sb	t0,13(sp)
    12a0:	01f10723          	sb	t6,14(sp)
    12a4:	01e107a3          	sb	t5,15(sp)
    12a8:	01d10823          	sb	t4,16(sp)
    12ac:	01c108a3          	sb	t3,17(sp)
    12b0:	00610923          	sb	t1,18(sp)
    12b4:	011109a3          	sb	a7,19(sp)
    12b8:	01010a23          	sb	a6,20(sp)
    12bc:	00a10aa3          	sb	a0,21(sp)
    12c0:	00b10b23          	sb	a1,22(sp)
    12c4:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    12c8:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12cc:	01210523          	sb	s2,10(sp)
    12d0:	008105a3          	sb	s0,11(sp)
    12d4:	0006c703          	lbu	a4,0(a3)
    12d8:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    12dc:	4649                	li	a2,18
    12de:	002c                	addi	a1,sp,8
    12e0:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12e2:	00e10c23          	sb	a4,24(sp)
    12e6:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    12ea:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    12ee:	313000ef          	jal	ra,1e00 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    12f2:	00248513          	addi	a0,s1,2
    12f6:	bda5                	j	116e <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    12f8:	00064783          	lbu	a5,0(a2)
    12fc:	84b2                	mv	s1,a2
    12fe:	01278963          	beq	a5,s2,1310 <printf+0x1e4>
    1302:	b561                	j	118a <printf+0x5e>
    1304:	0024c783          	lbu	a5,2(s1)
    1308:	0605                	addi	a2,a2,1
    130a:	0489                	addi	s1,s1,2
    130c:	e7279fe3          	bne	a5,s2,118a <printf+0x5e>
    1310:	0014c783          	lbu	a5,1(s1)
    1314:	ff2788e3          	beq	a5,s2,1304 <printf+0x1d8>
        l = z - a;
    1318:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    131c:	85aa                	mv	a1,a0
    131e:	8622                	mv	a2,s0
    1320:	4505                	li	a0,1
    1322:	2df000ef          	jal	ra,1e00 <write>
        if (l)
    1326:	e6040be3          	beqz	s0,119c <printf+0x70>
    132a:	8526                	mv	a0,s1
        if (!*s)
    132c:	00054783          	lbu	a5,0(a0)
    1330:	e40795e3          	bnez	a5,117a <printf+0x4e>
    }
    va_end(ap);
    1334:	70e6                	ld	ra,120(sp)
    1336:	7446                	ld	s0,112(sp)
    1338:	74a6                	ld	s1,104(sp)
    133a:	7906                	ld	s2,96(sp)
    133c:	69e6                	ld	s3,88(sp)
    133e:	6a46                	ld	s4,80(sp)
    1340:	6aa6                	ld	s5,72(sp)
    1342:	6b06                	ld	s6,64(sp)
    1344:	7be2                	ld	s7,56(sp)
    1346:	6129                	addi	sp,sp,192
    1348:	8082                	ret
        switch (s[1])
    134a:	07800713          	li	a4,120
    134e:	24e79363          	bne	a5,a4,1594 <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    1352:	6782                	ld	a5,0(sp)
    1354:	4394                	lw	a3,0(a5)
    1356:	07a1                	addi	a5,a5,8
    1358:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    135a:	2606c263          	bltz	a3,15be <printf+0x492>
        buf[i--] = digits[x % base];
    135e:	00001797          	auipc	a5,0x1
    1362:	c9a78793          	addi	a5,a5,-870 # 1ff8 <digits>
    1366:	00f6f713          	andi	a4,a3,15
    136a:	973e                	add	a4,a4,a5
    136c:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff6008>
    buf[16] = 0;
    1370:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1374:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    1376:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    137a:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    137e:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    1382:	0046d51b          	srliw	a0,a3,0x4
    1386:	0ad5d563          	bge	a1,a3,1430 <printf+0x304>
        buf[i--] = digits[x % base];
    138a:	8a3d                	andi	a2,a2,15
    138c:	963e                	add	a2,a2,a5
    138e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1392:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    1396:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    139a:	30a5fe63          	bgeu	a1,a0,16b6 <printf+0x58a>
        buf[i--] = digits[x % base];
    139e:	00f77613          	andi	a2,a4,15
    13a2:	963e                	add	a2,a2,a5
    13a4:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13a8:	45bd                	li	a1,15
    13aa:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    13ae:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    13b2:	00475513          	srli	a0,a4,0x4
    13b6:	30e5f963          	bgeu	a1,a4,16c8 <printf+0x59c>
        buf[i--] = digits[x % base];
    13ba:	8a3d                	andi	a2,a2,15
    13bc:	963e                	add	a2,a2,a5
    13be:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    13c2:	00875893          	srli	a7,a4,0x8
    13c6:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    13ca:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    13ce:	30a5fd63          	bgeu	a1,a0,16e8 <printf+0x5bc>
        buf[i--] = digits[x % base];
    13d2:	8a3d                	andi	a2,a2,15
    13d4:	963e                	add	a2,a2,a5
    13d6:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13da:	00c75813          	srli	a6,a4,0xc
    13de:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    13e2:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    13e6:	3315fe63          	bgeu	a1,a7,1722 <printf+0x5f6>
        buf[i--] = digits[x % base];
    13ea:	8a3d                	andi	a2,a2,15
    13ec:	963e                	add	a2,a2,a5
    13ee:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13f2:	01075893          	srli	a7,a4,0x10
    13f6:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    13fa:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    13fe:	3305ff63          	bgeu	a1,a6,173c <printf+0x610>
        buf[i--] = digits[x % base];
    1402:	8a3d                	andi	a2,a2,15
    1404:	963e                	add	a2,a2,a5
    1406:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    140a:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    140e:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1412:	3515f863          	bgeu	a1,a7,1762 <printf+0x636>
        buf[i--] = digits[x % base];
    1416:	97ba                	add	a5,a5,a4
    1418:	0007c783          	lbu	a5,0(a5)
    141c:	45a1                	li	a1,8
    141e:	00f10823          	sb	a5,16(sp)
    if (sign)
    1422:	0006d763          	bgez	a3,1430 <printf+0x304>
        buf[i--] = '-';
    1426:	02d00793          	li	a5,45
    142a:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    142e:	459d                	li	a1,7
    write(f, s, l);
    1430:	4641                	li	a2,16
    1432:	003c                	addi	a5,sp,8
    1434:	9e0d                	subw	a2,a2,a1
    1436:	4505                	li	a0,1
    1438:	95be                	add	a1,a1,a5
    143a:	1c7000ef          	jal	ra,1e00 <write>
        s += 2;
    143e:	00248513          	addi	a0,s1,2
    1442:	b335                	j	116e <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    1444:	6782                	ld	a5,0(sp)
    1446:	6380                	ld	s0,0(a5)
    1448:	07a1                	addi	a5,a5,8
    144a:	e03e                	sd	a5,0(sp)
    144c:	22040a63          	beqz	s0,1680 <printf+0x554>
            l = strnlen(a, 200);
    1450:	0c800593          	li	a1,200
    1454:	8522                	mv	a0,s0
    1456:	6cc000ef          	jal	ra,1b22 <strnlen>
    write(f, s, l);
    145a:	0005061b          	sext.w	a2,a0
    145e:	85a2                	mv	a1,s0
    1460:	4505                	li	a0,1
    1462:	19f000ef          	jal	ra,1e00 <write>
        s += 2;
    1466:	00248513          	addi	a0,s1,2
    146a:	b311                	j	116e <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    146c:	6782                	ld	a5,0(sp)
    146e:	4390                	lw	a2,0(a5)
    1470:	07a1                	addi	a5,a5,8
    1472:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1474:	1a064363          	bltz	a2,161a <printf+0x4ee>
        buf[i--] = digits[x % base];
    1478:	46a9                	li	a3,10
    147a:	02d6773b          	remuw	a4,a2,a3
    147e:	00001797          	auipc	a5,0x1
    1482:	b7a78793          	addi	a5,a5,-1158 # 1ff8 <digits>
    buf[16] = 0;
    1486:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    148a:	4525                	li	a0,9
        x = xx;
    148c:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    1490:	973e                	add	a4,a4,a5
    1492:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    1496:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    149a:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    149e:	2cc55063          	bge	a0,a2,175e <printf+0x632>
    14a2:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    14a6:	02d5f73b          	remuw	a4,a1,a3
    14aa:	1702                	slli	a4,a4,0x20
    14ac:	9301                	srli	a4,a4,0x20
    14ae:	973e                	add	a4,a4,a5
    14b0:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    14b4:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    14b8:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    14bc:	1f057d63          	bgeu	a0,a6,16b6 <printf+0x58a>
        buf[i--] = digits[x % base];
    14c0:	4529                	li	a0,10
    } while ((x /= base) != 0);
    14c2:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    14c4:	02a5f73b          	remuw	a4,a1,a0
    14c8:	973e                	add	a4,a4,a5
    14ca:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    14ce:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    14d2:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    14d6:	1ab6f163          	bgeu	a3,a1,1678 <printf+0x54c>
    14da:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    14de:	02a776bb          	remuw	a3,a4,a0
    14e2:	96be                	add	a3,a3,a5
    14e4:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14e8:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14ec:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    14f0:	20b87c63          	bgeu	a6,a1,1708 <printf+0x5dc>
    14f4:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    14f8:	02a776bb          	remuw	a3,a4,a0
    14fc:	96be                	add	a3,a3,a5
    14fe:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1502:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1506:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    150a:	20b87363          	bgeu	a6,a1,1710 <printf+0x5e4>
        buf[i--] = digits[x % base];
    150e:	02a776bb          	remuw	a3,a4,a0
    1512:	96be                	add	a3,a3,a5
    1514:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1518:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    151c:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1520:	20b9f563          	bgeu	s3,a1,172a <printf+0x5fe>
        buf[i--] = digits[x % base];
    1524:	02a776bb          	remuw	a3,a4,a0
    1528:	96be                	add	a3,a3,a5
    152a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    152e:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1532:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1536:	20bafb63          	bgeu	s5,a1,174c <printf+0x620>
        buf[i--] = digits[x % base];
    153a:	02a776bb          	remuw	a3,a4,a0
    153e:	96be                	add	a3,a3,a5
    1540:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1544:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1548:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    154c:	1eba7c63          	bgeu	s4,a1,1744 <printf+0x618>
        buf[i--] = digits[x % base];
    1550:	02a776bb          	remuw	a3,a4,a0
    1554:	96be                	add	a3,a3,a5
    1556:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    155a:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    155e:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1562:	14bb7163          	bgeu	s6,a1,16a4 <printf+0x578>
        buf[i--] = digits[x % base];
    1566:	1702                	slli	a4,a4,0x20
    1568:	9301                	srli	a4,a4,0x20
    156a:	97ba                	add	a5,a5,a4
    156c:	0007c783          	lbu	a5,0(a5)
    1570:	4599                	li	a1,6
    1572:	00f10723          	sb	a5,14(sp)
    if (sign)
    1576:	ea065de3          	bgez	a2,1430 <printf+0x304>
        buf[i--] = '-';
    157a:	02d00793          	li	a5,45
    157e:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1582:	4595                	li	a1,5
    write(f, s, l);
    1584:	003c                	addi	a5,sp,8
    1586:	4641                	li	a2,16
    1588:	9e0d                	subw	a2,a2,a1
    158a:	4505                	li	a0,1
    158c:	95be                	add	a1,a1,a5
    158e:	073000ef          	jal	ra,1e00 <write>
    1592:	b575                	j	143e <printf+0x312>
    char byte = c;
    1594:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1598:	4605                	li	a2,1
    159a:	002c                	addi	a1,sp,8
    159c:	4505                	li	a0,1
    char byte = c;
    159e:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15a2:	05f000ef          	jal	ra,1e00 <write>
    char byte = c;
    15a6:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15aa:	4605                	li	a2,1
    15ac:	002c                	addi	a1,sp,8
    15ae:	4505                	li	a0,1
    char byte = c;
    15b0:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15b4:	04d000ef          	jal	ra,1e00 <write>
        s += 2;
    15b8:	00248513          	addi	a0,s1,2
    15bc:	be4d                	j	116e <printf+0x42>
        x = -xx;
    15be:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    15c2:	00001797          	auipc	a5,0x1
    15c6:	a3678793          	addi	a5,a5,-1482 # 1ff8 <digits>
    15ca:	00f77613          	andi	a2,a4,15
    15ce:	963e                	add	a2,a2,a5
    15d0:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    15d4:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    15d8:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    15da:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    15de:	0047551b          	srliw	a0,a4,0x4
    15e2:	0047561b          	srliw	a2,a4,0x4
    15e6:	0ab6d263          	bge	a3,a1,168a <printf+0x55e>
        buf[i--] = digits[x % base];
    15ea:	8a3d                	andi	a2,a2,15
    15ec:	963e                	add	a2,a2,a5
    15ee:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    15f2:	463d                	li	a2,15
    15f4:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    15f8:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    15fc:	daa661e3          	bltu	a2,a0,139e <printf+0x272>
        buf[i--] = '-';
    1600:	02d00793          	li	a5,45
    1604:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1608:	45b5                	li	a1,13
    write(f, s, l);
    160a:	003c                	addi	a5,sp,8
    160c:	4641                	li	a2,16
    160e:	9e0d                	subw	a2,a2,a1
    1610:	4505                	li	a0,1
    1612:	95be                	add	a1,a1,a5
    1614:	7ec000ef          	jal	ra,1e00 <write>
    1618:	b51d                	j	143e <printf+0x312>
        x = -xx;
    161a:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    161e:	46a9                	li	a3,10
    1620:	02d875bb          	remuw	a1,a6,a3
    1624:	00001797          	auipc	a5,0x1
    1628:	9d478793          	addi	a5,a5,-1580 # 1ff8 <digits>
    buf[16] = 0;
    162c:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1630:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    1632:	95be                	add	a1,a1,a5
    1634:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    1638:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    163c:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    1640:	04a65563          	bge	a2,a0,168a <printf+0x55e>
    1644:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1648:	02d775bb          	remuw	a1,a4,a3
    164c:	95be                	add	a1,a1,a5
    164e:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    1652:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    1656:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    165a:	fb0573e3          	bgeu	a0,a6,1600 <printf+0x4d4>
        buf[i--] = digits[x % base];
    165e:	4529                	li	a0,10
    } while ((x /= base) != 0);
    1660:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1662:	02a5f73b          	remuw	a4,a1,a0
    1666:	973e                	add	a4,a4,a5
    1668:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    166c:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    1670:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    1674:	e6b6e3e3          	bltu	a3,a1,14da <printf+0x3ae>
        buf[i--] = digits[x % base];
    1678:	45b5                	li	a1,13
    if (sign)
    167a:	da065be3          	bgez	a2,1430 <printf+0x304>
    167e:	a881                	j	16ce <printf+0x5a2>
                a = "(null)";
    1680:	00001417          	auipc	s0,0x1
    1684:	95840413          	addi	s0,s0,-1704 # 1fd8 <unlink+0x32>
    1688:	b3e1                	j	1450 <printf+0x324>
        buf[i--] = '-';
    168a:	02d00793          	li	a5,45
    168e:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1692:	45b9                	li	a1,14
    write(f, s, l);
    1694:	003c                	addi	a5,sp,8
    1696:	4641                	li	a2,16
    1698:	9e0d                	subw	a2,a2,a1
    169a:	4505                	li	a0,1
    169c:	95be                	add	a1,a1,a5
    169e:	762000ef          	jal	ra,1e00 <write>
    16a2:	bb71                	j	143e <printf+0x312>
        buf[i--] = digits[x % base];
    16a4:	459d                	li	a1,7
    if (sign)
    16a6:	d80655e3          	bgez	a2,1430 <printf+0x304>
        buf[i--] = '-';
    16aa:	02d00793          	li	a5,45
    16ae:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    16b2:	4599                	li	a1,6
    16b4:	bbb5                	j	1430 <printf+0x304>
    16b6:	45b9                	li	a1,14
    write(f, s, l);
    16b8:	003c                	addi	a5,sp,8
    16ba:	4641                	li	a2,16
    16bc:	9e0d                	subw	a2,a2,a1
    16be:	4505                	li	a0,1
    16c0:	95be                	add	a1,a1,a5
    16c2:	73e000ef          	jal	ra,1e00 <write>
    16c6:	bba5                	j	143e <printf+0x312>
        buf[i--] = digits[x % base];
    16c8:	45b5                	li	a1,13
    if (sign)
    16ca:	d606d3e3          	bgez	a3,1430 <printf+0x304>
        buf[i--] = '-';
    16ce:	02d00793          	li	a5,45
    16d2:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    16d6:	45b1                	li	a1,12
    write(f, s, l);
    16d8:	003c                	addi	a5,sp,8
    16da:	4641                	li	a2,16
    16dc:	9e0d                	subw	a2,a2,a1
    16de:	4505                	li	a0,1
    16e0:	95be                	add	a1,a1,a5
    16e2:	71e000ef          	jal	ra,1e00 <write>
    16e6:	bba1                	j	143e <printf+0x312>
        buf[i--] = digits[x % base];
    16e8:	45b1                	li	a1,12
    if (sign)
    16ea:	d406d3e3          	bgez	a3,1430 <printf+0x304>
        buf[i--] = '-';
    16ee:	02d00793          	li	a5,45
    16f2:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    16f6:	45ad                	li	a1,11
    write(f, s, l);
    16f8:	003c                	addi	a5,sp,8
    16fa:	4641                	li	a2,16
    16fc:	9e0d                	subw	a2,a2,a1
    16fe:	4505                	li	a0,1
    1700:	95be                	add	a1,a1,a5
    1702:	6fe000ef          	jal	ra,1e00 <write>
    1706:	bb25                	j	143e <printf+0x312>
        buf[i--] = digits[x % base];
    1708:	45b1                	li	a1,12
    if (sign)
    170a:	d20653e3          	bgez	a2,1430 <printf+0x304>
    170e:	b7c5                	j	16ee <printf+0x5c2>
        buf[i--] = digits[x % base];
    1710:	45ad                	li	a1,11
    if (sign)
    1712:	d0065fe3          	bgez	a2,1430 <printf+0x304>
        buf[i--] = '-';
    1716:	02d00793          	li	a5,45
    171a:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    171e:	45a9                	li	a1,10
    1720:	bb01                	j	1430 <printf+0x304>
    1722:	45ad                	li	a1,11
    if (sign)
    1724:	d006d6e3          	bgez	a3,1430 <printf+0x304>
    1728:	b7fd                	j	1716 <printf+0x5ea>
        buf[i--] = digits[x % base];
    172a:	45a9                	li	a1,10
    if (sign)
    172c:	d00652e3          	bgez	a2,1430 <printf+0x304>
        buf[i--] = '-';
    1730:	02d00793          	li	a5,45
    1734:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1738:	45a5                	li	a1,9
    173a:	b9dd                	j	1430 <printf+0x304>
    173c:	45a9                	li	a1,10
    if (sign)
    173e:	ce06d9e3          	bgez	a3,1430 <printf+0x304>
    1742:	b7fd                	j	1730 <printf+0x604>
        buf[i--] = digits[x % base];
    1744:	45a1                	li	a1,8
    if (sign)
    1746:	ce0655e3          	bgez	a2,1430 <printf+0x304>
    174a:	b9f1                	j	1426 <printf+0x2fa>
        buf[i--] = digits[x % base];
    174c:	45a5                	li	a1,9
    if (sign)
    174e:	ce0651e3          	bgez	a2,1430 <printf+0x304>
        buf[i--] = '-';
    1752:	02d00793          	li	a5,45
    1756:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    175a:	45a1                	li	a1,8
    175c:	b9d1                	j	1430 <printf+0x304>
    i = 15;
    175e:	45bd                	li	a1,15
    1760:	b9c1                	j	1430 <printf+0x304>
        buf[i--] = digits[x % base];
    1762:	45a5                	li	a1,9
    if (sign)
    1764:	cc06d6e3          	bgez	a3,1430 <printf+0x304>
    1768:	b7ed                	j	1752 <printf+0x626>

000000000000176a <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    176a:	02000793          	li	a5,32
    176e:	00f50663          	beq	a0,a5,177a <isspace+0x10>
    1772:	355d                	addiw	a0,a0,-9
    1774:	00553513          	sltiu	a0,a0,5
    1778:	8082                	ret
    177a:	4505                	li	a0,1
}
    177c:	8082                	ret

000000000000177e <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    177e:	fd05051b          	addiw	a0,a0,-48
}
    1782:	00a53513          	sltiu	a0,a0,10
    1786:	8082                	ret

0000000000001788 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1788:	02000613          	li	a2,32
    178c:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    178e:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1792:	ff77069b          	addiw	a3,a4,-9
    1796:	04c70d63          	beq	a4,a2,17f0 <atoi+0x68>
    179a:	0007079b          	sext.w	a5,a4
    179e:	04d5f963          	bgeu	a1,a3,17f0 <atoi+0x68>
        s++;
    switch (*s)
    17a2:	02b00693          	li	a3,43
    17a6:	04d70a63          	beq	a4,a3,17fa <atoi+0x72>
    17aa:	02d00693          	li	a3,45
    17ae:	06d70463          	beq	a4,a3,1816 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    17b2:	fd07859b          	addiw	a1,a5,-48
    17b6:	4625                	li	a2,9
    17b8:	873e                	mv	a4,a5
    17ba:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    17bc:	4e01                	li	t3,0
    while (isdigit(*s))
    17be:	04b66a63          	bltu	a2,a1,1812 <atoi+0x8a>
    int n = 0, neg = 0;
    17c2:	4501                	li	a0,0
    while (isdigit(*s))
    17c4:	4825                	li	a6,9
    17c6:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    17ca:	0025179b          	slliw	a5,a0,0x2
    17ce:	9d3d                	addw	a0,a0,a5
    17d0:	fd07031b          	addiw	t1,a4,-48
    17d4:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    17d8:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    17dc:	0685                	addi	a3,a3,1
    17de:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    17e2:	0006071b          	sext.w	a4,a2
    17e6:	feb870e3          	bgeu	a6,a1,17c6 <atoi+0x3e>
    return neg ? n : -n;
    17ea:	000e0563          	beqz	t3,17f4 <atoi+0x6c>
}
    17ee:	8082                	ret
        s++;
    17f0:	0505                	addi	a0,a0,1
    17f2:	bf71                	j	178e <atoi+0x6>
    17f4:	4113053b          	subw	a0,t1,a7
    17f8:	8082                	ret
    while (isdigit(*s))
    17fa:	00154783          	lbu	a5,1(a0)
    17fe:	4625                	li	a2,9
        s++;
    1800:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1804:	fd07859b          	addiw	a1,a5,-48
    1808:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    180c:	4e01                	li	t3,0
    while (isdigit(*s))
    180e:	fab67ae3          	bgeu	a2,a1,17c2 <atoi+0x3a>
    1812:	4501                	li	a0,0
}
    1814:	8082                	ret
    while (isdigit(*s))
    1816:	00154783          	lbu	a5,1(a0)
    181a:	4625                	li	a2,9
        s++;
    181c:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1820:	fd07859b          	addiw	a1,a5,-48
    1824:	0007871b          	sext.w	a4,a5
    1828:	feb665e3          	bltu	a2,a1,1812 <atoi+0x8a>
        neg = 1;
    182c:	4e05                	li	t3,1
    182e:	bf51                	j	17c2 <atoi+0x3a>

0000000000001830 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1830:	16060d63          	beqz	a2,19aa <memset+0x17a>
    1834:	40a007b3          	neg	a5,a0
    1838:	8b9d                	andi	a5,a5,7
    183a:	00778713          	addi	a4,a5,7
    183e:	482d                	li	a6,11
    1840:	0ff5f593          	andi	a1,a1,255
    1844:	fff60693          	addi	a3,a2,-1
    1848:	17076263          	bltu	a4,a6,19ac <memset+0x17c>
    184c:	16e6ea63          	bltu	a3,a4,19c0 <memset+0x190>
    1850:	16078563          	beqz	a5,19ba <memset+0x18a>
    1854:	00b50023          	sb	a1,0(a0)
    1858:	4705                	li	a4,1
    185a:	00150e93          	addi	t4,a0,1
    185e:	14e78c63          	beq	a5,a4,19b6 <memset+0x186>
    1862:	00b500a3          	sb	a1,1(a0)
    1866:	4709                	li	a4,2
    1868:	00250e93          	addi	t4,a0,2
    186c:	14e78d63          	beq	a5,a4,19c6 <memset+0x196>
    1870:	00b50123          	sb	a1,2(a0)
    1874:	470d                	li	a4,3
    1876:	00350e93          	addi	t4,a0,3
    187a:	12e78b63          	beq	a5,a4,19b0 <memset+0x180>
    187e:	00b501a3          	sb	a1,3(a0)
    1882:	4711                	li	a4,4
    1884:	00450e93          	addi	t4,a0,4
    1888:	14e78163          	beq	a5,a4,19ca <memset+0x19a>
    188c:	00b50223          	sb	a1,4(a0)
    1890:	4715                	li	a4,5
    1892:	00550e93          	addi	t4,a0,5
    1896:	12e78c63          	beq	a5,a4,19ce <memset+0x19e>
    189a:	00b502a3          	sb	a1,5(a0)
    189e:	471d                	li	a4,7
    18a0:	00650e93          	addi	t4,a0,6
    18a4:	12e79763          	bne	a5,a4,19d2 <memset+0x1a2>
    18a8:	00750e93          	addi	t4,a0,7
    18ac:	00b50323          	sb	a1,6(a0)
    18b0:	4f1d                	li	t5,7
    18b2:	00859713          	slli	a4,a1,0x8
    18b6:	8f4d                	or	a4,a4,a1
    18b8:	01059e13          	slli	t3,a1,0x10
    18bc:	01c76e33          	or	t3,a4,t3
    18c0:	01859313          	slli	t1,a1,0x18
    18c4:	006e6333          	or	t1,t3,t1
    18c8:	02059893          	slli	a7,a1,0x20
    18cc:	011368b3          	or	a7,t1,a7
    18d0:	02859813          	slli	a6,a1,0x28
    18d4:	40f60333          	sub	t1,a2,a5
    18d8:	0108e833          	or	a6,a7,a6
    18dc:	03059693          	slli	a3,a1,0x30
    18e0:	00d866b3          	or	a3,a6,a3
    18e4:	03859713          	slli	a4,a1,0x38
    18e8:	97aa                	add	a5,a5,a0
    18ea:	ff837813          	andi	a6,t1,-8
    18ee:	8f55                	or	a4,a4,a3
    18f0:	00f806b3          	add	a3,a6,a5
    18f4:	e398                	sd	a4,0(a5)
    18f6:	07a1                	addi	a5,a5,8
    18f8:	fed79ee3          	bne	a5,a3,18f4 <memset+0xc4>
    18fc:	ff837693          	andi	a3,t1,-8
    1900:	00de87b3          	add	a5,t4,a3
    1904:	01e6873b          	addw	a4,a3,t5
    1908:	0ad30663          	beq	t1,a3,19b4 <memset+0x184>
    190c:	00b78023          	sb	a1,0(a5)
    1910:	0017069b          	addiw	a3,a4,1
    1914:	08c6fb63          	bgeu	a3,a2,19aa <memset+0x17a>
    1918:	00b780a3          	sb	a1,1(a5)
    191c:	0027069b          	addiw	a3,a4,2
    1920:	08c6f563          	bgeu	a3,a2,19aa <memset+0x17a>
    1924:	00b78123          	sb	a1,2(a5)
    1928:	0037069b          	addiw	a3,a4,3
    192c:	06c6ff63          	bgeu	a3,a2,19aa <memset+0x17a>
    1930:	00b781a3          	sb	a1,3(a5)
    1934:	0047069b          	addiw	a3,a4,4
    1938:	06c6f963          	bgeu	a3,a2,19aa <memset+0x17a>
    193c:	00b78223          	sb	a1,4(a5)
    1940:	0057069b          	addiw	a3,a4,5
    1944:	06c6f363          	bgeu	a3,a2,19aa <memset+0x17a>
    1948:	00b782a3          	sb	a1,5(a5)
    194c:	0067069b          	addiw	a3,a4,6
    1950:	04c6fd63          	bgeu	a3,a2,19aa <memset+0x17a>
    1954:	00b78323          	sb	a1,6(a5)
    1958:	0077069b          	addiw	a3,a4,7
    195c:	04c6f763          	bgeu	a3,a2,19aa <memset+0x17a>
    1960:	00b783a3          	sb	a1,7(a5)
    1964:	0087069b          	addiw	a3,a4,8
    1968:	04c6f163          	bgeu	a3,a2,19aa <memset+0x17a>
    196c:	00b78423          	sb	a1,8(a5)
    1970:	0097069b          	addiw	a3,a4,9
    1974:	02c6fb63          	bgeu	a3,a2,19aa <memset+0x17a>
    1978:	00b784a3          	sb	a1,9(a5)
    197c:	00a7069b          	addiw	a3,a4,10
    1980:	02c6f563          	bgeu	a3,a2,19aa <memset+0x17a>
    1984:	00b78523          	sb	a1,10(a5)
    1988:	00b7069b          	addiw	a3,a4,11
    198c:	00c6ff63          	bgeu	a3,a2,19aa <memset+0x17a>
    1990:	00b785a3          	sb	a1,11(a5)
    1994:	00c7069b          	addiw	a3,a4,12
    1998:	00c6f963          	bgeu	a3,a2,19aa <memset+0x17a>
    199c:	00b78623          	sb	a1,12(a5)
    19a0:	2735                	addiw	a4,a4,13
    19a2:	00c77463          	bgeu	a4,a2,19aa <memset+0x17a>
    19a6:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    19aa:	8082                	ret
    19ac:	472d                	li	a4,11
    19ae:	bd79                	j	184c <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    19b0:	4f0d                	li	t5,3
    19b2:	b701                	j	18b2 <memset+0x82>
    19b4:	8082                	ret
    19b6:	4f05                	li	t5,1
    19b8:	bded                	j	18b2 <memset+0x82>
    19ba:	8eaa                	mv	t4,a0
    19bc:	4f01                	li	t5,0
    19be:	bdd5                	j	18b2 <memset+0x82>
    19c0:	87aa                	mv	a5,a0
    19c2:	4701                	li	a4,0
    19c4:	b7a1                	j	190c <memset+0xdc>
    19c6:	4f09                	li	t5,2
    19c8:	b5ed                	j	18b2 <memset+0x82>
    19ca:	4f11                	li	t5,4
    19cc:	b5dd                	j	18b2 <memset+0x82>
    19ce:	4f15                	li	t5,5
    19d0:	b5cd                	j	18b2 <memset+0x82>
    19d2:	4f19                	li	t5,6
    19d4:	bdf9                	j	18b2 <memset+0x82>

00000000000019d6 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    19d6:	00054783          	lbu	a5,0(a0)
    19da:	0005c703          	lbu	a4,0(a1)
    19de:	00e79863          	bne	a5,a4,19ee <strcmp+0x18>
    19e2:	0505                	addi	a0,a0,1
    19e4:	0585                	addi	a1,a1,1
    19e6:	fbe5                	bnez	a5,19d6 <strcmp>
    19e8:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    19ea:	9d19                	subw	a0,a0,a4
    19ec:	8082                	ret
    19ee:	0007851b          	sext.w	a0,a5
    19f2:	bfe5                	j	19ea <strcmp+0x14>

00000000000019f4 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    19f4:	ce05                	beqz	a2,1a2c <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19f6:	00054703          	lbu	a4,0(a0)
    19fa:	0005c783          	lbu	a5,0(a1)
    19fe:	cb0d                	beqz	a4,1a30 <strncmp+0x3c>
    if (!n--)
    1a00:	167d                	addi	a2,a2,-1
    1a02:	00c506b3          	add	a3,a0,a2
    1a06:	a819                	j	1a1c <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1a08:	00a68e63          	beq	a3,a0,1a24 <strncmp+0x30>
    1a0c:	0505                	addi	a0,a0,1
    1a0e:	00e79b63          	bne	a5,a4,1a24 <strncmp+0x30>
    1a12:	00054703          	lbu	a4,0(a0)
    1a16:	0005c783          	lbu	a5,0(a1)
    1a1a:	cb19                	beqz	a4,1a30 <strncmp+0x3c>
    1a1c:	0005c783          	lbu	a5,0(a1)
    1a20:	0585                	addi	a1,a1,1
    1a22:	f3fd                	bnez	a5,1a08 <strncmp+0x14>
        ;
    return *l - *r;
    1a24:	0007051b          	sext.w	a0,a4
    1a28:	9d1d                	subw	a0,a0,a5
    1a2a:	8082                	ret
        return 0;
    1a2c:	4501                	li	a0,0
}
    1a2e:	8082                	ret
    1a30:	4501                	li	a0,0
    return *l - *r;
    1a32:	9d1d                	subw	a0,a0,a5
    1a34:	8082                	ret

0000000000001a36 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1a36:	00757793          	andi	a5,a0,7
    1a3a:	cf89                	beqz	a5,1a54 <strlen+0x1e>
    1a3c:	87aa                	mv	a5,a0
    1a3e:	a029                	j	1a48 <strlen+0x12>
    1a40:	0785                	addi	a5,a5,1
    1a42:	0077f713          	andi	a4,a5,7
    1a46:	cb01                	beqz	a4,1a56 <strlen+0x20>
        if (!*s)
    1a48:	0007c703          	lbu	a4,0(a5)
    1a4c:	fb75                	bnez	a4,1a40 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1a4e:	40a78533          	sub	a0,a5,a0
}
    1a52:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1a54:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1a56:	6394                	ld	a3,0(a5)
    1a58:	00000597          	auipc	a1,0x0
    1a5c:	5885b583          	ld	a1,1416(a1) # 1fe0 <unlink+0x3a>
    1a60:	00000617          	auipc	a2,0x0
    1a64:	58863603          	ld	a2,1416(a2) # 1fe8 <unlink+0x42>
    1a68:	a019                	j	1a6e <strlen+0x38>
    1a6a:	6794                	ld	a3,8(a5)
    1a6c:	07a1                	addi	a5,a5,8
    1a6e:	00b68733          	add	a4,a3,a1
    1a72:	fff6c693          	not	a3,a3
    1a76:	8f75                	and	a4,a4,a3
    1a78:	8f71                	and	a4,a4,a2
    1a7a:	db65                	beqz	a4,1a6a <strlen+0x34>
    for (; *s; s++)
    1a7c:	0007c703          	lbu	a4,0(a5)
    1a80:	d779                	beqz	a4,1a4e <strlen+0x18>
    1a82:	0017c703          	lbu	a4,1(a5)
    1a86:	0785                	addi	a5,a5,1
    1a88:	d379                	beqz	a4,1a4e <strlen+0x18>
    1a8a:	0017c703          	lbu	a4,1(a5)
    1a8e:	0785                	addi	a5,a5,1
    1a90:	fb6d                	bnez	a4,1a82 <strlen+0x4c>
    1a92:	bf75                	j	1a4e <strlen+0x18>

0000000000001a94 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a94:	00757713          	andi	a4,a0,7
{
    1a98:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1a9a:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a9e:	cb19                	beqz	a4,1ab4 <memchr+0x20>
    1aa0:	ce25                	beqz	a2,1b18 <memchr+0x84>
    1aa2:	0007c703          	lbu	a4,0(a5)
    1aa6:	04b70e63          	beq	a4,a1,1b02 <memchr+0x6e>
    1aaa:	0785                	addi	a5,a5,1
    1aac:	0077f713          	andi	a4,a5,7
    1ab0:	167d                	addi	a2,a2,-1
    1ab2:	f77d                	bnez	a4,1aa0 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1ab4:	4501                	li	a0,0
    if (n && *s != c)
    1ab6:	c235                	beqz	a2,1b1a <memchr+0x86>
    1ab8:	0007c703          	lbu	a4,0(a5)
    1abc:	04b70363          	beq	a4,a1,1b02 <memchr+0x6e>
        size_t k = ONES * c;
    1ac0:	00000517          	auipc	a0,0x0
    1ac4:	53053503          	ld	a0,1328(a0) # 1ff0 <unlink+0x4a>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1ac8:	471d                	li	a4,7
        size_t k = ONES * c;
    1aca:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1ace:	02c77a63          	bgeu	a4,a2,1b02 <memchr+0x6e>
    1ad2:	00000897          	auipc	a7,0x0
    1ad6:	50e8b883          	ld	a7,1294(a7) # 1fe0 <unlink+0x3a>
    1ada:	00000817          	auipc	a6,0x0
    1ade:	50e83803          	ld	a6,1294(a6) # 1fe8 <unlink+0x42>
    1ae2:	431d                	li	t1,7
    1ae4:	a029                	j	1aee <memchr+0x5a>
    1ae6:	1661                	addi	a2,a2,-8
    1ae8:	07a1                	addi	a5,a5,8
    1aea:	02c37963          	bgeu	t1,a2,1b1c <memchr+0x88>
    1aee:	6398                	ld	a4,0(a5)
    1af0:	8f29                	xor	a4,a4,a0
    1af2:	011706b3          	add	a3,a4,a7
    1af6:	fff74713          	not	a4,a4
    1afa:	8f75                	and	a4,a4,a3
    1afc:	01077733          	and	a4,a4,a6
    1b00:	d37d                	beqz	a4,1ae6 <memchr+0x52>
    1b02:	853e                	mv	a0,a5
    1b04:	97b2                	add	a5,a5,a2
    1b06:	a021                	j	1b0e <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1b08:	0505                	addi	a0,a0,1
    1b0a:	00f50763          	beq	a0,a5,1b18 <memchr+0x84>
    1b0e:	00054703          	lbu	a4,0(a0)
    1b12:	feb71be3          	bne	a4,a1,1b08 <memchr+0x74>
    1b16:	8082                	ret
    return n ? (void *)s : 0;
    1b18:	4501                	li	a0,0
}
    1b1a:	8082                	ret
    return n ? (void *)s : 0;
    1b1c:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1b1e:	f275                	bnez	a2,1b02 <memchr+0x6e>
}
    1b20:	8082                	ret

0000000000001b22 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1b22:	1101                	addi	sp,sp,-32
    1b24:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1b26:	862e                	mv	a2,a1
{
    1b28:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1b2a:	4581                	li	a1,0
{
    1b2c:	e426                	sd	s1,8(sp)
    1b2e:	ec06                	sd	ra,24(sp)
    1b30:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1b32:	f63ff0ef          	jal	ra,1a94 <memchr>
    return p ? p - s : n;
    1b36:	c519                	beqz	a0,1b44 <strnlen+0x22>
}
    1b38:	60e2                	ld	ra,24(sp)
    1b3a:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1b3c:	8d05                	sub	a0,a0,s1
}
    1b3e:	64a2                	ld	s1,8(sp)
    1b40:	6105                	addi	sp,sp,32
    1b42:	8082                	ret
    1b44:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1b46:	8522                	mv	a0,s0
}
    1b48:	6442                	ld	s0,16(sp)
    1b4a:	64a2                	ld	s1,8(sp)
    1b4c:	6105                	addi	sp,sp,32
    1b4e:	8082                	ret

0000000000001b50 <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1b50:	00b547b3          	xor	a5,a0,a1
    1b54:	8b9d                	andi	a5,a5,7
    1b56:	eb95                	bnez	a5,1b8a <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1b58:	0075f793          	andi	a5,a1,7
    1b5c:	e7b1                	bnez	a5,1ba8 <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1b5e:	6198                	ld	a4,0(a1)
    1b60:	00000617          	auipc	a2,0x0
    1b64:	48063603          	ld	a2,1152(a2) # 1fe0 <unlink+0x3a>
    1b68:	00000817          	auipc	a6,0x0
    1b6c:	48083803          	ld	a6,1152(a6) # 1fe8 <unlink+0x42>
    1b70:	a029                	j	1b7a <stpcpy+0x2a>
    1b72:	e118                	sd	a4,0(a0)
    1b74:	6598                	ld	a4,8(a1)
    1b76:	05a1                	addi	a1,a1,8
    1b78:	0521                	addi	a0,a0,8
    1b7a:	00c707b3          	add	a5,a4,a2
    1b7e:	fff74693          	not	a3,a4
    1b82:	8ff5                	and	a5,a5,a3
    1b84:	0107f7b3          	and	a5,a5,a6
    1b88:	d7ed                	beqz	a5,1b72 <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b8a:	0005c783          	lbu	a5,0(a1)
    1b8e:	00f50023          	sb	a5,0(a0)
    1b92:	c785                	beqz	a5,1bba <stpcpy+0x6a>
    1b94:	0015c783          	lbu	a5,1(a1)
    1b98:	0505                	addi	a0,a0,1
    1b9a:	0585                	addi	a1,a1,1
    1b9c:	00f50023          	sb	a5,0(a0)
    1ba0:	fbf5                	bnez	a5,1b94 <stpcpy+0x44>
        ;
    return d;
}
    1ba2:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1ba4:	0505                	addi	a0,a0,1
    1ba6:	df45                	beqz	a4,1b5e <stpcpy+0xe>
            if (!(*d = *s))
    1ba8:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1bac:	0585                	addi	a1,a1,1
    1bae:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1bb2:	00f50023          	sb	a5,0(a0)
    1bb6:	f7fd                	bnez	a5,1ba4 <stpcpy+0x54>
}
    1bb8:	8082                	ret
    1bba:	8082                	ret

0000000000001bbc <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1bbc:	00b547b3          	xor	a5,a0,a1
    1bc0:	8b9d                	andi	a5,a5,7
    1bc2:	1a079863          	bnez	a5,1d72 <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1bc6:	0075f793          	andi	a5,a1,7
    1bca:	16078463          	beqz	a5,1d32 <stpncpy+0x176>
    1bce:	ea01                	bnez	a2,1bde <stpncpy+0x22>
    1bd0:	a421                	j	1dd8 <stpncpy+0x21c>
    1bd2:	167d                	addi	a2,a2,-1
    1bd4:	0505                	addi	a0,a0,1
    1bd6:	14070e63          	beqz	a4,1d32 <stpncpy+0x176>
    1bda:	1a060863          	beqz	a2,1d8a <stpncpy+0x1ce>
    1bde:	0005c783          	lbu	a5,0(a1)
    1be2:	0585                	addi	a1,a1,1
    1be4:	0075f713          	andi	a4,a1,7
    1be8:	00f50023          	sb	a5,0(a0)
    1bec:	f3fd                	bnez	a5,1bd2 <stpncpy+0x16>
    1bee:	4805                	li	a6,1
    1bf0:	1a061863          	bnez	a2,1da0 <stpncpy+0x1e4>
    1bf4:	40a007b3          	neg	a5,a0
    1bf8:	8b9d                	andi	a5,a5,7
    1bfa:	4681                	li	a3,0
    1bfc:	18061a63          	bnez	a2,1d90 <stpncpy+0x1d4>
    1c00:	00778713          	addi	a4,a5,7
    1c04:	45ad                	li	a1,11
    1c06:	18b76363          	bltu	a4,a1,1d8c <stpncpy+0x1d0>
    1c0a:	1ae6eb63          	bltu	a3,a4,1dc0 <stpncpy+0x204>
    1c0e:	1a078363          	beqz	a5,1db4 <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c12:	00050023          	sb	zero,0(a0)
    1c16:	4685                	li	a3,1
    1c18:	00150713          	addi	a4,a0,1
    1c1c:	18d78f63          	beq	a5,a3,1dba <stpncpy+0x1fe>
    1c20:	000500a3          	sb	zero,1(a0)
    1c24:	4689                	li	a3,2
    1c26:	00250713          	addi	a4,a0,2
    1c2a:	18d78e63          	beq	a5,a3,1dc6 <stpncpy+0x20a>
    1c2e:	00050123          	sb	zero,2(a0)
    1c32:	468d                	li	a3,3
    1c34:	00350713          	addi	a4,a0,3
    1c38:	16d78c63          	beq	a5,a3,1db0 <stpncpy+0x1f4>
    1c3c:	000501a3          	sb	zero,3(a0)
    1c40:	4691                	li	a3,4
    1c42:	00450713          	addi	a4,a0,4
    1c46:	18d78263          	beq	a5,a3,1dca <stpncpy+0x20e>
    1c4a:	00050223          	sb	zero,4(a0)
    1c4e:	4695                	li	a3,5
    1c50:	00550713          	addi	a4,a0,5
    1c54:	16d78d63          	beq	a5,a3,1dce <stpncpy+0x212>
    1c58:	000502a3          	sb	zero,5(a0)
    1c5c:	469d                	li	a3,7
    1c5e:	00650713          	addi	a4,a0,6
    1c62:	16d79863          	bne	a5,a3,1dd2 <stpncpy+0x216>
    1c66:	00750713          	addi	a4,a0,7
    1c6a:	00050323          	sb	zero,6(a0)
    1c6e:	40f80833          	sub	a6,a6,a5
    1c72:	ff887593          	andi	a1,a6,-8
    1c76:	97aa                	add	a5,a5,a0
    1c78:	95be                	add	a1,a1,a5
    1c7a:	0007b023          	sd	zero,0(a5)
    1c7e:	07a1                	addi	a5,a5,8
    1c80:	feb79de3          	bne	a5,a1,1c7a <stpncpy+0xbe>
    1c84:	ff887593          	andi	a1,a6,-8
    1c88:	9ead                	addw	a3,a3,a1
    1c8a:	00b707b3          	add	a5,a4,a1
    1c8e:	12b80863          	beq	a6,a1,1dbe <stpncpy+0x202>
    1c92:	00078023          	sb	zero,0(a5)
    1c96:	0016871b          	addiw	a4,a3,1
    1c9a:	0ec77863          	bgeu	a4,a2,1d8a <stpncpy+0x1ce>
    1c9e:	000780a3          	sb	zero,1(a5)
    1ca2:	0026871b          	addiw	a4,a3,2
    1ca6:	0ec77263          	bgeu	a4,a2,1d8a <stpncpy+0x1ce>
    1caa:	00078123          	sb	zero,2(a5)
    1cae:	0036871b          	addiw	a4,a3,3
    1cb2:	0cc77c63          	bgeu	a4,a2,1d8a <stpncpy+0x1ce>
    1cb6:	000781a3          	sb	zero,3(a5)
    1cba:	0046871b          	addiw	a4,a3,4
    1cbe:	0cc77663          	bgeu	a4,a2,1d8a <stpncpy+0x1ce>
    1cc2:	00078223          	sb	zero,4(a5)
    1cc6:	0056871b          	addiw	a4,a3,5
    1cca:	0cc77063          	bgeu	a4,a2,1d8a <stpncpy+0x1ce>
    1cce:	000782a3          	sb	zero,5(a5)
    1cd2:	0066871b          	addiw	a4,a3,6
    1cd6:	0ac77a63          	bgeu	a4,a2,1d8a <stpncpy+0x1ce>
    1cda:	00078323          	sb	zero,6(a5)
    1cde:	0076871b          	addiw	a4,a3,7
    1ce2:	0ac77463          	bgeu	a4,a2,1d8a <stpncpy+0x1ce>
    1ce6:	000783a3          	sb	zero,7(a5)
    1cea:	0086871b          	addiw	a4,a3,8
    1cee:	08c77e63          	bgeu	a4,a2,1d8a <stpncpy+0x1ce>
    1cf2:	00078423          	sb	zero,8(a5)
    1cf6:	0096871b          	addiw	a4,a3,9
    1cfa:	08c77863          	bgeu	a4,a2,1d8a <stpncpy+0x1ce>
    1cfe:	000784a3          	sb	zero,9(a5)
    1d02:	00a6871b          	addiw	a4,a3,10
    1d06:	08c77263          	bgeu	a4,a2,1d8a <stpncpy+0x1ce>
    1d0a:	00078523          	sb	zero,10(a5)
    1d0e:	00b6871b          	addiw	a4,a3,11
    1d12:	06c77c63          	bgeu	a4,a2,1d8a <stpncpy+0x1ce>
    1d16:	000785a3          	sb	zero,11(a5)
    1d1a:	00c6871b          	addiw	a4,a3,12
    1d1e:	06c77663          	bgeu	a4,a2,1d8a <stpncpy+0x1ce>
    1d22:	00078623          	sb	zero,12(a5)
    1d26:	26b5                	addiw	a3,a3,13
    1d28:	06c6f163          	bgeu	a3,a2,1d8a <stpncpy+0x1ce>
    1d2c:	000786a3          	sb	zero,13(a5)
    1d30:	8082                	ret
            ;
        if (!n || !*s)
    1d32:	c645                	beqz	a2,1dda <stpncpy+0x21e>
    1d34:	0005c783          	lbu	a5,0(a1)
    1d38:	ea078be3          	beqz	a5,1bee <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d3c:	479d                	li	a5,7
    1d3e:	02c7ff63          	bgeu	a5,a2,1d7c <stpncpy+0x1c0>
    1d42:	00000897          	auipc	a7,0x0
    1d46:	29e8b883          	ld	a7,670(a7) # 1fe0 <unlink+0x3a>
    1d4a:	00000817          	auipc	a6,0x0
    1d4e:	29e83803          	ld	a6,670(a6) # 1fe8 <unlink+0x42>
    1d52:	431d                	li	t1,7
    1d54:	6198                	ld	a4,0(a1)
    1d56:	011707b3          	add	a5,a4,a7
    1d5a:	fff74693          	not	a3,a4
    1d5e:	8ff5                	and	a5,a5,a3
    1d60:	0107f7b3          	and	a5,a5,a6
    1d64:	ef81                	bnez	a5,1d7c <stpncpy+0x1c0>
            *wd = *ws;
    1d66:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d68:	1661                	addi	a2,a2,-8
    1d6a:	05a1                	addi	a1,a1,8
    1d6c:	0521                	addi	a0,a0,8
    1d6e:	fec363e3          	bltu	t1,a2,1d54 <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1d72:	e609                	bnez	a2,1d7c <stpncpy+0x1c0>
    1d74:	a08d                	j	1dd6 <stpncpy+0x21a>
    1d76:	167d                	addi	a2,a2,-1
    1d78:	0505                	addi	a0,a0,1
    1d7a:	ca01                	beqz	a2,1d8a <stpncpy+0x1ce>
    1d7c:	0005c783          	lbu	a5,0(a1)
    1d80:	0585                	addi	a1,a1,1
    1d82:	00f50023          	sb	a5,0(a0)
    1d86:	fbe5                	bnez	a5,1d76 <stpncpy+0x1ba>
        ;
tail:
    1d88:	b59d                	j	1bee <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1d8a:	8082                	ret
    1d8c:	472d                	li	a4,11
    1d8e:	bdb5                	j	1c0a <stpncpy+0x4e>
    1d90:	00778713          	addi	a4,a5,7
    1d94:	45ad                	li	a1,11
    1d96:	fff60693          	addi	a3,a2,-1
    1d9a:	e6b778e3          	bgeu	a4,a1,1c0a <stpncpy+0x4e>
    1d9e:	b7fd                	j	1d8c <stpncpy+0x1d0>
    1da0:	40a007b3          	neg	a5,a0
    1da4:	8832                	mv	a6,a2
    1da6:	8b9d                	andi	a5,a5,7
    1da8:	4681                	li	a3,0
    1daa:	e4060be3          	beqz	a2,1c00 <stpncpy+0x44>
    1dae:	b7cd                	j	1d90 <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1db0:	468d                	li	a3,3
    1db2:	bd75                	j	1c6e <stpncpy+0xb2>
    1db4:	872a                	mv	a4,a0
    1db6:	4681                	li	a3,0
    1db8:	bd5d                	j	1c6e <stpncpy+0xb2>
    1dba:	4685                	li	a3,1
    1dbc:	bd4d                	j	1c6e <stpncpy+0xb2>
    1dbe:	8082                	ret
    1dc0:	87aa                	mv	a5,a0
    1dc2:	4681                	li	a3,0
    1dc4:	b5f9                	j	1c92 <stpncpy+0xd6>
    1dc6:	4689                	li	a3,2
    1dc8:	b55d                	j	1c6e <stpncpy+0xb2>
    1dca:	4691                	li	a3,4
    1dcc:	b54d                	j	1c6e <stpncpy+0xb2>
    1dce:	4695                	li	a3,5
    1dd0:	bd79                	j	1c6e <stpncpy+0xb2>
    1dd2:	4699                	li	a3,6
    1dd4:	bd69                	j	1c6e <stpncpy+0xb2>
    1dd6:	8082                	ret
    1dd8:	8082                	ret
    1dda:	8082                	ret

0000000000001ddc <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1ddc:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1de0:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de2:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1de6:	2501                	sext.w	a0,a0
    1de8:	8082                	ret

0000000000001dea <close>:
    register long a7 __asm__("a7") = n;
    1dea:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1dee:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1df2:	2501                	sext.w	a0,a0
    1df4:	8082                	ret

0000000000001df6 <read>:
    register long a7 __asm__("a7") = n;
    1df6:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfa:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1dfe:	8082                	ret

0000000000001e00 <write>:
    register long a7 __asm__("a7") = n;
    1e00:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e04:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1e08:	8082                	ret

0000000000001e0a <getpid>:
    register long a7 __asm__("a7") = n;
    1e0a:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1e0e:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1e12:	2501                	sext.w	a0,a0
    1e14:	8082                	ret

0000000000001e16 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1e16:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1e1a:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1e1e:	2501                	sext.w	a0,a0
    1e20:	8082                	ret

0000000000001e22 <fork>:
    register long a7 __asm__("a7") = n;
    1e22:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1e26:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1e2a:	2501                	sext.w	a0,a0
    1e2c:	8082                	ret

0000000000001e2e <exit>:
    register long a7 __asm__("a7") = n;
    1e2e:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e32:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e36:	8082                	ret

0000000000001e38 <waitpid>:
    register long a7 __asm__("a7") = n;
    1e38:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e3c:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <exec>:
    register long a7 __asm__("a7") = n;
    1e44:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e48:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e4c:	2501                	sext.w	a0,a0
    1e4e:	8082                	ret

0000000000001e50 <get_time>:

int64 get_time()
{
    1e50:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e52:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e56:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e58:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5a:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e5e:	2501                	sext.w	a0,a0
    1e60:	ed09                	bnez	a0,1e7a <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e62:	67a2                	ld	a5,8(sp)
    1e64:	3e800713          	li	a4,1000
    1e68:	00015503          	lhu	a0,0(sp)
    1e6c:	02e7d7b3          	divu	a5,a5,a4
    1e70:	02e50533          	mul	a0,a0,a4
    1e74:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e76:	0141                	addi	sp,sp,16
    1e78:	8082                	ret
        return -1;
    1e7a:	557d                	li	a0,-1
    1e7c:	bfed                	j	1e76 <get_time+0x26>

0000000000001e7e <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e7e:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e82:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e86:	2501                	sext.w	a0,a0
    1e88:	8082                	ret

0000000000001e8a <sleep>:

int sleep(unsigned long long time)
{
    1e8a:	1141                	addi	sp,sp,-16
    1e8c:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1e8e:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e92:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e94:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e96:	00000073          	ecall
    if (err == 0)
    1e9a:	2501                	sext.w	a0,a0
    1e9c:	e13d                	bnez	a0,1f02 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e9e:	6722                	ld	a4,8(sp)
    1ea0:	3e800693          	li	a3,1000
    1ea4:	00015783          	lhu	a5,0(sp)
    1ea8:	02d75733          	divu	a4,a4,a3
    1eac:	02d787b3          	mul	a5,a5,a3
    1eb0:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1eb2:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1eb6:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1eb8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eba:	00000073          	ecall
    if (err == 0)
    1ebe:	2501                	sext.w	a0,a0
    1ec0:	ed15                	bnez	a0,1efc <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ec2:	6841                	lui	a6,0x10
    1ec4:	963e                	add	a2,a2,a5
    1ec6:	187d                	addi	a6,a6,-1
    1ec8:	3e800693          	li	a3,1000
    1ecc:	a819                	j	1ee2 <sleep+0x58>
    __asm_syscall("r"(a7))
    1ece:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1ed2:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ed6:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ed8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eda:	00000073          	ecall
    if (err == 0)
    1ede:	2501                	sext.w	a0,a0
    1ee0:	ed11                	bnez	a0,1efc <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ee2:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1ee4:	07c00893          	li	a7,124
    1ee8:	02d7d733          	divu	a4,a5,a3
    1eec:	6782                	ld	a5,0(sp)
    1eee:	0107f7b3          	and	a5,a5,a6
    1ef2:	02d787b3          	mul	a5,a5,a3
    1ef6:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1ef8:	fcc7ebe3          	bltu	a5,a2,1ece <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1efc:	4501                	li	a0,0
    1efe:	0141                	addi	sp,sp,16
    1f00:	8082                	ret
    1f02:	57fd                	li	a5,-1
    1f04:	b77d                	j	1eb2 <sleep+0x28>

0000000000001f06 <set_priority>:
    register long a7 __asm__("a7") = n;
    1f06:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1f0a:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1f0e:	2501                	sext.w	a0,a0
    1f10:	8082                	ret

0000000000001f12 <mmap>:
    register long a7 __asm__("a7") = n;
    1f12:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f16:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1f1a:	2501                	sext.w	a0,a0
    1f1c:	8082                	ret

0000000000001f1e <munmap>:
    register long a7 __asm__("a7") = n;
    1f1e:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f22:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1f26:	2501                	sext.w	a0,a0
    1f28:	8082                	ret

0000000000001f2a <wait>:

int wait(int *code)
{
    1f2a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f2c:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1f30:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f32:	00000073          	ecall
    return waitpid(-1, code);
}
    1f36:	2501                	sext.w	a0,a0
    1f38:	8082                	ret

0000000000001f3a <spawn>:
    register long a7 __asm__("a7") = n;
    1f3a:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1f3e:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f42:	2501                	sext.w	a0,a0
    1f44:	8082                	ret

0000000000001f46 <mailread>:
    register long a7 __asm__("a7") = n;
    1f46:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f4a:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f4e:	2501                	sext.w	a0,a0
    1f50:	8082                	ret

0000000000001f52 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f52:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f56:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f5a:	2501                	sext.w	a0,a0
    1f5c:	8082                	ret

0000000000001f5e <fstat>:
    register long a7 __asm__("a7") = n;
    1f5e:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f62:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f66:	2501                	sext.w	a0,a0
    1f68:	8082                	ret

0000000000001f6a <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1f6a:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f6c:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f70:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f72:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f76:	2501                	sext.w	a0,a0
    1f78:	8082                	ret

0000000000001f7a <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f7a:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f7c:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f80:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f82:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f86:	2501                	sext.w	a0,a0
    1f88:	8082                	ret

0000000000001f8a <link>:

int link(char *old_path, char *new_path)
{
    1f8a:	87aa                	mv	a5,a0
    1f8c:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f8e:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f92:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f96:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f98:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f9c:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f9e:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1fa2:	2501                	sext.w	a0,a0
    1fa4:	8082                	ret

0000000000001fa6 <unlink>:

int unlink(char *path)
{
    1fa6:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1fa8:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1fac:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1fb0:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fb2:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1fb6:	2501                	sext.w	a0,a0
    1fb8:	8082                	ret
