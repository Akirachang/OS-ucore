
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch3_1_yield0:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0660006f          	j	1068 <__start_main>

0000000000001006 <main>:
/*
理想结果：三个程序交替输出 ABC
*/

int main()
{
    1006:	7139                	addi	sp,sp,-64
    1008:	f426                	sd	s1,40(sp)
    for (int i = 0; i < HEIGHT; ++i)
    {
        char buf[WIDTH + 1];
        for (int j = 0; j < WIDTH; ++j)
            buf[j] = 'A';
    100a:	6491                	lui	s1,0x4
{
    100c:	f822                	sd	s0,48(sp)
    100e:	f04a                	sd	s2,32(sp)
    1010:	ec4e                	sd	s3,24(sp)
    1012:	fc06                	sd	ra,56(sp)
    for (int i = 0; i < HEIGHT; ++i)
    1014:	4401                	li	s0,0
            buf[j] = 'A';
    1016:	00001997          	auipc	s3,0x1
    101a:	fa29b983          	ld	s3,-94(s3) # 1fb8 <unlink+0x44>
    101e:	1414849b          	addiw	s1,s1,321
        buf[WIDTH] = 0;
        printf("%s [%d/%d]\n", buf, i + 1, HEIGHT);
    1022:	00001917          	auipc	s2,0x1
    1026:	f6690913          	addi	s2,s2,-154 # 1f88 <unlink+0x14>
    102a:	2405                	addiw	s0,s0,1
    102c:	4695                	li	a3,5
    102e:	8622                	mv	a2,s0
    1030:	858a                	mv	a1,sp
    1032:	854a                	mv	a0,s2
            buf[j] = 'A';
    1034:	e04e                	sd	s3,0(sp)
    1036:	00911423          	sh	s1,8(sp)
        buf[WIDTH] = 0;
    103a:	00010523          	sb	zero,10(sp)
        printf("%s [%d/%d]\n", buf, i + 1, HEIGHT);
    103e:	0bc000ef          	jal	ra,10fa <printf>
        sched_yield();
    1042:	5a3000ef          	jal	ra,1de4 <sched_yield>
    for (int i = 0; i < HEIGHT; ++i)
    1046:	4795                	li	a5,5
    1048:	fef411e3          	bne	s0,a5,102a <main+0x24>
    }
    puts("Test write A OK!");
    104c:	00001517          	auipc	a0,0x1
    1050:	f4c50513          	addi	a0,a0,-180 # 1f98 <unlink+0x24>
    1054:	064000ef          	jal	ra,10b8 <puts>
    return 0;
    1058:	70e2                	ld	ra,56(sp)
    105a:	7442                	ld	s0,48(sp)
    105c:	74a2                	ld	s1,40(sp)
    105e:	7902                	ld	s2,32(sp)
    1060:	69e2                	ld	s3,24(sp)
    1062:	4501                	li	a0,0
    1064:	6121                	addi	sp,sp,64
    1066:	8082                	ret

0000000000001068 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1068:	1141                	addi	sp,sp,-16
    106a:	e406                	sd	ra,8(sp)
    exit(main());
    106c:	f9bff0ef          	jal	ra,1006 <main>
    1070:	58d000ef          	jal	ra,1dfc <exit>
    return 0;
}
    1074:	60a2                	ld	ra,8(sp)
    1076:	4501                	li	a0,0
    1078:	0141                	addi	sp,sp,16
    107a:	8082                	ret

000000000000107c <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    107c:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    107e:	00f10593          	addi	a1,sp,15
    1082:	4605                	li	a2,1
    1084:	4501                	li	a0,0
{
    1086:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1088:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    108c:	539000ef          	jal	ra,1dc4 <read>
    return byte;
}
    1090:	60e2                	ld	ra,24(sp)
    1092:	00f14503          	lbu	a0,15(sp)
    1096:	6105                	addi	sp,sp,32
    1098:	8082                	ret

000000000000109a <putchar>:

int putchar(int c)
{
    109a:	1101                	addi	sp,sp,-32
    109c:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    109e:	00f10593          	addi	a1,sp,15
    10a2:	4605                	li	a2,1
    10a4:	4505                	li	a0,1
{
    10a6:	ec06                	sd	ra,24(sp)
    char byte = c;
    10a8:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    10ac:	523000ef          	jal	ra,1dce <write>
}
    10b0:	60e2                	ld	ra,24(sp)
    10b2:	2501                	sext.w	a0,a0
    10b4:	6105                	addi	sp,sp,32
    10b6:	8082                	ret

00000000000010b8 <puts>:

int puts(const char *s)
{
    10b8:	1101                	addi	sp,sp,-32
    10ba:	e822                	sd	s0,16(sp)
    10bc:	ec06                	sd	ra,24(sp)
    10be:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    10c0:	145000ef          	jal	ra,1a04 <strlen>
    10c4:	862a                	mv	a2,a0
    10c6:	85a2                	mv	a1,s0
    10c8:	4505                	li	a0,1
    10ca:	505000ef          	jal	ra,1dce <write>
    10ce:	00055763          	bgez	a0,10dc <puts+0x24>
    return r;
}
    10d2:	60e2                	ld	ra,24(sp)
    10d4:	6442                	ld	s0,16(sp)
    10d6:	557d                	li	a0,-1
    10d8:	6105                	addi	sp,sp,32
    10da:	8082                	ret
    return write(stdout, &byte, 1);
    10dc:	00f10593          	addi	a1,sp,15
    char byte = c;
    10e0:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    10e2:	4605                	li	a2,1
    10e4:	4505                	li	a0,1
    char byte = c;
    10e6:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    10ea:	4e5000ef          	jal	ra,1dce <write>
}
    10ee:	60e2                	ld	ra,24(sp)
    10f0:	6442                	ld	s0,16(sp)
    10f2:	41f5551b          	sraiw	a0,a0,0x1f
    10f6:	6105                	addi	sp,sp,32
    10f8:	8082                	ret

00000000000010fa <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    10fa:	7131                	addi	sp,sp,-192
    10fc:	ecce                	sd	s3,88(sp)
    10fe:	e8d2                	sd	s4,80(sp)
    1100:	e4d6                	sd	s5,72(sp)
    1102:	e0da                	sd	s6,64(sp)
    1104:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    1106:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1108:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    110a:	6ae1                	lui	s5,0x18
    110c:	000f4a37          	lui	s4,0xf4
    1110:	00989b37          	lui	s6,0x989
{
    1114:	fc86                	sd	ra,120(sp)
    1116:	f8a2                	sd	s0,112(sp)
    1118:	f4a6                	sd	s1,104(sp)
    111a:	f0ca                	sd	s2,96(sp)
    111c:	fc5e                	sd	s7,56(sp)
    111e:	e52e                	sd	a1,136(sp)
    1120:	e932                	sd	a2,144(sp)
    1122:	ed36                	sd	a3,152(sp)
    1124:	f13a                	sd	a4,160(sp)
    1126:	f942                	sd	a6,176(sp)
    1128:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    112a:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    112c:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x72f>
    1130:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x166bf>
    1134:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf225f>
    1138:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x98769f>
    for (;;)
    {
        if (!*s)
    113c:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    1140:	02500913          	li	s2,37
        if (!*s)
    1144:	1a078f63          	beqz	a5,1302 <printf+0x208>
    1148:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    114a:	17278e63          	beq	a5,s2,12c6 <printf+0x1cc>
    114e:	00164783          	lbu	a5,1(a2)
    1152:	0605                	addi	a2,a2,1
    1154:	fbfd                	bnez	a5,114a <printf+0x50>
    1156:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    1158:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    115c:	85aa                	mv	a1,a0
    115e:	8622                	mv	a2,s0
    1160:	4505                	li	a0,1
    1162:	46d000ef          	jal	ra,1dce <write>
        out(f, a, l);
        if (l)
    1166:	18041963          	bnez	s0,12f8 <printf+0x1fe>
            continue;
        if (s[1] == 0)
    116a:	0014c783          	lbu	a5,1(s1) # 4001 <digits+0x2021>
    116e:	18078a63          	beqz	a5,1302 <printf+0x208>
            break;
        switch (s[1])
    1172:	07300713          	li	a4,115
    1176:	28e78e63          	beq	a5,a4,1412 <printf+0x318>
    117a:	18f76f63          	bltu	a4,a5,1318 <printf+0x21e>
    117e:	06400713          	li	a4,100
    1182:	2ae78c63          	beq	a5,a4,143a <printf+0x340>
    1186:	07000713          	li	a4,112
    118a:	3ce79c63          	bne	a5,a4,1562 <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    118e:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1190:	00001797          	auipc	a5,0x1
    1194:	e5078793          	addi	a5,a5,-432 # 1fe0 <digits>
            printptr(va_arg(ap, uint64));
    1198:	6298                	ld	a4,0(a3)
    119a:	00868093          	addi	ra,a3,8
    119e:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    11a0:	00471293          	slli	t0,a4,0x4
    11a4:	00c71f13          	slli	t5,a4,0xc
    11a8:	01471e13          	slli	t3,a4,0x14
    11ac:	01c71893          	slli	a7,a4,0x1c
    11b0:	02471813          	slli	a6,a4,0x24
    11b4:	02871513          	slli	a0,a4,0x28
    11b8:	02c71593          	slli	a1,a4,0x2c
    11bc:	03071693          	slli	a3,a4,0x30
    11c0:	00871f93          	slli	t6,a4,0x8
    11c4:	01071e93          	slli	t4,a4,0x10
    11c8:	01871313          	slli	t1,a4,0x18
    11cc:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    11d0:	03c2d293          	srli	t0,t0,0x3c
    11d4:	03cf5f13          	srli	t5,t5,0x3c
    11d8:	03ce5e13          	srli	t3,t3,0x3c
    11dc:	03c8d893          	srli	a7,a7,0x3c
    11e0:	03c85813          	srli	a6,a6,0x3c
    11e4:	9171                	srli	a0,a0,0x3c
    11e6:	91f1                	srli	a1,a1,0x3c
    11e8:	92f1                	srli	a3,a3,0x3c
    11ea:	92be                	add	t0,t0,a5
    11ec:	9f3e                	add	t5,t5,a5
    11ee:	9e3e                	add	t3,t3,a5
    11f0:	98be                	add	a7,a7,a5
    11f2:	983e                	add	a6,a6,a5
    11f4:	953e                	add	a0,a0,a5
    11f6:	95be                	add	a1,a1,a5
    11f8:	96be                	add	a3,a3,a5
    11fa:	03c75393          	srli	t2,a4,0x3c
    11fe:	01c75b9b          	srliw	s7,a4,0x1c
    1202:	03cfdf93          	srli	t6,t6,0x3c
    1206:	03cede93          	srli	t4,t4,0x3c
    120a:	03c35313          	srli	t1,t1,0x3c
    120e:	9271                	srli	a2,a2,0x3c
    1210:	0002c403          	lbu	s0,0(t0)
    1214:	93be                	add	t2,t2,a5
    1216:	000f4283          	lbu	t0,0(t5)
    121a:	9fbe                	add	t6,t6,a5
    121c:	000e4f03          	lbu	t5,0(t3)
    1220:	9ebe                	add	t4,t4,a5
    1222:	0008ce03          	lbu	t3,0(a7)
    1226:	933e                	add	t1,t1,a5
    1228:	00084883          	lbu	a7,0(a6)
    122c:	9bbe                	add	s7,s7,a5
    122e:	00054803          	lbu	a6,0(a0)
    1232:	963e                	add	a2,a2,a5
    1234:	0005c503          	lbu	a0,0(a1)
    1238:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    123c:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1240:	0003c903          	lbu	s2,0(t2)
    1244:	00064603          	lbu	a2,0(a2)
    1248:	000fc383          	lbu	t2,0(t6)
    124c:	8b3d                	andi	a4,a4,15
    124e:	000ecf83          	lbu	t6,0(t4)
    1252:	92f1                	srli	a3,a3,0x3c
    1254:	00034e83          	lbu	t4,0(t1)
    1258:	000bc303          	lbu	t1,0(s7)
    125c:	96be                	add	a3,a3,a5
    125e:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    1260:	7761                	lui	a4,0xffff8
    1262:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1266:	00710623          	sb	t2,12(sp)
    126a:	005106a3          	sb	t0,13(sp)
    126e:	01f10723          	sb	t6,14(sp)
    1272:	01e107a3          	sb	t5,15(sp)
    1276:	01d10823          	sb	t4,16(sp)
    127a:	01c108a3          	sb	t3,17(sp)
    127e:	00610923          	sb	t1,18(sp)
    1282:	011109a3          	sb	a7,19(sp)
    1286:	01010a23          	sb	a6,20(sp)
    128a:	00a10aa3          	sb	a0,21(sp)
    128e:	00b10b23          	sb	a1,22(sp)
    1292:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    1296:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    129a:	01210523          	sb	s2,10(sp)
    129e:	008105a3          	sb	s0,11(sp)
    12a2:	0006c703          	lbu	a4,0(a3)
    12a6:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    12aa:	4649                	li	a2,18
    12ac:	002c                	addi	a1,sp,8
    12ae:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12b0:	00e10c23          	sb	a4,24(sp)
    12b4:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    12b8:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    12bc:	313000ef          	jal	ra,1dce <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    12c0:	00248513          	addi	a0,s1,2
    12c4:	bda5                	j	113c <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    12c6:	00064783          	lbu	a5,0(a2)
    12ca:	84b2                	mv	s1,a2
    12cc:	01278963          	beq	a5,s2,12de <printf+0x1e4>
    12d0:	b561                	j	1158 <printf+0x5e>
    12d2:	0024c783          	lbu	a5,2(s1)
    12d6:	0605                	addi	a2,a2,1
    12d8:	0489                	addi	s1,s1,2
    12da:	e7279fe3          	bne	a5,s2,1158 <printf+0x5e>
    12de:	0014c783          	lbu	a5,1(s1)
    12e2:	ff2788e3          	beq	a5,s2,12d2 <printf+0x1d8>
        l = z - a;
    12e6:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    12ea:	85aa                	mv	a1,a0
    12ec:	8622                	mv	a2,s0
    12ee:	4505                	li	a0,1
    12f0:	2df000ef          	jal	ra,1dce <write>
        if (l)
    12f4:	e6040be3          	beqz	s0,116a <printf+0x70>
    12f8:	8526                	mv	a0,s1
        if (!*s)
    12fa:	00054783          	lbu	a5,0(a0)
    12fe:	e40795e3          	bnez	a5,1148 <printf+0x4e>
    }
    va_end(ap);
    1302:	70e6                	ld	ra,120(sp)
    1304:	7446                	ld	s0,112(sp)
    1306:	74a6                	ld	s1,104(sp)
    1308:	7906                	ld	s2,96(sp)
    130a:	69e6                	ld	s3,88(sp)
    130c:	6a46                	ld	s4,80(sp)
    130e:	6aa6                	ld	s5,72(sp)
    1310:	6b06                	ld	s6,64(sp)
    1312:	7be2                	ld	s7,56(sp)
    1314:	6129                	addi	sp,sp,192
    1316:	8082                	ret
        switch (s[1])
    1318:	07800713          	li	a4,120
    131c:	24e79363          	bne	a5,a4,1562 <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    1320:	6782                	ld	a5,0(sp)
    1322:	4394                	lw	a3,0(a5)
    1324:	07a1                	addi	a5,a5,8
    1326:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1328:	2606c263          	bltz	a3,158c <printf+0x492>
        buf[i--] = digits[x % base];
    132c:	00001797          	auipc	a5,0x1
    1330:	cb478793          	addi	a5,a5,-844 # 1fe0 <digits>
    1334:	00f6f713          	andi	a4,a3,15
    1338:	973e                	add	a4,a4,a5
    133a:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff6020>
    buf[16] = 0;
    133e:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1342:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    1344:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1348:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    134c:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    1350:	0046d51b          	srliw	a0,a3,0x4
    1354:	0ad5d563          	bge	a1,a3,13fe <printf+0x304>
        buf[i--] = digits[x % base];
    1358:	8a3d                	andi	a2,a2,15
    135a:	963e                	add	a2,a2,a5
    135c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1360:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    1364:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1368:	30a5fe63          	bgeu	a1,a0,1684 <printf+0x58a>
        buf[i--] = digits[x % base];
    136c:	00f77613          	andi	a2,a4,15
    1370:	963e                	add	a2,a2,a5
    1372:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1376:	45bd                	li	a1,15
    1378:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    137c:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    1380:	00475513          	srli	a0,a4,0x4
    1384:	30e5f963          	bgeu	a1,a4,1696 <printf+0x59c>
        buf[i--] = digits[x % base];
    1388:	8a3d                	andi	a2,a2,15
    138a:	963e                	add	a2,a2,a5
    138c:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    1390:	00875893          	srli	a7,a4,0x8
    1394:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    1398:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    139c:	30a5fd63          	bgeu	a1,a0,16b6 <printf+0x5bc>
        buf[i--] = digits[x % base];
    13a0:	8a3d                	andi	a2,a2,15
    13a2:	963e                	add	a2,a2,a5
    13a4:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13a8:	00c75813          	srli	a6,a4,0xc
    13ac:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    13b0:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    13b4:	3315fe63          	bgeu	a1,a7,16f0 <printf+0x5f6>
        buf[i--] = digits[x % base];
    13b8:	8a3d                	andi	a2,a2,15
    13ba:	963e                	add	a2,a2,a5
    13bc:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13c0:	01075893          	srli	a7,a4,0x10
    13c4:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    13c8:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    13cc:	3305ff63          	bgeu	a1,a6,170a <printf+0x610>
        buf[i--] = digits[x % base];
    13d0:	8a3d                	andi	a2,a2,15
    13d2:	963e                	add	a2,a2,a5
    13d4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    13d8:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    13dc:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    13e0:	3515f863          	bgeu	a1,a7,1730 <printf+0x636>
        buf[i--] = digits[x % base];
    13e4:	97ba                	add	a5,a5,a4
    13e6:	0007c783          	lbu	a5,0(a5)
    13ea:	45a1                	li	a1,8
    13ec:	00f10823          	sb	a5,16(sp)
    if (sign)
    13f0:	0006d763          	bgez	a3,13fe <printf+0x304>
        buf[i--] = '-';
    13f4:	02d00793          	li	a5,45
    13f8:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    13fc:	459d                	li	a1,7
    write(f, s, l);
    13fe:	4641                	li	a2,16
    1400:	003c                	addi	a5,sp,8
    1402:	9e0d                	subw	a2,a2,a1
    1404:	4505                	li	a0,1
    1406:	95be                	add	a1,a1,a5
    1408:	1c7000ef          	jal	ra,1dce <write>
        s += 2;
    140c:	00248513          	addi	a0,s1,2
    1410:	b335                	j	113c <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    1412:	6782                	ld	a5,0(sp)
    1414:	6380                	ld	s0,0(a5)
    1416:	07a1                	addi	a5,a5,8
    1418:	e03e                	sd	a5,0(sp)
    141a:	22040a63          	beqz	s0,164e <printf+0x554>
            l = strnlen(a, 200);
    141e:	0c800593          	li	a1,200
    1422:	8522                	mv	a0,s0
    1424:	6cc000ef          	jal	ra,1af0 <strnlen>
    write(f, s, l);
    1428:	0005061b          	sext.w	a2,a0
    142c:	85a2                	mv	a1,s0
    142e:	4505                	li	a0,1
    1430:	19f000ef          	jal	ra,1dce <write>
        s += 2;
    1434:	00248513          	addi	a0,s1,2
    1438:	b311                	j	113c <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    143a:	6782                	ld	a5,0(sp)
    143c:	4390                	lw	a2,0(a5)
    143e:	07a1                	addi	a5,a5,8
    1440:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1442:	1a064363          	bltz	a2,15e8 <printf+0x4ee>
        buf[i--] = digits[x % base];
    1446:	46a9                	li	a3,10
    1448:	02d6773b          	remuw	a4,a2,a3
    144c:	00001797          	auipc	a5,0x1
    1450:	b9478793          	addi	a5,a5,-1132 # 1fe0 <digits>
    buf[16] = 0;
    1454:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1458:	4525                	li	a0,9
        x = xx;
    145a:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    145e:	973e                	add	a4,a4,a5
    1460:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    1464:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    1468:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    146c:	2cc55063          	bge	a0,a2,172c <printf+0x632>
    1470:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1474:	02d5f73b          	remuw	a4,a1,a3
    1478:	1702                	slli	a4,a4,0x20
    147a:	9301                	srli	a4,a4,0x20
    147c:	973e                	add	a4,a4,a5
    147e:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    1482:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    1486:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    148a:	1f057d63          	bgeu	a0,a6,1684 <printf+0x58a>
        buf[i--] = digits[x % base];
    148e:	4529                	li	a0,10
    } while ((x /= base) != 0);
    1490:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1492:	02a5f73b          	remuw	a4,a1,a0
    1496:	973e                	add	a4,a4,a5
    1498:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    149c:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    14a0:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    14a4:	1ab6f163          	bgeu	a3,a1,1646 <printf+0x54c>
    14a8:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    14ac:	02a776bb          	remuw	a3,a4,a0
    14b0:	96be                	add	a3,a3,a5
    14b2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14b6:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14ba:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    14be:	20b87c63          	bgeu	a6,a1,16d6 <printf+0x5dc>
    14c2:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    14c6:	02a776bb          	remuw	a3,a4,a0
    14ca:	96be                	add	a3,a3,a5
    14cc:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14d0:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14d4:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    14d8:	20b87363          	bgeu	a6,a1,16de <printf+0x5e4>
        buf[i--] = digits[x % base];
    14dc:	02a776bb          	remuw	a3,a4,a0
    14e0:	96be                	add	a3,a3,a5
    14e2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14e6:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14ea:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    14ee:	20b9f563          	bgeu	s3,a1,16f8 <printf+0x5fe>
        buf[i--] = digits[x % base];
    14f2:	02a776bb          	remuw	a3,a4,a0
    14f6:	96be                	add	a3,a3,a5
    14f8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14fc:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1500:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1504:	20bafb63          	bgeu	s5,a1,171a <printf+0x620>
        buf[i--] = digits[x % base];
    1508:	02a776bb          	remuw	a3,a4,a0
    150c:	96be                	add	a3,a3,a5
    150e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1512:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1516:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    151a:	1eba7c63          	bgeu	s4,a1,1712 <printf+0x618>
        buf[i--] = digits[x % base];
    151e:	02a776bb          	remuw	a3,a4,a0
    1522:	96be                	add	a3,a3,a5
    1524:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1528:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    152c:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1530:	14bb7163          	bgeu	s6,a1,1672 <printf+0x578>
        buf[i--] = digits[x % base];
    1534:	1702                	slli	a4,a4,0x20
    1536:	9301                	srli	a4,a4,0x20
    1538:	97ba                	add	a5,a5,a4
    153a:	0007c783          	lbu	a5,0(a5)
    153e:	4599                	li	a1,6
    1540:	00f10723          	sb	a5,14(sp)
    if (sign)
    1544:	ea065de3          	bgez	a2,13fe <printf+0x304>
        buf[i--] = '-';
    1548:	02d00793          	li	a5,45
    154c:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1550:	4595                	li	a1,5
    write(f, s, l);
    1552:	003c                	addi	a5,sp,8
    1554:	4641                	li	a2,16
    1556:	9e0d                	subw	a2,a2,a1
    1558:	4505                	li	a0,1
    155a:	95be                	add	a1,a1,a5
    155c:	073000ef          	jal	ra,1dce <write>
    1560:	b575                	j	140c <printf+0x312>
    char byte = c;
    1562:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1566:	4605                	li	a2,1
    1568:	002c                	addi	a1,sp,8
    156a:	4505                	li	a0,1
    char byte = c;
    156c:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1570:	05f000ef          	jal	ra,1dce <write>
    char byte = c;
    1574:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1578:	4605                	li	a2,1
    157a:	002c                	addi	a1,sp,8
    157c:	4505                	li	a0,1
    char byte = c;
    157e:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1582:	04d000ef          	jal	ra,1dce <write>
        s += 2;
    1586:	00248513          	addi	a0,s1,2
    158a:	be4d                	j	113c <printf+0x42>
        x = -xx;
    158c:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    1590:	00001797          	auipc	a5,0x1
    1594:	a5078793          	addi	a5,a5,-1456 # 1fe0 <digits>
    1598:	00f77613          	andi	a2,a4,15
    159c:	963e                	add	a2,a2,a5
    159e:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    15a2:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    15a6:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    15a8:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    15ac:	0047551b          	srliw	a0,a4,0x4
    15b0:	0047561b          	srliw	a2,a4,0x4
    15b4:	0ab6d263          	bge	a3,a1,1658 <printf+0x55e>
        buf[i--] = digits[x % base];
    15b8:	8a3d                	andi	a2,a2,15
    15ba:	963e                	add	a2,a2,a5
    15bc:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    15c0:	463d                	li	a2,15
    15c2:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    15c6:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    15ca:	daa661e3          	bltu	a2,a0,136c <printf+0x272>
        buf[i--] = '-';
    15ce:	02d00793          	li	a5,45
    15d2:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    15d6:	45b5                	li	a1,13
    write(f, s, l);
    15d8:	003c                	addi	a5,sp,8
    15da:	4641                	li	a2,16
    15dc:	9e0d                	subw	a2,a2,a1
    15de:	4505                	li	a0,1
    15e0:	95be                	add	a1,a1,a5
    15e2:	7ec000ef          	jal	ra,1dce <write>
    15e6:	b51d                	j	140c <printf+0x312>
        x = -xx;
    15e8:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    15ec:	46a9                	li	a3,10
    15ee:	02d875bb          	remuw	a1,a6,a3
    15f2:	00001797          	auipc	a5,0x1
    15f6:	9ee78793          	addi	a5,a5,-1554 # 1fe0 <digits>
    buf[16] = 0;
    15fa:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    15fe:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    1600:	95be                	add	a1,a1,a5
    1602:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    1606:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    160a:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    160e:	04a65563          	bge	a2,a0,1658 <printf+0x55e>
    1612:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1616:	02d775bb          	remuw	a1,a4,a3
    161a:	95be                	add	a1,a1,a5
    161c:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    1620:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    1624:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    1628:	fb0573e3          	bgeu	a0,a6,15ce <printf+0x4d4>
        buf[i--] = digits[x % base];
    162c:	4529                	li	a0,10
    } while ((x /= base) != 0);
    162e:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1630:	02a5f73b          	remuw	a4,a1,a0
    1634:	973e                	add	a4,a4,a5
    1636:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    163a:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    163e:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    1642:	e6b6e3e3          	bltu	a3,a1,14a8 <printf+0x3ae>
        buf[i--] = digits[x % base];
    1646:	45b5                	li	a1,13
    if (sign)
    1648:	da065be3          	bgez	a2,13fe <printf+0x304>
    164c:	a881                	j	169c <printf+0x5a2>
                a = "(null)";
    164e:	00001417          	auipc	s0,0x1
    1652:	96240413          	addi	s0,s0,-1694 # 1fb0 <unlink+0x3c>
    1656:	b3e1                	j	141e <printf+0x324>
        buf[i--] = '-';
    1658:	02d00793          	li	a5,45
    165c:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1660:	45b9                	li	a1,14
    write(f, s, l);
    1662:	003c                	addi	a5,sp,8
    1664:	4641                	li	a2,16
    1666:	9e0d                	subw	a2,a2,a1
    1668:	4505                	li	a0,1
    166a:	95be                	add	a1,a1,a5
    166c:	762000ef          	jal	ra,1dce <write>
    1670:	bb71                	j	140c <printf+0x312>
        buf[i--] = digits[x % base];
    1672:	459d                	li	a1,7
    if (sign)
    1674:	d80655e3          	bgez	a2,13fe <printf+0x304>
        buf[i--] = '-';
    1678:	02d00793          	li	a5,45
    167c:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1680:	4599                	li	a1,6
    1682:	bbb5                	j	13fe <printf+0x304>
    1684:	45b9                	li	a1,14
    write(f, s, l);
    1686:	003c                	addi	a5,sp,8
    1688:	4641                	li	a2,16
    168a:	9e0d                	subw	a2,a2,a1
    168c:	4505                	li	a0,1
    168e:	95be                	add	a1,a1,a5
    1690:	73e000ef          	jal	ra,1dce <write>
    1694:	bba5                	j	140c <printf+0x312>
        buf[i--] = digits[x % base];
    1696:	45b5                	li	a1,13
    if (sign)
    1698:	d606d3e3          	bgez	a3,13fe <printf+0x304>
        buf[i--] = '-';
    169c:	02d00793          	li	a5,45
    16a0:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    16a4:	45b1                	li	a1,12
    write(f, s, l);
    16a6:	003c                	addi	a5,sp,8
    16a8:	4641                	li	a2,16
    16aa:	9e0d                	subw	a2,a2,a1
    16ac:	4505                	li	a0,1
    16ae:	95be                	add	a1,a1,a5
    16b0:	71e000ef          	jal	ra,1dce <write>
    16b4:	bba1                	j	140c <printf+0x312>
        buf[i--] = digits[x % base];
    16b6:	45b1                	li	a1,12
    if (sign)
    16b8:	d406d3e3          	bgez	a3,13fe <printf+0x304>
        buf[i--] = '-';
    16bc:	02d00793          	li	a5,45
    16c0:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    16c4:	45ad                	li	a1,11
    write(f, s, l);
    16c6:	003c                	addi	a5,sp,8
    16c8:	4641                	li	a2,16
    16ca:	9e0d                	subw	a2,a2,a1
    16cc:	4505                	li	a0,1
    16ce:	95be                	add	a1,a1,a5
    16d0:	6fe000ef          	jal	ra,1dce <write>
    16d4:	bb25                	j	140c <printf+0x312>
        buf[i--] = digits[x % base];
    16d6:	45b1                	li	a1,12
    if (sign)
    16d8:	d20653e3          	bgez	a2,13fe <printf+0x304>
    16dc:	b7c5                	j	16bc <printf+0x5c2>
        buf[i--] = digits[x % base];
    16de:	45ad                	li	a1,11
    if (sign)
    16e0:	d0065fe3          	bgez	a2,13fe <printf+0x304>
        buf[i--] = '-';
    16e4:	02d00793          	li	a5,45
    16e8:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    16ec:	45a9                	li	a1,10
    16ee:	bb01                	j	13fe <printf+0x304>
    16f0:	45ad                	li	a1,11
    if (sign)
    16f2:	d006d6e3          	bgez	a3,13fe <printf+0x304>
    16f6:	b7fd                	j	16e4 <printf+0x5ea>
        buf[i--] = digits[x % base];
    16f8:	45a9                	li	a1,10
    if (sign)
    16fa:	d00652e3          	bgez	a2,13fe <printf+0x304>
        buf[i--] = '-';
    16fe:	02d00793          	li	a5,45
    1702:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1706:	45a5                	li	a1,9
    1708:	b9dd                	j	13fe <printf+0x304>
    170a:	45a9                	li	a1,10
    if (sign)
    170c:	ce06d9e3          	bgez	a3,13fe <printf+0x304>
    1710:	b7fd                	j	16fe <printf+0x604>
        buf[i--] = digits[x % base];
    1712:	45a1                	li	a1,8
    if (sign)
    1714:	ce0655e3          	bgez	a2,13fe <printf+0x304>
    1718:	b9f1                	j	13f4 <printf+0x2fa>
        buf[i--] = digits[x % base];
    171a:	45a5                	li	a1,9
    if (sign)
    171c:	ce0651e3          	bgez	a2,13fe <printf+0x304>
        buf[i--] = '-';
    1720:	02d00793          	li	a5,45
    1724:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1728:	45a1                	li	a1,8
    172a:	b9d1                	j	13fe <printf+0x304>
    i = 15;
    172c:	45bd                	li	a1,15
    172e:	b9c1                	j	13fe <printf+0x304>
        buf[i--] = digits[x % base];
    1730:	45a5                	li	a1,9
    if (sign)
    1732:	cc06d6e3          	bgez	a3,13fe <printf+0x304>
    1736:	b7ed                	j	1720 <printf+0x626>

