
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch3_0_sleep1:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0520006f          	j	1054 <__start_main>

0000000000001006 <main>:
/// Test sleep1 passed!

/// 注意不要单纯以 passed! 作为判断，还要注意时间间隔是否真的在 100 附近，误差要不超过 20%。

int main()
{
    1006:	1141                	addi	sp,sp,-16
    1008:	e406                	sd	ra,8(sp)
    100a:	e022                	sd	s0,0(sp)
    int64 start = get_time();
    100c:	5ff000ef          	jal	ra,1e0a <get_time>
    printf("current time_msec = %d\n", start);
    1010:	85aa                	mv	a1,a0
    int64 start = get_time();
    1012:	842a                	mv	s0,a0
    printf("current time_msec = %d\n", start);
    1014:	00001517          	auipc	a0,0x1
    1018:	f6450513          	addi	a0,a0,-156 # 1f78 <unlink+0x18>
    101c:	0ca000ef          	jal	ra,10e6 <printf>
    sleep(100);
    1020:	06400513          	li	a0,100
    1024:	621000ef          	jal	ra,1e44 <sleep>
    int64 end = get_time();
    1028:	5e3000ef          	jal	ra,1e0a <get_time>
    printf("time_msec = %d after sleeping 100 ticks, delta = %dms!\n", end, end - start);
    102c:	40850633          	sub	a2,a0,s0
    int64 end = get_time();
    1030:	85aa                	mv	a1,a0
    printf("time_msec = %d after sleeping 100 ticks, delta = %dms!\n", end, end - start);
    1032:	00001517          	auipc	a0,0x1
    1036:	f5e50513          	addi	a0,a0,-162 # 1f90 <unlink+0x30>
    103a:	0ac000ef          	jal	ra,10e6 <printf>
    puts("Test sleep1 passed!");
    103e:	00001517          	auipc	a0,0x1
    1042:	f8a50513          	addi	a0,a0,-118 # 1fc8 <unlink+0x68>
    1046:	05e000ef          	jal	ra,10a4 <puts>
    return 0;
    104a:	60a2                	ld	ra,8(sp)
    104c:	6402                	ld	s0,0(sp)
    104e:	4501                	li	a0,0
    1050:	0141                	addi	sp,sp,16
    1052:	8082                	ret

0000000000001054 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1054:	1141                	addi	sp,sp,-16
    1056:	e406                	sd	ra,8(sp)
    exit(main());
    1058:	fafff0ef          	jal	ra,1006 <main>
    105c:	58d000ef          	jal	ra,1de8 <exit>
    return 0;
}
    1060:	60a2                	ld	ra,8(sp)
    1062:	4501                	li	a0,0
    1064:	0141                	addi	sp,sp,16
    1066:	8082                	ret

0000000000001068 <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    1068:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    106a:	00f10593          	addi	a1,sp,15
    106e:	4605                	li	a2,1
    1070:	4501                	li	a0,0
{
    1072:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1074:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1078:	539000ef          	jal	ra,1db0 <read>
    return byte;
}
    107c:	60e2                	ld	ra,24(sp)
    107e:	00f14503          	lbu	a0,15(sp)
    1082:	6105                	addi	sp,sp,32
    1084:	8082                	ret

0000000000001086 <putchar>:

int putchar(int c)
{
    1086:	1101                	addi	sp,sp,-32
    1088:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    108a:	00f10593          	addi	a1,sp,15
    108e:	4605                	li	a2,1
    1090:	4505                	li	a0,1
{
    1092:	ec06                	sd	ra,24(sp)
    char byte = c;
    1094:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1098:	523000ef          	jal	ra,1dba <write>
}
    109c:	60e2                	ld	ra,24(sp)
    109e:	2501                	sext.w	a0,a0
    10a0:	6105                	addi	sp,sp,32
    10a2:	8082                	ret

00000000000010a4 <puts>:

int puts(const char *s)
{
    10a4:	1101                	addi	sp,sp,-32
    10a6:	e822                	sd	s0,16(sp)
    10a8:	ec06                	sd	ra,24(sp)
    10aa:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    10ac:	145000ef          	jal	ra,19f0 <strlen>
    10b0:	862a                	mv	a2,a0
    10b2:	85a2                	mv	a1,s0
    10b4:	4505                	li	a0,1
    10b6:	505000ef          	jal	ra,1dba <write>
    10ba:	00055763          	bgez	a0,10c8 <puts+0x24>
    return r;
}
    10be:	60e2                	ld	ra,24(sp)
    10c0:	6442                	ld	s0,16(sp)
    10c2:	557d                	li	a0,-1
    10c4:	6105                	addi	sp,sp,32
    10c6:	8082                	ret
    return write(stdout, &byte, 1);
    10c8:	00f10593          	addi	a1,sp,15
    char byte = c;
    10cc:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    10ce:	4605                	li	a2,1
    10d0:	4505                	li	a0,1
    char byte = c;
    10d2:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    10d6:	4e5000ef          	jal	ra,1dba <write>
}
    10da:	60e2                	ld	ra,24(sp)
    10dc:	6442                	ld	s0,16(sp)
    10de:	41f5551b          	sraiw	a0,a0,0x1f
    10e2:	6105                	addi	sp,sp,32
    10e4:	8082                	ret

