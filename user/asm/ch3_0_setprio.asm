
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch3_0_setprio:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0820006f          	j	1084 <__start_main>

0000000000001006 <main>:

/// 正确输出：（无报错信息）
/// Test set_priority OK!

int main()
{
    1006:	1141                	addi	sp,sp,-16
    assert(set_priority(10) == 10);
    1008:	4529                	li	a0,10
{
    100a:	e406                	sd	ra,8(sp)
    100c:	e022                	sd	s0,0(sp)
    assert(set_priority(10) == 10);
    100e:	6e3000ef          	jal	ra,1ef0 <set_priority>
    1012:	47a9                	li	a5,10
    1014:	00f50563          	beq	a0,a5,101e <main+0x18>
    1018:	557d                	li	a0,-1
    101a:	5ff000ef          	jal	ra,1e18 <exit>
    assert(set_priority(INT_MAX) == INT_MAX);
    101e:	80000437          	lui	s0,0x80000
    1022:	fff44513          	not	a0,s0
    1026:	6cb000ef          	jal	ra,1ef0 <set_priority>
    102a:	fff44413          	not	s0,s0
    102e:	00850563          	beq	a0,s0,1038 <main+0x32>
    1032:	557d                	li	a0,-1
    1034:	5e5000ef          	jal	ra,1e18 <exit>
    assert(set_priority(0) == -1);
    1038:	4501                	li	a0,0
    103a:	6b7000ef          	jal	ra,1ef0 <set_priority>
    103e:	57fd                	li	a5,-1
    1040:	00f50563          	beq	a0,a5,104a <main+0x44>
    1044:	557d                	li	a0,-1
    1046:	5d3000ef          	jal	ra,1e18 <exit>
    assert(set_priority(1) == -1);
    104a:	4505                	li	a0,1
    104c:	6a5000ef          	jal	ra,1ef0 <set_priority>
    1050:	57fd                	li	a5,-1
    1052:	00f50563          	beq	a0,a5,105c <main+0x56>
    1056:	557d                	li	a0,-1
    1058:	5c1000ef          	jal	ra,1e18 <exit>
    assert(set_priority(-10) == -1);
    105c:	5559                	li	a0,-10
    105e:	693000ef          	jal	ra,1ef0 <set_priority>
    1062:	57fd                	li	a5,-1
    1064:	00f50563          	beq	a0,a5,106e <main+0x68>
    1068:	557d                	li	a0,-1
    106a:	5af000ef          	jal	ra,1e18 <exit>
    puts("Test set_priority OK!");
    106e:	00001517          	auipc	a0,0x1
    1072:	f3a50513          	addi	a0,a0,-198 # 1fa8 <unlink+0x18>
    1076:	05e000ef          	jal	ra,10d4 <puts>
    return 0;
}
    107a:	60a2                	ld	ra,8(sp)
    107c:	6402                	ld	s0,0(sp)
    107e:	4501                	li	a0,0
    1080:	0141                	addi	sp,sp,16
    1082:	8082                	ret

0000000000001084 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1084:	1141                	addi	sp,sp,-16
    1086:	e406                	sd	ra,8(sp)
    exit(main());
    1088:	f7fff0ef          	jal	ra,1006 <main>
    108c:	58d000ef          	jal	ra,1e18 <exit>
    return 0;
}
    1090:	60a2                	ld	ra,8(sp)
    1092:	4501                	li	a0,0
    1094:	0141                	addi	sp,sp,16
    1096:	8082                	ret

0000000000001098 <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    1098:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    109a:	00f10593          	addi	a1,sp,15
    109e:	4605                	li	a2,1
    10a0:	4501                	li	a0,0
{
    10a2:	ec06                	sd	ra,24(sp)
    char byte = 0;
    10a4:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    10a8:	539000ef          	jal	ra,1de0 <read>
    return byte;
}
    10ac:	60e2                	ld	ra,24(sp)
    10ae:	00f14503          	lbu	a0,15(sp)
    10b2:	6105                	addi	sp,sp,32
    10b4:	8082                	ret

00000000000010b6 <putchar>:

int putchar(int c)
{
    10b6:	1101                	addi	sp,sp,-32
    10b8:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    10ba:	00f10593          	addi	a1,sp,15
    10be:	4605                	li	a2,1
    10c0:	4505                	li	a0,1
{
    10c2:	ec06                	sd	ra,24(sp)
    char byte = c;
    10c4:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    10c8:	523000ef          	jal	ra,1dea <write>
}
    10cc:	60e2                	ld	ra,24(sp)
    10ce:	2501                	sext.w	a0,a0
    10d0:	6105                	addi	sp,sp,32
    10d2:	8082                	ret

00000000000010d4 <puts>:

int puts(const char *s)
{
    10d4:	1101                	addi	sp,sp,-32
    10d6:	e822                	sd	s0,16(sp)
    10d8:	ec06                	sd	ra,24(sp)
    10da:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    10dc:	145000ef          	jal	ra,1a20 <strlen>
    10e0:	862a                	mv	a2,a0
    10e2:	85a2                	mv	a1,s0
    10e4:	4505                	li	a0,1
    10e6:	505000ef          	jal	ra,1dea <write>
    10ea:	00055763          	bgez	a0,10f8 <puts+0x24>
    return r;
}
    10ee:	60e2                	ld	ra,24(sp)
    10f0:	6442                	ld	s0,16(sp)
    10f2:	557d                	li	a0,-1
    10f4:	6105                	addi	sp,sp,32
    10f6:	8082                	ret
    return write(stdout, &byte, 1);
    10f8:	00f10593          	addi	a1,sp,15
    char byte = c;
    10fc:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    10fe:	4605                	li	a2,1
    1100:	4505                	li	a0,1
    char byte = c;
    1102:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1106:	4e5000ef          	jal	ra,1dea <write>
}
    110a:	60e2                	ld	ra,24(sp)
    110c:	6442                	ld	s0,16(sp)
    110e:	41f5551b          	sraiw	a0,a0,0x1f
    1112:	6105                	addi	sp,sp,32
    1114:	8082                	ret