0000000000001738 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1738:	02000793          	li	a5,32
    173c:	00f50663          	beq	a0,a5,1748 <isspace+0x10>
    1740:	355d                	addiw	a0,a0,-9
    1742:	00553513          	sltiu	a0,a0,5
    1746:	8082                	ret
    1748:	4505                	li	a0,1
}
    174a:	8082                	ret

000000000000174c <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    174c:	fd05051b          	addiw	a0,a0,-48
}
    1750:	00a53513          	sltiu	a0,a0,10
    1754:	8082                	ret

0000000000001756 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1756:	02000613          	li	a2,32
    175a:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    175c:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1760:	ff77069b          	addiw	a3,a4,-9
    1764:	04c70d63          	beq	a4,a2,17be <atoi+0x68>
    1768:	0007079b          	sext.w	a5,a4
    176c:	04d5f963          	bgeu	a1,a3,17be <atoi+0x68>
        s++;
    switch (*s)
    1770:	02b00693          	li	a3,43
    1774:	04d70a63          	beq	a4,a3,17c8 <atoi+0x72>
    1778:	02d00693          	li	a3,45
    177c:	06d70463          	beq	a4,a3,17e4 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1780:	fd07859b          	addiw	a1,a5,-48
    1784:	4625                	li	a2,9
    1786:	873e                	mv	a4,a5
    1788:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    178a:	4e01                	li	t3,0
    while (isdigit(*s))
    178c:	04b66a63          	bltu	a2,a1,17e0 <atoi+0x8a>
    int n = 0, neg = 0;
    1790:	4501                	li	a0,0
    while (isdigit(*s))
    1792:	4825                	li	a6,9
    1794:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1798:	0025179b          	slliw	a5,a0,0x2
    179c:	9d3d                	addw	a0,a0,a5
    179e:	fd07031b          	addiw	t1,a4,-48
    17a2:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    17a6:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    17aa:	0685                	addi	a3,a3,1
    17ac:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    17b0:	0006071b          	sext.w	a4,a2
    17b4:	feb870e3          	bgeu	a6,a1,1794 <atoi+0x3e>
    return neg ? n : -n;
    17b8:	000e0563          	beqz	t3,17c2 <atoi+0x6c>
}
    17bc:	8082                	ret
        s++;
    17be:	0505                	addi	a0,a0,1
    17c0:	bf71                	j	175c <atoi+0x6>
    17c2:	4113053b          	subw	a0,t1,a7
    17c6:	8082                	ret
    while (isdigit(*s))
    17c8:	00154783          	lbu	a5,1(a0)
    17cc:	4625                	li	a2,9
        s++;
    17ce:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17d2:	fd07859b          	addiw	a1,a5,-48
    17d6:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    17da:	4e01                	li	t3,0
    while (isdigit(*s))
    17dc:	fab67ae3          	bgeu	a2,a1,1790 <atoi+0x3a>
    17e0:	4501                	li	a0,0
}
    17e2:	8082                	ret
    while (isdigit(*s))
    17e4:	00154783          	lbu	a5,1(a0)
    17e8:	4625                	li	a2,9
        s++;
    17ea:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17ee:	fd07859b          	addiw	a1,a5,-48
    17f2:	0007871b          	sext.w	a4,a5
    17f6:	feb665e3          	bltu	a2,a1,17e0 <atoi+0x8a>
        neg = 1;
    17fa:	4e05                	li	t3,1
    17fc:	bf51                	j	1790 <atoi+0x3a>

