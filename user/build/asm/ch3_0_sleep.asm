
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch3_0_sleep:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0560006f          	j	1058 <__start_main>

0000000000001006 <main>:
/// Test sleep OK!

/// 注意不要单纯以 OK! 作为判断，还要注意输出时间是否符合实际。

int main()
{
    1006:	1141                	addi	sp,sp,-16
    1008:	e022                	sd	s0,0(sp)
    100a:	e406                	sd	ra,8(sp)
    int64 current_time = get_time();
    100c:	603000ef          	jal	ra,1e0e <get_time>
    1010:	842a                	mv	s0,a0
    assert(current_time > 0);
    1012:	02a05f63          	blez	a0,1050 <main+0x4a>
    printf("get_time OK! %d\n", current_time);
    1016:	85a2                	mv	a1,s0
    1018:	00001517          	auipc	a0,0x1
    101c:	f6050513          	addi	a0,a0,-160 # 1f78 <unlink+0x14>
    1020:	0ca000ef          	jal	ra,10ea <printf>
    int64 wait_for = current_time + 3000;
    1024:	6585                	lui	a1,0x1
    1026:	bb858593          	addi	a1,a1,-1096 # bb8 <_start-0x448>
    102a:	942e                	add	s0,s0,a1
    while (get_time() < wait_for)
    102c:	a019                	j	1032 <main+0x2c>
    {
        sched_yield();
    102e:	5a7000ef          	jal	ra,1dd4 <sched_yield>
    while (get_time() < wait_for)
    1032:	5dd000ef          	jal	ra,1e0e <get_time>
    1036:	fe854ce3          	blt	a0,s0,102e <main+0x28>
    }
    puts("Test sleep OK!");
    103a:	00001517          	auipc	a0,0x1
    103e:	f5650513          	addi	a0,a0,-170 # 1f90 <unlink+0x2c>
    1042:	066000ef          	jal	ra,10a8 <puts>
    return 0;
    1046:	60a2                	ld	ra,8(sp)
    1048:	6402                	ld	s0,0(sp)
    104a:	4501                	li	a0,0
    104c:	0141                	addi	sp,sp,16
    104e:	8082                	ret
    assert(current_time > 0);
    1050:	557d                	li	a0,-1
    1052:	59b000ef          	jal	ra,1dec <exit>
    1056:	b7c1                	j	1016 <main+0x10>

0000000000001058 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1058:	1141                	addi	sp,sp,-16
    105a:	e406                	sd	ra,8(sp)
    exit(main());
    105c:	fabff0ef          	jal	ra,1006 <main>
    1060:	58d000ef          	jal	ra,1dec <exit>
    return 0;
}
    1064:	60a2                	ld	ra,8(sp)
    1066:	4501                	li	a0,0
    1068:	0141                	addi	sp,sp,16
    106a:	8082                	ret

000000000000106c <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    106c:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    106e:	00f10593          	addi	a1,sp,15
    1072:	4605                	li	a2,1
    1074:	4501                	li	a0,0
{
    1076:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1078:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    107c:	539000ef          	jal	ra,1db4 <read>
    return byte;
}
    1080:	60e2                	ld	ra,24(sp)
    1082:	00f14503          	lbu	a0,15(sp)
    1086:	6105                	addi	sp,sp,32
    1088:	8082                	ret

000000000000108a <putchar>:

int putchar(int c)
{
    108a:	1101                	addi	sp,sp,-32
    108c:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    108e:	00f10593          	addi	a1,sp,15
    1092:	4605                	li	a2,1
    1094:	4505                	li	a0,1
{
    1096:	ec06                	sd	ra,24(sp)
    char byte = c;
    1098:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    109c:	523000ef          	jal	ra,1dbe <write>
}
    10a0:	60e2                	ld	ra,24(sp)
    10a2:	2501                	sext.w	a0,a0
    10a4:	6105                	addi	sp,sp,32
    10a6:	8082                	ret

00000000000010a8 <puts>:

int puts(const char *s)
{
    10a8:	1101                	addi	sp,sp,-32
    10aa:	e822                	sd	s0,16(sp)
    10ac:	ec06                	sd	ra,24(sp)
    10ae:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    10b0:	145000ef          	jal	ra,19f4 <strlen>
    10b4:	862a                	mv	a2,a0
    10b6:	85a2                	mv	a1,s0
    10b8:	4505                	li	a0,1
    10ba:	505000ef          	jal	ra,1dbe <write>
    10be:	00055763          	bgez	a0,10cc <puts+0x24>
    return r;
}
    10c2:	60e2                	ld	ra,24(sp)
    10c4:	6442                	ld	s0,16(sp)
    10c6:	557d                	li	a0,-1
    10c8:	6105                	addi	sp,sp,32
    10ca:	8082                	ret
    return write(stdout, &byte, 1);
    10cc:	00f10593          	addi	a1,sp,15
    char byte = c;
    10d0:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    10d2:	4605                	li	a2,1
    10d4:	4505                	li	a0,1
    char byte = c;
    10d6:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    10da:	4e5000ef          	jal	ra,1dbe <write>
}
    10de:	60e2                	ld	ra,24(sp)
    10e0:	6442                	ld	s0,16(sp)
    10e2:	41f5551b          	sraiw	a0,a0,0x1f
    10e6:	6105                	addi	sp,sp,32
    10e8:	8082                	ret

