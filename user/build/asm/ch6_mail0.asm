
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch6_mail0:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0ec0006f          	j	10ee <__start_main>

0000000000001006 <main>:
const int BUF_LEN = 256;

/// 测试邮箱基本功能，输出　mail0 test OK! 就算正确。

int main()
{
    1006:	7129                	addi	sp,sp,-320
    1008:	fe06                	sd	ra,312(sp)
    100a:	fa22                	sd	s0,304(sp)
    100c:	f626                	sd	s1,296(sp)
    100e:	0280                	addi	s0,sp,320
    int pid = getpid();
    1010:	64f000ef          	jal	ra,1e5e <getpid>
    1014:	84aa                	mv	s1,a0
    char buffer0[27];
    memset(buffer0, 'a', sizeof(buffer0));
    1016:	466d                	li	a2,27
    1018:	06100593          	li	a1,97
    101c:	ec040513          	addi	a0,s0,-320
    1020:	065000ef          	jal	ra,1884 <memset>
    assert(mailwrite(pid, buffer0, sizeof(buffer0)) == sizeof(buffer0));
    1024:	466d                	li	a2,27
    1026:	ec040593          	addi	a1,s0,-320
    102a:	8526                	mv	a0,s1
    102c:	77b000ef          	jal	ra,1fa6 <mailwrite>
    1030:	47ed                	li	a5,27
    1032:	00f50563          	beq	a0,a5,103c <main+0x36>
    1036:	557d                	li	a0,-1
    1038:	64b000ef          	jal	ra,1e82 <exit>
    char buffer1[BUF_LEN + 1];
    103c:	716d                	addi	sp,sp,-272
    memset(buffer1, 'b', sizeof(buffer1));
    103e:	10100613          	li	a2,257
    1042:	06200593          	li	a1,98
    1046:	850a                	mv	a0,sp
    1048:	03d000ef          	jal	ra,1884 <memset>
    assert(mailwrite(pid, buffer1, BUF_LEN + 1) == BUF_LEN);
    104c:	8526                	mv	a0,s1
    104e:	10100613          	li	a2,257
    1052:	858a                	mv	a1,sp
    1054:	753000ef          	jal	ra,1fa6 <mailwrite>
    1058:	10000793          	li	a5,256
    char buffer1[BUF_LEN + 1];
    105c:	848a                	mv	s1,sp
    assert(mailwrite(pid, buffer1, BUF_LEN + 1) == BUF_LEN);
    105e:	00f50563          	beq	a0,a5,1068 <main+0x62>
    1062:	557d                	li	a0,-1
    1064:	61f000ef          	jal	ra,1e82 <exit>
    char buf[BUF_LEN];
    memset(buf, 0, sizeof(buf));
    1068:	10000613          	li	a2,256
    106c:	4581                	li	a1,0
    106e:	ee040513          	addi	a0,s0,-288
    1072:	013000ef          	jal	ra,1884 <memset>
    assert(mailread(buf, BUF_LEN) == sizeof(buffer0));
    1076:	10000593          	li	a1,256
    107a:	ee040513          	addi	a0,s0,-288
    107e:	71d000ef          	jal	ra,1f9a <mailread>
    1082:	47ed                	li	a5,27
    1084:	00f50563          	beq	a0,a5,108e <main+0x88>
    1088:	557d                	li	a0,-1
    108a:	5f9000ef          	jal	ra,1e82 <exit>
    assert(strncmp(buf, buffer0, sizeof(buffer0)) == 0);
    108e:	466d                	li	a2,27
    1090:	ec040593          	addi	a1,s0,-320
    1094:	ee040513          	addi	a0,s0,-288
    1098:	1b1000ef          	jal	ra,1a48 <strncmp>
    109c:	e129                	bnez	a0,10de <main+0xd8>
    assert(mailread(buf, 27) == 27);
    109e:	45ed                	li	a1,27
    10a0:	ee040513          	addi	a0,s0,-288
    10a4:	6f7000ef          	jal	ra,1f9a <mailread>
    10a8:	47ed                	li	a5,27
    10aa:	00f50563          	beq	a0,a5,10b4 <main+0xae>
    10ae:	557d                	li	a0,-1
    10b0:	5d3000ef          	jal	ra,1e82 <exit>
    assert(strncmp(buf, buffer1, 27) == 0);
    10b4:	466d                	li	a2,27
    10b6:	85a6                	mv	a1,s1
    10b8:	ee040513          	addi	a0,s0,-288
    10bc:	18d000ef          	jal	ra,1a48 <strncmp>
    10c0:	e11d                	bnez	a0,10e6 <main+0xe0>
    puts("mail0 test OK!");
    10c2:	00001517          	auipc	a0,0x1
    10c6:	f4e50513          	addi	a0,a0,-178 # 2010 <unlink+0x16>
    10ca:	074000ef          	jal	ra,113e <puts>
    return 0;
    10ce:	ec040113          	addi	sp,s0,-320
    10d2:	70f2                	ld	ra,312(sp)
    10d4:	7452                	ld	s0,304(sp)
    10d6:	74b2                	ld	s1,296(sp)
    10d8:	4501                	li	a0,0
    10da:	6131                	addi	sp,sp,320
    10dc:	8082                	ret
    assert(strncmp(buf, buffer0, sizeof(buffer0)) == 0);
    10de:	557d                	li	a0,-1
    10e0:	5a3000ef          	jal	ra,1e82 <exit>
    10e4:	bf6d                	j	109e <main+0x98>
    assert(strncmp(buf, buffer1, 27) == 0);
    10e6:	557d                	li	a0,-1
    10e8:	59b000ef          	jal	ra,1e82 <exit>
    10ec:	bfd9                	j	10c2 <main+0xbc>

00000000000010ee <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ee:	1141                	addi	sp,sp,-16
    10f0:	e406                	sd	ra,8(sp)
    exit(main());
    10f2:	f15ff0ef          	jal	ra,1006 <main>
    10f6:	58d000ef          	jal	ra,1e82 <exit>
    return 0;
}
    10fa:	60a2                	ld	ra,8(sp)
    10fc:	4501                	li	a0,0
    10fe:	0141                	addi	sp,sp,16
    1100:	8082                	ret

0000000000001102 <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    1102:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    1104:	00f10593          	addi	a1,sp,15
    1108:	4605                	li	a2,1
    110a:	4501                	li	a0,0
{
    110c:	ec06                	sd	ra,24(sp)
    char byte = 0;
    110e:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1112:	539000ef          	jal	ra,1e4a <read>
    return byte;
}
    1116:	60e2                	ld	ra,24(sp)
    1118:	00f14503          	lbu	a0,15(sp)
    111c:	6105                	addi	sp,sp,32
    111e:	8082                	ret

0000000000001120 <putchar>:

int putchar(int c)
{
    1120:	1101                	addi	sp,sp,-32
    1122:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    1124:	00f10593          	addi	a1,sp,15
    1128:	4605                	li	a2,1
    112a:	4505                	li	a0,1
{
    112c:	ec06                	sd	ra,24(sp)
    char byte = c;
    112e:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1132:	523000ef          	jal	ra,1e54 <write>
}
    1136:	60e2                	ld	ra,24(sp)
    1138:	2501                	sext.w	a0,a0
    113a:	6105                	addi	sp,sp,32
    113c:	8082                	ret

000000000000113e <puts>:

int puts(const char *s)
{
    113e:	1101                	addi	sp,sp,-32
    1140:	e822                	sd	s0,16(sp)
    1142:	ec06                	sd	ra,24(sp)
    1144:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    1146:	145000ef          	jal	ra,1a8a <strlen>
    114a:	862a                	mv	a2,a0
    114c:	85a2                	mv	a1,s0
    114e:	4505                	li	a0,1
    1150:	505000ef          	jal	ra,1e54 <write>
    1154:	00055763          	bgez	a0,1162 <puts+0x24>
    return r;
}
    1158:	60e2                	ld	ra,24(sp)
    115a:	6442                	ld	s0,16(sp)
    115c:	557d                	li	a0,-1
    115e:	6105                	addi	sp,sp,32
    1160:	8082                	ret
    return write(stdout, &byte, 1);
    1162:	00f10593          	addi	a1,sp,15
    char byte = c;
    1166:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    1168:	4605                	li	a2,1
    116a:	4505                	li	a0,1
    char byte = c;
    116c:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1170:	4e5000ef          	jal	ra,1e54 <write>
}
    1174:	60e2                	ld	ra,24(sp)
    1176:	6442                	ld	s0,16(sp)
    1178:	41f5551b          	sraiw	a0,a0,0x1f
    117c:	6105                	addi	sp,sp,32
    117e:	8082                	ret

