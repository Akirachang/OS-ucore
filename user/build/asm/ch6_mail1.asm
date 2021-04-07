
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch6_mail1:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0d80006f          	j	10da <__start_main>

0000000000001006 <main>:
const int MAIL_MAX = 16;

/// 测试邮箱容量，输出 mail1 test OK! 就算正确。

int main()
{
    1006:	de010113          	addi	sp,sp,-544
    100a:	20813823          	sd	s0,528(sp)
    100e:	20913423          	sd	s1,520(sp)
    1012:	20113c23          	sd	ra,536(sp)
    int pid = getpid();
    1016:	635000ef          	jal	ra,1e4a <getpid>
    101a:	84aa                	mv	s1,a0
    char buffer0[BUF_LEN];
    memset(buffer0, 'a', BUF_LEN);
    101c:	10000613          	li	a2,256
    1020:	06100593          	li	a1,97
    1024:	850a                	mv	a0,sp
    1026:	4441                	li	s0,16
    1028:	049000ef          	jal	ra,1870 <memset>
    for (int _ = 0; _ < MAIL_MAX; ++_)
    {
        assert(mailwrite(pid, buffer0, BUF_LEN) == BUF_LEN);
    102c:	10000613          	li	a2,256
    1030:	858a                	mv	a1,sp
    1032:	8526                	mv	a0,s1
    1034:	75f000ef          	jal	ra,1f92 <mailwrite>
    1038:	872a                	mv	a4,a0
    103a:	10000793          	li	a5,256
    103e:	347d                	addiw	s0,s0,-1
    1040:	557d                	li	a0,-1
    1042:	00f70463          	beq	a4,a5,104a <main+0x44>
    1046:	629000ef          	jal	ra,1e6e <exit>
    for (int _ = 0; _ < MAIL_MAX; ++_)
    104a:	f06d                	bnez	s0,102c <main+0x26>
    }
    assert(mailwrite(pid, buffer0, BUF_LEN) == -1);
    104c:	10000613          	li	a2,256
    1050:	858a                	mv	a1,sp
    1052:	8526                	mv	a0,s1
    1054:	73f000ef          	jal	ra,1f92 <mailwrite>
    1058:	57fd                	li	a5,-1
    105a:	00f50563          	beq	a0,a5,1064 <main+0x5e>
    105e:	557d                	li	a0,-1
    1060:	60f000ef          	jal	ra,1e6e <exit>
    char buf[BUF_LEN];
    memset(buf, 0, BUF_LEN);
    1064:	10000613          	li	a2,256
    1068:	4581                	li	a1,0
    106a:	0208                	addi	a0,sp,256
    106c:	005000ef          	jal	ra,1870 <memset>
    assert(mailread(buf, BUF_LEN) == BUF_LEN);
    1070:	10000593          	li	a1,256
    1074:	0208                	addi	a0,sp,256
    1076:	711000ef          	jal	ra,1f86 <mailread>
    107a:	10000793          	li	a5,256
    107e:	00f50563          	beq	a0,a5,1088 <main+0x82>
    1082:	557d                	li	a0,-1
    1084:	5eb000ef          	jal	ra,1e6e <exit>
    assert(mailwrite(pid, buffer0, BUF_LEN) == BUF_LEN);
    1088:	10000613          	li	a2,256
    108c:	858a                	mv	a1,sp
    108e:	8526                	mv	a0,s1
    1090:	703000ef          	jal	ra,1f92 <mailwrite>
    1094:	10000793          	li	a5,256
    1098:	00f50563          	beq	a0,a5,10a2 <main+0x9c>
    109c:	557d                	li	a0,-1
    109e:	5d1000ef          	jal	ra,1e6e <exit>
    assert(mailwrite(pid, buffer0, BUF_LEN) == -1);
    10a2:	10000613          	li	a2,256
    10a6:	858a                	mv	a1,sp
    10a8:	8526                	mv	a0,s1
    10aa:	6e9000ef          	jal	ra,1f92 <mailwrite>
    10ae:	57fd                	li	a5,-1
    10b0:	00f50563          	beq	a0,a5,10ba <main+0xb4>
    10b4:	557d                	li	a0,-1
    10b6:	5b9000ef          	jal	ra,1e6e <exit>
    puts("mail1 test OK!");
    10ba:	00001517          	auipc	a0,0x1
    10be:	f4650513          	addi	a0,a0,-186 # 2000 <unlink+0x1a>
    10c2:	068000ef          	jal	ra,112a <puts>
    10c6:	21813083          	ld	ra,536(sp)
    10ca:	21013403          	ld	s0,528(sp)
    10ce:	20813483          	ld	s1,520(sp)
    10d2:	4501                	li	a0,0
    10d4:	22010113          	addi	sp,sp,544
    10d8:	8082                	ret

00000000000010da <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10da:	1141                	addi	sp,sp,-16
    10dc:	e406                	sd	ra,8(sp)
    exit(main());
    10de:	f29ff0ef          	jal	ra,1006 <main>
    10e2:	58d000ef          	jal	ra,1e6e <exit>
    return 0;
}
    10e6:	60a2                	ld	ra,8(sp)
    10e8:	4501                	li	a0,0
    10ea:	0141                	addi	sp,sp,16
    10ec:	8082                	ret

00000000000010ee <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    10ee:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    10f0:	00f10593          	addi	a1,sp,15
    10f4:	4605                	li	a2,1
    10f6:	4501                	li	a0,0
{
    10f8:	ec06                	sd	ra,24(sp)
    char byte = 0;
    10fa:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    10fe:	539000ef          	jal	ra,1e36 <read>
    return byte;
}
    1102:	60e2                	ld	ra,24(sp)
    1104:	00f14503          	lbu	a0,15(sp)
    1108:	6105                	addi	sp,sp,32
    110a:	8082                	ret

000000000000110c <putchar>:

int putchar(int c)
{
    110c:	1101                	addi	sp,sp,-32
    110e:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    1110:	00f10593          	addi	a1,sp,15
    1114:	4605                	li	a2,1
    1116:	4505                	li	a0,1
{
    1118:	ec06                	sd	ra,24(sp)
    char byte = c;
    111a:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    111e:	523000ef          	jal	ra,1e40 <write>
}
    1122:	60e2                	ld	ra,24(sp)
    1124:	2501                	sext.w	a0,a0
    1126:	6105                	addi	sp,sp,32
    1128:	8082                	ret

000000000000112a <puts>:

int puts(const char *s)
{
    112a:	1101                	addi	sp,sp,-32
    112c:	e822                	sd	s0,16(sp)
    112e:	ec06                	sd	ra,24(sp)
    1130:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    1132:	145000ef          	jal	ra,1a76 <strlen>
    1136:	862a                	mv	a2,a0
    1138:	85a2                	mv	a1,s0
    113a:	4505                	li	a0,1
    113c:	505000ef          	jal	ra,1e40 <write>
    1140:	00055763          	bgez	a0,114e <puts+0x24>
    return r;
}
    1144:	60e2                	ld	ra,24(sp)
    1146:	6442                	ld	s0,16(sp)
    1148:	557d                	li	a0,-1
    114a:	6105                	addi	sp,sp,32
    114c:	8082                	ret
    return write(stdout, &byte, 1);
    114e:	00f10593          	addi	a1,sp,15
    char byte = c;
    1152:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    1154:	4605                	li	a2,1
    1156:	4505                	li	a0,1
    char byte = c;
    1158:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    115c:	4e5000ef          	jal	ra,1e40 <write>
}
    1160:	60e2                	ld	ra,24(sp)
    1162:	6442                	ld	s0,16(sp)
    1164:	41f5551b          	sraiw	a0,a0,0x1f
    1168:	6105                	addi	sp,sp,32
    116a:	8082                	ret