0000000000001116 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1116:	7131                	addi	sp,sp,-192
    1118:	ecce                	sd	s3,88(sp)
    111a:	e8d2                	sd	s4,80(sp)
    111c:	e4d6                	sd	s5,72(sp)
    111e:	e0da                	sd	s6,64(sp)
    1120:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    1122:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1124:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    1126:	6ae1                	lui	s5,0x18
    1128:	000f4a37          	lui	s4,0xf4
    112c:	00989b37          	lui	s6,0x989
{
    1130:	fc86                	sd	ra,120(sp)
    1132:	f8a2                	sd	s0,112(sp)
    1134:	f4a6                	sd	s1,104(sp)
    1136:	f0ca                	sd	s2,96(sp)
    1138:	fc5e                	sd	s7,56(sp)
    113a:	e52e                	sd	a1,136(sp)
    113c:	e932                	sd	a2,144(sp)
    113e:	ed36                	sd	a3,152(sp)
    1140:	f13a                	sd	a4,160(sp)
    1142:	f942                	sd	a6,176(sp)
    1144:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1146:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    1148:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x72f>
    114c:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x166bf>
    1150:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf225f>
    1154:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x98769f>
    for (;;)
    {
        if (!*s)
    1158:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    115c:	02500913          	li	s2,37
        if (!*s)
    1160:	1a078f63          	beqz	a5,131e <printf+0x208>
    1164:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1166:	17278e63          	beq	a5,s2,12e2 <printf+0x1cc>
    116a:	00164783          	lbu	a5,1(a2)
    116e:	0605                	addi	a2,a2,1
    1170:	fbfd                	bnez	a5,1166 <printf+0x50>
    1172:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    1174:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1178:	85aa                	mv	a1,a0
    117a:	8622                	mv	a2,s0
    117c:	4505                	li	a0,1
    117e:	46d000ef          	jal	ra,1dea <write>
        out(f, a, l);
        if (l)
    1182:	18041963          	bnez	s0,1314 <printf+0x1fe>
            continue;
        if (s[1] == 0)
    1186:	0014c783          	lbu	a5,1(s1)
    118a:	18078a63          	beqz	a5,131e <printf+0x208>
            break;
        switch (s[1])
    118e:	07300713          	li	a4,115
    1192:	28e78e63          	beq	a5,a4,142e <printf+0x318>
    1196:	18f76f63          	bltu	a4,a5,1334 <printf+0x21e>
    119a:	06400713          	li	a4,100
    119e:	2ae78c63          	beq	a5,a4,1456 <printf+0x340>
    11a2:	07000713          	li	a4,112
    11a6:	3ce79c63          	bne	a5,a4,157e <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    11aa:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    11ac:	00001797          	auipc	a5,0x1
    11b0:	e3478793          	addi	a5,a5,-460 # 1fe0 <digits>
            printptr(va_arg(ap, uint64));
    11b4:	6298                	ld	a4,0(a3)
    11b6:	00868093          	addi	ra,a3,8
    11ba:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    11bc:	00471293          	slli	t0,a4,0x4
    11c0:	00c71f13          	slli	t5,a4,0xc
    11c4:	01471e13          	slli	t3,a4,0x14
    11c8:	01c71893          	slli	a7,a4,0x1c
    11cc:	02471813          	slli	a6,a4,0x24
    11d0:	02871513          	slli	a0,a4,0x28
    11d4:	02c71593          	slli	a1,a4,0x2c
    11d8:	03071693          	slli	a3,a4,0x30
    11dc:	00871f93          	slli	t6,a4,0x8
    11e0:	01071e93          	slli	t4,a4,0x10
    11e4:	01871313          	slli	t1,a4,0x18
    11e8:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    11ec:	03c2d293          	srli	t0,t0,0x3c
    11f0:	03cf5f13          	srli	t5,t5,0x3c
    11f4:	03ce5e13          	srli	t3,t3,0x3c
    11f8:	03c8d893          	srli	a7,a7,0x3c
    11fc:	03c85813          	srli	a6,a6,0x3c
    1200:	9171                	srli	a0,a0,0x3c
    1202:	91f1                	srli	a1,a1,0x3c
    1204:	92f1                	srli	a3,a3,0x3c
    1206:	92be                	add	t0,t0,a5
    1208:	9f3e                	add	t5,t5,a5
    120a:	9e3e                	add	t3,t3,a5
    120c:	98be                	add	a7,a7,a5
    120e:	983e                	add	a6,a6,a5
    1210:	953e                	add	a0,a0,a5
    1212:	95be                	add	a1,a1,a5
    1214:	96be                	add	a3,a3,a5
    1216:	03c75393          	srli	t2,a4,0x3c
    121a:	01c75b9b          	srliw	s7,a4,0x1c
    121e:	03cfdf93          	srli	t6,t6,0x3c
    1222:	03cede93          	srli	t4,t4,0x3c
    1226:	03c35313          	srli	t1,t1,0x3c
    122a:	9271                	srli	a2,a2,0x3c
    122c:	0002c403          	lbu	s0,0(t0)
    1230:	93be                	add	t2,t2,a5
    1232:	000f4283          	lbu	t0,0(t5)
    1236:	9fbe                	add	t6,t6,a5
    1238:	000e4f03          	lbu	t5,0(t3)
    123c:	9ebe                	add	t4,t4,a5
    123e:	0008ce03          	lbu	t3,0(a7)
    1242:	933e                	add	t1,t1,a5
    1244:	00084883          	lbu	a7,0(a6)
    1248:	9bbe                	add	s7,s7,a5
    124a:	00054803          	lbu	a6,0(a0)
    124e:	963e                	add	a2,a2,a5
    1250:	0005c503          	lbu	a0,0(a1)
    1254:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1258:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    125c:	0003c903          	lbu	s2,0(t2)
    1260:	00064603          	lbu	a2,0(a2)
    1264:	000fc383          	lbu	t2,0(t6)
    1268:	8b3d                	andi	a4,a4,15
    126a:	000ecf83          	lbu	t6,0(t4)
    126e:	92f1                	srli	a3,a3,0x3c
    1270:	00034e83          	lbu	t4,0(t1)
    1274:	000bc303          	lbu	t1,0(s7)
    1278:	96be                	add	a3,a3,a5
    127a:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    127c:	7761                	lui	a4,0xffff8
    127e:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1282:	00710623          	sb	t2,12(sp)
    1286:	005106a3          	sb	t0,13(sp)
    128a:	01f10723          	sb	t6,14(sp)
    128e:	01e107a3          	sb	t5,15(sp)
    1292:	01d10823          	sb	t4,16(sp)
    1296:	01c108a3          	sb	t3,17(sp)
    129a:	00610923          	sb	t1,18(sp)
    129e:	011109a3          	sb	a7,19(sp)
    12a2:	01010a23          	sb	a6,20(sp)
    12a6:	00a10aa3          	sb	a0,21(sp)
    12aa:	00b10b23          	sb	a1,22(sp)
    12ae:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    12b2:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12b6:	01210523          	sb	s2,10(sp)
    12ba:	008105a3          	sb	s0,11(sp)
    12be:	0006c703          	lbu	a4,0(a3)
    12c2:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    12c6:	4649                	li	a2,18
    12c8:	002c                	addi	a1,sp,8
    12ca:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12cc:	00e10c23          	sb	a4,24(sp)
    12d0:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    12d4:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    12d8:	313000ef          	jal	ra,1dea <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    12dc:	00248513          	addi	a0,s1,2
    12e0:	bda5                	j	1158 <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    12e2:	00064783          	lbu	a5,0(a2)
    12e6:	84b2                	mv	s1,a2
    12e8:	01278963          	beq	a5,s2,12fa <printf+0x1e4>
    12ec:	b561                	j	1174 <printf+0x5e>
    12ee:	0024c783          	lbu	a5,2(s1)
    12f2:	0605                	addi	a2,a2,1
    12f4:	0489                	addi	s1,s1,2
    12f6:	e7279fe3          	bne	a5,s2,1174 <printf+0x5e>
    12fa:	0014c783          	lbu	a5,1(s1)
    12fe:	ff2788e3          	beq	a5,s2,12ee <printf+0x1d8>
        l = z - a;
    1302:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1306:	85aa                	mv	a1,a0
    1308:	8622                	mv	a2,s0
    130a:	4505                	li	a0,1
    130c:	2df000ef          	jal	ra,1dea <write>
        if (l)
    1310:	e6040be3          	beqz	s0,1186 <printf+0x70>
    1314:	8526                	mv	a0,s1
        if (!*s)
    1316:	00054783          	lbu	a5,0(a0)
    131a:	e40795e3          	bnez	a5,1164 <printf+0x4e>
    }
    va_end(ap);
    131e:	70e6                	ld	ra,120(sp)
    1320:	7446                	ld	s0,112(sp)
    1322:	74a6                	ld	s1,104(sp)
    1324:	7906                	ld	s2,96(sp)
    1326:	69e6                	ld	s3,88(sp)
    1328:	6a46                	ld	s4,80(sp)
    132a:	6aa6                	ld	s5,72(sp)
    132c:	6b06                	ld	s6,64(sp)
    132e:	7be2                	ld	s7,56(sp)
    1330:	6129                	addi	sp,sp,192
    1332:	8082                	ret
        switch (s[1])
    1334:	07800713          	li	a4,120
    1338:	24e79363          	bne	a5,a4,157e <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    133c:	6782                	ld	a5,0(sp)
    133e:	4394                	lw	a3,0(a5)
    1340:	07a1                	addi	a5,a5,8
    1342:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1344:	2606c263          	bltz	a3,15a8 <printf+0x492>
        buf[i--] = digits[x % base];
    1348:	00001797          	auipc	a5,0x1
    134c:	c9878793          	addi	a5,a5,-872 # 1fe0 <digits>
    1350:	00f6f713          	andi	a4,a3,15
    1354:	973e                	add	a4,a4,a5
    1356:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff6020>
    buf[16] = 0;
    135a:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    135e:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    1360:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1364:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    1368:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    136c:	0046d51b          	srliw	a0,a3,0x4
    1370:	0ad5d563          	bge	a1,a3,141a <printf+0x304>
        buf[i--] = digits[x % base];
    1374:	8a3d                	andi	a2,a2,15
    1376:	963e                	add	a2,a2,a5
    1378:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    137c:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    1380:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1384:	30a5fe63          	bgeu	a1,a0,16a0 <printf+0x58a>
        buf[i--] = digits[x % base];
    1388:	00f77613          	andi	a2,a4,15
    138c:	963e                	add	a2,a2,a5
    138e:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1392:	45bd                	li	a1,15
    1394:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    1398:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    139c:	00475513          	srli	a0,a4,0x4
    13a0:	30e5f963          	bgeu	a1,a4,16b2 <printf+0x59c>
        buf[i--] = digits[x % base];
    13a4:	8a3d                	andi	a2,a2,15
    13a6:	963e                	add	a2,a2,a5
    13a8:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    13ac:	00875893          	srli	a7,a4,0x8
    13b0:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    13b4:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    13b8:	30a5fd63          	bgeu	a1,a0,16d2 <printf+0x5bc>
        buf[i--] = digits[x % base];
    13bc:	8a3d                	andi	a2,a2,15
    13be:	963e                	add	a2,a2,a5
    13c0:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13c4:	00c75813          	srli	a6,a4,0xc
    13c8:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    13cc:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    13d0:	3315fe63          	bgeu	a1,a7,170c <printf+0x5f6>
        buf[i--] = digits[x % base];
    13d4:	8a3d                	andi	a2,a2,15
    13d6:	963e                	add	a2,a2,a5
    13d8:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13dc:	01075893          	srli	a7,a4,0x10
    13e0:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    13e4:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    13e8:	3305ff63          	bgeu	a1,a6,1726 <printf+0x610>
        buf[i--] = digits[x % base];
    13ec:	8a3d                	andi	a2,a2,15
    13ee:	963e                	add	a2,a2,a5
    13f0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    13f4:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    13f8:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    13fc:	3515f863          	bgeu	a1,a7,174c <printf+0x636>
        buf[i--] = digits[x % base];
    1400:	97ba                	add	a5,a5,a4
    1402:	0007c783          	lbu	a5,0(a5)
    1406:	45a1                	li	a1,8
    1408:	00f10823          	sb	a5,16(sp)
    if (sign)
    140c:	0006d763          	bgez	a3,141a <printf+0x304>
        buf[i--] = '-';
    1410:	02d00793          	li	a5,45
    1414:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1418:	459d                	li	a1,7
    write(f, s, l);
    141a:	4641                	li	a2,16
    141c:	003c                	addi	a5,sp,8
    141e:	9e0d                	subw	a2,a2,a1
    1420:	4505                	li	a0,1
    1422:	95be                	add	a1,a1,a5
    1424:	1c7000ef          	jal	ra,1dea <write>
        s += 2;
    1428:	00248513          	addi	a0,s1,2
    142c:	b335                	j	1158 <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    142e:	6782                	ld	a5,0(sp)
    1430:	6380                	ld	s0,0(a5)
    1432:	07a1                	addi	a5,a5,8
    1434:	e03e                	sd	a5,0(sp)
    1436:	22040a63          	beqz	s0,166a <printf+0x554>
            l = strnlen(a, 200);
    143a:	0c800593          	li	a1,200
    143e:	8522                	mv	a0,s0
    1440:	6cc000ef          	jal	ra,1b0c <strnlen>
    write(f, s, l);
    1444:	0005061b          	sext.w	a2,a0
    1448:	85a2                	mv	a1,s0
    144a:	4505                	li	a0,1
    144c:	19f000ef          	jal	ra,1dea <write>
        s += 2;
    1450:	00248513          	addi	a0,s1,2
    1454:	b311                	j	1158 <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    1456:	6782                	ld	a5,0(sp)
    1458:	4390                	lw	a2,0(a5)
    145a:	07a1                	addi	a5,a5,8
    145c:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    145e:	1a064363          	bltz	a2,1604 <printf+0x4ee>
        buf[i--] = digits[x % base];
    1462:	46a9                	li	a3,10
    1464:	02d6773b          	remuw	a4,a2,a3
    1468:	00001797          	auipc	a5,0x1
    146c:	b7878793          	addi	a5,a5,-1160 # 1fe0 <digits>
    buf[16] = 0;
    1470:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1474:	4525                	li	a0,9
        x = xx;
    1476:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    147a:	973e                	add	a4,a4,a5
    147c:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    1480:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    1484:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1488:	2cc55063          	bge	a0,a2,1748 <printf+0x632>
    148c:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1490:	02d5f73b          	remuw	a4,a1,a3
    1494:	1702                	slli	a4,a4,0x20
    1496:	9301                	srli	a4,a4,0x20
    1498:	973e                	add	a4,a4,a5
    149a:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    149e:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    14a2:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    14a6:	1f057d63          	bgeu	a0,a6,16a0 <printf+0x58a>
        buf[i--] = digits[x % base];
    14aa:	4529                	li	a0,10
    } while ((x /= base) != 0);
    14ac:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    14ae:	02a5f73b          	remuw	a4,a1,a0
    14b2:	973e                	add	a4,a4,a5
    14b4:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    14b8:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    14bc:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    14c0:	1ab6f163          	bgeu	a3,a1,1662 <printf+0x54c>
    14c4:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    14c8:	02a776bb          	remuw	a3,a4,a0
    14cc:	96be                	add	a3,a3,a5
    14ce:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14d2:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14d6:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    14da:	20b87c63          	bgeu	a6,a1,16f2 <printf+0x5dc>
    14de:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    14e2:	02a776bb          	remuw	a3,a4,a0
    14e6:	96be                	add	a3,a3,a5
    14e8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14ec:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14f0:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    14f4:	20b87363          	bgeu	a6,a1,16fa <printf+0x5e4>
        buf[i--] = digits[x % base];
    14f8:	02a776bb          	remuw	a3,a4,a0
    14fc:	96be                	add	a3,a3,a5
    14fe:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1502:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1506:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    150a:	20b9f563          	bgeu	s3,a1,1714 <printf+0x5fe>
        buf[i--] = digits[x % base];
    150e:	02a776bb          	remuw	a3,a4,a0
    1512:	96be                	add	a3,a3,a5
    1514:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1518:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    151c:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1520:	20bafb63          	bgeu	s5,a1,1736 <printf+0x620>
        buf[i--] = digits[x % base];
    1524:	02a776bb          	remuw	a3,a4,a0
    1528:	96be                	add	a3,a3,a5
    152a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    152e:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1532:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1536:	1eba7c63          	bgeu	s4,a1,172e <printf+0x618>
        buf[i--] = digits[x % base];
    153a:	02a776bb          	remuw	a3,a4,a0
    153e:	96be                	add	a3,a3,a5
    1540:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1544:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1548:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    154c:	14bb7163          	bgeu	s6,a1,168e <printf+0x578>
        buf[i--] = digits[x % base];
    1550:	1702                	slli	a4,a4,0x20
    1552:	9301                	srli	a4,a4,0x20
    1554:	97ba                	add	a5,a5,a4
    1556:	0007c783          	lbu	a5,0(a5)
    155a:	4599                	li	a1,6
    155c:	00f10723          	sb	a5,14(sp)
    if (sign)
    1560:	ea065de3          	bgez	a2,141a <printf+0x304>
        buf[i--] = '-';
    1564:	02d00793          	li	a5,45
    1568:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    156c:	4595                	li	a1,5
    write(f, s, l);
    156e:	003c                	addi	a5,sp,8
    1570:	4641                	li	a2,16
    1572:	9e0d                	subw	a2,a2,a1
    1574:	4505                	li	a0,1
    1576:	95be                	add	a1,a1,a5
    1578:	073000ef          	jal	ra,1dea <write>
    157c:	b575                	j	1428 <printf+0x312>
    char byte = c;
    157e:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1582:	4605                	li	a2,1
    1584:	002c                	addi	a1,sp,8
    1586:	4505                	li	a0,1
    char byte = c;
    1588:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    158c:	05f000ef          	jal	ra,1dea <write>
    char byte = c;
    1590:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1594:	4605                	li	a2,1
    1596:	002c                	addi	a1,sp,8
    1598:	4505                	li	a0,1
    char byte = c;
    159a:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    159e:	04d000ef          	jal	ra,1dea <write>
        s += 2;
    15a2:	00248513          	addi	a0,s1,2
    15a6:	be4d                	j	1158 <printf+0x42>
        x = -xx;
    15a8:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    15ac:	00001797          	auipc	a5,0x1
    15b0:	a3478793          	addi	a5,a5,-1484 # 1fe0 <digits>
    15b4:	00f77613          	andi	a2,a4,15
    15b8:	963e                	add	a2,a2,a5
    15ba:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    15be:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    15c2:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    15c4:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    15c8:	0047551b          	srliw	a0,a4,0x4
    15cc:	0047561b          	srliw	a2,a4,0x4
    15d0:	0ab6d263          	bge	a3,a1,1674 <printf+0x55e>
        buf[i--] = digits[x % base];
    15d4:	8a3d                	andi	a2,a2,15
    15d6:	963e                	add	a2,a2,a5
    15d8:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    15dc:	463d                	li	a2,15
    15de:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    15e2:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    15e6:	daa661e3          	bltu	a2,a0,1388 <printf+0x272>
        buf[i--] = '-';
    15ea:	02d00793          	li	a5,45
    15ee:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    15f2:	45b5                	li	a1,13
    write(f, s, l);
    15f4:	003c                	addi	a5,sp,8
    15f6:	4641                	li	a2,16
    15f8:	9e0d                	subw	a2,a2,a1
    15fa:	4505                	li	a0,1
    15fc:	95be                	add	a1,a1,a5
    15fe:	7ec000ef          	jal	ra,1dea <write>
    1602:	b51d                	j	1428 <printf+0x312>
        x = -xx;
    1604:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    1608:	46a9                	li	a3,10
    160a:	02d875bb          	remuw	a1,a6,a3
    160e:	00001797          	auipc	a5,0x1
    1612:	9d278793          	addi	a5,a5,-1582 # 1fe0 <digits>
    buf[16] = 0;
    1616:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    161a:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    161c:	95be                	add	a1,a1,a5
    161e:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    1622:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    1626:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    162a:	04a65563          	bge	a2,a0,1674 <printf+0x55e>
    162e:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1632:	02d775bb          	remuw	a1,a4,a3
    1636:	95be                	add	a1,a1,a5
    1638:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    163c:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    1640:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    1644:	fb0573e3          	bgeu	a0,a6,15ea <printf+0x4d4>
        buf[i--] = digits[x % base];
    1648:	4529                	li	a0,10
    } while ((x /= base) != 0);
    164a:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    164c:	02a5f73b          	remuw	a4,a1,a0
    1650:	973e                	add	a4,a4,a5
    1652:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    1656:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    165a:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    165e:	e6b6e3e3          	bltu	a3,a1,14c4 <printf+0x3ae>
        buf[i--] = digits[x % base];
    1662:	45b5                	li	a1,13
    if (sign)
    1664:	da065be3          	bgez	a2,141a <printf+0x304>
    1668:	a881                	j	16b8 <printf+0x5a2>
                a = "(null)";
    166a:	00001417          	auipc	s0,0x1
    166e:	95640413          	addi	s0,s0,-1706 # 1fc0 <unlink+0x30>
    1672:	b3e1                	j	143a <printf+0x324>
        buf[i--] = '-';
    1674:	02d00793          	li	a5,45
    1678:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    167c:	45b9                	li	a1,14
    write(f, s, l);
    167e:	003c                	addi	a5,sp,8
    1680:	4641                	li	a2,16
    1682:	9e0d                	subw	a2,a2,a1
    1684:	4505                	li	a0,1
    1686:	95be                	add	a1,a1,a5
    1688:	762000ef          	jal	ra,1dea <write>
    168c:	bb71                	j	1428 <printf+0x312>
        buf[i--] = digits[x % base];
    168e:	459d                	li	a1,7
    if (sign)
    1690:	d80655e3          	bgez	a2,141a <printf+0x304>
        buf[i--] = '-';
    1694:	02d00793          	li	a5,45
    1698:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    169c:	4599                	li	a1,6
    169e:	bbb5                	j	141a <printf+0x304>
    16a0:	45b9                	li	a1,14
    write(f, s, l);
    16a2:	003c                	addi	a5,sp,8
    16a4:	4641                	li	a2,16
    16a6:	9e0d                	subw	a2,a2,a1
    16a8:	4505                	li	a0,1
    16aa:	95be                	add	a1,a1,a5
    16ac:	73e000ef          	jal	ra,1dea <write>
    16b0:	bba5                	j	1428 <printf+0x312>
        buf[i--] = digits[x % base];
    16b2:	45b5                	li	a1,13
    if (sign)
    16b4:	d606d3e3          	bgez	a3,141a <printf+0x304>
        buf[i--] = '-';
    16b8:	02d00793          	li	a5,45
    16bc:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    16c0:	45b1                	li	a1,12
    write(f, s, l);
    16c2:	003c                	addi	a5,sp,8
    16c4:	4641                	li	a2,16
    16c6:	9e0d                	subw	a2,a2,a1
    16c8:	4505                	li	a0,1
    16ca:	95be                	add	a1,a1,a5
    16cc:	71e000ef          	jal	ra,1dea <write>
    16d0:	bba1                	j	1428 <printf+0x312>
        buf[i--] = digits[x % base];
    16d2:	45b1                	li	a1,12
    if (sign)
    16d4:	d406d3e3          	bgez	a3,141a <printf+0x304>
        buf[i--] = '-';
    16d8:	02d00793          	li	a5,45
    16dc:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    16e0:	45ad                	li	a1,11
    write(f, s, l);
    16e2:	003c                	addi	a5,sp,8
    16e4:	4641                	li	a2,16
    16e6:	9e0d                	subw	a2,a2,a1
    16e8:	4505                	li	a0,1
    16ea:	95be                	add	a1,a1,a5
    16ec:	6fe000ef          	jal	ra,1dea <write>
    16f0:	bb25                	j	1428 <printf+0x312>
        buf[i--] = digits[x % base];
    16f2:	45b1                	li	a1,12
    if (sign)
    16f4:	d20653e3          	bgez	a2,141a <printf+0x304>
    16f8:	b7c5                	j	16d8 <printf+0x5c2>
        buf[i--] = digits[x % base];
    16fa:	45ad                	li	a1,11
    if (sign)
    16fc:	d0065fe3          	bgez	a2,141a <printf+0x304>
        buf[i--] = '-';
    1700:	02d00793          	li	a5,45
    1704:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1708:	45a9                	li	a1,10
    170a:	bb01                	j	141a <printf+0x304>
    170c:	45ad                	li	a1,11
    if (sign)
    170e:	d006d6e3          	bgez	a3,141a <printf+0x304>
    1712:	b7fd                	j	1700 <printf+0x5ea>
        buf[i--] = digits[x % base];
    1714:	45a9                	li	a1,10
    if (sign)
    1716:	d00652e3          	bgez	a2,141a <printf+0x304>
        buf[i--] = '-';
    171a:	02d00793          	li	a5,45
    171e:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1722:	45a5                	li	a1,9
    1724:	b9dd                	j	141a <printf+0x304>
    1726:	45a9                	li	a1,10
    if (sign)
    1728:	ce06d9e3          	bgez	a3,141a <printf+0x304>
    172c:	b7fd                	j	171a <printf+0x604>
        buf[i--] = digits[x % base];
    172e:	45a1                	li	a1,8
    if (sign)
    1730:	ce0655e3          	bgez	a2,141a <printf+0x304>
    1734:	b9f1                	j	1410 <printf+0x2fa>
        buf[i--] = digits[x % base];
    1736:	45a5                	li	a1,9
    if (sign)
    1738:	ce0651e3          	bgez	a2,141a <printf+0x304>
        buf[i--] = '-';
    173c:	02d00793          	li	a5,45
    1740:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1744:	45a1                	li	a1,8
    1746:	b9d1                	j	141a <printf+0x304>
    i = 15;
    1748:	45bd                	li	a1,15
    174a:	b9c1                	j	141a <printf+0x304>
        buf[i--] = digits[x % base];
    174c:	45a5                	li	a1,9
    if (sign)
    174e:	cc06d6e3          	bgez	a3,141a <printf+0x304>
    1752:	b7ed                	j	173c <printf+0x626>

