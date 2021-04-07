
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch2_hello_world:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	01c0006f          	j	101e <__start_main>

0000000000001006 <main>:
/// 正确输出：
/// Hello world from user mode program!
/// Test hello_world OK!

int main(void)
{
    1006:	1141                	addi	sp,sp,-16
    puts("Hello world from user mode program!\nTest hello_world OK!");
    1008:	00001517          	auipc	a0,0x1
    100c:	f3850513          	addi	a0,a0,-200 # 1f40 <unlink+0x16>
{
    1010:	e406                	sd	ra,8(sp)
    puts("Hello world from user mode program!\nTest hello_world OK!");
    1012:	05c000ef          	jal	ra,106e <puts>
    return 0;
    1016:	60a2                	ld	ra,8(sp)
    1018:	4501                	li	a0,0
    101a:	0141                	addi	sp,sp,16
    101c:	8082                	ret

000000000000101e <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    101e:	1141                	addi	sp,sp,-16
    1020:	e406                	sd	ra,8(sp)
    exit(main());
    1022:	fe5ff0ef          	jal	ra,1006 <main>
    1026:	58d000ef          	jal	ra,1db2 <exit>
    return 0;
}
    102a:	60a2                	ld	ra,8(sp)
    102c:	4501                	li	a0,0
    102e:	0141                	addi	sp,sp,16
    1030:	8082                	ret

0000000000001032 <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    1032:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    1034:	00f10593          	addi	a1,sp,15
    1038:	4605                	li	a2,1
    103a:	4501                	li	a0,0
{
    103c:	ec06                	sd	ra,24(sp)
    char byte = 0;
    103e:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1042:	539000ef          	jal	ra,1d7a <read>
    return byte;
}
    1046:	60e2                	ld	ra,24(sp)
    1048:	00f14503          	lbu	a0,15(sp)
    104c:	6105                	addi	sp,sp,32
    104e:	8082                	ret

0000000000001050 <putchar>:

int putchar(int c)
{
    1050:	1101                	addi	sp,sp,-32
    1052:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    1054:	00f10593          	addi	a1,sp,15
    1058:	4605                	li	a2,1
    105a:	4505                	li	a0,1
{
    105c:	ec06                	sd	ra,24(sp)
    char byte = c;
    105e:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1062:	523000ef          	jal	ra,1d84 <write>
}
    1066:	60e2                	ld	ra,24(sp)
    1068:	2501                	sext.w	a0,a0
    106a:	6105                	addi	sp,sp,32
    106c:	8082                	ret

000000000000106e <puts>:

int puts(const char *s)
{
    106e:	1101                	addi	sp,sp,-32
    1070:	e822                	sd	s0,16(sp)
    1072:	ec06                	sd	ra,24(sp)
    1074:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    1076:	145000ef          	jal	ra,19ba <strlen>
    107a:	862a                	mv	a2,a0
    107c:	85a2                	mv	a1,s0
    107e:	4505                	li	a0,1
    1080:	505000ef          	jal	ra,1d84 <write>
    1084:	00055763          	bgez	a0,1092 <puts+0x24>
    return r;
}
    1088:	60e2                	ld	ra,24(sp)
    108a:	6442                	ld	s0,16(sp)
    108c:	557d                	li	a0,-1
    108e:	6105                	addi	sp,sp,32
    1090:	8082                	ret
    return write(stdout, &byte, 1);
    1092:	00f10593          	addi	a1,sp,15
    char byte = c;
    1096:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    1098:	4605                	li	a2,1
    109a:	4505                	li	a0,1
    char byte = c;
    109c:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    10a0:	4e5000ef          	jal	ra,1d84 <write>
}
    10a4:	60e2                	ld	ra,24(sp)
    10a6:	6442                	ld	s0,16(sp)
    10a8:	41f5551b          	sraiw	a0,a0,0x1f
    10ac:	6105                	addi	sp,sp,32
    10ae:	8082                	ret

00000000000010b0 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    10b0:	7131                	addi	sp,sp,-192
    10b2:	ecce                	sd	s3,88(sp)
    10b4:	e8d2                	sd	s4,80(sp)
    10b6:	e4d6                	sd	s5,72(sp)
    10b8:	e0da                	sd	s6,64(sp)
    10ba:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    10bc:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    10be:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    10c0:	6ae1                	lui	s5,0x18
    10c2:	000f4a37          	lui	s4,0xf4
    10c6:	00989b37          	lui	s6,0x989
{
    10ca:	fc86                	sd	ra,120(sp)
    10cc:	f8a2                	sd	s0,112(sp)
    10ce:	f4a6                	sd	s1,104(sp)
    10d0:	f0ca                	sd	s2,96(sp)
    10d2:	fc5e                	sd	s7,56(sp)
    10d4:	e52e                	sd	a1,136(sp)
    10d6:	e932                	sd	a2,144(sp)
    10d8:	ed36                	sd	a3,152(sp)
    10da:	f13a                	sd	a4,160(sp)
    10dc:	f942                	sd	a6,176(sp)
    10de:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    10e0:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    10e2:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x76f>
    10e6:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x166ff>
    10ea:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf229f>
    10ee:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x9876df>
    for (;;)
    {
        if (!*s)
    10f2:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    10f6:	02500913          	li	s2,37
        if (!*s)
    10fa:	1a078f63          	beqz	a5,12b8 <printf+0x208>
    10fe:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1100:	17278e63          	beq	a5,s2,127c <printf+0x1cc>
    1104:	00164783          	lbu	a5,1(a2)
    1108:	0605                	addi	a2,a2,1
    110a:	fbfd                	bnez	a5,1100 <printf+0x50>
    110c:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    110e:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1112:	85aa                	mv	a1,a0
    1114:	8622                	mv	a2,s0
    1116:	4505                	li	a0,1
    1118:	46d000ef          	jal	ra,1d84 <write>
        out(f, a, l);
        if (l)
    111c:	18041963          	bnez	s0,12ae <printf+0x1fe>
            continue;
        if (s[1] == 0)
    1120:	0014c783          	lbu	a5,1(s1)
    1124:	18078a63          	beqz	a5,12b8 <printf+0x208>
            break;
        switch (s[1])
    1128:	07300713          	li	a4,115
    112c:	28e78e63          	beq	a5,a4,13c8 <printf+0x318>
    1130:	18f76f63          	bltu	a4,a5,12ce <printf+0x21e>
    1134:	06400713          	li	a4,100
    1138:	2ae78c63          	beq	a5,a4,13f0 <printf+0x340>
    113c:	07000713          	li	a4,112
    1140:	3ce79c63          	bne	a5,a4,1518 <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1144:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1146:	00001797          	auipc	a5,0x1
    114a:	e5a78793          	addi	a5,a5,-422 # 1fa0 <digits>
            printptr(va_arg(ap, uint64));
    114e:	6298                	ld	a4,0(a3)
    1150:	00868093          	addi	ra,a3,8
    1154:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1156:	00471293          	slli	t0,a4,0x4
    115a:	00c71f13          	slli	t5,a4,0xc
    115e:	01471e13          	slli	t3,a4,0x14
    1162:	01c71893          	slli	a7,a4,0x1c
    1166:	02471813          	slli	a6,a4,0x24
    116a:	02871513          	slli	a0,a4,0x28
    116e:	02c71593          	slli	a1,a4,0x2c
    1172:	03071693          	slli	a3,a4,0x30
    1176:	00871f93          	slli	t6,a4,0x8
    117a:	01071e93          	slli	t4,a4,0x10
    117e:	01871313          	slli	t1,a4,0x18
    1182:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1186:	03c2d293          	srli	t0,t0,0x3c
    118a:	03cf5f13          	srli	t5,t5,0x3c
    118e:	03ce5e13          	srli	t3,t3,0x3c
    1192:	03c8d893          	srli	a7,a7,0x3c
    1196:	03c85813          	srli	a6,a6,0x3c
    119a:	9171                	srli	a0,a0,0x3c
    119c:	91f1                	srli	a1,a1,0x3c
    119e:	92f1                	srli	a3,a3,0x3c
    11a0:	92be                	add	t0,t0,a5
    11a2:	9f3e                	add	t5,t5,a5
    11a4:	9e3e                	add	t3,t3,a5
    11a6:	98be                	add	a7,a7,a5
    11a8:	983e                	add	a6,a6,a5
    11aa:	953e                	add	a0,a0,a5
    11ac:	95be                	add	a1,a1,a5
    11ae:	96be                	add	a3,a3,a5
    11b0:	03c75393          	srli	t2,a4,0x3c
    11b4:	01c75b9b          	srliw	s7,a4,0x1c
    11b8:	03cfdf93          	srli	t6,t6,0x3c
    11bc:	03cede93          	srli	t4,t4,0x3c
    11c0:	03c35313          	srli	t1,t1,0x3c
    11c4:	9271                	srli	a2,a2,0x3c
    11c6:	0002c403          	lbu	s0,0(t0)
    11ca:	93be                	add	t2,t2,a5
    11cc:	000f4283          	lbu	t0,0(t5)
    11d0:	9fbe                	add	t6,t6,a5
    11d2:	000e4f03          	lbu	t5,0(t3)
    11d6:	9ebe                	add	t4,t4,a5
    11d8:	0008ce03          	lbu	t3,0(a7)
    11dc:	933e                	add	t1,t1,a5
    11de:	00084883          	lbu	a7,0(a6)
    11e2:	9bbe                	add	s7,s7,a5
    11e4:	00054803          	lbu	a6,0(a0)
    11e8:	963e                	add	a2,a2,a5
    11ea:	0005c503          	lbu	a0,0(a1)
    11ee:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    11f2:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    11f6:	0003c903          	lbu	s2,0(t2)
    11fa:	00064603          	lbu	a2,0(a2)
    11fe:	000fc383          	lbu	t2,0(t6)
    1202:	8b3d                	andi	a4,a4,15
    1204:	000ecf83          	lbu	t6,0(t4)
    1208:	92f1                	srli	a3,a3,0x3c
    120a:	00034e83          	lbu	t4,0(t1)
    120e:	000bc303          	lbu	t1,0(s7)
    1212:	96be                	add	a3,a3,a5
    1214:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    1216:	7761                	lui	a4,0xffff8
    1218:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    121c:	00710623          	sb	t2,12(sp)
    1220:	005106a3          	sb	t0,13(sp)
    1224:	01f10723          	sb	t6,14(sp)
    1228:	01e107a3          	sb	t5,15(sp)
    122c:	01d10823          	sb	t4,16(sp)
    1230:	01c108a3          	sb	t3,17(sp)
    1234:	00610923          	sb	t1,18(sp)
    1238:	011109a3          	sb	a7,19(sp)
    123c:	01010a23          	sb	a6,20(sp)
    1240:	00a10aa3          	sb	a0,21(sp)
    1244:	00b10b23          	sb	a1,22(sp)
    1248:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    124c:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1250:	01210523          	sb	s2,10(sp)
    1254:	008105a3          	sb	s0,11(sp)
    1258:	0006c703          	lbu	a4,0(a3)
    125c:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1260:	4649                	li	a2,18
    1262:	002c                	addi	a1,sp,8
    1264:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1266:	00e10c23          	sb	a4,24(sp)
    126a:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    126e:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1272:	313000ef          	jal	ra,1d84 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1276:	00248513          	addi	a0,s1,2
    127a:	bda5                	j	10f2 <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    127c:	00064783          	lbu	a5,0(a2)
    1280:	84b2                	mv	s1,a2
    1282:	01278963          	beq	a5,s2,1294 <printf+0x1e4>
    1286:	b561                	j	110e <printf+0x5e>
    1288:	0024c783          	lbu	a5,2(s1)
    128c:	0605                	addi	a2,a2,1
    128e:	0489                	addi	s1,s1,2
    1290:	e7279fe3          	bne	a5,s2,110e <printf+0x5e>
    1294:	0014c783          	lbu	a5,1(s1)
    1298:	ff2788e3          	beq	a5,s2,1288 <printf+0x1d8>
        l = z - a;
    129c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    12a0:	85aa                	mv	a1,a0
    12a2:	8622                	mv	a2,s0
    12a4:	4505                	li	a0,1
    12a6:	2df000ef          	jal	ra,1d84 <write>
        if (l)
    12aa:	e6040be3          	beqz	s0,1120 <printf+0x70>
    12ae:	8526                	mv	a0,s1
        if (!*s)
    12b0:	00054783          	lbu	a5,0(a0)
    12b4:	e40795e3          	bnez	a5,10fe <printf+0x4e>
    }
    va_end(ap);
    12b8:	70e6                	ld	ra,120(sp)
    12ba:	7446                	ld	s0,112(sp)
    12bc:	74a6                	ld	s1,104(sp)
    12be:	7906                	ld	s2,96(sp)
    12c0:	69e6                	ld	s3,88(sp)
    12c2:	6a46                	ld	s4,80(sp)
    12c4:	6aa6                	ld	s5,72(sp)
    12c6:	6b06                	ld	s6,64(sp)
    12c8:	7be2                	ld	s7,56(sp)
    12ca:	6129                	addi	sp,sp,192
    12cc:	8082                	ret
        switch (s[1])
    12ce:	07800713          	li	a4,120
    12d2:	24e79363          	bne	a5,a4,1518 <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    12d6:	6782                	ld	a5,0(sp)
    12d8:	4394                	lw	a3,0(a5)
    12da:	07a1                	addi	a5,a5,8
    12dc:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    12de:	2606c263          	bltz	a3,1542 <printf+0x492>
        buf[i--] = digits[x % base];
    12e2:	00001797          	auipc	a5,0x1
    12e6:	cbe78793          	addi	a5,a5,-834 # 1fa0 <digits>
    12ea:	00f6f713          	andi	a4,a3,15
    12ee:	973e                	add	a4,a4,a5
    12f0:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff6060>
    buf[16] = 0;
    12f4:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    12f8:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    12fa:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    12fe:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    1302:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    1306:	0046d51b          	srliw	a0,a3,0x4
    130a:	0ad5d563          	bge	a1,a3,13b4 <printf+0x304>
        buf[i--] = digits[x % base];
    130e:	8a3d                	andi	a2,a2,15
    1310:	963e                	add	a2,a2,a5
    1312:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1316:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    131a:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    131e:	30a5fe63          	bgeu	a1,a0,163a <printf+0x58a>
        buf[i--] = digits[x % base];
    1322:	00f77613          	andi	a2,a4,15
    1326:	963e                	add	a2,a2,a5
    1328:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    132c:	45bd                	li	a1,15
    132e:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    1332:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    1336:	00475513          	srli	a0,a4,0x4
    133a:	30e5f963          	bgeu	a1,a4,164c <printf+0x59c>
        buf[i--] = digits[x % base];
    133e:	8a3d                	andi	a2,a2,15
    1340:	963e                	add	a2,a2,a5
    1342:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    1346:	00875893          	srli	a7,a4,0x8
    134a:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    134e:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    1352:	30a5fd63          	bgeu	a1,a0,166c <printf+0x5bc>
        buf[i--] = digits[x % base];
    1356:	8a3d                	andi	a2,a2,15
    1358:	963e                	add	a2,a2,a5
    135a:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    135e:	00c75813          	srli	a6,a4,0xc
    1362:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    1366:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    136a:	3315fe63          	bgeu	a1,a7,16a6 <printf+0x5f6>
        buf[i--] = digits[x % base];
    136e:	8a3d                	andi	a2,a2,15
    1370:	963e                	add	a2,a2,a5
    1372:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1376:	01075893          	srli	a7,a4,0x10
    137a:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    137e:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    1382:	3305ff63          	bgeu	a1,a6,16c0 <printf+0x610>
        buf[i--] = digits[x % base];
    1386:	8a3d                	andi	a2,a2,15
    1388:	963e                	add	a2,a2,a5
    138a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    138e:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    1392:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1396:	3515f863          	bgeu	a1,a7,16e6 <printf+0x636>
        buf[i--] = digits[x % base];
    139a:	97ba                	add	a5,a5,a4
    139c:	0007c783          	lbu	a5,0(a5)
    13a0:	45a1                	li	a1,8
    13a2:	00f10823          	sb	a5,16(sp)
    if (sign)
    13a6:	0006d763          	bgez	a3,13b4 <printf+0x304>
        buf[i--] = '-';
    13aa:	02d00793          	li	a5,45
    13ae:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    13b2:	459d                	li	a1,7
    write(f, s, l);
    13b4:	4641                	li	a2,16
    13b6:	003c                	addi	a5,sp,8
    13b8:	9e0d                	subw	a2,a2,a1
    13ba:	4505                	li	a0,1
    13bc:	95be                	add	a1,a1,a5
    13be:	1c7000ef          	jal	ra,1d84 <write>
        s += 2;
    13c2:	00248513          	addi	a0,s1,2
    13c6:	b335                	j	10f2 <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    13c8:	6782                	ld	a5,0(sp)
    13ca:	6380                	ld	s0,0(a5)
    13cc:	07a1                	addi	a5,a5,8
    13ce:	e03e                	sd	a5,0(sp)
    13d0:	22040a63          	beqz	s0,1604 <printf+0x554>
            l = strnlen(a, 200);
    13d4:	0c800593          	li	a1,200
    13d8:	8522                	mv	a0,s0
    13da:	6cc000ef          	jal	ra,1aa6 <strnlen>
    write(f, s, l);
    13de:	0005061b          	sext.w	a2,a0
    13e2:	85a2                	mv	a1,s0
    13e4:	4505                	li	a0,1
    13e6:	19f000ef          	jal	ra,1d84 <write>
        s += 2;
    13ea:	00248513          	addi	a0,s1,2
    13ee:	b311                	j	10f2 <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    13f0:	6782                	ld	a5,0(sp)
    13f2:	4390                	lw	a2,0(a5)
    13f4:	07a1                	addi	a5,a5,8
    13f6:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    13f8:	1a064363          	bltz	a2,159e <printf+0x4ee>
        buf[i--] = digits[x % base];
    13fc:	46a9                	li	a3,10
    13fe:	02d6773b          	remuw	a4,a2,a3
    1402:	00001797          	auipc	a5,0x1
    1406:	b9e78793          	addi	a5,a5,-1122 # 1fa0 <digits>
    buf[16] = 0;
    140a:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    140e:	4525                	li	a0,9
        x = xx;
    1410:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    1414:	973e                	add	a4,a4,a5
    1416:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    141a:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    141e:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1422:	2cc55063          	bge	a0,a2,16e2 <printf+0x632>
    1426:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    142a:	02d5f73b          	remuw	a4,a1,a3
    142e:	1702                	slli	a4,a4,0x20
    1430:	9301                	srli	a4,a4,0x20
    1432:	973e                	add	a4,a4,a5
    1434:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    1438:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    143c:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    1440:	1f057d63          	bgeu	a0,a6,163a <printf+0x58a>
        buf[i--] = digits[x % base];
    1444:	4529                	li	a0,10
    } while ((x /= base) != 0);
    1446:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1448:	02a5f73b          	remuw	a4,a1,a0
    144c:	973e                	add	a4,a4,a5
    144e:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    1452:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    1456:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    145a:	1ab6f163          	bgeu	a3,a1,15fc <printf+0x54c>
    145e:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    1462:	02a776bb          	remuw	a3,a4,a0
    1466:	96be                	add	a3,a3,a5
    1468:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    146c:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1470:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1474:	20b87c63          	bgeu	a6,a1,168c <printf+0x5dc>
    1478:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    147c:	02a776bb          	remuw	a3,a4,a0
    1480:	96be                	add	a3,a3,a5
    1482:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1486:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    148a:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    148e:	20b87363          	bgeu	a6,a1,1694 <printf+0x5e4>
        buf[i--] = digits[x % base];
    1492:	02a776bb          	remuw	a3,a4,a0
    1496:	96be                	add	a3,a3,a5
    1498:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    149c:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14a0:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    14a4:	20b9f563          	bgeu	s3,a1,16ae <printf+0x5fe>
        buf[i--] = digits[x % base];
    14a8:	02a776bb          	remuw	a3,a4,a0
    14ac:	96be                	add	a3,a3,a5
    14ae:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14b2:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14b6:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    14ba:	20bafb63          	bgeu	s5,a1,16d0 <printf+0x620>
        buf[i--] = digits[x % base];
    14be:	02a776bb          	remuw	a3,a4,a0
    14c2:	96be                	add	a3,a3,a5
    14c4:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14c8:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14cc:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    14d0:	1eba7c63          	bgeu	s4,a1,16c8 <printf+0x618>
        buf[i--] = digits[x % base];
    14d4:	02a776bb          	remuw	a3,a4,a0
    14d8:	96be                	add	a3,a3,a5
    14da:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14de:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14e2:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    14e6:	14bb7163          	bgeu	s6,a1,1628 <printf+0x578>
        buf[i--] = digits[x % base];
    14ea:	1702                	slli	a4,a4,0x20
    14ec:	9301                	srli	a4,a4,0x20
    14ee:	97ba                	add	a5,a5,a4
    14f0:	0007c783          	lbu	a5,0(a5)
    14f4:	4599                	li	a1,6
    14f6:	00f10723          	sb	a5,14(sp)
    if (sign)
    14fa:	ea065de3          	bgez	a2,13b4 <printf+0x304>
        buf[i--] = '-';
    14fe:	02d00793          	li	a5,45
    1502:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1506:	4595                	li	a1,5
    write(f, s, l);
    1508:	003c                	addi	a5,sp,8
    150a:	4641                	li	a2,16
    150c:	9e0d                	subw	a2,a2,a1
    150e:	4505                	li	a0,1
    1510:	95be                	add	a1,a1,a5
    1512:	073000ef          	jal	ra,1d84 <write>
    1516:	b575                	j	13c2 <printf+0x312>
    char byte = c;
    1518:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    151c:	4605                	li	a2,1
    151e:	002c                	addi	a1,sp,8
    1520:	4505                	li	a0,1
    char byte = c;
    1522:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1526:	05f000ef          	jal	ra,1d84 <write>
    char byte = c;
    152a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    152e:	4605                	li	a2,1
    1530:	002c                	addi	a1,sp,8
    1532:	4505                	li	a0,1
    char byte = c;
    1534:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1538:	04d000ef          	jal	ra,1d84 <write>
        s += 2;
    153c:	00248513          	addi	a0,s1,2
    1540:	be4d                	j	10f2 <printf+0x42>
        x = -xx;
    1542:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    1546:	00001797          	auipc	a5,0x1
    154a:	a5a78793          	addi	a5,a5,-1446 # 1fa0 <digits>
    154e:	00f77613          	andi	a2,a4,15
    1552:	963e                	add	a2,a2,a5
    1554:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    1558:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    155c:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    155e:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1562:	0047551b          	srliw	a0,a4,0x4
    1566:	0047561b          	srliw	a2,a4,0x4
    156a:	0ab6d263          	bge	a3,a1,160e <printf+0x55e>
        buf[i--] = digits[x % base];
    156e:	8a3d                	andi	a2,a2,15
    1570:	963e                	add	a2,a2,a5
    1572:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    1576:	463d                	li	a2,15
    1578:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    157c:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    1580:	daa661e3          	bltu	a2,a0,1322 <printf+0x272>
        buf[i--] = '-';
    1584:	02d00793          	li	a5,45
    1588:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    158c:	45b5                	li	a1,13
    write(f, s, l);
    158e:	003c                	addi	a5,sp,8
    1590:	4641                	li	a2,16
    1592:	9e0d                	subw	a2,a2,a1
    1594:	4505                	li	a0,1
    1596:	95be                	add	a1,a1,a5
    1598:	7ec000ef          	jal	ra,1d84 <write>
    159c:	b51d                	j	13c2 <printf+0x312>
        x = -xx;
    159e:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    15a2:	46a9                	li	a3,10
    15a4:	02d875bb          	remuw	a1,a6,a3
    15a8:	00001797          	auipc	a5,0x1
    15ac:	9f878793          	addi	a5,a5,-1544 # 1fa0 <digits>
    buf[16] = 0;
    15b0:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    15b4:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    15b6:	95be                	add	a1,a1,a5
    15b8:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    15bc:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    15c0:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    15c4:	04a65563          	bge	a2,a0,160e <printf+0x55e>
    15c8:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    15cc:	02d775bb          	remuw	a1,a4,a3
    15d0:	95be                	add	a1,a1,a5
    15d2:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    15d6:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    15da:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    15de:	fb0573e3          	bgeu	a0,a6,1584 <printf+0x4d4>
        buf[i--] = digits[x % base];
    15e2:	4529                	li	a0,10
    } while ((x /= base) != 0);
    15e4:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    15e6:	02a5f73b          	remuw	a4,a1,a0
    15ea:	973e                	add	a4,a4,a5
    15ec:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    15f0:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    15f4:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    15f8:	e6b6e3e3          	bltu	a3,a1,145e <printf+0x3ae>
        buf[i--] = digits[x % base];
    15fc:	45b5                	li	a1,13
    if (sign)
    15fe:	da065be3          	bgez	a2,13b4 <printf+0x304>
    1602:	a881                	j	1652 <printf+0x5a2>
                a = "(null)";
    1604:	00001417          	auipc	s0,0x1
    1608:	97c40413          	addi	s0,s0,-1668 # 1f80 <unlink+0x56>
    160c:	b3e1                	j	13d4 <printf+0x324>
        buf[i--] = '-';
    160e:	02d00793          	li	a5,45
    1612:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1616:	45b9                	li	a1,14
    write(f, s, l);
    1618:	003c                	addi	a5,sp,8
    161a:	4641                	li	a2,16
    161c:	9e0d                	subw	a2,a2,a1
    161e:	4505                	li	a0,1
    1620:	95be                	add	a1,a1,a5
    1622:	762000ef          	jal	ra,1d84 <write>
    1626:	bb71                	j	13c2 <printf+0x312>
        buf[i--] = digits[x % base];
    1628:	459d                	li	a1,7
    if (sign)
    162a:	d80655e3          	bgez	a2,13b4 <printf+0x304>
        buf[i--] = '-';
    162e:	02d00793          	li	a5,45
    1632:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1636:	4599                	li	a1,6
    1638:	bbb5                	j	13b4 <printf+0x304>
    163a:	45b9                	li	a1,14
    write(f, s, l);
    163c:	003c                	addi	a5,sp,8
    163e:	4641                	li	a2,16
    1640:	9e0d                	subw	a2,a2,a1
    1642:	4505                	li	a0,1
    1644:	95be                	add	a1,a1,a5
    1646:	73e000ef          	jal	ra,1d84 <write>
    164a:	bba5                	j	13c2 <printf+0x312>
        buf[i--] = digits[x % base];
    164c:	45b5                	li	a1,13
    if (sign)
    164e:	d606d3e3          	bgez	a3,13b4 <printf+0x304>
        buf[i--] = '-';
    1652:	02d00793          	li	a5,45
    1656:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    165a:	45b1                	li	a1,12
    write(f, s, l);
    165c:	003c                	addi	a5,sp,8
    165e:	4641                	li	a2,16
    1660:	9e0d                	subw	a2,a2,a1
    1662:	4505                	li	a0,1
    1664:	95be                	add	a1,a1,a5
    1666:	71e000ef          	jal	ra,1d84 <write>
    166a:	bba1                	j	13c2 <printf+0x312>
        buf[i--] = digits[x % base];
    166c:	45b1                	li	a1,12
    if (sign)
    166e:	d406d3e3          	bgez	a3,13b4 <printf+0x304>
        buf[i--] = '-';
    1672:	02d00793          	li	a5,45
    1676:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    167a:	45ad                	li	a1,11
    write(f, s, l);
    167c:	003c                	addi	a5,sp,8
    167e:	4641                	li	a2,16
    1680:	9e0d                	subw	a2,a2,a1
    1682:	4505                	li	a0,1
    1684:	95be                	add	a1,a1,a5
    1686:	6fe000ef          	jal	ra,1d84 <write>
    168a:	bb25                	j	13c2 <printf+0x312>
        buf[i--] = digits[x % base];
    168c:	45b1                	li	a1,12
    if (sign)
    168e:	d20653e3          	bgez	a2,13b4 <printf+0x304>
    1692:	b7c5                	j	1672 <printf+0x5c2>
        buf[i--] = digits[x % base];
    1694:	45ad                	li	a1,11
    if (sign)
    1696:	d0065fe3          	bgez	a2,13b4 <printf+0x304>
        buf[i--] = '-';
    169a:	02d00793          	li	a5,45
    169e:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    16a2:	45a9                	li	a1,10
    16a4:	bb01                	j	13b4 <printf+0x304>
    16a6:	45ad                	li	a1,11
    if (sign)
    16a8:	d006d6e3          	bgez	a3,13b4 <printf+0x304>
    16ac:	b7fd                	j	169a <printf+0x5ea>
        buf[i--] = digits[x % base];
    16ae:	45a9                	li	a1,10
    if (sign)
    16b0:	d00652e3          	bgez	a2,13b4 <printf+0x304>
        buf[i--] = '-';
    16b4:	02d00793          	li	a5,45
    16b8:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    16bc:	45a5                	li	a1,9
    16be:	b9dd                	j	13b4 <printf+0x304>
    16c0:	45a9                	li	a1,10
    if (sign)
    16c2:	ce06d9e3          	bgez	a3,13b4 <printf+0x304>
    16c6:	b7fd                	j	16b4 <printf+0x604>
        buf[i--] = digits[x % base];
    16c8:	45a1                	li	a1,8
    if (sign)
    16ca:	ce0655e3          	bgez	a2,13b4 <printf+0x304>
    16ce:	b9f1                	j	13aa <printf+0x2fa>
        buf[i--] = digits[x % base];
    16d0:	45a5                	li	a1,9
    if (sign)
    16d2:	ce0651e3          	bgez	a2,13b4 <printf+0x304>
        buf[i--] = '-';
    16d6:	02d00793          	li	a5,45
    16da:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    16de:	45a1                	li	a1,8
    16e0:	b9d1                	j	13b4 <printf+0x304>
    i = 15;
    16e2:	45bd                	li	a1,15
    16e4:	b9c1                	j	13b4 <printf+0x304>
        buf[i--] = digits[x % base];
    16e6:	45a5                	li	a1,9
    if (sign)
    16e8:	cc06d6e3          	bgez	a3,13b4 <printf+0x304>
    16ec:	b7ed                	j	16d6 <printf+0x626>

