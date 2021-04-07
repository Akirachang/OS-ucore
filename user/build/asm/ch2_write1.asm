
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch2_write1:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0be0006f          	j	10c0 <__start_main>

0000000000001006 <main>:
/// strinstring from stack section
/// strin
/// Test write1 OK!

int main(void)
{
    1006:	1101                	addi	sp,sp,-32
    1008:	e426                	sd	s1,8(sp)
    int str_len = strlen(DATA_STRING);
    100a:	00001497          	auipc	s1,0x1
    100e:	06648493          	addi	s1,s1,102 # 2070 <DATA_STRING>
    1012:	6088                	ld	a0,0(s1)
{
    1014:	ec06                	sd	ra,24(sp)
    1016:	e822                	sd	s0,16(sp)
    int str_len = strlen(DATA_STRING);
    1018:	245000ef          	jal	ra,1a5c <strlen>
    assert(write(1234, DATA_STRING, str_len) == -1);
    101c:	608c                	ld	a1,0(s1)
    int str_len = strlen(DATA_STRING);
    101e:	0005041b          	sext.w	s0,a0
    assert(write(1234, DATA_STRING, str_len) == -1);
    1022:	8622                	mv	a2,s0
    1024:	4d200513          	li	a0,1234
    1028:	5ff000ef          	jal	ra,1e26 <write>
    102c:	57fd                	li	a5,-1
    102e:	00f50563          	beq	a0,a5,1038 <main+0x32>
    1032:	557d                	li	a0,-1
    1034:	621000ef          	jal	ra,1e54 <exit>
    assert(write(stdout, DATA_STRING, str_len) == str_len);
    1038:	608c                	ld	a1,0(s1)
    103a:	8622                	mv	a2,s0
    103c:	4505                	li	a0,1
    103e:	5e9000ef          	jal	ra,1e26 <write>
    1042:	00850563          	beq	a0,s0,104c <main+0x46>
    1046:	557d                	li	a0,-1
    1048:	60d000ef          	jal	ra,1e54 <exit>
    assert(write(stdout, DATA_STRING, 5) == 5);
    104c:	608c                	ld	a1,0(s1)
    104e:	4615                	li	a2,5
    1050:	4505                	li	a0,1
    1052:	5d5000ef          	jal	ra,1e26 <write>
    1056:	4795                	li	a5,5
    1058:	00f50563          	beq	a0,a5,1062 <main+0x5c>
    105c:	557d                	li	a0,-1
    105e:	5f7000ef          	jal	ra,1e54 <exit>
    char *stack_string = "string from stack section\n";
    str_len = strlen(stack_string);
    1062:	00001517          	auipc	a0,0x1
    1066:	f7e50513          	addi	a0,a0,-130 # 1fe0 <unlink+0x14>
    106a:	1f3000ef          	jal	ra,1a5c <strlen>
    106e:	0005041b          	sext.w	s0,a0
    assert(write(stdout, stack_string, str_len) == str_len);
    1072:	8622                	mv	a2,s0
    1074:	00001597          	auipc	a1,0x1
    1078:	f6c58593          	addi	a1,a1,-148 # 1fe0 <unlink+0x14>
    107c:	4505                	li	a0,1
    107e:	5a9000ef          	jal	ra,1e26 <write>
    1082:	00850563          	beq	a0,s0,108c <main+0x86>
    1086:	557d                	li	a0,-1
    1088:	5cd000ef          	jal	ra,1e54 <exit>
    assert(write(stdout, stack_string, 5) == 5);
    108c:	4615                	li	a2,5
    108e:	00001597          	auipc	a1,0x1
    1092:	f5258593          	addi	a1,a1,-174 # 1fe0 <unlink+0x14>
    1096:	4505                	li	a0,1
    1098:	58f000ef          	jal	ra,1e26 <write>
    109c:	4795                	li	a5,5
    109e:	00f50563          	beq	a0,a5,10a8 <main+0xa2>
    10a2:	557d                	li	a0,-1
    10a4:	5b1000ef          	jal	ra,1e54 <exit>
    puts("\nTest write1 OK!");
    10a8:	00001517          	auipc	a0,0x1
    10ac:	f5850513          	addi	a0,a0,-168 # 2000 <unlink+0x34>
    10b0:	060000ef          	jal	ra,1110 <puts>
    return 0;
}
    10b4:	60e2                	ld	ra,24(sp)
    10b6:	6442                	ld	s0,16(sp)
    10b8:	64a2                	ld	s1,8(sp)
    10ba:	4501                	li	a0,0
    10bc:	6105                	addi	sp,sp,32
    10be:	8082                	ret

00000000000010c0 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10c0:	1141                	addi	sp,sp,-16
    10c2:	e406                	sd	ra,8(sp)
    exit(main());
    10c4:	f43ff0ef          	jal	ra,1006 <main>
    10c8:	58d000ef          	jal	ra,1e54 <exit>
    return 0;
}
    10cc:	60a2                	ld	ra,8(sp)
    10ce:	4501                	li	a0,0
    10d0:	0141                	addi	sp,sp,16
    10d2:	8082                	ret

00000000000010d4 <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    10d4:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    10d6:	00f10593          	addi	a1,sp,15
    10da:	4605                	li	a2,1
    10dc:	4501                	li	a0,0
{
    10de:	ec06                	sd	ra,24(sp)
    char byte = 0;
    10e0:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    10e4:	539000ef          	jal	ra,1e1c <read>
    return byte;
}
    10e8:	60e2                	ld	ra,24(sp)
    10ea:	00f14503          	lbu	a0,15(sp)
    10ee:	6105                	addi	sp,sp,32
    10f0:	8082                	ret

00000000000010f2 <putchar>:

int putchar(int c)
{
    10f2:	1101                	addi	sp,sp,-32
    10f4:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    10f6:	00f10593          	addi	a1,sp,15
    10fa:	4605                	li	a2,1
    10fc:	4505                	li	a0,1
{
    10fe:	ec06                	sd	ra,24(sp)
    char byte = c;
    1100:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1104:	523000ef          	jal	ra,1e26 <write>
}
    1108:	60e2                	ld	ra,24(sp)
    110a:	2501                	sext.w	a0,a0
    110c:	6105                	addi	sp,sp,32
    110e:	8082                	ret

0000000000001110 <puts>:

int puts(const char *s)
{
    1110:	1101                	addi	sp,sp,-32
    1112:	e822                	sd	s0,16(sp)
    1114:	ec06                	sd	ra,24(sp)
    1116:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    1118:	145000ef          	jal	ra,1a5c <strlen>
    111c:	862a                	mv	a2,a0
    111e:	85a2                	mv	a1,s0
    1120:	4505                	li	a0,1
    1122:	505000ef          	jal	ra,1e26 <write>
    1126:	00055763          	bgez	a0,1134 <puts+0x24>
    return r;
}
    112a:	60e2                	ld	ra,24(sp)
    112c:	6442                	ld	s0,16(sp)
    112e:	557d                	li	a0,-1
    1130:	6105                	addi	sp,sp,32
    1132:	8082                	ret
    return write(stdout, &byte, 1);
    1134:	00f10593          	addi	a1,sp,15
    char byte = c;
    1138:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    113a:	4605                	li	a2,1
    113c:	4505                	li	a0,1
    char byte = c;
    113e:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1142:	4e5000ef          	jal	ra,1e26 <write>
}
    1146:	60e2                	ld	ra,24(sp)
    1148:	6442                	ld	s0,16(sp)
    114a:	41f5551b          	sraiw	a0,a0,0x1f
    114e:	6105                	addi	sp,sp,32
    1150:	8082                	ret