00000000000010e6 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    10e6:	7131                	addi	sp,sp,-192
    10e8:	ecce                	sd	s3,88(sp)
    10ea:	e8d2                	sd	s4,80(sp)
    10ec:	e4d6                	sd	s5,72(sp)
    10ee:	e0da                	sd	s6,64(sp)
    10f0:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    10f2:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    10f4:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    10f6:	6ae1                	lui	s5,0x18
    10f8:	000f4a37          	lui	s4,0xf4
    10fc:	00989b37          	lui	s6,0x989
{
    1100:	fc86                	sd	ra,120(sp)
    1102:	f8a2                	sd	s0,112(sp)
    1104:	f4a6                	sd	s1,104(sp)
    1106:	f0ca                	sd	s2,96(sp)
    1108:	fc5e                	sd	s7,56(sp)
    110a:	e52e                	sd	a1,136(sp)
    110c:	e932                	sd	a2,144(sp)
    110e:	ed36                	sd	a3,152(sp)
    1110:	f13a                	sd	a4,160(sp)
    1112:	f942                	sd	a6,176(sp)
    1114:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1116:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    1118:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x70f>
    111c:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x1669f>
    1120:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf223f>
    1124:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x98767f>
    for (;;)
    {
        if (!*s)
    1128:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    112c:	02500913          	li	s2,37
        if (!*s)
    1130:	1a078f63          	beqz	a5,12ee <printf+0x208>
    1134:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1136:	17278e63          	beq	a5,s2,12b2 <printf+0x1cc>
    113a:	00164783          	lbu	a5,1(a2)
    113e:	0605                	addi	a2,a2,1
    1140:	fbfd                	bnez	a5,1136 <printf+0x50>
    1142:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    1144:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1148:	85aa                	mv	a1,a0
    114a:	8622                	mv	a2,s0
    114c:	4505                	li	a0,1
    114e:	46d000ef          	jal	ra,1dba <write>
        out(f, a, l);
        if (l)
    1152:	18041963          	bnez	s0,12e4 <printf+0x1fe>
            continue;
        if (s[1] == 0)
    1156:	0014c783          	lbu	a5,1(s1)
    115a:	18078a63          	beqz	a5,12ee <printf+0x208>
            break;
        switch (s[1])
    115e:	07300713          	li	a4,115
    1162:	28e78e63          	beq	a5,a4,13fe <printf+0x318>
    1166:	18f76f63          	bltu	a4,a5,1304 <printf+0x21e>
    116a:	06400713          	li	a4,100
    116e:	2ae78c63          	beq	a5,a4,1426 <printf+0x340>
    1172:	07000713          	li	a4,112
    1176:	3ce79c63          	bne	a5,a4,154e <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    117a:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    117c:	00001797          	auipc	a5,0x1
    1180:	e8478793          	addi	a5,a5,-380 # 2000 <digits>
            printptr(va_arg(ap, uint64));
    1184:	6298                	ld	a4,0(a3)
    1186:	00868093          	addi	ra,a3,8
    118a:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    118c:	00471293          	slli	t0,a4,0x4
    1190:	00c71f13          	slli	t5,a4,0xc
    1194:	01471e13          	slli	t3,a4,0x14
    1198:	01c71893          	slli	a7,a4,0x1c
    119c:	02471813          	slli	a6,a4,0x24
    11a0:	02871513          	slli	a0,a4,0x28
    11a4:	02c71593          	slli	a1,a4,0x2c
    11a8:	03071693          	slli	a3,a4,0x30
    11ac:	00871f93          	slli	t6,a4,0x8
    11b0:	01071e93          	slli	t4,a4,0x10
    11b4:	01871313          	slli	t1,a4,0x18
    11b8:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    11bc:	03c2d293          	srli	t0,t0,0x3c
    11c0:	03cf5f13          	srli	t5,t5,0x3c
    11c4:	03ce5e13          	srli	t3,t3,0x3c
    11c8:	03c8d893          	srli	a7,a7,0x3c
    11cc:	03c85813          	srli	a6,a6,0x3c
    11d0:	9171                	srli	a0,a0,0x3c
    11d2:	91f1                	srli	a1,a1,0x3c
    11d4:	92f1                	srli	a3,a3,0x3c
    11d6:	92be                	add	t0,t0,a5
    11d8:	9f3e                	add	t5,t5,a5
    11da:	9e3e                	add	t3,t3,a5
    11dc:	98be                	add	a7,a7,a5
    11de:	983e                	add	a6,a6,a5
    11e0:	953e                	add	a0,a0,a5
    11e2:	95be                	add	a1,a1,a5
    11e4:	96be                	add	a3,a3,a5
    11e6:	03c75393          	srli	t2,a4,0x3c
    11ea:	01c75b9b          	srliw	s7,a4,0x1c
    11ee:	03cfdf93          	srli	t6,t6,0x3c
    11f2:	03cede93          	srli	t4,t4,0x3c
    11f6:	03c35313          	srli	t1,t1,0x3c
    11fa:	9271                	srli	a2,a2,0x3c
    11fc:	0002c403          	lbu	s0,0(t0)
    1200:	93be                	add	t2,t2,a5
    1202:	000f4283          	lbu	t0,0(t5)
    1206:	9fbe                	add	t6,t6,a5
    1208:	000e4f03          	lbu	t5,0(t3)
    120c:	9ebe                	add	t4,t4,a5
    120e:	0008ce03          	lbu	t3,0(a7)
    1212:	933e                	add	t1,t1,a5
    1214:	00084883          	lbu	a7,0(a6)
    1218:	9bbe                	add	s7,s7,a5
    121a:	00054803          	lbu	a6,0(a0)
    121e:	963e                	add	a2,a2,a5
    1220:	0005c503          	lbu	a0,0(a1)
    1224:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1228:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    122c:	0003c903          	lbu	s2,0(t2)
    1230:	00064603          	lbu	a2,0(a2)
    1234:	000fc383          	lbu	t2,0(t6)
    1238:	8b3d                	andi	a4,a4,15
    123a:	000ecf83          	lbu	t6,0(t4)
    123e:	92f1                	srli	a3,a3,0x3c
    1240:	00034e83          	lbu	t4,0(t1)
    1244:	000bc303          	lbu	t1,0(s7)
    1248:	96be                	add	a3,a3,a5
    124a:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    124c:	7761                	lui	a4,0xffff8
    124e:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1252:	00710623          	sb	t2,12(sp)
    1256:	005106a3          	sb	t0,13(sp)
    125a:	01f10723          	sb	t6,14(sp)
    125e:	01e107a3          	sb	t5,15(sp)
    1262:	01d10823          	sb	t4,16(sp)
    1266:	01c108a3          	sb	t3,17(sp)
    126a:	00610923          	sb	t1,18(sp)
    126e:	011109a3          	sb	a7,19(sp)
    1272:	01010a23          	sb	a6,20(sp)
    1276:	00a10aa3          	sb	a0,21(sp)
    127a:	00b10b23          	sb	a1,22(sp)
    127e:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    1282:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1286:	01210523          	sb	s2,10(sp)
    128a:	008105a3          	sb	s0,11(sp)
    128e:	0006c703          	lbu	a4,0(a3)
    1292:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1296:	4649                	li	a2,18
    1298:	002c                	addi	a1,sp,8
    129a:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    129c:	00e10c23          	sb	a4,24(sp)
    12a0:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    12a4:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    12a8:	313000ef          	jal	ra,1dba <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    12ac:	00248513          	addi	a0,s1,2
    12b0:	bda5                	j	1128 <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    12b2:	00064783          	lbu	a5,0(a2)
    12b6:	84b2                	mv	s1,a2
    12b8:	01278963          	beq	a5,s2,12ca <printf+0x1e4>
    12bc:	b561                	j	1144 <printf+0x5e>
    12be:	0024c783          	lbu	a5,2(s1)
    12c2:	0605                	addi	a2,a2,1
    12c4:	0489                	addi	s1,s1,2
    12c6:	e7279fe3          	bne	a5,s2,1144 <printf+0x5e>
    12ca:	0014c783          	lbu	a5,1(s1)
    12ce:	ff2788e3          	beq	a5,s2,12be <printf+0x1d8>
        l = z - a;
    12d2:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    12d6:	85aa                	mv	a1,a0
    12d8:	8622                	mv	a2,s0
    12da:	4505                	li	a0,1
    12dc:	2df000ef          	jal	ra,1dba <write>
        if (l)
    12e0:	e6040be3          	beqz	s0,1156 <printf+0x70>
    12e4:	8526                	mv	a0,s1
        if (!*s)
    12e6:	00054783          	lbu	a5,0(a0)
    12ea:	e40795e3          	bnez	a5,1134 <printf+0x4e>
    }
    va_end(ap);
    12ee:	70e6                	ld	ra,120(sp)
    12f0:	7446                	ld	s0,112(sp)
    12f2:	74a6                	ld	s1,104(sp)
    12f4:	7906                	ld	s2,96(sp)
    12f6:	69e6                	ld	s3,88(sp)
    12f8:	6a46                	ld	s4,80(sp)
    12fa:	6aa6                	ld	s5,72(sp)
    12fc:	6b06                	ld	s6,64(sp)
    12fe:	7be2                	ld	s7,56(sp)
    1300:	6129                	addi	sp,sp,192
    1302:	8082                	ret
        switch (s[1])
    1304:	07800713          	li	a4,120
    1308:	24e79363          	bne	a5,a4,154e <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    130c:	6782                	ld	a5,0(sp)
    130e:	4394                	lw	a3,0(a5)
    1310:	07a1                	addi	a5,a5,8
    1312:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1314:	2606c263          	bltz	a3,1578 <printf+0x492>
        buf[i--] = digits[x % base];
    1318:	00001797          	auipc	a5,0x1
    131c:	ce878793          	addi	a5,a5,-792 # 2000 <digits>
    1320:	00f6f713          	andi	a4,a3,15
    1324:	973e                	add	a4,a4,a5
    1326:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff6000>
    buf[16] = 0;
    132a:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    132e:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    1330:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1334:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    1338:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    133c:	0046d51b          	srliw	a0,a3,0x4
    1340:	0ad5d563          	bge	a1,a3,13ea <printf+0x304>
        buf[i--] = digits[x % base];
    1344:	8a3d                	andi	a2,a2,15
    1346:	963e                	add	a2,a2,a5
    1348:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    134c:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    1350:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1354:	30a5fe63          	bgeu	a1,a0,1670 <printf+0x58a>
        buf[i--] = digits[x % base];
    1358:	00f77613          	andi	a2,a4,15
    135c:	963e                	add	a2,a2,a5
    135e:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1362:	45bd                	li	a1,15
    1364:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    1368:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    136c:	00475513          	srli	a0,a4,0x4
    1370:	30e5f963          	bgeu	a1,a4,1682 <printf+0x59c>
        buf[i--] = digits[x % base];
    1374:	8a3d                	andi	a2,a2,15
    1376:	963e                	add	a2,a2,a5
    1378:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    137c:	00875893          	srli	a7,a4,0x8
    1380:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    1384:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    1388:	30a5fd63          	bgeu	a1,a0,16a2 <printf+0x5bc>
        buf[i--] = digits[x % base];
    138c:	8a3d                	andi	a2,a2,15
    138e:	963e                	add	a2,a2,a5
    1390:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1394:	00c75813          	srli	a6,a4,0xc
    1398:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    139c:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    13a0:	3315fe63          	bgeu	a1,a7,16dc <printf+0x5f6>
        buf[i--] = digits[x % base];
    13a4:	8a3d                	andi	a2,a2,15
    13a6:	963e                	add	a2,a2,a5
    13a8:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13ac:	01075893          	srli	a7,a4,0x10
    13b0:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    13b4:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    13b8:	3305ff63          	bgeu	a1,a6,16f6 <printf+0x610>
        buf[i--] = digits[x % base];
    13bc:	8a3d                	andi	a2,a2,15
    13be:	963e                	add	a2,a2,a5
    13c0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    13c4:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    13c8:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    13cc:	3515f863          	bgeu	a1,a7,171c <printf+0x636>
        buf[i--] = digits[x % base];
    13d0:	97ba                	add	a5,a5,a4
    13d2:	0007c783          	lbu	a5,0(a5)
    13d6:	45a1                	li	a1,8
    13d8:	00f10823          	sb	a5,16(sp)
    if (sign)
    13dc:	0006d763          	bgez	a3,13ea <printf+0x304>
        buf[i--] = '-';
    13e0:	02d00793          	li	a5,45
    13e4:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    13e8:	459d                	li	a1,7
    write(f, s, l);
    13ea:	4641                	li	a2,16
    13ec:	003c                	addi	a5,sp,8
    13ee:	9e0d                	subw	a2,a2,a1
    13f0:	4505                	li	a0,1
    13f2:	95be                	add	a1,a1,a5
    13f4:	1c7000ef          	jal	ra,1dba <write>
        s += 2;
    13f8:	00248513          	addi	a0,s1,2
    13fc:	b335                	j	1128 <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    13fe:	6782                	ld	a5,0(sp)
    1400:	6380                	ld	s0,0(a5)
    1402:	07a1                	addi	a5,a5,8
    1404:	e03e                	sd	a5,0(sp)
    1406:	22040a63          	beqz	s0,163a <printf+0x554>
            l = strnlen(a, 200);
    140a:	0c800593          	li	a1,200
    140e:	8522                	mv	a0,s0
    1410:	6cc000ef          	jal	ra,1adc <strnlen>
    write(f, s, l);
    1414:	0005061b          	sext.w	a2,a0
    1418:	85a2                	mv	a1,s0
    141a:	4505                	li	a0,1
    141c:	19f000ef          	jal	ra,1dba <write>
        s += 2;
    1420:	00248513          	addi	a0,s1,2
    1424:	b311                	j	1128 <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    1426:	6782                	ld	a5,0(sp)
    1428:	4390                	lw	a2,0(a5)
    142a:	07a1                	addi	a5,a5,8
    142c:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    142e:	1a064363          	bltz	a2,15d4 <printf+0x4ee>
        buf[i--] = digits[x % base];
    1432:	46a9                	li	a3,10
    1434:	02d6773b          	remuw	a4,a2,a3
    1438:	00001797          	auipc	a5,0x1
    143c:	bc878793          	addi	a5,a5,-1080 # 2000 <digits>
    buf[16] = 0;
    1440:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1444:	4525                	li	a0,9
        x = xx;
    1446:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    144a:	973e                	add	a4,a4,a5
    144c:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    1450:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    1454:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1458:	2cc55063          	bge	a0,a2,1718 <printf+0x632>
    145c:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1460:	02d5f73b          	remuw	a4,a1,a3
    1464:	1702                	slli	a4,a4,0x20
    1466:	9301                	srli	a4,a4,0x20
    1468:	973e                	add	a4,a4,a5
    146a:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    146e:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    1472:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    1476:	1f057d63          	bgeu	a0,a6,1670 <printf+0x58a>
        buf[i--] = digits[x % base];
    147a:	4529                	li	a0,10
    } while ((x /= base) != 0);
    147c:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    147e:	02a5f73b          	remuw	a4,a1,a0
    1482:	973e                	add	a4,a4,a5
    1484:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    1488:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    148c:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    1490:	1ab6f163          	bgeu	a3,a1,1632 <printf+0x54c>
    1494:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    1498:	02a776bb          	remuw	a3,a4,a0
    149c:	96be                	add	a3,a3,a5
    149e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14a2:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14a6:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    14aa:	20b87c63          	bgeu	a6,a1,16c2 <printf+0x5dc>
    14ae:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    14b2:	02a776bb          	remuw	a3,a4,a0
    14b6:	96be                	add	a3,a3,a5
    14b8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14bc:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14c0:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    14c4:	20b87363          	bgeu	a6,a1,16ca <printf+0x5e4>
        buf[i--] = digits[x % base];
    14c8:	02a776bb          	remuw	a3,a4,a0
    14cc:	96be                	add	a3,a3,a5
    14ce:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14d2:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14d6:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    14da:	20b9f563          	bgeu	s3,a1,16e4 <printf+0x5fe>
        buf[i--] = digits[x % base];
    14de:	02a776bb          	remuw	a3,a4,a0
    14e2:	96be                	add	a3,a3,a5
    14e4:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14e8:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14ec:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    14f0:	20bafb63          	bgeu	s5,a1,1706 <printf+0x620>
        buf[i--] = digits[x % base];
    14f4:	02a776bb          	remuw	a3,a4,a0
    14f8:	96be                	add	a3,a3,a5
    14fa:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14fe:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1502:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1506:	1eba7c63          	bgeu	s4,a1,16fe <printf+0x618>
        buf[i--] = digits[x % base];
    150a:	02a776bb          	remuw	a3,a4,a0
    150e:	96be                	add	a3,a3,a5
    1510:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1514:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1518:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    151c:	14bb7163          	bgeu	s6,a1,165e <printf+0x578>
        buf[i--] = digits[x % base];
    1520:	1702                	slli	a4,a4,0x20
    1522:	9301                	srli	a4,a4,0x20
    1524:	97ba                	add	a5,a5,a4
    1526:	0007c783          	lbu	a5,0(a5)
    152a:	4599                	li	a1,6
    152c:	00f10723          	sb	a5,14(sp)
    if (sign)
    1530:	ea065de3          	bgez	a2,13ea <printf+0x304>
        buf[i--] = '-';
    1534:	02d00793          	li	a5,45
    1538:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    153c:	4595                	li	a1,5
    write(f, s, l);
    153e:	003c                	addi	a5,sp,8
    1540:	4641                	li	a2,16
    1542:	9e0d                	subw	a2,a2,a1
    1544:	4505                	li	a0,1
    1546:	95be                	add	a1,a1,a5
    1548:	073000ef          	jal	ra,1dba <write>
    154c:	b575                	j	13f8 <printf+0x312>
    char byte = c;
    154e:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1552:	4605                	li	a2,1
    1554:	002c                	addi	a1,sp,8
    1556:	4505                	li	a0,1
    char byte = c;
    1558:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    155c:	05f000ef          	jal	ra,1dba <write>
    char byte = c;
    1560:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1564:	4605                	li	a2,1
    1566:	002c                	addi	a1,sp,8
    1568:	4505                	li	a0,1
    char byte = c;
    156a:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    156e:	04d000ef          	jal	ra,1dba <write>
        s += 2;
    1572:	00248513          	addi	a0,s1,2
    1576:	be4d                	j	1128 <printf+0x42>
        x = -xx;
    1578:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    157c:	00001797          	auipc	a5,0x1
    1580:	a8478793          	addi	a5,a5,-1404 # 2000 <digits>
    1584:	00f77613          	andi	a2,a4,15
    1588:	963e                	add	a2,a2,a5
    158a:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    158e:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1592:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    1594:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1598:	0047551b          	srliw	a0,a4,0x4
    159c:	0047561b          	srliw	a2,a4,0x4
    15a0:	0ab6d263          	bge	a3,a1,1644 <printf+0x55e>
        buf[i--] = digits[x % base];
    15a4:	8a3d                	andi	a2,a2,15
    15a6:	963e                	add	a2,a2,a5
    15a8:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    15ac:	463d                	li	a2,15
    15ae:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    15b2:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    15b6:	daa661e3          	bltu	a2,a0,1358 <printf+0x272>
        buf[i--] = '-';
    15ba:	02d00793          	li	a5,45
    15be:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    15c2:	45b5                	li	a1,13
    write(f, s, l);
    15c4:	003c                	addi	a5,sp,8
    15c6:	4641                	li	a2,16
    15c8:	9e0d                	subw	a2,a2,a1
    15ca:	4505                	li	a0,1
    15cc:	95be                	add	a1,a1,a5
    15ce:	7ec000ef          	jal	ra,1dba <write>
    15d2:	b51d                	j	13f8 <printf+0x312>
        x = -xx;
    15d4:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    15d8:	46a9                	li	a3,10
    15da:	02d875bb          	remuw	a1,a6,a3
    15de:	00001797          	auipc	a5,0x1
    15e2:	a2278793          	addi	a5,a5,-1502 # 2000 <digits>
    buf[16] = 0;
    15e6:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    15ea:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    15ec:	95be                	add	a1,a1,a5
    15ee:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    15f2:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    15f6:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    15fa:	04a65563          	bge	a2,a0,1644 <printf+0x55e>
    15fe:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1602:	02d775bb          	remuw	a1,a4,a3
    1606:	95be                	add	a1,a1,a5
    1608:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    160c:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    1610:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    1614:	fb0573e3          	bgeu	a0,a6,15ba <printf+0x4d4>
        buf[i--] = digits[x % base];
    1618:	4529                	li	a0,10
    } while ((x /= base) != 0);
    161a:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    161c:	02a5f73b          	remuw	a4,a1,a0
    1620:	973e                	add	a4,a4,a5
    1622:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    1626:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    162a:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    162e:	e6b6e3e3          	bltu	a3,a1,1494 <printf+0x3ae>
        buf[i--] = digits[x % base];
    1632:	45b5                	li	a1,13
    if (sign)
    1634:	da065be3          	bgez	a2,13ea <printf+0x304>
    1638:	a881                	j	1688 <printf+0x5a2>
                a = "(null)";
    163a:	00001417          	auipc	s0,0x1
    163e:	9a640413          	addi	s0,s0,-1626 # 1fe0 <unlink+0x80>
    1642:	b3e1                	j	140a <printf+0x324>
        buf[i--] = '-';
    1644:	02d00793          	li	a5,45
    1648:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    164c:	45b9                	li	a1,14
    write(f, s, l);
    164e:	003c                	addi	a5,sp,8
    1650:	4641                	li	a2,16
    1652:	9e0d                	subw	a2,a2,a1
    1654:	4505                	li	a0,1
    1656:	95be                	add	a1,a1,a5
    1658:	762000ef          	jal	ra,1dba <write>
    165c:	bb71                	j	13f8 <printf+0x312>
        buf[i--] = digits[x % base];
    165e:	459d                	li	a1,7
    if (sign)
    1660:	d80655e3          	bgez	a2,13ea <printf+0x304>
        buf[i--] = '-';
    1664:	02d00793          	li	a5,45
    1668:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    166c:	4599                	li	a1,6
    166e:	bbb5                	j	13ea <printf+0x304>
    1670:	45b9                	li	a1,14
    write(f, s, l);
    1672:	003c                	addi	a5,sp,8
    1674:	4641                	li	a2,16
    1676:	9e0d                	subw	a2,a2,a1
    1678:	4505                	li	a0,1
    167a:	95be                	add	a1,a1,a5
    167c:	73e000ef          	jal	ra,1dba <write>
    1680:	bba5                	j	13f8 <printf+0x312>
        buf[i--] = digits[x % base];
    1682:	45b5                	li	a1,13
    if (sign)
    1684:	d606d3e3          	bgez	a3,13ea <printf+0x304>
        buf[i--] = '-';
    1688:	02d00793          	li	a5,45
    168c:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1690:	45b1                	li	a1,12
    write(f, s, l);
    1692:	003c                	addi	a5,sp,8
    1694:	4641                	li	a2,16
    1696:	9e0d                	subw	a2,a2,a1
    1698:	4505                	li	a0,1
    169a:	95be                	add	a1,a1,a5
    169c:	71e000ef          	jal	ra,1dba <write>
    16a0:	bba1                	j	13f8 <printf+0x312>
        buf[i--] = digits[x % base];
    16a2:	45b1                	li	a1,12
    if (sign)
    16a4:	d406d3e3          	bgez	a3,13ea <printf+0x304>
        buf[i--] = '-';
    16a8:	02d00793          	li	a5,45
    16ac:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    16b0:	45ad                	li	a1,11
    write(f, s, l);
    16b2:	003c                	addi	a5,sp,8
    16b4:	4641                	li	a2,16
    16b6:	9e0d                	subw	a2,a2,a1
    16b8:	4505                	li	a0,1
    16ba:	95be                	add	a1,a1,a5
    16bc:	6fe000ef          	jal	ra,1dba <write>
    16c0:	bb25                	j	13f8 <printf+0x312>
        buf[i--] = digits[x % base];
    16c2:	45b1                	li	a1,12
    if (sign)
    16c4:	d20653e3          	bgez	a2,13ea <printf+0x304>
    16c8:	b7c5                	j	16a8 <printf+0x5c2>
        buf[i--] = digits[x % base];
    16ca:	45ad                	li	a1,11
    if (sign)
    16cc:	d0065fe3          	bgez	a2,13ea <printf+0x304>
        buf[i--] = '-';
    16d0:	02d00793          	li	a5,45
    16d4:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    16d8:	45a9                	li	a1,10
    16da:	bb01                	j	13ea <printf+0x304>
    16dc:	45ad                	li	a1,11
    if (sign)
    16de:	d006d6e3          	bgez	a3,13ea <printf+0x304>
    16e2:	b7fd                	j	16d0 <printf+0x5ea>
        buf[i--] = digits[x % base];
    16e4:	45a9                	li	a1,10
    if (sign)
    16e6:	d00652e3          	bgez	a2,13ea <printf+0x304>
        buf[i--] = '-';
    16ea:	02d00793          	li	a5,45
    16ee:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    16f2:	45a5                	li	a1,9
    16f4:	b9dd                	j	13ea <printf+0x304>
    16f6:	45a9                	li	a1,10
    if (sign)
    16f8:	ce06d9e3          	bgez	a3,13ea <printf+0x304>
    16fc:	b7fd                	j	16ea <printf+0x604>
        buf[i--] = digits[x % base];
    16fe:	45a1                	li	a1,8
    if (sign)
    1700:	ce0655e3          	bgez	a2,13ea <printf+0x304>
    1704:	b9f1                	j	13e0 <printf+0x2fa>
        buf[i--] = digits[x % base];
    1706:	45a5                	li	a1,9
    if (sign)
    1708:	ce0651e3          	bgez	a2,13ea <printf+0x304>
        buf[i--] = '-';
    170c:	02d00793          	li	a5,45
    1710:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1714:	45a1                	li	a1,8
    1716:	b9d1                	j	13ea <printf+0x304>
    i = 15;
    1718:	45bd                	li	a1,15
    171a:	b9c1                	j	13ea <printf+0x304>
        buf[i--] = digits[x % base];
    171c:	45a5                	li	a1,9
    if (sign)
    171e:	cc06d6e3          	bgez	a3,13ea <printf+0x304>
    1722:	b7ed                	j	170c <printf+0x626>