00000000000016ee <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    16ee:	02000793          	li	a5,32
    16f2:	00f50663          	beq	a0,a5,16fe <isspace+0x10>
    16f6:	355d                	addiw	a0,a0,-9
    16f8:	00553513          	sltiu	a0,a0,5
    16fc:	8082                	ret
    16fe:	4505                	li	a0,1
}
    1700:	8082                	ret

0000000000001702 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1702:	fd05051b          	addiw	a0,a0,-48
}
    1706:	00a53513          	sltiu	a0,a0,10
    170a:	8082                	ret

000000000000170c <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    170c:	02000613          	li	a2,32
    1710:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1712:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1716:	ff77069b          	addiw	a3,a4,-9
    171a:	04c70d63          	beq	a4,a2,1774 <atoi+0x68>
    171e:	0007079b          	sext.w	a5,a4
    1722:	04d5f963          	bgeu	a1,a3,1774 <atoi+0x68>
        s++;
    switch (*s)
    1726:	02b00693          	li	a3,43
    172a:	04d70a63          	beq	a4,a3,177e <atoi+0x72>
    172e:	02d00693          	li	a3,45
    1732:	06d70463          	beq	a4,a3,179a <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1736:	fd07859b          	addiw	a1,a5,-48
    173a:	4625                	li	a2,9
    173c:	873e                	mv	a4,a5
    173e:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1740:	4e01                	li	t3,0
    while (isdigit(*s))
    1742:	04b66a63          	bltu	a2,a1,1796 <atoi+0x8a>
    int n = 0, neg = 0;
    1746:	4501                	li	a0,0
    while (isdigit(*s))
    1748:	4825                	li	a6,9
    174a:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    174e:	0025179b          	slliw	a5,a0,0x2
    1752:	9d3d                	addw	a0,a0,a5
    1754:	fd07031b          	addiw	t1,a4,-48
    1758:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    175c:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1760:	0685                	addi	a3,a3,1
    1762:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1766:	0006071b          	sext.w	a4,a2
    176a:	feb870e3          	bgeu	a6,a1,174a <atoi+0x3e>
    return neg ? n : -n;
    176e:	000e0563          	beqz	t3,1778 <atoi+0x6c>
}
    1772:	8082                	ret
        s++;
    1774:	0505                	addi	a0,a0,1
    1776:	bf71                	j	1712 <atoi+0x6>
    1778:	4113053b          	subw	a0,t1,a7
    177c:	8082                	ret
    while (isdigit(*s))
    177e:	00154783          	lbu	a5,1(a0)
    1782:	4625                	li	a2,9
        s++;
    1784:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1788:	fd07859b          	addiw	a1,a5,-48
    178c:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1790:	4e01                	li	t3,0
    while (isdigit(*s))
    1792:	fab67ae3          	bgeu	a2,a1,1746 <atoi+0x3a>
    1796:	4501                	li	a0,0
}
    1798:	8082                	ret
    while (isdigit(*s))
    179a:	00154783          	lbu	a5,1(a0)
    179e:	4625                	li	a2,9
        s++;
    17a0:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17a4:	fd07859b          	addiw	a1,a5,-48
    17a8:	0007871b          	sext.w	a4,a5
    17ac:	feb665e3          	bltu	a2,a1,1796 <atoi+0x8a>
        neg = 1;
    17b0:	4e05                	li	t3,1
    17b2:	bf51                	j	1746 <atoi+0x3a>