0000000000001152 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1152:	7131                	addi	sp,sp,-192
    1154:	ecce                	sd	s3,88(sp)
    1156:	e8d2                	sd	s4,80(sp)
    1158:	e4d6                	sd	s5,72(sp)
    115a:	e0da                	sd	s6,64(sp)
    115c:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    115e:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1160:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    1162:	6ae1                	lui	s5,0x18
    1164:	000f4a37          	lui	s4,0xf4
    1168:	00989b37          	lui	s6,0x989
{
    116c:	fc86                	sd	ra,120(sp)
    116e:	f8a2                	sd	s0,112(sp)
    1170:	f4a6                	sd	s1,104(sp)
    1172:	f0ca                	sd	s2,96(sp)
    1174:	fc5e                	sd	s7,56(sp)
    1176:	e52e                	sd	a1,136(sp)
    1178:	e932                	sd	a2,144(sp)
    117a:	ed36                	sd	a3,152(sp)
    117c:	f13a                	sd	a4,160(sp)
    117e:	f942                	sd	a6,176(sp)
    1180:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1182:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    1184:	70f98993          	addi	s3,s3,1807 # 270f <DATA_STRING+0x69f>
    1188:	69fa8a93          	addi	s5,s5,1695 # 1869f <DATA_STRING+0x1662f>
    118c:	23fa0a13          	addi	s4,s4,575 # f423f <DATA_STRING+0xf21cf>
    1190:	67fb0b13          	addi	s6,s6,1663 # 98967f <DATA_STRING+0x98760f>
    for (;;)
    {
        if (!*s)
    1194:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    1198:	02500913          	li	s2,37
        if (!*s)
    119c:	1a078f63          	beqz	a5,135a <printf+0x208>
    11a0:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    11a2:	17278e63          	beq	a5,s2,131e <printf+0x1cc>
    11a6:	00164783          	lbu	a5,1(a2)
    11aa:	0605                	addi	a2,a2,1
    11ac:	fbfd                	bnez	a5,11a2 <printf+0x50>
    11ae:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    11b0:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    11b4:	85aa                	mv	a1,a0
    11b6:	8622                	mv	a2,s0
    11b8:	4505                	li	a0,1
    11ba:	46d000ef          	jal	ra,1e26 <write>
        out(f, a, l);
        if (l)
    11be:	18041963          	bnez	s0,1350 <printf+0x1fe>
            continue;
        if (s[1] == 0)
    11c2:	0014c783          	lbu	a5,1(s1)
    11c6:	18078a63          	beqz	a5,135a <printf+0x208>
            break;
        switch (s[1])
    11ca:	07300713          	li	a4,115
    11ce:	28e78e63          	beq	a5,a4,146a <printf+0x318>
    11d2:	18f76f63          	bltu	a4,a5,1370 <printf+0x21e>
    11d6:	06400713          	li	a4,100
    11da:	2ae78c63          	beq	a5,a4,1492 <printf+0x340>
    11de:	07000713          	li	a4,112
    11e2:	3ce79c63          	bne	a5,a4,15ba <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    11e6:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    11e8:	00001797          	auipc	a5,0x1
    11ec:	e7078793          	addi	a5,a5,-400 # 2058 <digits>
            printptr(va_arg(ap, uint64));
    11f0:	6298                	ld	a4,0(a3)
    11f2:	00868093          	addi	ra,a3,8
    11f6:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    11f8:	00471293          	slli	t0,a4,0x4
    11fc:	00c71f13          	slli	t5,a4,0xc
    1200:	01471e13          	slli	t3,a4,0x14
    1204:	01c71893          	slli	a7,a4,0x1c
    1208:	02471813          	slli	a6,a4,0x24
    120c:	02871513          	slli	a0,a4,0x28
    1210:	02c71593          	slli	a1,a4,0x2c
    1214:	03071693          	slli	a3,a4,0x30
    1218:	00871f93          	slli	t6,a4,0x8
    121c:	01071e93          	slli	t4,a4,0x10
    1220:	01871313          	slli	t1,a4,0x18
    1224:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1228:	03c2d293          	srli	t0,t0,0x3c
    122c:	03cf5f13          	srli	t5,t5,0x3c
    1230:	03ce5e13          	srli	t3,t3,0x3c
    1234:	03c8d893          	srli	a7,a7,0x3c
    1238:	03c85813          	srli	a6,a6,0x3c
    123c:	9171                	srli	a0,a0,0x3c
    123e:	91f1                	srli	a1,a1,0x3c
    1240:	92f1                	srli	a3,a3,0x3c
    1242:	92be                	add	t0,t0,a5
    1244:	9f3e                	add	t5,t5,a5
    1246:	9e3e                	add	t3,t3,a5
    1248:	98be                	add	a7,a7,a5
    124a:	983e                	add	a6,a6,a5
    124c:	953e                	add	a0,a0,a5
    124e:	95be                	add	a1,a1,a5
    1250:	96be                	add	a3,a3,a5
    1252:	03c75393          	srli	t2,a4,0x3c
    1256:	01c75b9b          	srliw	s7,a4,0x1c
    125a:	03cfdf93          	srli	t6,t6,0x3c
    125e:	03cede93          	srli	t4,t4,0x3c
    1262:	03c35313          	srli	t1,t1,0x3c
    1266:	9271                	srli	a2,a2,0x3c
    1268:	0002c403          	lbu	s0,0(t0)
    126c:	93be                	add	t2,t2,a5
    126e:	000f4283          	lbu	t0,0(t5)
    1272:	9fbe                	add	t6,t6,a5
    1274:	000e4f03          	lbu	t5,0(t3)
    1278:	9ebe                	add	t4,t4,a5
    127a:	0008ce03          	lbu	t3,0(a7)
    127e:	933e                	add	t1,t1,a5
    1280:	00084883          	lbu	a7,0(a6)
    1284:	9bbe                	add	s7,s7,a5
    1286:	00054803          	lbu	a6,0(a0)
    128a:	963e                	add	a2,a2,a5
    128c:	0005c503          	lbu	a0,0(a1)
    1290:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1294:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1298:	0003c903          	lbu	s2,0(t2)
    129c:	00064603          	lbu	a2,0(a2)
    12a0:	000fc383          	lbu	t2,0(t6)
    12a4:	8b3d                	andi	a4,a4,15
    12a6:	000ecf83          	lbu	t6,0(t4)
    12aa:	92f1                	srli	a3,a3,0x3c
    12ac:	00034e83          	lbu	t4,0(t1)
    12b0:	000bc303          	lbu	t1,0(s7)
    12b4:	96be                	add	a3,a3,a5
    12b6:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    12b8:	7761                	lui	a4,0xffff8
    12ba:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12be:	00710623          	sb	t2,12(sp)
    12c2:	005106a3          	sb	t0,13(sp)
    12c6:	01f10723          	sb	t6,14(sp)
    12ca:	01e107a3          	sb	t5,15(sp)
    12ce:	01d10823          	sb	t4,16(sp)
    12d2:	01c108a3          	sb	t3,17(sp)
    12d6:	00610923          	sb	t1,18(sp)
    12da:	011109a3          	sb	a7,19(sp)
    12de:	01010a23          	sb	a6,20(sp)
    12e2:	00a10aa3          	sb	a0,21(sp)
    12e6:	00b10b23          	sb	a1,22(sp)
    12ea:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    12ee:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12f2:	01210523          	sb	s2,10(sp)
    12f6:	008105a3          	sb	s0,11(sp)
    12fa:	0006c703          	lbu	a4,0(a3)
    12fe:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1302:	4649                	li	a2,18
    1304:	002c                	addi	a1,sp,8
    1306:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1308:	00e10c23          	sb	a4,24(sp)
    130c:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1310:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1314:	313000ef          	jal	ra,1e26 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1318:	00248513          	addi	a0,s1,2
    131c:	bda5                	j	1194 <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    131e:	00064783          	lbu	a5,0(a2)
    1322:	84b2                	mv	s1,a2
    1324:	01278963          	beq	a5,s2,1336 <printf+0x1e4>
    1328:	b561                	j	11b0 <printf+0x5e>
    132a:	0024c783          	lbu	a5,2(s1)
    132e:	0605                	addi	a2,a2,1
    1330:	0489                	addi	s1,s1,2
    1332:	e7279fe3          	bne	a5,s2,11b0 <printf+0x5e>
    1336:	0014c783          	lbu	a5,1(s1)
    133a:	ff2788e3          	beq	a5,s2,132a <printf+0x1d8>
        l = z - a;
    133e:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1342:	85aa                	mv	a1,a0
    1344:	8622                	mv	a2,s0
    1346:	4505                	li	a0,1
    1348:	2df000ef          	jal	ra,1e26 <write>
        if (l)
    134c:	e6040be3          	beqz	s0,11c2 <printf+0x70>
    1350:	8526                	mv	a0,s1
        if (!*s)
    1352:	00054783          	lbu	a5,0(a0)
    1356:	e40795e3          	bnez	a5,11a0 <printf+0x4e>
    }
    va_end(ap);
    135a:	70e6                	ld	ra,120(sp)
    135c:	7446                	ld	s0,112(sp)
    135e:	74a6                	ld	s1,104(sp)
    1360:	7906                	ld	s2,96(sp)
    1362:	69e6                	ld	s3,88(sp)
    1364:	6a46                	ld	s4,80(sp)
    1366:	6aa6                	ld	s5,72(sp)
    1368:	6b06                	ld	s6,64(sp)
    136a:	7be2                	ld	s7,56(sp)
    136c:	6129                	addi	sp,sp,192
    136e:	8082                	ret
        switch (s[1])
    1370:	07800713          	li	a4,120
    1374:	24e79363          	bne	a5,a4,15ba <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    1378:	6782                	ld	a5,0(sp)
    137a:	4394                	lw	a3,0(a5)
    137c:	07a1                	addi	a5,a5,8
    137e:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1380:	2606c263          	bltz	a3,15e4 <printf+0x492>
        buf[i--] = digits[x % base];
    1384:	00001797          	auipc	a5,0x1
    1388:	cd478793          	addi	a5,a5,-812 # 2058 <digits>
    138c:	00f6f713          	andi	a4,a3,15
    1390:	973e                	add	a4,a4,a5
    1392:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <DATA_STRING+0xffffffffffff5f90>
    buf[16] = 0;
    1396:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    139a:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    139c:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    13a0:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    13a4:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    13a8:	0046d51b          	srliw	a0,a3,0x4
    13ac:	0ad5d563          	bge	a1,a3,1456 <printf+0x304>
        buf[i--] = digits[x % base];
    13b0:	8a3d                	andi	a2,a2,15
    13b2:	963e                	add	a2,a2,a5
    13b4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    13b8:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    13bc:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    13c0:	30a5fe63          	bgeu	a1,a0,16dc <printf+0x58a>
        buf[i--] = digits[x % base];
    13c4:	00f77613          	andi	a2,a4,15
    13c8:	963e                	add	a2,a2,a5
    13ca:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13ce:	45bd                	li	a1,15
    13d0:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    13d4:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    13d8:	00475513          	srli	a0,a4,0x4
    13dc:	30e5f963          	bgeu	a1,a4,16ee <printf+0x59c>
        buf[i--] = digits[x % base];
    13e0:	8a3d                	andi	a2,a2,15
    13e2:	963e                	add	a2,a2,a5
    13e4:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    13e8:	00875893          	srli	a7,a4,0x8
    13ec:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    13f0:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    13f4:	30a5fd63          	bgeu	a1,a0,170e <printf+0x5bc>
        buf[i--] = digits[x % base];
    13f8:	8a3d                	andi	a2,a2,15
    13fa:	963e                	add	a2,a2,a5
    13fc:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1400:	00c75813          	srli	a6,a4,0xc
    1404:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    1408:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    140c:	3315fe63          	bgeu	a1,a7,1748 <printf+0x5f6>
        buf[i--] = digits[x % base];
    1410:	8a3d                	andi	a2,a2,15
    1412:	963e                	add	a2,a2,a5
    1414:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1418:	01075893          	srli	a7,a4,0x10
    141c:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    1420:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    1424:	3305ff63          	bgeu	a1,a6,1762 <printf+0x610>
        buf[i--] = digits[x % base];
    1428:	8a3d                	andi	a2,a2,15
    142a:	963e                	add	a2,a2,a5
    142c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1430:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    1434:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1438:	3515f863          	bgeu	a1,a7,1788 <printf+0x636>
        buf[i--] = digits[x % base];
    143c:	97ba                	add	a5,a5,a4
    143e:	0007c783          	lbu	a5,0(a5)
    1442:	45a1                	li	a1,8
    1444:	00f10823          	sb	a5,16(sp)
    if (sign)
    1448:	0006d763          	bgez	a3,1456 <printf+0x304>
        buf[i--] = '-';
    144c:	02d00793          	li	a5,45
    1450:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1454:	459d                	li	a1,7
    write(f, s, l);
    1456:	4641                	li	a2,16
    1458:	003c                	addi	a5,sp,8
    145a:	9e0d                	subw	a2,a2,a1
    145c:	4505                	li	a0,1
    145e:	95be                	add	a1,a1,a5
    1460:	1c7000ef          	jal	ra,1e26 <write>
        s += 2;
    1464:	00248513          	addi	a0,s1,2
    1468:	b335                	j	1194 <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    146a:	6782                	ld	a5,0(sp)
    146c:	6380                	ld	s0,0(a5)
    146e:	07a1                	addi	a5,a5,8
    1470:	e03e                	sd	a5,0(sp)
    1472:	22040a63          	beqz	s0,16a6 <printf+0x554>
            l = strnlen(a, 200);
    1476:	0c800593          	li	a1,200
    147a:	8522                	mv	a0,s0
    147c:	6cc000ef          	jal	ra,1b48 <strnlen>
    write(f, s, l);
    1480:	0005061b          	sext.w	a2,a0
    1484:	85a2                	mv	a1,s0
    1486:	4505                	li	a0,1
    1488:	19f000ef          	jal	ra,1e26 <write>
        s += 2;
    148c:	00248513          	addi	a0,s1,2
    1490:	b311                	j	1194 <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    1492:	6782                	ld	a5,0(sp)
    1494:	4390                	lw	a2,0(a5)
    1496:	07a1                	addi	a5,a5,8
    1498:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    149a:	1a064363          	bltz	a2,1640 <printf+0x4ee>
        buf[i--] = digits[x % base];
    149e:	46a9                	li	a3,10
    14a0:	02d6773b          	remuw	a4,a2,a3
    14a4:	00001797          	auipc	a5,0x1
    14a8:	bb478793          	addi	a5,a5,-1100 # 2058 <digits>
    buf[16] = 0;
    14ac:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    14b0:	4525                	li	a0,9
        x = xx;
    14b2:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    14b6:	973e                	add	a4,a4,a5
    14b8:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    14bc:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    14c0:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    14c4:	2cc55063          	bge	a0,a2,1784 <printf+0x632>
    14c8:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    14cc:	02d5f73b          	remuw	a4,a1,a3
    14d0:	1702                	slli	a4,a4,0x20
    14d2:	9301                	srli	a4,a4,0x20
    14d4:	973e                	add	a4,a4,a5
    14d6:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    14da:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    14de:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    14e2:	1f057d63          	bgeu	a0,a6,16dc <printf+0x58a>
        buf[i--] = digits[x % base];
    14e6:	4529                	li	a0,10
    } while ((x /= base) != 0);
    14e8:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    14ea:	02a5f73b          	remuw	a4,a1,a0
    14ee:	973e                	add	a4,a4,a5
    14f0:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    14f4:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    14f8:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    14fc:	1ab6f163          	bgeu	a3,a1,169e <printf+0x54c>
    1500:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    1504:	02a776bb          	remuw	a3,a4,a0
    1508:	96be                	add	a3,a3,a5
    150a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    150e:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1512:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1516:	20b87c63          	bgeu	a6,a1,172e <printf+0x5dc>
    151a:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    151e:	02a776bb          	remuw	a3,a4,a0
    1522:	96be                	add	a3,a3,a5
    1524:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1528:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    152c:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1530:	20b87363          	bgeu	a6,a1,1736 <printf+0x5e4>
        buf[i--] = digits[x % base];
    1534:	02a776bb          	remuw	a3,a4,a0
    1538:	96be                	add	a3,a3,a5
    153a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    153e:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1542:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1546:	20b9f563          	bgeu	s3,a1,1750 <printf+0x5fe>
        buf[i--] = digits[x % base];
    154a:	02a776bb          	remuw	a3,a4,a0
    154e:	96be                	add	a3,a3,a5
    1550:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1554:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1558:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    155c:	20bafb63          	bgeu	s5,a1,1772 <printf+0x620>
        buf[i--] = digits[x % base];
    1560:	02a776bb          	remuw	a3,a4,a0
    1564:	96be                	add	a3,a3,a5
    1566:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    156a:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    156e:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1572:	1eba7c63          	bgeu	s4,a1,176a <printf+0x618>
        buf[i--] = digits[x % base];
    1576:	02a776bb          	remuw	a3,a4,a0
    157a:	96be                	add	a3,a3,a5
    157c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1580:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1584:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1588:	14bb7163          	bgeu	s6,a1,16ca <printf+0x578>
        buf[i--] = digits[x % base];
    158c:	1702                	slli	a4,a4,0x20
    158e:	9301                	srli	a4,a4,0x20
    1590:	97ba                	add	a5,a5,a4
    1592:	0007c783          	lbu	a5,0(a5)
    1596:	4599                	li	a1,6
    1598:	00f10723          	sb	a5,14(sp)
    if (sign)
    159c:	ea065de3          	bgez	a2,1456 <printf+0x304>
        buf[i--] = '-';
    15a0:	02d00793          	li	a5,45
    15a4:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    15a8:	4595                	li	a1,5
    write(f, s, l);
    15aa:	003c                	addi	a5,sp,8
    15ac:	4641                	li	a2,16
    15ae:	9e0d                	subw	a2,a2,a1
    15b0:	4505                	li	a0,1
    15b2:	95be                	add	a1,a1,a5
    15b4:	073000ef          	jal	ra,1e26 <write>
    15b8:	b575                	j	1464 <printf+0x312>
    char byte = c;
    15ba:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    15be:	4605                	li	a2,1
    15c0:	002c                	addi	a1,sp,8
    15c2:	4505                	li	a0,1
    char byte = c;
    15c4:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15c8:	05f000ef          	jal	ra,1e26 <write>
    char byte = c;
    15cc:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15d0:	4605                	li	a2,1
    15d2:	002c                	addi	a1,sp,8
    15d4:	4505                	li	a0,1
    char byte = c;
    15d6:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15da:	04d000ef          	jal	ra,1e26 <write>
        s += 2;
    15de:	00248513          	addi	a0,s1,2
    15e2:	be4d                	j	1194 <printf+0x42>
        x = -xx;
    15e4:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    15e8:	00001797          	auipc	a5,0x1
    15ec:	a7078793          	addi	a5,a5,-1424 # 2058 <digits>
    15f0:	00f77613          	andi	a2,a4,15
    15f4:	963e                	add	a2,a2,a5
    15f6:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    15fa:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    15fe:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    1600:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1604:	0047551b          	srliw	a0,a4,0x4
    1608:	0047561b          	srliw	a2,a4,0x4
    160c:	0ab6d263          	bge	a3,a1,16b0 <printf+0x55e>
        buf[i--] = digits[x % base];
    1610:	8a3d                	andi	a2,a2,15
    1612:	963e                	add	a2,a2,a5
    1614:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    1618:	463d                	li	a2,15
    161a:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    161e:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    1622:	daa661e3          	bltu	a2,a0,13c4 <printf+0x272>
        buf[i--] = '-';
    1626:	02d00793          	li	a5,45
    162a:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    162e:	45b5                	li	a1,13
    write(f, s, l);
    1630:	003c                	addi	a5,sp,8
    1632:	4641                	li	a2,16
    1634:	9e0d                	subw	a2,a2,a1
    1636:	4505                	li	a0,1
    1638:	95be                	add	a1,a1,a5
    163a:	7ec000ef          	jal	ra,1e26 <write>
    163e:	b51d                	j	1464 <printf+0x312>
        x = -xx;
    1640:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    1644:	46a9                	li	a3,10
    1646:	02d875bb          	remuw	a1,a6,a3
    164a:	00001797          	auipc	a5,0x1
    164e:	a0e78793          	addi	a5,a5,-1522 # 2058 <digits>
    buf[16] = 0;
    1652:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1656:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    1658:	95be                	add	a1,a1,a5
    165a:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    165e:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    1662:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    1666:	04a65563          	bge	a2,a0,16b0 <printf+0x55e>
    166a:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    166e:	02d775bb          	remuw	a1,a4,a3
    1672:	95be                	add	a1,a1,a5
    1674:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    1678:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    167c:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    1680:	fb0573e3          	bgeu	a0,a6,1626 <printf+0x4d4>
        buf[i--] = digits[x % base];
    1684:	4529                	li	a0,10
    } while ((x /= base) != 0);
    1686:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1688:	02a5f73b          	remuw	a4,a1,a0
    168c:	973e                	add	a4,a4,a5
    168e:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    1692:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    1696:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    169a:	e6b6e3e3          	bltu	a3,a1,1500 <printf+0x3ae>
        buf[i--] = digits[x % base];
    169e:	45b5                	li	a1,13
    if (sign)
    16a0:	da065be3          	bgez	a2,1456 <printf+0x304>
    16a4:	a881                	j	16f4 <printf+0x5a2>
                a = "(null)";
    16a6:	00001417          	auipc	s0,0x1
    16aa:	99240413          	addi	s0,s0,-1646 # 2038 <unlink+0x6c>
    16ae:	b3e1                	j	1476 <printf+0x324>
        buf[i--] = '-';
    16b0:	02d00793          	li	a5,45
    16b4:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    16b8:	45b9                	li	a1,14
    write(f, s, l);
    16ba:	003c                	addi	a5,sp,8
    16bc:	4641                	li	a2,16
    16be:	9e0d                	subw	a2,a2,a1
    16c0:	4505                	li	a0,1
    16c2:	95be                	add	a1,a1,a5
    16c4:	762000ef          	jal	ra,1e26 <write>
    16c8:	bb71                	j	1464 <printf+0x312>
        buf[i--] = digits[x % base];
    16ca:	459d                	li	a1,7
    if (sign)
    16cc:	d80655e3          	bgez	a2,1456 <printf+0x304>
        buf[i--] = '-';
    16d0:	02d00793          	li	a5,45
    16d4:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    16d8:	4599                	li	a1,6
    16da:	bbb5                	j	1456 <printf+0x304>
    16dc:	45b9                	li	a1,14
    write(f, s, l);
    16de:	003c                	addi	a5,sp,8
    16e0:	4641                	li	a2,16
    16e2:	9e0d                	subw	a2,a2,a1
    16e4:	4505                	li	a0,1
    16e6:	95be                	add	a1,a1,a5
    16e8:	73e000ef          	jal	ra,1e26 <write>
    16ec:	bba5                	j	1464 <printf+0x312>
        buf[i--] = digits[x % base];
    16ee:	45b5                	li	a1,13
    if (sign)
    16f0:	d606d3e3          	bgez	a3,1456 <printf+0x304>
        buf[i--] = '-';
    16f4:	02d00793          	li	a5,45
    16f8:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    16fc:	45b1                	li	a1,12
    write(f, s, l);
    16fe:	003c                	addi	a5,sp,8
    1700:	4641                	li	a2,16
    1702:	9e0d                	subw	a2,a2,a1
    1704:	4505                	li	a0,1
    1706:	95be                	add	a1,a1,a5
    1708:	71e000ef          	jal	ra,1e26 <write>
    170c:	bba1                	j	1464 <printf+0x312>
        buf[i--] = digits[x % base];
    170e:	45b1                	li	a1,12
    if (sign)
    1710:	d406d3e3          	bgez	a3,1456 <printf+0x304>
        buf[i--] = '-';
    1714:	02d00793          	li	a5,45
    1718:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    171c:	45ad                	li	a1,11
    write(f, s, l);
    171e:	003c                	addi	a5,sp,8
    1720:	4641                	li	a2,16
    1722:	9e0d                	subw	a2,a2,a1
    1724:	4505                	li	a0,1
    1726:	95be                	add	a1,a1,a5
    1728:	6fe000ef          	jal	ra,1e26 <write>
    172c:	bb25                	j	1464 <printf+0x312>
        buf[i--] = digits[x % base];
    172e:	45b1                	li	a1,12
    if (sign)
    1730:	d20653e3          	bgez	a2,1456 <printf+0x304>
    1734:	b7c5                	j	1714 <printf+0x5c2>
        buf[i--] = digits[x % base];
    1736:	45ad                	li	a1,11
    if (sign)
    1738:	d0065fe3          	bgez	a2,1456 <printf+0x304>
        buf[i--] = '-';
    173c:	02d00793          	li	a5,45
    1740:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1744:	45a9                	li	a1,10
    1746:	bb01                	j	1456 <printf+0x304>
    1748:	45ad                	li	a1,11
    if (sign)
    174a:	d006d6e3          	bgez	a3,1456 <printf+0x304>
    174e:	b7fd                	j	173c <printf+0x5ea>
        buf[i--] = digits[x % base];
    1750:	45a9                	li	a1,10
    if (sign)
    1752:	d00652e3          	bgez	a2,1456 <printf+0x304>
        buf[i--] = '-';
    1756:	02d00793          	li	a5,45
    175a:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    175e:	45a5                	li	a1,9
    1760:	b9dd                	j	1456 <printf+0x304>
    1762:	45a9                	li	a1,10
    if (sign)
    1764:	ce06d9e3          	bgez	a3,1456 <printf+0x304>
    1768:	b7fd                	j	1756 <printf+0x604>
        buf[i--] = digits[x % base];
    176a:	45a1                	li	a1,8
    if (sign)
    176c:	ce0655e3          	bgez	a2,1456 <printf+0x304>
    1770:	b9f1                	j	144c <printf+0x2fa>
        buf[i--] = digits[x % base];
    1772:	45a5                	li	a1,9
    if (sign)
    1774:	ce0651e3          	bgez	a2,1456 <printf+0x304>
        buf[i--] = '-';
    1778:	02d00793          	li	a5,45
    177c:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1780:	45a1                	li	a1,8
    1782:	b9d1                	j	1456 <printf+0x304>
    i = 15;
    1784:	45bd                	li	a1,15
    1786:	b9c1                	j	1456 <printf+0x304>
        buf[i--] = digits[x % base];
    1788:	45a5                	li	a1,9
    if (sign)
    178a:	cc06d6e3          	bgez	a3,1456 <printf+0x304>
    178e:	b7ed                	j	1778 <printf+0x626>