0000000000001724 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1724:	02000793          	li	a5,32
    1728:	00f50663          	beq	a0,a5,1734 <isspace+0x10>
    172c:	355d                	addiw	a0,a0,-9
    172e:	00553513          	sltiu	a0,a0,5
    1732:	8082                	ret
    1734:	4505                	li	a0,1
}
    1736:	8082                	ret

0000000000001738 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1738:	fd05051b          	addiw	a0,a0,-48
}
    173c:	00a53513          	sltiu	a0,a0,10
    1740:	8082                	ret

0000000000001742 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1742:	02000613          	li	a2,32
    1746:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1748:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    174c:	ff77069b          	addiw	a3,a4,-9
    1750:	04c70d63          	beq	a4,a2,17aa <atoi+0x68>
    1754:	0007079b          	sext.w	a5,a4
    1758:	04d5f963          	bgeu	a1,a3,17aa <atoi+0x68>
        s++;
    switch (*s)
    175c:	02b00693          	li	a3,43
    1760:	04d70a63          	beq	a4,a3,17b4 <atoi+0x72>
    1764:	02d00693          	li	a3,45
    1768:	06d70463          	beq	a4,a3,17d0 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    176c:	fd07859b          	addiw	a1,a5,-48
    1770:	4625                	li	a2,9
    1772:	873e                	mv	a4,a5
    1774:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1776:	4e01                	li	t3,0
    while (isdigit(*s))
    1778:	04b66a63          	bltu	a2,a1,17cc <atoi+0x8a>
    int n = 0, neg = 0;
    177c:	4501                	li	a0,0
    while (isdigit(*s))
    177e:	4825                	li	a6,9
    1780:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1784:	0025179b          	slliw	a5,a0,0x2
    1788:	9d3d                	addw	a0,a0,a5
    178a:	fd07031b          	addiw	t1,a4,-48
    178e:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1792:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1796:	0685                	addi	a3,a3,1
    1798:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    179c:	0006071b          	sext.w	a4,a2
    17a0:	feb870e3          	bgeu	a6,a1,1780 <atoi+0x3e>
    return neg ? n : -n;
    17a4:	000e0563          	beqz	t3,17ae <atoi+0x6c>
}
    17a8:	8082                	ret
        s++;
    17aa:	0505                	addi	a0,a0,1
    17ac:	bf71                	j	1748 <atoi+0x6>
    17ae:	4113053b          	subw	a0,t1,a7
    17b2:	8082                	ret
    while (isdigit(*s))
    17b4:	00154783          	lbu	a5,1(a0)
    17b8:	4625                	li	a2,9
        s++;
    17ba:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17be:	fd07859b          	addiw	a1,a5,-48
    17c2:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    17c6:	4e01                	li	t3,0
    while (isdigit(*s))
    17c8:	fab67ae3          	bgeu	a2,a1,177c <atoi+0x3a>
    17cc:	4501                	li	a0,0
}
    17ce:	8082                	ret
    while (isdigit(*s))
    17d0:	00154783          	lbu	a5,1(a0)
    17d4:	4625                	li	a2,9
        s++;
    17d6:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17da:	fd07859b          	addiw	a1,a5,-48
    17de:	0007871b          	sext.w	a4,a5
    17e2:	feb665e3          	bltu	a2,a1,17cc <atoi+0x8a>
        neg = 1;
    17e6:	4e05                	li	t3,1
    17e8:	bf51                	j	177c <atoi+0x3a>