000000000000116c <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    116c:	7131                	addi	sp,sp,-192
    116e:	ecce                	sd	s3,88(sp)
    1170:	e8d2                	sd	s4,80(sp)
    1172:	e4d6                	sd	s5,72(sp)
    1174:	e0da                	sd	s6,64(sp)
    1176:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    1178:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    117a:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    117c:	6ae1                	lui	s5,0x18
    117e:	000f4a37          	lui	s4,0xf4
    1182:	00989b37          	lui	s6,0x989
{
    1186:	fc86                	sd	ra,120(sp)
    1188:	f8a2                	sd	s0,112(sp)
    118a:	f4a6                	sd	s1,104(sp)
    118c:	f0ca                	sd	s2,96(sp)
    118e:	fc5e                	sd	s7,56(sp)
    1190:	e52e                	sd	a1,136(sp)
    1192:	e932                	sd	a2,144(sp)
    1194:	ed36                	sd	a3,152(sp)
    1196:	f13a                	sd	a4,160(sp)
    1198:	f942                	sd	a6,176(sp)
    119a:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    119c:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    119e:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x6d7>
    11a2:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x16667>
    11a6:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf2207>
    11aa:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x987647>
    for (;;)
    {
        if (!*s)
    11ae:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    11b2:	02500913          	li	s2,37
        if (!*s)
    11b6:	1a078f63          	beqz	a5,1374 <printf+0x208>
    11ba:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    11bc:	17278e63          	beq	a5,s2,1338 <printf+0x1cc>
    11c0:	00164783          	lbu	a5,1(a2)
    11c4:	0605                	addi	a2,a2,1
    11c6:	fbfd                	bnez	a5,11bc <printf+0x50>
    11c8:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    11ca:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    11ce:	85aa                	mv	a1,a0
    11d0:	8622                	mv	a2,s0
    11d2:	4505                	li	a0,1
    11d4:	46d000ef          	jal	ra,1e40 <write>
        out(f, a, l);
        if (l)
    11d8:	18041963          	bnez	s0,136a <printf+0x1fe>
            continue;
        if (s[1] == 0)
    11dc:	0014c783          	lbu	a5,1(s1)
    11e0:	18078a63          	beqz	a5,1374 <printf+0x208>
            break;
        switch (s[1])
    11e4:	07300713          	li	a4,115
    11e8:	28e78e63          	beq	a5,a4,1484 <printf+0x318>
    11ec:	18f76f63          	bltu	a4,a5,138a <printf+0x21e>
    11f0:	06400713          	li	a4,100
    11f4:	2ae78c63          	beq	a5,a4,14ac <printf+0x340>
    11f8:	07000713          	li	a4,112
    11fc:	3ce79c63          	bne	a5,a4,15d4 <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1200:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1202:	00001797          	auipc	a5,0x1
    1206:	e3678793          	addi	a5,a5,-458 # 2038 <digits>
            printptr(va_arg(ap, uint64));
    120a:	6298                	ld	a4,0(a3)
    120c:	00868093          	addi	ra,a3,8
    1210:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1212:	00471293          	slli	t0,a4,0x4
    1216:	00c71f13          	slli	t5,a4,0xc
    121a:	01471e13          	slli	t3,a4,0x14
    121e:	01c71893          	slli	a7,a4,0x1c
    1222:	02471813          	slli	a6,a4,0x24
    1226:	02871513          	slli	a0,a4,0x28
    122a:	02c71593          	slli	a1,a4,0x2c
    122e:	03071693          	slli	a3,a4,0x30
    1232:	00871f93          	slli	t6,a4,0x8
    1236:	01071e93          	slli	t4,a4,0x10
    123a:	01871313          	slli	t1,a4,0x18
    123e:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1242:	03c2d293          	srli	t0,t0,0x3c
    1246:	03cf5f13          	srli	t5,t5,0x3c
    124a:	03ce5e13          	srli	t3,t3,0x3c
    124e:	03c8d893          	srli	a7,a7,0x3c
    1252:	03c85813          	srli	a6,a6,0x3c
    1256:	9171                	srli	a0,a0,0x3c
    1258:	91f1                	srli	a1,a1,0x3c
    125a:	92f1                	srli	a3,a3,0x3c
    125c:	92be                	add	t0,t0,a5
    125e:	9f3e                	add	t5,t5,a5
    1260:	9e3e                	add	t3,t3,a5
    1262:	98be                	add	a7,a7,a5
    1264:	983e                	add	a6,a6,a5
    1266:	953e                	add	a0,a0,a5
    1268:	95be                	add	a1,a1,a5
    126a:	96be                	add	a3,a3,a5
    126c:	03c75393          	srli	t2,a4,0x3c
    1270:	01c75b9b          	srliw	s7,a4,0x1c
    1274:	03cfdf93          	srli	t6,t6,0x3c
    1278:	03cede93          	srli	t4,t4,0x3c
    127c:	03c35313          	srli	t1,t1,0x3c
    1280:	9271                	srli	a2,a2,0x3c
    1282:	0002c403          	lbu	s0,0(t0)
    1286:	93be                	add	t2,t2,a5
    1288:	000f4283          	lbu	t0,0(t5)
    128c:	9fbe                	add	t6,t6,a5
    128e:	000e4f03          	lbu	t5,0(t3)
    1292:	9ebe                	add	t4,t4,a5
    1294:	0008ce03          	lbu	t3,0(a7)
    1298:	933e                	add	t1,t1,a5
    129a:	00084883          	lbu	a7,0(a6)
    129e:	9bbe                	add	s7,s7,a5
    12a0:	00054803          	lbu	a6,0(a0)
    12a4:	963e                	add	a2,a2,a5
    12a6:	0005c503          	lbu	a0,0(a1)
    12aa:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    12ae:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12b2:	0003c903          	lbu	s2,0(t2)
    12b6:	00064603          	lbu	a2,0(a2)
    12ba:	000fc383          	lbu	t2,0(t6)
    12be:	8b3d                	andi	a4,a4,15
    12c0:	000ecf83          	lbu	t6,0(t4)
    12c4:	92f1                	srli	a3,a3,0x3c
    12c6:	00034e83          	lbu	t4,0(t1)
    12ca:	000bc303          	lbu	t1,0(s7)
    12ce:	96be                	add	a3,a3,a5
    12d0:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    12d2:	7761                	lui	a4,0xffff8
    12d4:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12d8:	00710623          	sb	t2,12(sp)
    12dc:	005106a3          	sb	t0,13(sp)
    12e0:	01f10723          	sb	t6,14(sp)
    12e4:	01e107a3          	sb	t5,15(sp)
    12e8:	01d10823          	sb	t4,16(sp)
    12ec:	01c108a3          	sb	t3,17(sp)
    12f0:	00610923          	sb	t1,18(sp)
    12f4:	011109a3          	sb	a7,19(sp)
    12f8:	01010a23          	sb	a6,20(sp)
    12fc:	00a10aa3          	sb	a0,21(sp)
    1300:	00b10b23          	sb	a1,22(sp)
    1304:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    1308:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    130c:	01210523          	sb	s2,10(sp)
    1310:	008105a3          	sb	s0,11(sp)
    1314:	0006c703          	lbu	a4,0(a3)
    1318:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    131c:	4649                	li	a2,18
    131e:	002c                	addi	a1,sp,8
    1320:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1322:	00e10c23          	sb	a4,24(sp)
    1326:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    132a:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    132e:	313000ef          	jal	ra,1e40 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1332:	00248513          	addi	a0,s1,2
    1336:	bda5                	j	11ae <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1338:	00064783          	lbu	a5,0(a2)
    133c:	84b2                	mv	s1,a2
    133e:	01278963          	beq	a5,s2,1350 <printf+0x1e4>
    1342:	b561                	j	11ca <printf+0x5e>
    1344:	0024c783          	lbu	a5,2(s1)
    1348:	0605                	addi	a2,a2,1
    134a:	0489                	addi	s1,s1,2
    134c:	e7279fe3          	bne	a5,s2,11ca <printf+0x5e>
    1350:	0014c783          	lbu	a5,1(s1)
    1354:	ff2788e3          	beq	a5,s2,1344 <printf+0x1d8>
        l = z - a;
    1358:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    135c:	85aa                	mv	a1,a0
    135e:	8622                	mv	a2,s0
    1360:	4505                	li	a0,1
    1362:	2df000ef          	jal	ra,1e40 <write>
        if (l)
    1366:	e6040be3          	beqz	s0,11dc <printf+0x70>
    136a:	8526                	mv	a0,s1
        if (!*s)
    136c:	00054783          	lbu	a5,0(a0)
    1370:	e40795e3          	bnez	a5,11ba <printf+0x4e>
    }
    va_end(ap);
    1374:	70e6                	ld	ra,120(sp)
    1376:	7446                	ld	s0,112(sp)
    1378:	74a6                	ld	s1,104(sp)
    137a:	7906                	ld	s2,96(sp)
    137c:	69e6                	ld	s3,88(sp)
    137e:	6a46                	ld	s4,80(sp)
    1380:	6aa6                	ld	s5,72(sp)
    1382:	6b06                	ld	s6,64(sp)
    1384:	7be2                	ld	s7,56(sp)
    1386:	6129                	addi	sp,sp,192
    1388:	8082                	ret
        switch (s[1])
    138a:	07800713          	li	a4,120
    138e:	24e79363          	bne	a5,a4,15d4 <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    1392:	6782                	ld	a5,0(sp)
    1394:	4394                	lw	a3,0(a5)
    1396:	07a1                	addi	a5,a5,8
    1398:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    139a:	2606c263          	bltz	a3,15fe <printf+0x492>
        buf[i--] = digits[x % base];
    139e:	00001797          	auipc	a5,0x1
    13a2:	c9a78793          	addi	a5,a5,-870 # 2038 <digits>
    13a6:	00f6f713          	andi	a4,a3,15
    13aa:	973e                	add	a4,a4,a5
    13ac:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff5fc8>
    buf[16] = 0;
    13b0:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    13b4:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    13b6:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    13ba:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    13be:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    13c2:	0046d51b          	srliw	a0,a3,0x4
    13c6:	0ad5d563          	bge	a1,a3,1470 <printf+0x304>
        buf[i--] = digits[x % base];
    13ca:	8a3d                	andi	a2,a2,15
    13cc:	963e                	add	a2,a2,a5
    13ce:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    13d2:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    13d6:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    13da:	30a5fe63          	bgeu	a1,a0,16f6 <printf+0x58a>
        buf[i--] = digits[x % base];
    13de:	00f77613          	andi	a2,a4,15
    13e2:	963e                	add	a2,a2,a5
    13e4:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13e8:	45bd                	li	a1,15
    13ea:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    13ee:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    13f2:	00475513          	srli	a0,a4,0x4
    13f6:	30e5f963          	bgeu	a1,a4,1708 <printf+0x59c>
        buf[i--] = digits[x % base];
    13fa:	8a3d                	andi	a2,a2,15
    13fc:	963e                	add	a2,a2,a5
    13fe:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    1402:	00875893          	srli	a7,a4,0x8
    1406:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    140a:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    140e:	30a5fd63          	bgeu	a1,a0,1728 <printf+0x5bc>
        buf[i--] = digits[x % base];
    1412:	8a3d                	andi	a2,a2,15
    1414:	963e                	add	a2,a2,a5
    1416:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    141a:	00c75813          	srli	a6,a4,0xc
    141e:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    1422:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    1426:	3315fe63          	bgeu	a1,a7,1762 <printf+0x5f6>
        buf[i--] = digits[x % base];
    142a:	8a3d                	andi	a2,a2,15
    142c:	963e                	add	a2,a2,a5
    142e:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1432:	01075893          	srli	a7,a4,0x10
    1436:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    143a:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    143e:	3305ff63          	bgeu	a1,a6,177c <printf+0x610>
        buf[i--] = digits[x % base];
    1442:	8a3d                	andi	a2,a2,15
    1444:	963e                	add	a2,a2,a5
    1446:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    144a:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    144e:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1452:	3515f863          	bgeu	a1,a7,17a2 <printf+0x636>
        buf[i--] = digits[x % base];
    1456:	97ba                	add	a5,a5,a4
    1458:	0007c783          	lbu	a5,0(a5)
    145c:	45a1                	li	a1,8
    145e:	00f10823          	sb	a5,16(sp)
    if (sign)
    1462:	0006d763          	bgez	a3,1470 <printf+0x304>
        buf[i--] = '-';
    1466:	02d00793          	li	a5,45
    146a:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    146e:	459d                	li	a1,7
    write(f, s, l);
    1470:	4641                	li	a2,16
    1472:	003c                	addi	a5,sp,8
    1474:	9e0d                	subw	a2,a2,a1
    1476:	4505                	li	a0,1
    1478:	95be                	add	a1,a1,a5
    147a:	1c7000ef          	jal	ra,1e40 <write>
        s += 2;
    147e:	00248513          	addi	a0,s1,2
    1482:	b335                	j	11ae <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    1484:	6782                	ld	a5,0(sp)
    1486:	6380                	ld	s0,0(a5)
    1488:	07a1                	addi	a5,a5,8
    148a:	e03e                	sd	a5,0(sp)
    148c:	22040a63          	beqz	s0,16c0 <printf+0x554>
            l = strnlen(a, 200);
    1490:	0c800593          	li	a1,200
    1494:	8522                	mv	a0,s0
    1496:	6cc000ef          	jal	ra,1b62 <strnlen>
    write(f, s, l);
    149a:	0005061b          	sext.w	a2,a0
    149e:	85a2                	mv	a1,s0
    14a0:	4505                	li	a0,1
    14a2:	19f000ef          	jal	ra,1e40 <write>
        s += 2;
    14a6:	00248513          	addi	a0,s1,2
    14aa:	b311                	j	11ae <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    14ac:	6782                	ld	a5,0(sp)
    14ae:	4390                	lw	a2,0(a5)
    14b0:	07a1                	addi	a5,a5,8
    14b2:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    14b4:	1a064363          	bltz	a2,165a <printf+0x4ee>
        buf[i--] = digits[x % base];
    14b8:	46a9                	li	a3,10
    14ba:	02d6773b          	remuw	a4,a2,a3
    14be:	00001797          	auipc	a5,0x1
    14c2:	b7a78793          	addi	a5,a5,-1158 # 2038 <digits>
    buf[16] = 0;
    14c6:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    14ca:	4525                	li	a0,9
        x = xx;
    14cc:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    14d0:	973e                	add	a4,a4,a5
    14d2:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    14d6:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    14da:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    14de:	2cc55063          	bge	a0,a2,179e <printf+0x632>
    14e2:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    14e6:	02d5f73b          	remuw	a4,a1,a3
    14ea:	1702                	slli	a4,a4,0x20
    14ec:	9301                	srli	a4,a4,0x20
    14ee:	973e                	add	a4,a4,a5
    14f0:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    14f4:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    14f8:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    14fc:	1f057d63          	bgeu	a0,a6,16f6 <printf+0x58a>
        buf[i--] = digits[x % base];
    1500:	4529                	li	a0,10
    } while ((x /= base) != 0);
    1502:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1504:	02a5f73b          	remuw	a4,a1,a0
    1508:	973e                	add	a4,a4,a5
    150a:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    150e:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    1512:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    1516:	1ab6f163          	bgeu	a3,a1,16b8 <printf+0x54c>
    151a:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    151e:	02a776bb          	remuw	a3,a4,a0
    1522:	96be                	add	a3,a3,a5
    1524:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1528:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    152c:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1530:	20b87c63          	bgeu	a6,a1,1748 <printf+0x5dc>
    1534:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    1538:	02a776bb          	remuw	a3,a4,a0
    153c:	96be                	add	a3,a3,a5
    153e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1542:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1546:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    154a:	20b87363          	bgeu	a6,a1,1750 <printf+0x5e4>
        buf[i--] = digits[x % base];
    154e:	02a776bb          	remuw	a3,a4,a0
    1552:	96be                	add	a3,a3,a5
    1554:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1558:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    155c:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1560:	20b9f563          	bgeu	s3,a1,176a <printf+0x5fe>
        buf[i--] = digits[x % base];
    1564:	02a776bb          	remuw	a3,a4,a0
    1568:	96be                	add	a3,a3,a5
    156a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    156e:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1572:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1576:	20bafb63          	bgeu	s5,a1,178c <printf+0x620>
        buf[i--] = digits[x % base];
    157a:	02a776bb          	remuw	a3,a4,a0
    157e:	96be                	add	a3,a3,a5
    1580:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1584:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1588:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    158c:	1eba7c63          	bgeu	s4,a1,1784 <printf+0x618>
        buf[i--] = digits[x % base];
    1590:	02a776bb          	remuw	a3,a4,a0
    1594:	96be                	add	a3,a3,a5
    1596:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    159a:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    159e:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    15a2:	14bb7163          	bgeu	s6,a1,16e4 <printf+0x578>
        buf[i--] = digits[x % base];
    15a6:	1702                	slli	a4,a4,0x20
    15a8:	9301                	srli	a4,a4,0x20
    15aa:	97ba                	add	a5,a5,a4
    15ac:	0007c783          	lbu	a5,0(a5)
    15b0:	4599                	li	a1,6
    15b2:	00f10723          	sb	a5,14(sp)
    if (sign)
    15b6:	ea065de3          	bgez	a2,1470 <printf+0x304>
        buf[i--] = '-';
    15ba:	02d00793          	li	a5,45
    15be:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    15c2:	4595                	li	a1,5
    write(f, s, l);
    15c4:	003c                	addi	a5,sp,8
    15c6:	4641                	li	a2,16
    15c8:	9e0d                	subw	a2,a2,a1
    15ca:	4505                	li	a0,1
    15cc:	95be                	add	a1,a1,a5
    15ce:	073000ef          	jal	ra,1e40 <write>
    15d2:	b575                	j	147e <printf+0x312>
    char byte = c;
    15d4:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    15d8:	4605                	li	a2,1
    15da:	002c                	addi	a1,sp,8
    15dc:	4505                	li	a0,1
    char byte = c;
    15de:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15e2:	05f000ef          	jal	ra,1e40 <write>
    char byte = c;
    15e6:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15ea:	4605                	li	a2,1
    15ec:	002c                	addi	a1,sp,8
    15ee:	4505                	li	a0,1
    char byte = c;
    15f0:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15f4:	04d000ef          	jal	ra,1e40 <write>
        s += 2;
    15f8:	00248513          	addi	a0,s1,2
    15fc:	be4d                	j	11ae <printf+0x42>
        x = -xx;
    15fe:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    1602:	00001797          	auipc	a5,0x1
    1606:	a3678793          	addi	a5,a5,-1482 # 2038 <digits>
    160a:	00f77613          	andi	a2,a4,15
    160e:	963e                	add	a2,a2,a5
    1610:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    1614:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1618:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    161a:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    161e:	0047551b          	srliw	a0,a4,0x4
    1622:	0047561b          	srliw	a2,a4,0x4
    1626:	0ab6d263          	bge	a3,a1,16ca <printf+0x55e>
        buf[i--] = digits[x % base];
    162a:	8a3d                	andi	a2,a2,15
    162c:	963e                	add	a2,a2,a5
    162e:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    1632:	463d                	li	a2,15
    1634:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    1638:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    163c:	daa661e3          	bltu	a2,a0,13de <printf+0x272>
        buf[i--] = '-';
    1640:	02d00793          	li	a5,45
    1644:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1648:	45b5                	li	a1,13
    write(f, s, l);
    164a:	003c                	addi	a5,sp,8
    164c:	4641                	li	a2,16
    164e:	9e0d                	subw	a2,a2,a1
    1650:	4505                	li	a0,1
    1652:	95be                	add	a1,a1,a5
    1654:	7ec000ef          	jal	ra,1e40 <write>
    1658:	b51d                	j	147e <printf+0x312>
        x = -xx;
    165a:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    165e:	46a9                	li	a3,10
    1660:	02d875bb          	remuw	a1,a6,a3
    1664:	00001797          	auipc	a5,0x1
    1668:	9d478793          	addi	a5,a5,-1580 # 2038 <digits>
    buf[16] = 0;
    166c:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1670:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    1672:	95be                	add	a1,a1,a5
    1674:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    1678:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    167c:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    1680:	04a65563          	bge	a2,a0,16ca <printf+0x55e>
    1684:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1688:	02d775bb          	remuw	a1,a4,a3
    168c:	95be                	add	a1,a1,a5
    168e:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    1692:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    1696:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    169a:	fb0573e3          	bgeu	a0,a6,1640 <printf+0x4d4>
        buf[i--] = digits[x % base];
    169e:	4529                	li	a0,10
    } while ((x /= base) != 0);
    16a0:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    16a2:	02a5f73b          	remuw	a4,a1,a0
    16a6:	973e                	add	a4,a4,a5
    16a8:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    16ac:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    16b0:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    16b4:	e6b6e3e3          	bltu	a3,a1,151a <printf+0x3ae>
        buf[i--] = digits[x % base];
    16b8:	45b5                	li	a1,13
    if (sign)
    16ba:	da065be3          	bgez	a2,1470 <printf+0x304>
    16be:	a881                	j	170e <printf+0x5a2>
                a = "(null)";
    16c0:	00001417          	auipc	s0,0x1
    16c4:	95040413          	addi	s0,s0,-1712 # 2010 <unlink+0x2a>
    16c8:	b3e1                	j	1490 <printf+0x324>
        buf[i--] = '-';
    16ca:	02d00793          	li	a5,45
    16ce:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    16d2:	45b9                	li	a1,14
    write(f, s, l);
    16d4:	003c                	addi	a5,sp,8
    16d6:	4641                	li	a2,16
    16d8:	9e0d                	subw	a2,a2,a1
    16da:	4505                	li	a0,1
    16dc:	95be                	add	a1,a1,a5
    16de:	762000ef          	jal	ra,1e40 <write>
    16e2:	bb71                	j	147e <printf+0x312>
        buf[i--] = digits[x % base];
    16e4:	459d                	li	a1,7
    if (sign)
    16e6:	d80655e3          	bgez	a2,1470 <printf+0x304>
        buf[i--] = '-';
    16ea:	02d00793          	li	a5,45
    16ee:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    16f2:	4599                	li	a1,6
    16f4:	bbb5                	j	1470 <printf+0x304>
    16f6:	45b9                	li	a1,14
    write(f, s, l);
    16f8:	003c                	addi	a5,sp,8
    16fa:	4641                	li	a2,16
    16fc:	9e0d                	subw	a2,a2,a1
    16fe:	4505                	li	a0,1
    1700:	95be                	add	a1,a1,a5
    1702:	73e000ef          	jal	ra,1e40 <write>
    1706:	bba5                	j	147e <printf+0x312>
        buf[i--] = digits[x % base];
    1708:	45b5                	li	a1,13
    if (sign)
    170a:	d606d3e3          	bgez	a3,1470 <printf+0x304>
        buf[i--] = '-';
    170e:	02d00793          	li	a5,45
    1712:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1716:	45b1                	li	a1,12
    write(f, s, l);
    1718:	003c                	addi	a5,sp,8
    171a:	4641                	li	a2,16
    171c:	9e0d                	subw	a2,a2,a1
    171e:	4505                	li	a0,1
    1720:	95be                	add	a1,a1,a5
    1722:	71e000ef          	jal	ra,1e40 <write>
    1726:	bba1                	j	147e <printf+0x312>
        buf[i--] = digits[x % base];
    1728:	45b1                	li	a1,12
    if (sign)
    172a:	d406d3e3          	bgez	a3,1470 <printf+0x304>
        buf[i--] = '-';
    172e:	02d00793          	li	a5,45
    1732:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1736:	45ad                	li	a1,11
    write(f, s, l);
    1738:	003c                	addi	a5,sp,8
    173a:	4641                	li	a2,16
    173c:	9e0d                	subw	a2,a2,a1
    173e:	4505                	li	a0,1
    1740:	95be                	add	a1,a1,a5
    1742:	6fe000ef          	jal	ra,1e40 <write>
    1746:	bb25                	j	147e <printf+0x312>
        buf[i--] = digits[x % base];
    1748:	45b1                	li	a1,12
    if (sign)
    174a:	d20653e3          	bgez	a2,1470 <printf+0x304>
    174e:	b7c5                	j	172e <printf+0x5c2>
        buf[i--] = digits[x % base];
    1750:	45ad                	li	a1,11
    if (sign)
    1752:	d0065fe3          	bgez	a2,1470 <printf+0x304>
        buf[i--] = '-';
    1756:	02d00793          	li	a5,45
    175a:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    175e:	45a9                	li	a1,10
    1760:	bb01                	j	1470 <printf+0x304>
    1762:	45ad                	li	a1,11
    if (sign)
    1764:	d006d6e3          	bgez	a3,1470 <printf+0x304>
    1768:	b7fd                	j	1756 <printf+0x5ea>
        buf[i--] = digits[x % base];
    176a:	45a9                	li	a1,10
    if (sign)
    176c:	d00652e3          	bgez	a2,1470 <printf+0x304>
        buf[i--] = '-';
    1770:	02d00793          	li	a5,45
    1774:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1778:	45a5                	li	a1,9
    177a:	b9dd                	j	1470 <printf+0x304>
    177c:	45a9                	li	a1,10
    if (sign)
    177e:	ce06d9e3          	bgez	a3,1470 <printf+0x304>
    1782:	b7fd                	j	1770 <printf+0x604>
        buf[i--] = digits[x % base];
    1784:	45a1                	li	a1,8
    if (sign)
    1786:	ce0655e3          	bgez	a2,1470 <printf+0x304>
    178a:	b9f1                	j	1466 <printf+0x2fa>
        buf[i--] = digits[x % base];
    178c:	45a5                	li	a1,9
    if (sign)
    178e:	ce0651e3          	bgez	a2,1470 <printf+0x304>
        buf[i--] = '-';
    1792:	02d00793          	li	a5,45
    1796:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    179a:	45a1                	li	a1,8
    179c:	b9d1                	j	1470 <printf+0x304>
    i = 15;
    179e:	45bd                	li	a1,15
    17a0:	b9c1                	j	1470 <printf+0x304>
        buf[i--] = digits[x % base];
    17a2:	45a5                	li	a1,9
    if (sign)
    17a4:	cc06d6e3          	bgez	a3,1470 <printf+0x304>
    17a8:	b7ed                	j	1792 <printf+0x626>