00000000000010ea <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    10ea:	7131                	addi	sp,sp,-192
    10ec:	ecce                	sd	s3,88(sp)
    10ee:	e8d2                	sd	s4,80(sp)
    10f0:	e4d6                	sd	s5,72(sp)
    10f2:	e0da                	sd	s6,64(sp)
    10f4:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    10f6:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    10f8:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    10fa:	6ae1                	lui	s5,0x18
    10fc:	000f4a37          	lui	s4,0xf4
    1100:	00989b37          	lui	s6,0x989
{
    1104:	fc86                	sd	ra,120(sp)
    1106:	f8a2                	sd	s0,112(sp)
    1108:	f4a6                	sd	s1,104(sp)
    110a:	f0ca                	sd	s2,96(sp)
    110c:	fc5e                	sd	s7,56(sp)
    110e:	e52e                	sd	a1,136(sp)
    1110:	e932                	sd	a2,144(sp)
    1112:	ed36                	sd	a3,152(sp)
    1114:	f13a                	sd	a4,160(sp)
    1116:	f942                	sd	a6,176(sp)
    1118:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    111a:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    111c:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x74f>
    1120:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x166df>
    1124:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf227f>
    1128:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x9876bf>
    for (;;)
    {
        if (!*s)
    112c:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    1130:	02500913          	li	s2,37
        if (!*s)
    1134:	1a078f63          	beqz	a5,12f2 <printf+0x208>
    1138:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    113a:	17278e63          	beq	a5,s2,12b6 <printf+0x1cc>
    113e:	00164783          	lbu	a5,1(a2)
    1142:	0605                	addi	a2,a2,1
    1144:	fbfd                	bnez	a5,113a <printf+0x50>
    1146:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    1148:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    114c:	85aa                	mv	a1,a0
    114e:	8622                	mv	a2,s0
    1150:	4505                	li	a0,1
    1152:	46d000ef          	jal	ra,1dbe <write>
        out(f, a, l);
        if (l)
    1156:	18041963          	bnez	s0,12e8 <printf+0x1fe>
            continue;
        if (s[1] == 0)
    115a:	0014c783          	lbu	a5,1(s1)
    115e:	18078a63          	beqz	a5,12f2 <printf+0x208>
            break;
        switch (s[1])
    1162:	07300713          	li	a4,115
    1166:	28e78e63          	beq	a5,a4,1402 <printf+0x318>
    116a:	18f76f63          	bltu	a4,a5,1308 <printf+0x21e>
    116e:	06400713          	li	a4,100
    1172:	2ae78c63          	beq	a5,a4,142a <printf+0x340>
    1176:	07000713          	li	a4,112
    117a:	3ce79c63          	bne	a5,a4,1552 <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    117e:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1180:	00001797          	auipc	a5,0x1
    1184:	e4078793          	addi	a5,a5,-448 # 1fc0 <digits>
            printptr(va_arg(ap, uint64));
    1188:	6298                	ld	a4,0(a3)
    118a:	00868093          	addi	ra,a3,8
    118e:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1190:	00471293          	slli	t0,a4,0x4
    1194:	00c71f13          	slli	t5,a4,0xc
    1198:	01471e13          	slli	t3,a4,0x14
    119c:	01c71893          	slli	a7,a4,0x1c
    11a0:	02471813          	slli	a6,a4,0x24
    11a4:	02871513          	slli	a0,a4,0x28
    11a8:	02c71593          	slli	a1,a4,0x2c
    11ac:	03071693          	slli	a3,a4,0x30
    11b0:	00871f93          	slli	t6,a4,0x8
    11b4:	01071e93          	slli	t4,a4,0x10
    11b8:	01871313          	slli	t1,a4,0x18
    11bc:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    11c0:	03c2d293          	srli	t0,t0,0x3c
    11c4:	03cf5f13          	srli	t5,t5,0x3c
    11c8:	03ce5e13          	srli	t3,t3,0x3c
    11cc:	03c8d893          	srli	a7,a7,0x3c
    11d0:	03c85813          	srli	a6,a6,0x3c
    11d4:	9171                	srli	a0,a0,0x3c
    11d6:	91f1                	srli	a1,a1,0x3c
    11d8:	92f1                	srli	a3,a3,0x3c
    11da:	92be                	add	t0,t0,a5
    11dc:	9f3e                	add	t5,t5,a5
    11de:	9e3e                	add	t3,t3,a5
    11e0:	98be                	add	a7,a7,a5
    11e2:	983e                	add	a6,a6,a5
    11e4:	953e                	add	a0,a0,a5
    11e6:	95be                	add	a1,a1,a5
    11e8:	96be                	add	a3,a3,a5
    11ea:	03c75393          	srli	t2,a4,0x3c
    11ee:	01c75b9b          	srliw	s7,a4,0x1c
    11f2:	03cfdf93          	srli	t6,t6,0x3c
    11f6:	03cede93          	srli	t4,t4,0x3c
    11fa:	03c35313          	srli	t1,t1,0x3c
    11fe:	9271                	srli	a2,a2,0x3c
    1200:	0002c403          	lbu	s0,0(t0)
    1204:	93be                	add	t2,t2,a5
    1206:	000f4283          	lbu	t0,0(t5)
    120a:	9fbe                	add	t6,t6,a5
    120c:	000e4f03          	lbu	t5,0(t3)
    1210:	9ebe                	add	t4,t4,a5
    1212:	0008ce03          	lbu	t3,0(a7)
    1216:	933e                	add	t1,t1,a5
    1218:	00084883          	lbu	a7,0(a6)
    121c:	9bbe                	add	s7,s7,a5
    121e:	00054803          	lbu	a6,0(a0)
    1222:	963e                	add	a2,a2,a5
    1224:	0005c503          	lbu	a0,0(a1)
    1228:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    122c:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1230:	0003c903          	lbu	s2,0(t2)
    1234:	00064603          	lbu	a2,0(a2)
    1238:	000fc383          	lbu	t2,0(t6)
    123c:	8b3d                	andi	a4,a4,15
    123e:	000ecf83          	lbu	t6,0(t4)
    1242:	92f1                	srli	a3,a3,0x3c
    1244:	00034e83          	lbu	t4,0(t1)
    1248:	000bc303          	lbu	t1,0(s7)
    124c:	96be                	add	a3,a3,a5
    124e:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    1250:	7761                	lui	a4,0xffff8
    1252:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1256:	00710623          	sb	t2,12(sp)
    125a:	005106a3          	sb	t0,13(sp)
    125e:	01f10723          	sb	t6,14(sp)
    1262:	01e107a3          	sb	t5,15(sp)
    1266:	01d10823          	sb	t4,16(sp)
    126a:	01c108a3          	sb	t3,17(sp)
    126e:	00610923          	sb	t1,18(sp)
    1272:	011109a3          	sb	a7,19(sp)
    1276:	01010a23          	sb	a6,20(sp)
    127a:	00a10aa3          	sb	a0,21(sp)
    127e:	00b10b23          	sb	a1,22(sp)
    1282:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    1286:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    128a:	01210523          	sb	s2,10(sp)
    128e:	008105a3          	sb	s0,11(sp)
    1292:	0006c703          	lbu	a4,0(a3)
    1296:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    129a:	4649                	li	a2,18
    129c:	002c                	addi	a1,sp,8
    129e:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12a0:	00e10c23          	sb	a4,24(sp)
    12a4:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    12a8:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    12ac:	313000ef          	jal	ra,1dbe <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    12b0:	00248513          	addi	a0,s1,2
    12b4:	bda5                	j	112c <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    12b6:	00064783          	lbu	a5,0(a2)
    12ba:	84b2                	mv	s1,a2
    12bc:	01278963          	beq	a5,s2,12ce <printf+0x1e4>
    12c0:	b561                	j	1148 <printf+0x5e>
    12c2:	0024c783          	lbu	a5,2(s1)
    12c6:	0605                	addi	a2,a2,1
    12c8:	0489                	addi	s1,s1,2
    12ca:	e7279fe3          	bne	a5,s2,1148 <printf+0x5e>
    12ce:	0014c783          	lbu	a5,1(s1)
    12d2:	ff2788e3          	beq	a5,s2,12c2 <printf+0x1d8>
        l = z - a;
    12d6:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    12da:	85aa                	mv	a1,a0
    12dc:	8622                	mv	a2,s0
    12de:	4505                	li	a0,1
    12e0:	2df000ef          	jal	ra,1dbe <write>
        if (l)
    12e4:	e6040be3          	beqz	s0,115a <printf+0x70>
    12e8:	8526                	mv	a0,s1
        if (!*s)
    12ea:	00054783          	lbu	a5,0(a0)
    12ee:	e40795e3          	bnez	a5,1138 <printf+0x4e>
    }
    va_end(ap);
    12f2:	70e6                	ld	ra,120(sp)
    12f4:	7446                	ld	s0,112(sp)
    12f6:	74a6                	ld	s1,104(sp)
    12f8:	7906                	ld	s2,96(sp)
    12fa:	69e6                	ld	s3,88(sp)
    12fc:	6a46                	ld	s4,80(sp)
    12fe:	6aa6                	ld	s5,72(sp)
    1300:	6b06                	ld	s6,64(sp)
    1302:	7be2                	ld	s7,56(sp)
    1304:	6129                	addi	sp,sp,192
    1306:	8082                	ret
        switch (s[1])
    1308:	07800713          	li	a4,120
    130c:	24e79363          	bne	a5,a4,1552 <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    1310:	6782                	ld	a5,0(sp)
    1312:	4394                	lw	a3,0(a5)
    1314:	07a1                	addi	a5,a5,8
    1316:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1318:	2606c263          	bltz	a3,157c <printf+0x492>
        buf[i--] = digits[x % base];
    131c:	00001797          	auipc	a5,0x1
    1320:	ca478793          	addi	a5,a5,-860 # 1fc0 <digits>
    1324:	00f6f713          	andi	a4,a3,15
    1328:	973e                	add	a4,a4,a5
    132a:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff6040>
    buf[16] = 0;
    132e:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1332:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    1334:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1338:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    133c:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    1340:	0046d51b          	srliw	a0,a3,0x4
    1344:	0ad5d563          	bge	a1,a3,13ee <printf+0x304>
        buf[i--] = digits[x % base];
    1348:	8a3d                	andi	a2,a2,15
    134a:	963e                	add	a2,a2,a5
    134c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1350:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    1354:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1358:	30a5fe63          	bgeu	a1,a0,1674 <printf+0x58a>
        buf[i--] = digits[x % base];
    135c:	00f77613          	andi	a2,a4,15
    1360:	963e                	add	a2,a2,a5
    1362:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1366:	45bd                	li	a1,15
    1368:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    136c:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    1370:	00475513          	srli	a0,a4,0x4
    1374:	30e5f963          	bgeu	a1,a4,1686 <printf+0x59c>
        buf[i--] = digits[x % base];
    1378:	8a3d                	andi	a2,a2,15
    137a:	963e                	add	a2,a2,a5
    137c:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    1380:	00875893          	srli	a7,a4,0x8
    1384:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    1388:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    138c:	30a5fd63          	bgeu	a1,a0,16a6 <printf+0x5bc>
        buf[i--] = digits[x % base];
    1390:	8a3d                	andi	a2,a2,15
    1392:	963e                	add	a2,a2,a5
    1394:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1398:	00c75813          	srli	a6,a4,0xc
    139c:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    13a0:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    13a4:	3315fe63          	bgeu	a1,a7,16e0 <printf+0x5f6>
        buf[i--] = digits[x % base];
    13a8:	8a3d                	andi	a2,a2,15
    13aa:	963e                	add	a2,a2,a5
    13ac:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13b0:	01075893          	srli	a7,a4,0x10
    13b4:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    13b8:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    13bc:	3305ff63          	bgeu	a1,a6,16fa <printf+0x610>
        buf[i--] = digits[x % base];
    13c0:	8a3d                	andi	a2,a2,15
    13c2:	963e                	add	a2,a2,a5
    13c4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    13c8:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    13cc:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    13d0:	3515f863          	bgeu	a1,a7,1720 <printf+0x636>
        buf[i--] = digits[x % base];
    13d4:	97ba                	add	a5,a5,a4
    13d6:	0007c783          	lbu	a5,0(a5)
    13da:	45a1                	li	a1,8
    13dc:	00f10823          	sb	a5,16(sp)
    if (sign)
    13e0:	0006d763          	bgez	a3,13ee <printf+0x304>
        buf[i--] = '-';
    13e4:	02d00793          	li	a5,45
    13e8:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    13ec:	459d                	li	a1,7
    write(f, s, l);
    13ee:	4641                	li	a2,16
    13f0:	003c                	addi	a5,sp,8
    13f2:	9e0d                	subw	a2,a2,a1
    13f4:	4505                	li	a0,1
    13f6:	95be                	add	a1,a1,a5
    13f8:	1c7000ef          	jal	ra,1dbe <write>
        s += 2;
    13fc:	00248513          	addi	a0,s1,2
    1400:	b335                	j	112c <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    1402:	6782                	ld	a5,0(sp)
    1404:	6380                	ld	s0,0(a5)
    1406:	07a1                	addi	a5,a5,8
    1408:	e03e                	sd	a5,0(sp)
    140a:	22040a63          	beqz	s0,163e <printf+0x554>
            l = strnlen(a, 200);
    140e:	0c800593          	li	a1,200
    1412:	8522                	mv	a0,s0
    1414:	6cc000ef          	jal	ra,1ae0 <strnlen>
    write(f, s, l);
    1418:	0005061b          	sext.w	a2,a0
    141c:	85a2                	mv	a1,s0
    141e:	4505                	li	a0,1
    1420:	19f000ef          	jal	ra,1dbe <write>
        s += 2;
    1424:	00248513          	addi	a0,s1,2
    1428:	b311                	j	112c <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    142a:	6782                	ld	a5,0(sp)
    142c:	4390                	lw	a2,0(a5)
    142e:	07a1                	addi	a5,a5,8
    1430:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1432:	1a064363          	bltz	a2,15d8 <printf+0x4ee>
        buf[i--] = digits[x % base];
    1436:	46a9                	li	a3,10
    1438:	02d6773b          	remuw	a4,a2,a3
    143c:	00001797          	auipc	a5,0x1
    1440:	b8478793          	addi	a5,a5,-1148 # 1fc0 <digits>
    buf[16] = 0;
    1444:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1448:	4525                	li	a0,9
        x = xx;
    144a:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    144e:	973e                	add	a4,a4,a5
    1450:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    1454:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    1458:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    145c:	2cc55063          	bge	a0,a2,171c <printf+0x632>
    1460:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1464:	02d5f73b          	remuw	a4,a1,a3
    1468:	1702                	slli	a4,a4,0x20
    146a:	9301                	srli	a4,a4,0x20
    146c:	973e                	add	a4,a4,a5
    146e:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    1472:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    1476:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    147a:	1f057d63          	bgeu	a0,a6,1674 <printf+0x58a>
        buf[i--] = digits[x % base];
    147e:	4529                	li	a0,10
    } while ((x /= base) != 0);
    1480:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1482:	02a5f73b          	remuw	a4,a1,a0
    1486:	973e                	add	a4,a4,a5
    1488:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    148c:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    1490:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    1494:	1ab6f163          	bgeu	a3,a1,1636 <printf+0x54c>
    1498:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    149c:	02a776bb          	remuw	a3,a4,a0
    14a0:	96be                	add	a3,a3,a5
    14a2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14a6:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14aa:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    14ae:	20b87c63          	bgeu	a6,a1,16c6 <printf+0x5dc>
    14b2:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    14b6:	02a776bb          	remuw	a3,a4,a0
    14ba:	96be                	add	a3,a3,a5
    14bc:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14c0:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14c4:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    14c8:	20b87363          	bgeu	a6,a1,16ce <printf+0x5e4>
        buf[i--] = digits[x % base];
    14cc:	02a776bb          	remuw	a3,a4,a0
    14d0:	96be                	add	a3,a3,a5
    14d2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14d6:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14da:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    14de:	20b9f563          	bgeu	s3,a1,16e8 <printf+0x5fe>
        buf[i--] = digits[x % base];
    14e2:	02a776bb          	remuw	a3,a4,a0
    14e6:	96be                	add	a3,a3,a5
    14e8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14ec:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14f0:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    14f4:	20bafb63          	bgeu	s5,a1,170a <printf+0x620>
        buf[i--] = digits[x % base];
    14f8:	02a776bb          	remuw	a3,a4,a0
    14fc:	96be                	add	a3,a3,a5
    14fe:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1502:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1506:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    150a:	1eba7c63          	bgeu	s4,a1,1702 <printf+0x618>
        buf[i--] = digits[x % base];
    150e:	02a776bb          	remuw	a3,a4,a0
    1512:	96be                	add	a3,a3,a5
    1514:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1518:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    151c:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1520:	14bb7163          	bgeu	s6,a1,1662 <printf+0x578>
        buf[i--] = digits[x % base];
    1524:	1702                	slli	a4,a4,0x20
    1526:	9301                	srli	a4,a4,0x20
    1528:	97ba                	add	a5,a5,a4
    152a:	0007c783          	lbu	a5,0(a5)
    152e:	4599                	li	a1,6
    1530:	00f10723          	sb	a5,14(sp)
    if (sign)
    1534:	ea065de3          	bgez	a2,13ee <printf+0x304>
        buf[i--] = '-';
    1538:	02d00793          	li	a5,45
    153c:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1540:	4595                	li	a1,5
    write(f, s, l);
    1542:	003c                	addi	a5,sp,8
    1544:	4641                	li	a2,16
    1546:	9e0d                	subw	a2,a2,a1
    1548:	4505                	li	a0,1
    154a:	95be                	add	a1,a1,a5
    154c:	073000ef          	jal	ra,1dbe <write>
    1550:	b575                	j	13fc <printf+0x312>
    char byte = c;
    1552:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1556:	4605                	li	a2,1
    1558:	002c                	addi	a1,sp,8
    155a:	4505                	li	a0,1
    char byte = c;
    155c:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1560:	05f000ef          	jal	ra,1dbe <write>
    char byte = c;
    1564:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1568:	4605                	li	a2,1
    156a:	002c                	addi	a1,sp,8
    156c:	4505                	li	a0,1
    char byte = c;
    156e:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1572:	04d000ef          	jal	ra,1dbe <write>
        s += 2;
    1576:	00248513          	addi	a0,s1,2
    157a:	be4d                	j	112c <printf+0x42>
        x = -xx;
    157c:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    1580:	00001797          	auipc	a5,0x1
    1584:	a4078793          	addi	a5,a5,-1472 # 1fc0 <digits>
    1588:	00f77613          	andi	a2,a4,15
    158c:	963e                	add	a2,a2,a5
    158e:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    1592:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1596:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    1598:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    159c:	0047551b          	srliw	a0,a4,0x4
    15a0:	0047561b          	srliw	a2,a4,0x4
    15a4:	0ab6d263          	bge	a3,a1,1648 <printf+0x55e>
        buf[i--] = digits[x % base];
    15a8:	8a3d                	andi	a2,a2,15
    15aa:	963e                	add	a2,a2,a5
    15ac:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    15b0:	463d                	li	a2,15
    15b2:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    15b6:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    15ba:	daa661e3          	bltu	a2,a0,135c <printf+0x272>
        buf[i--] = '-';
    15be:	02d00793          	li	a5,45
    15c2:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    15c6:	45b5                	li	a1,13
    write(f, s, l);
    15c8:	003c                	addi	a5,sp,8
    15ca:	4641                	li	a2,16
    15cc:	9e0d                	subw	a2,a2,a1
    15ce:	4505                	li	a0,1
    15d0:	95be                	add	a1,a1,a5
    15d2:	7ec000ef          	jal	ra,1dbe <write>
    15d6:	b51d                	j	13fc <printf+0x312>
        x = -xx;
    15d8:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    15dc:	46a9                	li	a3,10
    15de:	02d875bb          	remuw	a1,a6,a3
    15e2:	00001797          	auipc	a5,0x1
    15e6:	9de78793          	addi	a5,a5,-1570 # 1fc0 <digits>
    buf[16] = 0;
    15ea:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    15ee:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    15f0:	95be                	add	a1,a1,a5
    15f2:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    15f6:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    15fa:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    15fe:	04a65563          	bge	a2,a0,1648 <printf+0x55e>
    1602:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1606:	02d775bb          	remuw	a1,a4,a3
    160a:	95be                	add	a1,a1,a5
    160c:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    1610:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    1614:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    1618:	fb0573e3          	bgeu	a0,a6,15be <printf+0x4d4>
        buf[i--] = digits[x % base];
    161c:	4529                	li	a0,10
    } while ((x /= base) != 0);
    161e:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1620:	02a5f73b          	remuw	a4,a1,a0
    1624:	973e                	add	a4,a4,a5
    1626:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    162a:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    162e:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    1632:	e6b6e3e3          	bltu	a3,a1,1498 <printf+0x3ae>
        buf[i--] = digits[x % base];
    1636:	45b5                	li	a1,13
    if (sign)
    1638:	da065be3          	bgez	a2,13ee <printf+0x304>
    163c:	a881                	j	168c <printf+0x5a2>
                a = "(null)";
    163e:	00001417          	auipc	s0,0x1
    1642:	96240413          	addi	s0,s0,-1694 # 1fa0 <unlink+0x3c>
    1646:	b3e1                	j	140e <printf+0x324>
        buf[i--] = '-';
    1648:	02d00793          	li	a5,45
    164c:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1650:	45b9                	li	a1,14
    write(f, s, l);
    1652:	003c                	addi	a5,sp,8
    1654:	4641                	li	a2,16
    1656:	9e0d                	subw	a2,a2,a1
    1658:	4505                	li	a0,1
    165a:	95be                	add	a1,a1,a5
    165c:	762000ef          	jal	ra,1dbe <write>
    1660:	bb71                	j	13fc <printf+0x312>
        buf[i--] = digits[x % base];
    1662:	459d                	li	a1,7
    if (sign)
    1664:	d80655e3          	bgez	a2,13ee <printf+0x304>
        buf[i--] = '-';
    1668:	02d00793          	li	a5,45
    166c:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1670:	4599                	li	a1,6
    1672:	bbb5                	j	13ee <printf+0x304>
    1674:	45b9                	li	a1,14
    write(f, s, l);
    1676:	003c                	addi	a5,sp,8
    1678:	4641                	li	a2,16
    167a:	9e0d                	subw	a2,a2,a1
    167c:	4505                	li	a0,1
    167e:	95be                	add	a1,a1,a5
    1680:	73e000ef          	jal	ra,1dbe <write>
    1684:	bba5                	j	13fc <printf+0x312>
        buf[i--] = digits[x % base];
    1686:	45b5                	li	a1,13
    if (sign)
    1688:	d606d3e3          	bgez	a3,13ee <printf+0x304>
        buf[i--] = '-';
    168c:	02d00793          	li	a5,45
    1690:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1694:	45b1                	li	a1,12
    write(f, s, l);
    1696:	003c                	addi	a5,sp,8
    1698:	4641                	li	a2,16
    169a:	9e0d                	subw	a2,a2,a1
    169c:	4505                	li	a0,1
    169e:	95be                	add	a1,a1,a5
    16a0:	71e000ef          	jal	ra,1dbe <write>
    16a4:	bba1                	j	13fc <printf+0x312>
        buf[i--] = digits[x % base];
    16a6:	45b1                	li	a1,12
    if (sign)
    16a8:	d406d3e3          	bgez	a3,13ee <printf+0x304>
        buf[i--] = '-';
    16ac:	02d00793          	li	a5,45
    16b0:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    16b4:	45ad                	li	a1,11
    write(f, s, l);
    16b6:	003c                	addi	a5,sp,8
    16b8:	4641                	li	a2,16
    16ba:	9e0d                	subw	a2,a2,a1
    16bc:	4505                	li	a0,1
    16be:	95be                	add	a1,a1,a5
    16c0:	6fe000ef          	jal	ra,1dbe <write>
    16c4:	bb25                	j	13fc <printf+0x312>
        buf[i--] = digits[x % base];
    16c6:	45b1                	li	a1,12
    if (sign)
    16c8:	d20653e3          	bgez	a2,13ee <printf+0x304>
    16cc:	b7c5                	j	16ac <printf+0x5c2>
        buf[i--] = digits[x % base];
    16ce:	45ad                	li	a1,11
    if (sign)
    16d0:	d0065fe3          	bgez	a2,13ee <printf+0x304>
        buf[i--] = '-';
    16d4:	02d00793          	li	a5,45
    16d8:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    16dc:	45a9                	li	a1,10
    16de:	bb01                	j	13ee <printf+0x304>
    16e0:	45ad                	li	a1,11
    if (sign)
    16e2:	d006d6e3          	bgez	a3,13ee <printf+0x304>
    16e6:	b7fd                	j	16d4 <printf+0x5ea>
        buf[i--] = digits[x % base];
    16e8:	45a9                	li	a1,10
    if (sign)
    16ea:	d00652e3          	bgez	a2,13ee <printf+0x304>
        buf[i--] = '-';
    16ee:	02d00793          	li	a5,45
    16f2:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    16f6:	45a5                	li	a1,9
    16f8:	b9dd                	j	13ee <printf+0x304>
    16fa:	45a9                	li	a1,10
    if (sign)
    16fc:	ce06d9e3          	bgez	a3,13ee <printf+0x304>
    1700:	b7fd                	j	16ee <printf+0x604>
        buf[i--] = digits[x % base];
    1702:	45a1                	li	a1,8
    if (sign)
    1704:	ce0655e3          	bgez	a2,13ee <printf+0x304>
    1708:	b9f1                	j	13e4 <printf+0x2fa>
        buf[i--] = digits[x % base];
    170a:	45a5                	li	a1,9
    if (sign)
    170c:	ce0651e3          	bgez	a2,13ee <printf+0x304>
        buf[i--] = '-';
    1710:	02d00793          	li	a5,45
    1714:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1718:	45a1                	li	a1,8
    171a:	b9d1                	j	13ee <printf+0x304>
    i = 15;
    171c:	45bd                	li	a1,15
    171e:	b9c1                	j	13ee <printf+0x304>
        buf[i--] = digits[x % base];
    1720:	45a5                	li	a1,9
    if (sign)
    1722:	cc06d6e3          	bgez	a3,13ee <printf+0x304>
    1726:	b7ed                	j	1710 <printf+0x626>