00000000000017fe <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    17fe:	16060d63          	beqz	a2,1978 <memset+0x17a>
    1802:	40a007b3          	neg	a5,a0
    1806:	8b9d                	andi	a5,a5,7
    1808:	00778713          	addi	a4,a5,7
    180c:	482d                	li	a6,11
    180e:	0ff5f593          	andi	a1,a1,255
    1812:	fff60693          	addi	a3,a2,-1
    1816:	17076263          	bltu	a4,a6,197a <memset+0x17c>
    181a:	16e6ea63          	bltu	a3,a4,198e <memset+0x190>
    181e:	16078563          	beqz	a5,1988 <memset+0x18a>
    1822:	00b50023          	sb	a1,0(a0)
    1826:	4705                	li	a4,1
    1828:	00150e93          	addi	t4,a0,1
    182c:	14e78c63          	beq	a5,a4,1984 <memset+0x186>
    1830:	00b500a3          	sb	a1,1(a0)
    1834:	4709                	li	a4,2
    1836:	00250e93          	addi	t4,a0,2
    183a:	14e78d63          	beq	a5,a4,1994 <memset+0x196>
    183e:	00b50123          	sb	a1,2(a0)
    1842:	470d                	li	a4,3
    1844:	00350e93          	addi	t4,a0,3
    1848:	12e78b63          	beq	a5,a4,197e <memset+0x180>
    184c:	00b501a3          	sb	a1,3(a0)
    1850:	4711                	li	a4,4
    1852:	00450e93          	addi	t4,a0,4
    1856:	14e78163          	beq	a5,a4,1998 <memset+0x19a>
    185a:	00b50223          	sb	a1,4(a0)
    185e:	4715                	li	a4,5
    1860:	00550e93          	addi	t4,a0,5
    1864:	12e78c63          	beq	a5,a4,199c <memset+0x19e>
    1868:	00b502a3          	sb	a1,5(a0)
    186c:	471d                	li	a4,7
    186e:	00650e93          	addi	t4,a0,6
    1872:	12e79763          	bne	a5,a4,19a0 <memset+0x1a2>
    1876:	00750e93          	addi	t4,a0,7
    187a:	00b50323          	sb	a1,6(a0)
    187e:	4f1d                	li	t5,7
    1880:	00859713          	slli	a4,a1,0x8
    1884:	8f4d                	or	a4,a4,a1
    1886:	01059e13          	slli	t3,a1,0x10
    188a:	01c76e33          	or	t3,a4,t3
    188e:	01859313          	slli	t1,a1,0x18
    1892:	006e6333          	or	t1,t3,t1
    1896:	02059893          	slli	a7,a1,0x20
    189a:	011368b3          	or	a7,t1,a7
    189e:	02859813          	slli	a6,a1,0x28
    18a2:	40f60333          	sub	t1,a2,a5
    18a6:	0108e833          	or	a6,a7,a6
    18aa:	03059693          	slli	a3,a1,0x30
    18ae:	00d866b3          	or	a3,a6,a3
    18b2:	03859713          	slli	a4,a1,0x38
    18b6:	97aa                	add	a5,a5,a0
    18b8:	ff837813          	andi	a6,t1,-8
    18bc:	8f55                	or	a4,a4,a3
    18be:	00f806b3          	add	a3,a6,a5
    18c2:	e398                	sd	a4,0(a5)
    18c4:	07a1                	addi	a5,a5,8
    18c6:	fed79ee3          	bne	a5,a3,18c2 <memset+0xc4>
    18ca:	ff837693          	andi	a3,t1,-8
    18ce:	00de87b3          	add	a5,t4,a3
    18d2:	01e6873b          	addw	a4,a3,t5
    18d6:	0ad30663          	beq	t1,a3,1982 <memset+0x184>
    18da:	00b78023          	sb	a1,0(a5)
    18de:	0017069b          	addiw	a3,a4,1
    18e2:	08c6fb63          	bgeu	a3,a2,1978 <memset+0x17a>
    18e6:	00b780a3          	sb	a1,1(a5)
    18ea:	0027069b          	addiw	a3,a4,2
    18ee:	08c6f563          	bgeu	a3,a2,1978 <memset+0x17a>
    18f2:	00b78123          	sb	a1,2(a5)
    18f6:	0037069b          	addiw	a3,a4,3
    18fa:	06c6ff63          	bgeu	a3,a2,1978 <memset+0x17a>
    18fe:	00b781a3          	sb	a1,3(a5)
    1902:	0047069b          	addiw	a3,a4,4
    1906:	06c6f963          	bgeu	a3,a2,1978 <memset+0x17a>
    190a:	00b78223          	sb	a1,4(a5)
    190e:	0057069b          	addiw	a3,a4,5
    1912:	06c6f363          	bgeu	a3,a2,1978 <memset+0x17a>
    1916:	00b782a3          	sb	a1,5(a5)
    191a:	0067069b          	addiw	a3,a4,6
    191e:	04c6fd63          	bgeu	a3,a2,1978 <memset+0x17a>
    1922:	00b78323          	sb	a1,6(a5)
    1926:	0077069b          	addiw	a3,a4,7
    192a:	04c6f763          	bgeu	a3,a2,1978 <memset+0x17a>
    192e:	00b783a3          	sb	a1,7(a5)
    1932:	0087069b          	addiw	a3,a4,8
    1936:	04c6f163          	bgeu	a3,a2,1978 <memset+0x17a>
    193a:	00b78423          	sb	a1,8(a5)
    193e:	0097069b          	addiw	a3,a4,9
    1942:	02c6fb63          	bgeu	a3,a2,1978 <memset+0x17a>
    1946:	00b784a3          	sb	a1,9(a5)
    194a:	00a7069b          	addiw	a3,a4,10
    194e:	02c6f563          	bgeu	a3,a2,1978 <memset+0x17a>
    1952:	00b78523          	sb	a1,10(a5)
    1956:	00b7069b          	addiw	a3,a4,11
    195a:	00c6ff63          	bgeu	a3,a2,1978 <memset+0x17a>
    195e:	00b785a3          	sb	a1,11(a5)
    1962:	00c7069b          	addiw	a3,a4,12
    1966:	00c6f963          	bgeu	a3,a2,1978 <memset+0x17a>
    196a:	00b78623          	sb	a1,12(a5)
    196e:	2735                	addiw	a4,a4,13
    1970:	00c77463          	bgeu	a4,a2,1978 <memset+0x17a>
    1974:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1978:	8082                	ret
    197a:	472d                	li	a4,11
    197c:	bd79                	j	181a <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    197e:	4f0d                	li	t5,3
    1980:	b701                	j	1880 <memset+0x82>
    1982:	8082                	ret
    1984:	4f05                	li	t5,1
    1986:	bded                	j	1880 <memset+0x82>
    1988:	8eaa                	mv	t4,a0
    198a:	4f01                	li	t5,0
    198c:	bdd5                	j	1880 <memset+0x82>
    198e:	87aa                	mv	a5,a0
    1990:	4701                	li	a4,0
    1992:	b7a1                	j	18da <memset+0xdc>
    1994:	4f09                	li	t5,2
    1996:	b5ed                	j	1880 <memset+0x82>
    1998:	4f11                	li	t5,4
    199a:	b5dd                	j	1880 <memset+0x82>
    199c:	4f15                	li	t5,5
    199e:	b5cd                	j	1880 <memset+0x82>
    19a0:	4f19                	li	t5,6
    19a2:	bdf9                	j	1880 <memset+0x82>