00000000000017aa <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    17aa:	02000793          	li	a5,32
    17ae:	00f50663          	beq	a0,a5,17ba <isspace+0x10>
    17b2:	355d                	addiw	a0,a0,-9
    17b4:	00553513          	sltiu	a0,a0,5
    17b8:	8082                	ret
    17ba:	4505                	li	a0,1
}
    17bc:	8082                	ret

00000000000017be <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    17be:	fd05051b          	addiw	a0,a0,-48
}
    17c2:	00a53513          	sltiu	a0,a0,10
    17c6:	8082                	ret

00000000000017c8 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    17c8:	02000613          	li	a2,32
    17cc:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    17ce:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    17d2:	ff77069b          	addiw	a3,a4,-9
    17d6:	04c70d63          	beq	a4,a2,1830 <atoi+0x68>
    17da:	0007079b          	sext.w	a5,a4
    17de:	04d5f963          	bgeu	a1,a3,1830 <atoi+0x68>
        s++;
    switch (*s)
    17e2:	02b00693          	li	a3,43
    17e6:	04d70a63          	beq	a4,a3,183a <atoi+0x72>
    17ea:	02d00693          	li	a3,45
    17ee:	06d70463          	beq	a4,a3,1856 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    17f2:	fd07859b          	addiw	a1,a5,-48
    17f6:	4625                	li	a2,9
    17f8:	873e                	mv	a4,a5
    17fa:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    17fc:	4e01                	li	t3,0
    while (isdigit(*s))
    17fe:	04b66a63          	bltu	a2,a1,1852 <atoi+0x8a>
    int n = 0, neg = 0;
    1802:	4501                	li	a0,0
    while (isdigit(*s))
    1804:	4825                	li	a6,9
    1806:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    180a:	0025179b          	slliw	a5,a0,0x2
    180e:	9d3d                	addw	a0,a0,a5
    1810:	fd07031b          	addiw	t1,a4,-48
    1814:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1818:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    181c:	0685                	addi	a3,a3,1
    181e:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1822:	0006071b          	sext.w	a4,a2
    1826:	feb870e3          	bgeu	a6,a1,1806 <atoi+0x3e>
    return neg ? n : -n;
    182a:	000e0563          	beqz	t3,1834 <atoi+0x6c>
}
    182e:	8082                	ret
        s++;
    1830:	0505                	addi	a0,a0,1
    1832:	bf71                	j	17ce <atoi+0x6>
    1834:	4113053b          	subw	a0,t1,a7
    1838:	8082                	ret
    while (isdigit(*s))
    183a:	00154783          	lbu	a5,1(a0)
    183e:	4625                	li	a2,9
        s++;
    1840:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1844:	fd07859b          	addiw	a1,a5,-48
    1848:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    184c:	4e01                	li	t3,0
    while (isdigit(*s))
    184e:	fab67ae3          	bgeu	a2,a1,1802 <atoi+0x3a>
    1852:	4501                	li	a0,0
}
    1854:	8082                	ret
    while (isdigit(*s))
    1856:	00154783          	lbu	a5,1(a0)
    185a:	4625                	li	a2,9
        s++;
    185c:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1860:	fd07859b          	addiw	a1,a5,-48
    1864:	0007871b          	sext.w	a4,a5
    1868:	feb665e3          	bltu	a2,a1,1852 <atoi+0x8a>
        neg = 1;
    186c:	4e05                	li	t3,1
    186e:	bf51                	j	1802 <atoi+0x3a>