0000000000001180 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1180:	7131                	addi	sp,sp,-192
    1182:	ecce                	sd	s3,88(sp)
    1184:	e8d2                	sd	s4,80(sp)
    1186:	e4d6                	sd	s5,72(sp)
    1188:	e0da                	sd	s6,64(sp)
    118a:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    118c:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    118e:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    1190:	6ae1                	lui	s5,0x18
    1192:	000f4a37          	lui	s4,0xf4
    1196:	00989b37          	lui	s6,0x989
{
    119a:	fc86                	sd	ra,120(sp)
    119c:	f8a2                	sd	s0,112(sp)
    119e:	f4a6                	sd	s1,104(sp)
    11a0:	f0ca                	sd	s2,96(sp)
    11a2:	fc5e                	sd	s7,56(sp)
    11a4:	e52e                	sd	a1,136(sp)
    11a6:	e932                	sd	a2,144(sp)
    11a8:	ed36                	sd	a3,152(sp)
    11aa:	f13a                	sd	a4,160(sp)
    11ac:	f942                	sd	a6,176(sp)
    11ae:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    11b0:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    11b2:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x6c7>
    11b6:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x16657>
    11ba:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf21f7>
    11be:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x987637>
    for (;;)
    {
        if (!*s)
    11c2:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    11c6:	02500913          	li	s2,37
        if (!*s)
    11ca:	1a078f63          	beqz	a5,1388 <printf+0x208>
    11ce:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    11d0:	17278e63          	beq	a5,s2,134c <printf+0x1cc>
    11d4:	00164783          	lbu	a5,1(a2)
    11d8:	0605                	addi	a2,a2,1
    11da:	fbfd                	bnez	a5,11d0 <printf+0x50>
    11dc:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    11de:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    11e2:	85aa                	mv	a1,a0
    11e4:	8622                	mv	a2,s0
    11e6:	4505                	li	a0,1
    11e8:	46d000ef          	jal	ra,1e54 <write>
        out(f, a, l);
        if (l)
    11ec:	18041963          	bnez	s0,137e <printf+0x1fe>
            continue;
        if (s[1] == 0)
    11f0:	0014c783          	lbu	a5,1(s1)
    11f4:	18078a63          	beqz	a5,1388 <printf+0x208>
            break;
        switch (s[1])
    11f8:	07300713          	li	a4,115
    11fc:	28e78e63          	beq	a5,a4,1498 <printf+0x318>
    1200:	18f76f63          	bltu	a4,a5,139e <printf+0x21e>
    1204:	06400713          	li	a4,100
    1208:	2ae78c63          	beq	a5,a4,14c0 <printf+0x340>
    120c:	07000713          	li	a4,112
    1210:	3ce79c63          	bne	a5,a4,15e8 <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1214:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1216:	00001797          	auipc	a5,0x1
    121a:	e3278793          	addi	a5,a5,-462 # 2048 <digits>
            printptr(va_arg(ap, uint64));
    121e:	6298                	ld	a4,0(a3)
    1220:	00868093          	addi	ra,a3,8
    1224:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1226:	00471293          	slli	t0,a4,0x4
    122a:	00c71f13          	slli	t5,a4,0xc
    122e:	01471e13          	slli	t3,a4,0x14
    1232:	01c71893          	slli	a7,a4,0x1c
    1236:	02471813          	slli	a6,a4,0x24
    123a:	02871513          	slli	a0,a4,0x28
    123e:	02c71593          	slli	a1,a4,0x2c
    1242:	03071693          	slli	a3,a4,0x30
    1246:	00871f93          	slli	t6,a4,0x8
    124a:	01071e93          	slli	t4,a4,0x10
    124e:	01871313          	slli	t1,a4,0x18
    1252:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1256:	03c2d293          	srli	t0,t0,0x3c
    125a:	03cf5f13          	srli	t5,t5,0x3c
    125e:	03ce5e13          	srli	t3,t3,0x3c
    1262:	03c8d893          	srli	a7,a7,0x3c
    1266:	03c85813          	srli	a6,a6,0x3c
    126a:	9171                	srli	a0,a0,0x3c
    126c:	91f1                	srli	a1,a1,0x3c
    126e:	92f1                	srli	a3,a3,0x3c
    1270:	92be                	add	t0,t0,a5
    1272:	9f3e                	add	t5,t5,a5
    1274:	9e3e                	add	t3,t3,a5
    1276:	98be                	add	a7,a7,a5
    1278:	983e                	add	a6,a6,a5
    127a:	953e                	add	a0,a0,a5
    127c:	95be                	add	a1,a1,a5
    127e:	96be                	add	a3,a3,a5
    1280:	03c75393          	srli	t2,a4,0x3c
    1284:	01c75b9b          	srliw	s7,a4,0x1c
    1288:	03cfdf93          	srli	t6,t6,0x3c
    128c:	03cede93          	srli	t4,t4,0x3c
    1290:	03c35313          	srli	t1,t1,0x3c
    1294:	9271                	srli	a2,a2,0x3c
    1296:	0002c403          	lbu	s0,0(t0)
    129a:	93be                	add	t2,t2,a5
    129c:	000f4283          	lbu	t0,0(t5)
    12a0:	9fbe                	add	t6,t6,a5
    12a2:	000e4f03          	lbu	t5,0(t3)
    12a6:	9ebe                	add	t4,t4,a5
    12a8:	0008ce03          	lbu	t3,0(a7)
    12ac:	933e                	add	t1,t1,a5
    12ae:	00084883          	lbu	a7,0(a6)
    12b2:	9bbe                	add	s7,s7,a5
    12b4:	00054803          	lbu	a6,0(a0)
    12b8:	963e                	add	a2,a2,a5
    12ba:	0005c503          	lbu	a0,0(a1)
    12be:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    12c2:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12c6:	0003c903          	lbu	s2,0(t2)
    12ca:	00064603          	lbu	a2,0(a2)
    12ce:	000fc383          	lbu	t2,0(t6)
    12d2:	8b3d                	andi	a4,a4,15
    12d4:	000ecf83          	lbu	t6,0(t4)
    12d8:	92f1                	srli	a3,a3,0x3c
    12da:	00034e83          	lbu	t4,0(t1)
    12de:	000bc303          	lbu	t1,0(s7)
    12e2:	96be                	add	a3,a3,a5
    12e4:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    12e6:	7761                	lui	a4,0xffff8
    12e8:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12ec:	00710623          	sb	t2,12(sp)
    12f0:	005106a3          	sb	t0,13(sp)
    12f4:	01f10723          	sb	t6,14(sp)
    12f8:	01e107a3          	sb	t5,15(sp)
    12fc:	01d10823          	sb	t4,16(sp)
    1300:	01c108a3          	sb	t3,17(sp)
    1304:	00610923          	sb	t1,18(sp)
    1308:	011109a3          	sb	a7,19(sp)
    130c:	01010a23          	sb	a6,20(sp)
    1310:	00a10aa3          	sb	a0,21(sp)
    1314:	00b10b23          	sb	a1,22(sp)
    1318:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    131c:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1320:	01210523          	sb	s2,10(sp)
    1324:	008105a3          	sb	s0,11(sp)
    1328:	0006c703          	lbu	a4,0(a3)
    132c:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1330:	4649                	li	a2,18
    1332:	002c                	addi	a1,sp,8
    1334:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1336:	00e10c23          	sb	a4,24(sp)
    133a:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    133e:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1342:	313000ef          	jal	ra,1e54 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1346:	00248513          	addi	a0,s1,2
    134a:	bda5                	j	11c2 <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    134c:	00064783          	lbu	a5,0(a2)
    1350:	84b2                	mv	s1,a2
    1352:	01278963          	beq	a5,s2,1364 <printf+0x1e4>
    1356:	b561                	j	11de <printf+0x5e>
    1358:	0024c783          	lbu	a5,2(s1)
    135c:	0605                	addi	a2,a2,1
    135e:	0489                	addi	s1,s1,2
    1360:	e7279fe3          	bne	a5,s2,11de <printf+0x5e>
    1364:	0014c783          	lbu	a5,1(s1)
    1368:	ff2788e3          	beq	a5,s2,1358 <printf+0x1d8>
        l = z - a;
    136c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1370:	85aa                	mv	a1,a0
    1372:	8622                	mv	a2,s0
    1374:	4505                	li	a0,1
    1376:	2df000ef          	jal	ra,1e54 <write>
        if (l)
    137a:	e6040be3          	beqz	s0,11f0 <printf+0x70>
    137e:	8526                	mv	a0,s1
        if (!*s)
    1380:	00054783          	lbu	a5,0(a0)
    1384:	e40795e3          	bnez	a5,11ce <printf+0x4e>
    }
    va_end(ap);
    1388:	70e6                	ld	ra,120(sp)
    138a:	7446                	ld	s0,112(sp)
    138c:	74a6                	ld	s1,104(sp)
    138e:	7906                	ld	s2,96(sp)
    1390:	69e6                	ld	s3,88(sp)
    1392:	6a46                	ld	s4,80(sp)
    1394:	6aa6                	ld	s5,72(sp)
    1396:	6b06                	ld	s6,64(sp)
    1398:	7be2                	ld	s7,56(sp)
    139a:	6129                	addi	sp,sp,192
    139c:	8082                	ret
        switch (s[1])
    139e:	07800713          	li	a4,120
    13a2:	24e79363          	bne	a5,a4,15e8 <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    13a6:	6782                	ld	a5,0(sp)
    13a8:	4394                	lw	a3,0(a5)
    13aa:	07a1                	addi	a5,a5,8
    13ac:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    13ae:	2606c263          	bltz	a3,1612 <printf+0x492>
        buf[i--] = digits[x % base];
    13b2:	00001797          	auipc	a5,0x1
    13b6:	c9678793          	addi	a5,a5,-874 # 2048 <digits>
    13ba:	00f6f713          	andi	a4,a3,15
    13be:	973e                	add	a4,a4,a5
    13c0:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff5fb8>
    buf[16] = 0;
    13c4:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    13c8:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    13ca:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    13ce:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    13d2:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    13d6:	0046d51b          	srliw	a0,a3,0x4
    13da:	0ad5d563          	bge	a1,a3,1484 <printf+0x304>
        buf[i--] = digits[x % base];
    13de:	8a3d                	andi	a2,a2,15
    13e0:	963e                	add	a2,a2,a5
    13e2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    13e6:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    13ea:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    13ee:	30a5fe63          	bgeu	a1,a0,170a <printf+0x58a>
        buf[i--] = digits[x % base];
    13f2:	00f77613          	andi	a2,a4,15
    13f6:	963e                	add	a2,a2,a5
    13f8:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13fc:	45bd                	li	a1,15
    13fe:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    1402:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    1406:	00475513          	srli	a0,a4,0x4
    140a:	30e5f963          	bgeu	a1,a4,171c <printf+0x59c>
        buf[i--] = digits[x % base];
    140e:	8a3d                	andi	a2,a2,15
    1410:	963e                	add	a2,a2,a5
    1412:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    1416:	00875893          	srli	a7,a4,0x8
    141a:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    141e:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    1422:	30a5fd63          	bgeu	a1,a0,173c <printf+0x5bc>
        buf[i--] = digits[x % base];
    1426:	8a3d                	andi	a2,a2,15
    1428:	963e                	add	a2,a2,a5
    142a:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    142e:	00c75813          	srli	a6,a4,0xc
    1432:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    1436:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    143a:	3315fe63          	bgeu	a1,a7,1776 <printf+0x5f6>
        buf[i--] = digits[x % base];
    143e:	8a3d                	andi	a2,a2,15
    1440:	963e                	add	a2,a2,a5
    1442:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1446:	01075893          	srli	a7,a4,0x10
    144a:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    144e:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    1452:	3305ff63          	bgeu	a1,a6,1790 <printf+0x610>
        buf[i--] = digits[x % base];
    1456:	8a3d                	andi	a2,a2,15
    1458:	963e                	add	a2,a2,a5
    145a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    145e:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    1462:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1466:	3515f863          	bgeu	a1,a7,17b6 <printf+0x636>
        buf[i--] = digits[x % base];
    146a:	97ba                	add	a5,a5,a4
    146c:	0007c783          	lbu	a5,0(a5)
    1470:	45a1                	li	a1,8
    1472:	00f10823          	sb	a5,16(sp)
    if (sign)
    1476:	0006d763          	bgez	a3,1484 <printf+0x304>
        buf[i--] = '-';
    147a:	02d00793          	li	a5,45
    147e:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1482:	459d                	li	a1,7
    write(f, s, l);
    1484:	4641                	li	a2,16
    1486:	003c                	addi	a5,sp,8
    1488:	9e0d                	subw	a2,a2,a1
    148a:	4505                	li	a0,1
    148c:	95be                	add	a1,a1,a5
    148e:	1c7000ef          	jal	ra,1e54 <write>
        s += 2;
    1492:	00248513          	addi	a0,s1,2
    1496:	b335                	j	11c2 <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    1498:	6782                	ld	a5,0(sp)
    149a:	6380                	ld	s0,0(a5)
    149c:	07a1                	addi	a5,a5,8
    149e:	e03e                	sd	a5,0(sp)
    14a0:	22040a63          	beqz	s0,16d4 <printf+0x554>
            l = strnlen(a, 200);
    14a4:	0c800593          	li	a1,200
    14a8:	8522                	mv	a0,s0
    14aa:	6cc000ef          	jal	ra,1b76 <strnlen>
    write(f, s, l);
    14ae:	0005061b          	sext.w	a2,a0
    14b2:	85a2                	mv	a1,s0
    14b4:	4505                	li	a0,1
    14b6:	19f000ef          	jal	ra,1e54 <write>
        s += 2;
    14ba:	00248513          	addi	a0,s1,2
    14be:	b311                	j	11c2 <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    14c0:	6782                	ld	a5,0(sp)
    14c2:	4390                	lw	a2,0(a5)
    14c4:	07a1                	addi	a5,a5,8
    14c6:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    14c8:	1a064363          	bltz	a2,166e <printf+0x4ee>
        buf[i--] = digits[x % base];
    14cc:	46a9                	li	a3,10
    14ce:	02d6773b          	remuw	a4,a2,a3
    14d2:	00001797          	auipc	a5,0x1
    14d6:	b7678793          	addi	a5,a5,-1162 # 2048 <digits>
    buf[16] = 0;
    14da:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    14de:	4525                	li	a0,9
        x = xx;
    14e0:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    14e4:	973e                	add	a4,a4,a5
    14e6:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    14ea:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    14ee:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    14f2:	2cc55063          	bge	a0,a2,17b2 <printf+0x632>
    14f6:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    14fa:	02d5f73b          	remuw	a4,a1,a3
    14fe:	1702                	slli	a4,a4,0x20
    1500:	9301                	srli	a4,a4,0x20
    1502:	973e                	add	a4,a4,a5
    1504:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    1508:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    150c:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    1510:	1f057d63          	bgeu	a0,a6,170a <printf+0x58a>
        buf[i--] = digits[x % base];
    1514:	4529                	li	a0,10
    } while ((x /= base) != 0);
    1516:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1518:	02a5f73b          	remuw	a4,a1,a0
    151c:	973e                	add	a4,a4,a5
    151e:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    1522:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    1526:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    152a:	1ab6f163          	bgeu	a3,a1,16cc <printf+0x54c>
    152e:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    1532:	02a776bb          	remuw	a3,a4,a0
    1536:	96be                	add	a3,a3,a5
    1538:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    153c:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1540:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1544:	20b87c63          	bgeu	a6,a1,175c <printf+0x5dc>
    1548:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    154c:	02a776bb          	remuw	a3,a4,a0
    1550:	96be                	add	a3,a3,a5
    1552:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1556:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    155a:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    155e:	20b87363          	bgeu	a6,a1,1764 <printf+0x5e4>
        buf[i--] = digits[x % base];
    1562:	02a776bb          	remuw	a3,a4,a0
    1566:	96be                	add	a3,a3,a5
    1568:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    156c:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1570:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1574:	20b9f563          	bgeu	s3,a1,177e <printf+0x5fe>
        buf[i--] = digits[x % base];
    1578:	02a776bb          	remuw	a3,a4,a0
    157c:	96be                	add	a3,a3,a5
    157e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1582:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1586:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    158a:	20bafb63          	bgeu	s5,a1,17a0 <printf+0x620>
        buf[i--] = digits[x % base];
    158e:	02a776bb          	remuw	a3,a4,a0
    1592:	96be                	add	a3,a3,a5
    1594:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1598:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    159c:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    15a0:	1eba7c63          	bgeu	s4,a1,1798 <printf+0x618>
        buf[i--] = digits[x % base];
    15a4:	02a776bb          	remuw	a3,a4,a0
    15a8:	96be                	add	a3,a3,a5
    15aa:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    15ae:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    15b2:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    15b6:	14bb7163          	bgeu	s6,a1,16f8 <printf+0x578>
        buf[i--] = digits[x % base];
    15ba:	1702                	slli	a4,a4,0x20
    15bc:	9301                	srli	a4,a4,0x20
    15be:	97ba                	add	a5,a5,a4
    15c0:	0007c783          	lbu	a5,0(a5)
    15c4:	4599                	li	a1,6
    15c6:	00f10723          	sb	a5,14(sp)
    if (sign)
    15ca:	ea065de3          	bgez	a2,1484 <printf+0x304>
        buf[i--] = '-';
    15ce:	02d00793          	li	a5,45
    15d2:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    15d6:	4595                	li	a1,5
    write(f, s, l);
    15d8:	003c                	addi	a5,sp,8
    15da:	4641                	li	a2,16
    15dc:	9e0d                	subw	a2,a2,a1
    15de:	4505                	li	a0,1
    15e0:	95be                	add	a1,a1,a5
    15e2:	073000ef          	jal	ra,1e54 <write>
    15e6:	b575                	j	1492 <printf+0x312>
    char byte = c;
    15e8:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    15ec:	4605                	li	a2,1
    15ee:	002c                	addi	a1,sp,8
    15f0:	4505                	li	a0,1
    char byte = c;
    15f2:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15f6:	05f000ef          	jal	ra,1e54 <write>
    char byte = c;
    15fa:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15fe:	4605                	li	a2,1
    1600:	002c                	addi	a1,sp,8
    1602:	4505                	li	a0,1
    char byte = c;
    1604:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1608:	04d000ef          	jal	ra,1e54 <write>
        s += 2;
    160c:	00248513          	addi	a0,s1,2
    1610:	be4d                	j	11c2 <printf+0x42>
        x = -xx;
    1612:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    1616:	00001797          	auipc	a5,0x1
    161a:	a3278793          	addi	a5,a5,-1486 # 2048 <digits>
    161e:	00f77613          	andi	a2,a4,15
    1622:	963e                	add	a2,a2,a5
    1624:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    1628:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    162c:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    162e:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1632:	0047551b          	srliw	a0,a4,0x4
    1636:	0047561b          	srliw	a2,a4,0x4
    163a:	0ab6d263          	bge	a3,a1,16de <printf+0x55e>
        buf[i--] = digits[x % base];
    163e:	8a3d                	andi	a2,a2,15
    1640:	963e                	add	a2,a2,a5
    1642:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    1646:	463d                	li	a2,15
    1648:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    164c:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    1650:	daa661e3          	bltu	a2,a0,13f2 <printf+0x272>
        buf[i--] = '-';
    1654:	02d00793          	li	a5,45
    1658:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    165c:	45b5                	li	a1,13
    write(f, s, l);
    165e:	003c                	addi	a5,sp,8
    1660:	4641                	li	a2,16
    1662:	9e0d                	subw	a2,a2,a1
    1664:	4505                	li	a0,1
    1666:	95be                	add	a1,a1,a5
    1668:	7ec000ef          	jal	ra,1e54 <write>
    166c:	b51d                	j	1492 <printf+0x312>
        x = -xx;
    166e:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    1672:	46a9                	li	a3,10
    1674:	02d875bb          	remuw	a1,a6,a3
    1678:	00001797          	auipc	a5,0x1
    167c:	9d078793          	addi	a5,a5,-1584 # 2048 <digits>
    buf[16] = 0;
    1680:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1684:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    1686:	95be                	add	a1,a1,a5
    1688:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    168c:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    1690:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    1694:	04a65563          	bge	a2,a0,16de <printf+0x55e>
    1698:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    169c:	02d775bb          	remuw	a1,a4,a3
    16a0:	95be                	add	a1,a1,a5
    16a2:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    16a6:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    16aa:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    16ae:	fb0573e3          	bgeu	a0,a6,1654 <printf+0x4d4>
        buf[i--] = digits[x % base];
    16b2:	4529                	li	a0,10
    } while ((x /= base) != 0);
    16b4:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    16b6:	02a5f73b          	remuw	a4,a1,a0
    16ba:	973e                	add	a4,a4,a5
    16bc:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    16c0:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    16c4:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    16c8:	e6b6e3e3          	bltu	a3,a1,152e <printf+0x3ae>
        buf[i--] = digits[x % base];
    16cc:	45b5                	li	a1,13
    if (sign)
    16ce:	da065be3          	bgez	a2,1484 <printf+0x304>
    16d2:	a881                	j	1722 <printf+0x5a2>
                a = "(null)";
    16d4:	00001417          	auipc	s0,0x1
    16d8:	94c40413          	addi	s0,s0,-1716 # 2020 <unlink+0x26>
    16dc:	b3e1                	j	14a4 <printf+0x324>
        buf[i--] = '-';
    16de:	02d00793          	li	a5,45
    16e2:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    16e6:	45b9                	li	a1,14
    write(f, s, l);
    16e8:	003c                	addi	a5,sp,8
    16ea:	4641                	li	a2,16
    16ec:	9e0d                	subw	a2,a2,a1
    16ee:	4505                	li	a0,1
    16f0:	95be                	add	a1,a1,a5
    16f2:	762000ef          	jal	ra,1e54 <write>
    16f6:	bb71                	j	1492 <printf+0x312>
        buf[i--] = digits[x % base];
    16f8:	459d                	li	a1,7
    if (sign)
    16fa:	d80655e3          	bgez	a2,1484 <printf+0x304>
        buf[i--] = '-';
    16fe:	02d00793          	li	a5,45
    1702:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1706:	4599                	li	a1,6
    1708:	bbb5                	j	1484 <printf+0x304>
    170a:	45b9                	li	a1,14
    write(f, s, l);
    170c:	003c                	addi	a5,sp,8
    170e:	4641                	li	a2,16
    1710:	9e0d                	subw	a2,a2,a1
    1712:	4505                	li	a0,1
    1714:	95be                	add	a1,a1,a5
    1716:	73e000ef          	jal	ra,1e54 <write>
    171a:	bba5                	j	1492 <printf+0x312>
        buf[i--] = digits[x % base];
    171c:	45b5                	li	a1,13
    if (sign)
    171e:	d606d3e3          	bgez	a3,1484 <printf+0x304>
        buf[i--] = '-';
    1722:	02d00793          	li	a5,45
    1726:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    172a:	45b1                	li	a1,12
    write(f, s, l);
    172c:	003c                	addi	a5,sp,8
    172e:	4641                	li	a2,16
    1730:	9e0d                	subw	a2,a2,a1
    1732:	4505                	li	a0,1
    1734:	95be                	add	a1,a1,a5
    1736:	71e000ef          	jal	ra,1e54 <write>
    173a:	bba1                	j	1492 <printf+0x312>
        buf[i--] = digits[x % base];
    173c:	45b1                	li	a1,12
    if (sign)
    173e:	d406d3e3          	bgez	a3,1484 <printf+0x304>
        buf[i--] = '-';
    1742:	02d00793          	li	a5,45
    1746:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    174a:	45ad                	li	a1,11
    write(f, s, l);
    174c:	003c                	addi	a5,sp,8
    174e:	4641                	li	a2,16
    1750:	9e0d                	subw	a2,a2,a1
    1752:	4505                	li	a0,1
    1754:	95be                	add	a1,a1,a5
    1756:	6fe000ef          	jal	ra,1e54 <write>
    175a:	bb25                	j	1492 <printf+0x312>
        buf[i--] = digits[x % base];
    175c:	45b1                	li	a1,12
    if (sign)
    175e:	d20653e3          	bgez	a2,1484 <printf+0x304>
    1762:	b7c5                	j	1742 <printf+0x5c2>
        buf[i--] = digits[x % base];
    1764:	45ad                	li	a1,11
    if (sign)
    1766:	d0065fe3          	bgez	a2,1484 <printf+0x304>
        buf[i--] = '-';
    176a:	02d00793          	li	a5,45
    176e:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1772:	45a9                	li	a1,10
    1774:	bb01                	j	1484 <printf+0x304>
    1776:	45ad                	li	a1,11
    if (sign)
    1778:	d006d6e3          	bgez	a3,1484 <printf+0x304>
    177c:	b7fd                	j	176a <printf+0x5ea>
        buf[i--] = digits[x % base];
    177e:	45a9                	li	a1,10
    if (sign)
    1780:	d00652e3          	bgez	a2,1484 <printf+0x304>
        buf[i--] = '-';
    1784:	02d00793          	li	a5,45
    1788:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    178c:	45a5                	li	a1,9
    178e:	b9dd                	j	1484 <printf+0x304>
    1790:	45a9                	li	a1,10
    if (sign)
    1792:	ce06d9e3          	bgez	a3,1484 <printf+0x304>
    1796:	b7fd                	j	1784 <printf+0x604>
        buf[i--] = digits[x % base];
    1798:	45a1                	li	a1,8
    if (sign)
    179a:	ce0655e3          	bgez	a2,1484 <printf+0x304>
    179e:	b9f1                	j	147a <printf+0x2fa>
        buf[i--] = digits[x % base];
    17a0:	45a5                	li	a1,9
    if (sign)
    17a2:	ce0651e3          	bgez	a2,1484 <printf+0x304>
        buf[i--] = '-';
    17a6:	02d00793          	li	a5,45
    17aa:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    17ae:	45a1                	li	a1,8
    17b0:	b9d1                	j	1484 <printf+0x304>
    i = 15;
    17b2:	45bd                	li	a1,15
    17b4:	b9c1                	j	1484 <printf+0x304>
        buf[i--] = digits[x % base];
    17b6:	45a5                	li	a1,9
    if (sign)
    17b8:	cc06d6e3          	bgez	a3,1484 <printf+0x304>
    17bc:	b7ed                	j	17a6 <printf+0x626>