00000000000019a4 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    19a4:	00054783          	lbu	a5,0(a0)
    19a8:	0005c703          	lbu	a4,0(a1)
    19ac:	00e79863          	bne	a5,a4,19bc <strcmp+0x18>
    19b0:	0505                	addi	a0,a0,1
    19b2:	0585                	addi	a1,a1,1
    19b4:	fbe5                	bnez	a5,19a4 <strcmp>
    19b6:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    19b8:	9d19                	subw	a0,a0,a4
    19ba:	8082                	ret
    19bc:	0007851b          	sext.w	a0,a5
    19c0:	bfe5                	j	19b8 <strcmp+0x14>

00000000000019c2 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    19c2:	ce05                	beqz	a2,19fa <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19c4:	00054703          	lbu	a4,0(a0)
    19c8:	0005c783          	lbu	a5,0(a1)
    19cc:	cb0d                	beqz	a4,19fe <strncmp+0x3c>
    if (!n--)
    19ce:	167d                	addi	a2,a2,-1
    19d0:	00c506b3          	add	a3,a0,a2
    19d4:	a819                	j	19ea <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19d6:	00a68e63          	beq	a3,a0,19f2 <strncmp+0x30>
    19da:	0505                	addi	a0,a0,1
    19dc:	00e79b63          	bne	a5,a4,19f2 <strncmp+0x30>
    19e0:	00054703          	lbu	a4,0(a0)
    19e4:	0005c783          	lbu	a5,0(a1)
    19e8:	cb19                	beqz	a4,19fe <strncmp+0x3c>
    19ea:	0005c783          	lbu	a5,0(a1)
    19ee:	0585                	addi	a1,a1,1
    19f0:	f3fd                	bnez	a5,19d6 <strncmp+0x14>
        ;
    return *l - *r;
    19f2:	0007051b          	sext.w	a0,a4
    19f6:	9d1d                	subw	a0,a0,a5
    19f8:	8082                	ret
        return 0;
    19fa:	4501                	li	a0,0
}
    19fc:	8082                	ret
    19fe:	4501                	li	a0,0
    return *l - *r;
    1a00:	9d1d                	subw	a0,a0,a5
    1a02:	8082                	ret