0000000000001754 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1754:	02000793          	li	a5,32
    1758:	00f50663          	beq	a0,a5,1764 <isspace+0x10>
    175c:	355d                	addiw	a0,a0,-9
    175e:	00553513          	sltiu	a0,a0,5
    1762:	8082                	ret
    1764:	4505                	li	a0,1
}
    1766:	8082                	ret

0000000000001768 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1768:	fd05051b          	addiw	a0,a0,-48
}
    176c:	00a53513          	sltiu	a0,a0,10
    1770:	8082                	ret

0000000000001772 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1772:	02000613          	li	a2,32
    1776:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1778:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    177c:	ff77069b          	addiw	a3,a4,-9
    1780:	04c70d63          	beq	a4,a2,17da <atoi+0x68>
    1784:	0007079b          	sext.w	a5,a4
    1788:	04d5f963          	bgeu	a1,a3,17da <atoi+0x68>
        s++;
    switch (*s)
    178c:	02b00693          	li	a3,43
    1790:	04d70a63          	beq	a4,a3,17e4 <atoi+0x72>
    1794:	02d00693          	li	a3,45
    1798:	06d70463          	beq	a4,a3,1800 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    179c:	fd07859b          	addiw	a1,a5,-48
    17a0:	4625                	li	a2,9
    17a2:	873e                	mv	a4,a5
    17a4:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    17a6:	4e01                	li	t3,0
    while (isdigit(*s))
    17a8:	04b66a63          	bltu	a2,a1,17fc <atoi+0x8a>
    int n = 0, neg = 0;
    17ac:	4501                	li	a0,0
    while (isdigit(*s))
    17ae:	4825                	li	a6,9
    17b0:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    17b4:	0025179b          	slliw	a5,a0,0x2
    17b8:	9d3d                	addw	a0,a0,a5
    17ba:	fd07031b          	addiw	t1,a4,-48
    17be:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    17c2:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    17c6:	0685                	addi	a3,a3,1
    17c8:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    17cc:	0006071b          	sext.w	a4,a2
    17d0:	feb870e3          	bgeu	a6,a1,17b0 <atoi+0x3e>
    return neg ? n : -n;
    17d4:	000e0563          	beqz	t3,17de <atoi+0x6c>
}
    17d8:	8082                	ret
        s++;
    17da:	0505                	addi	a0,a0,1
    17dc:	bf71                	j	1778 <atoi+0x6>
    17de:	4113053b          	subw	a0,t1,a7
    17e2:	8082                	ret
    while (isdigit(*s))
    17e4:	00154783          	lbu	a5,1(a0)
    17e8:	4625                	li	a2,9
        s++;
    17ea:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17ee:	fd07859b          	addiw	a1,a5,-48
    17f2:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    17f6:	4e01                	li	t3,0
    while (isdigit(*s))
    17f8:	fab67ae3          	bgeu	a2,a1,17ac <atoi+0x3a>
    17fc:	4501                	li	a0,0
}
    17fe:	8082                	ret
    while (isdigit(*s))
    1800:	00154783          	lbu	a5,1(a0)
    1804:	4625                	li	a2,9
        s++;
    1806:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    180a:	fd07859b          	addiw	a1,a5,-48
    180e:	0007871b          	sext.w	a4,a5
    1812:	feb665e3          	bltu	a2,a1,17fc <atoi+0x8a>
        neg = 1;
    1816:	4e05                	li	t3,1
    1818:	bf51                	j	17ac <atoi+0x3a>