00000000000017be <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    17be:	02000793          	li	a5,32
    17c2:	00f50663          	beq	a0,a5,17ce <isspace+0x10>
    17c6:	355d                	addiw	a0,a0,-9
    17c8:	00553513          	sltiu	a0,a0,5
    17cc:	8082                	ret
    17ce:	4505                	li	a0,1
}
    17d0:	8082                	ret

00000000000017d2 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    17d2:	fd05051b          	addiw	a0,a0,-48
}
    17d6:	00a53513          	sltiu	a0,a0,10
    17da:	8082                	ret

00000000000017dc <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    17dc:	02000613          	li	a2,32
    17e0:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    17e2:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    17e6:	ff77069b          	addiw	a3,a4,-9
    17ea:	04c70d63          	beq	a4,a2,1844 <atoi+0x68>
    17ee:	0007079b          	sext.w	a5,a4
    17f2:	04d5f963          	bgeu	a1,a3,1844 <atoi+0x68>
        s++;
    switch (*s)
    17f6:	02b00693          	li	a3,43
    17fa:	04d70a63          	beq	a4,a3,184e <atoi+0x72>
    17fe:	02d00693          	li	a3,45
    1802:	06d70463          	beq	a4,a3,186a <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1806:	fd07859b          	addiw	a1,a5,-48
    180a:	4625                	li	a2,9
    180c:	873e                	mv	a4,a5
    180e:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1810:	4e01                	li	t3,0
    while (isdigit(*s))
    1812:	04b66a63          	bltu	a2,a1,1866 <atoi+0x8a>
    int n = 0, neg = 0;
    1816:	4501                	li	a0,0
    while (isdigit(*s))
    1818:	4825                	li	a6,9
    181a:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    181e:	0025179b          	slliw	a5,a0,0x2
    1822:	9d3d                	addw	a0,a0,a5
    1824:	fd07031b          	addiw	t1,a4,-48
    1828:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    182c:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1830:	0685                	addi	a3,a3,1
    1832:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1836:	0006071b          	sext.w	a4,a2
    183a:	feb870e3          	bgeu	a6,a1,181a <atoi+0x3e>
    return neg ? n : -n;
    183e:	000e0563          	beqz	t3,1848 <atoi+0x6c>
}
    1842:	8082                	ret
        s++;
    1844:	0505                	addi	a0,a0,1
    1846:	bf71                	j	17e2 <atoi+0x6>
    1848:	4113053b          	subw	a0,t1,a7
    184c:	8082                	ret
    while (isdigit(*s))
    184e:	00154783          	lbu	a5,1(a0)
    1852:	4625                	li	a2,9
        s++;
    1854:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1858:	fd07859b          	addiw	a1,a5,-48
    185c:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1860:	4e01                	li	t3,0
    while (isdigit(*s))
    1862:	fab67ae3          	bgeu	a2,a1,1816 <atoi+0x3a>
    1866:	4501                	li	a0,0
}
    1868:	8082                	ret
    while (isdigit(*s))
    186a:	00154783          	lbu	a5,1(a0)
    186e:	4625                	li	a2,9
        s++;
    1870:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1874:	fd07859b          	addiw	a1,a5,-48
    1878:	0007871b          	sext.w	a4,a5
    187c:	feb665e3          	bltu	a2,a1,1866 <atoi+0x8a>
        neg = 1;
    1880:	4e05                	li	t3,1
    1882:	bf51                	j	1816 <atoi+0x3a>