0000000000001a04 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1a04:	00757793          	andi	a5,a0,7
    1a08:	cf89                	beqz	a5,1a22 <strlen+0x1e>
    1a0a:	87aa                	mv	a5,a0
    1a0c:	a029                	j	1a16 <strlen+0x12>
    1a0e:	0785                	addi	a5,a5,1
    1a10:	0077f713          	andi	a4,a5,7
    1a14:	cb01                	beqz	a4,1a24 <strlen+0x20>
        if (!*s)
    1a16:	0007c703          	lbu	a4,0(a5)
    1a1a:	fb75                	bnez	a4,1a0e <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1a1c:	40a78533          	sub	a0,a5,a0
}
    1a20:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1a22:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1a24:	6394                	ld	a3,0(a5)
    1a26:	00000597          	auipc	a1,0x0
    1a2a:	59a5b583          	ld	a1,1434(a1) # 1fc0 <unlink+0x4c>
    1a2e:	00000617          	auipc	a2,0x0
    1a32:	59a63603          	ld	a2,1434(a2) # 1fc8 <unlink+0x54>
    1a36:	a019                	j	1a3c <strlen+0x38>
    1a38:	6794                	ld	a3,8(a5)
    1a3a:	07a1                	addi	a5,a5,8
    1a3c:	00b68733          	add	a4,a3,a1
    1a40:	fff6c693          	not	a3,a3
    1a44:	8f75                	and	a4,a4,a3
    1a46:	8f71                	and	a4,a4,a2
    1a48:	db65                	beqz	a4,1a38 <strlen+0x34>
    for (; *s; s++)
    1a4a:	0007c703          	lbu	a4,0(a5)
    1a4e:	d779                	beqz	a4,1a1c <strlen+0x18>
    1a50:	0017c703          	lbu	a4,1(a5)
    1a54:	0785                	addi	a5,a5,1
    1a56:	d379                	beqz	a4,1a1c <strlen+0x18>
    1a58:	0017c703          	lbu	a4,1(a5)
    1a5c:	0785                	addi	a5,a5,1
    1a5e:	fb6d                	bnez	a4,1a50 <strlen+0x4c>
    1a60:	bf75                	j	1a1c <strlen+0x18>