0000000000001870 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1870:	16060d63          	beqz	a2,19ea <memset+0x17a>
    1874:	40a007b3          	neg	a5,a0
    1878:	8b9d                	andi	a5,a5,7
    187a:	00778713          	addi	a4,a5,7
    187e:	482d                	li	a6,11
    1880:	0ff5f593          	andi	a1,a1,255
    1884:	fff60693          	addi	a3,a2,-1
    1888:	17076263          	bltu	a4,a6,19ec <memset+0x17c>
    188c:	16e6ea63          	bltu	a3,a4,1a00 <memset+0x190>
    1890:	16078563          	beqz	a5,19fa <memset+0x18a>
    1894:	00b50023          	sb	a1,0(a0)
    1898:	4705                	li	a4,1
    189a:	00150e93          	addi	t4,a0,1
    189e:	14e78c63          	beq	a5,a4,19f6 <memset+0x186>
    18a2:	00b500a3          	sb	a1,1(a0)
    18a6:	4709                	li	a4,2
    18a8:	00250e93          	addi	t4,a0,2
    18ac:	14e78d63          	beq	a5,a4,1a06 <memset+0x196>
    18b0:	00b50123          	sb	a1,2(a0)
    18b4:	470d                	li	a4,3
    18b6:	00350e93          	addi	t4,a0,3
    18ba:	12e78b63          	beq	a5,a4,19f0 <memset+0x180>
    18be:	00b501a3          	sb	a1,3(a0)
    18c2:	4711                	li	a4,4
    18c4:	00450e93          	addi	t4,a0,4
    18c8:	14e78163          	beq	a5,a4,1a0a <memset+0x19a>
    18cc:	00b50223          	sb	a1,4(a0)
    18d0:	4715                	li	a4,5
    18d2:	00550e93          	addi	t4,a0,5
    18d6:	12e78c63          	beq	a5,a4,1a0e <memset+0x19e>
    18da:	00b502a3          	sb	a1,5(a0)
    18de:	471d                	li	a4,7
    18e0:	00650e93          	addi	t4,a0,6
    18e4:	12e79763          	bne	a5,a4,1a12 <memset+0x1a2>
    18e8:	00750e93          	addi	t4,a0,7
    18ec:	00b50323          	sb	a1,6(a0)
    18f0:	4f1d                	li	t5,7
    18f2:	00859713          	slli	a4,a1,0x8
    18f6:	8f4d                	or	a4,a4,a1
    18f8:	01059e13          	slli	t3,a1,0x10
    18fc:	01c76e33          	or	t3,a4,t3
    1900:	01859313          	slli	t1,a1,0x18
    1904:	006e6333          	or	t1,t3,t1
    1908:	02059893          	slli	a7,a1,0x20
    190c:	011368b3          	or	a7,t1,a7
    1910:	02859813          	slli	a6,a1,0x28
    1914:	40f60333          	sub	t1,a2,a5
    1918:	0108e833          	or	a6,a7,a6
    191c:	03059693          	slli	a3,a1,0x30
    1920:	00d866b3          	or	a3,a6,a3
    1924:	03859713          	slli	a4,a1,0x38
    1928:	97aa                	add	a5,a5,a0
    192a:	ff837813          	andi	a6,t1,-8
    192e:	8f55                	or	a4,a4,a3
    1930:	00f806b3          	add	a3,a6,a5
    1934:	e398                	sd	a4,0(a5)
    1936:	07a1                	addi	a5,a5,8
    1938:	fed79ee3          	bne	a5,a3,1934 <memset+0xc4>
    193c:	ff837693          	andi	a3,t1,-8
    1940:	00de87b3          	add	a5,t4,a3
    1944:	01e6873b          	addw	a4,a3,t5
    1948:	0ad30663          	beq	t1,a3,19f4 <memset+0x184>
    194c:	00b78023          	sb	a1,0(a5)
    1950:	0017069b          	addiw	a3,a4,1
    1954:	08c6fb63          	bgeu	a3,a2,19ea <memset+0x17a>
    1958:	00b780a3          	sb	a1,1(a5)
    195c:	0027069b          	addiw	a3,a4,2
    1960:	08c6f563          	bgeu	a3,a2,19ea <memset+0x17a>
    1964:	00b78123          	sb	a1,2(a5)
    1968:	0037069b          	addiw	a3,a4,3
    196c:	06c6ff63          	bgeu	a3,a2,19ea <memset+0x17a>
    1970:	00b781a3          	sb	a1,3(a5)
    1974:	0047069b          	addiw	a3,a4,4
    1978:	06c6f963          	bgeu	a3,a2,19ea <memset+0x17a>
    197c:	00b78223          	sb	a1,4(a5)
    1980:	0057069b          	addiw	a3,a4,5
    1984:	06c6f363          	bgeu	a3,a2,19ea <memset+0x17a>
    1988:	00b782a3          	sb	a1,5(a5)
    198c:	0067069b          	addiw	a3,a4,6
    1990:	04c6fd63          	bgeu	a3,a2,19ea <memset+0x17a>
    1994:	00b78323          	sb	a1,6(a5)
    1998:	0077069b          	addiw	a3,a4,7
    199c:	04c6f763          	bgeu	a3,a2,19ea <memset+0x17a>
    19a0:	00b783a3          	sb	a1,7(a5)
    19a4:	0087069b          	addiw	a3,a4,8
    19a8:	04c6f163          	bgeu	a3,a2,19ea <memset+0x17a>
    19ac:	00b78423          	sb	a1,8(a5)
    19b0:	0097069b          	addiw	a3,a4,9
    19b4:	02c6fb63          	bgeu	a3,a2,19ea <memset+0x17a>
    19b8:	00b784a3          	sb	a1,9(a5)
    19bc:	00a7069b          	addiw	a3,a4,10
    19c0:	02c6f563          	bgeu	a3,a2,19ea <memset+0x17a>
    19c4:	00b78523          	sb	a1,10(a5)
    19c8:	00b7069b          	addiw	a3,a4,11
    19cc:	00c6ff63          	bgeu	a3,a2,19ea <memset+0x17a>
    19d0:	00b785a3          	sb	a1,11(a5)
    19d4:	00c7069b          	addiw	a3,a4,12
    19d8:	00c6f963          	bgeu	a3,a2,19ea <memset+0x17a>
    19dc:	00b78623          	sb	a1,12(a5)
    19e0:	2735                	addiw	a4,a4,13
    19e2:	00c77463          	bgeu	a4,a2,19ea <memset+0x17a>
    19e6:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    19ea:	8082                	ret
    19ec:	472d                	li	a4,11
    19ee:	bd79                	j	188c <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    19f0:	4f0d                	li	t5,3
    19f2:	b701                	j	18f2 <memset+0x82>
    19f4:	8082                	ret
    19f6:	4f05                	li	t5,1
    19f8:	bded                	j	18f2 <memset+0x82>
    19fa:	8eaa                	mv	t4,a0
    19fc:	4f01                	li	t5,0
    19fe:	bdd5                	j	18f2 <memset+0x82>
    1a00:	87aa                	mv	a5,a0
    1a02:	4701                	li	a4,0
    1a04:	b7a1                	j	194c <memset+0xdc>
    1a06:	4f09                	li	t5,2
    1a08:	b5ed                	j	18f2 <memset+0x82>
    1a0a:	4f11                	li	t5,4
    1a0c:	b5dd                	j	18f2 <memset+0x82>
    1a0e:	4f15                	li	t5,5
    1a10:	b5cd                	j	18f2 <memset+0x82>
    1a12:	4f19                	li	t5,6
    1a14:	bdf9                	j	18f2 <memset+0x82>

