
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch2t_write0:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0860006f          	j	1088 <__start_main>

0000000000001006 <r_sp>:
const int STACK_SIZE = 0x1000;

uint64 r_sp()
{
    uint64 sp;
    __asm__ __volatile__("mv %0, sp"
    1006:	850a                	mv	a0,sp
                         : "=r"(sp)::);
    return sp;
}
    1008:	8082                	ret

000000000000100a <stack_top>:
    __asm__ __volatile__("mv %0, sp"
    100a:	878a                	mv	a5,sp
// 注意，这里要求 user_stack 大小为 4096 且按照 4096 字节对齐。
// 请调整你内核中的用户栈的设定。
uint64 stack_top()
{
    uint64 sp = r_sp();
    uint64 top = (sp + STACK_SIZE - 1) & (~(STACK_SIZE - 1));
    100c:	6505                	lui	a0,0x1
    100e:	157d                	addi	a0,a0,-1
    1010:	97aa                	add	a5,a5,a0
    1012:	757d                	lui	a0,0xfffff
    return top;
}
    1014:	8d7d                	and	a0,a0,a5
    1016:	8082                	ret

0000000000001018 <main>:

/// 正确输出：
/// Test write0 OK!

int main()
{
    1018:	1141                	addi	sp,sp,-16
    assert(write(stdout, (const void *)0, 10) == -1);
    101a:	4629                	li	a2,10
    101c:	4581                	li	a1,0
    101e:	4505                	li	a0,1
{
    1020:	e406                	sd	ra,8(sp)
    1022:	e022                	sd	s0,0(sp)
    assert(write(stdout, (const void *)0, 10) == -1);
    1024:	5cb000ef          	jal	ra,1dee <write>
    1028:	57fd                	li	a5,-1
    102a:	00f50563          	beq	a0,a5,1034 <main+0x1c>
    102e:	557d                	li	a0,-1
    1030:	5ed000ef          	jal	ra,1e1c <exit>
    __asm__ __volatile__("mv %0, sp"
    1034:	840a                	mv	s0,sp
    uint64 top = (sp + STACK_SIZE - 1) & (~(STACK_SIZE - 1));
    1036:	6785                	lui	a5,0x1
    1038:	17fd                	addi	a5,a5,-1
    103a:	943e                	add	s0,s0,a5
    103c:	77fd                	lui	a5,0xfffff
    103e:	8c7d                	and	s0,s0,a5
    uint64 top = stack_top(), bottom = top - STACK_SIZE;
    assert(write(stdout, (const void *)(top - 5), 10) == -1);
    1040:	4629                	li	a2,10
    1042:	ffb40593          	addi	a1,s0,-5
    1046:	4505                	li	a0,1
    1048:	5a7000ef          	jal	ra,1dee <write>
    104c:	57fd                	li	a5,-1
    104e:	00f50563          	beq	a0,a5,1058 <main+0x40>
    1052:	557d                	li	a0,-1
    1054:	5c9000ef          	jal	ra,1e1c <exit>
    assert(write(stdout, (const void *)(bottom - 5), 10) == -1);
    1058:	75fd                	lui	a1,0xfffff
    105a:	15ed                	addi	a1,a1,-5
    105c:	4629                	li	a2,10
    105e:	95a2                	add	a1,a1,s0
    1060:	4505                	li	a0,1
    1062:	58d000ef          	jal	ra,1dee <write>
    1066:	57fd                	li	a5,-1
    1068:	00f50563          	beq	a0,a5,1072 <main+0x5a>
    106c:	557d                	li	a0,-1
    106e:	5af000ef          	jal	ra,1e1c <exit>
    puts("Test write0 OK!");
    1072:	00001517          	auipc	a0,0x1
    1076:	f3650513          	addi	a0,a0,-202 # 1fa8 <unlink+0x14>
    107a:	05e000ef          	jal	ra,10d8 <puts>
    return 0;
}
    107e:	60a2                	ld	ra,8(sp)
    1080:	6402                	ld	s0,0(sp)
    1082:	4501                	li	a0,0
    1084:	0141                	addi	sp,sp,16
    1086:	8082                	ret

0000000000001088 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1088:	1141                	addi	sp,sp,-16
    108a:	e406                	sd	ra,8(sp)
    exit(main());
    108c:	f8dff0ef          	jal	ra,1018 <main>
    1090:	58d000ef          	jal	ra,1e1c <exit>
    return 0;
}
    1094:	60a2                	ld	ra,8(sp)
    1096:	4501                	li	a0,0
    1098:	0141                	addi	sp,sp,16
    109a:	8082                	ret

000000000000109c <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    109c:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    109e:	00f10593          	addi	a1,sp,15
    10a2:	4605                	li	a2,1
    10a4:	4501                	li	a0,0
{
    10a6:	ec06                	sd	ra,24(sp)
    char byte = 0;
    10a8:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    10ac:	539000ef          	jal	ra,1de4 <read>
    return byte;
}
    10b0:	60e2                	ld	ra,24(sp)
    10b2:	00f14503          	lbu	a0,15(sp)
    10b6:	6105                	addi	sp,sp,32
    10b8:	8082                	ret

00000000000010ba <putchar>:

int putchar(int c)
{
    10ba:	1101                	addi	sp,sp,-32
    10bc:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    10be:	00f10593          	addi	a1,sp,15
    10c2:	4605                	li	a2,1
    10c4:	4505                	li	a0,1
{
    10c6:	ec06                	sd	ra,24(sp)
    char byte = c;
    10c8:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    10cc:	523000ef          	jal	ra,1dee <write>
}
    10d0:	60e2                	ld	ra,24(sp)
    10d2:	2501                	sext.w	a0,a0
    10d4:	6105                	addi	sp,sp,32
    10d6:	8082                	ret

00000000000010d8 <puts>:

int puts(const char *s)
{
    10d8:	1101                	addi	sp,sp,-32
    10da:	e822                	sd	s0,16(sp)
    10dc:	ec06                	sd	ra,24(sp)
    10de:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    10e0:	145000ef          	jal	ra,1a24 <strlen>
    10e4:	862a                	mv	a2,a0
    10e6:	85a2                	mv	a1,s0
    10e8:	4505                	li	a0,1
    10ea:	505000ef          	jal	ra,1dee <write>
    10ee:	00055763          	bgez	a0,10fc <puts+0x24>
    return r;
}
    10f2:	60e2                	ld	ra,24(sp)
    10f4:	6442                	ld	s0,16(sp)
    10f6:	557d                	li	a0,-1
    10f8:	6105                	addi	sp,sp,32
    10fa:	8082                	ret
    return write(stdout, &byte, 1);
    10fc:	00f10593          	addi	a1,sp,15
    char byte = c;
    1100:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    1102:	4605                	li	a2,1
    1104:	4505                	li	a0,1
    char byte = c;
    1106:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    110a:	4e5000ef          	jal	ra,1dee <write>
}
    110e:	60e2                	ld	ra,24(sp)
    1110:	6442                	ld	s0,16(sp)
    1112:	41f5551b          	sraiw	a0,a0,0x1f
    1116:	6105                	addi	sp,sp,32
    1118:	8082                	ret

000000000000111a <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    111a:	7131                	addi	sp,sp,-192
    111c:	ecce                	sd	s3,88(sp)
    111e:	e8d2                	sd	s4,80(sp)
    1120:	e4d6                	sd	s5,72(sp)
    1122:	e0da                	sd	s6,64(sp)
    1124:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    1126:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1128:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    112a:	6ae1                	lui	s5,0x18
    112c:	000f4a37          	lui	s4,0xf4
    1130:	00989b37          	lui	s6,0x989
{
    1134:	fc86                	sd	ra,120(sp)
    1136:	f8a2                	sd	s0,112(sp)
    1138:	f4a6                	sd	s1,104(sp)
    113a:	f0ca                	sd	s2,96(sp)
    113c:	fc5e                	sd	s7,56(sp)
    113e:	e52e                	sd	a1,136(sp)
    1140:	e932                	sd	a2,144(sp)
    1142:	ed36                	sd	a3,152(sp)
    1144:	f13a                	sd	a4,160(sp)
    1146:	f942                	sd	a6,176(sp)
    1148:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    114a:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    114c:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x72f>
    1150:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x166bf>
    1154:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf225f>
    1158:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x98769f>
    for (;;)
    {
        if (!*s)
    115c:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    1160:	02500913          	li	s2,37
        if (!*s)
    1164:	1a078f63          	beqz	a5,1322 <printf+0x208>
    1168:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    116a:	17278e63          	beq	a5,s2,12e6 <printf+0x1cc>
    116e:	00164783          	lbu	a5,1(a2)
    1172:	0605                	addi	a2,a2,1
    1174:	fbfd                	bnez	a5,116a <printf+0x50>
    1176:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    1178:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    117c:	85aa                	mv	a1,a0
    117e:	8622                	mv	a2,s0
    1180:	4505                	li	a0,1
    1182:	46d000ef          	jal	ra,1dee <write>
        out(f, a, l);
        if (l)
    1186:	18041963          	bnez	s0,1318 <printf+0x1fe>
            continue;
        if (s[1] == 0)
    118a:	0014c783          	lbu	a5,1(s1)
    118e:	18078a63          	beqz	a5,1322 <printf+0x208>
            break;
        switch (s[1])
    1192:	07300713          	li	a4,115
    1196:	28e78e63          	beq	a5,a4,1432 <printf+0x318>
    119a:	18f76f63          	bltu	a4,a5,1338 <printf+0x21e>
    119e:	06400713          	li	a4,100
    11a2:	2ae78c63          	beq	a5,a4,145a <printf+0x340>
    11a6:	07000713          	li	a4,112
    11aa:	3ce79c63          	bne	a5,a4,1582 <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    11ae:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    11b0:	00001797          	auipc	a5,0x1
    11b4:	e3078793          	addi	a5,a5,-464 # 1fe0 <digits>
            printptr(va_arg(ap, uint64));
    11b8:	6298                	ld	a4,0(a3)
    11ba:	00868093          	addi	ra,a3,8
    11be:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    11c0:	00471293          	slli	t0,a4,0x4
    11c4:	00c71f13          	slli	t5,a4,0xc
    11c8:	01471e13          	slli	t3,a4,0x14
    11cc:	01c71893          	slli	a7,a4,0x1c
    11d0:	02471813          	slli	a6,a4,0x24
    11d4:	02871513          	slli	a0,a4,0x28
    11d8:	02c71593          	slli	a1,a4,0x2c
    11dc:	03071693          	slli	a3,a4,0x30
    11e0:	00871f93          	slli	t6,a4,0x8
    11e4:	01071e93          	slli	t4,a4,0x10
    11e8:	01871313          	slli	t1,a4,0x18
    11ec:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    11f0:	03c2d293          	srli	t0,t0,0x3c
    11f4:	03cf5f13          	srli	t5,t5,0x3c
    11f8:	03ce5e13          	srli	t3,t3,0x3c
    11fc:	03c8d893          	srli	a7,a7,0x3c
    1200:	03c85813          	srli	a6,a6,0x3c
    1204:	9171                	srli	a0,a0,0x3c
    1206:	91f1                	srli	a1,a1,0x3c
    1208:	92f1                	srli	a3,a3,0x3c
    120a:	92be                	add	t0,t0,a5
    120c:	9f3e                	add	t5,t5,a5
    120e:	9e3e                	add	t3,t3,a5
    1210:	98be                	add	a7,a7,a5
    1212:	983e                	add	a6,a6,a5
    1214:	953e                	add	a0,a0,a5
    1216:	95be                	add	a1,a1,a5
    1218:	96be                	add	a3,a3,a5
    121a:	03c75393          	srli	t2,a4,0x3c
    121e:	01c75b9b          	srliw	s7,a4,0x1c
    1222:	03cfdf93          	srli	t6,t6,0x3c
    1226:	03cede93          	srli	t4,t4,0x3c
    122a:	03c35313          	srli	t1,t1,0x3c
    122e:	9271                	srli	a2,a2,0x3c
    1230:	0002c403          	lbu	s0,0(t0)
    1234:	93be                	add	t2,t2,a5
    1236:	000f4283          	lbu	t0,0(t5)
    123a:	9fbe                	add	t6,t6,a5
    123c:	000e4f03          	lbu	t5,0(t3)
    1240:	9ebe                	add	t4,t4,a5
    1242:	0008ce03          	lbu	t3,0(a7)
    1246:	933e                	add	t1,t1,a5
    1248:	00084883          	lbu	a7,0(a6)
    124c:	9bbe                	add	s7,s7,a5
    124e:	00054803          	lbu	a6,0(a0)
    1252:	963e                	add	a2,a2,a5
    1254:	0005c503          	lbu	a0,0(a1) # fffffffffffff000 <digits+0xffffffffffffd020>
    1258:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    125c:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1260:	0003c903          	lbu	s2,0(t2)
    1264:	00064603          	lbu	a2,0(a2)
    1268:	000fc383          	lbu	t2,0(t6)
    126c:	8b3d                	andi	a4,a4,15
    126e:	000ecf83          	lbu	t6,0(t4)
    1272:	92f1                	srli	a3,a3,0x3c
    1274:	00034e83          	lbu	t4,0(t1)
    1278:	000bc303          	lbu	t1,0(s7)
    127c:	96be                	add	a3,a3,a5
    127e:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    1280:	7761                	lui	a4,0xffff8
    1282:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1286:	00710623          	sb	t2,12(sp)
    128a:	005106a3          	sb	t0,13(sp)
    128e:	01f10723          	sb	t6,14(sp)
    1292:	01e107a3          	sb	t5,15(sp)
    1296:	01d10823          	sb	t4,16(sp)
    129a:	01c108a3          	sb	t3,17(sp)
    129e:	00610923          	sb	t1,18(sp)
    12a2:	011109a3          	sb	a7,19(sp)
    12a6:	01010a23          	sb	a6,20(sp)
    12aa:	00a10aa3          	sb	a0,21(sp)
    12ae:	00b10b23          	sb	a1,22(sp)
    12b2:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    12b6:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12ba:	01210523          	sb	s2,10(sp)
    12be:	008105a3          	sb	s0,11(sp)
    12c2:	0006c703          	lbu	a4,0(a3)
    12c6:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    12ca:	4649                	li	a2,18
    12cc:	002c                	addi	a1,sp,8
    12ce:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12d0:	00e10c23          	sb	a4,24(sp)
    12d4:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    12d8:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    12dc:	313000ef          	jal	ra,1dee <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    12e0:	00248513          	addi	a0,s1,2
    12e4:	bda5                	j	115c <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    12e6:	00064783          	lbu	a5,0(a2)
    12ea:	84b2                	mv	s1,a2
    12ec:	01278963          	beq	a5,s2,12fe <printf+0x1e4>
    12f0:	b561                	j	1178 <printf+0x5e>
    12f2:	0024c783          	lbu	a5,2(s1)
    12f6:	0605                	addi	a2,a2,1
    12f8:	0489                	addi	s1,s1,2
    12fa:	e7279fe3          	bne	a5,s2,1178 <printf+0x5e>
    12fe:	0014c783          	lbu	a5,1(s1)
    1302:	ff2788e3          	beq	a5,s2,12f2 <printf+0x1d8>
        l = z - a;
    1306:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    130a:	85aa                	mv	a1,a0
    130c:	8622                	mv	a2,s0
    130e:	4505                	li	a0,1
    1310:	2df000ef          	jal	ra,1dee <write>
        if (l)
    1314:	e6040be3          	beqz	s0,118a <printf+0x70>
    1318:	8526                	mv	a0,s1
        if (!*s)
    131a:	00054783          	lbu	a5,0(a0)
    131e:	e40795e3          	bnez	a5,1168 <printf+0x4e>
    }
    va_end(ap);
    1322:	70e6                	ld	ra,120(sp)
    1324:	7446                	ld	s0,112(sp)
    1326:	74a6                	ld	s1,104(sp)
    1328:	7906                	ld	s2,96(sp)
    132a:	69e6                	ld	s3,88(sp)
    132c:	6a46                	ld	s4,80(sp)
    132e:	6aa6                	ld	s5,72(sp)
    1330:	6b06                	ld	s6,64(sp)
    1332:	7be2                	ld	s7,56(sp)
    1334:	6129                	addi	sp,sp,192
    1336:	8082                	ret
        switch (s[1])
    1338:	07800713          	li	a4,120
    133c:	24e79363          	bne	a5,a4,1582 <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    1340:	6782                	ld	a5,0(sp)
    1342:	4394                	lw	a3,0(a5)
    1344:	07a1                	addi	a5,a5,8
    1346:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1348:	2606c263          	bltz	a3,15ac <printf+0x492>
        buf[i--] = digits[x % base];
    134c:	00001797          	auipc	a5,0x1
    1350:	c9478793          	addi	a5,a5,-876 # 1fe0 <digits>
    1354:	00f6f713          	andi	a4,a3,15
    1358:	973e                	add	a4,a4,a5
    135a:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff6020>
    buf[16] = 0;
    135e:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1362:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    1364:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1368:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    136c:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    1370:	0046d51b          	srliw	a0,a3,0x4
    1374:	0ad5d563          	bge	a1,a3,141e <printf+0x304>
        buf[i--] = digits[x % base];
    1378:	8a3d                	andi	a2,a2,15
    137a:	963e                	add	a2,a2,a5
    137c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1380:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    1384:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1388:	30a5fe63          	bgeu	a1,a0,16a4 <printf+0x58a>
        buf[i--] = digits[x % base];
    138c:	00f77613          	andi	a2,a4,15
    1390:	963e                	add	a2,a2,a5
    1392:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1396:	45bd                	li	a1,15
    1398:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    139c:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    13a0:	00475513          	srli	a0,a4,0x4
    13a4:	30e5f963          	bgeu	a1,a4,16b6 <printf+0x59c>
        buf[i--] = digits[x % base];
    13a8:	8a3d                	andi	a2,a2,15
    13aa:	963e                	add	a2,a2,a5
    13ac:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    13b0:	00875893          	srli	a7,a4,0x8
    13b4:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    13b8:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    13bc:	30a5fd63          	bgeu	a1,a0,16d6 <printf+0x5bc>
        buf[i--] = digits[x % base];
    13c0:	8a3d                	andi	a2,a2,15
    13c2:	963e                	add	a2,a2,a5
    13c4:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13c8:	00c75813          	srli	a6,a4,0xc
    13cc:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    13d0:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    13d4:	3315fe63          	bgeu	a1,a7,1710 <printf+0x5f6>
        buf[i--] = digits[x % base];
    13d8:	8a3d                	andi	a2,a2,15
    13da:	963e                	add	a2,a2,a5
    13dc:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13e0:	01075893          	srli	a7,a4,0x10
    13e4:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    13e8:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    13ec:	3305ff63          	bgeu	a1,a6,172a <printf+0x610>
        buf[i--] = digits[x % base];
    13f0:	8a3d                	andi	a2,a2,15
    13f2:	963e                	add	a2,a2,a5
    13f4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    13f8:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    13fc:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1400:	3515f863          	bgeu	a1,a7,1750 <printf+0x636>
        buf[i--] = digits[x % base];
    1404:	97ba                	add	a5,a5,a4
    1406:	0007c783          	lbu	a5,0(a5)
    140a:	45a1                	li	a1,8
    140c:	00f10823          	sb	a5,16(sp)
    if (sign)
    1410:	0006d763          	bgez	a3,141e <printf+0x304>
        buf[i--] = '-';
    1414:	02d00793          	li	a5,45
    1418:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    141c:	459d                	li	a1,7
    write(f, s, l);
    141e:	4641                	li	a2,16
    1420:	003c                	addi	a5,sp,8
    1422:	9e0d                	subw	a2,a2,a1
    1424:	4505                	li	a0,1
    1426:	95be                	add	a1,a1,a5
    1428:	1c7000ef          	jal	ra,1dee <write>
        s += 2;
    142c:	00248513          	addi	a0,s1,2
    1430:	b335                	j	115c <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    1432:	6782                	ld	a5,0(sp)
    1434:	6380                	ld	s0,0(a5)
    1436:	07a1                	addi	a5,a5,8
    1438:	e03e                	sd	a5,0(sp)
    143a:	22040a63          	beqz	s0,166e <printf+0x554>
            l = strnlen(a, 200);
    143e:	0c800593          	li	a1,200
    1442:	8522                	mv	a0,s0
    1444:	6cc000ef          	jal	ra,1b10 <strnlen>
    write(f, s, l);
    1448:	0005061b          	sext.w	a2,a0
    144c:	85a2                	mv	a1,s0
    144e:	4505                	li	a0,1
    1450:	19f000ef          	jal	ra,1dee <write>
        s += 2;
    1454:	00248513          	addi	a0,s1,2
    1458:	b311                	j	115c <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    145a:	6782                	ld	a5,0(sp)
    145c:	4390                	lw	a2,0(a5)
    145e:	07a1                	addi	a5,a5,8
    1460:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1462:	1a064363          	bltz	a2,1608 <printf+0x4ee>
        buf[i--] = digits[x % base];
    1466:	46a9                	li	a3,10
    1468:	02d6773b          	remuw	a4,a2,a3
    146c:	00001797          	auipc	a5,0x1
    1470:	b7478793          	addi	a5,a5,-1164 # 1fe0 <digits>
    buf[16] = 0;
    1474:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1478:	4525                	li	a0,9
        x = xx;
    147a:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    147e:	973e                	add	a4,a4,a5
    1480:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    1484:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    1488:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    148c:	2cc55063          	bge	a0,a2,174c <printf+0x632>
    1490:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1494:	02d5f73b          	remuw	a4,a1,a3
    1498:	1702                	slli	a4,a4,0x20
    149a:	9301                	srli	a4,a4,0x20
    149c:	973e                	add	a4,a4,a5
    149e:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    14a2:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    14a6:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    14aa:	1f057d63          	bgeu	a0,a6,16a4 <printf+0x58a>
        buf[i--] = digits[x % base];
    14ae:	4529                	li	a0,10
    } while ((x /= base) != 0);
    14b0:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    14b2:	02a5f73b          	remuw	a4,a1,a0
    14b6:	973e                	add	a4,a4,a5
    14b8:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    14bc:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    14c0:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    14c4:	1ab6f163          	bgeu	a3,a1,1666 <printf+0x54c>
    14c8:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    14cc:	02a776bb          	remuw	a3,a4,a0
    14d0:	96be                	add	a3,a3,a5
    14d2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14d6:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14da:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    14de:	20b87c63          	bgeu	a6,a1,16f6 <printf+0x5dc>
    14e2:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    14e6:	02a776bb          	remuw	a3,a4,a0
    14ea:	96be                	add	a3,a3,a5
    14ec:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14f0:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14f4:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    14f8:	20b87363          	bgeu	a6,a1,16fe <printf+0x5e4>
        buf[i--] = digits[x % base];
    14fc:	02a776bb          	remuw	a3,a4,a0
    1500:	96be                	add	a3,a3,a5
    1502:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1506:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    150a:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    150e:	20b9f563          	bgeu	s3,a1,1718 <printf+0x5fe>
        buf[i--] = digits[x % base];
    1512:	02a776bb          	remuw	a3,a4,a0
    1516:	96be                	add	a3,a3,a5
    1518:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    151c:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1520:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1524:	20bafb63          	bgeu	s5,a1,173a <printf+0x620>
        buf[i--] = digits[x % base];
    1528:	02a776bb          	remuw	a3,a4,a0
    152c:	96be                	add	a3,a3,a5
    152e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1532:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1536:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    153a:	1eba7c63          	bgeu	s4,a1,1732 <printf+0x618>
        buf[i--] = digits[x % base];
    153e:	02a776bb          	remuw	a3,a4,a0
    1542:	96be                	add	a3,a3,a5
    1544:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1548:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    154c:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1550:	14bb7163          	bgeu	s6,a1,1692 <printf+0x578>
        buf[i--] = digits[x % base];
    1554:	1702                	slli	a4,a4,0x20
    1556:	9301                	srli	a4,a4,0x20
    1558:	97ba                	add	a5,a5,a4
    155a:	0007c783          	lbu	a5,0(a5)
    155e:	4599                	li	a1,6
    1560:	00f10723          	sb	a5,14(sp)
    if (sign)
    1564:	ea065de3          	bgez	a2,141e <printf+0x304>
        buf[i--] = '-';
    1568:	02d00793          	li	a5,45
    156c:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1570:	4595                	li	a1,5
    write(f, s, l);
    1572:	003c                	addi	a5,sp,8
    1574:	4641                	li	a2,16
    1576:	9e0d                	subw	a2,a2,a1
    1578:	4505                	li	a0,1
    157a:	95be                	add	a1,a1,a5
    157c:	073000ef          	jal	ra,1dee <write>
    1580:	b575                	j	142c <printf+0x312>
    char byte = c;
    1582:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1586:	4605                	li	a2,1
    1588:	002c                	addi	a1,sp,8
    158a:	4505                	li	a0,1
    char byte = c;
    158c:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1590:	05f000ef          	jal	ra,1dee <write>
    char byte = c;
    1594:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1598:	4605                	li	a2,1
    159a:	002c                	addi	a1,sp,8
    159c:	4505                	li	a0,1
    char byte = c;
    159e:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15a2:	04d000ef          	jal	ra,1dee <write>
        s += 2;
    15a6:	00248513          	addi	a0,s1,2
    15aa:	be4d                	j	115c <printf+0x42>
        x = -xx;
    15ac:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    15b0:	00001797          	auipc	a5,0x1
    15b4:	a3078793          	addi	a5,a5,-1488 # 1fe0 <digits>
    15b8:	00f77613          	andi	a2,a4,15
    15bc:	963e                	add	a2,a2,a5
    15be:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    15c2:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    15c6:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    15c8:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    15cc:	0047551b          	srliw	a0,a4,0x4
    15d0:	0047561b          	srliw	a2,a4,0x4
    15d4:	0ab6d263          	bge	a3,a1,1678 <printf+0x55e>
        buf[i--] = digits[x % base];
    15d8:	8a3d                	andi	a2,a2,15
    15da:	963e                	add	a2,a2,a5
    15dc:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    15e0:	463d                	li	a2,15
    15e2:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    15e6:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    15ea:	daa661e3          	bltu	a2,a0,138c <printf+0x272>
        buf[i--] = '-';
    15ee:	02d00793          	li	a5,45
    15f2:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    15f6:	45b5                	li	a1,13
    write(f, s, l);
    15f8:	003c                	addi	a5,sp,8
    15fa:	4641                	li	a2,16
    15fc:	9e0d                	subw	a2,a2,a1
    15fe:	4505                	li	a0,1
    1600:	95be                	add	a1,a1,a5
    1602:	7ec000ef          	jal	ra,1dee <write>
    1606:	b51d                	j	142c <printf+0x312>
        x = -xx;
    1608:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    160c:	46a9                	li	a3,10
    160e:	02d875bb          	remuw	a1,a6,a3
    1612:	00001797          	auipc	a5,0x1
    1616:	9ce78793          	addi	a5,a5,-1586 # 1fe0 <digits>
    buf[16] = 0;
    161a:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    161e:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    1620:	95be                	add	a1,a1,a5
    1622:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    1626:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    162a:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    162e:	04a65563          	bge	a2,a0,1678 <printf+0x55e>
    1632:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1636:	02d775bb          	remuw	a1,a4,a3
    163a:	95be                	add	a1,a1,a5
    163c:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    1640:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    1644:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    1648:	fb0573e3          	bgeu	a0,a6,15ee <printf+0x4d4>
        buf[i--] = digits[x % base];
    164c:	4529                	li	a0,10
    } while ((x /= base) != 0);
    164e:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1650:	02a5f73b          	remuw	a4,a1,a0
    1654:	973e                	add	a4,a4,a5
    1656:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    165a:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    165e:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    1662:	e6b6e3e3          	bltu	a3,a1,14c8 <printf+0x3ae>
        buf[i--] = digits[x % base];
    1666:	45b5                	li	a1,13
    if (sign)
    1668:	da065be3          	bgez	a2,141e <printf+0x304>
    166c:	a881                	j	16bc <printf+0x5a2>
                a = "(null)";
    166e:	00001417          	auipc	s0,0x1
    1672:	94a40413          	addi	s0,s0,-1718 # 1fb8 <unlink+0x24>
    1676:	b3e1                	j	143e <printf+0x324>
        buf[i--] = '-';
    1678:	02d00793          	li	a5,45
    167c:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1680:	45b9                	li	a1,14
    write(f, s, l);
    1682:	003c                	addi	a5,sp,8
    1684:	4641                	li	a2,16
    1686:	9e0d                	subw	a2,a2,a1
    1688:	4505                	li	a0,1
    168a:	95be                	add	a1,a1,a5
    168c:	762000ef          	jal	ra,1dee <write>
    1690:	bb71                	j	142c <printf+0x312>
        buf[i--] = digits[x % base];
    1692:	459d                	li	a1,7
    if (sign)
    1694:	d80655e3          	bgez	a2,141e <printf+0x304>
        buf[i--] = '-';
    1698:	02d00793          	li	a5,45
    169c:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    16a0:	4599                	li	a1,6
    16a2:	bbb5                	j	141e <printf+0x304>
    16a4:	45b9                	li	a1,14
    write(f, s, l);
    16a6:	003c                	addi	a5,sp,8
    16a8:	4641                	li	a2,16
    16aa:	9e0d                	subw	a2,a2,a1
    16ac:	4505                	li	a0,1
    16ae:	95be                	add	a1,a1,a5
    16b0:	73e000ef          	jal	ra,1dee <write>
    16b4:	bba5                	j	142c <printf+0x312>
        buf[i--] = digits[x % base];
    16b6:	45b5                	li	a1,13
    if (sign)
    16b8:	d606d3e3          	bgez	a3,141e <printf+0x304>
        buf[i--] = '-';
    16bc:	02d00793          	li	a5,45
    16c0:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    16c4:	45b1                	li	a1,12
    write(f, s, l);
    16c6:	003c                	addi	a5,sp,8
    16c8:	4641                	li	a2,16
    16ca:	9e0d                	subw	a2,a2,a1
    16cc:	4505                	li	a0,1
    16ce:	95be                	add	a1,a1,a5
    16d0:	71e000ef          	jal	ra,1dee <write>
    16d4:	bba1                	j	142c <printf+0x312>
        buf[i--] = digits[x % base];
    16d6:	45b1                	li	a1,12
    if (sign)
    16d8:	d406d3e3          	bgez	a3,141e <printf+0x304>
        buf[i--] = '-';
    16dc:	02d00793          	li	a5,45
    16e0:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    16e4:	45ad                	li	a1,11
    write(f, s, l);
    16e6:	003c                	addi	a5,sp,8
    16e8:	4641                	li	a2,16
    16ea:	9e0d                	subw	a2,a2,a1
    16ec:	4505                	li	a0,1
    16ee:	95be                	add	a1,a1,a5
    16f0:	6fe000ef          	jal	ra,1dee <write>
    16f4:	bb25                	j	142c <printf+0x312>
        buf[i--] = digits[x % base];
    16f6:	45b1                	li	a1,12
    if (sign)
    16f8:	d20653e3          	bgez	a2,141e <printf+0x304>
    16fc:	b7c5                	j	16dc <printf+0x5c2>
        buf[i--] = digits[x % base];
    16fe:	45ad                	li	a1,11
    if (sign)
    1700:	d0065fe3          	bgez	a2,141e <printf+0x304>
        buf[i--] = '-';
    1704:	02d00793          	li	a5,45
    1708:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    170c:	45a9                	li	a1,10
    170e:	bb01                	j	141e <printf+0x304>
    1710:	45ad                	li	a1,11
    if (sign)
    1712:	d006d6e3          	bgez	a3,141e <printf+0x304>
    1716:	b7fd                	j	1704 <printf+0x5ea>
        buf[i--] = digits[x % base];
    1718:	45a9                	li	a1,10
    if (sign)
    171a:	d00652e3          	bgez	a2,141e <printf+0x304>
        buf[i--] = '-';
    171e:	02d00793          	li	a5,45
    1722:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1726:	45a5                	li	a1,9
    1728:	b9dd                	j	141e <printf+0x304>
    172a:	45a9                	li	a1,10
    if (sign)
    172c:	ce06d9e3          	bgez	a3,141e <printf+0x304>
    1730:	b7fd                	j	171e <printf+0x604>
        buf[i--] = digits[x % base];
    1732:	45a1                	li	a1,8
    if (sign)
    1734:	ce0655e3          	bgez	a2,141e <printf+0x304>
    1738:	b9f1                	j	1414 <printf+0x2fa>
        buf[i--] = digits[x % base];
    173a:	45a5                	li	a1,9
    if (sign)
    173c:	ce0651e3          	bgez	a2,141e <printf+0x304>
        buf[i--] = '-';
    1740:	02d00793          	li	a5,45
    1744:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1748:	45a1                	li	a1,8
    174a:	b9d1                	j	141e <printf+0x304>
    i = 15;
    174c:	45bd                	li	a1,15
    174e:	b9c1                	j	141e <printf+0x304>
        buf[i--] = digits[x % base];
    1750:	45a5                	li	a1,9
    if (sign)
    1752:	cc06d6e3          	bgez	a3,141e <printf+0x304>
    1756:	b7ed                	j	1740 <printf+0x626>

0000000000001758 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1758:	02000793          	li	a5,32
    175c:	00f50663          	beq	a0,a5,1768 <isspace+0x10>
    1760:	355d                	addiw	a0,a0,-9
    1762:	00553513          	sltiu	a0,a0,5
    1766:	8082                	ret
    1768:	4505                	li	a0,1
}
    176a:	8082                	ret