0000000000001884 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1884:	16060d63          	beqz	a2,19fe <memset+0x17a>
    1888:	40a007b3          	neg	a5,a0
    188c:	8b9d                	andi	a5,a5,7
    188e:	00778713          	addi	a4,a5,7
    1892:	482d                	li	a6,11
    1894:	0ff5f593          	andi	a1,a1,255
    1898:	fff60693          	addi	a3,a2,-1
    189c:	17076263          	bltu	a4,a6,1a00 <memset+0x17c>
    18a0:	16e6ea63          	bltu	a3,a4,1a14 <memset+0x190>
    18a4:	16078563          	beqz	a5,1a0e <memset+0x18a>
    18a8:	00b50023          	sb	a1,0(a0)
    18ac:	4705                	li	a4,1
    18ae:	00150e93          	addi	t4,a0,1
    18b2:	14e78c63          	beq	a5,a4,1a0a <memset+0x186>
    18b6:	00b500a3          	sb	a1,1(a0)
    18ba:	4709                	li	a4,2
    18bc:	00250e93          	addi	t4,a0,2
    18c0:	14e78d63          	beq	a5,a4,1a1a <memset+0x196>
    18c4:	00b50123          	sb	a1,2(a0)
    18c8:	470d                	li	a4,3
    18ca:	00350e93          	addi	t4,a0,3
    18ce:	12e78b63          	beq	a5,a4,1a04 <memset+0x180>
    18d2:	00b501a3          	sb	a1,3(a0)
    18d6:	4711                	li	a4,4
    18d8:	00450e93          	addi	t4,a0,4
    18dc:	14e78163          	beq	a5,a4,1a1e <memset+0x19a>
    18e0:	00b50223          	sb	a1,4(a0)
    18e4:	4715                	li	a4,5
    18e6:	00550e93          	addi	t4,a0,5
    18ea:	12e78c63          	beq	a5,a4,1a22 <memset+0x19e>
    18ee:	00b502a3          	sb	a1,5(a0)
    18f2:	471d                	li	a4,7
    18f4:	00650e93          	addi	t4,a0,6
    18f8:	12e79763          	bne	a5,a4,1a26 <memset+0x1a2>
    18fc:	00750e93          	addi	t4,a0,7
    1900:	00b50323          	sb	a1,6(a0)
    1904:	4f1d                	li	t5,7
    1906:	00859713          	slli	a4,a1,0x8
    190a:	8f4d                	or	a4,a4,a1
    190c:	01059e13          	slli	t3,a1,0x10
    1910:	01c76e33          	or	t3,a4,t3
    1914:	01859313          	slli	t1,a1,0x18
    1918:	006e6333          	or	t1,t3,t1
    191c:	02059893          	slli	a7,a1,0x20
    1920:	011368b3          	or	a7,t1,a7
    1924:	02859813          	slli	a6,a1,0x28
    1928:	40f60333          	sub	t1,a2,a5
    192c:	0108e833          	or	a6,a7,a6
    1930:	03059693          	slli	a3,a1,0x30
    1934:	00d866b3          	or	a3,a6,a3
    1938:	03859713          	slli	a4,a1,0x38
    193c:	97aa                	add	a5,a5,a0
    193e:	ff837813          	andi	a6,t1,-8
    1942:	8f55                	or	a4,a4,a3
    1944:	00f806b3          	add	a3,a6,a5
    1948:	e398                	sd	a4,0(a5)
    194a:	07a1                	addi	a5,a5,8
    194c:	fed79ee3          	bne	a5,a3,1948 <memset+0xc4>
    1950:	ff837693          	andi	a3,t1,-8
    1954:	00de87b3          	add	a5,t4,a3
    1958:	01e6873b          	addw	a4,a3,t5
    195c:	0ad30663          	beq	t1,a3,1a08 <memset+0x184>
    1960:	00b78023          	sb	a1,0(a5)
    1964:	0017069b          	addiw	a3,a4,1
    1968:	08c6fb63          	bgeu	a3,a2,19fe <memset+0x17a>
    196c:	00b780a3          	sb	a1,1(a5)
    1970:	0027069b          	addiw	a3,a4,2
    1974:	08c6f563          	bgeu	a3,a2,19fe <memset+0x17a>
    1978:	00b78123          	sb	a1,2(a5)
    197c:	0037069b          	addiw	a3,a4,3
    1980:	06c6ff63          	bgeu	a3,a2,19fe <memset+0x17a>
    1984:	00b781a3          	sb	a1,3(a5)
    1988:	0047069b          	addiw	a3,a4,4
    198c:	06c6f963          	bgeu	a3,a2,19fe <memset+0x17a>
    1990:	00b78223          	sb	a1,4(a5)
    1994:	0057069b          	addiw	a3,a4,5
    1998:	06c6f363          	bgeu	a3,a2,19fe <memset+0x17a>
    199c:	00b782a3          	sb	a1,5(a5)
    19a0:	0067069b          	addiw	a3,a4,6
    19a4:	04c6fd63          	bgeu	a3,a2,19fe <memset+0x17a>
    19a8:	00b78323          	sb	a1,6(a5)
    19ac:	0077069b          	addiw	a3,a4,7
    19b0:	04c6f763          	bgeu	a3,a2,19fe <memset+0x17a>
    19b4:	00b783a3          	sb	a1,7(a5)
    19b8:	0087069b          	addiw	a3,a4,8
    19bc:	04c6f163          	bgeu	a3,a2,19fe <memset+0x17a>
    19c0:	00b78423          	sb	a1,8(a5)
    19c4:	0097069b          	addiw	a3,a4,9
    19c8:	02c6fb63          	bgeu	a3,a2,19fe <memset+0x17a>
    19cc:	00b784a3          	sb	a1,9(a5)
    19d0:	00a7069b          	addiw	a3,a4,10
    19d4:	02c6f563          	bgeu	a3,a2,19fe <memset+0x17a>
    19d8:	00b78523          	sb	a1,10(a5)
    19dc:	00b7069b          	addiw	a3,a4,11
    19e0:	00c6ff63          	bgeu	a3,a2,19fe <memset+0x17a>
    19e4:	00b785a3          	sb	a1,11(a5)
    19e8:	00c7069b          	addiw	a3,a4,12
    19ec:	00c6f963          	bgeu	a3,a2,19fe <memset+0x17a>
    19f0:	00b78623          	sb	a1,12(a5)
    19f4:	2735                	addiw	a4,a4,13
    19f6:	00c77463          	bgeu	a4,a2,19fe <memset+0x17a>
    19fa:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    19fe:	8082                	ret
    1a00:	472d                	li	a4,11
    1a02:	bd79                	j	18a0 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a04:	4f0d                	li	t5,3
    1a06:	b701                	j	1906 <memset+0x82>
    1a08:	8082                	ret
    1a0a:	4f05                	li	t5,1
    1a0c:	bded                	j	1906 <memset+0x82>
    1a0e:	8eaa                	mv	t4,a0
    1a10:	4f01                	li	t5,0
    1a12:	bdd5                	j	1906 <memset+0x82>
    1a14:	87aa                	mv	a5,a0
    1a16:	4701                	li	a4,0
    1a18:	b7a1                	j	1960 <memset+0xdc>
    1a1a:	4f09                	li	t5,2
    1a1c:	b5ed                	j	1906 <memset+0x82>
    1a1e:	4f11                	li	t5,4
    1a20:	b5dd                	j	1906 <memset+0x82>
    1a22:	4f15                	li	t5,5
    1a24:	b5cd                	j	1906 <memset+0x82>
    1a26:	4f19                	li	t5,6
    1a28:	bdf9                	j	1906 <memset+0x82>