00000000000017b4 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    17b4:	16060d63          	beqz	a2,192e <memset+0x17a>
    17b8:	40a007b3          	neg	a5,a0
    17bc:	8b9d                	andi	a5,a5,7
    17be:	00778713          	addi	a4,a5,7
    17c2:	482d                	li	a6,11
    17c4:	0ff5f593          	andi	a1,a1,255
    17c8:	fff60693          	addi	a3,a2,-1
    17cc:	17076263          	bltu	a4,a6,1930 <memset+0x17c>
    17d0:	16e6ea63          	bltu	a3,a4,1944 <memset+0x190>
    17d4:	16078563          	beqz	a5,193e <memset+0x18a>
    17d8:	00b50023          	sb	a1,0(a0)
    17dc:	4705                	li	a4,1
    17de:	00150e93          	addi	t4,a0,1
    17e2:	14e78c63          	beq	a5,a4,193a <memset+0x186>
    17e6:	00b500a3          	sb	a1,1(a0)
    17ea:	4709                	li	a4,2
    17ec:	00250e93          	addi	t4,a0,2
    17f0:	14e78d63          	beq	a5,a4,194a <memset+0x196>
    17f4:	00b50123          	sb	a1,2(a0)
    17f8:	470d                	li	a4,3
    17fa:	00350e93          	addi	t4,a0,3
    17fe:	12e78b63          	beq	a5,a4,1934 <memset+0x180>
    1802:	00b501a3          	sb	a1,3(a0)
    1806:	4711                	li	a4,4
    1808:	00450e93          	addi	t4,a0,4
    180c:	14e78163          	beq	a5,a4,194e <memset+0x19a>
    1810:	00b50223          	sb	a1,4(a0)
    1814:	4715                	li	a4,5
    1816:	00550e93          	addi	t4,a0,5
    181a:	12e78c63          	beq	a5,a4,1952 <memset+0x19e>
    181e:	00b502a3          	sb	a1,5(a0)
    1822:	471d                	li	a4,7
    1824:	00650e93          	addi	t4,a0,6
    1828:	12e79763          	bne	a5,a4,1956 <memset+0x1a2>
    182c:	00750e93          	addi	t4,a0,7
    1830:	00b50323          	sb	a1,6(a0)
    1834:	4f1d                	li	t5,7
    1836:	00859713          	slli	a4,a1,0x8
    183a:	8f4d                	or	a4,a4,a1
    183c:	01059e13          	slli	t3,a1,0x10
    1840:	01c76e33          	or	t3,a4,t3
    1844:	01859313          	slli	t1,a1,0x18
    1848:	006e6333          	or	t1,t3,t1
    184c:	02059893          	slli	a7,a1,0x20
    1850:	011368b3          	or	a7,t1,a7
    1854:	02859813          	slli	a6,a1,0x28
    1858:	40f60333          	sub	t1,a2,a5
    185c:	0108e833          	or	a6,a7,a6
    1860:	03059693          	slli	a3,a1,0x30
    1864:	00d866b3          	or	a3,a6,a3
    1868:	03859713          	slli	a4,a1,0x38
    186c:	97aa                	add	a5,a5,a0
    186e:	ff837813          	andi	a6,t1,-8
    1872:	8f55                	or	a4,a4,a3
    1874:	00f806b3          	add	a3,a6,a5
    1878:	e398                	sd	a4,0(a5)
    187a:	07a1                	addi	a5,a5,8
    187c:	fed79ee3          	bne	a5,a3,1878 <memset+0xc4>
    1880:	ff837693          	andi	a3,t1,-8
    1884:	00de87b3          	add	a5,t4,a3
    1888:	01e6873b          	addw	a4,a3,t5
    188c:	0ad30663          	beq	t1,a3,1938 <memset+0x184>
    1890:	00b78023          	sb	a1,0(a5)
    1894:	0017069b          	addiw	a3,a4,1
    1898:	08c6fb63          	bgeu	a3,a2,192e <memset+0x17a>
    189c:	00b780a3          	sb	a1,1(a5)
    18a0:	0027069b          	addiw	a3,a4,2
    18a4:	08c6f563          	bgeu	a3,a2,192e <memset+0x17a>
    18a8:	00b78123          	sb	a1,2(a5)
    18ac:	0037069b          	addiw	a3,a4,3
    18b0:	06c6ff63          	bgeu	a3,a2,192e <memset+0x17a>
    18b4:	00b781a3          	sb	a1,3(a5)
    18b8:	0047069b          	addiw	a3,a4,4
    18bc:	06c6f963          	bgeu	a3,a2,192e <memset+0x17a>
    18c0:	00b78223          	sb	a1,4(a5)
    18c4:	0057069b          	addiw	a3,a4,5
    18c8:	06c6f363          	bgeu	a3,a2,192e <memset+0x17a>
    18cc:	00b782a3          	sb	a1,5(a5)
    18d0:	0067069b          	addiw	a3,a4,6
    18d4:	04c6fd63          	bgeu	a3,a2,192e <memset+0x17a>
    18d8:	00b78323          	sb	a1,6(a5)
    18dc:	0077069b          	addiw	a3,a4,7
    18e0:	04c6f763          	bgeu	a3,a2,192e <memset+0x17a>
    18e4:	00b783a3          	sb	a1,7(a5)
    18e8:	0087069b          	addiw	a3,a4,8
    18ec:	04c6f163          	bgeu	a3,a2,192e <memset+0x17a>
    18f0:	00b78423          	sb	a1,8(a5)
    18f4:	0097069b          	addiw	a3,a4,9
    18f8:	02c6fb63          	bgeu	a3,a2,192e <memset+0x17a>
    18fc:	00b784a3          	sb	a1,9(a5)
    1900:	00a7069b          	addiw	a3,a4,10
    1904:	02c6f563          	bgeu	a3,a2,192e <memset+0x17a>
    1908:	00b78523          	sb	a1,10(a5)
    190c:	00b7069b          	addiw	a3,a4,11
    1910:	00c6ff63          	bgeu	a3,a2,192e <memset+0x17a>
    1914:	00b785a3          	sb	a1,11(a5)
    1918:	00c7069b          	addiw	a3,a4,12
    191c:	00c6f963          	bgeu	a3,a2,192e <memset+0x17a>
    1920:	00b78623          	sb	a1,12(a5)
    1924:	2735                	addiw	a4,a4,13
    1926:	00c77463          	bgeu	a4,a2,192e <memset+0x17a>
    192a:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    192e:	8082                	ret
    1930:	472d                	li	a4,11
    1932:	bd79                	j	17d0 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1934:	4f0d                	li	t5,3
    1936:	b701                	j	1836 <memset+0x82>
    1938:	8082                	ret
    193a:	4f05                	li	t5,1
    193c:	bded                	j	1836 <memset+0x82>
    193e:	8eaa                	mv	t4,a0
    1940:	4f01                	li	t5,0
    1942:	bdd5                	j	1836 <memset+0x82>
    1944:	87aa                	mv	a5,a0
    1946:	4701                	li	a4,0
    1948:	b7a1                	j	1890 <memset+0xdc>
    194a:	4f09                	li	t5,2
    194c:	b5ed                	j	1836 <memset+0x82>
    194e:	4f11                	li	t5,4
    1950:	b5dd                	j	1836 <memset+0x82>
    1952:	4f15                	li	t5,5
    1954:	b5cd                	j	1836 <memset+0x82>
    1956:	4f19                	li	t5,6
    1958:	bdf9                	j	1836 <memset+0x82>