000000000000176c <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    176c:	fd05051b          	addiw	a0,a0,-48
}
    1770:	00a53513          	sltiu	a0,a0,10
    1774:	8082                	ret

0000000000001776 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1776:	02000613          	li	a2,32
    177a:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    177c:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1780:	ff77069b          	addiw	a3,a4,-9
    1784:	04c70d63          	beq	a4,a2,17de <atoi+0x68>
    1788:	0007079b          	sext.w	a5,a4
    178c:	04d5f963          	bgeu	a1,a3,17de <atoi+0x68>
        s++;
    switch (*s)
    1790:	02b00693          	li	a3,43
    1794:	04d70a63          	beq	a4,a3,17e8 <atoi+0x72>
    1798:	02d00693          	li	a3,45
    179c:	06d70463          	beq	a4,a3,1804 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    17a0:	fd07859b          	addiw	a1,a5,-48
    17a4:	4625                	li	a2,9
    17a6:	873e                	mv	a4,a5
    17a8:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    17aa:	4e01                	li	t3,0
    while (isdigit(*s))
    17ac:	04b66a63          	bltu	a2,a1,1800 <atoi+0x8a>
    int n = 0, neg = 0;
    17b0:	4501                	li	a0,0
    while (isdigit(*s))
    17b2:	4825                	li	a6,9
    17b4:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    17b8:	0025179b          	slliw	a5,a0,0x2
    17bc:	9d3d                	addw	a0,a0,a5
    17be:	fd07031b          	addiw	t1,a4,-48
    17c2:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    17c6:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    17ca:	0685                	addi	a3,a3,1
    17cc:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    17d0:	0006071b          	sext.w	a4,a2
    17d4:	feb870e3          	bgeu	a6,a1,17b4 <atoi+0x3e>
    return neg ? n : -n;
    17d8:	000e0563          	beqz	t3,17e2 <atoi+0x6c>
}
    17dc:	8082                	ret
        s++;
    17de:	0505                	addi	a0,a0,1
    17e0:	bf71                	j	177c <atoi+0x6>
    17e2:	4113053b          	subw	a0,t1,a7
    17e6:	8082                	ret
    while (isdigit(*s))
    17e8:	00154783          	lbu	a5,1(a0)
    17ec:	4625                	li	a2,9
        s++;
    17ee:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17f2:	fd07859b          	addiw	a1,a5,-48
    17f6:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    17fa:	4e01                	li	t3,0
    while (isdigit(*s))
    17fc:	fab67ae3          	bgeu	a2,a1,17b0 <atoi+0x3a>
    1800:	4501                	li	a0,0
}
    1802:	8082                	ret
    while (isdigit(*s))
    1804:	00154783          	lbu	a5,1(a0)
    1808:	4625                	li	a2,9
        s++;
    180a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    180e:	fd07859b          	addiw	a1,a5,-48
    1812:	0007871b          	sext.w	a4,a5
    1816:	feb665e3          	bltu	a2,a1,1800 <atoi+0x8a>
        neg = 1;
    181a:	4e05                	li	t3,1
    181c:	bf51                	j	17b0 <atoi+0x3a>