0000000000001790 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1790:	02000793          	li	a5,32
    1794:	00f50663          	beq	a0,a5,17a0 <isspace+0x10>
    1798:	355d                	addiw	a0,a0,-9
    179a:	00553513          	sltiu	a0,a0,5
    179e:	8082                	ret
    17a0:	4505                	li	a0,1
}
    17a2:	8082                	ret

00000000000017a4 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    17a4:	fd05051b          	addiw	a0,a0,-48
}
    17a8:	00a53513          	sltiu	a0,a0,10
    17ac:	8082                	ret

00000000000017ae <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    17ae:	02000613          	li	a2,32
    17b2:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    17b4:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    17b8:	ff77069b          	addiw	a3,a4,-9
    17bc:	04c70d63          	beq	a4,a2,1816 <atoi+0x68>
    17c0:	0007079b          	sext.w	a5,a4
    17c4:	04d5f963          	bgeu	a1,a3,1816 <atoi+0x68>
        s++;
    switch (*s)
    17c8:	02b00693          	li	a3,43
    17cc:	04d70a63          	beq	a4,a3,1820 <atoi+0x72>
    17d0:	02d00693          	li	a3,45
    17d4:	06d70463          	beq	a4,a3,183c <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    17d8:	fd07859b          	addiw	a1,a5,-48
    17dc:	4625                	li	a2,9
    17de:	873e                	mv	a4,a5
    17e0:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    17e2:	4e01                	li	t3,0
    while (isdigit(*s))
    17e4:	04b66a63          	bltu	a2,a1,1838 <atoi+0x8a>
    int n = 0, neg = 0;
    17e8:	4501                	li	a0,0
    while (isdigit(*s))
    17ea:	4825                	li	a6,9
    17ec:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    17f0:	0025179b          	slliw	a5,a0,0x2
    17f4:	9d3d                	addw	a0,a0,a5
    17f6:	fd07031b          	addiw	t1,a4,-48
    17fa:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    17fe:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1802:	0685                	addi	a3,a3,1
    1804:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1808:	0006071b          	sext.w	a4,a2
    180c:	feb870e3          	bgeu	a6,a1,17ec <atoi+0x3e>
    return neg ? n : -n;
    1810:	000e0563          	beqz	t3,181a <atoi+0x6c>
}
    1814:	8082                	ret
        s++;
    1816:	0505                	addi	a0,a0,1
    1818:	bf71                	j	17b4 <atoi+0x6>
    181a:	4113053b          	subw	a0,t1,a7
    181e:	8082                	ret
    while (isdigit(*s))
    1820:	00154783          	lbu	a5,1(a0)
    1824:	4625                	li	a2,9
        s++;
    1826:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    182a:	fd07859b          	addiw	a1,a5,-48
    182e:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1832:	4e01                	li	t3,0
    while (isdigit(*s))
    1834:	fab67ae3          	bgeu	a2,a1,17e8 <atoi+0x3a>
    1838:	4501                	li	a0,0
}
    183a:	8082                	ret
    while (isdigit(*s))
    183c:	00154783          	lbu	a5,1(a0)
    1840:	4625                	li	a2,9
        s++;
    1842:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1846:	fd07859b          	addiw	a1,a5,-48
    184a:	0007871b          	sext.w	a4,a5
    184e:	feb665e3          	bltu	a2,a1,1838 <atoi+0x8a>
        neg = 1;
    1852:	4e05                	li	t3,1
    1854:	bf51                	j	17e8 <atoi+0x3a>