000000000000195a <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    195a:	00054783          	lbu	a5,0(a0)
    195e:	0005c703          	lbu	a4,0(a1)
    1962:	00e79863          	bne	a5,a4,1972 <strcmp+0x18>
    1966:	0505                	addi	a0,a0,1
    1968:	0585                	addi	a1,a1,1
    196a:	fbe5                	bnez	a5,195a <strcmp>
    196c:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    196e:	9d19                	subw	a0,a0,a4
    1970:	8082                	ret
    1972:	0007851b          	sext.w	a0,a5
    1976:	bfe5                	j	196e <strcmp+0x14>

0000000000001978 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1978:	ce05                	beqz	a2,19b0 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    197a:	00054703          	lbu	a4,0(a0)
    197e:	0005c783          	lbu	a5,0(a1)
    1982:	cb0d                	beqz	a4,19b4 <strncmp+0x3c>
    if (!n--)
    1984:	167d                	addi	a2,a2,-1
    1986:	00c506b3          	add	a3,a0,a2
    198a:	a819                	j	19a0 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    198c:	00a68e63          	beq	a3,a0,19a8 <strncmp+0x30>
    1990:	0505                	addi	a0,a0,1
    1992:	00e79b63          	bne	a5,a4,19a8 <strncmp+0x30>
    1996:	00054703          	lbu	a4,0(a0)
    199a:	0005c783          	lbu	a5,0(a1)
    199e:	cb19                	beqz	a4,19b4 <strncmp+0x3c>
    19a0:	0005c783          	lbu	a5,0(a1)
    19a4:	0585                	addi	a1,a1,1
    19a6:	f3fd                	bnez	a5,198c <strncmp+0x14>
        ;
    return *l - *r;
    19a8:	0007051b          	sext.w	a0,a4
    19ac:	9d1d                	subw	a0,a0,a5
    19ae:	8082                	ret
        return 0;
    19b0:	4501                	li	a0,0
}
    19b2:	8082                	ret
    19b4:	4501                	li	a0,0
    return *l - *r;
    19b6:	9d1d                	subw	a0,a0,a5
    19b8:	8082                	ret

