
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch4_mmap0:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	06e0006f          	j	1070 <__start_main>

0000000000001006 <main>:
/*
理想结果：输出 Test 04_1 OK!
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
    1016:	6d3000ef          	jal	ra,1ee8 <mmap>
    101a:	6785                	lui	a5,0x1
    101c:	00f50563          	beq	a0,a5,1026 <main+0x20>
    1020:	557d                	li	a0,-1
    1022:	5e3000ef          	jal	ra,1e04 <exit>
{
    1026:	100007b7          	lui	a5,0x10000
    for (uint64 i = start; i < (start + len); ++i)
    102a:	10001737          	lui	a4,0x10001
    {
        uint8 *addr = (uint8 *)i;
        *addr = (uint8)i;
    102e:	00f78023          	sb	a5,0(a5) # 10000000 <digits+0xfffe040>
    for (uint64 i = start; i < (start + len); ++i)
    1032:	0785                	addi	a5,a5,1
    1034:	fee79de3          	bne	a5,a4,102e <main+0x28>
    }
    for (uint64 i = start; i < (start + len); ++i)
    1038:	10000437          	lui	s0,0x10000
    103c:	100014b7          	lui	s1,0x10001
    {
        uint8 *addr = (uint8 *)i;
        assert(*addr == (uint8)i);
    1040:	00044703          	lbu	a4,0(s0) # 10000000 <digits+0xfffe040>
    1044:	0ff47793          	andi	a5,s0,255
    1048:	557d                	li	a0,-1
    for (uint64 i = start; i < (start + len); ++i)
    104a:	0405                	addi	s0,s0,1
        assert(*addr == (uint8)i);
    104c:	00f70463          	beq	a4,a5,1054 <main+0x4e>
    1050:	5b5000ef          	jal	ra,1e04 <exit>
    for (uint64 i = start; i < (start + len); ++i)
    1054:	fe9416e3          	bne	s0,s1,1040 <main+0x3a>
    }
    puts("Test 04_1 OK!");
    1058:	00001517          	auipc	a0,0x1
    105c:	f3850513          	addi	a0,a0,-200 # 1f90 <unlink+0x14>
    1060:	060000ef          	jal	ra,10c0 <puts>
    return 0;
    1064:	60e2                	ld	ra,24(sp)
    1066:	6442                	ld	s0,16(sp)
    1068:	64a2                	ld	s1,8(sp)
    106a:	4501                	li	a0,0
    106c:	6105                	addi	sp,sp,32
    106e:	8082                	ret

0000000000001070 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1070:	1141                	addi	sp,sp,-16
    1072:	e406                	sd	ra,8(sp)
    exit(main());
    1074:	f93ff0ef          	jal	ra,1006 <main>
    1078:	58d000ef          	jal	ra,1e04 <exit>
    return 0;
}
    107c:	60a2                	ld	ra,8(sp)
    107e:	4501                	li	a0,0
    1080:	0141                	addi	sp,sp,16
    1082:	8082                	ret

0000000000001084 <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    1084:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    1086:	00f10593          	addi	a1,sp,15
    108a:	4605                	li	a2,1
    108c:	4501                	li	a0,0
{
    108e:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1090:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1094:	539000ef          	jal	ra,1dcc <read>
    return byte;
}
    1098:	60e2                	ld	ra,24(sp)
    109a:	00f14503          	lbu	a0,15(sp)
    109e:	6105                	addi	sp,sp,32
    10a0:	8082                	ret

00000000000010a2 <putchar>:

int putchar(int c)
{
    10a2:	1101                	addi	sp,sp,-32
    10a4:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    10a6:	00f10593          	addi	a1,sp,15
    10aa:	4605                	li	a2,1
    10ac:	4505                	li	a0,1
{
    10ae:	ec06                	sd	ra,24(sp)
    char byte = c;
    10b0:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    10b4:	523000ef          	jal	ra,1dd6 <write>
}
    10b8:	60e2                	ld	ra,24(sp)
    10ba:	2501                	sext.w	a0,a0
    10bc:	6105                	addi	sp,sp,32
    10be:	8082                	ret

00000000000010c0 <puts>:

int puts(const char *s)
{
    10c0:	1101                	addi	sp,sp,-32
    10c2:	e822                	sd	s0,16(sp)
    10c4:	ec06                	sd	ra,24(sp)
    10c6:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    10c8:	145000ef          	jal	ra,1a0c <strlen>
    10cc:	862a                	mv	a2,a0
    10ce:	85a2                	mv	a1,s0
    10d0:	4505                	li	a0,1
    10d2:	505000ef          	jal	ra,1dd6 <write>
    10d6:	00055763          	bgez	a0,10e4 <puts+0x24>
    return r;
}
    10da:	60e2                	ld	ra,24(sp)
    10dc:	6442                	ld	s0,16(sp)
    10de:	557d                	li	a0,-1
    10e0:	6105                	addi	sp,sp,32
    10e2:	8082                	ret
    return write(stdout, &byte, 1);
    10e4:	00f10593          	addi	a1,sp,15
    char byte = c;
    10e8:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    10ea:	4605                	li	a2,1
    10ec:	4505                	li	a0,1
    char byte = c;
    10ee:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    10f2:	4e5000ef          	jal	ra,1dd6 <write>
}
    10f6:	60e2                	ld	ra,24(sp)
    10f8:	6442                	ld	s0,16(sp)
    10fa:	41f5551b          	sraiw	a0,a0,0x1f
    10fe:	6105                	addi	sp,sp,32
    1100:	8082                	ret

0000000000001102 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1102:	7131                	addi	sp,sp,-192
    1104:	ecce                	sd	s3,88(sp)
    1106:	e8d2                	sd	s4,80(sp)
    1108:	e4d6                	sd	s5,72(sp)
    110a:	e0da                	sd	s6,64(sp)
    110c:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    110e:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1110:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    1112:	6ae1                	lui	s5,0x18
    1114:	000f4a37          	lui	s4,0xf4
    1118:	00989b37          	lui	s6,0x989
{
    111c:	fc86                	sd	ra,120(sp)
    111e:	f8a2                	sd	s0,112(sp)
    1120:	f4a6                	sd	s1,104(sp)
    1122:	f0ca                	sd	s2,96(sp)
    1124:	fc5e                	sd	s7,56(sp)
    1126:	e52e                	sd	a1,136(sp)
    1128:	e932                	sd	a2,144(sp)
    112a:	ed36                	sd	a3,152(sp)
    112c:	f13a                	sd	a4,160(sp)
    112e:	f942                	sd	a6,176(sp)
    1130:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1132:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    1134:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x74f>
    1138:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x166df>
    113c:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf227f>
    1140:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x9876bf>
    for (;;)
    {
        if (!*s)
    1144:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    1148:	02500913          	li	s2,37
        if (!*s)
    114c:	1a078f63          	beqz	a5,130a <printf+0x208>
    1150:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1152:	17278e63          	beq	a5,s2,12ce <printf+0x1cc>
    1156:	00164783          	lbu	a5,1(a2)
    115a:	0605                	addi	a2,a2,1
    115c:	fbfd                	bnez	a5,1152 <printf+0x50>
    115e:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    1160:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1164:	85aa                	mv	a1,a0
    1166:	8622                	mv	a2,s0
    1168:	4505                	li	a0,1
    116a:	46d000ef          	jal	ra,1dd6 <write>
        out(f, a, l);
        if (l)
    116e:	18041963          	bnez	s0,1300 <printf+0x1fe>
            continue;
        if (s[1] == 0)
    1172:	0014c783          	lbu	a5,1(s1) # 10001001 <digits+0xffff041>
    1176:	18078a63          	beqz	a5,130a <printf+0x208>
            break;
        switch (s[1])
    117a:	07300713          	li	a4,115
    117e:	28e78e63          	beq	a5,a4,141a <printf+0x318>
    1182:	18f76f63          	bltu	a4,a5,1320 <printf+0x21e>
    1186:	06400713          	li	a4,100
    118a:	2ae78c63          	beq	a5,a4,1442 <printf+0x340>
    118e:	07000713          	li	a4,112
    1192:	3ce79c63          	bne	a5,a4,156a <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    1196:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1198:	00001797          	auipc	a5,0x1
    119c:	e2878793          	addi	a5,a5,-472 # 1fc0 <digits>
            printptr(va_arg(ap, uint64));
    11a0:	6298                	ld	a4,0(a3)
    11a2:	00868093          	addi	ra,a3,8
    11a6:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    11a8:	00471293          	slli	t0,a4,0x4
    11ac:	00c71f13          	slli	t5,a4,0xc
    11b0:	01471e13          	slli	t3,a4,0x14
    11b4:	01c71893          	slli	a7,a4,0x1c
    11b8:	02471813          	slli	a6,a4,0x24
    11bc:	02871513          	slli	a0,a4,0x28
    11c0:	02c71593          	slli	a1,a4,0x2c
    11c4:	03071693          	slli	a3,a4,0x30
    11c8:	00871f93          	slli	t6,a4,0x8
    11cc:	01071e93          	slli	t4,a4,0x10
    11d0:	01871313          	slli	t1,a4,0x18
    11d4:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    11d8:	03c2d293          	srli	t0,t0,0x3c
    11dc:	03cf5f13          	srli	t5,t5,0x3c
    11e0:	03ce5e13          	srli	t3,t3,0x3c
    11e4:	03c8d893          	srli	a7,a7,0x3c
    11e8:	03c85813          	srli	a6,a6,0x3c
    11ec:	9171                	srli	a0,a0,0x3c
    11ee:	91f1                	srli	a1,a1,0x3c
    11f0:	92f1                	srli	a3,a3,0x3c
    11f2:	92be                	add	t0,t0,a5
    11f4:	9f3e                	add	t5,t5,a5
    11f6:	9e3e                	add	t3,t3,a5
    11f8:	98be                	add	a7,a7,a5
    11fa:	983e                	add	a6,a6,a5
    11fc:	953e                	add	a0,a0,a5
    11fe:	95be                	add	a1,a1,a5
    1200:	96be                	add	a3,a3,a5
    1202:	03c75393          	srli	t2,a4,0x3c
    1206:	01c75b9b          	srliw	s7,a4,0x1c
    120a:	03cfdf93          	srli	t6,t6,0x3c
    120e:	03cede93          	srli	t4,t4,0x3c
    1212:	03c35313          	srli	t1,t1,0x3c
    1216:	9271                	srli	a2,a2,0x3c
    1218:	0002c403          	lbu	s0,0(t0)
    121c:	93be                	add	t2,t2,a5
    121e:	000f4283          	lbu	t0,0(t5)
    1222:	9fbe                	add	t6,t6,a5
    1224:	000e4f03          	lbu	t5,0(t3)
    1228:	9ebe                	add	t4,t4,a5
    122a:	0008ce03          	lbu	t3,0(a7)
    122e:	933e                	add	t1,t1,a5
    1230:	00084883          	lbu	a7,0(a6)
    1234:	9bbe                	add	s7,s7,a5
    1236:	00054803          	lbu	a6,0(a0)
    123a:	963e                	add	a2,a2,a5
    123c:	0005c503          	lbu	a0,0(a1) # 1000 <_start>
    1240:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1244:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1248:	0003c903          	lbu	s2,0(t2)
    124c:	00064603          	lbu	a2,0(a2)
    1250:	000fc383          	lbu	t2,0(t6)
    1254:	8b3d                	andi	a4,a4,15
    1256:	000ecf83          	lbu	t6,0(t4)
    125a:	92f1                	srli	a3,a3,0x3c
    125c:	00034e83          	lbu	t4,0(t1)
    1260:	000bc303          	lbu	t1,0(s7)
    1264:	96be                	add	a3,a3,a5
    1266:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    1268:	7761                	lui	a4,0xffff8
    126a:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    126e:	00710623          	sb	t2,12(sp)
    1272:	005106a3          	sb	t0,13(sp)
    1276:	01f10723          	sb	t6,14(sp)
    127a:	01e107a3          	sb	t5,15(sp)
    127e:	01d10823          	sb	t4,16(sp)
    1282:	01c108a3          	sb	t3,17(sp)
    1286:	00610923          	sb	t1,18(sp)
    128a:	011109a3          	sb	a7,19(sp)
    128e:	01010a23          	sb	a6,20(sp)
    1292:	00a10aa3          	sb	a0,21(sp)
    1296:	00b10b23          	sb	a1,22(sp)
    129a:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    129e:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12a2:	01210523          	sb	s2,10(sp)
    12a6:	008105a3          	sb	s0,11(sp)
    12aa:	0006c703          	lbu	a4,0(a3)
    12ae:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    12b2:	4649                	li	a2,18
    12b4:	002c                	addi	a1,sp,8
    12b6:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12b8:	00e10c23          	sb	a4,24(sp)
    12bc:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    12c0:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    12c4:	313000ef          	jal	ra,1dd6 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    12c8:	00248513          	addi	a0,s1,2
    12cc:	bda5                	j	1144 <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    12ce:	00064783          	lbu	a5,0(a2)
    12d2:	84b2                	mv	s1,a2
    12d4:	01278963          	beq	a5,s2,12e6 <printf+0x1e4>
    12d8:	b561                	j	1160 <printf+0x5e>
    12da:	0024c783          	lbu	a5,2(s1)
    12de:	0605                	addi	a2,a2,1
    12e0:	0489                	addi	s1,s1,2
    12e2:	e7279fe3          	bne	a5,s2,1160 <printf+0x5e>
    12e6:	0014c783          	lbu	a5,1(s1)
    12ea:	ff2788e3          	beq	a5,s2,12da <printf+0x1d8>
        l = z - a;
    12ee:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    12f2:	85aa                	mv	a1,a0
    12f4:	8622                	mv	a2,s0
    12f6:	4505                	li	a0,1
    12f8:	2df000ef          	jal	ra,1dd6 <write>
        if (l)
    12fc:	e6040be3          	beqz	s0,1172 <printf+0x70>
    1300:	8526                	mv	a0,s1
        if (!*s)
    1302:	00054783          	lbu	a5,0(a0)
    1306:	e40795e3          	bnez	a5,1150 <printf+0x4e>
    }
    va_end(ap);
    130a:	70e6                	ld	ra,120(sp)
    130c:	7446                	ld	s0,112(sp)
    130e:	74a6                	ld	s1,104(sp)
    1310:	7906                	ld	s2,96(sp)
    1312:	69e6                	ld	s3,88(sp)
    1314:	6a46                	ld	s4,80(sp)
    1316:	6aa6                	ld	s5,72(sp)
    1318:	6b06                	ld	s6,64(sp)
    131a:	7be2                	ld	s7,56(sp)
    131c:	6129                	addi	sp,sp,192
    131e:	8082                	ret
        switch (s[1])
    1320:	07800713          	li	a4,120
    1324:	24e79363          	bne	a5,a4,156a <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    1328:	6782                	ld	a5,0(sp)
    132a:	4394                	lw	a3,0(a5)
    132c:	07a1                	addi	a5,a5,8
    132e:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1330:	2606c263          	bltz	a3,1594 <printf+0x492>
        buf[i--] = digits[x % base];
    1334:	00001797          	auipc	a5,0x1
    1338:	c8c78793          	addi	a5,a5,-884 # 1fc0 <digits>
    133c:	00f6f713          	andi	a4,a3,15
    1340:	973e                	add	a4,a4,a5
    1342:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff6040>
    buf[16] = 0;
    1346:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    134a:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    134c:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1350:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    1354:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    1358:	0046d51b          	srliw	a0,a3,0x4
    135c:	0ad5d563          	bge	a1,a3,1406 <printf+0x304>
        buf[i--] = digits[x % base];
    1360:	8a3d                	andi	a2,a2,15
    1362:	963e                	add	a2,a2,a5
    1364:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1368:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    136c:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1370:	30a5fe63          	bgeu	a1,a0,168c <printf+0x58a>
        buf[i--] = digits[x % base];
    1374:	00f77613          	andi	a2,a4,15
    1378:	963e                	add	a2,a2,a5
    137a:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    137e:	45bd                	li	a1,15
    1380:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    1384:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    1388:	00475513          	srli	a0,a4,0x4
    138c:	30e5f963          	bgeu	a1,a4,169e <printf+0x59c>
        buf[i--] = digits[x % base];
    1390:	8a3d                	andi	a2,a2,15
    1392:	963e                	add	a2,a2,a5
    1394:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    1398:	00875893          	srli	a7,a4,0x8
    139c:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    13a0:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    13a4:	30a5fd63          	bgeu	a1,a0,16be <printf+0x5bc>
        buf[i--] = digits[x % base];
    13a8:	8a3d                	andi	a2,a2,15
    13aa:	963e                	add	a2,a2,a5
    13ac:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13b0:	00c75813          	srli	a6,a4,0xc
    13b4:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    13b8:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    13bc:	3315fe63          	bgeu	a1,a7,16f8 <printf+0x5f6>
        buf[i--] = digits[x % base];
    13c0:	8a3d                	andi	a2,a2,15
    13c2:	963e                	add	a2,a2,a5
    13c4:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13c8:	01075893          	srli	a7,a4,0x10
    13cc:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    13d0:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    13d4:	3305ff63          	bgeu	a1,a6,1712 <printf+0x610>
        buf[i--] = digits[x % base];
    13d8:	8a3d                	andi	a2,a2,15
    13da:	963e                	add	a2,a2,a5
    13dc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    13e0:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    13e4:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    13e8:	3515f863          	bgeu	a1,a7,1738 <printf+0x636>
        buf[i--] = digits[x % base];
    13ec:	97ba                	add	a5,a5,a4
    13ee:	0007c783          	lbu	a5,0(a5)
    13f2:	45a1                	li	a1,8
    13f4:	00f10823          	sb	a5,16(sp)
    if (sign)
    13f8:	0006d763          	bgez	a3,1406 <printf+0x304>
        buf[i--] = '-';
    13fc:	02d00793          	li	a5,45
    1400:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1404:	459d                	li	a1,7
    write(f, s, l);
    1406:	4641                	li	a2,16
    1408:	003c                	addi	a5,sp,8
    140a:	9e0d                	subw	a2,a2,a1
    140c:	4505                	li	a0,1
    140e:	95be                	add	a1,a1,a5
    1410:	1c7000ef          	jal	ra,1dd6 <write>
        s += 2;
    1414:	00248513          	addi	a0,s1,2
    1418:	b335                	j	1144 <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    141a:	6782                	ld	a5,0(sp)
    141c:	6380                	ld	s0,0(a5)
    141e:	07a1                	addi	a5,a5,8
    1420:	e03e                	sd	a5,0(sp)
    1422:	22040a63          	beqz	s0,1656 <printf+0x554>
            l = strnlen(a, 200);
    1426:	0c800593          	li	a1,200
    142a:	8522                	mv	a0,s0
    142c:	6cc000ef          	jal	ra,1af8 <strnlen>
    write(f, s, l);
    1430:	0005061b          	sext.w	a2,a0
    1434:	85a2                	mv	a1,s0
    1436:	4505                	li	a0,1
    1438:	19f000ef          	jal	ra,1dd6 <write>
        s += 2;
    143c:	00248513          	addi	a0,s1,2
    1440:	b311                	j	1144 <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    1442:	6782                	ld	a5,0(sp)
    1444:	4390                	lw	a2,0(a5)
    1446:	07a1                	addi	a5,a5,8
    1448:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    144a:	1a064363          	bltz	a2,15f0 <printf+0x4ee>
        buf[i--] = digits[x % base];
    144e:	46a9                	li	a3,10
    1450:	02d6773b          	remuw	a4,a2,a3
    1454:	00001797          	auipc	a5,0x1
    1458:	b6c78793          	addi	a5,a5,-1172 # 1fc0 <digits>
    buf[16] = 0;
    145c:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1460:	4525                	li	a0,9
        x = xx;
    1462:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    1466:	973e                	add	a4,a4,a5
    1468:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    146c:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    1470:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1474:	2cc55063          	bge	a0,a2,1734 <printf+0x632>
    1478:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    147c:	02d5f73b          	remuw	a4,a1,a3
    1480:	1702                	slli	a4,a4,0x20
    1482:	9301                	srli	a4,a4,0x20
    1484:	973e                	add	a4,a4,a5
    1486:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    148a:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    148e:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    1492:	1f057d63          	bgeu	a0,a6,168c <printf+0x58a>
        buf[i--] = digits[x % base];
    1496:	4529                	li	a0,10
    } while ((x /= base) != 0);
    1498:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    149a:	02a5f73b          	remuw	a4,a1,a0
    149e:	973e                	add	a4,a4,a5
    14a0:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    14a4:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    14a8:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    14ac:	1ab6f163          	bgeu	a3,a1,164e <printf+0x54c>
    14b0:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    14b4:	02a776bb          	remuw	a3,a4,a0
    14b8:	96be                	add	a3,a3,a5
    14ba:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14be:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14c2:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    14c6:	20b87c63          	bgeu	a6,a1,16de <printf+0x5dc>
    14ca:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    14ce:	02a776bb          	remuw	a3,a4,a0
    14d2:	96be                	add	a3,a3,a5
    14d4:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14d8:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14dc:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    14e0:	20b87363          	bgeu	a6,a1,16e6 <printf+0x5e4>
        buf[i--] = digits[x % base];
    14e4:	02a776bb          	remuw	a3,a4,a0
    14e8:	96be                	add	a3,a3,a5
    14ea:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14ee:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14f2:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    14f6:	20b9f563          	bgeu	s3,a1,1700 <printf+0x5fe>
        buf[i--] = digits[x % base];
    14fa:	02a776bb          	remuw	a3,a4,a0
    14fe:	96be                	add	a3,a3,a5
    1500:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1504:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1508:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    150c:	20bafb63          	bgeu	s5,a1,1722 <printf+0x620>
        buf[i--] = digits[x % base];
    1510:	02a776bb          	remuw	a3,a4,a0
    1514:	96be                	add	a3,a3,a5
    1516:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    151a:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    151e:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1522:	1eba7c63          	bgeu	s4,a1,171a <printf+0x618>
        buf[i--] = digits[x % base];
    1526:	02a776bb          	remuw	a3,a4,a0
    152a:	96be                	add	a3,a3,a5
    152c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1530:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1534:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1538:	14bb7163          	bgeu	s6,a1,167a <printf+0x578>
        buf[i--] = digits[x % base];
    153c:	1702                	slli	a4,a4,0x20
    153e:	9301                	srli	a4,a4,0x20
    1540:	97ba                	add	a5,a5,a4
    1542:	0007c783          	lbu	a5,0(a5)
    1546:	4599                	li	a1,6
    1548:	00f10723          	sb	a5,14(sp)
    if (sign)
    154c:	ea065de3          	bgez	a2,1406 <printf+0x304>
        buf[i--] = '-';
    1550:	02d00793          	li	a5,45
    1554:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1558:	4595                	li	a1,5
    write(f, s, l);
    155a:	003c                	addi	a5,sp,8
    155c:	4641                	li	a2,16
    155e:	9e0d                	subw	a2,a2,a1
    1560:	4505                	li	a0,1
    1562:	95be                	add	a1,a1,a5
    1564:	073000ef          	jal	ra,1dd6 <write>
    1568:	b575                	j	1414 <printf+0x312>
    char byte = c;
    156a:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    156e:	4605                	li	a2,1
    1570:	002c                	addi	a1,sp,8
    1572:	4505                	li	a0,1
    char byte = c;
    1574:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1578:	05f000ef          	jal	ra,1dd6 <write>
    char byte = c;
    157c:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1580:	4605                	li	a2,1
    1582:	002c                	addi	a1,sp,8
    1584:	4505                	li	a0,1
    char byte = c;
    1586:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    158a:	04d000ef          	jal	ra,1dd6 <write>
        s += 2;
    158e:	00248513          	addi	a0,s1,2
    1592:	be4d                	j	1144 <printf+0x42>
        x = -xx;
    1594:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    1598:	00001797          	auipc	a5,0x1
    159c:	a2878793          	addi	a5,a5,-1496 # 1fc0 <digits>
    15a0:	00f77613          	andi	a2,a4,15
    15a4:	963e                	add	a2,a2,a5
    15a6:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    15aa:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    15ae:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    15b0:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    15b4:	0047551b          	srliw	a0,a4,0x4
    15b8:	0047561b          	srliw	a2,a4,0x4
    15bc:	0ab6d263          	bge	a3,a1,1660 <printf+0x55e>
        buf[i--] = digits[x % base];
    15c0:	8a3d                	andi	a2,a2,15
    15c2:	963e                	add	a2,a2,a5
    15c4:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    15c8:	463d                	li	a2,15
    15ca:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    15ce:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    15d2:	daa661e3          	bltu	a2,a0,1374 <printf+0x272>
        buf[i--] = '-';
    15d6:	02d00793          	li	a5,45
    15da:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    15de:	45b5                	li	a1,13
    write(f, s, l);
    15e0:	003c                	addi	a5,sp,8
    15e2:	4641                	li	a2,16
    15e4:	9e0d                	subw	a2,a2,a1
    15e6:	4505                	li	a0,1
    15e8:	95be                	add	a1,a1,a5
    15ea:	7ec000ef          	jal	ra,1dd6 <write>
    15ee:	b51d                	j	1414 <printf+0x312>
        x = -xx;
    15f0:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    15f4:	46a9                	li	a3,10
    15f6:	02d875bb          	remuw	a1,a6,a3
    15fa:	00001797          	auipc	a5,0x1
    15fe:	9c678793          	addi	a5,a5,-1594 # 1fc0 <digits>
    buf[16] = 0;
    1602:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1606:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    1608:	95be                	add	a1,a1,a5
    160a:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    160e:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    1612:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    1616:	04a65563          	bge	a2,a0,1660 <printf+0x55e>
    161a:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    161e:	02d775bb          	remuw	a1,a4,a3
    1622:	95be                	add	a1,a1,a5
    1624:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    1628:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    162c:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    1630:	fb0573e3          	bgeu	a0,a6,15d6 <printf+0x4d4>
        buf[i--] = digits[x % base];
    1634:	4529                	li	a0,10
    } while ((x /= base) != 0);
    1636:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1638:	02a5f73b          	remuw	a4,a1,a0
    163c:	973e                	add	a4,a4,a5
    163e:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    1642:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    1646:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    164a:	e6b6e3e3          	bltu	a3,a1,14b0 <printf+0x3ae>
        buf[i--] = digits[x % base];
    164e:	45b5                	li	a1,13
    if (sign)
    1650:	da065be3          	bgez	a2,1406 <printf+0x304>
    1654:	a881                	j	16a4 <printf+0x5a2>
                a = "(null)";
    1656:	00001417          	auipc	s0,0x1
    165a:	94a40413          	addi	s0,s0,-1718 # 1fa0 <unlink+0x24>
    165e:	b3e1                	j	1426 <printf+0x324>
        buf[i--] = '-';
    1660:	02d00793          	li	a5,45
    1664:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1668:	45b9                	li	a1,14
    write(f, s, l);
    166a:	003c                	addi	a5,sp,8
    166c:	4641                	li	a2,16
    166e:	9e0d                	subw	a2,a2,a1
    1670:	4505                	li	a0,1
    1672:	95be                	add	a1,a1,a5
    1674:	762000ef          	jal	ra,1dd6 <write>
    1678:	bb71                	j	1414 <printf+0x312>
        buf[i--] = digits[x % base];
    167a:	459d                	li	a1,7
    if (sign)
    167c:	d80655e3          	bgez	a2,1406 <printf+0x304>
        buf[i--] = '-';
    1680:	02d00793          	li	a5,45
    1684:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1688:	4599                	li	a1,6
    168a:	bbb5                	j	1406 <printf+0x304>
    168c:	45b9                	li	a1,14
    write(f, s, l);
    168e:	003c                	addi	a5,sp,8
    1690:	4641                	li	a2,16
    1692:	9e0d                	subw	a2,a2,a1
    1694:	4505                	li	a0,1
    1696:	95be                	add	a1,a1,a5
    1698:	73e000ef          	jal	ra,1dd6 <write>
    169c:	bba5                	j	1414 <printf+0x312>
        buf[i--] = digits[x % base];
    169e:	45b5                	li	a1,13
    if (sign)
    16a0:	d606d3e3          	bgez	a3,1406 <printf+0x304>
        buf[i--] = '-';
    16a4:	02d00793          	li	a5,45
    16a8:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    16ac:	45b1                	li	a1,12
    write(f, s, l);
    16ae:	003c                	addi	a5,sp,8
    16b0:	4641                	li	a2,16
    16b2:	9e0d                	subw	a2,a2,a1
    16b4:	4505                	li	a0,1
    16b6:	95be                	add	a1,a1,a5
    16b8:	71e000ef          	jal	ra,1dd6 <write>
    16bc:	bba1                	j	1414 <printf+0x312>
        buf[i--] = digits[x % base];
    16be:	45b1                	li	a1,12
    if (sign)
    16c0:	d406d3e3          	bgez	a3,1406 <printf+0x304>
        buf[i--] = '-';
    16c4:	02d00793          	li	a5,45
    16c8:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    16cc:	45ad                	li	a1,11
    write(f, s, l);
    16ce:	003c                	addi	a5,sp,8
    16d0:	4641                	li	a2,16
    16d2:	9e0d                	subw	a2,a2,a1
    16d4:	4505                	li	a0,1
    16d6:	95be                	add	a1,a1,a5
    16d8:	6fe000ef          	jal	ra,1dd6 <write>
    16dc:	bb25                	j	1414 <printf+0x312>
        buf[i--] = digits[x % base];
    16de:	45b1                	li	a1,12
    if (sign)
    16e0:	d20653e3          	bgez	a2,1406 <printf+0x304>
    16e4:	b7c5                	j	16c4 <printf+0x5c2>
        buf[i--] = digits[x % base];
    16e6:	45ad                	li	a1,11
    if (sign)
    16e8:	d0065fe3          	bgez	a2,1406 <printf+0x304>
        buf[i--] = '-';
    16ec:	02d00793          	li	a5,45
    16f0:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    16f4:	45a9                	li	a1,10
    16f6:	bb01                	j	1406 <printf+0x304>
    16f8:	45ad                	li	a1,11
    if (sign)
    16fa:	d006d6e3          	bgez	a3,1406 <printf+0x304>
    16fe:	b7fd                	j	16ec <printf+0x5ea>
        buf[i--] = digits[x % base];
    1700:	45a9                	li	a1,10
    if (sign)
    1702:	d00652e3          	bgez	a2,1406 <printf+0x304>
        buf[i--] = '-';
    1706:	02d00793          	li	a5,45
    170a:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    170e:	45a5                	li	a1,9
    1710:	b9dd                	j	1406 <printf+0x304>
    1712:	45a9                	li	a1,10
    if (sign)
    1714:	ce06d9e3          	bgez	a3,1406 <printf+0x304>
    1718:	b7fd                	j	1706 <printf+0x604>
        buf[i--] = digits[x % base];
    171a:	45a1                	li	a1,8
    if (sign)
    171c:	ce0655e3          	bgez	a2,1406 <printf+0x304>
    1720:	b9f1                	j	13fc <printf+0x2fa>
        buf[i--] = digits[x % base];
    1722:	45a5                	li	a1,9
    if (sign)
    1724:	ce0651e3          	bgez	a2,1406 <printf+0x304>
        buf[i--] = '-';
    1728:	02d00793          	li	a5,45
    172c:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1730:	45a1                	li	a1,8
    1732:	b9d1                	j	1406 <printf+0x304>
    i = 15;
    1734:	45bd                	li	a1,15
    1736:	b9c1                	j	1406 <printf+0x304>
        buf[i--] = digits[x % base];
    1738:	45a5                	li	a1,9
    if (sign)
    173a:	cc06d6e3          	bgez	a3,1406 <printf+0x304>
    173e:	b7ed                	j	1728 <printf+0x626>

0000000000001740 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1740:	02000793          	li	a5,32
    1744:	00f50663          	beq	a0,a5,1750 <isspace+0x10>
    1748:	355d                	addiw	a0,a0,-9
    174a:	00553513          	sltiu	a0,a0,5
    174e:	8082                	ret
    1750:	4505                	li	a0,1
}
    1752:	8082                	ret

0000000000001754 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1754:	fd05051b          	addiw	a0,a0,-48
}
    1758:	00a53513          	sltiu	a0,a0,10
    175c:	8082                	ret

000000000000175e <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    175e:	02000613          	li	a2,32
    1762:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1764:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1768:	ff77069b          	addiw	a3,a4,-9
    176c:	04c70d63          	beq	a4,a2,17c6 <atoi+0x68>
    1770:	0007079b          	sext.w	a5,a4
    1774:	04d5f963          	bgeu	a1,a3,17c6 <atoi+0x68>
        s++;
    switch (*s)
    1778:	02b00693          	li	a3,43
    177c:	04d70a63          	beq	a4,a3,17d0 <atoi+0x72>
    1780:	02d00693          	li	a3,45
    1784:	06d70463          	beq	a4,a3,17ec <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1788:	fd07859b          	addiw	a1,a5,-48
    178c:	4625                	li	a2,9
    178e:	873e                	mv	a4,a5
    1790:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1792:	4e01                	li	t3,0
    while (isdigit(*s))
    1794:	04b66a63          	bltu	a2,a1,17e8 <atoi+0x8a>
    int n = 0, neg = 0;
    1798:	4501                	li	a0,0
    while (isdigit(*s))
    179a:	4825                	li	a6,9
    179c:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    17a0:	0025179b          	slliw	a5,a0,0x2
    17a4:	9d3d                	addw	a0,a0,a5
    17a6:	fd07031b          	addiw	t1,a4,-48
    17aa:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    17ae:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    17b2:	0685                	addi	a3,a3,1
    17b4:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    17b8:	0006071b          	sext.w	a4,a2
    17bc:	feb870e3          	bgeu	a6,a1,179c <atoi+0x3e>
    return neg ? n : -n;
    17c0:	000e0563          	beqz	t3,17ca <atoi+0x6c>
}
    17c4:	8082                	ret
        s++;
    17c6:	0505                	addi	a0,a0,1
    17c8:	bf71                	j	1764 <atoi+0x6>
    17ca:	4113053b          	subw	a0,t1,a7
    17ce:	8082                	ret
    while (isdigit(*s))
    17d0:	00154783          	lbu	a5,1(a0)
    17d4:	4625                	li	a2,9
        s++;
    17d6:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17da:	fd07859b          	addiw	a1,a5,-48
    17de:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    17e2:	4e01                	li	t3,0
    while (isdigit(*s))
    17e4:	fab67ae3          	bgeu	a2,a1,1798 <atoi+0x3a>
    17e8:	4501                	li	a0,0
}
    17ea:	8082                	ret
    while (isdigit(*s))
    17ec:	00154783          	lbu	a5,1(a0)
    17f0:	4625                	li	a2,9
        s++;
    17f2:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17f6:	fd07859b          	addiw	a1,a5,-48
    17fa:	0007871b          	sext.w	a4,a5
    17fe:	feb665e3          	bltu	a2,a1,17e8 <atoi+0x8a>
        neg = 1;
    1802:	4e05                	li	t3,1
    1804:	bf51                	j	1798 <atoi+0x3a>

0000000000001806 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1806:	16060d63          	beqz	a2,1980 <memset+0x17a>
    180a:	40a007b3          	neg	a5,a0
    180e:	8b9d                	andi	a5,a5,7
    1810:	00778713          	addi	a4,a5,7
    1814:	482d                	li	a6,11
    1816:	0ff5f593          	andi	a1,a1,255
    181a:	fff60693          	addi	a3,a2,-1
    181e:	17076263          	bltu	a4,a6,1982 <memset+0x17c>
    1822:	16e6ea63          	bltu	a3,a4,1996 <memset+0x190>
    1826:	16078563          	beqz	a5,1990 <memset+0x18a>
    182a:	00b50023          	sb	a1,0(a0)
    182e:	4705                	li	a4,1
    1830:	00150e93          	addi	t4,a0,1
    1834:	14e78c63          	beq	a5,a4,198c <memset+0x186>
    1838:	00b500a3          	sb	a1,1(a0)
    183c:	4709                	li	a4,2
    183e:	00250e93          	addi	t4,a0,2
    1842:	14e78d63          	beq	a5,a4,199c <memset+0x196>
    1846:	00b50123          	sb	a1,2(a0)
    184a:	470d                	li	a4,3
    184c:	00350e93          	addi	t4,a0,3
    1850:	12e78b63          	beq	a5,a4,1986 <memset+0x180>
    1854:	00b501a3          	sb	a1,3(a0)
    1858:	4711                	li	a4,4
    185a:	00450e93          	addi	t4,a0,4
    185e:	14e78163          	beq	a5,a4,19a0 <memset+0x19a>
    1862:	00b50223          	sb	a1,4(a0)
    1866:	4715                	li	a4,5
    1868:	00550e93          	addi	t4,a0,5
    186c:	12e78c63          	beq	a5,a4,19a4 <memset+0x19e>
    1870:	00b502a3          	sb	a1,5(a0)
    1874:	471d                	li	a4,7
    1876:	00650e93          	addi	t4,a0,6
    187a:	12e79763          	bne	a5,a4,19a8 <memset+0x1a2>
    187e:	00750e93          	addi	t4,a0,7
    1882:	00b50323          	sb	a1,6(a0)
    1886:	4f1d                	li	t5,7
    1888:	00859713          	slli	a4,a1,0x8
    188c:	8f4d                	or	a4,a4,a1
    188e:	01059e13          	slli	t3,a1,0x10
    1892:	01c76e33          	or	t3,a4,t3
    1896:	01859313          	slli	t1,a1,0x18
    189a:	006e6333          	or	t1,t3,t1
    189e:	02059893          	slli	a7,a1,0x20
    18a2:	011368b3          	or	a7,t1,a7
    18a6:	02859813          	slli	a6,a1,0x28
    18aa:	40f60333          	sub	t1,a2,a5
    18ae:	0108e833          	or	a6,a7,a6
    18b2:	03059693          	slli	a3,a1,0x30
    18b6:	00d866b3          	or	a3,a6,a3
    18ba:	03859713          	slli	a4,a1,0x38
    18be:	97aa                	add	a5,a5,a0
    18c0:	ff837813          	andi	a6,t1,-8
    18c4:	8f55                	or	a4,a4,a3
    18c6:	00f806b3          	add	a3,a6,a5
    18ca:	e398                	sd	a4,0(a5)
    18cc:	07a1                	addi	a5,a5,8
    18ce:	fed79ee3          	bne	a5,a3,18ca <memset+0xc4>
    18d2:	ff837693          	andi	a3,t1,-8
    18d6:	00de87b3          	add	a5,t4,a3
    18da:	01e6873b          	addw	a4,a3,t5
    18de:	0ad30663          	beq	t1,a3,198a <memset+0x184>
    18e2:	00b78023          	sb	a1,0(a5)
    18e6:	0017069b          	addiw	a3,a4,1
    18ea:	08c6fb63          	bgeu	a3,a2,1980 <memset+0x17a>
    18ee:	00b780a3          	sb	a1,1(a5)
    18f2:	0027069b          	addiw	a3,a4,2
    18f6:	08c6f563          	bgeu	a3,a2,1980 <memset+0x17a>
    18fa:	00b78123          	sb	a1,2(a5)
    18fe:	0037069b          	addiw	a3,a4,3
    1902:	06c6ff63          	bgeu	a3,a2,1980 <memset+0x17a>
    1906:	00b781a3          	sb	a1,3(a5)
    190a:	0047069b          	addiw	a3,a4,4
    190e:	06c6f963          	bgeu	a3,a2,1980 <memset+0x17a>
    1912:	00b78223          	sb	a1,4(a5)
    1916:	0057069b          	addiw	a3,a4,5
    191a:	06c6f363          	bgeu	a3,a2,1980 <memset+0x17a>
    191e:	00b782a3          	sb	a1,5(a5)
    1922:	0067069b          	addiw	a3,a4,6
    1926:	04c6fd63          	bgeu	a3,a2,1980 <memset+0x17a>
    192a:	00b78323          	sb	a1,6(a5)
    192e:	0077069b          	addiw	a3,a4,7
    1932:	04c6f763          	bgeu	a3,a2,1980 <memset+0x17a>
    1936:	00b783a3          	sb	a1,7(a5)
    193a:	0087069b          	addiw	a3,a4,8
    193e:	04c6f163          	bgeu	a3,a2,1980 <memset+0x17a>
    1942:	00b78423          	sb	a1,8(a5)
    1946:	0097069b          	addiw	a3,a4,9
    194a:	02c6fb63          	bgeu	a3,a2,1980 <memset+0x17a>
    194e:	00b784a3          	sb	a1,9(a5)
    1952:	00a7069b          	addiw	a3,a4,10
    1956:	02c6f563          	bgeu	a3,a2,1980 <memset+0x17a>
    195a:	00b78523          	sb	a1,10(a5)
    195e:	00b7069b          	addiw	a3,a4,11
    1962:	00c6ff63          	bgeu	a3,a2,1980 <memset+0x17a>
    1966:	00b785a3          	sb	a1,11(a5)
    196a:	00c7069b          	addiw	a3,a4,12
    196e:	00c6f963          	bgeu	a3,a2,1980 <memset+0x17a>
    1972:	00b78623          	sb	a1,12(a5)
    1976:	2735                	addiw	a4,a4,13
    1978:	00c77463          	bgeu	a4,a2,1980 <memset+0x17a>
    197c:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1980:	8082                	ret
    1982:	472d                	li	a4,11
    1984:	bd79                	j	1822 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1986:	4f0d                	li	t5,3
    1988:	b701                	j	1888 <memset+0x82>
    198a:	8082                	ret
    198c:	4f05                	li	t5,1
    198e:	bded                	j	1888 <memset+0x82>
    1990:	8eaa                	mv	t4,a0
    1992:	4f01                	li	t5,0
    1994:	bdd5                	j	1888 <memset+0x82>
    1996:	87aa                	mv	a5,a0
    1998:	4701                	li	a4,0
    199a:	b7a1                	j	18e2 <memset+0xdc>
    199c:	4f09                	li	t5,2
    199e:	b5ed                	j	1888 <memset+0x82>
    19a0:	4f11                	li	t5,4
    19a2:	b5dd                	j	1888 <memset+0x82>
    19a4:	4f15                	li	t5,5
    19a6:	b5cd                	j	1888 <memset+0x82>
    19a8:	4f19                	li	t5,6
    19aa:	bdf9                	j	1888 <memset+0x82>

00000000000019ac <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    19ac:	00054783          	lbu	a5,0(a0)
    19b0:	0005c703          	lbu	a4,0(a1)
    19b4:	00e79863          	bne	a5,a4,19c4 <strcmp+0x18>
    19b8:	0505                	addi	a0,a0,1
    19ba:	0585                	addi	a1,a1,1
    19bc:	fbe5                	bnez	a5,19ac <strcmp>
    19be:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    19c0:	9d19                	subw	a0,a0,a4
    19c2:	8082                	ret
    19c4:	0007851b          	sext.w	a0,a5
    19c8:	bfe5                	j	19c0 <strcmp+0x14>

00000000000019ca <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    19ca:	ce05                	beqz	a2,1a02 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19cc:	00054703          	lbu	a4,0(a0)
    19d0:	0005c783          	lbu	a5,0(a1)
    19d4:	cb0d                	beqz	a4,1a06 <strncmp+0x3c>
    if (!n--)
    19d6:	167d                	addi	a2,a2,-1
    19d8:	00c506b3          	add	a3,a0,a2
    19dc:	a819                	j	19f2 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19de:	00a68e63          	beq	a3,a0,19fa <strncmp+0x30>
    19e2:	0505                	addi	a0,a0,1
    19e4:	00e79b63          	bne	a5,a4,19fa <strncmp+0x30>
    19e8:	00054703          	lbu	a4,0(a0)
    19ec:	0005c783          	lbu	a5,0(a1)
    19f0:	cb19                	beqz	a4,1a06 <strncmp+0x3c>
    19f2:	0005c783          	lbu	a5,0(a1)
    19f6:	0585                	addi	a1,a1,1
    19f8:	f3fd                	bnez	a5,19de <strncmp+0x14>
        ;
    return *l - *r;
    19fa:	0007051b          	sext.w	a0,a4
    19fe:	9d1d                	subw	a0,a0,a5
    1a00:	8082                	ret
        return 0;
    1a02:	4501                	li	a0,0
}
    1a04:	8082                	ret
    1a06:	4501                	li	a0,0
    return *l - *r;
    1a08:	9d1d                	subw	a0,a0,a5
    1a0a:	8082                	ret

0000000000001a0c <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1a0c:	00757793          	andi	a5,a0,7
    1a10:	cf89                	beqz	a5,1a2a <strlen+0x1e>
    1a12:	87aa                	mv	a5,a0
    1a14:	a029                	j	1a1e <strlen+0x12>
    1a16:	0785                	addi	a5,a5,1
    1a18:	0077f713          	andi	a4,a5,7
    1a1c:	cb01                	beqz	a4,1a2c <strlen+0x20>
        if (!*s)
    1a1e:	0007c703          	lbu	a4,0(a5)
    1a22:	fb75                	bnez	a4,1a16 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1a24:	40a78533          	sub	a0,a5,a0
}
    1a28:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1a2a:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1a2c:	6394                	ld	a3,0(a5)
    1a2e:	00000597          	auipc	a1,0x0
    1a32:	57a5b583          	ld	a1,1402(a1) # 1fa8 <unlink+0x2c>
    1a36:	00000617          	auipc	a2,0x0
    1a3a:	57a63603          	ld	a2,1402(a2) # 1fb0 <unlink+0x34>
    1a3e:	a019                	j	1a44 <strlen+0x38>
    1a40:	6794                	ld	a3,8(a5)
    1a42:	07a1                	addi	a5,a5,8
    1a44:	00b68733          	add	a4,a3,a1
    1a48:	fff6c693          	not	a3,a3
    1a4c:	8f75                	and	a4,a4,a3
    1a4e:	8f71                	and	a4,a4,a2
    1a50:	db65                	beqz	a4,1a40 <strlen+0x34>
    for (; *s; s++)
    1a52:	0007c703          	lbu	a4,0(a5)
    1a56:	d779                	beqz	a4,1a24 <strlen+0x18>
    1a58:	0017c703          	lbu	a4,1(a5)
    1a5c:	0785                	addi	a5,a5,1
    1a5e:	d379                	beqz	a4,1a24 <strlen+0x18>
    1a60:	0017c703          	lbu	a4,1(a5)
    1a64:	0785                	addi	a5,a5,1
    1a66:	fb6d                	bnez	a4,1a58 <strlen+0x4c>
    1a68:	bf75                	j	1a24 <strlen+0x18>

0000000000001a6a <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a6a:	00757713          	andi	a4,a0,7
{
    1a6e:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1a70:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a74:	cb19                	beqz	a4,1a8a <memchr+0x20>
    1a76:	ce25                	beqz	a2,1aee <memchr+0x84>
    1a78:	0007c703          	lbu	a4,0(a5)
    1a7c:	04b70e63          	beq	a4,a1,1ad8 <memchr+0x6e>
    1a80:	0785                	addi	a5,a5,1
    1a82:	0077f713          	andi	a4,a5,7
    1a86:	167d                	addi	a2,a2,-1
    1a88:	f77d                	bnez	a4,1a76 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1a8a:	4501                	li	a0,0
    if (n && *s != c)
    1a8c:	c235                	beqz	a2,1af0 <memchr+0x86>
    1a8e:	0007c703          	lbu	a4,0(a5)
    1a92:	04b70363          	beq	a4,a1,1ad8 <memchr+0x6e>
        size_t k = ONES * c;
    1a96:	00000517          	auipc	a0,0x0
    1a9a:	52253503          	ld	a0,1314(a0) # 1fb8 <unlink+0x3c>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a9e:	471d                	li	a4,7
        size_t k = ONES * c;
    1aa0:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1aa4:	02c77a63          	bgeu	a4,a2,1ad8 <memchr+0x6e>
    1aa8:	00000897          	auipc	a7,0x0
    1aac:	5008b883          	ld	a7,1280(a7) # 1fa8 <unlink+0x2c>
    1ab0:	00000817          	auipc	a6,0x0
    1ab4:	50083803          	ld	a6,1280(a6) # 1fb0 <unlink+0x34>
    1ab8:	431d                	li	t1,7
    1aba:	a029                	j	1ac4 <memchr+0x5a>
    1abc:	1661                	addi	a2,a2,-8
    1abe:	07a1                	addi	a5,a5,8
    1ac0:	02c37963          	bgeu	t1,a2,1af2 <memchr+0x88>
    1ac4:	6398                	ld	a4,0(a5)
    1ac6:	8f29                	xor	a4,a4,a0
    1ac8:	011706b3          	add	a3,a4,a7
    1acc:	fff74713          	not	a4,a4
    1ad0:	8f75                	and	a4,a4,a3
    1ad2:	01077733          	and	a4,a4,a6
    1ad6:	d37d                	beqz	a4,1abc <memchr+0x52>
    1ad8:	853e                	mv	a0,a5
    1ada:	97b2                	add	a5,a5,a2
    1adc:	a021                	j	1ae4 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1ade:	0505                	addi	a0,a0,1
    1ae0:	00f50763          	beq	a0,a5,1aee <memchr+0x84>
    1ae4:	00054703          	lbu	a4,0(a0)
    1ae8:	feb71be3          	bne	a4,a1,1ade <memchr+0x74>
    1aec:	8082                	ret
    return n ? (void *)s : 0;
    1aee:	4501                	li	a0,0
}
    1af0:	8082                	ret
    return n ? (void *)s : 0;
    1af2:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1af4:	f275                	bnez	a2,1ad8 <memchr+0x6e>
}
    1af6:	8082                	ret

0000000000001af8 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1af8:	1101                	addi	sp,sp,-32
    1afa:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1afc:	862e                	mv	a2,a1
{
    1afe:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1b00:	4581                	li	a1,0
{
    1b02:	e426                	sd	s1,8(sp)
    1b04:	ec06                	sd	ra,24(sp)
    1b06:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1b08:	f63ff0ef          	jal	ra,1a6a <memchr>
    return p ? p - s : n;
    1b0c:	c519                	beqz	a0,1b1a <strnlen+0x22>
}
    1b0e:	60e2                	ld	ra,24(sp)
    1b10:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1b12:	8d05                	sub	a0,a0,s1
}
    1b14:	64a2                	ld	s1,8(sp)
    1b16:	6105                	addi	sp,sp,32
    1b18:	8082                	ret
    1b1a:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1b1c:	8522                	mv	a0,s0
}
    1b1e:	6442                	ld	s0,16(sp)
    1b20:	64a2                	ld	s1,8(sp)
    1b22:	6105                	addi	sp,sp,32
    1b24:	8082                	ret

0000000000001b26 <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1b26:	00b547b3          	xor	a5,a0,a1
    1b2a:	8b9d                	andi	a5,a5,7
    1b2c:	eb95                	bnez	a5,1b60 <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1b2e:	0075f793          	andi	a5,a1,7
    1b32:	e7b1                	bnez	a5,1b7e <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1b34:	6198                	ld	a4,0(a1)
    1b36:	00000617          	auipc	a2,0x0
    1b3a:	47263603          	ld	a2,1138(a2) # 1fa8 <unlink+0x2c>
    1b3e:	00000817          	auipc	a6,0x0
    1b42:	47283803          	ld	a6,1138(a6) # 1fb0 <unlink+0x34>
    1b46:	a029                	j	1b50 <stpcpy+0x2a>
    1b48:	e118                	sd	a4,0(a0)
    1b4a:	6598                	ld	a4,8(a1)
    1b4c:	05a1                	addi	a1,a1,8
    1b4e:	0521                	addi	a0,a0,8
    1b50:	00c707b3          	add	a5,a4,a2
    1b54:	fff74693          	not	a3,a4
    1b58:	8ff5                	and	a5,a5,a3
    1b5a:	0107f7b3          	and	a5,a5,a6
    1b5e:	d7ed                	beqz	a5,1b48 <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b60:	0005c783          	lbu	a5,0(a1)
    1b64:	00f50023          	sb	a5,0(a0)
    1b68:	c785                	beqz	a5,1b90 <stpcpy+0x6a>
    1b6a:	0015c783          	lbu	a5,1(a1)
    1b6e:	0505                	addi	a0,a0,1
    1b70:	0585                	addi	a1,a1,1
    1b72:	00f50023          	sb	a5,0(a0)
    1b76:	fbf5                	bnez	a5,1b6a <stpcpy+0x44>
        ;
    return d;
}
    1b78:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1b7a:	0505                	addi	a0,a0,1
    1b7c:	df45                	beqz	a4,1b34 <stpcpy+0xe>
            if (!(*d = *s))
    1b7e:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1b82:	0585                	addi	a1,a1,1
    1b84:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1b88:	00f50023          	sb	a5,0(a0)
    1b8c:	f7fd                	bnez	a5,1b7a <stpcpy+0x54>
}
    1b8e:	8082                	ret
    1b90:	8082                	ret

0000000000001b92 <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b92:	00b547b3          	xor	a5,a0,a1
    1b96:	8b9d                	andi	a5,a5,7
    1b98:	1a079863          	bnez	a5,1d48 <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b9c:	0075f793          	andi	a5,a1,7
    1ba0:	16078463          	beqz	a5,1d08 <stpncpy+0x176>
    1ba4:	ea01                	bnez	a2,1bb4 <stpncpy+0x22>
    1ba6:	a421                	j	1dae <stpncpy+0x21c>
    1ba8:	167d                	addi	a2,a2,-1
    1baa:	0505                	addi	a0,a0,1
    1bac:	14070e63          	beqz	a4,1d08 <stpncpy+0x176>
    1bb0:	1a060863          	beqz	a2,1d60 <stpncpy+0x1ce>
    1bb4:	0005c783          	lbu	a5,0(a1)
    1bb8:	0585                	addi	a1,a1,1
    1bba:	0075f713          	andi	a4,a1,7
    1bbe:	00f50023          	sb	a5,0(a0)
    1bc2:	f3fd                	bnez	a5,1ba8 <stpncpy+0x16>
    1bc4:	4805                	li	a6,1
    1bc6:	1a061863          	bnez	a2,1d76 <stpncpy+0x1e4>
    1bca:	40a007b3          	neg	a5,a0
    1bce:	8b9d                	andi	a5,a5,7
    1bd0:	4681                	li	a3,0
    1bd2:	18061a63          	bnez	a2,1d66 <stpncpy+0x1d4>
    1bd6:	00778713          	addi	a4,a5,7
    1bda:	45ad                	li	a1,11
    1bdc:	18b76363          	bltu	a4,a1,1d62 <stpncpy+0x1d0>
    1be0:	1ae6eb63          	bltu	a3,a4,1d96 <stpncpy+0x204>
    1be4:	1a078363          	beqz	a5,1d8a <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1be8:	00050023          	sb	zero,0(a0)
    1bec:	4685                	li	a3,1
    1bee:	00150713          	addi	a4,a0,1
    1bf2:	18d78f63          	beq	a5,a3,1d90 <stpncpy+0x1fe>
    1bf6:	000500a3          	sb	zero,1(a0)
    1bfa:	4689                	li	a3,2
    1bfc:	00250713          	addi	a4,a0,2
    1c00:	18d78e63          	beq	a5,a3,1d9c <stpncpy+0x20a>
    1c04:	00050123          	sb	zero,2(a0)
    1c08:	468d                	li	a3,3
    1c0a:	00350713          	addi	a4,a0,3
    1c0e:	16d78c63          	beq	a5,a3,1d86 <stpncpy+0x1f4>
    1c12:	000501a3          	sb	zero,3(a0)
    1c16:	4691                	li	a3,4
    1c18:	00450713          	addi	a4,a0,4
    1c1c:	18d78263          	beq	a5,a3,1da0 <stpncpy+0x20e>
    1c20:	00050223          	sb	zero,4(a0)
    1c24:	4695                	li	a3,5
    1c26:	00550713          	addi	a4,a0,5
    1c2a:	16d78d63          	beq	a5,a3,1da4 <stpncpy+0x212>
    1c2e:	000502a3          	sb	zero,5(a0)
    1c32:	469d                	li	a3,7
    1c34:	00650713          	addi	a4,a0,6
    1c38:	16d79863          	bne	a5,a3,1da8 <stpncpy+0x216>
    1c3c:	00750713          	addi	a4,a0,7
    1c40:	00050323          	sb	zero,6(a0)
    1c44:	40f80833          	sub	a6,a6,a5
    1c48:	ff887593          	andi	a1,a6,-8
    1c4c:	97aa                	add	a5,a5,a0
    1c4e:	95be                	add	a1,a1,a5
    1c50:	0007b023          	sd	zero,0(a5)
    1c54:	07a1                	addi	a5,a5,8
    1c56:	feb79de3          	bne	a5,a1,1c50 <stpncpy+0xbe>
    1c5a:	ff887593          	andi	a1,a6,-8
    1c5e:	9ead                	addw	a3,a3,a1
    1c60:	00b707b3          	add	a5,a4,a1
    1c64:	12b80863          	beq	a6,a1,1d94 <stpncpy+0x202>
    1c68:	00078023          	sb	zero,0(a5)
    1c6c:	0016871b          	addiw	a4,a3,1
    1c70:	0ec77863          	bgeu	a4,a2,1d60 <stpncpy+0x1ce>
    1c74:	000780a3          	sb	zero,1(a5)
    1c78:	0026871b          	addiw	a4,a3,2
    1c7c:	0ec77263          	bgeu	a4,a2,1d60 <stpncpy+0x1ce>
    1c80:	00078123          	sb	zero,2(a5)
    1c84:	0036871b          	addiw	a4,a3,3
    1c88:	0cc77c63          	bgeu	a4,a2,1d60 <stpncpy+0x1ce>
    1c8c:	000781a3          	sb	zero,3(a5)
    1c90:	0046871b          	addiw	a4,a3,4
    1c94:	0cc77663          	bgeu	a4,a2,1d60 <stpncpy+0x1ce>
    1c98:	00078223          	sb	zero,4(a5)
    1c9c:	0056871b          	addiw	a4,a3,5
    1ca0:	0cc77063          	bgeu	a4,a2,1d60 <stpncpy+0x1ce>
    1ca4:	000782a3          	sb	zero,5(a5)
    1ca8:	0066871b          	addiw	a4,a3,6
    1cac:	0ac77a63          	bgeu	a4,a2,1d60 <stpncpy+0x1ce>
    1cb0:	00078323          	sb	zero,6(a5)
    1cb4:	0076871b          	addiw	a4,a3,7
    1cb8:	0ac77463          	bgeu	a4,a2,1d60 <stpncpy+0x1ce>
    1cbc:	000783a3          	sb	zero,7(a5)
    1cc0:	0086871b          	addiw	a4,a3,8
    1cc4:	08c77e63          	bgeu	a4,a2,1d60 <stpncpy+0x1ce>
    1cc8:	00078423          	sb	zero,8(a5)
    1ccc:	0096871b          	addiw	a4,a3,9
    1cd0:	08c77863          	bgeu	a4,a2,1d60 <stpncpy+0x1ce>
    1cd4:	000784a3          	sb	zero,9(a5)
    1cd8:	00a6871b          	addiw	a4,a3,10
    1cdc:	08c77263          	bgeu	a4,a2,1d60 <stpncpy+0x1ce>
    1ce0:	00078523          	sb	zero,10(a5)
    1ce4:	00b6871b          	addiw	a4,a3,11
    1ce8:	06c77c63          	bgeu	a4,a2,1d60 <stpncpy+0x1ce>
    1cec:	000785a3          	sb	zero,11(a5)
    1cf0:	00c6871b          	addiw	a4,a3,12
    1cf4:	06c77663          	bgeu	a4,a2,1d60 <stpncpy+0x1ce>
    1cf8:	00078623          	sb	zero,12(a5)
    1cfc:	26b5                	addiw	a3,a3,13
    1cfe:	06c6f163          	bgeu	a3,a2,1d60 <stpncpy+0x1ce>
    1d02:	000786a3          	sb	zero,13(a5)
    1d06:	8082                	ret
            ;
        if (!n || !*s)
    1d08:	c645                	beqz	a2,1db0 <stpncpy+0x21e>
    1d0a:	0005c783          	lbu	a5,0(a1)
    1d0e:	ea078be3          	beqz	a5,1bc4 <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d12:	479d                	li	a5,7
    1d14:	02c7ff63          	bgeu	a5,a2,1d52 <stpncpy+0x1c0>
    1d18:	00000897          	auipc	a7,0x0
    1d1c:	2908b883          	ld	a7,656(a7) # 1fa8 <unlink+0x2c>
    1d20:	00000817          	auipc	a6,0x0
    1d24:	29083803          	ld	a6,656(a6) # 1fb0 <unlink+0x34>
    1d28:	431d                	li	t1,7
    1d2a:	6198                	ld	a4,0(a1)
    1d2c:	011707b3          	add	a5,a4,a7
    1d30:	fff74693          	not	a3,a4
    1d34:	8ff5                	and	a5,a5,a3
    1d36:	0107f7b3          	and	a5,a5,a6
    1d3a:	ef81                	bnez	a5,1d52 <stpncpy+0x1c0>
            *wd = *ws;
    1d3c:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d3e:	1661                	addi	a2,a2,-8
    1d40:	05a1                	addi	a1,a1,8
    1d42:	0521                	addi	a0,a0,8
    1d44:	fec363e3          	bltu	t1,a2,1d2a <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1d48:	e609                	bnez	a2,1d52 <stpncpy+0x1c0>
    1d4a:	a08d                	j	1dac <stpncpy+0x21a>
    1d4c:	167d                	addi	a2,a2,-1
    1d4e:	0505                	addi	a0,a0,1
    1d50:	ca01                	beqz	a2,1d60 <stpncpy+0x1ce>
    1d52:	0005c783          	lbu	a5,0(a1)
    1d56:	0585                	addi	a1,a1,1
    1d58:	00f50023          	sb	a5,0(a0)
    1d5c:	fbe5                	bnez	a5,1d4c <stpncpy+0x1ba>
        ;
tail:
    1d5e:	b59d                	j	1bc4 <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1d60:	8082                	ret
    1d62:	472d                	li	a4,11
    1d64:	bdb5                	j	1be0 <stpncpy+0x4e>
    1d66:	00778713          	addi	a4,a5,7
    1d6a:	45ad                	li	a1,11
    1d6c:	fff60693          	addi	a3,a2,-1
    1d70:	e6b778e3          	bgeu	a4,a1,1be0 <stpncpy+0x4e>
    1d74:	b7fd                	j	1d62 <stpncpy+0x1d0>
    1d76:	40a007b3          	neg	a5,a0
    1d7a:	8832                	mv	a6,a2
    1d7c:	8b9d                	andi	a5,a5,7
    1d7e:	4681                	li	a3,0
    1d80:	e4060be3          	beqz	a2,1bd6 <stpncpy+0x44>
    1d84:	b7cd                	j	1d66 <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d86:	468d                	li	a3,3
    1d88:	bd75                	j	1c44 <stpncpy+0xb2>
    1d8a:	872a                	mv	a4,a0
    1d8c:	4681                	li	a3,0
    1d8e:	bd5d                	j	1c44 <stpncpy+0xb2>
    1d90:	4685                	li	a3,1
    1d92:	bd4d                	j	1c44 <stpncpy+0xb2>
    1d94:	8082                	ret
    1d96:	87aa                	mv	a5,a0
    1d98:	4681                	li	a3,0
    1d9a:	b5f9                	j	1c68 <stpncpy+0xd6>
    1d9c:	4689                	li	a3,2
    1d9e:	b55d                	j	1c44 <stpncpy+0xb2>
    1da0:	4691                	li	a3,4
    1da2:	b54d                	j	1c44 <stpncpy+0xb2>
    1da4:	4695                	li	a3,5
    1da6:	bd79                	j	1c44 <stpncpy+0xb2>
    1da8:	4699                	li	a3,6
    1daa:	bd69                	j	1c44 <stpncpy+0xb2>
    1dac:	8082                	ret
    1dae:	8082                	ret
    1db0:	8082                	ret

0000000000001db2 <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1db2:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1db6:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db8:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1dbc:	2501                	sext.w	a0,a0
    1dbe:	8082                	ret

0000000000001dc0 <close>:
    register long a7 __asm__("a7") = n;
    1dc0:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1dc4:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1dc8:	2501                	sext.w	a0,a0
    1dca:	8082                	ret

0000000000001dcc <read>:
    register long a7 __asm__("a7") = n;
    1dcc:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd0:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1dd4:	8082                	ret

0000000000001dd6 <write>:
    register long a7 __asm__("a7") = n;
    1dd6:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dda:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1dde:	8082                	ret

0000000000001de0 <getpid>:
    register long a7 __asm__("a7") = n;
    1de0:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1de4:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1de8:	2501                	sext.w	a0,a0
    1dea:	8082                	ret

0000000000001dec <sched_yield>:
    register long a7 __asm__("a7") = n;
    1dec:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1df0:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1df4:	2501                	sext.w	a0,a0
    1df6:	8082                	ret

0000000000001df8 <fork>:
    register long a7 __asm__("a7") = n;
    1df8:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1dfc:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1e00:	2501                	sext.w	a0,a0
    1e02:	8082                	ret

0000000000001e04 <exit>:
    register long a7 __asm__("a7") = n;
    1e04:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e08:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e0c:	8082                	ret

0000000000001e0e <waitpid>:
    register long a7 __asm__("a7") = n;
    1e0e:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e12:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1e16:	2501                	sext.w	a0,a0
    1e18:	8082                	ret

0000000000001e1a <exec>:
    register long a7 __asm__("a7") = n;
    1e1a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e1e:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e22:	2501                	sext.w	a0,a0
    1e24:	8082                	ret

0000000000001e26 <get_time>:

int64 get_time()
{
    1e26:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e28:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e2c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e2e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e30:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e34:	2501                	sext.w	a0,a0
    1e36:	ed09                	bnez	a0,1e50 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e38:	67a2                	ld	a5,8(sp)
    1e3a:	3e800713          	li	a4,1000
    1e3e:	00015503          	lhu	a0,0(sp)
    1e42:	02e7d7b3          	divu	a5,a5,a4
    1e46:	02e50533          	mul	a0,a0,a4
    1e4a:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e4c:	0141                	addi	sp,sp,16
    1e4e:	8082                	ret
        return -1;
    1e50:	557d                	li	a0,-1
    1e52:	bfed                	j	1e4c <get_time+0x26>

0000000000001e54 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e54:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e58:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e5c:	2501                	sext.w	a0,a0
    1e5e:	8082                	ret

0000000000001e60 <sleep>:

int sleep(unsigned long long time)
{
    1e60:	1141                	addi	sp,sp,-16
    1e62:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1e64:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e68:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e6a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e6c:	00000073          	ecall
    if (err == 0)
    1e70:	2501                	sext.w	a0,a0
    1e72:	e13d                	bnez	a0,1ed8 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e74:	6722                	ld	a4,8(sp)
    1e76:	3e800693          	li	a3,1000
    1e7a:	00015783          	lhu	a5,0(sp)
    1e7e:	02d75733          	divu	a4,a4,a3
    1e82:	02d787b3          	mul	a5,a5,a3
    1e86:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1e88:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e8c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e8e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e90:	00000073          	ecall
    if (err == 0)
    1e94:	2501                	sext.w	a0,a0
    1e96:	ed15                	bnez	a0,1ed2 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e98:	6841                	lui	a6,0x10
    1e9a:	963e                	add	a2,a2,a5
    1e9c:	187d                	addi	a6,a6,-1
    1e9e:	3e800693          	li	a3,1000
    1ea2:	a819                	j	1eb8 <sleep+0x58>
    __asm_syscall("r"(a7))
    1ea4:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1ea8:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1eac:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1eae:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb0:	00000073          	ecall
    if (err == 0)
    1eb4:	2501                	sext.w	a0,a0
    1eb6:	ed11                	bnez	a0,1ed2 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1eb8:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1eba:	07c00893          	li	a7,124
    1ebe:	02d7d733          	divu	a4,a5,a3
    1ec2:	6782                	ld	a5,0(sp)
    1ec4:	0107f7b3          	and	a5,a5,a6
    1ec8:	02d787b3          	mul	a5,a5,a3
    1ecc:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1ece:	fcc7ebe3          	bltu	a5,a2,1ea4 <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1ed2:	4501                	li	a0,0
    1ed4:	0141                	addi	sp,sp,16
    1ed6:	8082                	ret
    1ed8:	57fd                	li	a5,-1
    1eda:	b77d                	j	1e88 <sleep+0x28>

0000000000001edc <set_priority>:
    register long a7 __asm__("a7") = n;
    1edc:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1ee0:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1ee4:	2501                	sext.w	a0,a0
    1ee6:	8082                	ret

0000000000001ee8 <mmap>:
    register long a7 __asm__("a7") = n;
    1ee8:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eec:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1ef0:	2501                	sext.w	a0,a0
    1ef2:	8082                	ret

0000000000001ef4 <munmap>:
    register long a7 __asm__("a7") = n;
    1ef4:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef8:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1efc:	2501                	sext.w	a0,a0
    1efe:	8082                	ret

0000000000001f00 <wait>:

int wait(int *code)
{
    1f00:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f02:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1f06:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f08:	00000073          	ecall
    return waitpid(-1, code);
}
    1f0c:	2501                	sext.w	a0,a0
    1f0e:	8082                	ret

0000000000001f10 <spawn>:
    register long a7 __asm__("a7") = n;
    1f10:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1f14:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f18:	2501                	sext.w	a0,a0
    1f1a:	8082                	ret

0000000000001f1c <mailread>:
    register long a7 __asm__("a7") = n;
    1f1c:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f20:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f24:	2501                	sext.w	a0,a0
    1f26:	8082                	ret

0000000000001f28 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f28:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f2c:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f30:	2501                	sext.w	a0,a0
    1f32:	8082                	ret

0000000000001f34 <fstat>:
    register long a7 __asm__("a7") = n;
    1f34:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f38:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f3c:	2501                	sext.w	a0,a0
    1f3e:	8082                	ret

0000000000001f40 <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1f40:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f42:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f46:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f48:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f4c:	2501                	sext.w	a0,a0
    1f4e:	8082                	ret

0000000000001f50 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f50:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f52:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f56:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f58:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f5c:	2501                	sext.w	a0,a0
    1f5e:	8082                	ret

0000000000001f60 <link>:

int link(char *old_path, char *new_path)
{
    1f60:	87aa                	mv	a5,a0
    1f62:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f64:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f68:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f6c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f6e:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f72:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f74:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f78:	2501                	sext.w	a0,a0
    1f7a:	8082                	ret

0000000000001f7c <unlink>:

int unlink(char *path)
{
    1f7c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f7e:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f82:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f86:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f88:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f8c:	2501                	sext.w	a0,a0
    1f8e:	8082                	ret