0000000000001856 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1856:	16060d63          	beqz	a2,19d0 <memset+0x17a>
    185a:	40a007b3          	neg	a5,a0
    185e:	8b9d                	andi	a5,a5,7
    1860:	00778713          	addi	a4,a5,7
    1864:	482d                	li	a6,11
    1866:	0ff5f593          	andi	a1,a1,255
    186a:	fff60693          	addi	a3,a2,-1
    186e:	17076263          	bltu	a4,a6,19d2 <memset+0x17c>
    1872:	16e6ea63          	bltu	a3,a4,19e6 <memset+0x190>
    1876:	16078563          	beqz	a5,19e0 <memset+0x18a>
    187a:	00b50023          	sb	a1,0(a0)
    187e:	4705                	li	a4,1
    1880:	00150e93          	addi	t4,a0,1
    1884:	14e78c63          	beq	a5,a4,19dc <memset+0x186>
    1888:	00b500a3          	sb	a1,1(a0)
    188c:	4709                	li	a4,2
    188e:	00250e93          	addi	t4,a0,2
    1892:	14e78d63          	beq	a5,a4,19ec <memset+0x196>
    1896:	00b50123          	sb	a1,2(a0)
    189a:	470d                	li	a4,3
    189c:	00350e93          	addi	t4,a0,3
    18a0:	12e78b63          	beq	a5,a4,19d6 <memset+0x180>
    18a4:	00b501a3          	sb	a1,3(a0)
    18a8:	4711                	li	a4,4
    18aa:	00450e93          	addi	t4,a0,4
    18ae:	14e78163          	beq	a5,a4,19f0 <memset+0x19a>
    18b2:	00b50223          	sb	a1,4(a0)
    18b6:	4715                	li	a4,5
    18b8:	00550e93          	addi	t4,a0,5
    18bc:	12e78c63          	beq	a5,a4,19f4 <memset+0x19e>
    18c0:	00b502a3          	sb	a1,5(a0)
    18c4:	471d                	li	a4,7
    18c6:	00650e93          	addi	t4,a0,6
    18ca:	12e79763          	bne	a5,a4,19f8 <memset+0x1a2>
    18ce:	00750e93          	addi	t4,a0,7
    18d2:	00b50323          	sb	a1,6(a0)
    18d6:	4f1d                	li	t5,7
    18d8:	00859713          	slli	a4,a1,0x8
    18dc:	8f4d                	or	a4,a4,a1
    18de:	01059e13          	slli	t3,a1,0x10
    18e2:	01c76e33          	or	t3,a4,t3
    18e6:	01859313          	slli	t1,a1,0x18
    18ea:	006e6333          	or	t1,t3,t1
    18ee:	02059893          	slli	a7,a1,0x20
    18f2:	011368b3          	or	a7,t1,a7
    18f6:	02859813          	slli	a6,a1,0x28
    18fa:	40f60333          	sub	t1,a2,a5
    18fe:	0108e833          	or	a6,a7,a6
    1902:	03059693          	slli	a3,a1,0x30
    1906:	00d866b3          	or	a3,a6,a3
    190a:	03859713          	slli	a4,a1,0x38
    190e:	97aa                	add	a5,a5,a0
    1910:	ff837813          	andi	a6,t1,-8
    1914:	8f55                	or	a4,a4,a3
    1916:	00f806b3          	add	a3,a6,a5
    191a:	e398                	sd	a4,0(a5)
    191c:	07a1                	addi	a5,a5,8
    191e:	fed79ee3          	bne	a5,a3,191a <memset+0xc4>
    1922:	ff837693          	andi	a3,t1,-8
    1926:	00de87b3          	add	a5,t4,a3
    192a:	01e6873b          	addw	a4,a3,t5
    192e:	0ad30663          	beq	t1,a3,19da <memset+0x184>
    1932:	00b78023          	sb	a1,0(a5)
    1936:	0017069b          	addiw	a3,a4,1
    193a:	08c6fb63          	bgeu	a3,a2,19d0 <memset+0x17a>
    193e:	00b780a3          	sb	a1,1(a5)
    1942:	0027069b          	addiw	a3,a4,2
    1946:	08c6f563          	bgeu	a3,a2,19d0 <memset+0x17a>
    194a:	00b78123          	sb	a1,2(a5)
    194e:	0037069b          	addiw	a3,a4,3
    1952:	06c6ff63          	bgeu	a3,a2,19d0 <memset+0x17a>
    1956:	00b781a3          	sb	a1,3(a5)
    195a:	0047069b          	addiw	a3,a4,4
    195e:	06c6f963          	bgeu	a3,a2,19d0 <memset+0x17a>
    1962:	00b78223          	sb	a1,4(a5)
    1966:	0057069b          	addiw	a3,a4,5
    196a:	06c6f363          	bgeu	a3,a2,19d0 <memset+0x17a>
    196e:	00b782a3          	sb	a1,5(a5)
    1972:	0067069b          	addiw	a3,a4,6
    1976:	04c6fd63          	bgeu	a3,a2,19d0 <memset+0x17a>
    197a:	00b78323          	sb	a1,6(a5)
    197e:	0077069b          	addiw	a3,a4,7
    1982:	04c6f763          	bgeu	a3,a2,19d0 <memset+0x17a>
    1986:	00b783a3          	sb	a1,7(a5)
    198a:	0087069b          	addiw	a3,a4,8
    198e:	04c6f163          	bgeu	a3,a2,19d0 <memset+0x17a>
    1992:	00b78423          	sb	a1,8(a5)
    1996:	0097069b          	addiw	a3,a4,9
    199a:	02c6fb63          	bgeu	a3,a2,19d0 <memset+0x17a>
    199e:	00b784a3          	sb	a1,9(a5)
    19a2:	00a7069b          	addiw	a3,a4,10
    19a6:	02c6f563          	bgeu	a3,a2,19d0 <memset+0x17a>
    19aa:	00b78523          	sb	a1,10(a5)
    19ae:	00b7069b          	addiw	a3,a4,11
    19b2:	00c6ff63          	bgeu	a3,a2,19d0 <memset+0x17a>
    19b6:	00b785a3          	sb	a1,11(a5)
    19ba:	00c7069b          	addiw	a3,a4,12
    19be:	00c6f963          	bgeu	a3,a2,19d0 <memset+0x17a>
    19c2:	00b78623          	sb	a1,12(a5)
    19c6:	2735                	addiw	a4,a4,13
    19c8:	00c77463          	bgeu	a4,a2,19d0 <memset+0x17a>
    19cc:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    19d0:	8082                	ret
    19d2:	472d                	li	a4,11
    19d4:	bd79                	j	1872 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    19d6:	4f0d                	li	t5,3
    19d8:	b701                	j	18d8 <memset+0x82>
    19da:	8082                	ret
    19dc:	4f05                	li	t5,1
    19de:	bded                	j	18d8 <memset+0x82>
    19e0:	8eaa                	mv	t4,a0
    19e2:	4f01                	li	t5,0
    19e4:	bdd5                	j	18d8 <memset+0x82>
    19e6:	87aa                	mv	a5,a0
    19e8:	4701                	li	a4,0
    19ea:	b7a1                	j	1932 <memset+0xdc>
    19ec:	4f09                	li	t5,2
    19ee:	b5ed                	j	18d8 <memset+0x82>
    19f0:	4f11                	li	t5,4
    19f2:	b5dd                	j	18d8 <memset+0x82>
    19f4:	4f15                	li	t5,5
    19f6:	b5cd                	j	18d8 <memset+0x82>
    19f8:	4f19                	li	t5,6
    19fa:	bdf9                	j	18d8 <memset+0x82>