00000000000019ba <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    19ba:	00757793          	andi	a5,a0,7
    19be:	cf89                	beqz	a5,19d8 <strlen+0x1e>
    19c0:	87aa                	mv	a5,a0
    19c2:	a029                	j	19cc <strlen+0x12>
    19c4:	0785                	addi	a5,a5,1
    19c6:	0077f713          	andi	a4,a5,7
    19ca:	cb01                	beqz	a4,19da <strlen+0x20>
        if (!*s)
    19cc:	0007c703          	lbu	a4,0(a5)
    19d0:	fb75                	bnez	a4,19c4 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    19d2:	40a78533          	sub	a0,a5,a0
}
    19d6:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    19d8:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    19da:	6394                	ld	a3,0(a5)
    19dc:	00000597          	auipc	a1,0x0
    19e0:	5ac5b583          	ld	a1,1452(a1) # 1f88 <unlink+0x5e>
    19e4:	00000617          	auipc	a2,0x0
    19e8:	5ac63603          	ld	a2,1452(a2) # 1f90 <unlink+0x66>
    19ec:	a019                	j	19f2 <strlen+0x38>
    19ee:	6794                	ld	a3,8(a5)
    19f0:	07a1                	addi	a5,a5,8
    19f2:	00b68733          	add	a4,a3,a1
    19f6:	fff6c693          	not	a3,a3
    19fa:	8f75                	and	a4,a4,a3
    19fc:	8f71                	and	a4,a4,a2
    19fe:	db65                	beqz	a4,19ee <strlen+0x34>
    for (; *s; s++)
    1a00:	0007c703          	lbu	a4,0(a5)
    1a04:	d779                	beqz	a4,19d2 <strlen+0x18>
    1a06:	0017c703          	lbu	a4,1(a5)
    1a0a:	0785                	addi	a5,a5,1
    1a0c:	d379                	beqz	a4,19d2 <strlen+0x18>
    1a0e:	0017c703          	lbu	a4,1(a5)
    1a12:	0785                	addi	a5,a5,1
    1a14:	fb6d                	bnez	a4,1a06 <strlen+0x4c>
    1a16:	bf75                	j	19d2 <strlen+0x18>