00000000000017ea <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ea:	16060d63          	beqz	a2,1964 <memset+0x17a>
    17ee:	40a007b3          	neg	a5,a0
    17f2:	8b9d                	andi	a5,a5,7
    17f4:	00778713          	addi	a4,a5,7
    17f8:	482d                	li	a6,11
    17fa:	0ff5f593          	andi	a1,a1,255
    17fe:	fff60693          	addi	a3,a2,-1
    1802:	17076263          	bltu	a4,a6,1966 <memset+0x17c>
    1806:	16e6ea63          	bltu	a3,a4,197a <memset+0x190>
    180a:	16078563          	beqz	a5,1974 <memset+0x18a>
    180e:	00b50023          	sb	a1,0(a0)
    1812:	4705                	li	a4,1
    1814:	00150e93          	addi	t4,a0,1
    1818:	14e78c63          	beq	a5,a4,1970 <memset+0x186>
    181c:	00b500a3          	sb	a1,1(a0)
    1820:	4709                	li	a4,2
    1822:	00250e93          	addi	t4,a0,2
    1826:	14e78d63          	beq	a5,a4,1980 <memset+0x196>
    182a:	00b50123          	sb	a1,2(a0)
    182e:	470d                	li	a4,3
    1830:	00350e93          	addi	t4,a0,3
    1834:	12e78b63          	beq	a5,a4,196a <memset+0x180>
    1838:	00b501a3          	sb	a1,3(a0)
    183c:	4711                	li	a4,4
    183e:	00450e93          	addi	t4,a0,4
    1842:	14e78163          	beq	a5,a4,1984 <memset+0x19a>
    1846:	00b50223          	sb	a1,4(a0)
    184a:	4715                	li	a4,5
    184c:	00550e93          	addi	t4,a0,5
    1850:	12e78c63          	beq	a5,a4,1988 <memset+0x19e>
    1854:	00b502a3          	sb	a1,5(a0)
    1858:	471d                	li	a4,7
    185a:	00650e93          	addi	t4,a0,6
    185e:	12e79763          	bne	a5,a4,198c <memset+0x1a2>
    1862:	00750e93          	addi	t4,a0,7
    1866:	00b50323          	sb	a1,6(a0)
    186a:	4f1d                	li	t5,7
    186c:	00859713          	slli	a4,a1,0x8
    1870:	8f4d                	or	a4,a4,a1
    1872:	01059e13          	slli	t3,a1,0x10
    1876:	01c76e33          	or	t3,a4,t3
    187a:	01859313          	slli	t1,a1,0x18
    187e:	006e6333          	or	t1,t3,t1
    1882:	02059893          	slli	a7,a1,0x20
    1886:	011368b3          	or	a7,t1,a7
    188a:	02859813          	slli	a6,a1,0x28
    188e:	40f60333          	sub	t1,a2,a5
    1892:	0108e833          	or	a6,a7,a6
    1896:	03059693          	slli	a3,a1,0x30
    189a:	00d866b3          	or	a3,a6,a3
    189e:	03859713          	slli	a4,a1,0x38
    18a2:	97aa                	add	a5,a5,a0
    18a4:	ff837813          	andi	a6,t1,-8
    18a8:	8f55                	or	a4,a4,a3
    18aa:	00f806b3          	add	a3,a6,a5
    18ae:	e398                	sd	a4,0(a5)
    18b0:	07a1                	addi	a5,a5,8
    18b2:	fed79ee3          	bne	a5,a3,18ae <memset+0xc4>
    18b6:	ff837693          	andi	a3,t1,-8
    18ba:	00de87b3          	add	a5,t4,a3
    18be:	01e6873b          	addw	a4,a3,t5
    18c2:	0ad30663          	beq	t1,a3,196e <memset+0x184>
    18c6:	00b78023          	sb	a1,0(a5)
    18ca:	0017069b          	addiw	a3,a4,1
    18ce:	08c6fb63          	bgeu	a3,a2,1964 <memset+0x17a>
    18d2:	00b780a3          	sb	a1,1(a5)
    18d6:	0027069b          	addiw	a3,a4,2
    18da:	08c6f563          	bgeu	a3,a2,1964 <memset+0x17a>
    18de:	00b78123          	sb	a1,2(a5)
    18e2:	0037069b          	addiw	a3,a4,3
    18e6:	06c6ff63          	bgeu	a3,a2,1964 <memset+0x17a>
    18ea:	00b781a3          	sb	a1,3(a5)
    18ee:	0047069b          	addiw	a3,a4,4
    18f2:	06c6f963          	bgeu	a3,a2,1964 <memset+0x17a>
    18f6:	00b78223          	sb	a1,4(a5)
    18fa:	0057069b          	addiw	a3,a4,5
    18fe:	06c6f363          	bgeu	a3,a2,1964 <memset+0x17a>
    1902:	00b782a3          	sb	a1,5(a5)
    1906:	0067069b          	addiw	a3,a4,6
    190a:	04c6fd63          	bgeu	a3,a2,1964 <memset+0x17a>
    190e:	00b78323          	sb	a1,6(a5)
    1912:	0077069b          	addiw	a3,a4,7
    1916:	04c6f763          	bgeu	a3,a2,1964 <memset+0x17a>
    191a:	00b783a3          	sb	a1,7(a5)
    191e:	0087069b          	addiw	a3,a4,8
    1922:	04c6f163          	bgeu	a3,a2,1964 <memset+0x17a>
    1926:	00b78423          	sb	a1,8(a5)
    192a:	0097069b          	addiw	a3,a4,9
    192e:	02c6fb63          	bgeu	a3,a2,1964 <memset+0x17a>
    1932:	00b784a3          	sb	a1,9(a5)
    1936:	00a7069b          	addiw	a3,a4,10
    193a:	02c6f563          	bgeu	a3,a2,1964 <memset+0x17a>
    193e:	00b78523          	sb	a1,10(a5)
    1942:	00b7069b          	addiw	a3,a4,11
    1946:	00c6ff63          	bgeu	a3,a2,1964 <memset+0x17a>
    194a:	00b785a3          	sb	a1,11(a5)
    194e:	00c7069b          	addiw	a3,a4,12
    1952:	00c6f963          	bgeu	a3,a2,1964 <memset+0x17a>
    1956:	00b78623          	sb	a1,12(a5)
    195a:	2735                	addiw	a4,a4,13
    195c:	00c77463          	bgeu	a4,a2,1964 <memset+0x17a>
    1960:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1964:	8082                	ret
    1966:	472d                	li	a4,11
    1968:	bd79                	j	1806 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    196a:	4f0d                	li	t5,3
    196c:	b701                	j	186c <memset+0x82>
    196e:	8082                	ret
    1970:	4f05                	li	t5,1
    1972:	bded                	j	186c <memset+0x82>
    1974:	8eaa                	mv	t4,a0
    1976:	4f01                	li	t5,0
    1978:	bdd5                	j	186c <memset+0x82>
    197a:	87aa                	mv	a5,a0
    197c:	4701                	li	a4,0
    197e:	b7a1                	j	18c6 <memset+0xdc>
    1980:	4f09                	li	t5,2
    1982:	b5ed                	j	186c <memset+0x82>
    1984:	4f11                	li	t5,4
    1986:	b5dd                	j	186c <memset+0x82>
    1988:	4f15                	li	t5,5
    198a:	b5cd                	j	186c <memset+0x82>
    198c:	4f19                	li	t5,6
    198e:	bdf9                	j	186c <memset+0x82>