000000000000181e <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    181e:	16060d63          	beqz	a2,1998 <memset+0x17a>
    1822:	40a007b3          	neg	a5,a0
    1826:	8b9d                	andi	a5,a5,7
    1828:	00778713          	addi	a4,a5,7
    182c:	482d                	li	a6,11
    182e:	0ff5f593          	andi	a1,a1,255
    1832:	fff60693          	addi	a3,a2,-1
    1836:	17076263          	bltu	a4,a6,199a <memset+0x17c>
    183a:	16e6ea63          	bltu	a3,a4,19ae <memset+0x190>
    183e:	16078563          	beqz	a5,19a8 <memset+0x18a>
    1842:	00b50023          	sb	a1,0(a0)
    1846:	4705                	li	a4,1
    1848:	00150e93          	addi	t4,a0,1
    184c:	14e78c63          	beq	a5,a4,19a4 <memset+0x186>
    1850:	00b500a3          	sb	a1,1(a0)
    1854:	4709                	li	a4,2
    1856:	00250e93          	addi	t4,a0,2
    185a:	14e78d63          	beq	a5,a4,19b4 <memset+0x196>
    185e:	00b50123          	sb	a1,2(a0)
    1862:	470d                	li	a4,3
    1864:	00350e93          	addi	t4,a0,3
    1868:	12e78b63          	beq	a5,a4,199e <memset+0x180>
    186c:	00b501a3          	sb	a1,3(a0)
    1870:	4711                	li	a4,4
    1872:	00450e93          	addi	t4,a0,4
    1876:	14e78163          	beq	a5,a4,19b8 <memset+0x19a>
    187a:	00b50223          	sb	a1,4(a0)
    187e:	4715                	li	a4,5
    1880:	00550e93          	addi	t4,a0,5
    1884:	12e78c63          	beq	a5,a4,19bc <memset+0x19e>
    1888:	00b502a3          	sb	a1,5(a0)
    188c:	471d                	li	a4,7
    188e:	00650e93          	addi	t4,a0,6
    1892:	12e79763          	bne	a5,a4,19c0 <memset+0x1a2>
    1896:	00750e93          	addi	t4,a0,7
    189a:	00b50323          	sb	a1,6(a0)
    189e:	4f1d                	li	t5,7
    18a0:	00859713          	slli	a4,a1,0x8
    18a4:	8f4d                	or	a4,a4,a1
    18a6:	01059e13          	slli	t3,a1,0x10
    18aa:	01c76e33          	or	t3,a4,t3
    18ae:	01859313          	slli	t1,a1,0x18
    18b2:	006e6333          	or	t1,t3,t1
    18b6:	02059893          	slli	a7,a1,0x20
    18ba:	011368b3          	or	a7,t1,a7
    18be:	02859813          	slli	a6,a1,0x28
    18c2:	40f60333          	sub	t1,a2,a5
    18c6:	0108e833          	or	a6,a7,a6
    18ca:	03059693          	slli	a3,a1,0x30
    18ce:	00d866b3          	or	a3,a6,a3
    18d2:	03859713          	slli	a4,a1,0x38
    18d6:	97aa                	add	a5,a5,a0
    18d8:	ff837813          	andi	a6,t1,-8
    18dc:	8f55                	or	a4,a4,a3
    18de:	00f806b3          	add	a3,a6,a5
    18e2:	e398                	sd	a4,0(a5)
    18e4:	07a1                	addi	a5,a5,8
    18e6:	fed79ee3          	bne	a5,a3,18e2 <memset+0xc4>
    18ea:	ff837693          	andi	a3,t1,-8
    18ee:	00de87b3          	add	a5,t4,a3
    18f2:	01e6873b          	addw	a4,a3,t5
    18f6:	0ad30663          	beq	t1,a3,19a2 <memset+0x184>
    18fa:	00b78023          	sb	a1,0(a5)
    18fe:	0017069b          	addiw	a3,a4,1
    1902:	08c6fb63          	bgeu	a3,a2,1998 <memset+0x17a>
    1906:	00b780a3          	sb	a1,1(a5)
    190a:	0027069b          	addiw	a3,a4,2
    190e:	08c6f563          	bgeu	a3,a2,1998 <memset+0x17a>
    1912:	00b78123          	sb	a1,2(a5)
    1916:	0037069b          	addiw	a3,a4,3
    191a:	06c6ff63          	bgeu	a3,a2,1998 <memset+0x17a>
    191e:	00b781a3          	sb	a1,3(a5)
    1922:	0047069b          	addiw	a3,a4,4
    1926:	06c6f963          	bgeu	a3,a2,1998 <memset+0x17a>
    192a:	00b78223          	sb	a1,4(a5)
    192e:	0057069b          	addiw	a3,a4,5
    1932:	06c6f363          	bgeu	a3,a2,1998 <memset+0x17a>
    1936:	00b782a3          	sb	a1,5(a5)
    193a:	0067069b          	addiw	a3,a4,6
    193e:	04c6fd63          	bgeu	a3,a2,1998 <memset+0x17a>
    1942:	00b78323          	sb	a1,6(a5)
    1946:	0077069b          	addiw	a3,a4,7
    194a:	04c6f763          	bgeu	a3,a2,1998 <memset+0x17a>
    194e:	00b783a3          	sb	a1,7(a5)
    1952:	0087069b          	addiw	a3,a4,8
    1956:	04c6f163          	bgeu	a3,a2,1998 <memset+0x17a>
    195a:	00b78423          	sb	a1,8(a5)
    195e:	0097069b          	addiw	a3,a4,9
    1962:	02c6fb63          	bgeu	a3,a2,1998 <memset+0x17a>
    1966:	00b784a3          	sb	a1,9(a5)
    196a:	00a7069b          	addiw	a3,a4,10
    196e:	02c6f563          	bgeu	a3,a2,1998 <memset+0x17a>
    1972:	00b78523          	sb	a1,10(a5)
    1976:	00b7069b          	addiw	a3,a4,11
    197a:	00c6ff63          	bgeu	a3,a2,1998 <memset+0x17a>
    197e:	00b785a3          	sb	a1,11(a5)
    1982:	00c7069b          	addiw	a3,a4,12
    1986:	00c6f963          	bgeu	a3,a2,1998 <memset+0x17a>
    198a:	00b78623          	sb	a1,12(a5)
    198e:	2735                	addiw	a4,a4,13
    1990:	00c77463          	bgeu	a4,a2,1998 <memset+0x17a>
    1994:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1998:	8082                	ret
    199a:	472d                	li	a4,11
    199c:	bd79                	j	183a <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    199e:	4f0d                	li	t5,3
    19a0:	b701                	j	18a0 <memset+0x82>
    19a2:	8082                	ret
    19a4:	4f05                	li	t5,1
    19a6:	bded                	j	18a0 <memset+0x82>
    19a8:	8eaa                	mv	t4,a0
    19aa:	4f01                	li	t5,0
    19ac:	bdd5                	j	18a0 <memset+0x82>
    19ae:	87aa                	mv	a5,a0
    19b0:	4701                	li	a4,0
    19b2:	b7a1                	j	18fa <memset+0xdc>
    19b4:	4f09                	li	t5,2
    19b6:	b5ed                	j	18a0 <memset+0x82>
    19b8:	4f11                	li	t5,4
    19ba:	b5dd                	j	18a0 <memset+0x82>
    19bc:	4f15                	li	t5,5
    19be:	b5cd                	j	18a0 <memset+0x82>
    19c0:	4f19                	li	t5,6
    19c2:	bdf9                	j	18a0 <memset+0x82>