0000000000001728 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1728:	02000793          	li	a5,32
    172c:	00f50663          	beq	a0,a5,1738 <isspace+0x10>
    1730:	355d                	addiw	a0,a0,-9
    1732:	00553513          	sltiu	a0,a0,5
    1736:	8082                	ret
    1738:	4505                	li	a0,1
}
    173a:	8082                	ret

000000000000173c <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    173c:	fd05051b          	addiw	a0,a0,-48
}
    1740:	00a53513          	sltiu	a0,a0,10
    1744:	8082                	ret

0000000000001746 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1746:	02000613          	li	a2,32
    174a:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    174c:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1750:	ff77069b          	addiw	a3,a4,-9
    1754:	04c70d63          	beq	a4,a2,17ae <atoi+0x68>
    1758:	0007079b          	sext.w	a5,a4
    175c:	04d5f963          	bgeu	a1,a3,17ae <atoi+0x68>
        s++;
    switch (*s)
    1760:	02b00693          	li	a3,43
    1764:	04d70a63          	beq	a4,a3,17b8 <atoi+0x72>
    1768:	02d00693          	li	a3,45
    176c:	06d70463          	beq	a4,a3,17d4 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1770:	fd07859b          	addiw	a1,a5,-48
    1774:	4625                	li	a2,9
    1776:	873e                	mv	a4,a5
    1778:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    177a:	4e01                	li	t3,0
    while (isdigit(*s))
    177c:	04b66a63          	bltu	a2,a1,17d0 <atoi+0x8a>
    int n = 0, neg = 0;
    1780:	4501                	li	a0,0
    while (isdigit(*s))
    1782:	4825                	li	a6,9
    1784:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1788:	0025179b          	slliw	a5,a0,0x2
    178c:	9d3d                	addw	a0,a0,a5
    178e:	fd07031b          	addiw	t1,a4,-48
    1792:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1796:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    179a:	0685                	addi	a3,a3,1
    179c:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    17a0:	0006071b          	sext.w	a4,a2
    17a4:	feb870e3          	bgeu	a6,a1,1784 <atoi+0x3e>
    return neg ? n : -n;
    17a8:	000e0563          	beqz	t3,17b2 <atoi+0x6c>
}
    17ac:	8082                	ret
        s++;
    17ae:	0505                	addi	a0,a0,1
    17b0:	bf71                	j	174c <atoi+0x6>
    17b2:	4113053b          	subw	a0,t1,a7
    17b6:	8082                	ret
    while (isdigit(*s))
    17b8:	00154783          	lbu	a5,1(a0)
    17bc:	4625                	li	a2,9
        s++;
    17be:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17c2:	fd07859b          	addiw	a1,a5,-48
    17c6:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    17ca:	4e01                	li	t3,0
    while (isdigit(*s))
    17cc:	fab67ae3          	bgeu	a2,a1,1780 <atoi+0x3a>
    17d0:	4501                	li	a0,0
}
    17d2:	8082                	ret
    while (isdigit(*s))
    17d4:	00154783          	lbu	a5,1(a0)
    17d8:	4625                	li	a2,9
        s++;
    17da:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17de:	fd07859b          	addiw	a1,a5,-48
    17e2:	0007871b          	sext.w	a4,a5
    17e6:	feb665e3          	bltu	a2,a1,17d0 <atoi+0x8a>
        neg = 1;
    17ea:	4e05                	li	t3,1
    17ec:	bf51                	j	1780 <atoi+0x3a>