00000000000019fc <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    19fc:	00054783          	lbu	a5,0(a0)
    1a00:	0005c703          	lbu	a4,0(a1)
    1a04:	00e79863          	bne	a5,a4,1a14 <strcmp+0x18>
    1a08:	0505                	addi	a0,a0,1
    1a0a:	0585                	addi	a1,a1,1
    1a0c:	fbe5                	bnez	a5,19fc <strcmp>
    1a0e:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1a10:	9d19                	subw	a0,a0,a4
    1a12:	8082                	ret
    1a14:	0007851b          	sext.w	a0,a5
    1a18:	bfe5                	j	1a10 <strcmp+0x14>

0000000000001a1a <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1a1a:	ce05                	beqz	a2,1a52 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1a1c:	00054703          	lbu	a4,0(a0)
    1a20:	0005c783          	lbu	a5,0(a1)
    1a24:	cb0d                	beqz	a4,1a56 <strncmp+0x3c>
    if (!n--)
    1a26:	167d                	addi	a2,a2,-1
    1a28:	00c506b3          	add	a3,a0,a2
    1a2c:	a819                	j	1a42 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1a2e:	00a68e63          	beq	a3,a0,1a4a <strncmp+0x30>
    1a32:	0505                	addi	a0,a0,1
    1a34:	00e79b63          	bne	a5,a4,1a4a <strncmp+0x30>
    1a38:	00054703          	lbu	a4,0(a0)
    1a3c:	0005c783          	lbu	a5,0(a1)
    1a40:	cb19                	beqz	a4,1a56 <strncmp+0x3c>
    1a42:	0005c783          	lbu	a5,0(a1)
    1a46:	0585                	addi	a1,a1,1
    1a48:	f3fd                	bnez	a5,1a2e <strncmp+0x14>
        ;
    return *l - *r;
    1a4a:	0007051b          	sext.w	a0,a4
    1a4e:	9d1d                	subw	a0,a0,a5
    1a50:	8082                	ret
        return 0;
    1a52:	4501                	li	a0,0
}
    1a54:	8082                	ret
    1a56:	4501                	li	a0,0
    return *l - *r;
    1a58:	9d1d                	subw	a0,a0,a5
    1a5a:	8082                	ret