0000000000001a62 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a62:	00757713          	andi	a4,a0,7
{
    1a66:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1a68:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a6c:	cb19                	beqz	a4,1a82 <memchr+0x20>
    1a6e:	ce25                	beqz	a2,1ae6 <memchr+0x84>
    1a70:	0007c703          	lbu	a4,0(a5)
    1a74:	04b70e63          	beq	a4,a1,1ad0 <memchr+0x6e>
    1a78:	0785                	addi	a5,a5,1
    1a7a:	0077f713          	andi	a4,a5,7
    1a7e:	167d                	addi	a2,a2,-1
    1a80:	f77d                	bnez	a4,1a6e <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1a82:	4501                	li	a0,0
    if (n && *s != c)
    1a84:	c235                	beqz	a2,1ae8 <memchr+0x86>
    1a86:	0007c703          	lbu	a4,0(a5)
    1a8a:	04b70363          	beq	a4,a1,1ad0 <memchr+0x6e>
        size_t k = ONES * c;
    1a8e:	00000517          	auipc	a0,0x0
    1a92:	54253503          	ld	a0,1346(a0) # 1fd0 <unlink+0x5c>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a96:	471d                	li	a4,7
        size_t k = ONES * c;
    1a98:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a9c:	02c77a63          	bgeu	a4,a2,1ad0 <memchr+0x6e>
    1aa0:	00000897          	auipc	a7,0x0
    1aa4:	5208b883          	ld	a7,1312(a7) # 1fc0 <unlink+0x4c>
    1aa8:	00000817          	auipc	a6,0x0
    1aac:	52083803          	ld	a6,1312(a6) # 1fc8 <unlink+0x54>
    1ab0:	431d                	li	t1,7
    1ab2:	a029                	j	1abc <memchr+0x5a>
    1ab4:	1661                	addi	a2,a2,-8
    1ab6:	07a1                	addi	a5,a5,8
    1ab8:	02c37963          	bgeu	t1,a2,1aea <memchr+0x88>
    1abc:	6398                	ld	a4,0(a5)
    1abe:	8f29                	xor	a4,a4,a0
    1ac0:	011706b3          	add	a3,a4,a7
    1ac4:	fff74713          	not	a4,a4
    1ac8:	8f75                	and	a4,a4,a3
    1aca:	01077733          	and	a4,a4,a6
    1ace:	d37d                	beqz	a4,1ab4 <memchr+0x52>
    1ad0:	853e                	mv	a0,a5
    1ad2:	97b2                	add	a5,a5,a2
    1ad4:	a021                	j	1adc <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1ad6:	0505                	addi	a0,a0,1
    1ad8:	00f50763          	beq	a0,a5,1ae6 <memchr+0x84>
    1adc:	00054703          	lbu	a4,0(a0)
    1ae0:	feb71be3          	bne	a4,a1,1ad6 <memchr+0x74>
    1ae4:	8082                	ret
    return n ? (void *)s : 0;
    1ae6:	4501                	li	a0,0
}
    1ae8:	8082                	ret
    return n ? (void *)s : 0;
    1aea:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1aec:	f275                	bnez	a2,1ad0 <memchr+0x6e>
}
    1aee:	8082                	ret

0000000000001af0 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1af0:	1101                	addi	sp,sp,-32
    1af2:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1af4:	862e                	mv	a2,a1
{
    1af6:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1af8:	4581                	li	a1,0
{
    1afa:	e426                	sd	s1,8(sp)
    1afc:	ec06                	sd	ra,24(sp)
    1afe:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1b00:	f63ff0ef          	jal	ra,1a62 <memchr>
    return p ? p - s : n;
    1b04:	c519                	beqz	a0,1b12 <strnlen+0x22>
}
    1b06:	60e2                	ld	ra,24(sp)
    1b08:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1b0a:	8d05                	sub	a0,a0,s1
}
    1b0c:	64a2                	ld	s1,8(sp)
    1b0e:	6105                	addi	sp,sp,32
    1b10:	8082                	ret
    1b12:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1b14:	8522                	mv	a0,s0
}
    1b16:	6442                	ld	s0,16(sp)
    1b18:	64a2                	ld	s1,8(sp)
    1b1a:	6105                	addi	sp,sp,32
    1b1c:	8082                	ret

0000000000001b1e <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1b1e:	00b547b3          	xor	a5,a0,a1
    1b22:	8b9d                	andi	a5,a5,7
    1b24:	eb95                	bnez	a5,1b58 <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1b26:	0075f793          	andi	a5,a1,7
    1b2a:	e7b1                	bnez	a5,1b76 <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1b2c:	6198                	ld	a4,0(a1)
    1b2e:	00000617          	auipc	a2,0x0
    1b32:	49263603          	ld	a2,1170(a2) # 1fc0 <unlink+0x4c>
    1b36:	00000817          	auipc	a6,0x0
    1b3a:	49283803          	ld	a6,1170(a6) # 1fc8 <unlink+0x54>
    1b3e:	a029                	j	1b48 <stpcpy+0x2a>
    1b40:	e118                	sd	a4,0(a0)
    1b42:	6598                	ld	a4,8(a1)
    1b44:	05a1                	addi	a1,a1,8
    1b46:	0521                	addi	a0,a0,8
    1b48:	00c707b3          	add	a5,a4,a2
    1b4c:	fff74693          	not	a3,a4
    1b50:	8ff5                	and	a5,a5,a3
    1b52:	0107f7b3          	and	a5,a5,a6
    1b56:	d7ed                	beqz	a5,1b40 <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b58:	0005c783          	lbu	a5,0(a1)
    1b5c:	00f50023          	sb	a5,0(a0)
    1b60:	c785                	beqz	a5,1b88 <stpcpy+0x6a>
    1b62:	0015c783          	lbu	a5,1(a1)
    1b66:	0505                	addi	a0,a0,1
    1b68:	0585                	addi	a1,a1,1
    1b6a:	00f50023          	sb	a5,0(a0)
    1b6e:	fbf5                	bnez	a5,1b62 <stpcpy+0x44>
        ;
    return d;
}
    1b70:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1b72:	0505                	addi	a0,a0,1
    1b74:	df45                	beqz	a4,1b2c <stpcpy+0xe>
            if (!(*d = *s))
    1b76:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1b7a:	0585                	addi	a1,a1,1
    1b7c:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1b80:	00f50023          	sb	a5,0(a0)
    1b84:	f7fd                	bnez	a5,1b72 <stpcpy+0x54>
}
    1b86:	8082                	ret
    1b88:	8082                	ret