0000000000001a2a <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1a2a:	00054783          	lbu	a5,0(a0)
    1a2e:	0005c703          	lbu	a4,0(a1)
    1a32:	00e79863          	bne	a5,a4,1a42 <strcmp+0x18>
    1a36:	0505                	addi	a0,a0,1
    1a38:	0585                	addi	a1,a1,1
    1a3a:	fbe5                	bnez	a5,1a2a <strcmp>
    1a3c:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1a3e:	9d19                	subw	a0,a0,a4
    1a40:	8082                	ret
    1a42:	0007851b          	sext.w	a0,a5
    1a46:	bfe5                	j	1a3e <strcmp+0x14>

0000000000001a48 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1a48:	ce05                	beqz	a2,1a80 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1a4a:	00054703          	lbu	a4,0(a0)
    1a4e:	0005c783          	lbu	a5,0(a1)
    1a52:	cb0d                	beqz	a4,1a84 <strncmp+0x3c>
    if (!n--)
    1a54:	167d                	addi	a2,a2,-1
    1a56:	00c506b3          	add	a3,a0,a2
    1a5a:	a819                	j	1a70 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1a5c:	00a68e63          	beq	a3,a0,1a78 <strncmp+0x30>
    1a60:	0505                	addi	a0,a0,1
    1a62:	00e79b63          	bne	a5,a4,1a78 <strncmp+0x30>
    1a66:	00054703          	lbu	a4,0(a0)
    1a6a:	0005c783          	lbu	a5,0(a1)
    1a6e:	cb19                	beqz	a4,1a84 <strncmp+0x3c>
    1a70:	0005c783          	lbu	a5,0(a1)
    1a74:	0585                	addi	a1,a1,1
    1a76:	f3fd                	bnez	a5,1a5c <strncmp+0x14>
        ;
    return *l - *r;
    1a78:	0007051b          	sext.w	a0,a4
    1a7c:	9d1d                	subw	a0,a0,a5
    1a7e:	8082                	ret
        return 0;
    1a80:	4501                	li	a0,0
}
    1a82:	8082                	ret
    1a84:	4501                	li	a0,0
    return *l - *r;
    1a86:	9d1d                	subw	a0,a0,a5
    1a88:	8082                	ret