0000000000001a16 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1a16:	00054783          	lbu	a5,0(a0)
    1a1a:	0005c703          	lbu	a4,0(a1)
    1a1e:	00e79863          	bne	a5,a4,1a2e <strcmp+0x18>
    1a22:	0505                	addi	a0,a0,1
    1a24:	0585                	addi	a1,a1,1
    1a26:	fbe5                	bnez	a5,1a16 <strcmp>
    1a28:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1a2a:	9d19                	subw	a0,a0,a4
    1a2c:	8082                	ret
    1a2e:	0007851b          	sext.w	a0,a5
    1a32:	bfe5                	j	1a2a <strcmp+0x14>

0000000000001a34 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1a34:	ce05                	beqz	a2,1a6c <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1a36:	00054703          	lbu	a4,0(a0)
    1a3a:	0005c783          	lbu	a5,0(a1)
    1a3e:	cb0d                	beqz	a4,1a70 <strncmp+0x3c>
    if (!n--)
    1a40:	167d                	addi	a2,a2,-1
    1a42:	00c506b3          	add	a3,a0,a2
    1a46:	a819                	j	1a5c <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1a48:	00a68e63          	beq	a3,a0,1a64 <strncmp+0x30>
    1a4c:	0505                	addi	a0,a0,1
    1a4e:	00e79b63          	bne	a5,a4,1a64 <strncmp+0x30>
    1a52:	00054703          	lbu	a4,0(a0)
    1a56:	0005c783          	lbu	a5,0(a1)
    1a5a:	cb19                	beqz	a4,1a70 <strncmp+0x3c>
    1a5c:	0005c783          	lbu	a5,0(a1)
    1a60:	0585                	addi	a1,a1,1
    1a62:	f3fd                	bnez	a5,1a48 <strncmp+0x14>
        ;
    return *l - *r;
    1a64:	0007051b          	sext.w	a0,a4
    1a68:	9d1d                	subw	a0,a0,a5
    1a6a:	8082                	ret
        return 0;
    1a6c:	4501                	li	a0,0
}
    1a6e:	8082                	ret
    1a70:	4501                	li	a0,0
    return *l - *r;
    1a72:	9d1d                	subw	a0,a0,a5
    1a74:	8082                	ret