000000000000181a <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    181a:	16060d63          	beqz	a2,1994 <memset+0x17a>
    181e:	40a007b3          	neg	a5,a0
    1822:	8b9d                	andi	a5,a5,7
    1824:	00778713          	addi	a4,a5,7
    1828:	482d                	li	a6,11
    182a:	0ff5f593          	andi	a1,a1,255
    182e:	fff60693          	addi	a3,a2,-1
    1832:	17076263          	bltu	a4,a6,1996 <memset+0x17c>
    1836:	16e6ea63          	bltu	a3,a4,19aa <memset+0x190>
    183a:	16078563          	beqz	a5,19a4 <memset+0x18a>
    183e:	00b50023          	sb	a1,0(a0)
    1842:	4705                	li	a4,1
    1844:	00150e93          	addi	t4,a0,1
    1848:	14e78c63          	beq	a5,a4,19a0 <memset+0x186>
    184c:	00b500a3          	sb	a1,1(a0)
    1850:	4709                	li	a4,2
    1852:	00250e93          	addi	t4,a0,2
    1856:	14e78d63          	beq	a5,a4,19b0 <memset+0x196>
    185a:	00b50123          	sb	a1,2(a0)
    185e:	470d                	li	a4,3
    1860:	00350e93          	addi	t4,a0,3
    1864:	12e78b63          	beq	a5,a4,199a <memset+0x180>
    1868:	00b501a3          	sb	a1,3(a0)
    186c:	4711                	li	a4,4
    186e:	00450e93          	addi	t4,a0,4
    1872:	14e78163          	beq	a5,a4,19b4 <memset+0x19a>
    1876:	00b50223          	sb	a1,4(a0)
    187a:	4715                	li	a4,5
    187c:	00550e93          	addi	t4,a0,5
    1880:	12e78c63          	beq	a5,a4,19b8 <memset+0x19e>
    1884:	00b502a3          	sb	a1,5(a0)
    1888:	471d                	li	a4,7
    188a:	00650e93          	addi	t4,a0,6
    188e:	12e79763          	bne	a5,a4,19bc <memset+0x1a2>
    1892:	00750e93          	addi	t4,a0,7
    1896:	00b50323          	sb	a1,6(a0)
    189a:	4f1d                	li	t5,7
    189c:	00859713          	slli	a4,a1,0x8
    18a0:	8f4d                	or	a4,a4,a1
    18a2:	01059e13          	slli	t3,a1,0x10
    18a6:	01c76e33          	or	t3,a4,t3
    18aa:	01859313          	slli	t1,a1,0x18
    18ae:	006e6333          	or	t1,t3,t1
    18b2:	02059893          	slli	a7,a1,0x20
    18b6:	011368b3          	or	a7,t1,a7
    18ba:	02859813          	slli	a6,a1,0x28
    18be:	40f60333          	sub	t1,a2,a5
    18c2:	0108e833          	or	a6,a7,a6
    18c6:	03059693          	slli	a3,a1,0x30
    18ca:	00d866b3          	or	a3,a6,a3
    18ce:	03859713          	slli	a4,a1,0x38
    18d2:	97aa                	add	a5,a5,a0
    18d4:	ff837813          	andi	a6,t1,-8
    18d8:	8f55                	or	a4,a4,a3
    18da:	00f806b3          	add	a3,a6,a5
    18de:	e398                	sd	a4,0(a5)
    18e0:	07a1                	addi	a5,a5,8
    18e2:	fed79ee3          	bne	a5,a3,18de <memset+0xc4>
    18e6:	ff837693          	andi	a3,t1,-8
    18ea:	00de87b3          	add	a5,t4,a3
    18ee:	01e6873b          	addw	a4,a3,t5
    18f2:	0ad30663          	beq	t1,a3,199e <memset+0x184>
    18f6:	00b78023          	sb	a1,0(a5)
    18fa:	0017069b          	addiw	a3,a4,1
    18fe:	08c6fb63          	bgeu	a3,a2,1994 <memset+0x17a>
    1902:	00b780a3          	sb	a1,1(a5)
    1906:	0027069b          	addiw	a3,a4,2
    190a:	08c6f563          	bgeu	a3,a2,1994 <memset+0x17a>
    190e:	00b78123          	sb	a1,2(a5)
    1912:	0037069b          	addiw	a3,a4,3
    1916:	06c6ff63          	bgeu	a3,a2,1994 <memset+0x17a>
    191a:	00b781a3          	sb	a1,3(a5)
    191e:	0047069b          	addiw	a3,a4,4
    1922:	06c6f963          	bgeu	a3,a2,1994 <memset+0x17a>
    1926:	00b78223          	sb	a1,4(a5)
    192a:	0057069b          	addiw	a3,a4,5
    192e:	06c6f363          	bgeu	a3,a2,1994 <memset+0x17a>
    1932:	00b782a3          	sb	a1,5(a5)
    1936:	0067069b          	addiw	a3,a4,6
    193a:	04c6fd63          	bgeu	a3,a2,1994 <memset+0x17a>
    193e:	00b78323          	sb	a1,6(a5)
    1942:	0077069b          	addiw	a3,a4,7
    1946:	04c6f763          	bgeu	a3,a2,1994 <memset+0x17a>
    194a:	00b783a3          	sb	a1,7(a5)
    194e:	0087069b          	addiw	a3,a4,8
    1952:	04c6f163          	bgeu	a3,a2,1994 <memset+0x17a>
    1956:	00b78423          	sb	a1,8(a5)
    195a:	0097069b          	addiw	a3,a4,9
    195e:	02c6fb63          	bgeu	a3,a2,1994 <memset+0x17a>
    1962:	00b784a3          	sb	a1,9(a5)
    1966:	00a7069b          	addiw	a3,a4,10
    196a:	02c6f563          	bgeu	a3,a2,1994 <memset+0x17a>
    196e:	00b78523          	sb	a1,10(a5)
    1972:	00b7069b          	addiw	a3,a4,11
    1976:	00c6ff63          	bgeu	a3,a2,1994 <memset+0x17a>
    197a:	00b785a3          	sb	a1,11(a5)
    197e:	00c7069b          	addiw	a3,a4,12
    1982:	00c6f963          	bgeu	a3,a2,1994 <memset+0x17a>
    1986:	00b78623          	sb	a1,12(a5)
    198a:	2735                	addiw	a4,a4,13
    198c:	00c77463          	bgeu	a4,a2,1994 <memset+0x17a>
    1990:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1994:	8082                	ret
    1996:	472d                	li	a4,11
    1998:	bd79                	j	1836 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    199a:	4f0d                	li	t5,3
    199c:	b701                	j	189c <memset+0x82>
    199e:	8082                	ret
    19a0:	4f05                	li	t5,1
    19a2:	bded                	j	189c <memset+0x82>
    19a4:	8eaa                	mv	t4,a0
    19a6:	4f01                	li	t5,0
    19a8:	bdd5                	j	189c <memset+0x82>
    19aa:	87aa                	mv	a5,a0
    19ac:	4701                	li	a4,0
    19ae:	b7a1                	j	18f6 <memset+0xdc>
    19b0:	4f09                	li	t5,2
    19b2:	b5ed                	j	189c <memset+0x82>
    19b4:	4f11                	li	t5,4
    19b6:	b5dd                	j	189c <memset+0x82>
    19b8:	4f15                	li	t5,5
    19ba:	b5cd                	j	189c <memset+0x82>
    19bc:	4f19                	li	t5,6
    19be:	bdf9                	j	189c <memset+0x82>