00000000000019c4 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    19c4:	00054783          	lbu	a5,0(a0)
    19c8:	0005c703          	lbu	a4,0(a1)
    19cc:	00e79863          	bne	a5,a4,19dc <strcmp+0x18>
    19d0:	0505                	addi	a0,a0,1
    19d2:	0585                	addi	a1,a1,1
    19d4:	fbe5                	bnez	a5,19c4 <strcmp>
    19d6:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    19d8:	9d19                	subw	a0,a0,a4
    19da:	8082                	ret
    19dc:	0007851b          	sext.w	a0,a5
    19e0:	bfe5                	j	19d8 <strcmp+0x14>

00000000000019e2 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    19e2:	ce05                	beqz	a2,1a1a <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19e4:	00054703          	lbu	a4,0(a0)
    19e8:	0005c783          	lbu	a5,0(a1)
    19ec:	cb0d                	beqz	a4,1a1e <strncmp+0x3c>
    if (!n--)
    19ee:	167d                	addi	a2,a2,-1
    19f0:	00c506b3          	add	a3,a0,a2
    19f4:	a819                	j	1a0a <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19f6:	00a68e63          	beq	a3,a0,1a12 <strncmp+0x30>
    19fa:	0505                	addi	a0,a0,1
    19fc:	00e79b63          	bne	a5,a4,1a12 <strncmp+0x30>
    1a00:	00054703          	lbu	a4,0(a0)
    1a04:	0005c783          	lbu	a5,0(a1)
    1a08:	cb19                	beqz	a4,1a1e <strncmp+0x3c>
    1a0a:	0005c783          	lbu	a5,0(a1)
    1a0e:	0585                	addi	a1,a1,1
    1a10:	f3fd                	bnez	a5,19f6 <strncmp+0x14>
        ;
    return *l - *r;
    1a12:	0007051b          	sext.w	a0,a4
    1a16:	9d1d                	subw	a0,a0,a5
    1a18:	8082                	ret
        return 0;
    1a1a:	4501                	li	a0,0
}
    1a1c:	8082                	ret
    1a1e:	4501                	li	a0,0
    return *l - *r;
    1a20:	9d1d                	subw	a0,a0,a5
    1a22:	8082                	ret