0000000000001a18 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a18:	00757713          	andi	a4,a0,7
{
    1a1c:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1a1e:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a22:	cb19                	beqz	a4,1a38 <memchr+0x20>
    1a24:	ce25                	beqz	a2,1a9c <memchr+0x84>
    1a26:	0007c703          	lbu	a4,0(a5)
    1a2a:	04b70e63          	beq	a4,a1,1a86 <memchr+0x6e>
    1a2e:	0785                	addi	a5,a5,1
    1a30:	0077f713          	andi	a4,a5,7
    1a34:	167d                	addi	a2,a2,-1
    1a36:	f77d                	bnez	a4,1a24 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1a38:	4501                	li	a0,0
    if (n && *s != c)
    1a3a:	c235                	beqz	a2,1a9e <memchr+0x86>
    1a3c:	0007c703          	lbu	a4,0(a5)
    1a40:	04b70363          	beq	a4,a1,1a86 <memchr+0x6e>
        size_t k = ONES * c;
    1a44:	00000517          	auipc	a0,0x0
    1a48:	55453503          	ld	a0,1364(a0) # 1f98 <unlink+0x6e>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a4c:	471d                	li	a4,7
        size_t k = ONES * c;
    1a4e:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a52:	02c77a63          	bgeu	a4,a2,1a86 <memchr+0x6e>
    1a56:	00000897          	auipc	a7,0x0
    1a5a:	5328b883          	ld	a7,1330(a7) # 1f88 <unlink+0x5e>
    1a5e:	00000817          	auipc	a6,0x0
    1a62:	53283803          	ld	a6,1330(a6) # 1f90 <unlink+0x66>
    1a66:	431d                	li	t1,7
    1a68:	a029                	j	1a72 <memchr+0x5a>
    1a6a:	1661                	addi	a2,a2,-8
    1a6c:	07a1                	addi	a5,a5,8
    1a6e:	02c37963          	bgeu	t1,a2,1aa0 <memchr+0x88>
    1a72:	6398                	ld	a4,0(a5)
    1a74:	8f29                	xor	a4,a4,a0
    1a76:	011706b3          	add	a3,a4,a7
    1a7a:	fff74713          	not	a4,a4
    1a7e:	8f75                	and	a4,a4,a3
    1a80:	01077733          	and	a4,a4,a6
    1a84:	d37d                	beqz	a4,1a6a <memchr+0x52>
    1a86:	853e                	mv	a0,a5
    1a88:	97b2                	add	a5,a5,a2
    1a8a:	a021                	j	1a92 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1a8c:	0505                	addi	a0,a0,1
    1a8e:	00f50763          	beq	a0,a5,1a9c <memchr+0x84>
    1a92:	00054703          	lbu	a4,0(a0)
    1a96:	feb71be3          	bne	a4,a1,1a8c <memchr+0x74>
    1a9a:	8082                	ret
    return n ? (void *)s : 0;
    1a9c:	4501                	li	a0,0
}
    1a9e:	8082                	ret
    return n ? (void *)s : 0;
    1aa0:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1aa2:	f275                	bnez	a2,1a86 <memchr+0x6e>
}
    1aa4:	8082                	ret

0000000000001aa6 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1aa6:	1101                	addi	sp,sp,-32
    1aa8:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1aaa:	862e                	mv	a2,a1
{
    1aac:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1aae:	4581                	li	a1,0
{
    1ab0:	e426                	sd	s1,8(sp)
    1ab2:	ec06                	sd	ra,24(sp)
    1ab4:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1ab6:	f63ff0ef          	jal	ra,1a18 <memchr>
    return p ? p - s : n;
    1aba:	c519                	beqz	a0,1ac8 <strnlen+0x22>
}
    1abc:	60e2                	ld	ra,24(sp)
    1abe:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1ac0:	8d05                	sub	a0,a0,s1
}
    1ac2:	64a2                	ld	s1,8(sp)
    1ac4:	6105                	addi	sp,sp,32
    1ac6:	8082                	ret
    1ac8:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1aca:	8522                	mv	a0,s0
}
    1acc:	6442                	ld	s0,16(sp)
    1ace:	64a2                	ld	s1,8(sp)
    1ad0:	6105                	addi	sp,sp,32
    1ad2:	8082                	ret

0000000000001ad4 <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1ad4:	00b547b3          	xor	a5,a0,a1
    1ad8:	8b9d                	andi	a5,a5,7
    1ada:	eb95                	bnez	a5,1b0e <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1adc:	0075f793          	andi	a5,a1,7
    1ae0:	e7b1                	bnez	a5,1b2c <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1ae2:	6198                	ld	a4,0(a1)
    1ae4:	00000617          	auipc	a2,0x0
    1ae8:	4a463603          	ld	a2,1188(a2) # 1f88 <unlink+0x5e>
    1aec:	00000817          	auipc	a6,0x0
    1af0:	4a483803          	ld	a6,1188(a6) # 1f90 <unlink+0x66>
    1af4:	a029                	j	1afe <stpcpy+0x2a>
    1af6:	e118                	sd	a4,0(a0)
    1af8:	6598                	ld	a4,8(a1)
    1afa:	05a1                	addi	a1,a1,8
    1afc:	0521                	addi	a0,a0,8
    1afe:	00c707b3          	add	a5,a4,a2
    1b02:	fff74693          	not	a3,a4
    1b06:	8ff5                	and	a5,a5,a3
    1b08:	0107f7b3          	and	a5,a5,a6
    1b0c:	d7ed                	beqz	a5,1af6 <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b0e:	0005c783          	lbu	a5,0(a1)
    1b12:	00f50023          	sb	a5,0(a0)
    1b16:	c785                	beqz	a5,1b3e <stpcpy+0x6a>
    1b18:	0015c783          	lbu	a5,1(a1)
    1b1c:	0505                	addi	a0,a0,1
    1b1e:	0585                	addi	a1,a1,1
    1b20:	00f50023          	sb	a5,0(a0)
    1b24:	fbf5                	bnez	a5,1b18 <stpcpy+0x44>
        ;
    return d;
}
    1b26:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1b28:	0505                	addi	a0,a0,1
    1b2a:	df45                	beqz	a4,1ae2 <stpcpy+0xe>
            if (!(*d = *s))
    1b2c:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1b30:	0585                	addi	a1,a1,1
    1b32:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1b36:	00f50023          	sb	a5,0(a0)
    1b3a:	f7fd                	bnez	a5,1b28 <stpcpy+0x54>
}
    1b3c:	8082                	ret
    1b3e:	8082                	ret