0000000000001a8a <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1a8a:	00757793          	andi	a5,a0,7
    1a8e:	cf89                	beqz	a5,1aa8 <strlen+0x1e>
    1a90:	87aa                	mv	a5,a0
    1a92:	a029                	j	1a9c <strlen+0x12>
    1a94:	0785                	addi	a5,a5,1
    1a96:	0077f713          	andi	a4,a5,7
    1a9a:	cb01                	beqz	a4,1aaa <strlen+0x20>
        if (!*s)
    1a9c:	0007c703          	lbu	a4,0(a5)
    1aa0:	fb75                	bnez	a4,1a94 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1aa2:	40a78533          	sub	a0,a5,a0
}
    1aa6:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1aa8:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1aaa:	6394                	ld	a3,0(a5)
    1aac:	00000597          	auipc	a1,0x0
    1ab0:	5845b583          	ld	a1,1412(a1) # 2030 <BUF_LEN+0x8>
    1ab4:	00000617          	auipc	a2,0x0
    1ab8:	58463603          	ld	a2,1412(a2) # 2038 <BUF_LEN+0x10>
    1abc:	a019                	j	1ac2 <strlen+0x38>
    1abe:	6794                	ld	a3,8(a5)
    1ac0:	07a1                	addi	a5,a5,8
    1ac2:	00b68733          	add	a4,a3,a1
    1ac6:	fff6c693          	not	a3,a3
    1aca:	8f75                	and	a4,a4,a3
    1acc:	8f71                	and	a4,a4,a2
    1ace:	db65                	beqz	a4,1abe <strlen+0x34>
    for (; *s; s++)
    1ad0:	0007c703          	lbu	a4,0(a5)
    1ad4:	d779                	beqz	a4,1aa2 <strlen+0x18>
    1ad6:	0017c703          	lbu	a4,1(a5)
    1ada:	0785                	addi	a5,a5,1
    1adc:	d379                	beqz	a4,1aa2 <strlen+0x18>
    1ade:	0017c703          	lbu	a4,1(a5)
    1ae2:	0785                	addi	a5,a5,1
    1ae4:	fb6d                	bnez	a4,1ad6 <strlen+0x4c>
    1ae6:	bf75                	j	1aa2 <strlen+0x18>

0000000000001ae8 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1ae8:	00757713          	andi	a4,a0,7
{
    1aec:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1aee:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1af2:	cb19                	beqz	a4,1b08 <memchr+0x20>
    1af4:	ce25                	beqz	a2,1b6c <memchr+0x84>
    1af6:	0007c703          	lbu	a4,0(a5)
    1afa:	04b70e63          	beq	a4,a1,1b56 <memchr+0x6e>
    1afe:	0785                	addi	a5,a5,1
    1b00:	0077f713          	andi	a4,a5,7
    1b04:	167d                	addi	a2,a2,-1
    1b06:	f77d                	bnez	a4,1af4 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1b08:	4501                	li	a0,0
    if (n && *s != c)
    1b0a:	c235                	beqz	a2,1b6e <memchr+0x86>
    1b0c:	0007c703          	lbu	a4,0(a5)
    1b10:	04b70363          	beq	a4,a1,1b56 <memchr+0x6e>
        size_t k = ONES * c;
    1b14:	00000517          	auipc	a0,0x0
    1b18:	52c53503          	ld	a0,1324(a0) # 2040 <BUF_LEN+0x18>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1b1c:	471d                	li	a4,7
        size_t k = ONES * c;
    1b1e:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1b22:	02c77a63          	bgeu	a4,a2,1b56 <memchr+0x6e>
    1b26:	00000897          	auipc	a7,0x0
    1b2a:	50a8b883          	ld	a7,1290(a7) # 2030 <BUF_LEN+0x8>
    1b2e:	00000817          	auipc	a6,0x0
    1b32:	50a83803          	ld	a6,1290(a6) # 2038 <BUF_LEN+0x10>
    1b36:	431d                	li	t1,7
    1b38:	a029                	j	1b42 <memchr+0x5a>
    1b3a:	1661                	addi	a2,a2,-8
    1b3c:	07a1                	addi	a5,a5,8
    1b3e:	02c37963          	bgeu	t1,a2,1b70 <memchr+0x88>
    1b42:	6398                	ld	a4,0(a5)
    1b44:	8f29                	xor	a4,a4,a0
    1b46:	011706b3          	add	a3,a4,a7
    1b4a:	fff74713          	not	a4,a4
    1b4e:	8f75                	and	a4,a4,a3
    1b50:	01077733          	and	a4,a4,a6
    1b54:	d37d                	beqz	a4,1b3a <memchr+0x52>
    1b56:	853e                	mv	a0,a5
    1b58:	97b2                	add	a5,a5,a2
    1b5a:	a021                	j	1b62 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1b5c:	0505                	addi	a0,a0,1
    1b5e:	00f50763          	beq	a0,a5,1b6c <memchr+0x84>
    1b62:	00054703          	lbu	a4,0(a0)
    1b66:	feb71be3          	bne	a4,a1,1b5c <memchr+0x74>
    1b6a:	8082                	ret
    return n ? (void *)s : 0;
    1b6c:	4501                	li	a0,0
}
    1b6e:	8082                	ret
    return n ? (void *)s : 0;
    1b70:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1b72:	f275                	bnez	a2,1b56 <memchr+0x6e>
}
    1b74:	8082                	ret

0000000000001b76 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1b76:	1101                	addi	sp,sp,-32
    1b78:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1b7a:	862e                	mv	a2,a1
{
    1b7c:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1b7e:	4581                	li	a1,0
{
    1b80:	e426                	sd	s1,8(sp)
    1b82:	ec06                	sd	ra,24(sp)
    1b84:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1b86:	f63ff0ef          	jal	ra,1ae8 <memchr>
    return p ? p - s : n;
    1b8a:	c519                	beqz	a0,1b98 <strnlen+0x22>
}
    1b8c:	60e2                	ld	ra,24(sp)
    1b8e:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1b90:	8d05                	sub	a0,a0,s1
}
    1b92:	64a2                	ld	s1,8(sp)
    1b94:	6105                	addi	sp,sp,32
    1b96:	8082                	ret
    1b98:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1b9a:	8522                	mv	a0,s0
}
    1b9c:	6442                	ld	s0,16(sp)
    1b9e:	64a2                	ld	s1,8(sp)
    1ba0:	6105                	addi	sp,sp,32
    1ba2:	8082                	ret

0000000000001ba4 <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1ba4:	00b547b3          	xor	a5,a0,a1
    1ba8:	8b9d                	andi	a5,a5,7
    1baa:	eb95                	bnez	a5,1bde <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1bac:	0075f793          	andi	a5,a1,7
    1bb0:	e7b1                	bnez	a5,1bfc <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1bb2:	6198                	ld	a4,0(a1)
    1bb4:	00000617          	auipc	a2,0x0
    1bb8:	47c63603          	ld	a2,1148(a2) # 2030 <BUF_LEN+0x8>
    1bbc:	00000817          	auipc	a6,0x0
    1bc0:	47c83803          	ld	a6,1148(a6) # 2038 <BUF_LEN+0x10>
    1bc4:	a029                	j	1bce <stpcpy+0x2a>
    1bc6:	e118                	sd	a4,0(a0)
    1bc8:	6598                	ld	a4,8(a1)
    1bca:	05a1                	addi	a1,a1,8
    1bcc:	0521                	addi	a0,a0,8
    1bce:	00c707b3          	add	a5,a4,a2
    1bd2:	fff74693          	not	a3,a4
    1bd6:	8ff5                	and	a5,a5,a3
    1bd8:	0107f7b3          	and	a5,a5,a6
    1bdc:	d7ed                	beqz	a5,1bc6 <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1bde:	0005c783          	lbu	a5,0(a1)
    1be2:	00f50023          	sb	a5,0(a0)
    1be6:	c785                	beqz	a5,1c0e <stpcpy+0x6a>
    1be8:	0015c783          	lbu	a5,1(a1)
    1bec:	0505                	addi	a0,a0,1
    1bee:	0585                	addi	a1,a1,1
    1bf0:	00f50023          	sb	a5,0(a0)
    1bf4:	fbf5                	bnez	a5,1be8 <stpcpy+0x44>
        ;
    return d;
}
    1bf6:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1bf8:	0505                	addi	a0,a0,1
    1bfa:	df45                	beqz	a4,1bb2 <stpcpy+0xe>
            if (!(*d = *s))
    1bfc:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1c00:	0585                	addi	a1,a1,1
    1c02:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1c06:	00f50023          	sb	a5,0(a0)
    1c0a:	f7fd                	bnez	a5,1bf8 <stpcpy+0x54>
}
    1c0c:	8082                	ret
    1c0e:	8082                	ret