00000000000017ee <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ee:	16060d63          	beqz	a2,1968 <memset+0x17a>
    17f2:	40a007b3          	neg	a5,a0
    17f6:	8b9d                	andi	a5,a5,7
    17f8:	00778713          	addi	a4,a5,7
    17fc:	482d                	li	a6,11
    17fe:	0ff5f593          	andi	a1,a1,255
    1802:	fff60693          	addi	a3,a2,-1
    1806:	17076263          	bltu	a4,a6,196a <memset+0x17c>
    180a:	16e6ea63          	bltu	a3,a4,197e <memset+0x190>
    180e:	16078563          	beqz	a5,1978 <memset+0x18a>
    1812:	00b50023          	sb	a1,0(a0)
    1816:	4705                	li	a4,1
    1818:	00150e93          	addi	t4,a0,1
    181c:	14e78c63          	beq	a5,a4,1974 <memset+0x186>
    1820:	00b500a3          	sb	a1,1(a0)
    1824:	4709                	li	a4,2
    1826:	00250e93          	addi	t4,a0,2
    182a:	14e78d63          	beq	a5,a4,1984 <memset+0x196>
    182e:	00b50123          	sb	a1,2(a0)
    1832:	470d                	li	a4,3
    1834:	00350e93          	addi	t4,a0,3
    1838:	12e78b63          	beq	a5,a4,196e <memset+0x180>
    183c:	00b501a3          	sb	a1,3(a0)
    1840:	4711                	li	a4,4
    1842:	00450e93          	addi	t4,a0,4
    1846:	14e78163          	beq	a5,a4,1988 <memset+0x19a>
    184a:	00b50223          	sb	a1,4(a0)
    184e:	4715                	li	a4,5
    1850:	00550e93          	addi	t4,a0,5
    1854:	12e78c63          	beq	a5,a4,198c <memset+0x19e>
    1858:	00b502a3          	sb	a1,5(a0)
    185c:	471d                	li	a4,7
    185e:	00650e93          	addi	t4,a0,6
    1862:	12e79763          	bne	a5,a4,1990 <memset+0x1a2>
    1866:	00750e93          	addi	t4,a0,7
    186a:	00b50323          	sb	a1,6(a0)
    186e:	4f1d                	li	t5,7
    1870:	00859713          	slli	a4,a1,0x8
    1874:	8f4d                	or	a4,a4,a1
    1876:	01059e13          	slli	t3,a1,0x10
    187a:	01c76e33          	or	t3,a4,t3
    187e:	01859313          	slli	t1,a1,0x18
    1882:	006e6333          	or	t1,t3,t1
    1886:	02059893          	slli	a7,a1,0x20
    188a:	011368b3          	or	a7,t1,a7
    188e:	02859813          	slli	a6,a1,0x28
    1892:	40f60333          	sub	t1,a2,a5
    1896:	0108e833          	or	a6,a7,a6
    189a:	03059693          	slli	a3,a1,0x30
    189e:	00d866b3          	or	a3,a6,a3
    18a2:	03859713          	slli	a4,a1,0x38
    18a6:	97aa                	add	a5,a5,a0
    18a8:	ff837813          	andi	a6,t1,-8
    18ac:	8f55                	or	a4,a4,a3
    18ae:	00f806b3          	add	a3,a6,a5
    18b2:	e398                	sd	a4,0(a5)
    18b4:	07a1                	addi	a5,a5,8
    18b6:	fed79ee3          	bne	a5,a3,18b2 <memset+0xc4>
    18ba:	ff837693          	andi	a3,t1,-8
    18be:	00de87b3          	add	a5,t4,a3
    18c2:	01e6873b          	addw	a4,a3,t5
    18c6:	0ad30663          	beq	t1,a3,1972 <memset+0x184>
    18ca:	00b78023          	sb	a1,0(a5)
    18ce:	0017069b          	addiw	a3,a4,1
    18d2:	08c6fb63          	bgeu	a3,a2,1968 <memset+0x17a>
    18d6:	00b780a3          	sb	a1,1(a5)
    18da:	0027069b          	addiw	a3,a4,2
    18de:	08c6f563          	bgeu	a3,a2,1968 <memset+0x17a>
    18e2:	00b78123          	sb	a1,2(a5)
    18e6:	0037069b          	addiw	a3,a4,3
    18ea:	06c6ff63          	bgeu	a3,a2,1968 <memset+0x17a>
    18ee:	00b781a3          	sb	a1,3(a5)
    18f2:	0047069b          	addiw	a3,a4,4
    18f6:	06c6f963          	bgeu	a3,a2,1968 <memset+0x17a>
    18fa:	00b78223          	sb	a1,4(a5)
    18fe:	0057069b          	addiw	a3,a4,5
    1902:	06c6f363          	bgeu	a3,a2,1968 <memset+0x17a>
    1906:	00b782a3          	sb	a1,5(a5)
    190a:	0067069b          	addiw	a3,a4,6
    190e:	04c6fd63          	bgeu	a3,a2,1968 <memset+0x17a>
    1912:	00b78323          	sb	a1,6(a5)
    1916:	0077069b          	addiw	a3,a4,7
    191a:	04c6f763          	bgeu	a3,a2,1968 <memset+0x17a>
    191e:	00b783a3          	sb	a1,7(a5)
    1922:	0087069b          	addiw	a3,a4,8
    1926:	04c6f163          	bgeu	a3,a2,1968 <memset+0x17a>
    192a:	00b78423          	sb	a1,8(a5)
    192e:	0097069b          	addiw	a3,a4,9
    1932:	02c6fb63          	bgeu	a3,a2,1968 <memset+0x17a>
    1936:	00b784a3          	sb	a1,9(a5)
    193a:	00a7069b          	addiw	a3,a4,10
    193e:	02c6f563          	bgeu	a3,a2,1968 <memset+0x17a>
    1942:	00b78523          	sb	a1,10(a5)
    1946:	00b7069b          	addiw	a3,a4,11
    194a:	00c6ff63          	bgeu	a3,a2,1968 <memset+0x17a>
    194e:	00b785a3          	sb	a1,11(a5)
    1952:	00c7069b          	addiw	a3,a4,12
    1956:	00c6f963          	bgeu	a3,a2,1968 <memset+0x17a>
    195a:	00b78623          	sb	a1,12(a5)
    195e:	2735                	addiw	a4,a4,13
    1960:	00c77463          	bgeu	a4,a2,1968 <memset+0x17a>
    1964:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1968:	8082                	ret
    196a:	472d                	li	a4,11
    196c:	bd79                	j	180a <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    196e:	4f0d                	li	t5,3
    1970:	b701                	j	1870 <memset+0x82>
    1972:	8082                	ret
    1974:	4f05                	li	t5,1
    1976:	bded                	j	1870 <memset+0x82>
    1978:	8eaa                	mv	t4,a0
    197a:	4f01                	li	t5,0
    197c:	bdd5                	j	1870 <memset+0x82>
    197e:	87aa                	mv	a5,a0
    1980:	4701                	li	a4,0
    1982:	b7a1                	j	18ca <memset+0xdc>
    1984:	4f09                	li	t5,2
    1986:	b5ed                	j	1870 <memset+0x82>
    1988:	4f11                	li	t5,4
    198a:	b5dd                	j	1870 <memset+0x82>
    198c:	4f15                	li	t5,5
    198e:	b5cd                	j	1870 <memset+0x82>
    1990:	4f19                	li	t5,6
    1992:	bdf9                	j	1870 <memset+0x82>