0000000000001b40 <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b40:	00b547b3          	xor	a5,a0,a1
    1b44:	8b9d                	andi	a5,a5,7
    1b46:	1a079863          	bnez	a5,1cf6 <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b4a:	0075f793          	andi	a5,a1,7
    1b4e:	16078463          	beqz	a5,1cb6 <stpncpy+0x176>
    1b52:	ea01                	bnez	a2,1b62 <stpncpy+0x22>
    1b54:	a421                	j	1d5c <stpncpy+0x21c>
    1b56:	167d                	addi	a2,a2,-1
    1b58:	0505                	addi	a0,a0,1
    1b5a:	14070e63          	beqz	a4,1cb6 <stpncpy+0x176>
    1b5e:	1a060863          	beqz	a2,1d0e <stpncpy+0x1ce>
    1b62:	0005c783          	lbu	a5,0(a1)
    1b66:	0585                	addi	a1,a1,1
    1b68:	0075f713          	andi	a4,a1,7
    1b6c:	00f50023          	sb	a5,0(a0)
    1b70:	f3fd                	bnez	a5,1b56 <stpncpy+0x16>
    1b72:	4805                	li	a6,1
    1b74:	1a061863          	bnez	a2,1d24 <stpncpy+0x1e4>
    1b78:	40a007b3          	neg	a5,a0
    1b7c:	8b9d                	andi	a5,a5,7
    1b7e:	4681                	li	a3,0
    1b80:	18061a63          	bnez	a2,1d14 <stpncpy+0x1d4>
    1b84:	00778713          	addi	a4,a5,7
    1b88:	45ad                	li	a1,11
    1b8a:	18b76363          	bltu	a4,a1,1d10 <stpncpy+0x1d0>
    1b8e:	1ae6eb63          	bltu	a3,a4,1d44 <stpncpy+0x204>
    1b92:	1a078363          	beqz	a5,1d38 <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b96:	00050023          	sb	zero,0(a0)
    1b9a:	4685                	li	a3,1
    1b9c:	00150713          	addi	a4,a0,1
    1ba0:	18d78f63          	beq	a5,a3,1d3e <stpncpy+0x1fe>
    1ba4:	000500a3          	sb	zero,1(a0)
    1ba8:	4689                	li	a3,2
    1baa:	00250713          	addi	a4,a0,2
    1bae:	18d78e63          	beq	a5,a3,1d4a <stpncpy+0x20a>
    1bb2:	00050123          	sb	zero,2(a0)
    1bb6:	468d                	li	a3,3
    1bb8:	00350713          	addi	a4,a0,3
    1bbc:	16d78c63          	beq	a5,a3,1d34 <stpncpy+0x1f4>
    1bc0:	000501a3          	sb	zero,3(a0)
    1bc4:	4691                	li	a3,4
    1bc6:	00450713          	addi	a4,a0,4
    1bca:	18d78263          	beq	a5,a3,1d4e <stpncpy+0x20e>
    1bce:	00050223          	sb	zero,4(a0)
    1bd2:	4695                	li	a3,5
    1bd4:	00550713          	addi	a4,a0,5
    1bd8:	16d78d63          	beq	a5,a3,1d52 <stpncpy+0x212>
    1bdc:	000502a3          	sb	zero,5(a0)
    1be0:	469d                	li	a3,7
    1be2:	00650713          	addi	a4,a0,6
    1be6:	16d79863          	bne	a5,a3,1d56 <stpncpy+0x216>
    1bea:	00750713          	addi	a4,a0,7
    1bee:	00050323          	sb	zero,6(a0)
    1bf2:	40f80833          	sub	a6,a6,a5
    1bf6:	ff887593          	andi	a1,a6,-8
    1bfa:	97aa                	add	a5,a5,a0
    1bfc:	95be                	add	a1,a1,a5
    1bfe:	0007b023          	sd	zero,0(a5)
    1c02:	07a1                	addi	a5,a5,8
    1c04:	feb79de3          	bne	a5,a1,1bfe <stpncpy+0xbe>
    1c08:	ff887593          	andi	a1,a6,-8
    1c0c:	9ead                	addw	a3,a3,a1
    1c0e:	00b707b3          	add	a5,a4,a1
    1c12:	12b80863          	beq	a6,a1,1d42 <stpncpy+0x202>
    1c16:	00078023          	sb	zero,0(a5)
    1c1a:	0016871b          	addiw	a4,a3,1
    1c1e:	0ec77863          	bgeu	a4,a2,1d0e <stpncpy+0x1ce>
    1c22:	000780a3          	sb	zero,1(a5)
    1c26:	0026871b          	addiw	a4,a3,2
    1c2a:	0ec77263          	bgeu	a4,a2,1d0e <stpncpy+0x1ce>
    1c2e:	00078123          	sb	zero,2(a5)
    1c32:	0036871b          	addiw	a4,a3,3
    1c36:	0cc77c63          	bgeu	a4,a2,1d0e <stpncpy+0x1ce>
    1c3a:	000781a3          	sb	zero,3(a5)
    1c3e:	0046871b          	addiw	a4,a3,4
    1c42:	0cc77663          	bgeu	a4,a2,1d0e <stpncpy+0x1ce>
    1c46:	00078223          	sb	zero,4(a5)
    1c4a:	0056871b          	addiw	a4,a3,5
    1c4e:	0cc77063          	bgeu	a4,a2,1d0e <stpncpy+0x1ce>
    1c52:	000782a3          	sb	zero,5(a5)
    1c56:	0066871b          	addiw	a4,a3,6
    1c5a:	0ac77a63          	bgeu	a4,a2,1d0e <stpncpy+0x1ce>
    1c5e:	00078323          	sb	zero,6(a5)
    1c62:	0076871b          	addiw	a4,a3,7
    1c66:	0ac77463          	bgeu	a4,a2,1d0e <stpncpy+0x1ce>
    1c6a:	000783a3          	sb	zero,7(a5)
    1c6e:	0086871b          	addiw	a4,a3,8
    1c72:	08c77e63          	bgeu	a4,a2,1d0e <stpncpy+0x1ce>
    1c76:	00078423          	sb	zero,8(a5)
    1c7a:	0096871b          	addiw	a4,a3,9
    1c7e:	08c77863          	bgeu	a4,a2,1d0e <stpncpy+0x1ce>
    1c82:	000784a3          	sb	zero,9(a5)
    1c86:	00a6871b          	addiw	a4,a3,10
    1c8a:	08c77263          	bgeu	a4,a2,1d0e <stpncpy+0x1ce>
    1c8e:	00078523          	sb	zero,10(a5)
    1c92:	00b6871b          	addiw	a4,a3,11
    1c96:	06c77c63          	bgeu	a4,a2,1d0e <stpncpy+0x1ce>
    1c9a:	000785a3          	sb	zero,11(a5)
    1c9e:	00c6871b          	addiw	a4,a3,12
    1ca2:	06c77663          	bgeu	a4,a2,1d0e <stpncpy+0x1ce>
    1ca6:	00078623          	sb	zero,12(a5)
    1caa:	26b5                	addiw	a3,a3,13
    1cac:	06c6f163          	bgeu	a3,a2,1d0e <stpncpy+0x1ce>
    1cb0:	000786a3          	sb	zero,13(a5)
    1cb4:	8082                	ret
            ;
        if (!n || !*s)
    1cb6:	c645                	beqz	a2,1d5e <stpncpy+0x21e>
    1cb8:	0005c783          	lbu	a5,0(a1)
    1cbc:	ea078be3          	beqz	a5,1b72 <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1cc0:	479d                	li	a5,7
    1cc2:	02c7ff63          	bgeu	a5,a2,1d00 <stpncpy+0x1c0>
    1cc6:	00000897          	auipc	a7,0x0
    1cca:	2c28b883          	ld	a7,706(a7) # 1f88 <unlink+0x5e>
    1cce:	00000817          	auipc	a6,0x0
    1cd2:	2c283803          	ld	a6,706(a6) # 1f90 <unlink+0x66>
    1cd6:	431d                	li	t1,7
    1cd8:	6198                	ld	a4,0(a1)
    1cda:	011707b3          	add	a5,a4,a7
    1cde:	fff74693          	not	a3,a4
    1ce2:	8ff5                	and	a5,a5,a3
    1ce4:	0107f7b3          	and	a5,a5,a6
    1ce8:	ef81                	bnez	a5,1d00 <stpncpy+0x1c0>
            *wd = *ws;
    1cea:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1cec:	1661                	addi	a2,a2,-8
    1cee:	05a1                	addi	a1,a1,8
    1cf0:	0521                	addi	a0,a0,8
    1cf2:	fec363e3          	bltu	t1,a2,1cd8 <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1cf6:	e609                	bnez	a2,1d00 <stpncpy+0x1c0>
    1cf8:	a08d                	j	1d5a <stpncpy+0x21a>
    1cfa:	167d                	addi	a2,a2,-1
    1cfc:	0505                	addi	a0,a0,1
    1cfe:	ca01                	beqz	a2,1d0e <stpncpy+0x1ce>
    1d00:	0005c783          	lbu	a5,0(a1)
    1d04:	0585                	addi	a1,a1,1
    1d06:	00f50023          	sb	a5,0(a0)
    1d0a:	fbe5                	bnez	a5,1cfa <stpncpy+0x1ba>
        ;