0000000000001a76 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1a76:	00757793          	andi	a5,a0,7
    1a7a:	cf89                	beqz	a5,1a94 <strlen+0x1e>
    1a7c:	87aa                	mv	a5,a0
    1a7e:	a029                	j	1a88 <strlen+0x12>
    1a80:	0785                	addi	a5,a5,1
    1a82:	0077f713          	andi	a4,a5,7
    1a86:	cb01                	beqz	a4,1a96 <strlen+0x20>
        if (!*s)
    1a88:	0007c703          	lbu	a4,0(a5)
    1a8c:	fb75                	bnez	a4,1a80 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1a8e:	40a78533          	sub	a0,a5,a0
}
    1a92:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1a94:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1a96:	6394                	ld	a3,0(a5)
    1a98:	00000597          	auipc	a1,0x0
    1a9c:	5885b583          	ld	a1,1416(a1) # 2020 <BUF_LEN+0x4>
    1aa0:	00000617          	auipc	a2,0x0
    1aa4:	58863603          	ld	a2,1416(a2) # 2028 <BUF_LEN+0xc>
    1aa8:	a019                	j	1aae <strlen+0x38>
    1aaa:	6794                	ld	a3,8(a5)
    1aac:	07a1                	addi	a5,a5,8
    1aae:	00b68733          	add	a4,a3,a1
    1ab2:	fff6c693          	not	a3,a3
    1ab6:	8f75                	and	a4,a4,a3
    1ab8:	8f71                	and	a4,a4,a2
    1aba:	db65                	beqz	a4,1aaa <strlen+0x34>
    for (; *s; s++)
    1abc:	0007c703          	lbu	a4,0(a5)
    1ac0:	d779                	beqz	a4,1a8e <strlen+0x18>
    1ac2:	0017c703          	lbu	a4,1(a5)
    1ac6:	0785                	addi	a5,a5,1
    1ac8:	d379                	beqz	a4,1a8e <strlen+0x18>
    1aca:	0017c703          	lbu	a4,1(a5)
    1ace:	0785                	addi	a5,a5,1
    1ad0:	fb6d                	bnez	a4,1ac2 <strlen+0x4c>
    1ad2:	bf75                	j	1a8e <strlen+0x18>

0000000000001ad4 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1ad4:	00757713          	andi	a4,a0,7
{
    1ad8:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1ada:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1ade:	cb19                	beqz	a4,1af4 <memchr+0x20>
    1ae0:	ce25                	beqz	a2,1b58 <memchr+0x84>
    1ae2:	0007c703          	lbu	a4,0(a5)
    1ae6:	04b70e63          	beq	a4,a1,1b42 <memchr+0x6e>
    1aea:	0785                	addi	a5,a5,1
    1aec:	0077f713          	andi	a4,a5,7
    1af0:	167d                	addi	a2,a2,-1
    1af2:	f77d                	bnez	a4,1ae0 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1af4:	4501                	li	a0,0
    if (n && *s != c)
    1af6:	c235                	beqz	a2,1b5a <memchr+0x86>
    1af8:	0007c703          	lbu	a4,0(a5)
    1afc:	04b70363          	beq	a4,a1,1b42 <memchr+0x6e>
        size_t k = ONES * c;
    1b00:	00000517          	auipc	a0,0x0
    1b04:	53053503          	ld	a0,1328(a0) # 2030 <BUF_LEN+0x14>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1b08:	471d                	li	a4,7
        size_t k = ONES * c;
    1b0a:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1b0e:	02c77a63          	bgeu	a4,a2,1b42 <memchr+0x6e>
    1b12:	00000897          	auipc	a7,0x0
    1b16:	50e8b883          	ld	a7,1294(a7) # 2020 <BUF_LEN+0x4>
    1b1a:	00000817          	auipc	a6,0x0
    1b1e:	50e83803          	ld	a6,1294(a6) # 2028 <BUF_LEN+0xc>
    1b22:	431d                	li	t1,7
    1b24:	a029                	j	1b2e <memchr+0x5a>
    1b26:	1661                	addi	a2,a2,-8
    1b28:	07a1                	addi	a5,a5,8
    1b2a:	02c37963          	bgeu	t1,a2,1b5c <memchr+0x88>
    1b2e:	6398                	ld	a4,0(a5)
    1b30:	8f29                	xor	a4,a4,a0
    1b32:	011706b3          	add	a3,a4,a7
    1b36:	fff74713          	not	a4,a4
    1b3a:	8f75                	and	a4,a4,a3
    1b3c:	01077733          	and	a4,a4,a6
    1b40:	d37d                	beqz	a4,1b26 <memchr+0x52>
    1b42:	853e                	mv	a0,a5
    1b44:	97b2                	add	a5,a5,a2
    1b46:	a021                	j	1b4e <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1b48:	0505                	addi	a0,a0,1
    1b4a:	00f50763          	beq	a0,a5,1b58 <memchr+0x84>
    1b4e:	00054703          	lbu	a4,0(a0)
    1b52:	feb71be3          	bne	a4,a1,1b48 <memchr+0x74>
    1b56:	8082                	ret
    return n ? (void *)s : 0;
    1b58:	4501                	li	a0,0
}
    1b5a:	8082                	ret
    return n ? (void *)s : 0;
    1b5c:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1b5e:	f275                	bnez	a2,1b42 <memchr+0x6e>
}
    1b60:	8082                	ret

0000000000001b62 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1b62:	1101                	addi	sp,sp,-32
    1b64:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1b66:	862e                	mv	a2,a1
{
    1b68:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1b6a:	4581                	li	a1,0
{
    1b6c:	e426                	sd	s1,8(sp)
    1b6e:	ec06                	sd	ra,24(sp)
    1b70:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1b72:	f63ff0ef          	jal	ra,1ad4 <memchr>
    return p ? p - s : n;
    1b76:	c519                	beqz	a0,1b84 <strnlen+0x22>
}
    1b78:	60e2                	ld	ra,24(sp)
    1b7a:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1b7c:	8d05                	sub	a0,a0,s1
}
    1b7e:	64a2                	ld	s1,8(sp)
    1b80:	6105                	addi	sp,sp,32
    1b82:	8082                	ret
    1b84:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1b86:	8522                	mv	a0,s0
}
    1b88:	6442                	ld	s0,16(sp)
    1b8a:	64a2                	ld	s1,8(sp)
    1b8c:	6105                	addi	sp,sp,32
    1b8e:	8082                	ret

0000000000001b90 <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1b90:	00b547b3          	xor	a5,a0,a1
    1b94:	8b9d                	andi	a5,a5,7
    1b96:	eb95                	bnez	a5,1bca <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1b98:	0075f793          	andi	a5,a1,7
    1b9c:	e7b1                	bnez	a5,1be8 <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1b9e:	6198                	ld	a4,0(a1)
    1ba0:	00000617          	auipc	a2,0x0
    1ba4:	48063603          	ld	a2,1152(a2) # 2020 <BUF_LEN+0x4>
    1ba8:	00000817          	auipc	a6,0x0
    1bac:	48083803          	ld	a6,1152(a6) # 2028 <BUF_LEN+0xc>
    1bb0:	a029                	j	1bba <stpcpy+0x2a>
    1bb2:	e118                	sd	a4,0(a0)
    1bb4:	6598                	ld	a4,8(a1)
    1bb6:	05a1                	addi	a1,a1,8
    1bb8:	0521                	addi	a0,a0,8
    1bba:	00c707b3          	add	a5,a4,a2
    1bbe:	fff74693          	not	a3,a4
    1bc2:	8ff5                	and	a5,a5,a3
    1bc4:	0107f7b3          	and	a5,a5,a6
    1bc8:	d7ed                	beqz	a5,1bb2 <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1bca:	0005c783          	lbu	a5,0(a1)
    1bce:	00f50023          	sb	a5,0(a0)
    1bd2:	c785                	beqz	a5,1bfa <stpcpy+0x6a>
    1bd4:	0015c783          	lbu	a5,1(a1)
    1bd8:	0505                	addi	a0,a0,1
    1bda:	0585                	addi	a1,a1,1
    1bdc:	00f50023          	sb	a5,0(a0)
    1be0:	fbf5                	bnez	a5,1bd4 <stpcpy+0x44>
        ;
    return d;
}
    1be2:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1be4:	0505                	addi	a0,a0,1
    1be6:	df45                	beqz	a4,1b9e <stpcpy+0xe>
            if (!(*d = *s))
    1be8:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1bec:	0585                	addi	a1,a1,1
    1bee:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1bf2:	00f50023          	sb	a5,0(a0)
    1bf6:	f7fd                	bnez	a5,1be4 <stpcpy+0x54>
}
    1bf8:	8082                	ret
    1bfa:	8082                	ret