0000000000001b8a <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b8a:	00b547b3          	xor	a5,a0,a1
    1b8e:	8b9d                	andi	a5,a5,7
    1b90:	1a079863          	bnez	a5,1d40 <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b94:	0075f793          	andi	a5,a1,7
    1b98:	16078463          	beqz	a5,1d00 <stpncpy+0x176>
    1b9c:	ea01                	bnez	a2,1bac <stpncpy+0x22>
    1b9e:	a421                	j	1da6 <stpncpy+0x21c>
    1ba0:	167d                	addi	a2,a2,-1
    1ba2:	0505                	addi	a0,a0,1
    1ba4:	14070e63          	beqz	a4,1d00 <stpncpy+0x176>
    1ba8:	1a060863          	beqz	a2,1d58 <stpncpy+0x1ce>
    1bac:	0005c783          	lbu	a5,0(a1)
    1bb0:	0585                	addi	a1,a1,1
    1bb2:	0075f713          	andi	a4,a1,7
    1bb6:	00f50023          	sb	a5,0(a0)
    1bba:	f3fd                	bnez	a5,1ba0 <stpncpy+0x16>
    1bbc:	4805                	li	a6,1
    1bbe:	1a061863          	bnez	a2,1d6e <stpncpy+0x1e4>
    1bc2:	40a007b3          	neg	a5,a0
    1bc6:	8b9d                	andi	a5,a5,7
    1bc8:	4681                	li	a3,0
    1bca:	18061a63          	bnez	a2,1d5e <stpncpy+0x1d4>
    1bce:	00778713          	addi	a4,a5,7
    1bd2:	45ad                	li	a1,11
    1bd4:	18b76363          	bltu	a4,a1,1d5a <stpncpy+0x1d0>
    1bd8:	1ae6eb63          	bltu	a3,a4,1d8e <stpncpy+0x204>
    1bdc:	1a078363          	beqz	a5,1d82 <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1be0:	00050023          	sb	zero,0(a0)
    1be4:	4685                	li	a3,1
    1be6:	00150713          	addi	a4,a0,1
    1bea:	18d78f63          	beq	a5,a3,1d88 <stpncpy+0x1fe>
    1bee:	000500a3          	sb	zero,1(a0)
    1bf2:	4689                	li	a3,2
    1bf4:	00250713          	addi	a4,a0,2
    1bf8:	18d78e63          	beq	a5,a3,1d94 <stpncpy+0x20a>
    1bfc:	00050123          	sb	zero,2(a0)
    1c00:	468d                	li	a3,3
    1c02:	00350713          	addi	a4,a0,3
    1c06:	16d78c63          	beq	a5,a3,1d7e <stpncpy+0x1f4>
    1c0a:	000501a3          	sb	zero,3(a0)
    1c0e:	4691                	li	a3,4
    1c10:	00450713          	addi	a4,a0,4
    1c14:	18d78263          	beq	a5,a3,1d98 <stpncpy+0x20e>
    1c18:	00050223          	sb	zero,4(a0)
    1c1c:	4695                	li	a3,5
    1c1e:	00550713          	addi	a4,a0,5
    1c22:	16d78d63          	beq	a5,a3,1d9c <stpncpy+0x212>
    1c26:	000502a3          	sb	zero,5(a0)
    1c2a:	469d                	li	a3,7
    1c2c:	00650713          	addi	a4,a0,6
    1c30:	16d79863          	bne	a5,a3,1da0 <stpncpy+0x216>
    1c34:	00750713          	addi	a4,a0,7
    1c38:	00050323          	sb	zero,6(a0)
    1c3c:	40f80833          	sub	a6,a6,a5
    1c40:	ff887593          	andi	a1,a6,-8
    1c44:	97aa                	add	a5,a5,a0
    1c46:	95be                	add	a1,a1,a5
    1c48:	0007b023          	sd	zero,0(a5)
    1c4c:	07a1                	addi	a5,a5,8
    1c4e:	feb79de3          	bne	a5,a1,1c48 <stpncpy+0xbe>
    1c52:	ff887593          	andi	a1,a6,-8
    1c56:	9ead                	addw	a3,a3,a1
    1c58:	00b707b3          	add	a5,a4,a1
    1c5c:	12b80863          	beq	a6,a1,1d8c <stpncpy+0x202>
    1c60:	00078023          	sb	zero,0(a5)
    1c64:	0016871b          	addiw	a4,a3,1
    1c68:	0ec77863          	bgeu	a4,a2,1d58 <stpncpy+0x1ce>
    1c6c:	000780a3          	sb	zero,1(a5)
    1c70:	0026871b          	addiw	a4,a3,2
    1c74:	0ec77263          	bgeu	a4,a2,1d58 <stpncpy+0x1ce>
    1c78:	00078123          	sb	zero,2(a5)
    1c7c:	0036871b          	addiw	a4,a3,3
    1c80:	0cc77c63          	bgeu	a4,a2,1d58 <stpncpy+0x1ce>
    1c84:	000781a3          	sb	zero,3(a5)
    1c88:	0046871b          	addiw	a4,a3,4
    1c8c:	0cc77663          	bgeu	a4,a2,1d58 <stpncpy+0x1ce>
    1c90:	00078223          	sb	zero,4(a5)
    1c94:	0056871b          	addiw	a4,a3,5
    1c98:	0cc77063          	bgeu	a4,a2,1d58 <stpncpy+0x1ce>
    1c9c:	000782a3          	sb	zero,5(a5)
    1ca0:	0066871b          	addiw	a4,a3,6
    1ca4:	0ac77a63          	bgeu	a4,a2,1d58 <stpncpy+0x1ce>
    1ca8:	00078323          	sb	zero,6(a5)
    1cac:	0076871b          	addiw	a4,a3,7
    1cb0:	0ac77463          	bgeu	a4,a2,1d58 <stpncpy+0x1ce>
    1cb4:	000783a3          	sb	zero,7(a5)
    1cb8:	0086871b          	addiw	a4,a3,8
    1cbc:	08c77e63          	bgeu	a4,a2,1d58 <stpncpy+0x1ce>
    1cc0:	00078423          	sb	zero,8(a5)
    1cc4:	0096871b          	addiw	a4,a3,9
    1cc8:	08c77863          	bgeu	a4,a2,1d58 <stpncpy+0x1ce>
    1ccc:	000784a3          	sb	zero,9(a5)
    1cd0:	00a6871b          	addiw	a4,a3,10
    1cd4:	08c77263          	bgeu	a4,a2,1d58 <stpncpy+0x1ce>
    1cd8:	00078523          	sb	zero,10(a5)
    1cdc:	00b6871b          	addiw	a4,a3,11
    1ce0:	06c77c63          	bgeu	a4,a2,1d58 <stpncpy+0x1ce>
    1ce4:	000785a3          	sb	zero,11(a5)
    1ce8:	00c6871b          	addiw	a4,a3,12
    1cec:	06c77663          	bgeu	a4,a2,1d58 <stpncpy+0x1ce>
    1cf0:	00078623          	sb	zero,12(a5)
    1cf4:	26b5                	addiw	a3,a3,13
    1cf6:	06c6f163          	bgeu	a3,a2,1d58 <stpncpy+0x1ce>
    1cfa:	000786a3          	sb	zero,13(a5)
    1cfe:	8082                	ret
            ;
        if (!n || !*s)
    1d00:	c645                	beqz	a2,1da8 <stpncpy+0x21e>
    1d02:	0005c783          	lbu	a5,0(a1)
    1d06:	ea078be3          	beqz	a5,1bbc <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d0a:	479d                	li	a5,7
    1d0c:	02c7ff63          	bgeu	a5,a2,1d4a <stpncpy+0x1c0>
    1d10:	00000897          	auipc	a7,0x0
    1d14:	2b08b883          	ld	a7,688(a7) # 1fc0 <unlink+0x4c>
    1d18:	00000817          	auipc	a6,0x0
    1d1c:	2b083803          	ld	a6,688(a6) # 1fc8 <unlink+0x54>
    1d20:	431d                	li	t1,7
    1d22:	6198                	ld	a4,0(a1)
    1d24:	011707b3          	add	a5,a4,a7
    1d28:	fff74693          	not	a3,a4
    1d2c:	8ff5                	and	a5,a5,a3
    1d2e:	0107f7b3          	and	a5,a5,a6
    1d32:	ef81                	bnez	a5,1d4a <stpncpy+0x1c0>
            *wd = *ws;
    1d34:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d36:	1661                	addi	a2,a2,-8
    1d38:	05a1                	addi	a1,a1,8
    1d3a:	0521                	addi	a0,a0,8
    1d3c:	fec363e3          	bltu	t1,a2,1d22 <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1d40:	e609                	bnez	a2,1d4a <stpncpy+0x1c0>
    1d42:	a08d                	j	1da4 <stpncpy+0x21a>
    1d44:	167d                	addi	a2,a2,-1
    1d46:	0505                	addi	a0,a0,1
    1d48:	ca01                	beqz	a2,1d58 <stpncpy+0x1ce>
    1d4a:	0005c783          	lbu	a5,0(a1)
    1d4e:	0585                	addi	a1,a1,1
    1d50:	00f50023          	sb	a5,0(a0)
    1d54:	fbe5                	bnez	a5,1d44 <stpncpy+0x1ba>
        ;