tail:
    1d0c:	b59d                	j	1b72 <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1d0e:	8082                	ret
    1d10:	472d                	li	a4,11
    1d12:	bdb5                	j	1b8e <stpncpy+0x4e>
    1d14:	00778713          	addi	a4,a5,7
    1d18:	45ad                	li	a1,11
    1d1a:	fff60693          	addi	a3,a2,-1
    1d1e:	e6b778e3          	bgeu	a4,a1,1b8e <stpncpy+0x4e>
    1d22:	b7fd                	j	1d10 <stpncpy+0x1d0>
    1d24:	40a007b3          	neg	a5,a0
    1d28:	8832                	mv	a6,a2
    1d2a:	8b9d                	andi	a5,a5,7
    1d2c:	4681                	li	a3,0
    1d2e:	e4060be3          	beqz	a2,1b84 <stpncpy+0x44>
    1d32:	b7cd                	j	1d14 <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d34:	468d                	li	a3,3
    1d36:	bd75                	j	1bf2 <stpncpy+0xb2>
    1d38:	872a                	mv	a4,a0
    1d3a:	4681                	li	a3,0
    1d3c:	bd5d                	j	1bf2 <stpncpy+0xb2>
    1d3e:	4685                	li	a3,1
    1d40:	bd4d                	j	1bf2 <stpncpy+0xb2>
    1d42:	8082                	ret
    1d44:	87aa                	mv	a5,a0
    1d46:	4681                	li	a3,0
    1d48:	b5f9                	j	1c16 <stpncpy+0xd6>
    1d4a:	4689                	li	a3,2
    1d4c:	b55d                	j	1bf2 <stpncpy+0xb2>
    1d4e:	4691                	li	a3,4
    1d50:	b54d                	j	1bf2 <stpncpy+0xb2>
    1d52:	4695                	li	a3,5
    1d54:	bd79                	j	1bf2 <stpncpy+0xb2>
    1d56:	4699                	li	a3,6
    1d58:	bd69                	j	1bf2 <stpncpy+0xb2>
    1d5a:	8082                	ret
    1d5c:	8082                	ret
    1d5e:	8082                	ret

0000000000001d60 <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1d60:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1d64:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d66:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1d6a:	2501                	sext.w	a0,a0
    1d6c:	8082                	ret

0000000000001d6e <close>:
    register long a7 __asm__("a7") = n;
    1d6e:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d72:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d76:	2501                	sext.w	a0,a0
    1d78:	8082                	ret

0000000000001d7a <read>:
    register long a7 __asm__("a7") = n;
    1d7a:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d7e:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d82:	8082                	ret

0000000000001d84 <write>:
    register long a7 __asm__("a7") = n;
    1d84:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d88:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d8c:	8082                	ret

0000000000001d8e <getpid>:
    register long a7 __asm__("a7") = n;
    1d8e:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d92:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1d96:	2501                	sext.w	a0,a0
    1d98:	8082                	ret

0000000000001d9a <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d9a:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d9e:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1da2:	2501                	sext.w	a0,a0
    1da4:	8082                	ret

0000000000001da6 <fork>:
    register long a7 __asm__("a7") = n;
    1da6:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1daa:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1dae:	2501                	sext.w	a0,a0
    1db0:	8082                	ret

0000000000001db2 <exit>:
    register long a7 __asm__("a7") = n;
    1db2:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1db6:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1dba:	8082                	ret

0000000000001dbc <waitpid>:
    register long a7 __asm__("a7") = n;
    1dbc:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc0:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	8082                	ret

0000000000001dc8 <exec>:
    register long a7 __asm__("a7") = n;
    1dc8:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1dcc:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <get_time>:

int64 get_time()
{
    1dd4:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1dd6:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1dda:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ddc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dde:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1de2:	2501                	sext.w	a0,a0
    1de4:	ed09                	bnez	a0,1dfe <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1de6:	67a2                	ld	a5,8(sp)
    1de8:	3e800713          	li	a4,1000
    1dec:	00015503          	lhu	a0,0(sp)
    1df0:	02e7d7b3          	divu	a5,a5,a4
    1df4:	02e50533          	mul	a0,a0,a4
    1df8:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1dfa:	0141                	addi	sp,sp,16
    1dfc:	8082                	ret
        return -1;
    1dfe:	557d                	li	a0,-1
    1e00:	bfed                	j	1dfa <get_time+0x26>

0000000000001e02 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e02:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e06:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e0a:	2501                	sext.w	a0,a0
    1e0c:	8082                	ret

0000000000001e0e <sleep>:

int sleep(unsigned long long time)
{
    1e0e:	1141                	addi	sp,sp,-16
    1e10:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1e12:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e16:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e18:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e1a:	00000073          	ecall
    if (err == 0)
    1e1e:	2501                	sext.w	a0,a0
    1e20:	e13d                	bnez	a0,1e86 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e22:	6722                	ld	a4,8(sp)
    1e24:	3e800693          	li	a3,1000
    1e28:	00015783          	lhu	a5,0(sp)
    1e2c:	02d75733          	divu	a4,a4,a3
    1e30:	02d787b3          	mul	a5,a5,a3
    1e34:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1e36:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e3a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e3c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e3e:	00000073          	ecall
    if (err == 0)
    1e42:	2501                	sext.w	a0,a0
    1e44:	ed15                	bnez	a0,1e80 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e46:	6841                	lui	a6,0x10
    1e48:	963e                	add	a2,a2,a5
    1e4a:	187d                	addi	a6,a6,-1
    1e4c:	3e800693          	li	a3,1000
    1e50:	a819                	j	1e66 <sleep+0x58>
    __asm_syscall("r"(a7))
    1e52:	00000073          	ecall
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
    1e64:	ed11                	bnez	a0,1e80 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e66:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1e68:	07c00893          	li	a7,124
    1e6c:	02d7d733          	divu	a4,a5,a3
    1e70:	6782                	ld	a5,0(sp)
    1e72:	0107f7b3          	and	a5,a5,a6
    1e76:	02d787b3          	mul	a5,a5,a3
    1e7a:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1e7c:	fcc7ebe3          	bltu	a5,a2,1e52 <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1e80:	4501                	li	a0,0
    1e82:	0141                	addi	sp,sp,16
    1e84:	8082                	ret
    1e86:	57fd                	li	a5,-1
    1e88:	b77d                	j	1e36 <sleep+0x28>

0000000000001e8a <set_priority>:
    register long a7 __asm__("a7") = n;
    1e8a:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e8e:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e92:	2501                	sext.w	a0,a0
    1e94:	8082                	ret

0000000000001e96 <mmap>:
    register long a7 __asm__("a7") = n;
    1e96:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e9a:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1e9e:	2501                	sext.w	a0,a0
    1ea0:	8082                	ret

0000000000001ea2 <munmap>:
    register long a7 __asm__("a7") = n;
    1ea2:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea6:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1eaa:	2501                	sext.w	a0,a0
    1eac:	8082                	ret

0000000000001eae <wait>:

int wait(int *code)
{
    1eae:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1eb0:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1eb4:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb6:	00000073          	ecall
    return waitpid(-1, code);
}
    1eba:	2501                	sext.w	a0,a0
    1ebc:	8082                	ret

0000000000001ebe <spawn>:
    register long a7 __asm__("a7") = n;
    1ebe:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1ec2:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1ec6:	2501                	sext.w	a0,a0
    1ec8:	8082                	ret

0000000000001eca <mailread>:
    register long a7 __asm__("a7") = n;
    1eca:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ece:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ed2:	2501                	sext.w	a0,a0
    1ed4:	8082                	ret

0000000000001ed6 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1ed6:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eda:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1ede:	2501                	sext.w	a0,a0
    1ee0:	8082                	ret

0000000000001ee2 <fstat>:
    register long a7 __asm__("a7") = n;
    1ee2:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ee6:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1eea:	2501                	sext.w	a0,a0
    1eec:	8082                	ret

0000000000001eee <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1eee:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1ef0:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1ef4:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ef6:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1efa:	2501                	sext.w	a0,a0
    1efc:	8082                	ret

0000000000001efe <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1efe:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f00:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f04:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f06:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f0a:	2501                	sext.w	a0,a0
    1f0c:	8082                	ret

0000000000001f0e <link>:

int link(char *old_path, char *new_path)
{
    1f0e:	87aa                	mv	a5,a0
    1f10:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f12:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f16:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f1a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f1c:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f20:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f22:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f26:	2501                	sext.w	a0,a0
    1f28:	8082                	ret

0000000000001f2a <unlink>:

int unlink(char *path)
{
    1f2a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f2c:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f30:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f34:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f36:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f3a:	2501                	sext.w	a0,a0
    1f3c:	8082                	ret