0000000000001bfc <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1bfc:	00b547b3          	xor	a5,a0,a1
    1c00:	8b9d                	andi	a5,a5,7
    1c02:	1a079863          	bnez	a5,1db2 <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1c06:	0075f793          	andi	a5,a1,7
    1c0a:	16078463          	beqz	a5,1d72 <stpncpy+0x176>
    1c0e:	ea01                	bnez	a2,1c1e <stpncpy+0x22>
    1c10:	a421                	j	1e18 <stpncpy+0x21c>
    1c12:	167d                	addi	a2,a2,-1
    1c14:	0505                	addi	a0,a0,1
    1c16:	14070e63          	beqz	a4,1d72 <stpncpy+0x176>
    1c1a:	1a060863          	beqz	a2,1dca <stpncpy+0x1ce>
    1c1e:	0005c783          	lbu	a5,0(a1)
    1c22:	0585                	addi	a1,a1,1
    1c24:	0075f713          	andi	a4,a1,7
    1c28:	00f50023          	sb	a5,0(a0)
    1c2c:	f3fd                	bnez	a5,1c12 <stpncpy+0x16>
    1c2e:	4805                	li	a6,1
    1c30:	1a061863          	bnez	a2,1de0 <stpncpy+0x1e4>
    1c34:	40a007b3          	neg	a5,a0
    1c38:	8b9d                	andi	a5,a5,7
    1c3a:	4681                	li	a3,0
    1c3c:	18061a63          	bnez	a2,1dd0 <stpncpy+0x1d4>
    1c40:	00778713          	addi	a4,a5,7
    1c44:	45ad                	li	a1,11
    1c46:	18b76363          	bltu	a4,a1,1dcc <stpncpy+0x1d0>
    1c4a:	1ae6eb63          	bltu	a3,a4,1e00 <stpncpy+0x204>
    1c4e:	1a078363          	beqz	a5,1df4 <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c52:	00050023          	sb	zero,0(a0)
    1c56:	4685                	li	a3,1
    1c58:	00150713          	addi	a4,a0,1
    1c5c:	18d78f63          	beq	a5,a3,1dfa <stpncpy+0x1fe>
    1c60:	000500a3          	sb	zero,1(a0)
    1c64:	4689                	li	a3,2
    1c66:	00250713          	addi	a4,a0,2
    1c6a:	18d78e63          	beq	a5,a3,1e06 <stpncpy+0x20a>
    1c6e:	00050123          	sb	zero,2(a0)
    1c72:	468d                	li	a3,3
    1c74:	00350713          	addi	a4,a0,3
    1c78:	16d78c63          	beq	a5,a3,1df0 <stpncpy+0x1f4>
    1c7c:	000501a3          	sb	zero,3(a0)
    1c80:	4691                	li	a3,4
    1c82:	00450713          	addi	a4,a0,4
    1c86:	18d78263          	beq	a5,a3,1e0a <stpncpy+0x20e>
    1c8a:	00050223          	sb	zero,4(a0)
    1c8e:	4695                	li	a3,5
    1c90:	00550713          	addi	a4,a0,5
    1c94:	16d78d63          	beq	a5,a3,1e0e <stpncpy+0x212>
    1c98:	000502a3          	sb	zero,5(a0)
    1c9c:	469d                	li	a3,7
    1c9e:	00650713          	addi	a4,a0,6
    1ca2:	16d79863          	bne	a5,a3,1e12 <stpncpy+0x216>
    1ca6:	00750713          	addi	a4,a0,7
    1caa:	00050323          	sb	zero,6(a0)
    1cae:	40f80833          	sub	a6,a6,a5
    1cb2:	ff887593          	andi	a1,a6,-8
    1cb6:	97aa                	add	a5,a5,a0
    1cb8:	95be                	add	a1,a1,a5
    1cba:	0007b023          	sd	zero,0(a5)
    1cbe:	07a1                	addi	a5,a5,8
    1cc0:	feb79de3          	bne	a5,a1,1cba <stpncpy+0xbe>
    1cc4:	ff887593          	andi	a1,a6,-8
    1cc8:	9ead                	addw	a3,a3,a1
    1cca:	00b707b3          	add	a5,a4,a1
    1cce:	12b80863          	beq	a6,a1,1dfe <stpncpy+0x202>
    1cd2:	00078023          	sb	zero,0(a5)
    1cd6:	0016871b          	addiw	a4,a3,1
    1cda:	0ec77863          	bgeu	a4,a2,1dca <stpncpy+0x1ce>
    1cde:	000780a3          	sb	zero,1(a5)
    1ce2:	0026871b          	addiw	a4,a3,2
    1ce6:	0ec77263          	bgeu	a4,a2,1dca <stpncpy+0x1ce>
    1cea:	00078123          	sb	zero,2(a5)
    1cee:	0036871b          	addiw	a4,a3,3
    1cf2:	0cc77c63          	bgeu	a4,a2,1dca <stpncpy+0x1ce>
    1cf6:	000781a3          	sb	zero,3(a5)
    1cfa:	0046871b          	addiw	a4,a3,4
    1cfe:	0cc77663          	bgeu	a4,a2,1dca <stpncpy+0x1ce>
    1d02:	00078223          	sb	zero,4(a5)
    1d06:	0056871b          	addiw	a4,a3,5
    1d0a:	0cc77063          	bgeu	a4,a2,1dca <stpncpy+0x1ce>
    1d0e:	000782a3          	sb	zero,5(a5)
    1d12:	0066871b          	addiw	a4,a3,6
    1d16:	0ac77a63          	bgeu	a4,a2,1dca <stpncpy+0x1ce>
    1d1a:	00078323          	sb	zero,6(a5)
    1d1e:	0076871b          	addiw	a4,a3,7
    1d22:	0ac77463          	bgeu	a4,a2,1dca <stpncpy+0x1ce>
    1d26:	000783a3          	sb	zero,7(a5)
    1d2a:	0086871b          	addiw	a4,a3,8
    1d2e:	08c77e63          	bgeu	a4,a2,1dca <stpncpy+0x1ce>
    1d32:	00078423          	sb	zero,8(a5)
    1d36:	0096871b          	addiw	a4,a3,9
    1d3a:	08c77863          	bgeu	a4,a2,1dca <stpncpy+0x1ce>
    1d3e:	000784a3          	sb	zero,9(a5)
    1d42:	00a6871b          	addiw	a4,a3,10
    1d46:	08c77263          	bgeu	a4,a2,1dca <stpncpy+0x1ce>
    1d4a:	00078523          	sb	zero,10(a5)
    1d4e:	00b6871b          	addiw	a4,a3,11
    1d52:	06c77c63          	bgeu	a4,a2,1dca <stpncpy+0x1ce>
    1d56:	000785a3          	sb	zero,11(a5)
    1d5a:	00c6871b          	addiw	a4,a3,12
    1d5e:	06c77663          	bgeu	a4,a2,1dca <stpncpy+0x1ce>
    1d62:	00078623          	sb	zero,12(a5)
    1d66:	26b5                	addiw	a3,a3,13
    1d68:	06c6f163          	bgeu	a3,a2,1dca <stpncpy+0x1ce>
    1d6c:	000786a3          	sb	zero,13(a5)
    1d70:	8082                	ret
            ;
        if (!n || !*s)
    1d72:	c645                	beqz	a2,1e1a <stpncpy+0x21e>
    1d74:	0005c783          	lbu	a5,0(a1)
    1d78:	ea078be3          	beqz	a5,1c2e <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d7c:	479d                	li	a5,7
    1d7e:	02c7ff63          	bgeu	a5,a2,1dbc <stpncpy+0x1c0>
    1d82:	00000897          	auipc	a7,0x0
    1d86:	29e8b883          	ld	a7,670(a7) # 2020 <BUF_LEN+0x4>
    1d8a:	00000817          	auipc	a6,0x0
    1d8e:	29e83803          	ld	a6,670(a6) # 2028 <BUF_LEN+0xc>
    1d92:	431d                	li	t1,7
    1d94:	6198                	ld	a4,0(a1)
    1d96:	011707b3          	add	a5,a4,a7
    1d9a:	fff74693          	not	a3,a4
    1d9e:	8ff5                	and	a5,a5,a3
    1da0:	0107f7b3          	and	a5,a5,a6
    1da4:	ef81                	bnez	a5,1dbc <stpncpy+0x1c0>
            *wd = *ws;
    1da6:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1da8:	1661                	addi	a2,a2,-8
    1daa:	05a1                	addi	a1,a1,8
    1dac:	0521                	addi	a0,a0,8
    1dae:	fec363e3          	bltu	t1,a2,1d94 <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1db2:	e609                	bnez	a2,1dbc <stpncpy+0x1c0>
    1db4:	a08d                	j	1e16 <stpncpy+0x21a>
    1db6:	167d                	addi	a2,a2,-1
    1db8:	0505                	addi	a0,a0,1
    1dba:	ca01                	beqz	a2,1dca <stpncpy+0x1ce>
    1dbc:	0005c783          	lbu	a5,0(a1)
    1dc0:	0585                	addi	a1,a1,1
    1dc2:	00f50023          	sb	a5,0(a0)
    1dc6:	fbe5                	bnez	a5,1db6 <stpncpy+0x1ba>
        ;