0000000000001c10 <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1c10:	00b547b3          	xor	a5,a0,a1
    1c14:	8b9d                	andi	a5,a5,7
    1c16:	1a079863          	bnez	a5,1dc6 <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1c1a:	0075f793          	andi	a5,a1,7
    1c1e:	16078463          	beqz	a5,1d86 <stpncpy+0x176>
    1c22:	ea01                	bnez	a2,1c32 <stpncpy+0x22>
    1c24:	a421                	j	1e2c <stpncpy+0x21c>
    1c26:	167d                	addi	a2,a2,-1
    1c28:	0505                	addi	a0,a0,1
    1c2a:	14070e63          	beqz	a4,1d86 <stpncpy+0x176>
    1c2e:	1a060863          	beqz	a2,1dde <stpncpy+0x1ce>
    1c32:	0005c783          	lbu	a5,0(a1)
    1c36:	0585                	addi	a1,a1,1
    1c38:	0075f713          	andi	a4,a1,7
    1c3c:	00f50023          	sb	a5,0(a0)
    1c40:	f3fd                	bnez	a5,1c26 <stpncpy+0x16>
    1c42:	4805                	li	a6,1
    1c44:	1a061863          	bnez	a2,1df4 <stpncpy+0x1e4>
    1c48:	40a007b3          	neg	a5,a0
    1c4c:	8b9d                	andi	a5,a5,7
    1c4e:	4681                	li	a3,0
    1c50:	18061a63          	bnez	a2,1de4 <stpncpy+0x1d4>
    1c54:	00778713          	addi	a4,a5,7
    1c58:	45ad                	li	a1,11
    1c5a:	18b76363          	bltu	a4,a1,1de0 <stpncpy+0x1d0>
    1c5e:	1ae6eb63          	bltu	a3,a4,1e14 <stpncpy+0x204>
    1c62:	1a078363          	beqz	a5,1e08 <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c66:	00050023          	sb	zero,0(a0)
    1c6a:	4685                	li	a3,1
    1c6c:	00150713          	addi	a4,a0,1
    1c70:	18d78f63          	beq	a5,a3,1e0e <stpncpy+0x1fe>
    1c74:	000500a3          	sb	zero,1(a0)
    1c78:	4689                	li	a3,2
    1c7a:	00250713          	addi	a4,a0,2
    1c7e:	18d78e63          	beq	a5,a3,1e1a <stpncpy+0x20a>
    1c82:	00050123          	sb	zero,2(a0)
    1c86:	468d                	li	a3,3
    1c88:	00350713          	addi	a4,a0,3
    1c8c:	16d78c63          	beq	a5,a3,1e04 <stpncpy+0x1f4>
    1c90:	000501a3          	sb	zero,3(a0)
    1c94:	4691                	li	a3,4
    1c96:	00450713          	addi	a4,a0,4
    1c9a:	18d78263          	beq	a5,a3,1e1e <stpncpy+0x20e>
    1c9e:	00050223          	sb	zero,4(a0)
    1ca2:	4695                	li	a3,5
    1ca4:	00550713          	addi	a4,a0,5
    1ca8:	16d78d63          	beq	a5,a3,1e22 <stpncpy+0x212>
    1cac:	000502a3          	sb	zero,5(a0)
    1cb0:	469d                	li	a3,7
    1cb2:	00650713          	addi	a4,a0,6
    1cb6:	16d79863          	bne	a5,a3,1e26 <stpncpy+0x216>
    1cba:	00750713          	addi	a4,a0,7
    1cbe:	00050323          	sb	zero,6(a0)
    1cc2:	40f80833          	sub	a6,a6,a5
    1cc6:	ff887593          	andi	a1,a6,-8
    1cca:	97aa                	add	a5,a5,a0
    1ccc:	95be                	add	a1,a1,a5
    1cce:	0007b023          	sd	zero,0(a5)
    1cd2:	07a1                	addi	a5,a5,8
    1cd4:	feb79de3          	bne	a5,a1,1cce <stpncpy+0xbe>
    1cd8:	ff887593          	andi	a1,a6,-8
    1cdc:	9ead                	addw	a3,a3,a1
    1cde:	00b707b3          	add	a5,a4,a1
    1ce2:	12b80863          	beq	a6,a1,1e12 <stpncpy+0x202>
    1ce6:	00078023          	sb	zero,0(a5)
    1cea:	0016871b          	addiw	a4,a3,1
    1cee:	0ec77863          	bgeu	a4,a2,1dde <stpncpy+0x1ce>
    1cf2:	000780a3          	sb	zero,1(a5)
    1cf6:	0026871b          	addiw	a4,a3,2
    1cfa:	0ec77263          	bgeu	a4,a2,1dde <stpncpy+0x1ce>
    1cfe:	00078123          	sb	zero,2(a5)
    1d02:	0036871b          	addiw	a4,a3,3
    1d06:	0cc77c63          	bgeu	a4,a2,1dde <stpncpy+0x1ce>
    1d0a:	000781a3          	sb	zero,3(a5)
    1d0e:	0046871b          	addiw	a4,a3,4
    1d12:	0cc77663          	bgeu	a4,a2,1dde <stpncpy+0x1ce>
    1d16:	00078223          	sb	zero,4(a5)
    1d1a:	0056871b          	addiw	a4,a3,5
    1d1e:	0cc77063          	bgeu	a4,a2,1dde <stpncpy+0x1ce>
    1d22:	000782a3          	sb	zero,5(a5)
    1d26:	0066871b          	addiw	a4,a3,6
    1d2a:	0ac77a63          	bgeu	a4,a2,1dde <stpncpy+0x1ce>
    1d2e:	00078323          	sb	zero,6(a5)
    1d32:	0076871b          	addiw	a4,a3,7
    1d36:	0ac77463          	bgeu	a4,a2,1dde <stpncpy+0x1ce>
    1d3a:	000783a3          	sb	zero,7(a5)
    1d3e:	0086871b          	addiw	a4,a3,8
    1d42:	08c77e63          	bgeu	a4,a2,1dde <stpncpy+0x1ce>
    1d46:	00078423          	sb	zero,8(a5)
    1d4a:	0096871b          	addiw	a4,a3,9
    1d4e:	08c77863          	bgeu	a4,a2,1dde <stpncpy+0x1ce>
    1d52:	000784a3          	sb	zero,9(a5)
    1d56:	00a6871b          	addiw	a4,a3,10
    1d5a:	08c77263          	bgeu	a4,a2,1dde <stpncpy+0x1ce>
    1d5e:	00078523          	sb	zero,10(a5)
    1d62:	00b6871b          	addiw	a4,a3,11
    1d66:	06c77c63          	bgeu	a4,a2,1dde <stpncpy+0x1ce>
    1d6a:	000785a3          	sb	zero,11(a5)
    1d6e:	00c6871b          	addiw	a4,a3,12
    1d72:	06c77663          	bgeu	a4,a2,1dde <stpncpy+0x1ce>
    1d76:	00078623          	sb	zero,12(a5)
    1d7a:	26b5                	addiw	a3,a3,13
    1d7c:	06c6f163          	bgeu	a3,a2,1dde <stpncpy+0x1ce>
    1d80:	000786a3          	sb	zero,13(a5)
    1d84:	8082                	ret
            ;
        if (!n || !*s)
    1d86:	c645                	beqz	a2,1e2e <stpncpy+0x21e>
    1d88:	0005c783          	lbu	a5,0(a1)
    1d8c:	ea078be3          	beqz	a5,1c42 <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d90:	479d                	li	a5,7
    1d92:	02c7ff63          	bgeu	a5,a2,1dd0 <stpncpy+0x1c0>
    1d96:	00000897          	auipc	a7,0x0
    1d9a:	29a8b883          	ld	a7,666(a7) # 2030 <BUF_LEN+0x8>
    1d9e:	00000817          	auipc	a6,0x0
    1da2:	29a83803          	ld	a6,666(a6) # 2038 <BUF_LEN+0x10>
    1da6:	431d                	li	t1,7
    1da8:	6198                	ld	a4,0(a1)
    1daa:	011707b3          	add	a5,a4,a7
    1dae:	fff74693          	not	a3,a4
    1db2:	8ff5                	and	a5,a5,a3
    1db4:	0107f7b3          	and	a5,a5,a6
    1db8:	ef81                	bnez	a5,1dd0 <stpncpy+0x1c0>
            *wd = *ws;
    1dba:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1dbc:	1661                	addi	a2,a2,-8
    1dbe:	05a1                	addi	a1,a1,8
    1dc0:	0521                	addi	a0,a0,8
    1dc2:	fec363e3          	bltu	t1,a2,1da8 <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1dc6:	e609                	bnez	a2,1dd0 <stpncpy+0x1c0>
    1dc8:	a08d                	j	1e2a <stpncpy+0x21a>
    1dca:	167d                	addi	a2,a2,-1
    1dcc:	0505                	addi	a0,a0,1
    1dce:	ca01                	beqz	a2,1dde <stpncpy+0x1ce>
    1dd0:	0005c783          	lbu	a5,0(a1)
    1dd4:	0585                	addi	a1,a1,1
    1dd6:	00f50023          	sb	a5,0(a0)
    1dda:	fbe5                	bnez	a5,1dca <stpncpy+0x1ba>
        ;