0000000000001990 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1990:	00054783          	lbu	a5,0(a0)
    1994:	0005c703          	lbu	a4,0(a1)
    1998:	00e79863          	bne	a5,a4,19a8 <strcmp+0x18>
    199c:	0505                	addi	a0,a0,1
    199e:	0585                	addi	a1,a1,1
    19a0:	fbe5                	bnez	a5,1990 <strcmp>
    19a2:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    19a4:	9d19                	subw	a0,a0,a4
    19a6:	8082                	ret
    19a8:	0007851b          	sext.w	a0,a5
    19ac:	bfe5                	j	19a4 <strcmp+0x14>

00000000000019ae <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    19ae:	ce05                	beqz	a2,19e6 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19b0:	00054703          	lbu	a4,0(a0)
    19b4:	0005c783          	lbu	a5,0(a1)
    19b8:	cb0d                	beqz	a4,19ea <strncmp+0x3c>
    if (!n--)
    19ba:	167d                	addi	a2,a2,-1
    19bc:	00c506b3          	add	a3,a0,a2
    19c0:	a819                	j	19d6 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19c2:	00a68e63          	beq	a3,a0,19de <strncmp+0x30>
    19c6:	0505                	addi	a0,a0,1
    19c8:	00e79b63          	bne	a5,a4,19de <strncmp+0x30>
    19cc:	00054703          	lbu	a4,0(a0)
    19d0:	0005c783          	lbu	a5,0(a1)
    19d4:	cb19                	beqz	a4,19ea <strncmp+0x3c>
    19d6:	0005c783          	lbu	a5,0(a1)
    19da:	0585                	addi	a1,a1,1
    19dc:	f3fd                	bnez	a5,19c2 <strncmp+0x14>
        ;
    return *l - *r;
    19de:	0007051b          	sext.w	a0,a4
    19e2:	9d1d                	subw	a0,a0,a5
    19e4:	8082                	ret
        return 0;
    19e6:	4501                	li	a0,0
}
    19e8:	8082                	ret
    19ea:	4501                	li	a0,0
    return *l - *r;
    19ec:	9d1d                	subw	a0,a0,a5
    19ee:	8082                	ret