0000000000001a24 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1a24:	00757793          	andi	a5,a0,7
    1a28:	cf89                	beqz	a5,1a42 <strlen+0x1e>
    1a2a:	87aa                	mv	a5,a0
    1a2c:	a029                	j	1a36 <strlen+0x12>
    1a2e:	0785                	addi	a5,a5,1
    1a30:	0077f713          	andi	a4,a5,7
    1a34:	cb01                	beqz	a4,1a44 <strlen+0x20>
        if (!*s)
    1a36:	0007c703          	lbu	a4,0(a5)
    1a3a:	fb75                	bnez	a4,1a2e <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1a3c:	40a78533          	sub	a0,a5,a0
}
    1a40:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1a42:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1a44:	6394                	ld	a3,0(a5)
    1a46:	00000597          	auipc	a1,0x0
    1a4a:	5825b583          	ld	a1,1410(a1) # 1fc8 <STACK_SIZE+0x8>
    1a4e:	00000617          	auipc	a2,0x0
    1a52:	58263603          	ld	a2,1410(a2) # 1fd0 <STACK_SIZE+0x10>
    1a56:	a019                	j	1a5c <strlen+0x38>
    1a58:	6794                	ld	a3,8(a5)
    1a5a:	07a1                	addi	a5,a5,8
    1a5c:	00b68733          	add	a4,a3,a1
    1a60:	fff6c693          	not	a3,a3
    1a64:	8f75                	and	a4,a4,a3
    1a66:	8f71                	and	a4,a4,a2
    1a68:	db65                	beqz	a4,1a58 <strlen+0x34>
    for (; *s; s++)
    1a6a:	0007c703          	lbu	a4,0(a5)
    1a6e:	d779                	beqz	a4,1a3c <strlen+0x18>
    1a70:	0017c703          	lbu	a4,1(a5)
    1a74:	0785                	addi	a5,a5,1
    1a76:	d379                	beqz	a4,1a3c <strlen+0x18>
    1a78:	0017c703          	lbu	a4,1(a5)
    1a7c:	0785                	addi	a5,a5,1
    1a7e:	fb6d                	bnez	a4,1a70 <strlen+0x4c>
    1a80:	bf75                	j	1a3c <strlen+0x18>