tail:
    1d56:	b59d                	j	1bbc <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1d58:	8082                	ret
    1d5a:	472d                	li	a4,11
    1d5c:	bdb5                	j	1bd8 <stpncpy+0x4e>
    1d5e:	00778713          	addi	a4,a5,7
    1d62:	45ad                	li	a1,11
    1d64:	fff60693          	addi	a3,a2,-1
    1d68:	e6b778e3          	bgeu	a4,a1,1bd8 <stpncpy+0x4e>
    1d6c:	b7fd                	j	1d5a <stpncpy+0x1d0>
    1d6e:	40a007b3          	neg	a5,a0
    1d72:	8832                	mv	a6,a2
    1d74:	8b9d                	andi	a5,a5,7
    1d76:	4681                	li	a3,0
    1d78:	e4060be3          	beqz	a2,1bce <stpncpy+0x44>
    1d7c:	b7cd                	j	1d5e <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d7e:	468d                	li	a3,3
    1d80:	bd75                	j	1c3c <stpncpy+0xb2>
    1d82:	872a                	mv	a4,a0
    1d84:	4681                	li	a3,0
    1d86:	bd5d                	j	1c3c <stpncpy+0xb2>
    1d88:	4685                	li	a3,1
    1d8a:	bd4d                	j	1c3c <stpncpy+0xb2>
    1d8c:	8082                	ret
    1d8e:	87aa                	mv	a5,a0
    1d90:	4681                	li	a3,0
    1d92:	b5f9                	j	1c60 <stpncpy+0xd6>
    1d94:	4689                	li	a3,2
    1d96:	b55d                	j	1c3c <stpncpy+0xb2>
    1d98:	4691                	li	a3,4
    1d9a:	b54d                	j	1c3c <stpncpy+0xb2>
    1d9c:	4695                	li	a3,5
    1d9e:	bd79                	j	1c3c <stpncpy+0xb2>
    1da0:	4699                	li	a3,6
    1da2:	bd69                	j	1c3c <stpncpy+0xb2>
    1da4:	8082                	ret
    1da6:	8082                	ret
    1da8:	8082                	ret

0000000000001daa <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1daa:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1dae:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db0:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1db4:	2501                	sext.w	a0,a0
    1db6:	8082                	ret

0000000000001db8 <close>:
    register long a7 __asm__("a7") = n;
    1db8:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1dbc:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1dc0:	2501                	sext.w	a0,a0
    1dc2:	8082                	ret

0000000000001dc4 <read>:
    register long a7 __asm__("a7") = n;
    1dc4:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dc8:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1dcc:	8082                	ret

0000000000001dce <write>:
    register long a7 __asm__("a7") = n;
    1dce:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd2:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1dd6:	8082                	ret

0000000000001dd8 <getpid>:
    register long a7 __asm__("a7") = n;
    1dd8:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1ddc:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1de0:	2501                	sext.w	a0,a0
    1de2:	8082                	ret

0000000000001de4 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1de4:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1de8:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1dec:	2501                	sext.w	a0,a0
    1dee:	8082                	ret

0000000000001df0 <fork>:
    register long a7 __asm__("a7") = n;
    1df0:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1df4:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1df8:	2501                	sext.w	a0,a0
    1dfa:	8082                	ret

0000000000001dfc <exit>:
    register long a7 __asm__("a7") = n;
    1dfc:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e00:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e04:	8082                	ret

0000000000001e06 <waitpid>:
    register long a7 __asm__("a7") = n;
    1e06:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e0a:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1e0e:	2501                	sext.w	a0,a0
    1e10:	8082                	ret

0000000000001e12 <exec>:
    register long a7 __asm__("a7") = n;
    1e12:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e16:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e1a:	2501                	sext.w	a0,a0
    1e1c:	8082                	ret

0000000000001e1e <get_time>:

int64 get_time()
{
    1e1e:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e20:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e24:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e26:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e28:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e2c:	2501                	sext.w	a0,a0
    1e2e:	ed09                	bnez	a0,1e48 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e30:	67a2                	ld	a5,8(sp)
    1e32:	3e800713          	li	a4,1000
    1e36:	00015503          	lhu	a0,0(sp)
    1e3a:	02e7d7b3          	divu	a5,a5,a4
    1e3e:	02e50533          	mul	a0,a0,a4
    1e42:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e44:	0141                	addi	sp,sp,16
    1e46:	8082                	ret
        return -1;
    1e48:	557d                	li	a0,-1
    1e4a:	bfed                	j	1e44 <get_time+0x26>

0000000000001e4c <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e4c:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e50:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e54:	2501                	sext.w	a0,a0
    1e56:	8082                	ret

0000000000001e58 <sleep>:

int sleep(unsigned long long time)
{
    1e58:	1141                	addi	sp,sp,-16
    1e5a:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1e5c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e60:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e62:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e64:	00000073          	ecall
    if (err == 0)
    1e68:	2501                	sext.w	a0,a0
    1e6a:	e13d                	bnez	a0,1ed0 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e6c:	6722                	ld	a4,8(sp)
    1e6e:	3e800693          	li	a3,1000
    1e72:	00015783          	lhu	a5,0(sp)
    1e76:	02d75733          	divu	a4,a4,a3
    1e7a:	02d787b3          	mul	a5,a5,a3
    1e7e:	97ba                	add	a5,a5,a4
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
    1e8e:	ed15                	bnez	a0,1eca <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e90:	6841                	lui	a6,0x10
    1e92:	963e                	add	a2,a2,a5
    1e94:	187d                	addi	a6,a6,-1
    1e96:	3e800693          	li	a3,1000
    1e9a:	a819                	j	1eb0 <sleep+0x58>
    __asm_syscall("r"(a7))
    1e9c:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1ea0:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ea4:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ea6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea8:	00000073          	ecall
    if (err == 0)
    1eac:	2501                	sext.w	a0,a0
    1eae:	ed11                	bnez	a0,1eca <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1eb0:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1eb2:	07c00893          	li	a7,124
    1eb6:	02d7d733          	divu	a4,a5,a3
    1eba:	6782                	ld	a5,0(sp)
    1ebc:	0107f7b3          	and	a5,a5,a6
    1ec0:	02d787b3          	mul	a5,a5,a3
    1ec4:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1ec6:	fcc7ebe3          	bltu	a5,a2,1e9c <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1eca:	4501                	li	a0,0
    1ecc:	0141                	addi	sp,sp,16
    1ece:	8082                	ret
    1ed0:	57fd                	li	a5,-1
    1ed2:	b77d                	j	1e80 <sleep+0x28>

0000000000001ed4 <set_priority>:
    register long a7 __asm__("a7") = n;
    1ed4:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1ed8:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1edc:	2501                	sext.w	a0,a0
    1ede:	8082                	ret

0000000000001ee0 <mmap>:
    register long a7 __asm__("a7") = n;
    1ee0:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ee4:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1ee8:	2501                	sext.w	a0,a0
    1eea:	8082                	ret

0000000000001eec <munmap>:
    register long a7 __asm__("a7") = n;
    1eec:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef0:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1ef4:	2501                	sext.w	a0,a0
    1ef6:	8082                	ret

0000000000001ef8 <wait>:

int wait(int *code)
{
    1ef8:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1efa:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1efe:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f00:	00000073          	ecall
    return waitpid(-1, code);
}
    1f04:	2501                	sext.w	a0,a0
    1f06:	8082                	ret

0000000000001f08 <spawn>:
    register long a7 __asm__("a7") = n;
    1f08:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1f0c:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f10:	2501                	sext.w	a0,a0
    1f12:	8082                	ret

0000000000001f14 <mailread>:
    register long a7 __asm__("a7") = n;
    1f14:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f18:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f1c:	2501                	sext.w	a0,a0
    1f1e:	8082                	ret

0000000000001f20 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f20:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f24:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f28:	2501                	sext.w	a0,a0
    1f2a:	8082                	ret

0000000000001f2c <fstat>:
    register long a7 __asm__("a7") = n;
    1f2c:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f30:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f34:	2501                	sext.w	a0,a0
    1f36:	8082                	ret

0000000000001f38 <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1f38:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f3a:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f3e:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f40:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f44:	2501                	sext.w	a0,a0
    1f46:	8082                	ret

0000000000001f48 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f48:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f4a:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f4e:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f50:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f54:	2501                	sext.w	a0,a0
    1f56:	8082                	ret

0000000000001f58 <link>:

int link(char *old_path, char *new_path)
{
    1f58:	87aa                	mv	a5,a0
    1f5a:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f5c:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f60:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f64:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f66:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f6a:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f6c:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f70:	2501                	sext.w	a0,a0
    1f72:	8082                	ret

0000000000001f74 <unlink>:

int unlink(char *path)
{
    1f74:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f76:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f7a:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f7e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f80:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f84:	2501                	sext.w	a0,a0
    1f86:	8082                	ret