00000000000019f0 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    19f0:	00757793          	andi	a5,a0,7
    19f4:	cf89                	beqz	a5,1a0e <strlen+0x1e>
    19f6:	87aa                	mv	a5,a0
    19f8:	a029                	j	1a02 <strlen+0x12>
    19fa:	0785                	addi	a5,a5,1
    19fc:	0077f713          	andi	a4,a5,7
    1a00:	cb01                	beqz	a4,1a10 <strlen+0x20>
        if (!*s)
    1a02:	0007c703          	lbu	a4,0(a5)
    1a06:	fb75                	bnez	a4,19fa <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1a08:	40a78533          	sub	a0,a5,a0
}
    1a0c:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1a0e:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1a10:	6394                	ld	a3,0(a5)
    1a12:	00000597          	auipc	a1,0x0
    1a16:	5d65b583          	ld	a1,1494(a1) # 1fe8 <unlink+0x88>
    1a1a:	00000617          	auipc	a2,0x0
    1a1e:	5d663603          	ld	a2,1494(a2) # 1ff0 <unlink+0x90>
    1a22:	a019                	j	1a28 <strlen+0x38>
    1a24:	6794                	ld	a3,8(a5)
    1a26:	07a1                	addi	a5,a5,8
    1a28:	00b68733          	add	a4,a3,a1
    1a2c:	fff6c693          	not	a3,a3
    1a30:	8f75                	and	a4,a4,a3
    1a32:	8f71                	and	a4,a4,a2
    1a34:	db65                	beqz	a4,1a24 <strlen+0x34>
    for (; *s; s++)
    1a36:	0007c703          	lbu	a4,0(a5)
    1a3a:	d779                	beqz	a4,1a08 <strlen+0x18>
    1a3c:	0017c703          	lbu	a4,1(a5)
    1a40:	0785                	addi	a5,a5,1
    1a42:	d379                	beqz	a4,1a08 <strlen+0x18>
    1a44:	0017c703          	lbu	a4,1(a5)
    1a48:	0785                	addi	a5,a5,1
    1a4a:	fb6d                	bnez	a4,1a3c <strlen+0x4c>
    1a4c:	bf75                	j	1a08 <strlen+0x18>

0000000000001a4e <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a4e:	00757713          	andi	a4,a0,7
{
    1a52:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1a54:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a58:	cb19                	beqz	a4,1a6e <memchr+0x20>
    1a5a:	ce25                	beqz	a2,1ad2 <memchr+0x84>
    1a5c:	0007c703          	lbu	a4,0(a5)
    1a60:	04b70e63          	beq	a4,a1,1abc <memchr+0x6e>
    1a64:	0785                	addi	a5,a5,1
    1a66:	0077f713          	andi	a4,a5,7
    1a6a:	167d                	addi	a2,a2,-1
    1a6c:	f77d                	bnez	a4,1a5a <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1a6e:	4501                	li	a0,0
    if (n && *s != c)
    1a70:	c235                	beqz	a2,1ad4 <memchr+0x86>
    1a72:	0007c703          	lbu	a4,0(a5)
    1a76:	04b70363          	beq	a4,a1,1abc <memchr+0x6e>
        size_t k = ONES * c;
    1a7a:	00000517          	auipc	a0,0x0
    1a7e:	57e53503          	ld	a0,1406(a0) # 1ff8 <unlink+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a82:	471d                	li	a4,7
        size_t k = ONES * c;
    1a84:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a88:	02c77a63          	bgeu	a4,a2,1abc <memchr+0x6e>
    1a8c:	00000897          	auipc	a7,0x0
    1a90:	55c8b883          	ld	a7,1372(a7) # 1fe8 <unlink+0x88>
    1a94:	00000817          	auipc	a6,0x0
    1a98:	55c83803          	ld	a6,1372(a6) # 1ff0 <unlink+0x90>
    1a9c:	431d                	li	t1,7
    1a9e:	a029                	j	1aa8 <memchr+0x5a>
    1aa0:	1661                	addi	a2,a2,-8
    1aa2:	07a1                	addi	a5,a5,8
    1aa4:	02c37963          	bgeu	t1,a2,1ad6 <memchr+0x88>
    1aa8:	6398                	ld	a4,0(a5)
    1aaa:	8f29                	xor	a4,a4,a0
    1aac:	011706b3          	add	a3,a4,a7
    1ab0:	fff74713          	not	a4,a4
    1ab4:	8f75                	and	a4,a4,a3
    1ab6:	01077733          	and	a4,a4,a6
    1aba:	d37d                	beqz	a4,1aa0 <memchr+0x52>
    1abc:	853e                	mv	a0,a5
    1abe:	97b2                	add	a5,a5,a2
    1ac0:	a021                	j	1ac8 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1ac2:	0505                	addi	a0,a0,1
    1ac4:	00f50763          	beq	a0,a5,1ad2 <memchr+0x84>
    1ac8:	00054703          	lbu	a4,0(a0)
    1acc:	feb71be3          	bne	a4,a1,1ac2 <memchr+0x74>
    1ad0:	8082                	ret
    return n ? (void *)s : 0;
    1ad2:	4501                	li	a0,0
}
    1ad4:	8082                	ret
    return n ? (void *)s : 0;
    1ad6:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1ad8:	f275                	bnez	a2,1abc <memchr+0x6e>
}
    1ada:	8082                	ret

0000000000001adc <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1adc:	1101                	addi	sp,sp,-32
    1ade:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1ae0:	862e                	mv	a2,a1
{
    1ae2:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1ae4:	4581                	li	a1,0
{
    1ae6:	e426                	sd	s1,8(sp)
    1ae8:	ec06                	sd	ra,24(sp)
    1aea:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1aec:	f63ff0ef          	jal	ra,1a4e <memchr>
    return p ? p - s : n;
    1af0:	c519                	beqz	a0,1afe <strnlen+0x22>
}
    1af2:	60e2                	ld	ra,24(sp)
    1af4:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1af6:	8d05                	sub	a0,a0,s1
}
    1af8:	64a2                	ld	s1,8(sp)
    1afa:	6105                	addi	sp,sp,32
    1afc:	8082                	ret
    1afe:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1b00:	8522                	mv	a0,s0
}
    1b02:	6442                	ld	s0,16(sp)
    1b04:	64a2                	ld	s1,8(sp)
    1b06:	6105                	addi	sp,sp,32
    1b08:	8082                	ret

0000000000001b0a <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1b0a:	00b547b3          	xor	a5,a0,a1
    1b0e:	8b9d                	andi	a5,a5,7
    1b10:	eb95                	bnez	a5,1b44 <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1b12:	0075f793          	andi	a5,a1,7
    1b16:	e7b1                	bnez	a5,1b62 <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1b18:	6198                	ld	a4,0(a1)
    1b1a:	00000617          	auipc	a2,0x0
    1b1e:	4ce63603          	ld	a2,1230(a2) # 1fe8 <unlink+0x88>
    1b22:	00000817          	auipc	a6,0x0
    1b26:	4ce83803          	ld	a6,1230(a6) # 1ff0 <unlink+0x90>
    1b2a:	a029                	j	1b34 <stpcpy+0x2a>
    1b2c:	e118                	sd	a4,0(a0)
    1b2e:	6598                	ld	a4,8(a1)
    1b30:	05a1                	addi	a1,a1,8
    1b32:	0521                	addi	a0,a0,8
    1b34:	00c707b3          	add	a5,a4,a2
    1b38:	fff74693          	not	a3,a4
    1b3c:	8ff5                	and	a5,a5,a3
    1b3e:	0107f7b3          	and	a5,a5,a6
    1b42:	d7ed                	beqz	a5,1b2c <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b44:	0005c783          	lbu	a5,0(a1)
    1b48:	00f50023          	sb	a5,0(a0)
    1b4c:	c785                	beqz	a5,1b74 <stpcpy+0x6a>
    1b4e:	0015c783          	lbu	a5,1(a1)
    1b52:	0505                	addi	a0,a0,1
    1b54:	0585                	addi	a1,a1,1
    1b56:	00f50023          	sb	a5,0(a0)
    1b5a:	fbf5                	bnez	a5,1b4e <stpcpy+0x44>
        ;
    return d;
}
    1b5c:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1b5e:	0505                	addi	a0,a0,1
    1b60:	df45                	beqz	a4,1b18 <stpcpy+0xe>
            if (!(*d = *s))
    1b62:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1b66:	0585                	addi	a1,a1,1
    1b68:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1b6c:	00f50023          	sb	a5,0(a0)
    1b70:	f7fd                	bnez	a5,1b5e <stpcpy+0x54>
}
    1b72:	8082                	ret
    1b74:	8082                	ret