0000000000001a82 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a82:	00757713          	andi	a4,a0,7
{
    1a86:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1a88:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a8c:	cb19                	beqz	a4,1aa2 <memchr+0x20>
    1a8e:	ce25                	beqz	a2,1b06 <memchr+0x84>
    1a90:	0007c703          	lbu	a4,0(a5)
    1a94:	04b70e63          	beq	a4,a1,1af0 <memchr+0x6e>
    1a98:	0785                	addi	a5,a5,1
    1a9a:	0077f713          	andi	a4,a5,7
    1a9e:	167d                	addi	a2,a2,-1
    1aa0:	f77d                	bnez	a4,1a8e <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1aa2:	4501                	li	a0,0
    if (n && *s != c)
    1aa4:	c235                	beqz	a2,1b08 <memchr+0x86>
    1aa6:	0007c703          	lbu	a4,0(a5)
    1aaa:	04b70363          	beq	a4,a1,1af0 <memchr+0x6e>
        size_t k = ONES * c;
    1aae:	00000517          	auipc	a0,0x0
    1ab2:	52a53503          	ld	a0,1322(a0) # 1fd8 <STACK_SIZE+0x18>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1ab6:	471d                	li	a4,7
        size_t k = ONES * c;
    1ab8:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1abc:	02c77a63          	bgeu	a4,a2,1af0 <memchr+0x6e>
    1ac0:	00000897          	auipc	a7,0x0
    1ac4:	5088b883          	ld	a7,1288(a7) # 1fc8 <STACK_SIZE+0x8>
    1ac8:	00000817          	auipc	a6,0x0
    1acc:	50883803          	ld	a6,1288(a6) # 1fd0 <STACK_SIZE+0x10>
    1ad0:	431d                	li	t1,7
    1ad2:	a029                	j	1adc <memchr+0x5a>
    1ad4:	1661                	addi	a2,a2,-8
    1ad6:	07a1                	addi	a5,a5,8
    1ad8:	02c37963          	bgeu	t1,a2,1b0a <memchr+0x88>
    1adc:	6398                	ld	a4,0(a5)
    1ade:	8f29                	xor	a4,a4,a0
    1ae0:	011706b3          	add	a3,a4,a7
    1ae4:	fff74713          	not	a4,a4
    1ae8:	8f75                	and	a4,a4,a3
    1aea:	01077733          	and	a4,a4,a6
    1aee:	d37d                	beqz	a4,1ad4 <memchr+0x52>
    1af0:	853e                	mv	a0,a5
    1af2:	97b2                	add	a5,a5,a2
    1af4:	a021                	j	1afc <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1af6:	0505                	addi	a0,a0,1
    1af8:	00f50763          	beq	a0,a5,1b06 <memchr+0x84>
    1afc:	00054703          	lbu	a4,0(a0)
    1b00:	feb71be3          	bne	a4,a1,1af6 <memchr+0x74>
    1b04:	8082                	ret
    return n ? (void *)s : 0;
    1b06:	4501                	li	a0,0
}
    1b08:	8082                	ret
    return n ? (void *)s : 0;
    1b0a:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1b0c:	f275                	bnez	a2,1af0 <memchr+0x6e>
}
    1b0e:	8082                	ret

0000000000001b10 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1b10:	1101                	addi	sp,sp,-32
    1b12:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1b14:	862e                	mv	a2,a1
{
    1b16:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1b18:	4581                	li	a1,0
{
    1b1a:	e426                	sd	s1,8(sp)
    1b1c:	ec06                	sd	ra,24(sp)
    1b1e:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1b20:	f63ff0ef          	jal	ra,1a82 <memchr>
    return p ? p - s : n;
    1b24:	c519                	beqz	a0,1b32 <strnlen+0x22>
}
    1b26:	60e2                	ld	ra,24(sp)
    1b28:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1b2a:	8d05                	sub	a0,a0,s1
}
    1b2c:	64a2                	ld	s1,8(sp)
    1b2e:	6105                	addi	sp,sp,32
    1b30:	8082                	ret
    1b32:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1b34:	8522                	mv	a0,s0
}
    1b36:	6442                	ld	s0,16(sp)
    1b38:	64a2                	ld	s1,8(sp)
    1b3a:	6105                	addi	sp,sp,32
    1b3c:	8082                	ret

0000000000001b3e <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1b3e:	00b547b3          	xor	a5,a0,a1
    1b42:	8b9d                	andi	a5,a5,7
    1b44:	eb95                	bnez	a5,1b78 <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1b46:	0075f793          	andi	a5,a1,7
    1b4a:	e7b1                	bnez	a5,1b96 <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1b4c:	6198                	ld	a4,0(a1)
    1b4e:	00000617          	auipc	a2,0x0
    1b52:	47a63603          	ld	a2,1146(a2) # 1fc8 <STACK_SIZE+0x8>
    1b56:	00000817          	auipc	a6,0x0
    1b5a:	47a83803          	ld	a6,1146(a6) # 1fd0 <STACK_SIZE+0x10>
    1b5e:	a029                	j	1b68 <stpcpy+0x2a>
    1b60:	e118                	sd	a4,0(a0)
    1b62:	6598                	ld	a4,8(a1)
    1b64:	05a1                	addi	a1,a1,8
    1b66:	0521                	addi	a0,a0,8
    1b68:	00c707b3          	add	a5,a4,a2
    1b6c:	fff74693          	not	a3,a4
    1b70:	8ff5                	and	a5,a5,a3
    1b72:	0107f7b3          	and	a5,a5,a6
    1b76:	d7ed                	beqz	a5,1b60 <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b78:	0005c783          	lbu	a5,0(a1)
    1b7c:	00f50023          	sb	a5,0(a0)
    1b80:	c785                	beqz	a5,1ba8 <stpcpy+0x6a>
    1b82:	0015c783          	lbu	a5,1(a1)
    1b86:	0505                	addi	a0,a0,1
    1b88:	0585                	addi	a1,a1,1
    1b8a:	00f50023          	sb	a5,0(a0)
    1b8e:	fbf5                	bnez	a5,1b82 <stpcpy+0x44>
        ;
    return d;
}
    1b90:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1b92:	0505                	addi	a0,a0,1
    1b94:	df45                	beqz	a4,1b4c <stpcpy+0xe>
            if (!(*d = *s))
    1b96:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1b9a:	0585                	addi	a1,a1,1
    1b9c:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1ba0:	00f50023          	sb	a5,0(a0)
    1ba4:	f7fd                	bnez	a5,1b92 <stpcpy+0x54>
}
    1ba6:	8082                	ret
    1ba8:	8082                	ret