0000000000001994 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1994:	00054783          	lbu	a5,0(a0)
    1998:	0005c703          	lbu	a4,0(a1)
    199c:	00e79863          	bne	a5,a4,19ac <strcmp+0x18>
    19a0:	0505                	addi	a0,a0,1
    19a2:	0585                	addi	a1,a1,1
    19a4:	fbe5                	bnez	a5,1994 <strcmp>
    19a6:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    19a8:	9d19                	subw	a0,a0,a4
    19aa:	8082                	ret
    19ac:	0007851b          	sext.w	a0,a5
    19b0:	bfe5                	j	19a8 <strcmp+0x14>

00000000000019b2 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    19b2:	ce05                	beqz	a2,19ea <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19b4:	00054703          	lbu	a4,0(a0)
    19b8:	0005c783          	lbu	a5,0(a1)
    19bc:	cb0d                	beqz	a4,19ee <strncmp+0x3c>
    if (!n--)
    19be:	167d                	addi	a2,a2,-1
    19c0:	00c506b3          	add	a3,a0,a2
    19c4:	a819                	j	19da <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19c6:	00a68e63          	beq	a3,a0,19e2 <strncmp+0x30>
    19ca:	0505                	addi	a0,a0,1
    19cc:	00e79b63          	bne	a5,a4,19e2 <strncmp+0x30>
    19d0:	00054703          	lbu	a4,0(a0)
    19d4:	0005c783          	lbu	a5,0(a1)
    19d8:	cb19                	beqz	a4,19ee <strncmp+0x3c>
    19da:	0005c783          	lbu	a5,0(a1)
    19de:	0585                	addi	a1,a1,1
    19e0:	f3fd                	bnez	a5,19c6 <strncmp+0x14>
        ;
    return *l - *r;
    19e2:	0007051b          	sext.w	a0,a4
    19e6:	9d1d                	subw	a0,a0,a5
    19e8:	8082                	ret
        return 0;
    19ea:	4501                	li	a0,0
}
    19ec:	8082                	ret
    19ee:	4501                	li	a0,0
    return *l - *r;
    19f0:	9d1d                	subw	a0,a0,a5
    19f2:	8082                	ret