0000000000001b76 <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b76:	00b547b3          	xor	a5,a0,a1
    1b7a:	8b9d                	andi	a5,a5,7
    1b7c:	1a079863          	bnez	a5,1d2c <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b80:	0075f793          	andi	a5,a1,7
    1b84:	16078463          	beqz	a5,1cec <stpncpy+0x176>
    1b88:	ea01                	bnez	a2,1b98 <stpncpy+0x22>
    1b8a:	a421                	j	1d92 <stpncpy+0x21c>
    1b8c:	167d                	addi	a2,a2,-1
    1b8e:	0505                	addi	a0,a0,1
    1b90:	14070e63          	beqz	a4,1cec <stpncpy+0x176>
    1b94:	1a060863          	beqz	a2,1d44 <stpncpy+0x1ce>
    1b98:	0005c783          	lbu	a5,0(a1)
    1b9c:	0585                	addi	a1,a1,1
    1b9e:	0075f713          	andi	a4,a1,7
    1ba2:	00f50023          	sb	a5,0(a0)
    1ba6:	f3fd                	bnez	a5,1b8c <stpncpy+0x16>
    1ba8:	4805                	li	a6,1
    1baa:	1a061863          	bnez	a2,1d5a <stpncpy+0x1e4>
    1bae:	40a007b3          	neg	a5,a0
    1bb2:	8b9d                	andi	a5,a5,7
    1bb4:	4681                	li	a3,0
    1bb6:	18061a63          	bnez	a2,1d4a <stpncpy+0x1d4>
    1bba:	00778713          	addi	a4,a5,7
    1bbe:	45ad                	li	a1,11
    1bc0:	18b76363          	bltu	a4,a1,1d46 <stpncpy+0x1d0>
    1bc4:	1ae6eb63          	bltu	a3,a4,1d7a <stpncpy+0x204>
    1bc8:	1a078363          	beqz	a5,1d6e <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bcc:	00050023          	sb	zero,0(a0)
    1bd0:	4685                	li	a3,1
    1bd2:	00150713          	addi	a4,a0,1
    1bd6:	18d78f63          	beq	a5,a3,1d74 <stpncpy+0x1fe>
    1bda:	000500a3          	sb	zero,1(a0)
    1bde:	4689                	li	a3,2
    1be0:	00250713          	addi	a4,a0,2
    1be4:	18d78e63          	beq	a5,a3,1d80 <stpncpy+0x20a>
    1be8:	00050123          	sb	zero,2(a0)
    1bec:	468d                	li	a3,3
    1bee:	00350713          	addi	a4,a0,3
    1bf2:	16d78c63          	beq	a5,a3,1d6a <stpncpy+0x1f4>
    1bf6:	000501a3          	sb	zero,3(a0)
    1bfa:	4691                	li	a3,4
    1bfc:	00450713          	addi	a4,a0,4
    1c00:	18d78263          	beq	a5,a3,1d84 <stpncpy+0x20e>
    1c04:	00050223          	sb	zero,4(a0)
    1c08:	4695                	li	a3,5
    1c0a:	00550713          	addi	a4,a0,5
    1c0e:	16d78d63          	beq	a5,a3,1d88 <stpncpy+0x212>
    1c12:	000502a3          	sb	zero,5(a0)
    1c16:	469d                	li	a3,7
    1c18:	00650713          	addi	a4,a0,6
    1c1c:	16d79863          	bne	a5,a3,1d8c <stpncpy+0x216>
    1c20:	00750713          	addi	a4,a0,7
    1c24:	00050323          	sb	zero,6(a0)
    1c28:	40f80833          	sub	a6,a6,a5
    1c2c:	ff887593          	andi	a1,a6,-8
    1c30:	97aa                	add	a5,a5,a0
    1c32:	95be                	add	a1,a1,a5
    1c34:	0007b023          	sd	zero,0(a5)
    1c38:	07a1                	addi	a5,a5,8
    1c3a:	feb79de3          	bne	a5,a1,1c34 <stpncpy+0xbe>
    1c3e:	ff887593          	andi	a1,a6,-8
    1c42:	9ead                	addw	a3,a3,a1
    1c44:	00b707b3          	add	a5,a4,a1
    1c48:	12b80863          	beq	a6,a1,1d78 <stpncpy+0x202>
    1c4c:	00078023          	sb	zero,0(a5)
    1c50:	0016871b          	addiw	a4,a3,1
    1c54:	0ec77863          	bgeu	a4,a2,1d44 <stpncpy+0x1ce>
    1c58:	000780a3          	sb	zero,1(a5)
    1c5c:	0026871b          	addiw	a4,a3,2
    1c60:	0ec77263          	bgeu	a4,a2,1d44 <stpncpy+0x1ce>
    1c64:	00078123          	sb	zero,2(a5)
    1c68:	0036871b          	addiw	a4,a3,3
    1c6c:	0cc77c63          	bgeu	a4,a2,1d44 <stpncpy+0x1ce>
    1c70:	000781a3          	sb	zero,3(a5)
    1c74:	0046871b          	addiw	a4,a3,4
    1c78:	0cc77663          	bgeu	a4,a2,1d44 <stpncpy+0x1ce>
    1c7c:	00078223          	sb	zero,4(a5)
    1c80:	0056871b          	addiw	a4,a3,5
    1c84:	0cc77063          	bgeu	a4,a2,1d44 <stpncpy+0x1ce>
    1c88:	000782a3          	sb	zero,5(a5)
    1c8c:	0066871b          	addiw	a4,a3,6
    1c90:	0ac77a63          	bgeu	a4,a2,1d44 <stpncpy+0x1ce>
    1c94:	00078323          	sb	zero,6(a5)
    1c98:	0076871b          	addiw	a4,a3,7
    1c9c:	0ac77463          	bgeu	a4,a2,1d44 <stpncpy+0x1ce>
    1ca0:	000783a3          	sb	zero,7(a5)
    1ca4:	0086871b          	addiw	a4,a3,8
    1ca8:	08c77e63          	bgeu	a4,a2,1d44 <stpncpy+0x1ce>
    1cac:	00078423          	sb	zero,8(a5)
    1cb0:	0096871b          	addiw	a4,a3,9
    1cb4:	08c77863          	bgeu	a4,a2,1d44 <stpncpy+0x1ce>
    1cb8:	000784a3          	sb	zero,9(a5)
    1cbc:	00a6871b          	addiw	a4,a3,10
    1cc0:	08c77263          	bgeu	a4,a2,1d44 <stpncpy+0x1ce>
    1cc4:	00078523          	sb	zero,10(a5)
    1cc8:	00b6871b          	addiw	a4,a3,11
    1ccc:	06c77c63          	bgeu	a4,a2,1d44 <stpncpy+0x1ce>
    1cd0:	000785a3          	sb	zero,11(a5)
    1cd4:	00c6871b          	addiw	a4,a3,12
    1cd8:	06c77663          	bgeu	a4,a2,1d44 <stpncpy+0x1ce>
    1cdc:	00078623          	sb	zero,12(a5)
    1ce0:	26b5                	addiw	a3,a3,13
    1ce2:	06c6f163          	bgeu	a3,a2,1d44 <stpncpy+0x1ce>
    1ce6:	000786a3          	sb	zero,13(a5)
    1cea:	8082                	ret
            ;
        if (!n || !*s)
    1cec:	c645                	beqz	a2,1d94 <stpncpy+0x21e>
    1cee:	0005c783          	lbu	a5,0(a1)
    1cf2:	ea078be3          	beqz	a5,1ba8 <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1cf6:	479d                	li	a5,7
    1cf8:	02c7ff63          	bgeu	a5,a2,1d36 <stpncpy+0x1c0>
    1cfc:	00000897          	auipc	a7,0x0
    1d00:	2ec8b883          	ld	a7,748(a7) # 1fe8 <unlink+0x88>
    1d04:	00000817          	auipc	a6,0x0
    1d08:	2ec83803          	ld	a6,748(a6) # 1ff0 <unlink+0x90>
    1d0c:	431d                	li	t1,7
    1d0e:	6198                	ld	a4,0(a1)
    1d10:	011707b3          	add	a5,a4,a7
    1d14:	fff74693          	not	a3,a4
    1d18:	8ff5                	and	a5,a5,a3
    1d1a:	0107f7b3          	and	a5,a5,a6
    1d1e:	ef81                	bnez	a5,1d36 <stpncpy+0x1c0>
            *wd = *ws;
    1d20:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d22:	1661                	addi	a2,a2,-8
    1d24:	05a1                	addi	a1,a1,8
    1d26:	0521                	addi	a0,a0,8
    1d28:	fec363e3          	bltu	t1,a2,1d0e <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1d2c:	e609                	bnez	a2,1d36 <stpncpy+0x1c0>
    1d2e:	a08d                	j	1d90 <stpncpy+0x21a>
    1d30:	167d                	addi	a2,a2,-1
    1d32:	0505                	addi	a0,a0,1
    1d34:	ca01                	beqz	a2,1d44 <stpncpy+0x1ce>
    1d36:	0005c783          	lbu	a5,0(a1)
    1d3a:	0585                	addi	a1,a1,1
    1d3c:	00f50023          	sb	a5,0(a0)
    1d40:	fbe5                	bnez	a5,1d30 <stpncpy+0x1ba>
        ;