00000000000019c0 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    19c0:	00054783          	lbu	a5,0(a0)
    19c4:	0005c703          	lbu	a4,0(a1)
    19c8:	00e79863          	bne	a5,a4,19d8 <strcmp+0x18>
    19cc:	0505                	addi	a0,a0,1
    19ce:	0585                	addi	a1,a1,1
    19d0:	fbe5                	bnez	a5,19c0 <strcmp>
    19d2:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    19d4:	9d19                	subw	a0,a0,a4
    19d6:	8082                	ret
    19d8:	0007851b          	sext.w	a0,a5
    19dc:	bfe5                	j	19d4 <strcmp+0x14>

00000000000019de <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    19de:	ce05                	beqz	a2,1a16 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19e0:	00054703          	lbu	a4,0(a0)
    19e4:	0005c783          	lbu	a5,0(a1)
    19e8:	cb0d                	beqz	a4,1a1a <strncmp+0x3c>
    if (!n--)
    19ea:	167d                	addi	a2,a2,-1
    19ec:	00c506b3          	add	a3,a0,a2
    19f0:	a819                	j	1a06 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19f2:	00a68e63          	beq	a3,a0,1a0e <strncmp+0x30>
    19f6:	0505                	addi	a0,a0,1
    19f8:	00e79b63          	bne	a5,a4,1a0e <strncmp+0x30>
    19fc:	00054703          	lbu	a4,0(a0)
    1a00:	0005c783          	lbu	a5,0(a1)
    1a04:	cb19                	beqz	a4,1a1a <strncmp+0x3c>
    1a06:	0005c783          	lbu	a5,0(a1)
    1a0a:	0585                	addi	a1,a1,1
    1a0c:	f3fd                	bnez	a5,19f2 <strncmp+0x14>
        ;
    return *l - *r;
    1a0e:	0007051b          	sext.w	a0,a4
    1a12:	9d1d                	subw	a0,a0,a5
    1a14:	8082                	ret
        return 0;
    1a16:	4501                	li	a0,0
}
    1a18:	8082                	ret
    1a1a:	4501                	li	a0,0
    return *l - *r;
    1a1c:	9d1d                	subw	a0,a0,a5
    1a1e:	8082                	ret