00000000000019f4 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    19f4:	00757793          	andi	a5,a0,7
    19f8:	cf89                	beqz	a5,1a12 <strlen+0x1e>
    19fa:	87aa                	mv	a5,a0
    19fc:	a029                	j	1a06 <strlen+0x12>
    19fe:	0785                	addi	a5,a5,1
    1a00:	0077f713          	andi	a4,a5,7
    1a04:	cb01                	beqz	a4,1a14 <strlen+0x20>
        if (!*s)
    1a06:	0007c703          	lbu	a4,0(a5)
    1a0a:	fb75                	bnez	a4,19fe <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1a0c:	40a78533          	sub	a0,a5,a0
}
    1a10:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1a12:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1a14:	6394                	ld	a3,0(a5)
    1a16:	00000597          	auipc	a1,0x0
    1a1a:	5925b583          	ld	a1,1426(a1) # 1fa8 <unlink+0x44>
    1a1e:	00000617          	auipc	a2,0x0
    1a22:	59263603          	ld	a2,1426(a2) # 1fb0 <unlink+0x4c>
    1a26:	a019                	j	1a2c <strlen+0x38>
    1a28:	6794                	ld	a3,8(a5)
    1a2a:	07a1                	addi	a5,a5,8
    1a2c:	00b68733          	add	a4,a3,a1
    1a30:	fff6c693          	not	a3,a3
    1a34:	8f75                	and	a4,a4,a3
    1a36:	8f71                	and	a4,a4,a2
    1a38:	db65                	beqz	a4,1a28 <strlen+0x34>
    for (; *s; s++)
    1a3a:	0007c703          	lbu	a4,0(a5)
    1a3e:	d779                	beqz	a4,1a0c <strlen+0x18>
    1a40:	0017c703          	lbu	a4,1(a5)
    1a44:	0785                	addi	a5,a5,1
    1a46:	d379                	beqz	a4,1a0c <strlen+0x18>
    1a48:	0017c703          	lbu	a4,1(a5)
    1a4c:	0785                	addi	a5,a5,1
    1a4e:	fb6d                	bnez	a4,1a40 <strlen+0x4c>
    1a50:	bf75                	j	1a0c <strlen+0x18>

0000000000001a52 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a52:	00757713          	andi	a4,a0,7
{
    1a56:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1a58:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a5c:	cb19                	beqz	a4,1a72 <memchr+0x20>
    1a5e:	ce25                	beqz	a2,1ad6 <memchr+0x84>
    1a60:	0007c703          	lbu	a4,0(a5)
    1a64:	04b70e63          	beq	a4,a1,1ac0 <memchr+0x6e>
    1a68:	0785                	addi	a5,a5,1
    1a6a:	0077f713          	andi	a4,a5,7
    1a6e:	167d                	addi	a2,a2,-1
    1a70:	f77d                	bnez	a4,1a5e <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1a72:	4501                	li	a0,0
    if (n && *s != c)
    1a74:	c235                	beqz	a2,1ad8 <memchr+0x86>
    1a76:	0007c703          	lbu	a4,0(a5)
    1a7a:	04b70363          	beq	a4,a1,1ac0 <memchr+0x6e>
        size_t k = ONES * c;
    1a7e:	00000517          	auipc	a0,0x0
    1a82:	53a53503          	ld	a0,1338(a0) # 1fb8 <unlink+0x54>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a86:	471d                	li	a4,7
        size_t k = ONES * c;
    1a88:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a8c:	02c77a63          	bgeu	a4,a2,1ac0 <memchr+0x6e>
    1a90:	00000897          	auipc	a7,0x0
    1a94:	5188b883          	ld	a7,1304(a7) # 1fa8 <unlink+0x44>
    1a98:	00000817          	auipc	a6,0x0
    1a9c:	51883803          	ld	a6,1304(a6) # 1fb0 <unlink+0x4c>
    1aa0:	431d                	li	t1,7
    1aa2:	a029                	j	1aac <memchr+0x5a>
    1aa4:	1661                	addi	a2,a2,-8
    1aa6:	07a1                	addi	a5,a5,8
    1aa8:	02c37963          	bgeu	t1,a2,1ada <memchr+0x88>
    1aac:	6398                	ld	a4,0(a5)
    1aae:	8f29                	xor	a4,a4,a0
    1ab0:	011706b3          	add	a3,a4,a7
    1ab4:	fff74713          	not	a4,a4
    1ab8:	8f75                	and	a4,a4,a3
    1aba:	01077733          	and	a4,a4,a6
    1abe:	d37d                	beqz	a4,1aa4 <memchr+0x52>
    1ac0:	853e                	mv	a0,a5
    1ac2:	97b2                	add	a5,a5,a2
    1ac4:	a021                	j	1acc <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1ac6:	0505                	addi	a0,a0,1
    1ac8:	00f50763          	beq	a0,a5,1ad6 <memchr+0x84>
    1acc:	00054703          	lbu	a4,0(a0)
    1ad0:	feb71be3          	bne	a4,a1,1ac6 <memchr+0x74>
    1ad4:	8082                	ret
    return n ? (void *)s : 0;
    1ad6:	4501                	li	a0,0
}
    1ad8:	8082                	ret
    return n ? (void *)s : 0;
    1ada:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1adc:	f275                	bnez	a2,1ac0 <memchr+0x6e>
}
    1ade:	8082                	ret

0000000000001ae0 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1ae0:	1101                	addi	sp,sp,-32
    1ae2:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1ae4:	862e                	mv	a2,a1
{
    1ae6:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1ae8:	4581                	li	a1,0
{
    1aea:	e426                	sd	s1,8(sp)
    1aec:	ec06                	sd	ra,24(sp)
    1aee:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1af0:	f63ff0ef          	jal	ra,1a52 <memchr>
    return p ? p - s : n;
    1af4:	c519                	beqz	a0,1b02 <strnlen+0x22>
}
    1af6:	60e2                	ld	ra,24(sp)
    1af8:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1afa:	8d05                	sub	a0,a0,s1
}
    1afc:	64a2                	ld	s1,8(sp)
    1afe:	6105                	addi	sp,sp,32
    1b00:	8082                	ret
    1b02:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1b04:	8522                	mv	a0,s0
}
    1b06:	6442                	ld	s0,16(sp)
    1b08:	64a2                	ld	s1,8(sp)
    1b0a:	6105                	addi	sp,sp,32
    1b0c:	8082                	ret

0000000000001b0e <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1b0e:	00b547b3          	xor	a5,a0,a1
    1b12:	8b9d                	andi	a5,a5,7
    1b14:	eb95                	bnez	a5,1b48 <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1b16:	0075f793          	andi	a5,a1,7
    1b1a:	e7b1                	bnez	a5,1b66 <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1b1c:	6198                	ld	a4,0(a1)
    1b1e:	00000617          	auipc	a2,0x0
    1b22:	48a63603          	ld	a2,1162(a2) # 1fa8 <unlink+0x44>
    1b26:	00000817          	auipc	a6,0x0
    1b2a:	48a83803          	ld	a6,1162(a6) # 1fb0 <unlink+0x4c>
    1b2e:	a029                	j	1b38 <stpcpy+0x2a>
    1b30:	e118                	sd	a4,0(a0)
    1b32:	6598                	ld	a4,8(a1)
    1b34:	05a1                	addi	a1,a1,8
    1b36:	0521                	addi	a0,a0,8
    1b38:	00c707b3          	add	a5,a4,a2
    1b3c:	fff74693          	not	a3,a4
    1b40:	8ff5                	and	a5,a5,a3
    1b42:	0107f7b3          	and	a5,a5,a6
    1b46:	d7ed                	beqz	a5,1b30 <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b48:	0005c783          	lbu	a5,0(a1)
    1b4c:	00f50023          	sb	a5,0(a0)
    1b50:	c785                	beqz	a5,1b78 <stpcpy+0x6a>
    1b52:	0015c783          	lbu	a5,1(a1)
    1b56:	0505                	addi	a0,a0,1
    1b58:	0585                	addi	a1,a1,1
    1b5a:	00f50023          	sb	a5,0(a0)
    1b5e:	fbf5                	bnez	a5,1b52 <stpcpy+0x44>
        ;
    return d;
}
    1b60:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1b62:	0505                	addi	a0,a0,1
    1b64:	df45                	beqz	a4,1b1c <stpcpy+0xe>
            if (!(*d = *s))
    1b66:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1b6a:	0585                	addi	a1,a1,1
    1b6c:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1b70:	00f50023          	sb	a5,0(a0)
    1b74:	f7fd                	bnez	a5,1b62 <stpcpy+0x54>
}
    1b76:	8082                	ret
    1b78:	8082                	ret