0000000000001a5c <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1a5c:	00757793          	andi	a5,a0,7
    1a60:	cf89                	beqz	a5,1a7a <strlen+0x1e>
    1a62:	87aa                	mv	a5,a0
    1a64:	a029                	j	1a6e <strlen+0x12>
    1a66:	0785                	addi	a5,a5,1
    1a68:	0077f713          	andi	a4,a5,7
    1a6c:	cb01                	beqz	a4,1a7c <strlen+0x20>
        if (!*s)
    1a6e:	0007c703          	lbu	a4,0(a5)
    1a72:	fb75                	bnez	a4,1a66 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1a74:	40a78533          	sub	a0,a5,a0
}
    1a78:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1a7a:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1a7c:	6394                	ld	a3,0(a5)
    1a7e:	00000597          	auipc	a1,0x0
    1a82:	5c25b583          	ld	a1,1474(a1) # 2040 <unlink+0x74>
    1a86:	00000617          	auipc	a2,0x0
    1a8a:	5c263603          	ld	a2,1474(a2) # 2048 <unlink+0x7c>
    1a8e:	a019                	j	1a94 <strlen+0x38>
    1a90:	6794                	ld	a3,8(a5)
    1a92:	07a1                	addi	a5,a5,8
    1a94:	00b68733          	add	a4,a3,a1
    1a98:	fff6c693          	not	a3,a3
    1a9c:	8f75                	and	a4,a4,a3
    1a9e:	8f71                	and	a4,a4,a2
    1aa0:	db65                	beqz	a4,1a90 <strlen+0x34>
    for (; *s; s++)
    1aa2:	0007c703          	lbu	a4,0(a5)
    1aa6:	d779                	beqz	a4,1a74 <strlen+0x18>
    1aa8:	0017c703          	lbu	a4,1(a5)
    1aac:	0785                	addi	a5,a5,1
    1aae:	d379                	beqz	a4,1a74 <strlen+0x18>
    1ab0:	0017c703          	lbu	a4,1(a5)
    1ab4:	0785                	addi	a5,a5,1
    1ab6:	fb6d                	bnez	a4,1aa8 <strlen+0x4c>
    1ab8:	bf75                	j	1a74 <strlen+0x18>

0000000000001aba <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1aba:	00757713          	andi	a4,a0,7
{
    1abe:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1ac0:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1ac4:	cb19                	beqz	a4,1ada <memchr+0x20>
    1ac6:	ce25                	beqz	a2,1b3e <memchr+0x84>
    1ac8:	0007c703          	lbu	a4,0(a5)
    1acc:	04b70e63          	beq	a4,a1,1b28 <memchr+0x6e>
    1ad0:	0785                	addi	a5,a5,1
    1ad2:	0077f713          	andi	a4,a5,7
    1ad6:	167d                	addi	a2,a2,-1
    1ad8:	f77d                	bnez	a4,1ac6 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1ada:	4501                	li	a0,0
    if (n && *s != c)
    1adc:	c235                	beqz	a2,1b40 <memchr+0x86>
    1ade:	0007c703          	lbu	a4,0(a5)
    1ae2:	04b70363          	beq	a4,a1,1b28 <memchr+0x6e>
        size_t k = ONES * c;
    1ae6:	00000517          	auipc	a0,0x0
    1aea:	56a53503          	ld	a0,1386(a0) # 2050 <unlink+0x84>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1aee:	471d                	li	a4,7
        size_t k = ONES * c;
    1af0:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1af4:	02c77a63          	bgeu	a4,a2,1b28 <memchr+0x6e>
    1af8:	00000897          	auipc	a7,0x0
    1afc:	5488b883          	ld	a7,1352(a7) # 2040 <unlink+0x74>
    1b00:	00000817          	auipc	a6,0x0
    1b04:	54883803          	ld	a6,1352(a6) # 2048 <unlink+0x7c>
    1b08:	431d                	li	t1,7
    1b0a:	a029                	j	1b14 <memchr+0x5a>
    1b0c:	1661                	addi	a2,a2,-8
    1b0e:	07a1                	addi	a5,a5,8
    1b10:	02c37963          	bgeu	t1,a2,1b42 <memchr+0x88>
    1b14:	6398                	ld	a4,0(a5)
    1b16:	8f29                	xor	a4,a4,a0
    1b18:	011706b3          	add	a3,a4,a7
    1b1c:	fff74713          	not	a4,a4
    1b20:	8f75                	and	a4,a4,a3
    1b22:	01077733          	and	a4,a4,a6
    1b26:	d37d                	beqz	a4,1b0c <memchr+0x52>
    1b28:	853e                	mv	a0,a5
    1b2a:	97b2                	add	a5,a5,a2
    1b2c:	a021                	j	1b34 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1b2e:	0505                	addi	a0,a0,1
    1b30:	00f50763          	beq	a0,a5,1b3e <memchr+0x84>
    1b34:	00054703          	lbu	a4,0(a0)
    1b38:	feb71be3          	bne	a4,a1,1b2e <memchr+0x74>
    1b3c:	8082                	ret
    return n ? (void *)s : 0;
    1b3e:	4501                	li	a0,0
}
    1b40:	8082                	ret
    return n ? (void *)s : 0;
    1b42:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1b44:	f275                	bnez	a2,1b28 <memchr+0x6e>
}
    1b46:	8082                	ret

0000000000001b48 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1b48:	1101                	addi	sp,sp,-32
    1b4a:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1b4c:	862e                	mv	a2,a1
{
    1b4e:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1b50:	4581                	li	a1,0
{
    1b52:	e426                	sd	s1,8(sp)
    1b54:	ec06                	sd	ra,24(sp)
    1b56:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1b58:	f63ff0ef          	jal	ra,1aba <memchr>
    return p ? p - s : n;
    1b5c:	c519                	beqz	a0,1b6a <strnlen+0x22>
}
    1b5e:	60e2                	ld	ra,24(sp)
    1b60:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1b62:	8d05                	sub	a0,a0,s1
}
    1b64:	64a2                	ld	s1,8(sp)
    1b66:	6105                	addi	sp,sp,32
    1b68:	8082                	ret
    1b6a:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1b6c:	8522                	mv	a0,s0
}
    1b6e:	6442                	ld	s0,16(sp)
    1b70:	64a2                	ld	s1,8(sp)
    1b72:	6105                	addi	sp,sp,32
    1b74:	8082                	ret

0000000000001b76 <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1b76:	00b547b3          	xor	a5,a0,a1
    1b7a:	8b9d                	andi	a5,a5,7
    1b7c:	eb95                	bnez	a5,1bb0 <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1b7e:	0075f793          	andi	a5,a1,7
    1b82:	e7b1                	bnez	a5,1bce <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1b84:	6198                	ld	a4,0(a1)
    1b86:	00000617          	auipc	a2,0x0
    1b8a:	4ba63603          	ld	a2,1210(a2) # 2040 <unlink+0x74>
    1b8e:	00000817          	auipc	a6,0x0
    1b92:	4ba83803          	ld	a6,1210(a6) # 2048 <unlink+0x7c>
    1b96:	a029                	j	1ba0 <stpcpy+0x2a>
    1b98:	e118                	sd	a4,0(a0)
    1b9a:	6598                	ld	a4,8(a1)
    1b9c:	05a1                	addi	a1,a1,8
    1b9e:	0521                	addi	a0,a0,8
    1ba0:	00c707b3          	add	a5,a4,a2
    1ba4:	fff74693          	not	a3,a4
    1ba8:	8ff5                	and	a5,a5,a3
    1baa:	0107f7b3          	and	a5,a5,a6
    1bae:	d7ed                	beqz	a5,1b98 <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1bb0:	0005c783          	lbu	a5,0(a1)
    1bb4:	00f50023          	sb	a5,0(a0)
    1bb8:	c785                	beqz	a5,1be0 <stpcpy+0x6a>
    1bba:	0015c783          	lbu	a5,1(a1)
    1bbe:	0505                	addi	a0,a0,1
    1bc0:	0585                	addi	a1,a1,1
    1bc2:	00f50023          	sb	a5,0(a0)
    1bc6:	fbf5                	bnez	a5,1bba <stpcpy+0x44>
        ;
    return d;
}
    1bc8:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1bca:	0505                	addi	a0,a0,1
    1bcc:	df45                	beqz	a4,1b84 <stpcpy+0xe>
            if (!(*d = *s))
    1bce:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1bd2:	0585                	addi	a1,a1,1
    1bd4:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1bd8:	00f50023          	sb	a5,0(a0)
    1bdc:	f7fd                	bnez	a5,1bca <stpcpy+0x54>
}
    1bde:	8082                	ret
    1be0:	8082                	ret