0000000000001baa <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1baa:	00b547b3          	xor	a5,a0,a1
    1bae:	8b9d                	andi	a5,a5,7
    1bb0:	1a079863          	bnez	a5,1d60 <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1bb4:	0075f793          	andi	a5,a1,7
    1bb8:	16078463          	beqz	a5,1d20 <stpncpy+0x176>
    1bbc:	ea01                	bnez	a2,1bcc <stpncpy+0x22>
    1bbe:	a421                	j	1dc6 <stpncpy+0x21c>
    1bc0:	167d                	addi	a2,a2,-1
    1bc2:	0505                	addi	a0,a0,1
    1bc4:	14070e63          	beqz	a4,1d20 <stpncpy+0x176>
    1bc8:	1a060863          	beqz	a2,1d78 <stpncpy+0x1ce>
    1bcc:	0005c783          	lbu	a5,0(a1)
    1bd0:	0585                	addi	a1,a1,1
    1bd2:	0075f713          	andi	a4,a1,7
    1bd6:	00f50023          	sb	a5,0(a0)
    1bda:	f3fd                	bnez	a5,1bc0 <stpncpy+0x16>
    1bdc:	4805                	li	a6,1
    1bde:	1a061863          	bnez	a2,1d8e <stpncpy+0x1e4>
    1be2:	40a007b3          	neg	a5,a0
    1be6:	8b9d                	andi	a5,a5,7
    1be8:	4681                	li	a3,0
    1bea:	18061a63          	bnez	a2,1d7e <stpncpy+0x1d4>
    1bee:	00778713          	addi	a4,a5,7
    1bf2:	45ad                	li	a1,11
    1bf4:	18b76363          	bltu	a4,a1,1d7a <stpncpy+0x1d0>
    1bf8:	1ae6eb63          	bltu	a3,a4,1dae <stpncpy+0x204>
    1bfc:	1a078363          	beqz	a5,1da2 <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c00:	00050023          	sb	zero,0(a0)
    1c04:	4685                	li	a3,1
    1c06:	00150713          	addi	a4,a0,1
    1c0a:	18d78f63          	beq	a5,a3,1da8 <stpncpy+0x1fe>
    1c0e:	000500a3          	sb	zero,1(a0)
    1c12:	4689                	li	a3,2
    1c14:	00250713          	addi	a4,a0,2
    1c18:	18d78e63          	beq	a5,a3,1db4 <stpncpy+0x20a>
    1c1c:	00050123          	sb	zero,2(a0)
    1c20:	468d                	li	a3,3
    1c22:	00350713          	addi	a4,a0,3
    1c26:	16d78c63          	beq	a5,a3,1d9e <stpncpy+0x1f4>
    1c2a:	000501a3          	sb	zero,3(a0)
    1c2e:	4691                	li	a3,4
    1c30:	00450713          	addi	a4,a0,4
    1c34:	18d78263          	beq	a5,a3,1db8 <stpncpy+0x20e>
    1c38:	00050223          	sb	zero,4(a0)
    1c3c:	4695                	li	a3,5
    1c3e:	00550713          	addi	a4,a0,5
    1c42:	16d78d63          	beq	a5,a3,1dbc <stpncpy+0x212>
    1c46:	000502a3          	sb	zero,5(a0)
    1c4a:	469d                	li	a3,7
    1c4c:	00650713          	addi	a4,a0,6
    1c50:	16d79863          	bne	a5,a3,1dc0 <stpncpy+0x216>
    1c54:	00750713          	addi	a4,a0,7
    1c58:	00050323          	sb	zero,6(a0)
    1c5c:	40f80833          	sub	a6,a6,a5
    1c60:	ff887593          	andi	a1,a6,-8
    1c64:	97aa                	add	a5,a5,a0
    1c66:	95be                	add	a1,a1,a5
    1c68:	0007b023          	sd	zero,0(a5)
    1c6c:	07a1                	addi	a5,a5,8
    1c6e:	feb79de3          	bne	a5,a1,1c68 <stpncpy+0xbe>
    1c72:	ff887593          	andi	a1,a6,-8
    1c76:	9ead                	addw	a3,a3,a1
    1c78:	00b707b3          	add	a5,a4,a1
    1c7c:	12b80863          	beq	a6,a1,1dac <stpncpy+0x202>
    1c80:	00078023          	sb	zero,0(a5)
    1c84:	0016871b          	addiw	a4,a3,1
    1c88:	0ec77863          	bgeu	a4,a2,1d78 <stpncpy+0x1ce>
    1c8c:	000780a3          	sb	zero,1(a5)
    1c90:	0026871b          	addiw	a4,a3,2
    1c94:	0ec77263          	bgeu	a4,a2,1d78 <stpncpy+0x1ce>
    1c98:	00078123          	sb	zero,2(a5)
    1c9c:	0036871b          	addiw	a4,a3,3
    1ca0:	0cc77c63          	bgeu	a4,a2,1d78 <stpncpy+0x1ce>
    1ca4:	000781a3          	sb	zero,3(a5)
    1ca8:	0046871b          	addiw	a4,a3,4
    1cac:	0cc77663          	bgeu	a4,a2,1d78 <stpncpy+0x1ce>
    1cb0:	00078223          	sb	zero,4(a5)
    1cb4:	0056871b          	addiw	a4,a3,5
    1cb8:	0cc77063          	bgeu	a4,a2,1d78 <stpncpy+0x1ce>
    1cbc:	000782a3          	sb	zero,5(a5)
    1cc0:	0066871b          	addiw	a4,a3,6
    1cc4:	0ac77a63          	bgeu	a4,a2,1d78 <stpncpy+0x1ce>
    1cc8:	00078323          	sb	zero,6(a5)
    1ccc:	0076871b          	addiw	a4,a3,7
    1cd0:	0ac77463          	bgeu	a4,a2,1d78 <stpncpy+0x1ce>
    1cd4:	000783a3          	sb	zero,7(a5)
    1cd8:	0086871b          	addiw	a4,a3,8
    1cdc:	08c77e63          	bgeu	a4,a2,1d78 <stpncpy+0x1ce>
    1ce0:	00078423          	sb	zero,8(a5)
    1ce4:	0096871b          	addiw	a4,a3,9
    1ce8:	08c77863          	bgeu	a4,a2,1d78 <stpncpy+0x1ce>
    1cec:	000784a3          	sb	zero,9(a5)
    1cf0:	00a6871b          	addiw	a4,a3,10
    1cf4:	08c77263          	bgeu	a4,a2,1d78 <stpncpy+0x1ce>
    1cf8:	00078523          	sb	zero,10(a5)
    1cfc:	00b6871b          	addiw	a4,a3,11
    1d00:	06c77c63          	bgeu	a4,a2,1d78 <stpncpy+0x1ce>
    1d04:	000785a3          	sb	zero,11(a5)
    1d08:	00c6871b          	addiw	a4,a3,12
    1d0c:	06c77663          	bgeu	a4,a2,1d78 <stpncpy+0x1ce>
    1d10:	00078623          	sb	zero,12(a5)
    1d14:	26b5                	addiw	a3,a3,13
    1d16:	06c6f163          	bgeu	a3,a2,1d78 <stpncpy+0x1ce>
    1d1a:	000786a3          	sb	zero,13(a5)
    1d1e:	8082                	ret
            ;
        if (!n || !*s)
    1d20:	c645                	beqz	a2,1dc8 <stpncpy+0x21e>
    1d22:	0005c783          	lbu	a5,0(a1)
    1d26:	ea078be3          	beqz	a5,1bdc <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d2a:	479d                	li	a5,7
    1d2c:	02c7ff63          	bgeu	a5,a2,1d6a <stpncpy+0x1c0>
    1d30:	00000897          	auipc	a7,0x0
    1d34:	2988b883          	ld	a7,664(a7) # 1fc8 <STACK_SIZE+0x8>
    1d38:	00000817          	auipc	a6,0x0
    1d3c:	29883803          	ld	a6,664(a6) # 1fd0 <STACK_SIZE+0x10>
    1d40:	431d                	li	t1,7
    1d42:	6198                	ld	a4,0(a1)
    1d44:	011707b3          	add	a5,a4,a7
    1d48:	fff74693          	not	a3,a4
    1d4c:	8ff5                	and	a5,a5,a3
    1d4e:	0107f7b3          	and	a5,a5,a6
    1d52:	ef81                	bnez	a5,1d6a <stpncpy+0x1c0>
            *wd = *ws;
    1d54:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d56:	1661                	addi	a2,a2,-8
    1d58:	05a1                	addi	a1,a1,8
    1d5a:	0521                	addi	a0,a0,8
    1d5c:	fec363e3          	bltu	t1,a2,1d42 <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1d60:	e609                	bnez	a2,1d6a <stpncpy+0x1c0>
    1d62:	a08d                	j	1dc4 <stpncpy+0x21a>
    1d64:	167d                	addi	a2,a2,-1
    1d66:	0505                	addi	a0,a0,1
    1d68:	ca01                	beqz	a2,1d78 <stpncpy+0x1ce>
    1d6a:	0005c783          	lbu	a5,0(a1)
    1d6e:	0585                	addi	a1,a1,1
    1d70:	00f50023          	sb	a5,0(a0)
    1d74:	fbe5                	bnez	a5,1d64 <stpncpy+0x1ba>
        ;