0000000000001b7a <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b7a:	00b547b3          	xor	a5,a0,a1
    1b7e:	8b9d                	andi	a5,a5,7
    1b80:	1a079863          	bnez	a5,1d30 <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b84:	0075f793          	andi	a5,a1,7
    1b88:	16078463          	beqz	a5,1cf0 <stpncpy+0x176>
    1b8c:	ea01                	bnez	a2,1b9c <stpncpy+0x22>
    1b8e:	a421                	j	1d96 <stpncpy+0x21c>
    1b90:	167d                	addi	a2,a2,-1
    1b92:	0505                	addi	a0,a0,1
    1b94:	14070e63          	beqz	a4,1cf0 <stpncpy+0x176>
    1b98:	1a060863          	beqz	a2,1d48 <stpncpy+0x1ce>
    1b9c:	0005c783          	lbu	a5,0(a1)
    1ba0:	0585                	addi	a1,a1,1
    1ba2:	0075f713          	andi	a4,a1,7
    1ba6:	00f50023          	sb	a5,0(a0)
    1baa:	f3fd                	bnez	a5,1b90 <stpncpy+0x16>
    1bac:	4805                	li	a6,1
    1bae:	1a061863          	bnez	a2,1d5e <stpncpy+0x1e4>
    1bb2:	40a007b3          	neg	a5,a0
    1bb6:	8b9d                	andi	a5,a5,7
    1bb8:	4681                	li	a3,0
    1bba:	18061a63          	bnez	a2,1d4e <stpncpy+0x1d4>
    1bbe:	00778713          	addi	a4,a5,7
    1bc2:	45ad                	li	a1,11
    1bc4:	18b76363          	bltu	a4,a1,1d4a <stpncpy+0x1d0>
    1bc8:	1ae6eb63          	bltu	a3,a4,1d7e <stpncpy+0x204>
    1bcc:	1a078363          	beqz	a5,1d72 <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bd0:	00050023          	sb	zero,0(a0)
    1bd4:	4685                	li	a3,1
    1bd6:	00150713          	addi	a4,a0,1
    1bda:	18d78f63          	beq	a5,a3,1d78 <stpncpy+0x1fe>
    1bde:	000500a3          	sb	zero,1(a0)
    1be2:	4689                	li	a3,2
    1be4:	00250713          	addi	a4,a0,2
    1be8:	18d78e63          	beq	a5,a3,1d84 <stpncpy+0x20a>
    1bec:	00050123          	sb	zero,2(a0)
    1bf0:	468d                	li	a3,3
    1bf2:	00350713          	addi	a4,a0,3
    1bf6:	16d78c63          	beq	a5,a3,1d6e <stpncpy+0x1f4>
    1bfa:	000501a3          	sb	zero,3(a0)
    1bfe:	4691                	li	a3,4
    1c00:	00450713          	addi	a4,a0,4
    1c04:	18d78263          	beq	a5,a3,1d88 <stpncpy+0x20e>
    1c08:	00050223          	sb	zero,4(a0)
    1c0c:	4695                	li	a3,5
    1c0e:	00550713          	addi	a4,a0,5
    1c12:	16d78d63          	beq	a5,a3,1d8c <stpncpy+0x212>
    1c16:	000502a3          	sb	zero,5(a0)
    1c1a:	469d                	li	a3,7
    1c1c:	00650713          	addi	a4,a0,6
    1c20:	16d79863          	bne	a5,a3,1d90 <stpncpy+0x216>
    1c24:	00750713          	addi	a4,a0,7
    1c28:	00050323          	sb	zero,6(a0)
    1c2c:	40f80833          	sub	a6,a6,a5
    1c30:	ff887593          	andi	a1,a6,-8
    1c34:	97aa                	add	a5,a5,a0
    1c36:	95be                	add	a1,a1,a5
    1c38:	0007b023          	sd	zero,0(a5)
    1c3c:	07a1                	addi	a5,a5,8
    1c3e:	feb79de3          	bne	a5,a1,1c38 <stpncpy+0xbe>
    1c42:	ff887593          	andi	a1,a6,-8
    1c46:	9ead                	addw	a3,a3,a1
    1c48:	00b707b3          	add	a5,a4,a1
    1c4c:	12b80863          	beq	a6,a1,1d7c <stpncpy+0x202>
    1c50:	00078023          	sb	zero,0(a5)
    1c54:	0016871b          	addiw	a4,a3,1
    1c58:	0ec77863          	bgeu	a4,a2,1d48 <stpncpy+0x1ce>
    1c5c:	000780a3          	sb	zero,1(a5)
    1c60:	0026871b          	addiw	a4,a3,2
    1c64:	0ec77263          	bgeu	a4,a2,1d48 <stpncpy+0x1ce>
    1c68:	00078123          	sb	zero,2(a5)
    1c6c:	0036871b          	addiw	a4,a3,3
    1c70:	0cc77c63          	bgeu	a4,a2,1d48 <stpncpy+0x1ce>
    1c74:	000781a3          	sb	zero,3(a5)
    1c78:	0046871b          	addiw	a4,a3,4
    1c7c:	0cc77663          	bgeu	a4,a2,1d48 <stpncpy+0x1ce>
    1c80:	00078223          	sb	zero,4(a5)
    1c84:	0056871b          	addiw	a4,a3,5
    1c88:	0cc77063          	bgeu	a4,a2,1d48 <stpncpy+0x1ce>
    1c8c:	000782a3          	sb	zero,5(a5)
    1c90:	0066871b          	addiw	a4,a3,6
    1c94:	0ac77a63          	bgeu	a4,a2,1d48 <stpncpy+0x1ce>
    1c98:	00078323          	sb	zero,6(a5)
    1c9c:	0076871b          	addiw	a4,a3,7
    1ca0:	0ac77463          	bgeu	a4,a2,1d48 <stpncpy+0x1ce>
    1ca4:	000783a3          	sb	zero,7(a5)
    1ca8:	0086871b          	addiw	a4,a3,8
    1cac:	08c77e63          	bgeu	a4,a2,1d48 <stpncpy+0x1ce>
    1cb0:	00078423          	sb	zero,8(a5)
    1cb4:	0096871b          	addiw	a4,a3,9
    1cb8:	08c77863          	bgeu	a4,a2,1d48 <stpncpy+0x1ce>
    1cbc:	000784a3          	sb	zero,9(a5)
    1cc0:	00a6871b          	addiw	a4,a3,10
    1cc4:	08c77263          	bgeu	a4,a2,1d48 <stpncpy+0x1ce>
    1cc8:	00078523          	sb	zero,10(a5)
    1ccc:	00b6871b          	addiw	a4,a3,11
    1cd0:	06c77c63          	bgeu	a4,a2,1d48 <stpncpy+0x1ce>
    1cd4:	000785a3          	sb	zero,11(a5)
    1cd8:	00c6871b          	addiw	a4,a3,12
    1cdc:	06c77663          	bgeu	a4,a2,1d48 <stpncpy+0x1ce>
    1ce0:	00078623          	sb	zero,12(a5)
    1ce4:	26b5                	addiw	a3,a3,13
    1ce6:	06c6f163          	bgeu	a3,a2,1d48 <stpncpy+0x1ce>
    1cea:	000786a3          	sb	zero,13(a5)
    1cee:	8082                	ret
            ;
        if (!n || !*s)
    1cf0:	c645                	beqz	a2,1d98 <stpncpy+0x21e>
    1cf2:	0005c783          	lbu	a5,0(a1)
    1cf6:	ea078be3          	beqz	a5,1bac <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1cfa:	479d                	li	a5,7
    1cfc:	02c7ff63          	bgeu	a5,a2,1d3a <stpncpy+0x1c0>
    1d00:	00000897          	auipc	a7,0x0
    1d04:	2a88b883          	ld	a7,680(a7) # 1fa8 <unlink+0x44>
    1d08:	00000817          	auipc	a6,0x0
    1d0c:	2a883803          	ld	a6,680(a6) # 1fb0 <unlink+0x4c>
    1d10:	431d                	li	t1,7
    1d12:	6198                	ld	a4,0(a1)
    1d14:	011707b3          	add	a5,a4,a7
    1d18:	fff74693          	not	a3,a4
    1d1c:	8ff5                	and	a5,a5,a3
    1d1e:	0107f7b3          	and	a5,a5,a6
    1d22:	ef81                	bnez	a5,1d3a <stpncpy+0x1c0>
            *wd = *ws;
    1d24:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d26:	1661                	addi	a2,a2,-8
    1d28:	05a1                	addi	a1,a1,8
    1d2a:	0521                	addi	a0,a0,8
    1d2c:	fec363e3          	bltu	t1,a2,1d12 <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1d30:	e609                	bnez	a2,1d3a <stpncpy+0x1c0>
    1d32:	a08d                	j	1d94 <stpncpy+0x21a>
    1d34:	167d                	addi	a2,a2,-1
    1d36:	0505                	addi	a0,a0,1
    1d38:	ca01                	beqz	a2,1d48 <stpncpy+0x1ce>
    1d3a:	0005c783          	lbu	a5,0(a1)
    1d3e:	0585                	addi	a1,a1,1
    1d40:	00f50023          	sb	a5,0(a0)
    1d44:	fbe5                	bnez	a5,1d34 <stpncpy+0x1ba>
        ;