0000000000001be2 <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1be2:	00b547b3          	xor	a5,a0,a1
    1be6:	8b9d                	andi	a5,a5,7
    1be8:	1a079863          	bnez	a5,1d98 <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1bec:	0075f793          	andi	a5,a1,7
    1bf0:	16078463          	beqz	a5,1d58 <stpncpy+0x176>
    1bf4:	ea01                	bnez	a2,1c04 <stpncpy+0x22>
    1bf6:	a421                	j	1dfe <stpncpy+0x21c>
    1bf8:	167d                	addi	a2,a2,-1
    1bfa:	0505                	addi	a0,a0,1
    1bfc:	14070e63          	beqz	a4,1d58 <stpncpy+0x176>
    1c00:	1a060863          	beqz	a2,1db0 <stpncpy+0x1ce>
    1c04:	0005c783          	lbu	a5,0(a1)
    1c08:	0585                	addi	a1,a1,1
    1c0a:	0075f713          	andi	a4,a1,7
    1c0e:	00f50023          	sb	a5,0(a0)
    1c12:	f3fd                	bnez	a5,1bf8 <stpncpy+0x16>
    1c14:	4805                	li	a6,1
    1c16:	1a061863          	bnez	a2,1dc6 <stpncpy+0x1e4>
    1c1a:	40a007b3          	neg	a5,a0
    1c1e:	8b9d                	andi	a5,a5,7
    1c20:	4681                	li	a3,0
    1c22:	18061a63          	bnez	a2,1db6 <stpncpy+0x1d4>
    1c26:	00778713          	addi	a4,a5,7
    1c2a:	45ad                	li	a1,11
    1c2c:	18b76363          	bltu	a4,a1,1db2 <stpncpy+0x1d0>
    1c30:	1ae6eb63          	bltu	a3,a4,1de6 <stpncpy+0x204>
    1c34:	1a078363          	beqz	a5,1dda <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c38:	00050023          	sb	zero,0(a0)
    1c3c:	4685                	li	a3,1
    1c3e:	00150713          	addi	a4,a0,1
    1c42:	18d78f63          	beq	a5,a3,1de0 <stpncpy+0x1fe>
    1c46:	000500a3          	sb	zero,1(a0)
    1c4a:	4689                	li	a3,2
    1c4c:	00250713          	addi	a4,a0,2
    1c50:	18d78e63          	beq	a5,a3,1dec <stpncpy+0x20a>
    1c54:	00050123          	sb	zero,2(a0)
    1c58:	468d                	li	a3,3
    1c5a:	00350713          	addi	a4,a0,3
    1c5e:	16d78c63          	beq	a5,a3,1dd6 <stpncpy+0x1f4>
    1c62:	000501a3          	sb	zero,3(a0)
    1c66:	4691                	li	a3,4
    1c68:	00450713          	addi	a4,a0,4
    1c6c:	18d78263          	beq	a5,a3,1df0 <stpncpy+0x20e>
    1c70:	00050223          	sb	zero,4(a0)
    1c74:	4695                	li	a3,5
    1c76:	00550713          	addi	a4,a0,5
    1c7a:	16d78d63          	beq	a5,a3,1df4 <stpncpy+0x212>
    1c7e:	000502a3          	sb	zero,5(a0)
    1c82:	469d                	li	a3,7
    1c84:	00650713          	addi	a4,a0,6
    1c88:	16d79863          	bne	a5,a3,1df8 <stpncpy+0x216>
    1c8c:	00750713          	addi	a4,a0,7
    1c90:	00050323          	sb	zero,6(a0)
    1c94:	40f80833          	sub	a6,a6,a5
    1c98:	ff887593          	andi	a1,a6,-8
    1c9c:	97aa                	add	a5,a5,a0
    1c9e:	95be                	add	a1,a1,a5
    1ca0:	0007b023          	sd	zero,0(a5)
    1ca4:	07a1                	addi	a5,a5,8
    1ca6:	feb79de3          	bne	a5,a1,1ca0 <stpncpy+0xbe>
    1caa:	ff887593          	andi	a1,a6,-8
    1cae:	9ead                	addw	a3,a3,a1
    1cb0:	00b707b3          	add	a5,a4,a1
    1cb4:	12b80863          	beq	a6,a1,1de4 <stpncpy+0x202>
    1cb8:	00078023          	sb	zero,0(a5)
    1cbc:	0016871b          	addiw	a4,a3,1
    1cc0:	0ec77863          	bgeu	a4,a2,1db0 <stpncpy+0x1ce>
    1cc4:	000780a3          	sb	zero,1(a5)
    1cc8:	0026871b          	addiw	a4,a3,2
    1ccc:	0ec77263          	bgeu	a4,a2,1db0 <stpncpy+0x1ce>
    1cd0:	00078123          	sb	zero,2(a5)
    1cd4:	0036871b          	addiw	a4,a3,3
    1cd8:	0cc77c63          	bgeu	a4,a2,1db0 <stpncpy+0x1ce>
    1cdc:	000781a3          	sb	zero,3(a5)
    1ce0:	0046871b          	addiw	a4,a3,4
    1ce4:	0cc77663          	bgeu	a4,a2,1db0 <stpncpy+0x1ce>
    1ce8:	00078223          	sb	zero,4(a5)
    1cec:	0056871b          	addiw	a4,a3,5
    1cf0:	0cc77063          	bgeu	a4,a2,1db0 <stpncpy+0x1ce>
    1cf4:	000782a3          	sb	zero,5(a5)
    1cf8:	0066871b          	addiw	a4,a3,6
    1cfc:	0ac77a63          	bgeu	a4,a2,1db0 <stpncpy+0x1ce>
    1d00:	00078323          	sb	zero,6(a5)
    1d04:	0076871b          	addiw	a4,a3,7
    1d08:	0ac77463          	bgeu	a4,a2,1db0 <stpncpy+0x1ce>
    1d0c:	000783a3          	sb	zero,7(a5)
    1d10:	0086871b          	addiw	a4,a3,8
    1d14:	08c77e63          	bgeu	a4,a2,1db0 <stpncpy+0x1ce>
    1d18:	00078423          	sb	zero,8(a5)
    1d1c:	0096871b          	addiw	a4,a3,9
    1d20:	08c77863          	bgeu	a4,a2,1db0 <stpncpy+0x1ce>
    1d24:	000784a3          	sb	zero,9(a5)
    1d28:	00a6871b          	addiw	a4,a3,10
    1d2c:	08c77263          	bgeu	a4,a2,1db0 <stpncpy+0x1ce>
    1d30:	00078523          	sb	zero,10(a5)
    1d34:	00b6871b          	addiw	a4,a3,11
    1d38:	06c77c63          	bgeu	a4,a2,1db0 <stpncpy+0x1ce>
    1d3c:	000785a3          	sb	zero,11(a5)
    1d40:	00c6871b          	addiw	a4,a3,12
    1d44:	06c77663          	bgeu	a4,a2,1db0 <stpncpy+0x1ce>
    1d48:	00078623          	sb	zero,12(a5)
    1d4c:	26b5                	addiw	a3,a3,13
    1d4e:	06c6f163          	bgeu	a3,a2,1db0 <stpncpy+0x1ce>
    1d52:	000786a3          	sb	zero,13(a5)
    1d56:	8082                	ret
            ;
        if (!n || !*s)
    1d58:	c645                	beqz	a2,1e00 <stpncpy+0x21e>
    1d5a:	0005c783          	lbu	a5,0(a1)
    1d5e:	ea078be3          	beqz	a5,1c14 <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d62:	479d                	li	a5,7
    1d64:	02c7ff63          	bgeu	a5,a2,1da2 <stpncpy+0x1c0>
    1d68:	00000897          	auipc	a7,0x0
    1d6c:	2d88b883          	ld	a7,728(a7) # 2040 <unlink+0x74>
    1d70:	00000817          	auipc	a6,0x0
    1d74:	2d883803          	ld	a6,728(a6) # 2048 <unlink+0x7c>
    1d78:	431d                	li	t1,7
    1d7a:	6198                	ld	a4,0(a1)
    1d7c:	011707b3          	add	a5,a4,a7
    1d80:	fff74693          	not	a3,a4
    1d84:	8ff5                	and	a5,a5,a3
    1d86:	0107f7b3          	and	a5,a5,a6
    1d8a:	ef81                	bnez	a5,1da2 <stpncpy+0x1c0>
            *wd = *ws;
    1d8c:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d8e:	1661                	addi	a2,a2,-8
    1d90:	05a1                	addi	a1,a1,8
    1d92:	0521                	addi	a0,a0,8
    1d94:	fec363e3          	bltu	t1,a2,1d7a <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1d98:	e609                	bnez	a2,1da2 <stpncpy+0x1c0>
    1d9a:	a08d                	j	1dfc <stpncpy+0x21a>
    1d9c:	167d                	addi	a2,a2,-1
    1d9e:	0505                	addi	a0,a0,1
    1da0:	ca01                	beqz	a2,1db0 <stpncpy+0x1ce>
    1da2:	0005c783          	lbu	a5,0(a1)
    1da6:	0585                	addi	a1,a1,1
    1da8:	00f50023          	sb	a5,0(a0)
    1dac:	fbe5                	bnez	a5,1d9c <stpncpy+0x1ba>
        ;