0000000000001a20 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1a20:	00757793          	andi	a5,a0,7
    1a24:	cf89                	beqz	a5,1a3e <strlen+0x1e>
    1a26:	87aa                	mv	a5,a0
    1a28:	a029                	j	1a32 <strlen+0x12>
    1a2a:	0785                	addi	a5,a5,1
    1a2c:	0077f713          	andi	a4,a5,7
    1a30:	cb01                	beqz	a4,1a40 <strlen+0x20>
        if (!*s)
    1a32:	0007c703          	lbu	a4,0(a5)
    1a36:	fb75                	bnez	a4,1a2a <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1a38:	40a78533          	sub	a0,a5,a0
}
    1a3c:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1a3e:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1a40:	6394                	ld	a3,0(a5)
    1a42:	00000597          	auipc	a1,0x0
    1a46:	5865b583          	ld	a1,1414(a1) # 1fc8 <unlink+0x38>
    1a4a:	00000617          	auipc	a2,0x0
    1a4e:	58663603          	ld	a2,1414(a2) # 1fd0 <unlink+0x40>
    1a52:	a019                	j	1a58 <strlen+0x38>
    1a54:	6794                	ld	a3,8(a5)
    1a56:	07a1                	addi	a5,a5,8
    1a58:	00b68733          	add	a4,a3,a1
    1a5c:	fff6c693          	not	a3,a3
    1a60:	8f75                	and	a4,a4,a3
    1a62:	8f71                	and	a4,a4,a2
    1a64:	db65                	beqz	a4,1a54 <strlen+0x34>
    for (; *s; s++)
    1a66:	0007c703          	lbu	a4,0(a5)
    1a6a:	d779                	beqz	a4,1a38 <strlen+0x18>
    1a6c:	0017c703          	lbu	a4,1(a5)
    1a70:	0785                	addi	a5,a5,1
    1a72:	d379                	beqz	a4,1a38 <strlen+0x18>
    1a74:	0017c703          	lbu	a4,1(a5)
    1a78:	0785                	addi	a5,a5,1
    1a7a:	fb6d                	bnez	a4,1a6c <strlen+0x4c>
    1a7c:	bf75                	j	1a38 <strlen+0x18>

0000000000001a7e <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a7e:	00757713          	andi	a4,a0,7
{
    1a82:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1a84:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a88:	cb19                	beqz	a4,1a9e <memchr+0x20>
    1a8a:	ce25                	beqz	a2,1b02 <memchr+0x84>
    1a8c:	0007c703          	lbu	a4,0(a5)
    1a90:	04b70e63          	beq	a4,a1,1aec <memchr+0x6e>
    1a94:	0785                	addi	a5,a5,1
    1a96:	0077f713          	andi	a4,a5,7
    1a9a:	167d                	addi	a2,a2,-1
    1a9c:	f77d                	bnez	a4,1a8a <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1a9e:	4501                	li	a0,0
    if (n && *s != c)
    1aa0:	c235                	beqz	a2,1b04 <memchr+0x86>
    1aa2:	0007c703          	lbu	a4,0(a5)
    1aa6:	04b70363          	beq	a4,a1,1aec <memchr+0x6e>
        size_t k = ONES * c;
    1aaa:	00000517          	auipc	a0,0x0
    1aae:	52e53503          	ld	a0,1326(a0) # 1fd8 <unlink+0x48>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1ab2:	471d                	li	a4,7
        size_t k = ONES * c;
    1ab4:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1ab8:	02c77a63          	bgeu	a4,a2,1aec <memchr+0x6e>
    1abc:	00000897          	auipc	a7,0x0
    1ac0:	50c8b883          	ld	a7,1292(a7) # 1fc8 <unlink+0x38>
    1ac4:	00000817          	auipc	a6,0x0
    1ac8:	50c83803          	ld	a6,1292(a6) # 1fd0 <unlink+0x40>
    1acc:	431d                	li	t1,7
    1ace:	a029                	j	1ad8 <memchr+0x5a>
    1ad0:	1661                	addi	a2,a2,-8
    1ad2:	07a1                	addi	a5,a5,8
    1ad4:	02c37963          	bgeu	t1,a2,1b06 <memchr+0x88>
    1ad8:	6398                	ld	a4,0(a5)
    1ada:	8f29                	xor	a4,a4,a0
    1adc:	011706b3          	add	a3,a4,a7
    1ae0:	fff74713          	not	a4,a4
    1ae4:	8f75                	and	a4,a4,a3
    1ae6:	01077733          	and	a4,a4,a6
    1aea:	d37d                	beqz	a4,1ad0 <memchr+0x52>
    1aec:	853e                	mv	a0,a5
    1aee:	97b2                	add	a5,a5,a2
    1af0:	a021                	j	1af8 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1af2:	0505                	addi	a0,a0,1
    1af4:	00f50763          	beq	a0,a5,1b02 <memchr+0x84>
    1af8:	00054703          	lbu	a4,0(a0)
    1afc:	feb71be3          	bne	a4,a1,1af2 <memchr+0x74>
    1b00:	8082                	ret
    return n ? (void *)s : 0;
    1b02:	4501                	li	a0,0
}
    1b04:	8082                	ret
    return n ? (void *)s : 0;
    1b06:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1b08:	f275                	bnez	a2,1aec <memchr+0x6e>
}
    1b0a:	8082                	ret

0000000000001b0c <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1b0c:	1101                	addi	sp,sp,-32
    1b0e:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1b10:	862e                	mv	a2,a1
{
    1b12:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1b14:	4581                	li	a1,0
{
    1b16:	e426                	sd	s1,8(sp)
    1b18:	ec06                	sd	ra,24(sp)
    1b1a:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1b1c:	f63ff0ef          	jal	ra,1a7e <memchr>
    return p ? p - s : n;
    1b20:	c519                	beqz	a0,1b2e <strnlen+0x22>
}
    1b22:	60e2                	ld	ra,24(sp)
    1b24:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1b26:	8d05                	sub	a0,a0,s1
}
    1b28:	64a2                	ld	s1,8(sp)
    1b2a:	6105                	addi	sp,sp,32
    1b2c:	8082                	ret
    1b2e:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1b30:	8522                	mv	a0,s0
}
    1b32:	6442                	ld	s0,16(sp)
    1b34:	64a2                	ld	s1,8(sp)
    1b36:	6105                	addi	sp,sp,32
    1b38:	8082                	ret

0000000000001b3a <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1b3a:	00b547b3          	xor	a5,a0,a1
    1b3e:	8b9d                	andi	a5,a5,7
    1b40:	eb95                	bnez	a5,1b74 <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1b42:	0075f793          	andi	a5,a1,7
    1b46:	e7b1                	bnez	a5,1b92 <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1b48:	6198                	ld	a4,0(a1)
    1b4a:	00000617          	auipc	a2,0x0
    1b4e:	47e63603          	ld	a2,1150(a2) # 1fc8 <unlink+0x38>
    1b52:	00000817          	auipc	a6,0x0
    1b56:	47e83803          	ld	a6,1150(a6) # 1fd0 <unlink+0x40>
    1b5a:	a029                	j	1b64 <stpcpy+0x2a>
    1b5c:	e118                	sd	a4,0(a0)
    1b5e:	6598                	ld	a4,8(a1)
    1b60:	05a1                	addi	a1,a1,8
    1b62:	0521                	addi	a0,a0,8
    1b64:	00c707b3          	add	a5,a4,a2
    1b68:	fff74693          	not	a3,a4
    1b6c:	8ff5                	and	a5,a5,a3
    1b6e:	0107f7b3          	and	a5,a5,a6
    1b72:	d7ed                	beqz	a5,1b5c <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b74:	0005c783          	lbu	a5,0(a1)
    1b78:	00f50023          	sb	a5,0(a0)
    1b7c:	c785                	beqz	a5,1ba4 <stpcpy+0x6a>
    1b7e:	0015c783          	lbu	a5,1(a1)
    1b82:	0505                	addi	a0,a0,1
    1b84:	0585                	addi	a1,a1,1
    1b86:	00f50023          	sb	a5,0(a0)
    1b8a:	fbf5                	bnez	a5,1b7e <stpcpy+0x44>
        ;
    return d;
}
    1b8c:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1b8e:	0505                	addi	a0,a0,1
    1b90:	df45                	beqz	a4,1b48 <stpcpy+0xe>
            if (!(*d = *s))
    1b92:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1b96:	0585                	addi	a1,a1,1
    1b98:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1b9c:	00f50023          	sb	a5,0(a0)
    1ba0:	f7fd                	bnez	a5,1b8e <stpcpy+0x54>
}
    1ba2:	8082                	ret
    1ba4:	8082                	ret