tail:
    1d42:	b59d                	j	1ba8 <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1d44:	8082                	ret
    1d46:	472d                	li	a4,11
    1d48:	bdb5                	j	1bc4 <stpncpy+0x4e>
    1d4a:	00778713          	addi	a4,a5,7
    1d4e:	45ad                	li	a1,11
    1d50:	fff60693          	addi	a3,a2,-1
    1d54:	e6b778e3          	bgeu	a4,a1,1bc4 <stpncpy+0x4e>
    1d58:	b7fd                	j	1d46 <stpncpy+0x1d0>
    1d5a:	40a007b3          	neg	a5,a0
    1d5e:	8832                	mv	a6,a2
    1d60:	8b9d                	andi	a5,a5,7
    1d62:	4681                	li	a3,0
    1d64:	e4060be3          	beqz	a2,1bba <stpncpy+0x44>
    1d68:	b7cd                	j	1d4a <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d6a:	468d                	li	a3,3
    1d6c:	bd75                	j	1c28 <stpncpy+0xb2>
    1d6e:	872a                	mv	a4,a0
    1d70:	4681                	li	a3,0
    1d72:	bd5d                	j	1c28 <stpncpy+0xb2>
    1d74:	4685                	li	a3,1
    1d76:	bd4d                	j	1c28 <stpncpy+0xb2>
    1d78:	8082                	ret
    1d7a:	87aa                	mv	a5,a0
    1d7c:	4681                	li	a3,0
    1d7e:	b5f9                	j	1c4c <stpncpy+0xd6>
    1d80:	4689                	li	a3,2
    1d82:	b55d                	j	1c28 <stpncpy+0xb2>
    1d84:	4691                	li	a3,4
    1d86:	b54d                	j	1c28 <stpncpy+0xb2>
    1d88:	4695                	li	a3,5
    1d8a:	bd79                	j	1c28 <stpncpy+0xb2>
    1d8c:	4699                	li	a3,6
    1d8e:	bd69                	j	1c28 <stpncpy+0xb2>
    1d90:	8082                	ret
    1d92:	8082                	ret
    1d94:	8082                	ret

0000000000001d96 <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1d96:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1d9a:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d9c:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1da0:	2501                	sext.w	a0,a0
    1da2:	8082                	ret

0000000000001da4 <close>:
    register long a7 __asm__("a7") = n;
    1da4:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1da8:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1dac:	2501                	sext.w	a0,a0
    1dae:	8082                	ret

0000000000001db0 <read>:
    register long a7 __asm__("a7") = n;
    1db0:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db4:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1db8:	8082                	ret

0000000000001dba <write>:
    register long a7 __asm__("a7") = n;
    1dba:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dbe:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1dc2:	8082                	ret

0000000000001dc4 <getpid>:
    register long a7 __asm__("a7") = n;
    1dc4:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1dc8:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1dcc:	2501                	sext.w	a0,a0
    1dce:	8082                	ret

0000000000001dd0 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1dd0:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1dd4:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1dd8:	2501                	sext.w	a0,a0
    1dda:	8082                	ret

0000000000001ddc <fork>:
    register long a7 __asm__("a7") = n;
    1ddc:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1de0:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1de4:	2501                	sext.w	a0,a0
    1de6:	8082                	ret

0000000000001de8 <exit>:
    register long a7 __asm__("a7") = n;
    1de8:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1dec:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1df0:	8082                	ret

0000000000001df2 <waitpid>:
    register long a7 __asm__("a7") = n;
    1df2:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1df6:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1dfa:	2501                	sext.w	a0,a0
    1dfc:	8082                	ret

0000000000001dfe <exec>:
    register long a7 __asm__("a7") = n;
    1dfe:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e02:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e06:	2501                	sext.w	a0,a0
    1e08:	8082                	ret

0000000000001e0a <get_time>:

int64 get_time()
{
    1e0a:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e0c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e10:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e12:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e14:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e18:	2501                	sext.w	a0,a0
    1e1a:	ed09                	bnez	a0,1e34 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e1c:	67a2                	ld	a5,8(sp)
    1e1e:	3e800713          	li	a4,1000
    1e22:	00015503          	lhu	a0,0(sp)
    1e26:	02e7d7b3          	divu	a5,a5,a4
    1e2a:	02e50533          	mul	a0,a0,a4
    1e2e:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e30:	0141                	addi	sp,sp,16
    1e32:	8082                	ret
        return -1;
    1e34:	557d                	li	a0,-1
    1e36:	bfed                	j	1e30 <get_time+0x26>

0000000000001e38 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e38:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e3c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <sleep>:

int sleep(unsigned long long time)
{
    1e44:	1141                	addi	sp,sp,-16
    1e46:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1e48:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e4c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e4e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e50:	00000073          	ecall
    if (err == 0)
    1e54:	2501                	sext.w	a0,a0
    1e56:	e13d                	bnez	a0,1ebc <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e58:	6722                	ld	a4,8(sp)
    1e5a:	3e800693          	li	a3,1000
    1e5e:	00015783          	lhu	a5,0(sp)
    1e62:	02d75733          	divu	a4,a4,a3
    1e66:	02d787b3          	mul	a5,a5,a3
    1e6a:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1e6c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e70:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e72:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e74:	00000073          	ecall
    if (err == 0)
    1e78:	2501                	sext.w	a0,a0
    1e7a:	ed15                	bnez	a0,1eb6 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e7c:	6841                	lui	a6,0x10
    1e7e:	963e                	add	a2,a2,a5
    1e80:	187d                	addi	a6,a6,-1
    1e82:	3e800693          	li	a3,1000
    1e86:	a819                	j	1e9c <sleep+0x58>
    __asm_syscall("r"(a7))
    1e88:	00000073          	ecall
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
    1e9a:	ed11                	bnez	a0,1eb6 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e9c:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1e9e:	07c00893          	li	a7,124
    1ea2:	02d7d733          	divu	a4,a5,a3
    1ea6:	6782                	ld	a5,0(sp)
    1ea8:	0107f7b3          	and	a5,a5,a6
    1eac:	02d787b3          	mul	a5,a5,a3
    1eb0:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1eb2:	fcc7ebe3          	bltu	a5,a2,1e88 <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1eb6:	4501                	li	a0,0
    1eb8:	0141                	addi	sp,sp,16
    1eba:	8082                	ret
    1ebc:	57fd                	li	a5,-1
    1ebe:	b77d                	j	1e6c <sleep+0x28>

0000000000001ec0 <set_priority>:
    register long a7 __asm__("a7") = n;
    1ec0:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1ec4:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1ec8:	2501                	sext.w	a0,a0
    1eca:	8082                	ret

0000000000001ecc <mmap>:
    register long a7 __asm__("a7") = n;
    1ecc:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ed0:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1ed4:	2501                	sext.w	a0,a0
    1ed6:	8082                	ret

0000000000001ed8 <munmap>:
    register long a7 __asm__("a7") = n;
    1ed8:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1edc:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1ee0:	2501                	sext.w	a0,a0
    1ee2:	8082                	ret

0000000000001ee4 <wait>:

int wait(int *code)
{
    1ee4:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ee6:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1eea:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eec:	00000073          	ecall
    return waitpid(-1, code);
}
    1ef0:	2501                	sext.w	a0,a0
    1ef2:	8082                	ret

0000000000001ef4 <spawn>:
    register long a7 __asm__("a7") = n;
    1ef4:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1ef8:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1efc:	2501                	sext.w	a0,a0
    1efe:	8082                	ret

0000000000001f00 <mailread>:
    register long a7 __asm__("a7") = n;
    1f00:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f04:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f08:	2501                	sext.w	a0,a0
    1f0a:	8082                	ret

0000000000001f0c <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f0c:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f10:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f14:	2501                	sext.w	a0,a0
    1f16:	8082                	ret

0000000000001f18 <fstat>:
    register long a7 __asm__("a7") = n;
    1f18:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f1c:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f20:	2501                	sext.w	a0,a0
    1f22:	8082                	ret

0000000000001f24 <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1f24:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f26:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f2a:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f2c:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f30:	2501                	sext.w	a0,a0
    1f32:	8082                	ret

0000000000001f34 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f34:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f36:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f3a:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f3c:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f40:	2501                	sext.w	a0,a0
    1f42:	8082                	ret

0000000000001f44 <link>:

int link(char *old_path, char *new_path)
{
    1f44:	87aa                	mv	a5,a0
    1f46:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f48:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f4c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f50:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f52:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f56:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f58:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f5c:	2501                	sext.w	a0,a0
    1f5e:	8082                	ret

0000000000001f60 <unlink>:

int unlink(char *path)
{
    1f60:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f62:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f66:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f6a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f6c:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f70:	2501                	sext.w	a0,a0
    1f72:	8082                	ret