tail:
    1d46:	b59d                	j	1bac <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1d48:	8082                	ret
    1d4a:	472d                	li	a4,11
    1d4c:	bdb5                	j	1bc8 <stpncpy+0x4e>
    1d4e:	00778713          	addi	a4,a5,7
    1d52:	45ad                	li	a1,11
    1d54:	fff60693          	addi	a3,a2,-1
    1d58:	e6b778e3          	bgeu	a4,a1,1bc8 <stpncpy+0x4e>
    1d5c:	b7fd                	j	1d4a <stpncpy+0x1d0>
    1d5e:	40a007b3          	neg	a5,a0
    1d62:	8832                	mv	a6,a2
    1d64:	8b9d                	andi	a5,a5,7
    1d66:	4681                	li	a3,0
    1d68:	e4060be3          	beqz	a2,1bbe <stpncpy+0x44>
    1d6c:	b7cd                	j	1d4e <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d6e:	468d                	li	a3,3
    1d70:	bd75                	j	1c2c <stpncpy+0xb2>
    1d72:	872a                	mv	a4,a0
    1d74:	4681                	li	a3,0
    1d76:	bd5d                	j	1c2c <stpncpy+0xb2>
    1d78:	4685                	li	a3,1
    1d7a:	bd4d                	j	1c2c <stpncpy+0xb2>
    1d7c:	8082                	ret
    1d7e:	87aa                	mv	a5,a0
    1d80:	4681                	li	a3,0
    1d82:	b5f9                	j	1c50 <stpncpy+0xd6>
    1d84:	4689                	li	a3,2
    1d86:	b55d                	j	1c2c <stpncpy+0xb2>
    1d88:	4691                	li	a3,4
    1d8a:	b54d                	j	1c2c <stpncpy+0xb2>
    1d8c:	4695                	li	a3,5
    1d8e:	bd79                	j	1c2c <stpncpy+0xb2>
    1d90:	4699                	li	a3,6
    1d92:	bd69                	j	1c2c <stpncpy+0xb2>
    1d94:	8082                	ret
    1d96:	8082                	ret
    1d98:	8082                	ret

0000000000001d9a <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1d9a:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1d9e:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da0:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1da4:	2501                	sext.w	a0,a0
    1da6:	8082                	ret

0000000000001da8 <close>:
    register long a7 __asm__("a7") = n;
    1da8:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1dac:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1db0:	2501                	sext.w	a0,a0
    1db2:	8082                	ret

0000000000001db4 <read>:
    register long a7 __asm__("a7") = n;
    1db4:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db8:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1dbc:	8082                	ret

0000000000001dbe <write>:
    register long a7 __asm__("a7") = n;
    1dbe:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dc2:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1dc6:	8082                	ret

0000000000001dc8 <getpid>:
    register long a7 __asm__("a7") = n;
    1dc8:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1dcc:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1dd4:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1dd8:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1ddc:	2501                	sext.w	a0,a0
    1dde:	8082                	ret

0000000000001de0 <fork>:
    register long a7 __asm__("a7") = n;
    1de0:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1de4:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1de8:	2501                	sext.w	a0,a0
    1dea:	8082                	ret

0000000000001dec <exit>:
    register long a7 __asm__("a7") = n;
    1dec:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1df0:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1df4:	8082                	ret

0000000000001df6 <waitpid>:
    register long a7 __asm__("a7") = n;
    1df6:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dfa:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1dfe:	2501                	sext.w	a0,a0
    1e00:	8082                	ret

0000000000001e02 <exec>:
    register long a7 __asm__("a7") = n;
    1e02:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e06:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e0a:	2501                	sext.w	a0,a0
    1e0c:	8082                	ret

0000000000001e0e <get_time>:

int64 get_time()
{
    1e0e:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e10:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e14:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e16:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e18:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	ed09                	bnez	a0,1e38 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e20:	67a2                	ld	a5,8(sp)
    1e22:	3e800713          	li	a4,1000
    1e26:	00015503          	lhu	a0,0(sp)
    1e2a:	02e7d7b3          	divu	a5,a5,a4
    1e2e:	02e50533          	mul	a0,a0,a4
    1e32:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e34:	0141                	addi	sp,sp,16
    1e36:	8082                	ret
        return -1;
    1e38:	557d                	li	a0,-1
    1e3a:	bfed                	j	1e34 <get_time+0x26>

0000000000001e3c <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e3c:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e40:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e44:	2501                	sext.w	a0,a0
    1e46:	8082                	ret

0000000000001e48 <sleep>:

int sleep(unsigned long long time)
{
    1e48:	1141                	addi	sp,sp,-16
    1e4a:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1e4c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e50:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e52:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e54:	00000073          	ecall
    if (err == 0)
    1e58:	2501                	sext.w	a0,a0
    1e5a:	e13d                	bnez	a0,1ec0 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e5c:	6722                	ld	a4,8(sp)
    1e5e:	3e800693          	li	a3,1000
    1e62:	00015783          	lhu	a5,0(sp)
    1e66:	02d75733          	divu	a4,a4,a3
    1e6a:	02d787b3          	mul	a5,a5,a3
    1e6e:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1e70:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e74:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e76:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e78:	00000073          	ecall
    if (err == 0)
    1e7c:	2501                	sext.w	a0,a0
    1e7e:	ed15                	bnez	a0,1eba <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e80:	6841                	lui	a6,0x10
    1e82:	963e                	add	a2,a2,a5
    1e84:	187d                	addi	a6,a6,-1
    1e86:	3e800693          	li	a3,1000
    1e8a:	a819                	j	1ea0 <sleep+0x58>
    __asm_syscall("r"(a7))
    1e8c:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1e90:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e94:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e96:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e98:	00000073          	ecall
    if (err == 0)
    1e9c:	2501                	sext.w	a0,a0
    1e9e:	ed11                	bnez	a0,1eba <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ea0:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1ea2:	07c00893          	li	a7,124
    1ea6:	02d7d733          	divu	a4,a5,a3
    1eaa:	6782                	ld	a5,0(sp)
    1eac:	0107f7b3          	and	a5,a5,a6
    1eb0:	02d787b3          	mul	a5,a5,a3
    1eb4:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1eb6:	fcc7ebe3          	bltu	a5,a2,1e8c <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1eba:	4501                	li	a0,0
    1ebc:	0141                	addi	sp,sp,16
    1ebe:	8082                	ret
    1ec0:	57fd                	li	a5,-1
    1ec2:	b77d                	j	1e70 <sleep+0x28>

0000000000001ec4 <set_priority>:
    register long a7 __asm__("a7") = n;
    1ec4:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1ec8:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1ecc:	2501                	sext.w	a0,a0
    1ece:	8082                	ret

0000000000001ed0 <mmap>:
    register long a7 __asm__("a7") = n;
    1ed0:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ed4:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1ed8:	2501                	sext.w	a0,a0
    1eda:	8082                	ret

0000000000001edc <munmap>:
    register long a7 __asm__("a7") = n;
    1edc:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ee0:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1ee4:	2501                	sext.w	a0,a0
    1ee6:	8082                	ret

0000000000001ee8 <wait>:

int wait(int *code)
{
    1ee8:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1eea:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1eee:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef0:	00000073          	ecall
    return waitpid(-1, code);
}
    1ef4:	2501                	sext.w	a0,a0
    1ef6:	8082                	ret

0000000000001ef8 <spawn>:
    register long a7 __asm__("a7") = n;
    1ef8:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1efc:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f00:	2501                	sext.w	a0,a0
    1f02:	8082                	ret

0000000000001f04 <mailread>:
    register long a7 __asm__("a7") = n;
    1f04:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f08:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f0c:	2501                	sext.w	a0,a0
    1f0e:	8082                	ret

0000000000001f10 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f10:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f14:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f18:	2501                	sext.w	a0,a0
    1f1a:	8082                	ret

0000000000001f1c <fstat>:
    register long a7 __asm__("a7") = n;
    1f1c:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f20:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f24:	2501                	sext.w	a0,a0
    1f26:	8082                	ret

0000000000001f28 <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1f28:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f2a:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f2e:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f30:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f34:	2501                	sext.w	a0,a0
    1f36:	8082                	ret

0000000000001f38 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f38:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f3a:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f3e:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f40:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f44:	2501                	sext.w	a0,a0
    1f46:	8082                	ret

0000000000001f48 <link>:

int link(char *old_path, char *new_path)
{
    1f48:	87aa                	mv	a5,a0
    1f4a:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f4c:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f50:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f54:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f56:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f5a:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f5c:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f60:	2501                	sext.w	a0,a0
    1f62:	8082                	ret

0000000000001f64 <unlink>:

int unlink(char *path)
{
    1f64:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f66:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f6a:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f6e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f70:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f74:	2501                	sext.w	a0,a0
    1f76:	8082                	ret