0000000000001ba6 <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ba6:	00b547b3          	xor	a5,a0,a1
    1baa:	8b9d                	andi	a5,a5,7
    1bac:	1a079863          	bnez	a5,1d5c <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1bb0:	0075f793          	andi	a5,a1,7
    1bb4:	16078463          	beqz	a5,1d1c <stpncpy+0x176>
    1bb8:	ea01                	bnez	a2,1bc8 <stpncpy+0x22>
    1bba:	a421                	j	1dc2 <stpncpy+0x21c>
    1bbc:	167d                	addi	a2,a2,-1
    1bbe:	0505                	addi	a0,a0,1
    1bc0:	14070e63          	beqz	a4,1d1c <stpncpy+0x176>
    1bc4:	1a060863          	beqz	a2,1d74 <stpncpy+0x1ce>
    1bc8:	0005c783          	lbu	a5,0(a1)
    1bcc:	0585                	addi	a1,a1,1
    1bce:	0075f713          	andi	a4,a1,7
    1bd2:	00f50023          	sb	a5,0(a0)
    1bd6:	f3fd                	bnez	a5,1bbc <stpncpy+0x16>
    1bd8:	4805                	li	a6,1
    1bda:	1a061863          	bnez	a2,1d8a <stpncpy+0x1e4>
    1bde:	40a007b3          	neg	a5,a0
    1be2:	8b9d                	andi	a5,a5,7
    1be4:	4681                	li	a3,0
    1be6:	18061a63          	bnez	a2,1d7a <stpncpy+0x1d4>
    1bea:	00778713          	addi	a4,a5,7
    1bee:	45ad                	li	a1,11
    1bf0:	18b76363          	bltu	a4,a1,1d76 <stpncpy+0x1d0>
    1bf4:	1ae6eb63          	bltu	a3,a4,1daa <stpncpy+0x204>
    1bf8:	1a078363          	beqz	a5,1d9e <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bfc:	00050023          	sb	zero,0(a0)
    1c00:	4685                	li	a3,1
    1c02:	00150713          	addi	a4,a0,1
    1c06:	18d78f63          	beq	a5,a3,1da4 <stpncpy+0x1fe>
    1c0a:	000500a3          	sb	zero,1(a0)
    1c0e:	4689                	li	a3,2
    1c10:	00250713          	addi	a4,a0,2
    1c14:	18d78e63          	beq	a5,a3,1db0 <stpncpy+0x20a>
    1c18:	00050123          	sb	zero,2(a0)
    1c1c:	468d                	li	a3,3
    1c1e:	00350713          	addi	a4,a0,3
    1c22:	16d78c63          	beq	a5,a3,1d9a <stpncpy+0x1f4>
    1c26:	000501a3          	sb	zero,3(a0)
    1c2a:	4691                	li	a3,4
    1c2c:	00450713          	addi	a4,a0,4
    1c30:	18d78263          	beq	a5,a3,1db4 <stpncpy+0x20e>
    1c34:	00050223          	sb	zero,4(a0)
    1c38:	4695                	li	a3,5
    1c3a:	00550713          	addi	a4,a0,5
    1c3e:	16d78d63          	beq	a5,a3,1db8 <stpncpy+0x212>
    1c42:	000502a3          	sb	zero,5(a0)
    1c46:	469d                	li	a3,7
    1c48:	00650713          	addi	a4,a0,6
    1c4c:	16d79863          	bne	a5,a3,1dbc <stpncpy+0x216>
    1c50:	00750713          	addi	a4,a0,7
    1c54:	00050323          	sb	zero,6(a0)
    1c58:	40f80833          	sub	a6,a6,a5
    1c5c:	ff887593          	andi	a1,a6,-8
    1c60:	97aa                	add	a5,a5,a0
    1c62:	95be                	add	a1,a1,a5
    1c64:	0007b023          	sd	zero,0(a5)
    1c68:	07a1                	addi	a5,a5,8
    1c6a:	feb79de3          	bne	a5,a1,1c64 <stpncpy+0xbe>
    1c6e:	ff887593          	andi	a1,a6,-8
    1c72:	9ead                	addw	a3,a3,a1
    1c74:	00b707b3          	add	a5,a4,a1
    1c78:	12b80863          	beq	a6,a1,1da8 <stpncpy+0x202>
    1c7c:	00078023          	sb	zero,0(a5)
    1c80:	0016871b          	addiw	a4,a3,1
    1c84:	0ec77863          	bgeu	a4,a2,1d74 <stpncpy+0x1ce>
    1c88:	000780a3          	sb	zero,1(a5)
    1c8c:	0026871b          	addiw	a4,a3,2
    1c90:	0ec77263          	bgeu	a4,a2,1d74 <stpncpy+0x1ce>
    1c94:	00078123          	sb	zero,2(a5)
    1c98:	0036871b          	addiw	a4,a3,3
    1c9c:	0cc77c63          	bgeu	a4,a2,1d74 <stpncpy+0x1ce>
    1ca0:	000781a3          	sb	zero,3(a5)
    1ca4:	0046871b          	addiw	a4,a3,4
    1ca8:	0cc77663          	bgeu	a4,a2,1d74 <stpncpy+0x1ce>
    1cac:	00078223          	sb	zero,4(a5)
    1cb0:	0056871b          	addiw	a4,a3,5
    1cb4:	0cc77063          	bgeu	a4,a2,1d74 <stpncpy+0x1ce>
    1cb8:	000782a3          	sb	zero,5(a5)
    1cbc:	0066871b          	addiw	a4,a3,6
    1cc0:	0ac77a63          	bgeu	a4,a2,1d74 <stpncpy+0x1ce>
    1cc4:	00078323          	sb	zero,6(a5)
    1cc8:	0076871b          	addiw	a4,a3,7
    1ccc:	0ac77463          	bgeu	a4,a2,1d74 <stpncpy+0x1ce>
    1cd0:	000783a3          	sb	zero,7(a5)
    1cd4:	0086871b          	addiw	a4,a3,8
    1cd8:	08c77e63          	bgeu	a4,a2,1d74 <stpncpy+0x1ce>
    1cdc:	00078423          	sb	zero,8(a5)
    1ce0:	0096871b          	addiw	a4,a3,9
    1ce4:	08c77863          	bgeu	a4,a2,1d74 <stpncpy+0x1ce>
    1ce8:	000784a3          	sb	zero,9(a5)
    1cec:	00a6871b          	addiw	a4,a3,10
    1cf0:	08c77263          	bgeu	a4,a2,1d74 <stpncpy+0x1ce>
    1cf4:	00078523          	sb	zero,10(a5)
    1cf8:	00b6871b          	addiw	a4,a3,11
    1cfc:	06c77c63          	bgeu	a4,a2,1d74 <stpncpy+0x1ce>
    1d00:	000785a3          	sb	zero,11(a5)
    1d04:	00c6871b          	addiw	a4,a3,12
    1d08:	06c77663          	bgeu	a4,a2,1d74 <stpncpy+0x1ce>
    1d0c:	00078623          	sb	zero,12(a5)
    1d10:	26b5                	addiw	a3,a3,13
    1d12:	06c6f163          	bgeu	a3,a2,1d74 <stpncpy+0x1ce>
    1d16:	000786a3          	sb	zero,13(a5)
    1d1a:	8082                	ret
            ;
        if (!n || !*s)
    1d1c:	c645                	beqz	a2,1dc4 <stpncpy+0x21e>
    1d1e:	0005c783          	lbu	a5,0(a1)
    1d22:	ea078be3          	beqz	a5,1bd8 <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d26:	479d                	li	a5,7
    1d28:	02c7ff63          	bgeu	a5,a2,1d66 <stpncpy+0x1c0>
    1d2c:	00000897          	auipc	a7,0x0
    1d30:	29c8b883          	ld	a7,668(a7) # 1fc8 <unlink+0x38>
    1d34:	00000817          	auipc	a6,0x0
    1d38:	29c83803          	ld	a6,668(a6) # 1fd0 <unlink+0x40>
    1d3c:	431d                	li	t1,7
    1d3e:	6198                	ld	a4,0(a1)
    1d40:	011707b3          	add	a5,a4,a7
    1d44:	fff74693          	not	a3,a4
    1d48:	8ff5                	and	a5,a5,a3
    1d4a:	0107f7b3          	and	a5,a5,a6
    1d4e:	ef81                	bnez	a5,1d66 <stpncpy+0x1c0>
            *wd = *ws;
    1d50:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d52:	1661                	addi	a2,a2,-8
    1d54:	05a1                	addi	a1,a1,8
    1d56:	0521                	addi	a0,a0,8
    1d58:	fec363e3          	bltu	t1,a2,1d3e <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1d5c:	e609                	bnez	a2,1d66 <stpncpy+0x1c0>
    1d5e:	a08d                	j	1dc0 <stpncpy+0x21a>
    1d60:	167d                	addi	a2,a2,-1
    1d62:	0505                	addi	a0,a0,1
    1d64:	ca01                	beqz	a2,1d74 <stpncpy+0x1ce>
    1d66:	0005c783          	lbu	a5,0(a1)
    1d6a:	0585                	addi	a1,a1,1
    1d6c:	00f50023          	sb	a5,0(a0)
    1d70:	fbe5                	bnez	a5,1d60 <stpncpy+0x1ba>
        ;