tail:
    1ddc:	b59d                	j	1c42 <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1dde:	8082                	ret
    1de0:	472d                	li	a4,11
    1de2:	bdb5                	j	1c5e <stpncpy+0x4e>
    1de4:	00778713          	addi	a4,a5,7
    1de8:	45ad                	li	a1,11
    1dea:	fff60693          	addi	a3,a2,-1
    1dee:	e6b778e3          	bgeu	a4,a1,1c5e <stpncpy+0x4e>
    1df2:	b7fd                	j	1de0 <stpncpy+0x1d0>
    1df4:	40a007b3          	neg	a5,a0
    1df8:	8832                	mv	a6,a2
    1dfa:	8b9d                	andi	a5,a5,7
    1dfc:	4681                	li	a3,0
    1dfe:	e4060be3          	beqz	a2,1c54 <stpncpy+0x44>
    1e02:	b7cd                	j	1de4 <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1e04:	468d                	li	a3,3
    1e06:	bd75                	j	1cc2 <stpncpy+0xb2>
    1e08:	872a                	mv	a4,a0
    1e0a:	4681                	li	a3,0
    1e0c:	bd5d                	j	1cc2 <stpncpy+0xb2>
    1e0e:	4685                	li	a3,1
    1e10:	bd4d                	j	1cc2 <stpncpy+0xb2>
    1e12:	8082                	ret
    1e14:	87aa                	mv	a5,a0
    1e16:	4681                	li	a3,0
    1e18:	b5f9                	j	1ce6 <stpncpy+0xd6>
    1e1a:	4689                	li	a3,2
    1e1c:	b55d                	j	1cc2 <stpncpy+0xb2>
    1e1e:	4691                	li	a3,4
    1e20:	b54d                	j	1cc2 <stpncpy+0xb2>
    1e22:	4695                	li	a3,5
    1e24:	bd79                	j	1cc2 <stpncpy+0xb2>
    1e26:	4699                	li	a3,6
    1e28:	bd69                	j	1cc2 <stpncpy+0xb2>
    1e2a:	8082                	ret
    1e2c:	8082                	ret
    1e2e:	8082                	ret

0000000000001e30 <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1e30:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1e34:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e36:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1e3a:	2501                	sext.w	a0,a0
    1e3c:	8082                	ret

0000000000001e3e <close>:
    register long a7 __asm__("a7") = n;
    1e3e:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1e42:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1e46:	2501                	sext.w	a0,a0
    1e48:	8082                	ret

0000000000001e4a <read>:
    register long a7 __asm__("a7") = n;
    1e4a:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e4e:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1e52:	8082                	ret

0000000000001e54 <write>:
    register long a7 __asm__("a7") = n;
    1e54:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e58:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1e5c:	8082                	ret

0000000000001e5e <getpid>:
    register long a7 __asm__("a7") = n;
    1e5e:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1e62:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1e66:	2501                	sext.w	a0,a0
    1e68:	8082                	ret

0000000000001e6a <sched_yield>:
    register long a7 __asm__("a7") = n;
    1e6a:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1e6e:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1e72:	2501                	sext.w	a0,a0
    1e74:	8082                	ret

0000000000001e76 <fork>:
    register long a7 __asm__("a7") = n;
    1e76:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1e7a:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1e7e:	2501                	sext.w	a0,a0
    1e80:	8082                	ret

0000000000001e82 <exit>:
    register long a7 __asm__("a7") = n;
    1e82:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e86:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e8a:	8082                	ret

0000000000001e8c <waitpid>:
    register long a7 __asm__("a7") = n;
    1e8c:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e90:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1e94:	2501                	sext.w	a0,a0
    1e96:	8082                	ret

0000000000001e98 <exec>:
    register long a7 __asm__("a7") = n;
    1e98:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e9c:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1ea0:	2501                	sext.w	a0,a0
    1ea2:	8082                	ret

0000000000001ea4 <get_time>:

int64 get_time()
{
    1ea4:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1ea6:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1eaa:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1eac:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eae:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1eb2:	2501                	sext.w	a0,a0
    1eb4:	ed09                	bnez	a0,1ece <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1eb6:	67a2                	ld	a5,8(sp)
    1eb8:	3e800713          	li	a4,1000
    1ebc:	00015503          	lhu	a0,0(sp)
    1ec0:	02e7d7b3          	divu	a5,a5,a4
    1ec4:	02e50533          	mul	a0,a0,a4
    1ec8:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1eca:	0141                	addi	sp,sp,16
    1ecc:	8082                	ret
        return -1;
    1ece:	557d                	li	a0,-1
    1ed0:	bfed                	j	1eca <get_time+0x26>

0000000000001ed2 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1ed2:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed6:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1eda:	2501                	sext.w	a0,a0
    1edc:	8082                	ret

0000000000001ede <sleep>:

int sleep(unsigned long long time)
{
    1ede:	1141                	addi	sp,sp,-16
    1ee0:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1ee2:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ee6:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ee8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eea:	00000073          	ecall
    if (err == 0)
    1eee:	2501                	sext.w	a0,a0
    1ef0:	e13d                	bnez	a0,1f56 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ef2:	6722                	ld	a4,8(sp)
    1ef4:	3e800693          	li	a3,1000
    1ef8:	00015783          	lhu	a5,0(sp)
    1efc:	02d75733          	divu	a4,a4,a3
    1f00:	02d787b3          	mul	a5,a5,a3
    1f04:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1f06:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1f0a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1f0c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f0e:	00000073          	ecall
    if (err == 0)
    1f12:	2501                	sext.w	a0,a0
    1f14:	ed15                	bnez	a0,1f50 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1f16:	6841                	lui	a6,0x10
    1f18:	963e                	add	a2,a2,a5
    1f1a:	187d                	addi	a6,a6,-1
    1f1c:	3e800693          	li	a3,1000
    1f20:	a819                	j	1f36 <sleep+0x58>
    __asm_syscall("r"(a7))
    1f22:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1f26:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1f2a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1f2c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f2e:	00000073          	ecall
    if (err == 0)
    1f32:	2501                	sext.w	a0,a0
    1f34:	ed11                	bnez	a0,1f50 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1f36:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1f38:	07c00893          	li	a7,124
    1f3c:	02d7d733          	divu	a4,a5,a3
    1f40:	6782                	ld	a5,0(sp)
    1f42:	0107f7b3          	and	a5,a5,a6
    1f46:	02d787b3          	mul	a5,a5,a3
    1f4a:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1f4c:	fcc7ebe3          	bltu	a5,a2,1f22 <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1f50:	4501                	li	a0,0
    1f52:	0141                	addi	sp,sp,16
    1f54:	8082                	ret
    1f56:	57fd                	li	a5,-1
    1f58:	b77d                	j	1f06 <sleep+0x28>

0000000000001f5a <set_priority>:
    register long a7 __asm__("a7") = n;
    1f5a:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1f5e:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1f62:	2501                	sext.w	a0,a0
    1f64:	8082                	ret

0000000000001f66 <mmap>:
    register long a7 __asm__("a7") = n;
    1f66:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f6a:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1f6e:	2501                	sext.w	a0,a0
    1f70:	8082                	ret

0000000000001f72 <munmap>:
    register long a7 __asm__("a7") = n;
    1f72:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f76:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1f7a:	2501                	sext.w	a0,a0
    1f7c:	8082                	ret

0000000000001f7e <wait>:

int wait(int *code)
{
    1f7e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f80:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1f84:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f86:	00000073          	ecall
    return waitpid(-1, code);
}
    1f8a:	2501                	sext.w	a0,a0
    1f8c:	8082                	ret

0000000000001f8e <spawn>:
    register long a7 __asm__("a7") = n;
    1f8e:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1f92:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f96:	2501                	sext.w	a0,a0
    1f98:	8082                	ret

0000000000001f9a <mailread>:
    register long a7 __asm__("a7") = n;
    1f9a:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f9e:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1fa2:	2501                	sext.w	a0,a0
    1fa4:	8082                	ret

0000000000001fa6 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1fa6:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1faa:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1fae:	2501                	sext.w	a0,a0
    1fb0:	8082                	ret

0000000000001fb2 <fstat>:
    register long a7 __asm__("a7") = n;
    1fb2:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fb6:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1fba:	2501                	sext.w	a0,a0
    1fbc:	8082                	ret

0000000000001fbe <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1fbe:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1fc0:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1fc4:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fc6:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1fca:	2501                	sext.w	a0,a0
    1fcc:	8082                	ret

0000000000001fce <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1fce:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1fd0:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1fd4:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fd6:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1fda:	2501                	sext.w	a0,a0
    1fdc:	8082                	ret

0000000000001fde <link>:

int link(char *old_path, char *new_path)
{
    1fde:	87aa                	mv	a5,a0
    1fe0:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1fe2:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1fe6:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1fea:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1fec:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1ff0:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ff2:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1ff6:	2501                	sext.w	a0,a0
    1ff8:	8082                	ret

0000000000001ffa <unlink>:

int unlink(char *path)
{
    1ffa:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ffc:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    2000:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    2004:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2006:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    200a:	2501                	sext.w	a0,a0
    200c:	8082                	ret