tail:
    1dc8:	b59d                	j	1c2e <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1dca:	8082                	ret
    1dcc:	472d                	li	a4,11
    1dce:	bdb5                	j	1c4a <stpncpy+0x4e>
    1dd0:	00778713          	addi	a4,a5,7
    1dd4:	45ad                	li	a1,11
    1dd6:	fff60693          	addi	a3,a2,-1
    1dda:	e6b778e3          	bgeu	a4,a1,1c4a <stpncpy+0x4e>
    1dde:	b7fd                	j	1dcc <stpncpy+0x1d0>
    1de0:	40a007b3          	neg	a5,a0
    1de4:	8832                	mv	a6,a2
    1de6:	8b9d                	andi	a5,a5,7
    1de8:	4681                	li	a3,0
    1dea:	e4060be3          	beqz	a2,1c40 <stpncpy+0x44>
    1dee:	b7cd                	j	1dd0 <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1df0:	468d                	li	a3,3
    1df2:	bd75                	j	1cae <stpncpy+0xb2>
    1df4:	872a                	mv	a4,a0
    1df6:	4681                	li	a3,0
    1df8:	bd5d                	j	1cae <stpncpy+0xb2>
    1dfa:	4685                	li	a3,1
    1dfc:	bd4d                	j	1cae <stpncpy+0xb2>
    1dfe:	8082                	ret
    1e00:	87aa                	mv	a5,a0
    1e02:	4681                	li	a3,0
    1e04:	b5f9                	j	1cd2 <stpncpy+0xd6>
    1e06:	4689                	li	a3,2
    1e08:	b55d                	j	1cae <stpncpy+0xb2>
    1e0a:	4691                	li	a3,4
    1e0c:	b54d                	j	1cae <stpncpy+0xb2>
    1e0e:	4695                	li	a3,5
    1e10:	bd79                	j	1cae <stpncpy+0xb2>
    1e12:	4699                	li	a3,6
    1e14:	bd69                	j	1cae <stpncpy+0xb2>
    1e16:	8082                	ret
    1e18:	8082                	ret
    1e1a:	8082                	ret

0000000000001e1c <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1e1c:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1e20:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e22:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1e26:	2501                	sext.w	a0,a0
    1e28:	8082                	ret

0000000000001e2a <close>:
    register long a7 __asm__("a7") = n;
    1e2a:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1e2e:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <read>:
    register long a7 __asm__("a7") = n;
    1e36:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e3a:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1e3e:	8082                	ret

0000000000001e40 <write>:
    register long a7 __asm__("a7") = n;
    1e40:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e44:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1e48:	8082                	ret

0000000000001e4a <getpid>:
    register long a7 __asm__("a7") = n;
    1e4a:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1e4e:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1e52:	2501                	sext.w	a0,a0
    1e54:	8082                	ret

0000000000001e56 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1e56:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1e5a:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <fork>:
    register long a7 __asm__("a7") = n;
    1e62:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1e66:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1e6a:	2501                	sext.w	a0,a0
    1e6c:	8082                	ret

0000000000001e6e <exit>:
    register long a7 __asm__("a7") = n;
    1e6e:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e72:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e76:	8082                	ret

0000000000001e78 <waitpid>:
    register long a7 __asm__("a7") = n;
    1e78:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e7c:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1e80:	2501                	sext.w	a0,a0
    1e82:	8082                	ret

0000000000001e84 <exec>:
    register long a7 __asm__("a7") = n;
    1e84:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e88:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e8c:	2501                	sext.w	a0,a0
    1e8e:	8082                	ret

0000000000001e90 <get_time>:

int64 get_time()
{
    1e90:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e92:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e96:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e98:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e9a:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e9e:	2501                	sext.w	a0,a0
    1ea0:	ed09                	bnez	a0,1eba <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ea2:	67a2                	ld	a5,8(sp)
    1ea4:	3e800713          	li	a4,1000
    1ea8:	00015503          	lhu	a0,0(sp)
    1eac:	02e7d7b3          	divu	a5,a5,a4
    1eb0:	02e50533          	mul	a0,a0,a4
    1eb4:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1eb6:	0141                	addi	sp,sp,16
    1eb8:	8082                	ret
        return -1;
    1eba:	557d                	li	a0,-1
    1ebc:	bfed                	j	1eb6 <get_time+0x26>

0000000000001ebe <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1ebe:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec2:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1ec6:	2501                	sext.w	a0,a0
    1ec8:	8082                	ret

0000000000001eca <sleep>:

int sleep(unsigned long long time)
{
    1eca:	1141                	addi	sp,sp,-16
    1ecc:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1ece:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ed2:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ed4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed6:	00000073          	ecall
    if (err == 0)
    1eda:	2501                	sext.w	a0,a0
    1edc:	e13d                	bnez	a0,1f42 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ede:	6722                	ld	a4,8(sp)
    1ee0:	3e800693          	li	a3,1000
    1ee4:	00015783          	lhu	a5,0(sp)
    1ee8:	02d75733          	divu	a4,a4,a3
    1eec:	02d787b3          	mul	a5,a5,a3
    1ef0:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1ef2:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ef6:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ef8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1efa:	00000073          	ecall
    if (err == 0)
    1efe:	2501                	sext.w	a0,a0
    1f00:	ed15                	bnez	a0,1f3c <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1f02:	6841                	lui	a6,0x10
    1f04:	963e                	add	a2,a2,a5
    1f06:	187d                	addi	a6,a6,-1
    1f08:	3e800693          	li	a3,1000
    1f0c:	a819                	j	1f22 <sleep+0x58>
    __asm_syscall("r"(a7))
    1f0e:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1f12:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1f16:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1f18:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f1a:	00000073          	ecall
    if (err == 0)
    1f1e:	2501                	sext.w	a0,a0
    1f20:	ed11                	bnez	a0,1f3c <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1f22:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1f24:	07c00893          	li	a7,124
    1f28:	02d7d733          	divu	a4,a5,a3
    1f2c:	6782                	ld	a5,0(sp)
    1f2e:	0107f7b3          	and	a5,a5,a6
    1f32:	02d787b3          	mul	a5,a5,a3
    1f36:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1f38:	fcc7ebe3          	bltu	a5,a2,1f0e <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1f3c:	4501                	li	a0,0
    1f3e:	0141                	addi	sp,sp,16
    1f40:	8082                	ret
    1f42:	57fd                	li	a5,-1
    1f44:	b77d                	j	1ef2 <sleep+0x28>

0000000000001f46 <set_priority>:
    register long a7 __asm__("a7") = n;
    1f46:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1f4a:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1f4e:	2501                	sext.w	a0,a0
    1f50:	8082                	ret

0000000000001f52 <mmap>:
    register long a7 __asm__("a7") = n;
    1f52:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f56:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1f5a:	2501                	sext.w	a0,a0
    1f5c:	8082                	ret

0000000000001f5e <munmap>:
    register long a7 __asm__("a7") = n;
    1f5e:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f62:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1f66:	2501                	sext.w	a0,a0
    1f68:	8082                	ret

0000000000001f6a <wait>:

int wait(int *code)
{
    1f6a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f6c:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1f70:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f72:	00000073          	ecall
    return waitpid(-1, code);
}
    1f76:	2501                	sext.w	a0,a0
    1f78:	8082                	ret

0000000000001f7a <spawn>:
    register long a7 __asm__("a7") = n;
    1f7a:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1f7e:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f82:	2501                	sext.w	a0,a0
    1f84:	8082                	ret

0000000000001f86 <mailread>:
    register long a7 __asm__("a7") = n;
    1f86:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f8a:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f8e:	2501                	sext.w	a0,a0
    1f90:	8082                	ret

0000000000001f92 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f92:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f96:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f9a:	2501                	sext.w	a0,a0
    1f9c:	8082                	ret

0000000000001f9e <fstat>:
    register long a7 __asm__("a7") = n;
    1f9e:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fa2:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1fa6:	2501                	sext.w	a0,a0
    1fa8:	8082                	ret

0000000000001faa <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1faa:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1fac:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1fb0:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fb2:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1fb6:	2501                	sext.w	a0,a0
    1fb8:	8082                	ret

0000000000001fba <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1fba:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1fbc:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1fc0:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fc2:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1fc6:	2501                	sext.w	a0,a0
    1fc8:	8082                	ret

0000000000001fca <link>:

int link(char *old_path, char *new_path)
{
    1fca:	87aa                	mv	a5,a0
    1fcc:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1fce:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1fd2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1fd6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1fd8:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1fdc:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fde:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1fe2:	2501                	sext.w	a0,a0
    1fe4:	8082                	ret

0000000000001fe6 <unlink>:

int unlink(char *path)
{
    1fe6:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1fe8:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1fec:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1ff0:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ff2:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1ff6:	2501                	sext.w	a0,a0
    1ff8:	8082                	ret