tail:
    1dae:	b59d                	j	1c14 <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1db0:	8082                	ret
    1db2:	472d                	li	a4,11
    1db4:	bdb5                	j	1c30 <stpncpy+0x4e>
    1db6:	00778713          	addi	a4,a5,7
    1dba:	45ad                	li	a1,11
    1dbc:	fff60693          	addi	a3,a2,-1
    1dc0:	e6b778e3          	bgeu	a4,a1,1c30 <stpncpy+0x4e>
    1dc4:	b7fd                	j	1db2 <stpncpy+0x1d0>
    1dc6:	40a007b3          	neg	a5,a0
    1dca:	8832                	mv	a6,a2
    1dcc:	8b9d                	andi	a5,a5,7
    1dce:	4681                	li	a3,0
    1dd0:	e4060be3          	beqz	a2,1c26 <stpncpy+0x44>
    1dd4:	b7cd                	j	1db6 <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1dd6:	468d                	li	a3,3
    1dd8:	bd75                	j	1c94 <stpncpy+0xb2>
    1dda:	872a                	mv	a4,a0
    1ddc:	4681                	li	a3,0
    1dde:	bd5d                	j	1c94 <stpncpy+0xb2>
    1de0:	4685                	li	a3,1
    1de2:	bd4d                	j	1c94 <stpncpy+0xb2>
    1de4:	8082                	ret
    1de6:	87aa                	mv	a5,a0
    1de8:	4681                	li	a3,0
    1dea:	b5f9                	j	1cb8 <stpncpy+0xd6>
    1dec:	4689                	li	a3,2
    1dee:	b55d                	j	1c94 <stpncpy+0xb2>
    1df0:	4691                	li	a3,4
    1df2:	b54d                	j	1c94 <stpncpy+0xb2>
    1df4:	4695                	li	a3,5
    1df6:	bd79                	j	1c94 <stpncpy+0xb2>
    1df8:	4699                	li	a3,6
    1dfa:	bd69                	j	1c94 <stpncpy+0xb2>
    1dfc:	8082                	ret
    1dfe:	8082                	ret
    1e00:	8082                	ret

0000000000001e02 <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1e02:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1e06:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e08:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1e0c:	2501                	sext.w	a0,a0
    1e0e:	8082                	ret

0000000000001e10 <close>:
    register long a7 __asm__("a7") = n;
    1e10:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1e14:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1e18:	2501                	sext.w	a0,a0
    1e1a:	8082                	ret

0000000000001e1c <read>:
    register long a7 __asm__("a7") = n;
    1e1c:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e20:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1e24:	8082                	ret

0000000000001e26 <write>:
    register long a7 __asm__("a7") = n;
    1e26:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e2a:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1e2e:	8082                	ret

0000000000001e30 <getpid>:
    register long a7 __asm__("a7") = n;
    1e30:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1e34:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1e38:	2501                	sext.w	a0,a0
    1e3a:	8082                	ret

0000000000001e3c <sched_yield>:
    register long a7 __asm__("a7") = n;
    1e3c:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1e40:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1e44:	2501                	sext.w	a0,a0
    1e46:	8082                	ret

0000000000001e48 <fork>:
    register long a7 __asm__("a7") = n;
    1e48:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1e4c:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1e50:	2501                	sext.w	a0,a0
    1e52:	8082                	ret

0000000000001e54 <exit>:
    register long a7 __asm__("a7") = n;
    1e54:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e58:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e5c:	8082                	ret

0000000000001e5e <waitpid>:
    register long a7 __asm__("a7") = n;
    1e5e:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e62:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1e66:	2501                	sext.w	a0,a0
    1e68:	8082                	ret

0000000000001e6a <exec>:
    register long a7 __asm__("a7") = n;
    1e6a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e6e:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e72:	2501                	sext.w	a0,a0
    1e74:	8082                	ret

0000000000001e76 <get_time>:

int64 get_time()
{
    1e76:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e78:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e7c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e7e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e80:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e84:	2501                	sext.w	a0,a0
    1e86:	ed09                	bnez	a0,1ea0 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e88:	67a2                	ld	a5,8(sp)
    1e8a:	3e800713          	li	a4,1000
    1e8e:	00015503          	lhu	a0,0(sp)
    1e92:	02e7d7b3          	divu	a5,a5,a4
    1e96:	02e50533          	mul	a0,a0,a4
    1e9a:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e9c:	0141                	addi	sp,sp,16
    1e9e:	8082                	ret
        return -1;
    1ea0:	557d                	li	a0,-1
    1ea2:	bfed                	j	1e9c <get_time+0x26>

0000000000001ea4 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1ea4:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea8:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1eac:	2501                	sext.w	a0,a0
    1eae:	8082                	ret

0000000000001eb0 <sleep>:

int sleep(unsigned long long time)
{
    1eb0:	1141                	addi	sp,sp,-16
    1eb2:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1eb4:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1eb8:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1eba:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ebc:	00000073          	ecall
    if (err == 0)
    1ec0:	2501                	sext.w	a0,a0
    1ec2:	e13d                	bnez	a0,1f28 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ec4:	6722                	ld	a4,8(sp)
    1ec6:	3e800693          	li	a3,1000
    1eca:	00015783          	lhu	a5,0(sp)
    1ece:	02d75733          	divu	a4,a4,a3
    1ed2:	02d787b3          	mul	a5,a5,a3
    1ed6:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1ed8:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1edc:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ede:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ee0:	00000073          	ecall
    if (err == 0)
    1ee4:	2501                	sext.w	a0,a0
    1ee6:	ed15                	bnez	a0,1f22 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ee8:	6841                	lui	a6,0x10
    1eea:	963e                	add	a2,a2,a5
    1eec:	187d                	addi	a6,a6,-1
    1eee:	3e800693          	li	a3,1000
    1ef2:	a819                	j	1f08 <sleep+0x58>
    __asm_syscall("r"(a7))
    1ef4:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1ef8:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1efc:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1efe:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f00:	00000073          	ecall
    if (err == 0)
    1f04:	2501                	sext.w	a0,a0
    1f06:	ed11                	bnez	a0,1f22 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1f08:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1f0a:	07c00893          	li	a7,124
    1f0e:	02d7d733          	divu	a4,a5,a3
    1f12:	6782                	ld	a5,0(sp)
    1f14:	0107f7b3          	and	a5,a5,a6
    1f18:	02d787b3          	mul	a5,a5,a3
    1f1c:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1f1e:	fcc7ebe3          	bltu	a5,a2,1ef4 <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1f22:	4501                	li	a0,0
    1f24:	0141                	addi	sp,sp,16
    1f26:	8082                	ret
    1f28:	57fd                	li	a5,-1
    1f2a:	b77d                	j	1ed8 <sleep+0x28>

0000000000001f2c <set_priority>:
    register long a7 __asm__("a7") = n;
    1f2c:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1f30:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1f34:	2501                	sext.w	a0,a0
    1f36:	8082                	ret

0000000000001f38 <mmap>:
    register long a7 __asm__("a7") = n;
    1f38:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f3c:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1f40:	2501                	sext.w	a0,a0
    1f42:	8082                	ret

0000000000001f44 <munmap>:
    register long a7 __asm__("a7") = n;
    1f44:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f48:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1f4c:	2501                	sext.w	a0,a0
    1f4e:	8082                	ret

0000000000001f50 <wait>:

int wait(int *code)
{
    1f50:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f52:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1f56:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f58:	00000073          	ecall
    return waitpid(-1, code);
}
    1f5c:	2501                	sext.w	a0,a0
    1f5e:	8082                	ret

0000000000001f60 <spawn>:
    register long a7 __asm__("a7") = n;
    1f60:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1f64:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f68:	2501                	sext.w	a0,a0
    1f6a:	8082                	ret

0000000000001f6c <mailread>:
    register long a7 __asm__("a7") = n;
    1f6c:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f70:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f74:	2501                	sext.w	a0,a0
    1f76:	8082                	ret

0000000000001f78 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f78:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f7c:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f80:	2501                	sext.w	a0,a0
    1f82:	8082                	ret

0000000000001f84 <fstat>:
    register long a7 __asm__("a7") = n;
    1f84:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f88:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f8c:	2501                	sext.w	a0,a0
    1f8e:	8082                	ret

0000000000001f90 <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1f90:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f92:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f96:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f98:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f9c:	2501                	sext.w	a0,a0
    1f9e:	8082                	ret

0000000000001fa0 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1fa0:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1fa2:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1fa6:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fa8:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1fac:	2501                	sext.w	a0,a0
    1fae:	8082                	ret

0000000000001fb0 <link>:

int link(char *old_path, char *new_path)
{
    1fb0:	87aa                	mv	a5,a0
    1fb2:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1fb4:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1fb8:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1fbc:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1fbe:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1fc2:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fc4:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1fc8:	2501                	sext.w	a0,a0
    1fca:	8082                	ret

0000000000001fcc <unlink>:

int unlink(char *path)
{
    1fcc:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1fce:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1fd2:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1fd6:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fd8:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1fdc:	2501                	sext.w	a0,a0
    1fde:	8082                	ret