tail:
    1d72:	b59d                	j	1bd8 <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1d74:	8082                	ret
    1d76:	472d                	li	a4,11
    1d78:	bdb5                	j	1bf4 <stpncpy+0x4e>
    1d7a:	00778713          	addi	a4,a5,7
    1d7e:	45ad                	li	a1,11
    1d80:	fff60693          	addi	a3,a2,-1
    1d84:	e6b778e3          	bgeu	a4,a1,1bf4 <stpncpy+0x4e>
    1d88:	b7fd                	j	1d76 <stpncpy+0x1d0>
    1d8a:	40a007b3          	neg	a5,a0
    1d8e:	8832                	mv	a6,a2
    1d90:	8b9d                	andi	a5,a5,7
    1d92:	4681                	li	a3,0
    1d94:	e4060be3          	beqz	a2,1bea <stpncpy+0x44>
    1d98:	b7cd                	j	1d7a <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d9a:	468d                	li	a3,3
    1d9c:	bd75                	j	1c58 <stpncpy+0xb2>
    1d9e:	872a                	mv	a4,a0
    1da0:	4681                	li	a3,0
    1da2:	bd5d                	j	1c58 <stpncpy+0xb2>
    1da4:	4685                	li	a3,1
    1da6:	bd4d                	j	1c58 <stpncpy+0xb2>
    1da8:	8082                	ret
    1daa:	87aa                	mv	a5,a0
    1dac:	4681                	li	a3,0
    1dae:	b5f9                	j	1c7c <stpncpy+0xd6>
    1db0:	4689                	li	a3,2
    1db2:	b55d                	j	1c58 <stpncpy+0xb2>
    1db4:	4691                	li	a3,4
    1db6:	b54d                	j	1c58 <stpncpy+0xb2>
    1db8:	4695                	li	a3,5
    1dba:	bd79                	j	1c58 <stpncpy+0xb2>
    1dbc:	4699                	li	a3,6
    1dbe:	bd69                	j	1c58 <stpncpy+0xb2>
    1dc0:	8082                	ret
    1dc2:	8082                	ret
    1dc4:	8082                	ret

0000000000001dc6 <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1dc6:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1dca:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dcc:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <close>:
    register long a7 __asm__("a7") = n;
    1dd4:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1dd8:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1ddc:	2501                	sext.w	a0,a0
    1dde:	8082                	ret

0000000000001de0 <read>:
    register long a7 __asm__("a7") = n;
    1de0:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de4:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1de8:	8082                	ret

0000000000001dea <write>:
    register long a7 __asm__("a7") = n;
    1dea:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dee:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1df2:	8082                	ret

0000000000001df4 <getpid>:
    register long a7 __asm__("a7") = n;
    1df4:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1df8:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1dfc:	2501                	sext.w	a0,a0
    1dfe:	8082                	ret

0000000000001e00 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1e00:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1e04:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1e08:	2501                	sext.w	a0,a0
    1e0a:	8082                	ret

0000000000001e0c <fork>:
    register long a7 __asm__("a7") = n;
    1e0c:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1e10:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1e14:	2501                	sext.w	a0,a0
    1e16:	8082                	ret

0000000000001e18 <exit>:
    register long a7 __asm__("a7") = n;
    1e18:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e1c:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e20:	8082                	ret

0000000000001e22 <waitpid>:
    register long a7 __asm__("a7") = n;
    1e22:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e26:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1e2a:	2501                	sext.w	a0,a0
    1e2c:	8082                	ret

0000000000001e2e <exec>:
    register long a7 __asm__("a7") = n;
    1e2e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e32:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e36:	2501                	sext.w	a0,a0
    1e38:	8082                	ret

0000000000001e3a <get_time>:

int64 get_time()
{
    1e3a:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e3c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e40:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e42:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e44:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e48:	2501                	sext.w	a0,a0
    1e4a:	ed09                	bnez	a0,1e64 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e4c:	67a2                	ld	a5,8(sp)
    1e4e:	3e800713          	li	a4,1000
    1e52:	00015503          	lhu	a0,0(sp)
    1e56:	02e7d7b3          	divu	a5,a5,a4
    1e5a:	02e50533          	mul	a0,a0,a4
    1e5e:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e60:	0141                	addi	sp,sp,16
    1e62:	8082                	ret
        return -1;
    1e64:	557d                	li	a0,-1
    1e66:	bfed                	j	1e60 <get_time+0x26>

0000000000001e68 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e68:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e6c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e70:	2501                	sext.w	a0,a0
    1e72:	8082                	ret

0000000000001e74 <sleep>:

int sleep(unsigned long long time)
{
    1e74:	1141                	addi	sp,sp,-16
    1e76:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1e78:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e7c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e7e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e80:	00000073          	ecall
    if (err == 0)
    1e84:	2501                	sext.w	a0,a0
    1e86:	e13d                	bnez	a0,1eec <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e88:	6722                	ld	a4,8(sp)
    1e8a:	3e800693          	li	a3,1000
    1e8e:	00015783          	lhu	a5,0(sp)
    1e92:	02d75733          	divu	a4,a4,a3
    1e96:	02d787b3          	mul	a5,a5,a3
    1e9a:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1e9c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ea0:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ea2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea4:	00000073          	ecall
    if (err == 0)
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	ed15                	bnez	a0,1ee6 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1eac:	6841                	lui	a6,0x10
    1eae:	963e                	add	a2,a2,a5
    1eb0:	187d                	addi	a6,a6,-1
    1eb2:	3e800693          	li	a3,1000
    1eb6:	a819                	j	1ecc <sleep+0x58>
    __asm_syscall("r"(a7))
    1eb8:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1ebc:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ec0:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ec2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec4:	00000073          	ecall
    if (err == 0)
    1ec8:	2501                	sext.w	a0,a0
    1eca:	ed11                	bnez	a0,1ee6 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ecc:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1ece:	07c00893          	li	a7,124
    1ed2:	02d7d733          	divu	a4,a5,a3
    1ed6:	6782                	ld	a5,0(sp)
    1ed8:	0107f7b3          	and	a5,a5,a6
    1edc:	02d787b3          	mul	a5,a5,a3
    1ee0:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1ee2:	fcc7ebe3          	bltu	a5,a2,1eb8 <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1ee6:	4501                	li	a0,0
    1ee8:	0141                	addi	sp,sp,16
    1eea:	8082                	ret
    1eec:	57fd                	li	a5,-1
    1eee:	b77d                	j	1e9c <sleep+0x28>

0000000000001ef0 <set_priority>:
    register long a7 __asm__("a7") = n;
    1ef0:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1ef4:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1ef8:	2501                	sext.w	a0,a0
    1efa:	8082                	ret

0000000000001efc <mmap>:
    register long a7 __asm__("a7") = n;
    1efc:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f00:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1f04:	2501                	sext.w	a0,a0
    1f06:	8082                	ret

0000000000001f08 <munmap>:
    register long a7 __asm__("a7") = n;
    1f08:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f0c:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1f10:	2501                	sext.w	a0,a0
    1f12:	8082                	ret

0000000000001f14 <wait>:

int wait(int *code)
{
    1f14:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f16:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1f1a:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f1c:	00000073          	ecall
    return waitpid(-1, code);
}
    1f20:	2501                	sext.w	a0,a0
    1f22:	8082                	ret

0000000000001f24 <spawn>:
    register long a7 __asm__("a7") = n;
    1f24:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1f28:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f2c:	2501                	sext.w	a0,a0
    1f2e:	8082                	ret

0000000000001f30 <mailread>:
    register long a7 __asm__("a7") = n;
    1f30:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f34:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f38:	2501                	sext.w	a0,a0
    1f3a:	8082                	ret

0000000000001f3c <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f3c:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f40:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f44:	2501                	sext.w	a0,a0
    1f46:	8082                	ret

0000000000001f48 <fstat>:
    register long a7 __asm__("a7") = n;
    1f48:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f4c:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f50:	2501                	sext.w	a0,a0
    1f52:	8082                	ret

0000000000001f54 <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1f54:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f56:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f5a:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f5c:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f60:	2501                	sext.w	a0,a0
    1f62:	8082                	ret

0000000000001f64 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f64:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f66:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f6a:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f6c:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f70:	2501                	sext.w	a0,a0
    1f72:	8082                	ret

0000000000001f74 <link>:

int link(char *old_path, char *new_path)
{
    1f74:	87aa                	mv	a5,a0
    1f76:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f78:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f7c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f80:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f82:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f86:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f88:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f8c:	2501                	sext.w	a0,a0
    1f8e:	8082                	ret

0000000000001f90 <unlink>:

int unlink(char *path)
{
    1f90:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f92:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f96:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f9a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f9c:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1fa0:	2501                	sext.w	a0,a0
    1fa2:	8082                	ret