tail:
    1d76:	b59d                	j	1bdc <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1d78:	8082                	ret
    1d7a:	472d                	li	a4,11
    1d7c:	bdb5                	j	1bf8 <stpncpy+0x4e>
    1d7e:	00778713          	addi	a4,a5,7
    1d82:	45ad                	li	a1,11
    1d84:	fff60693          	addi	a3,a2,-1
    1d88:	e6b778e3          	bgeu	a4,a1,1bf8 <stpncpy+0x4e>
    1d8c:	b7fd                	j	1d7a <stpncpy+0x1d0>
    1d8e:	40a007b3          	neg	a5,a0
    1d92:	8832                	mv	a6,a2
    1d94:	8b9d                	andi	a5,a5,7
    1d96:	4681                	li	a3,0
    1d98:	e4060be3          	beqz	a2,1bee <stpncpy+0x44>
    1d9c:	b7cd                	j	1d7e <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d9e:	468d                	li	a3,3
    1da0:	bd75                	j	1c5c <stpncpy+0xb2>
    1da2:	872a                	mv	a4,a0
    1da4:	4681                	li	a3,0
    1da6:	bd5d                	j	1c5c <stpncpy+0xb2>
    1da8:	4685                	li	a3,1
    1daa:	bd4d                	j	1c5c <stpncpy+0xb2>
    1dac:	8082                	ret
    1dae:	87aa                	mv	a5,a0
    1db0:	4681                	li	a3,0
    1db2:	b5f9                	j	1c80 <stpncpy+0xd6>
    1db4:	4689                	li	a3,2
    1db6:	b55d                	j	1c5c <stpncpy+0xb2>
    1db8:	4691                	li	a3,4
    1dba:	b54d                	j	1c5c <stpncpy+0xb2>
    1dbc:	4695                	li	a3,5
    1dbe:	bd79                	j	1c5c <stpncpy+0xb2>
    1dc0:	4699                	li	a3,6
    1dc2:	bd69                	j	1c5c <stpncpy+0xb2>
    1dc4:	8082                	ret
    1dc6:	8082                	ret
    1dc8:	8082                	ret

0000000000001dca <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1dca:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1dce:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd0:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1dd4:	2501                	sext.w	a0,a0
    1dd6:	8082                	ret

0000000000001dd8 <close>:
    register long a7 __asm__("a7") = n;
    1dd8:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1ddc:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1de0:	2501                	sext.w	a0,a0
    1de2:	8082                	ret

0000000000001de4 <read>:
    register long a7 __asm__("a7") = n;
    1de4:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de8:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1dec:	8082                	ret

0000000000001dee <write>:
    register long a7 __asm__("a7") = n;
    1dee:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df2:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1df6:	8082                	ret

0000000000001df8 <getpid>:
    register long a7 __asm__("a7") = n;
    1df8:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1dfc:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1e00:	2501                	sext.w	a0,a0
    1e02:	8082                	ret

0000000000001e04 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1e04:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1e08:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1e0c:	2501                	sext.w	a0,a0
    1e0e:	8082                	ret

0000000000001e10 <fork>:
    register long a7 __asm__("a7") = n;
    1e10:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1e14:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1e18:	2501                	sext.w	a0,a0
    1e1a:	8082                	ret

0000000000001e1c <exit>:
    register long a7 __asm__("a7") = n;
    1e1c:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e20:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e24:	8082                	ret

0000000000001e26 <waitpid>:
    register long a7 __asm__("a7") = n;
    1e26:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e2a:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1e2e:	2501                	sext.w	a0,a0
    1e30:	8082                	ret

0000000000001e32 <exec>:
    register long a7 __asm__("a7") = n;
    1e32:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e36:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e3a:	2501                	sext.w	a0,a0
    1e3c:	8082                	ret

0000000000001e3e <get_time>:

int64 get_time()
{
    1e3e:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e40:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e44:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e46:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e48:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e4c:	2501                	sext.w	a0,a0
    1e4e:	ed09                	bnez	a0,1e68 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e50:	67a2                	ld	a5,8(sp)
    1e52:	3e800713          	li	a4,1000
    1e56:	00015503          	lhu	a0,0(sp)
    1e5a:	02e7d7b3          	divu	a5,a5,a4
    1e5e:	02e50533          	mul	a0,a0,a4
    1e62:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e64:	0141                	addi	sp,sp,16
    1e66:	8082                	ret
        return -1;
    1e68:	557d                	li	a0,-1
    1e6a:	bfed                	j	1e64 <get_time+0x26>

0000000000001e6c <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e6c:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e70:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e74:	2501                	sext.w	a0,a0
    1e76:	8082                	ret

0000000000001e78 <sleep>:

int sleep(unsigned long long time)
{
    1e78:	1141                	addi	sp,sp,-16
    1e7a:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1e7c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e80:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e82:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e84:	00000073          	ecall
    if (err == 0)
    1e88:	2501                	sext.w	a0,a0
    1e8a:	e13d                	bnez	a0,1ef0 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e8c:	6722                	ld	a4,8(sp)
    1e8e:	3e800693          	li	a3,1000
    1e92:	00015783          	lhu	a5,0(sp)
    1e96:	02d75733          	divu	a4,a4,a3
    1e9a:	02d787b3          	mul	a5,a5,a3
    1e9e:	97ba                	add	a5,a5,a4
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
    1eae:	ed15                	bnez	a0,1eea <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1eb0:	6841                	lui	a6,0x10
    1eb2:	963e                	add	a2,a2,a5
    1eb4:	187d                	addi	a6,a6,-1
    1eb6:	3e800693          	li	a3,1000
    1eba:	a819                	j	1ed0 <sleep+0x58>
    __asm_syscall("r"(a7))
    1ebc:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1ec0:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ec4:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ec6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec8:	00000073          	ecall
    if (err == 0)
    1ecc:	2501                	sext.w	a0,a0
    1ece:	ed11                	bnez	a0,1eea <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ed0:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1ed2:	07c00893          	li	a7,124
    1ed6:	02d7d733          	divu	a4,a5,a3
    1eda:	6782                	ld	a5,0(sp)
    1edc:	0107f7b3          	and	a5,a5,a6
    1ee0:	02d787b3          	mul	a5,a5,a3
    1ee4:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1ee6:	fcc7ebe3          	bltu	a5,a2,1ebc <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1eea:	4501                	li	a0,0
    1eec:	0141                	addi	sp,sp,16
    1eee:	8082                	ret
    1ef0:	57fd                	li	a5,-1
    1ef2:	b77d                	j	1ea0 <sleep+0x28>

0000000000001ef4 <set_priority>:
    register long a7 __asm__("a7") = n;
    1ef4:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1ef8:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1efc:	2501                	sext.w	a0,a0
    1efe:	8082                	ret

0000000000001f00 <mmap>:
    register long a7 __asm__("a7") = n;
    1f00:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f04:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1f08:	2501                	sext.w	a0,a0
    1f0a:	8082                	ret

0000000000001f0c <munmap>:
    register long a7 __asm__("a7") = n;
    1f0c:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f10:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1f14:	2501                	sext.w	a0,a0
    1f16:	8082                	ret

0000000000001f18 <wait>:

int wait(int *code)
{
    1f18:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f1a:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1f1e:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f20:	00000073          	ecall
    return waitpid(-1, code);
}
    1f24:	2501                	sext.w	a0,a0
    1f26:	8082                	ret

0000000000001f28 <spawn>:
    register long a7 __asm__("a7") = n;
    1f28:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1f2c:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f30:	2501                	sext.w	a0,a0
    1f32:	8082                	ret

0000000000001f34 <mailread>:
    register long a7 __asm__("a7") = n;
    1f34:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f38:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f3c:	2501                	sext.w	a0,a0
    1f3e:	8082                	ret

0000000000001f40 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f40:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f44:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f48:	2501                	sext.w	a0,a0
    1f4a:	8082                	ret

0000000000001f4c <fstat>:
    register long a7 __asm__("a7") = n;
    1f4c:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f50:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f54:	2501                	sext.w	a0,a0
    1f56:	8082                	ret

0000000000001f58 <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1f58:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f5a:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f5e:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f60:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f64:	2501                	sext.w	a0,a0
    1f66:	8082                	ret

0000000000001f68 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f68:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f6a:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f6e:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f70:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f74:	2501                	sext.w	a0,a0
    1f76:	8082                	ret

0000000000001f78 <link>:

int link(char *old_path, char *new_path)
{
    1f78:	87aa                	mv	a5,a0
    1f7a:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f7c:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f80:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f84:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f86:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f8a:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f8c:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f90:	2501                	sext.w	a0,a0
    1f92:	8082                	ret

0000000000001f94 <unlink>:

int unlink(char *path)
{
    1f94:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f96:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f9a:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f9e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fa0:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1fa4:	2501                	sext.w	a0,a0
    1fa6:	8082                	ret
