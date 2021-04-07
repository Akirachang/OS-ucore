
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch6_mail3:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0d60006f          	j	10d8 <__start_main>

0000000000001006 <main>:
const uint64 BAD_ADDRESS = 0x90000000ULL;

/// 邮箱错误参数测试，输出 mail3 test OK! 就算正确。

int main()
{
    1006:	7169                	addi	sp,sp,-304
    1008:	f606                	sd	ra,296(sp)
    100a:	ee26                	sd	s1,280(sp)
    100c:	f222                	sd	s0,288(sp)
    int pid = getpid();
    100e:	63b000ef          	jal	ra,1e48 <getpid>
    char *null = (char *)BAD_ADDRESS;
    assert(mailwrite(pid, null, 10) == -1);
    1012:	45a5                	li	a1,9
    1014:	4629                	li	a2,10
    1016:	05f2                	slli	a1,a1,0x1c
    int pid = getpid();
    1018:	84aa                	mv	s1,a0
    assert(mailwrite(pid, null, 10) == -1);
    101a:	777000ef          	jal	ra,1f90 <mailwrite>
    101e:	57fd                	li	a5,-1
    1020:	00f50563          	beq	a0,a5,102a <main+0x24>
    1024:	557d                	li	a0,-1
    1026:	647000ef          	jal	ra,1e6c <exit>
    char empty[0];
    assert(mailwrite(pid, empty, 0) == 0);
    102a:	4601                	li	a2,0
    102c:	002c                	addi	a1,sp,8
    102e:	8526                	mv	a0,s1
    1030:	761000ef          	jal	ra,1f90 <mailwrite>
    1034:	ed51                	bnez	a0,10d0 <main+0xca>
    assert(mailread(empty, 0) == -1);
    1036:	4581                	li	a1,0
    1038:	0028                	addi	a0,sp,8
    103a:	74b000ef          	jal	ra,1f84 <mailread>
    103e:	57fd                	li	a5,-1
    1040:	00f50563          	beq	a0,a5,104a <main+0x44>
    1044:	557d                	li	a0,-1
    1046:	627000ef          	jal	ra,1e6c <exit>
    char buffer0[BUF_LEN];
    memset(buffer0, 'a', BUF_LEN);
    104a:	10000613          	li	a2,256
    104e:	06100593          	li	a1,97
    1052:	0808                	addi	a0,sp,16
    1054:	01b000ef          	jal	ra,186e <memset>
    1058:	4441                	li	s0,16
    for (int _ = 0; _ < MAIL_MAX; ++_)
    {
        assert(mailwrite(pid, buffer0, BUF_LEN) == BUF_LEN);
    105a:	10000613          	li	a2,256
    105e:	080c                	addi	a1,sp,16
    1060:	8526                	mv	a0,s1
    1062:	72f000ef          	jal	ra,1f90 <mailwrite>
    1066:	872a                	mv	a4,a0
    1068:	10000793          	li	a5,256
    106c:	347d                	addiw	s0,s0,-1
    106e:	557d                	li	a0,-1
    1070:	00f70463          	beq	a4,a5,1078 <main+0x72>
    1074:	5f9000ef          	jal	ra,1e6c <exit>
    for (int _ = 0; _ < MAIL_MAX; ++_)
    1078:	f06d                	bnez	s0,105a <main+0x54>
    }
    assert(mailwrite(pid, empty, 0) == -1);
    107a:	4601                	li	a2,0
    107c:	002c                	addi	a1,sp,8
    107e:	8526                	mv	a0,s1
    1080:	711000ef          	jal	ra,1f90 <mailwrite>
    1084:	57fd                	li	a5,-1
    1086:	00f50563          	beq	a0,a5,1090 <main+0x8a>
    108a:	557d                	li	a0,-1
    108c:	5e1000ef          	jal	ra,1e6c <exit>
    assert(mailread(empty, 0) == 0);
    1090:	4581                	li	a1,0
    1092:	0028                	addi	a0,sp,8
    1094:	6f1000ef          	jal	ra,1f84 <mailread>
    1098:	e905                	bnez	a0,10c8 <main+0xc2>
    assert(mailwrite(pid, empty, 0) == -1);
    109a:	4601                	li	a2,0
    109c:	002c                	addi	a1,sp,8
    109e:	8526                	mv	a0,s1
    10a0:	6f1000ef          	jal	ra,1f90 <mailwrite>
    10a4:	57fd                	li	a5,-1
    10a6:	00f50563          	beq	a0,a5,10b0 <main+0xaa>
    10aa:	557d                	li	a0,-1
    10ac:	5c1000ef          	jal	ra,1e6c <exit>
    puts("mail3 test OK!");
    10b0:	00001517          	auipc	a0,0x1
    10b4:	f4850513          	addi	a0,a0,-184 # 1ff8 <unlink+0x14>
    10b8:	070000ef          	jal	ra,1128 <puts>
    return 0;
    10bc:	70b2                	ld	ra,296(sp)
    10be:	7412                	ld	s0,288(sp)
    10c0:	64f2                	ld	s1,280(sp)
    10c2:	4501                	li	a0,0
    10c4:	6155                	addi	sp,sp,304
    10c6:	8082                	ret
    assert(mailread(empty, 0) == 0);
    10c8:	557d                	li	a0,-1
    10ca:	5a3000ef          	jal	ra,1e6c <exit>
    10ce:	b7f1                	j	109a <main+0x94>
    assert(mailwrite(pid, empty, 0) == 0);
    10d0:	557d                	li	a0,-1
    10d2:	59b000ef          	jal	ra,1e6c <exit>
    10d6:	b785                	j	1036 <main+0x30>

00000000000010d8 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10d8:	1141                	addi	sp,sp,-16
    10da:	e406                	sd	ra,8(sp)
    exit(main());
    10dc:	f2bff0ef          	jal	ra,1006 <main>
    10e0:	58d000ef          	jal	ra,1e6c <exit>
    return 0;
}
    10e4:	60a2                	ld	ra,8(sp)
    10e6:	4501                	li	a0,0
    10e8:	0141                	addi	sp,sp,16
    10ea:	8082                	ret

00000000000010ec <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    10ec:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    10ee:	00f10593          	addi	a1,sp,15
    10f2:	4605                	li	a2,1
    10f4:	4501                	li	a0,0
{
    10f6:	ec06                	sd	ra,24(sp)
    char byte = 0;
    10f8:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    10fc:	539000ef          	jal	ra,1e34 <read>
    return byte;
}
    1100:	60e2                	ld	ra,24(sp)
    1102:	00f14503          	lbu	a0,15(sp)
    1106:	6105                	addi	sp,sp,32
    1108:	8082                	ret

000000000000110a <putchar>:

int putchar(int c)
{
    110a:	1101                	addi	sp,sp,-32
    110c:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    110e:	00f10593          	addi	a1,sp,15
    1112:	4605                	li	a2,1
    1114:	4505                	li	a0,1
{
    1116:	ec06                	sd	ra,24(sp)
    char byte = c;
    1118:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    111c:	523000ef          	jal	ra,1e3e <write>
}
    1120:	60e2                	ld	ra,24(sp)
    1122:	2501                	sext.w	a0,a0
    1124:	6105                	addi	sp,sp,32
    1126:	8082                	ret

0000000000001128 <puts>:

int puts(const char *s)
{
    1128:	1101                	addi	sp,sp,-32
    112a:	e822                	sd	s0,16(sp)
    112c:	ec06                	sd	ra,24(sp)
    112e:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    1130:	145000ef          	jal	ra,1a74 <strlen>
    1134:	862a                	mv	a2,a0
    1136:	85a2                	mv	a1,s0
    1138:	4505                	li	a0,1
    113a:	505000ef          	jal	ra,1e3e <write>
    113e:	00055763          	bgez	a0,114c <puts+0x24>
    return r;
}
    1142:	60e2                	ld	ra,24(sp)
    1144:	6442                	ld	s0,16(sp)
    1146:	557d                	li	a0,-1
    1148:	6105                	addi	sp,sp,32
    114a:	8082                	ret
    return write(stdout, &byte, 1);
    114c:	00f10593          	addi	a1,sp,15
    char byte = c;
    1150:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    1152:	4605                	li	a2,1
    1154:	4505                	li	a0,1
    char byte = c;
    1156:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    115a:	4e5000ef          	jal	ra,1e3e <write>
}
    115e:	60e2                	ld	ra,24(sp)
    1160:	6442                	ld	s0,16(sp)
    1162:	41f5551b          	sraiw	a0,a0,0x1f
    1166:	6105                	addi	sp,sp,32
    1168:	8082                	ret

000000000000116a <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    116a:	7131                	addi	sp,sp,-192
    116c:	ecce                	sd	s3,88(sp)
    116e:	e8d2                	sd	s4,80(sp)
    1170:	e4d6                	sd	s5,72(sp)
    1172:	e0da                	sd	s6,64(sp)
    1174:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    1176:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1178:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    117a:	6ae1                	lui	s5,0x18
    117c:	000f4a37          	lui	s4,0xf4
    1180:	00989b37          	lui	s6,0x989
{
    1184:	fc86                	sd	ra,120(sp)
    1186:	f8a2                	sd	s0,112(sp)
    1188:	f4a6                	sd	s1,104(sp)
    118a:	f0ca                	sd	s2,96(sp)
    118c:	fc5e                	sd	s7,56(sp)
    118e:	e52e                	sd	a1,136(sp)
    1190:	e932                	sd	a2,144(sp)
    1192:	ed36                	sd	a3,152(sp)
    1194:	f13a                	sd	a4,160(sp)
    1196:	f942                	sd	a6,176(sp)
    1198:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    119a:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    119c:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x6d7>
    11a0:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x16667>
    11a4:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf2207>
    11a8:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x987647>
    for (;;)
    {
        if (!*s)
    11ac:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    11b0:	02500913          	li	s2,37
        if (!*s)
    11b4:	1a078f63          	beqz	a5,1372 <printf+0x208>
    11b8:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    11ba:	17278e63          	beq	a5,s2,1336 <printf+0x1cc>
    11be:	00164783          	lbu	a5,1(a2)
    11c2:	0605                	addi	a2,a2,1
    11c4:	fbfd                	bnez	a5,11ba <printf+0x50>
    11c6:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    11c8:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    11cc:	85aa                	mv	a1,a0
    11ce:	8622                	mv	a2,s0
    11d0:	4505                	li	a0,1
    11d2:	46d000ef          	jal	ra,1e3e <write>
        out(f, a, l);
        if (l)
    11d6:	18041963          	bnez	s0,1368 <printf+0x1fe>
            continue;
        if (s[1] == 0)
    11da:	0014c783          	lbu	a5,1(s1)
    11de:	18078a63          	beqz	a5,1372 <printf+0x208>
            break;
        switch (s[1])
    11e2:	07300713          	li	a4,115
    11e6:	28e78e63          	beq	a5,a4,1482 <printf+0x318>
    11ea:	18f76f63          	bltu	a4,a5,1388 <printf+0x21e>
    11ee:	06400713          	li	a4,100
    11f2:	2ae78c63          	beq	a5,a4,14aa <printf+0x340>
    11f6:	07000713          	li	a4,112
    11fa:	3ce79c63          	bne	a5,a4,15d2 <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    11fe:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1200:	00001797          	auipc	a5,0x1
    1204:	e3878793          	addi	a5,a5,-456 # 2038 <digits>
            printptr(va_arg(ap, uint64));
    1208:	6298                	ld	a4,0(a3)
    120a:	00868093          	addi	ra,a3,8
    120e:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1210:	00471293          	slli	t0,a4,0x4
    1214:	00c71f13          	slli	t5,a4,0xc
    1218:	01471e13          	slli	t3,a4,0x14
    121c:	01c71893          	slli	a7,a4,0x1c
    1220:	02471813          	slli	a6,a4,0x24
    1224:	02871513          	slli	a0,a4,0x28
    1228:	02c71593          	slli	a1,a4,0x2c
    122c:	03071693          	slli	a3,a4,0x30
    1230:	00871f93          	slli	t6,a4,0x8
    1234:	01071e93          	slli	t4,a4,0x10
    1238:	01871313          	slli	t1,a4,0x18
    123c:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1240:	03c2d293          	srli	t0,t0,0x3c
    1244:	03cf5f13          	srli	t5,t5,0x3c
    1248:	03ce5e13          	srli	t3,t3,0x3c
    124c:	03c8d893          	srli	a7,a7,0x3c
    1250:	03c85813          	srli	a6,a6,0x3c
    1254:	9171                	srli	a0,a0,0x3c
    1256:	91f1                	srli	a1,a1,0x3c
    1258:	92f1                	srli	a3,a3,0x3c
    125a:	92be                	add	t0,t0,a5
    125c:	9f3e                	add	t5,t5,a5
    125e:	9e3e                	add	t3,t3,a5
    1260:	98be                	add	a7,a7,a5
    1262:	983e                	add	a6,a6,a5
    1264:	953e                	add	a0,a0,a5
    1266:	95be                	add	a1,a1,a5
    1268:	96be                	add	a3,a3,a5
    126a:	03c75393          	srli	t2,a4,0x3c
    126e:	01c75b9b          	srliw	s7,a4,0x1c
    1272:	03cfdf93          	srli	t6,t6,0x3c
    1276:	03cede93          	srli	t4,t4,0x3c
    127a:	03c35313          	srli	t1,t1,0x3c
    127e:	9271                	srli	a2,a2,0x3c
    1280:	0002c403          	lbu	s0,0(t0)
    1284:	93be                	add	t2,t2,a5
    1286:	000f4283          	lbu	t0,0(t5)
    128a:	9fbe                	add	t6,t6,a5
    128c:	000e4f03          	lbu	t5,0(t3)
    1290:	9ebe                	add	t4,t4,a5
    1292:	0008ce03          	lbu	t3,0(a7)
    1296:	933e                	add	t1,t1,a5
    1298:	00084883          	lbu	a7,0(a6)
    129c:	9bbe                	add	s7,s7,a5
    129e:	00054803          	lbu	a6,0(a0)
    12a2:	963e                	add	a2,a2,a5
    12a4:	0005c503          	lbu	a0,0(a1)
    12a8:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    12ac:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12b0:	0003c903          	lbu	s2,0(t2)
    12b4:	00064603          	lbu	a2,0(a2)
    12b8:	000fc383          	lbu	t2,0(t6)
    12bc:	8b3d                	andi	a4,a4,15
    12be:	000ecf83          	lbu	t6,0(t4)
    12c2:	92f1                	srli	a3,a3,0x3c
    12c4:	00034e83          	lbu	t4,0(t1)
    12c8:	000bc303          	lbu	t1,0(s7)
    12cc:	96be                	add	a3,a3,a5
    12ce:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    12d0:	7761                	lui	a4,0xffff8
    12d2:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12d6:	00710623          	sb	t2,12(sp)
    12da:	005106a3          	sb	t0,13(sp)
    12de:	01f10723          	sb	t6,14(sp)
    12e2:	01e107a3          	sb	t5,15(sp)
    12e6:	01d10823          	sb	t4,16(sp)
    12ea:	01c108a3          	sb	t3,17(sp)
    12ee:	00610923          	sb	t1,18(sp)
    12f2:	011109a3          	sb	a7,19(sp)
    12f6:	01010a23          	sb	a6,20(sp)
    12fa:	00a10aa3          	sb	a0,21(sp)
    12fe:	00b10b23          	sb	a1,22(sp)
    1302:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    1306:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    130a:	01210523          	sb	s2,10(sp)
    130e:	008105a3          	sb	s0,11(sp)
    1312:	0006c703          	lbu	a4,0(a3)
    1316:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    131a:	4649                	li	a2,18
    131c:	002c                	addi	a1,sp,8
    131e:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1320:	00e10c23          	sb	a4,24(sp)
    1324:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1328:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    132c:	313000ef          	jal	ra,1e3e <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1330:	00248513          	addi	a0,s1,2
    1334:	bda5                	j	11ac <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1336:	00064783          	lbu	a5,0(a2)
    133a:	84b2                	mv	s1,a2
    133c:	01278963          	beq	a5,s2,134e <printf+0x1e4>
    1340:	b561                	j	11c8 <printf+0x5e>
    1342:	0024c783          	lbu	a5,2(s1)
    1346:	0605                	addi	a2,a2,1
    1348:	0489                	addi	s1,s1,2
    134a:	e7279fe3          	bne	a5,s2,11c8 <printf+0x5e>
    134e:	0014c783          	lbu	a5,1(s1)
    1352:	ff2788e3          	beq	a5,s2,1342 <printf+0x1d8>
        l = z - a;
    1356:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    135a:	85aa                	mv	a1,a0
    135c:	8622                	mv	a2,s0
    135e:	4505                	li	a0,1
    1360:	2df000ef          	jal	ra,1e3e <write>
        if (l)
    1364:	e6040be3          	beqz	s0,11da <printf+0x70>
    1368:	8526                	mv	a0,s1
        if (!*s)
    136a:	00054783          	lbu	a5,0(a0)
    136e:	e40795e3          	bnez	a5,11b8 <printf+0x4e>
    }
    va_end(ap);
    1372:	70e6                	ld	ra,120(sp)
    1374:	7446                	ld	s0,112(sp)
    1376:	74a6                	ld	s1,104(sp)
    1378:	7906                	ld	s2,96(sp)
    137a:	69e6                	ld	s3,88(sp)
    137c:	6a46                	ld	s4,80(sp)
    137e:	6aa6                	ld	s5,72(sp)
    1380:	6b06                	ld	s6,64(sp)
    1382:	7be2                	ld	s7,56(sp)
    1384:	6129                	addi	sp,sp,192
    1386:	8082                	ret
        switch (s[1])
    1388:	07800713          	li	a4,120
    138c:	24e79363          	bne	a5,a4,15d2 <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    1390:	6782                	ld	a5,0(sp)
    1392:	4394                	lw	a3,0(a5)
    1394:	07a1                	addi	a5,a5,8
    1396:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1398:	2606c263          	bltz	a3,15fc <printf+0x492>
        buf[i--] = digits[x % base];
    139c:	00001797          	auipc	a5,0x1
    13a0:	c9c78793          	addi	a5,a5,-868 # 2038 <digits>
    13a4:	00f6f713          	andi	a4,a3,15
    13a8:	973e                	add	a4,a4,a5
    13aa:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff5fc8>
    buf[16] = 0;
    13ae:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    13b2:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    13b4:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    13b8:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    13bc:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    13c0:	0046d51b          	srliw	a0,a3,0x4
    13c4:	0ad5d563          	bge	a1,a3,146e <printf+0x304>
        buf[i--] = digits[x % base];
    13c8:	8a3d                	andi	a2,a2,15
    13ca:	963e                	add	a2,a2,a5
    13cc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    13d0:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    13d4:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    13d8:	30a5fe63          	bgeu	a1,a0,16f4 <printf+0x58a>
        buf[i--] = digits[x % base];
    13dc:	00f77613          	andi	a2,a4,15
    13e0:	963e                	add	a2,a2,a5
    13e2:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13e6:	45bd                	li	a1,15
    13e8:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    13ec:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    13f0:	00475513          	srli	a0,a4,0x4
    13f4:	30e5f963          	bgeu	a1,a4,1706 <printf+0x59c>
        buf[i--] = digits[x % base];
    13f8:	8a3d                	andi	a2,a2,15
    13fa:	963e                	add	a2,a2,a5
    13fc:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    1400:	00875893          	srli	a7,a4,0x8
    1404:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    1408:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    140c:	30a5fd63          	bgeu	a1,a0,1726 <printf+0x5bc>
        buf[i--] = digits[x % base];
    1410:	8a3d                	andi	a2,a2,15
    1412:	963e                	add	a2,a2,a5
    1414:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1418:	00c75813          	srli	a6,a4,0xc
    141c:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    1420:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    1424:	3315fe63          	bgeu	a1,a7,1760 <printf+0x5f6>
        buf[i--] = digits[x % base];
    1428:	8a3d                	andi	a2,a2,15
    142a:	963e                	add	a2,a2,a5
    142c:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1430:	01075893          	srli	a7,a4,0x10
    1434:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    1438:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    143c:	3305ff63          	bgeu	a1,a6,177a <printf+0x610>
        buf[i--] = digits[x % base];
    1440:	8a3d                	andi	a2,a2,15
    1442:	963e                	add	a2,a2,a5
    1444:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1448:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    144c:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1450:	3515f863          	bgeu	a1,a7,17a0 <printf+0x636>
        buf[i--] = digits[x % base];
    1454:	97ba                	add	a5,a5,a4
    1456:	0007c783          	lbu	a5,0(a5)
    145a:	45a1                	li	a1,8
    145c:	00f10823          	sb	a5,16(sp)
    if (sign)
    1460:	0006d763          	bgez	a3,146e <printf+0x304>
        buf[i--] = '-';
    1464:	02d00793          	li	a5,45
    1468:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    146c:	459d                	li	a1,7
    write(f, s, l);
    146e:	4641                	li	a2,16
    1470:	003c                	addi	a5,sp,8
    1472:	9e0d                	subw	a2,a2,a1
    1474:	4505                	li	a0,1
    1476:	95be                	add	a1,a1,a5
    1478:	1c7000ef          	jal	ra,1e3e <write>
        s += 2;
    147c:	00248513          	addi	a0,s1,2
    1480:	b335                	j	11ac <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    1482:	6782                	ld	a5,0(sp)
    1484:	6380                	ld	s0,0(a5)
    1486:	07a1                	addi	a5,a5,8
    1488:	e03e                	sd	a5,0(sp)
    148a:	22040a63          	beqz	s0,16be <printf+0x554>
            l = strnlen(a, 200);
    148e:	0c800593          	li	a1,200
    1492:	8522                	mv	a0,s0
    1494:	6cc000ef          	jal	ra,1b60 <strnlen>
    write(f, s, l);
    1498:	0005061b          	sext.w	a2,a0
    149c:	85a2                	mv	a1,s0
    149e:	4505                	li	a0,1
    14a0:	19f000ef          	jal	ra,1e3e <write>
        s += 2;
    14a4:	00248513          	addi	a0,s1,2
    14a8:	b311                	j	11ac <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    14aa:	6782                	ld	a5,0(sp)
    14ac:	4390                	lw	a2,0(a5)
    14ae:	07a1                	addi	a5,a5,8
    14b0:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    14b2:	1a064363          	bltz	a2,1658 <printf+0x4ee>
        buf[i--] = digits[x % base];
    14b6:	46a9                	li	a3,10
    14b8:	02d6773b          	remuw	a4,a2,a3
    14bc:	00001797          	auipc	a5,0x1
    14c0:	b7c78793          	addi	a5,a5,-1156 # 2038 <digits>
    buf[16] = 0;
    14c4:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    14c8:	4525                	li	a0,9
        x = xx;
    14ca:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    14ce:	973e                	add	a4,a4,a5
    14d0:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    14d4:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    14d8:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    14dc:	2cc55063          	bge	a0,a2,179c <printf+0x632>
    14e0:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    14e4:	02d5f73b          	remuw	a4,a1,a3
    14e8:	1702                	slli	a4,a4,0x20
    14ea:	9301                	srli	a4,a4,0x20
    14ec:	973e                	add	a4,a4,a5
    14ee:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    14f2:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    14f6:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    14fa:	1f057d63          	bgeu	a0,a6,16f4 <printf+0x58a>
        buf[i--] = digits[x % base];
    14fe:	4529                	li	a0,10
    } while ((x /= base) != 0);
    1500:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1502:	02a5f73b          	remuw	a4,a1,a0
    1506:	973e                	add	a4,a4,a5
    1508:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    150c:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    1510:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    1514:	1ab6f163          	bgeu	a3,a1,16b6 <printf+0x54c>
    1518:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    151c:	02a776bb          	remuw	a3,a4,a0
    1520:	96be                	add	a3,a3,a5
    1522:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1526:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    152a:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    152e:	20b87c63          	bgeu	a6,a1,1746 <printf+0x5dc>
    1532:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    1536:	02a776bb          	remuw	a3,a4,a0
    153a:	96be                	add	a3,a3,a5
    153c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1540:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1544:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1548:	20b87363          	bgeu	a6,a1,174e <printf+0x5e4>
        buf[i--] = digits[x % base];
    154c:	02a776bb          	remuw	a3,a4,a0
    1550:	96be                	add	a3,a3,a5
    1552:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1556:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    155a:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    155e:	20b9f563          	bgeu	s3,a1,1768 <printf+0x5fe>
        buf[i--] = digits[x % base];
    1562:	02a776bb          	remuw	a3,a4,a0
    1566:	96be                	add	a3,a3,a5
    1568:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    156c:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1570:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1574:	20bafb63          	bgeu	s5,a1,178a <printf+0x620>
        buf[i--] = digits[x % base];
    1578:	02a776bb          	remuw	a3,a4,a0
    157c:	96be                	add	a3,a3,a5
    157e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1582:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1586:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    158a:	1eba7c63          	bgeu	s4,a1,1782 <printf+0x618>
        buf[i--] = digits[x % base];
    158e:	02a776bb          	remuw	a3,a4,a0
    1592:	96be                	add	a3,a3,a5
    1594:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1598:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    159c:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    15a0:	14bb7163          	bgeu	s6,a1,16e2 <printf+0x578>
        buf[i--] = digits[x % base];
    15a4:	1702                	slli	a4,a4,0x20
    15a6:	9301                	srli	a4,a4,0x20
    15a8:	97ba                	add	a5,a5,a4
    15aa:	0007c783          	lbu	a5,0(a5)
    15ae:	4599                	li	a1,6
    15b0:	00f10723          	sb	a5,14(sp)
    if (sign)
    15b4:	ea065de3          	bgez	a2,146e <printf+0x304>
        buf[i--] = '-';
    15b8:	02d00793          	li	a5,45
    15bc:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    15c0:	4595                	li	a1,5
    write(f, s, l);
    15c2:	003c                	addi	a5,sp,8
    15c4:	4641                	li	a2,16
    15c6:	9e0d                	subw	a2,a2,a1
    15c8:	4505                	li	a0,1
    15ca:	95be                	add	a1,a1,a5
    15cc:	073000ef          	jal	ra,1e3e <write>
    15d0:	b575                	j	147c <printf+0x312>
    char byte = c;
    15d2:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    15d6:	4605                	li	a2,1
    15d8:	002c                	addi	a1,sp,8
    15da:	4505                	li	a0,1
    char byte = c;
    15dc:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15e0:	05f000ef          	jal	ra,1e3e <write>
    char byte = c;
    15e4:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15e8:	4605                	li	a2,1
    15ea:	002c                	addi	a1,sp,8
    15ec:	4505                	li	a0,1
    char byte = c;
    15ee:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15f2:	04d000ef          	jal	ra,1e3e <write>
        s += 2;
    15f6:	00248513          	addi	a0,s1,2
    15fa:	be4d                	j	11ac <printf+0x42>
        x = -xx;
    15fc:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    1600:	00001797          	auipc	a5,0x1
    1604:	a3878793          	addi	a5,a5,-1480 # 2038 <digits>
    1608:	00f77613          	andi	a2,a4,15
    160c:	963e                	add	a2,a2,a5
    160e:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    1612:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1616:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    1618:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    161c:	0047551b          	srliw	a0,a4,0x4
    1620:	0047561b          	srliw	a2,a4,0x4
    1624:	0ab6d263          	bge	a3,a1,16c8 <printf+0x55e>
        buf[i--] = digits[x % base];
    1628:	8a3d                	andi	a2,a2,15
    162a:	963e                	add	a2,a2,a5
    162c:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    1630:	463d                	li	a2,15
    1632:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    1636:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    163a:	daa661e3          	bltu	a2,a0,13dc <printf+0x272>
        buf[i--] = '-';
    163e:	02d00793          	li	a5,45
    1642:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1646:	45b5                	li	a1,13
    write(f, s, l);
    1648:	003c                	addi	a5,sp,8
    164a:	4641                	li	a2,16
    164c:	9e0d                	subw	a2,a2,a1
    164e:	4505                	li	a0,1
    1650:	95be                	add	a1,a1,a5
    1652:	7ec000ef          	jal	ra,1e3e <write>
    1656:	b51d                	j	147c <printf+0x312>
        x = -xx;
    1658:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    165c:	46a9                	li	a3,10
    165e:	02d875bb          	remuw	a1,a6,a3
    1662:	00001797          	auipc	a5,0x1
    1666:	9d678793          	addi	a5,a5,-1578 # 2038 <digits>
    buf[16] = 0;
    166a:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    166e:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    1670:	95be                	add	a1,a1,a5
    1672:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    1676:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    167a:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    167e:	04a65563          	bge	a2,a0,16c8 <printf+0x55e>
    1682:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1686:	02d775bb          	remuw	a1,a4,a3
    168a:	95be                	add	a1,a1,a5
    168c:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    1690:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    1694:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    1698:	fb0573e3          	bgeu	a0,a6,163e <printf+0x4d4>
        buf[i--] = digits[x % base];
    169c:	4529                	li	a0,10
    } while ((x /= base) != 0);
    169e:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    16a0:	02a5f73b          	remuw	a4,a1,a0
    16a4:	973e                	add	a4,a4,a5
    16a6:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    16aa:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    16ae:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    16b2:	e6b6e3e3          	bltu	a3,a1,1518 <printf+0x3ae>
        buf[i--] = digits[x % base];
    16b6:	45b5                	li	a1,13
    if (sign)
    16b8:	da065be3          	bgez	a2,146e <printf+0x304>
    16bc:	a881                	j	170c <printf+0x5a2>
                a = "(null)";
    16be:	00001417          	auipc	s0,0x1
    16c2:	94a40413          	addi	s0,s0,-1718 # 2008 <unlink+0x24>
    16c6:	b3e1                	j	148e <printf+0x324>
        buf[i--] = '-';
    16c8:	02d00793          	li	a5,45
    16cc:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    16d0:	45b9                	li	a1,14
    write(f, s, l);
    16d2:	003c                	addi	a5,sp,8
    16d4:	4641                	li	a2,16
    16d6:	9e0d                	subw	a2,a2,a1
    16d8:	4505                	li	a0,1
    16da:	95be                	add	a1,a1,a5
    16dc:	762000ef          	jal	ra,1e3e <write>
    16e0:	bb71                	j	147c <printf+0x312>
        buf[i--] = digits[x % base];
    16e2:	459d                	li	a1,7
    if (sign)
    16e4:	d80655e3          	bgez	a2,146e <printf+0x304>
        buf[i--] = '-';
    16e8:	02d00793          	li	a5,45
    16ec:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    16f0:	4599                	li	a1,6
    16f2:	bbb5                	j	146e <printf+0x304>
    16f4:	45b9                	li	a1,14
    write(f, s, l);
    16f6:	003c                	addi	a5,sp,8
    16f8:	4641                	li	a2,16
    16fa:	9e0d                	subw	a2,a2,a1
    16fc:	4505                	li	a0,1
    16fe:	95be                	add	a1,a1,a5
    1700:	73e000ef          	jal	ra,1e3e <write>
    1704:	bba5                	j	147c <printf+0x312>
        buf[i--] = digits[x % base];
    1706:	45b5                	li	a1,13
    if (sign)
    1708:	d606d3e3          	bgez	a3,146e <printf+0x304>
        buf[i--] = '-';
    170c:	02d00793          	li	a5,45
    1710:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1714:	45b1                	li	a1,12
    write(f, s, l);
    1716:	003c                	addi	a5,sp,8
    1718:	4641                	li	a2,16
    171a:	9e0d                	subw	a2,a2,a1
    171c:	4505                	li	a0,1
    171e:	95be                	add	a1,a1,a5
    1720:	71e000ef          	jal	ra,1e3e <write>
    1724:	bba1                	j	147c <printf+0x312>
        buf[i--] = digits[x % base];
    1726:	45b1                	li	a1,12
    if (sign)
    1728:	d406d3e3          	bgez	a3,146e <printf+0x304>
        buf[i--] = '-';
    172c:	02d00793          	li	a5,45
    1730:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1734:	45ad                	li	a1,11
    write(f, s, l);
    1736:	003c                	addi	a5,sp,8
    1738:	4641                	li	a2,16
    173a:	9e0d                	subw	a2,a2,a1
    173c:	4505                	li	a0,1
    173e:	95be                	add	a1,a1,a5
    1740:	6fe000ef          	jal	ra,1e3e <write>
    1744:	bb25                	j	147c <printf+0x312>
        buf[i--] = digits[x % base];
    1746:	45b1                	li	a1,12
    if (sign)
    1748:	d20653e3          	bgez	a2,146e <printf+0x304>
    174c:	b7c5                	j	172c <printf+0x5c2>
        buf[i--] = digits[x % base];
    174e:	45ad                	li	a1,11
    if (sign)
    1750:	d0065fe3          	bgez	a2,146e <printf+0x304>
        buf[i--] = '-';
    1754:	02d00793          	li	a5,45
    1758:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    175c:	45a9                	li	a1,10
    175e:	bb01                	j	146e <printf+0x304>
    1760:	45ad                	li	a1,11
    if (sign)
    1762:	d006d6e3          	bgez	a3,146e <printf+0x304>
    1766:	b7fd                	j	1754 <printf+0x5ea>
        buf[i--] = digits[x % base];
    1768:	45a9                	li	a1,10
    if (sign)
    176a:	d00652e3          	bgez	a2,146e <printf+0x304>
        buf[i--] = '-';
    176e:	02d00793          	li	a5,45
    1772:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1776:	45a5                	li	a1,9
    1778:	b9dd                	j	146e <printf+0x304>
    177a:	45a9                	li	a1,10
    if (sign)
    177c:	ce06d9e3          	bgez	a3,146e <printf+0x304>
    1780:	b7fd                	j	176e <printf+0x604>
        buf[i--] = digits[x % base];
    1782:	45a1                	li	a1,8
    if (sign)
    1784:	ce0655e3          	bgez	a2,146e <printf+0x304>
    1788:	b9f1                	j	1464 <printf+0x2fa>
        buf[i--] = digits[x % base];
    178a:	45a5                	li	a1,9
    if (sign)
    178c:	ce0651e3          	bgez	a2,146e <printf+0x304>
        buf[i--] = '-';
    1790:	02d00793          	li	a5,45
    1794:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1798:	45a1                	li	a1,8
    179a:	b9d1                	j	146e <printf+0x304>
    i = 15;
    179c:	45bd                	li	a1,15
    179e:	b9c1                	j	146e <printf+0x304>
        buf[i--] = digits[x % base];
    17a0:	45a5                	li	a1,9
    if (sign)
    17a2:	cc06d6e3          	bgez	a3,146e <printf+0x304>
    17a6:	b7ed                	j	1790 <printf+0x626>

00000000000017a8 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    17a8:	02000793          	li	a5,32
    17ac:	00f50663          	beq	a0,a5,17b8 <isspace+0x10>
    17b0:	355d                	addiw	a0,a0,-9
    17b2:	00553513          	sltiu	a0,a0,5
    17b6:	8082                	ret
    17b8:	4505                	li	a0,1
}
    17ba:	8082                	ret

00000000000017bc <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    17bc:	fd05051b          	addiw	a0,a0,-48
}
    17c0:	00a53513          	sltiu	a0,a0,10
    17c4:	8082                	ret

00000000000017c6 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    17c6:	02000613          	li	a2,32
    17ca:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    17cc:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    17d0:	ff77069b          	addiw	a3,a4,-9
    17d4:	04c70d63          	beq	a4,a2,182e <atoi+0x68>
    17d8:	0007079b          	sext.w	a5,a4
    17dc:	04d5f963          	bgeu	a1,a3,182e <atoi+0x68>
        s++;
    switch (*s)
    17e0:	02b00693          	li	a3,43
    17e4:	04d70a63          	beq	a4,a3,1838 <atoi+0x72>
    17e8:	02d00693          	li	a3,45
    17ec:	06d70463          	beq	a4,a3,1854 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    17f0:	fd07859b          	addiw	a1,a5,-48
    17f4:	4625                	li	a2,9
    17f6:	873e                	mv	a4,a5
    17f8:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    17fa:	4e01                	li	t3,0
    while (isdigit(*s))
    17fc:	04b66a63          	bltu	a2,a1,1850 <atoi+0x8a>
    int n = 0, neg = 0;
    1800:	4501                	li	a0,0
    while (isdigit(*s))
    1802:	4825                	li	a6,9
    1804:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1808:	0025179b          	slliw	a5,a0,0x2
    180c:	9d3d                	addw	a0,a0,a5
    180e:	fd07031b          	addiw	t1,a4,-48
    1812:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1816:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    181a:	0685                	addi	a3,a3,1
    181c:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1820:	0006071b          	sext.w	a4,a2
    1824:	feb870e3          	bgeu	a6,a1,1804 <atoi+0x3e>
    return neg ? n : -n;
    1828:	000e0563          	beqz	t3,1832 <atoi+0x6c>
}
    182c:	8082                	ret
        s++;
    182e:	0505                	addi	a0,a0,1
    1830:	bf71                	j	17cc <atoi+0x6>
    1832:	4113053b          	subw	a0,t1,a7
    1836:	8082                	ret
    while (isdigit(*s))
    1838:	00154783          	lbu	a5,1(a0)
    183c:	4625                	li	a2,9
        s++;
    183e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1842:	fd07859b          	addiw	a1,a5,-48
    1846:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    184a:	4e01                	li	t3,0
    while (isdigit(*s))
    184c:	fab67ae3          	bgeu	a2,a1,1800 <atoi+0x3a>
    1850:	4501                	li	a0,0
}
    1852:	8082                	ret
    while (isdigit(*s))
    1854:	00154783          	lbu	a5,1(a0)
    1858:	4625                	li	a2,9
        s++;
    185a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    185e:	fd07859b          	addiw	a1,a5,-48
    1862:	0007871b          	sext.w	a4,a5
    1866:	feb665e3          	bltu	a2,a1,1850 <atoi+0x8a>
        neg = 1;
    186a:	4e05                	li	t3,1
    186c:	bf51                	j	1800 <atoi+0x3a>

000000000000186e <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    186e:	16060d63          	beqz	a2,19e8 <memset+0x17a>
    1872:	40a007b3          	neg	a5,a0
    1876:	8b9d                	andi	a5,a5,7
    1878:	00778713          	addi	a4,a5,7
    187c:	482d                	li	a6,11
    187e:	0ff5f593          	andi	a1,a1,255
    1882:	fff60693          	addi	a3,a2,-1
    1886:	17076263          	bltu	a4,a6,19ea <memset+0x17c>
    188a:	16e6ea63          	bltu	a3,a4,19fe <memset+0x190>
    188e:	16078563          	beqz	a5,19f8 <memset+0x18a>
    1892:	00b50023          	sb	a1,0(a0)
    1896:	4705                	li	a4,1
    1898:	00150e93          	addi	t4,a0,1
    189c:	14e78c63          	beq	a5,a4,19f4 <memset+0x186>
    18a0:	00b500a3          	sb	a1,1(a0)
    18a4:	4709                	li	a4,2
    18a6:	00250e93          	addi	t4,a0,2
    18aa:	14e78d63          	beq	a5,a4,1a04 <memset+0x196>
    18ae:	00b50123          	sb	a1,2(a0)
    18b2:	470d                	li	a4,3
    18b4:	00350e93          	addi	t4,a0,3
    18b8:	12e78b63          	beq	a5,a4,19ee <memset+0x180>
    18bc:	00b501a3          	sb	a1,3(a0)
    18c0:	4711                	li	a4,4
    18c2:	00450e93          	addi	t4,a0,4
    18c6:	14e78163          	beq	a5,a4,1a08 <memset+0x19a>
    18ca:	00b50223          	sb	a1,4(a0)
    18ce:	4715                	li	a4,5
    18d0:	00550e93          	addi	t4,a0,5
    18d4:	12e78c63          	beq	a5,a4,1a0c <memset+0x19e>
    18d8:	00b502a3          	sb	a1,5(a0)
    18dc:	471d                	li	a4,7
    18de:	00650e93          	addi	t4,a0,6
    18e2:	12e79763          	bne	a5,a4,1a10 <memset+0x1a2>
    18e6:	00750e93          	addi	t4,a0,7
    18ea:	00b50323          	sb	a1,6(a0)
    18ee:	4f1d                	li	t5,7
    18f0:	00859713          	slli	a4,a1,0x8
    18f4:	8f4d                	or	a4,a4,a1
    18f6:	01059e13          	slli	t3,a1,0x10
    18fa:	01c76e33          	or	t3,a4,t3
    18fe:	01859313          	slli	t1,a1,0x18
    1902:	006e6333          	or	t1,t3,t1
    1906:	02059893          	slli	a7,a1,0x20
    190a:	011368b3          	or	a7,t1,a7
    190e:	02859813          	slli	a6,a1,0x28
    1912:	40f60333          	sub	t1,a2,a5
    1916:	0108e833          	or	a6,a7,a6
    191a:	03059693          	slli	a3,a1,0x30
    191e:	00d866b3          	or	a3,a6,a3
    1922:	03859713          	slli	a4,a1,0x38
    1926:	97aa                	add	a5,a5,a0
    1928:	ff837813          	andi	a6,t1,-8
    192c:	8f55                	or	a4,a4,a3
    192e:	00f806b3          	add	a3,a6,a5
    1932:	e398                	sd	a4,0(a5)
    1934:	07a1                	addi	a5,a5,8
    1936:	fed79ee3          	bne	a5,a3,1932 <memset+0xc4>
    193a:	ff837693          	andi	a3,t1,-8
    193e:	00de87b3          	add	a5,t4,a3
    1942:	01e6873b          	addw	a4,a3,t5
    1946:	0ad30663          	beq	t1,a3,19f2 <memset+0x184>
    194a:	00b78023          	sb	a1,0(a5)
    194e:	0017069b          	addiw	a3,a4,1
    1952:	08c6fb63          	bgeu	a3,a2,19e8 <memset+0x17a>
    1956:	00b780a3          	sb	a1,1(a5)
    195a:	0027069b          	addiw	a3,a4,2
    195e:	08c6f563          	bgeu	a3,a2,19e8 <memset+0x17a>
    1962:	00b78123          	sb	a1,2(a5)
    1966:	0037069b          	addiw	a3,a4,3
    196a:	06c6ff63          	bgeu	a3,a2,19e8 <memset+0x17a>
    196e:	00b781a3          	sb	a1,3(a5)
    1972:	0047069b          	addiw	a3,a4,4
    1976:	06c6f963          	bgeu	a3,a2,19e8 <memset+0x17a>
    197a:	00b78223          	sb	a1,4(a5)
    197e:	0057069b          	addiw	a3,a4,5
    1982:	06c6f363          	bgeu	a3,a2,19e8 <memset+0x17a>
    1986:	00b782a3          	sb	a1,5(a5)
    198a:	0067069b          	addiw	a3,a4,6
    198e:	04c6fd63          	bgeu	a3,a2,19e8 <memset+0x17a>
    1992:	00b78323          	sb	a1,6(a5)
    1996:	0077069b          	addiw	a3,a4,7
    199a:	04c6f763          	bgeu	a3,a2,19e8 <memset+0x17a>
    199e:	00b783a3          	sb	a1,7(a5)
    19a2:	0087069b          	addiw	a3,a4,8
    19a6:	04c6f163          	bgeu	a3,a2,19e8 <memset+0x17a>
    19aa:	00b78423          	sb	a1,8(a5)
    19ae:	0097069b          	addiw	a3,a4,9
    19b2:	02c6fb63          	bgeu	a3,a2,19e8 <memset+0x17a>
    19b6:	00b784a3          	sb	a1,9(a5)
    19ba:	00a7069b          	addiw	a3,a4,10
    19be:	02c6f563          	bgeu	a3,a2,19e8 <memset+0x17a>
    19c2:	00b78523          	sb	a1,10(a5)
    19c6:	00b7069b          	addiw	a3,a4,11
    19ca:	00c6ff63          	bgeu	a3,a2,19e8 <memset+0x17a>
    19ce:	00b785a3          	sb	a1,11(a5)
    19d2:	00c7069b          	addiw	a3,a4,12
    19d6:	00c6f963          	bgeu	a3,a2,19e8 <memset+0x17a>
    19da:	00b78623          	sb	a1,12(a5)
    19de:	2735                	addiw	a4,a4,13
    19e0:	00c77463          	bgeu	a4,a2,19e8 <memset+0x17a>
    19e4:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    19e8:	8082                	ret
    19ea:	472d                	li	a4,11
    19ec:	bd79                	j	188a <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    19ee:	4f0d                	li	t5,3
    19f0:	b701                	j	18f0 <memset+0x82>
    19f2:	8082                	ret
    19f4:	4f05                	li	t5,1
    19f6:	bded                	j	18f0 <memset+0x82>
    19f8:	8eaa                	mv	t4,a0
    19fa:	4f01                	li	t5,0
    19fc:	bdd5                	j	18f0 <memset+0x82>
    19fe:	87aa                	mv	a5,a0
    1a00:	4701                	li	a4,0
    1a02:	b7a1                	j	194a <memset+0xdc>
    1a04:	4f09                	li	t5,2
    1a06:	b5ed                	j	18f0 <memset+0x82>
    1a08:	4f11                	li	t5,4
    1a0a:	b5dd                	j	18f0 <memset+0x82>
    1a0c:	4f15                	li	t5,5
    1a0e:	b5cd                	j	18f0 <memset+0x82>
    1a10:	4f19                	li	t5,6
    1a12:	bdf9                	j	18f0 <memset+0x82>

0000000000001a14 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1a14:	00054783          	lbu	a5,0(a0)
    1a18:	0005c703          	lbu	a4,0(a1)
    1a1c:	00e79863          	bne	a5,a4,1a2c <strcmp+0x18>
    1a20:	0505                	addi	a0,a0,1
    1a22:	0585                	addi	a1,a1,1
    1a24:	fbe5                	bnez	a5,1a14 <strcmp>
    1a26:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1a28:	9d19                	subw	a0,a0,a4
    1a2a:	8082                	ret
    1a2c:	0007851b          	sext.w	a0,a5
    1a30:	bfe5                	j	1a28 <strcmp+0x14>

0000000000001a32 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1a32:	ce05                	beqz	a2,1a6a <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1a34:	00054703          	lbu	a4,0(a0)
    1a38:	0005c783          	lbu	a5,0(a1)
    1a3c:	cb0d                	beqz	a4,1a6e <strncmp+0x3c>
    if (!n--)
    1a3e:	167d                	addi	a2,a2,-1
    1a40:	00c506b3          	add	a3,a0,a2
    1a44:	a819                	j	1a5a <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1a46:	00a68e63          	beq	a3,a0,1a62 <strncmp+0x30>
    1a4a:	0505                	addi	a0,a0,1
    1a4c:	00e79b63          	bne	a5,a4,1a62 <strncmp+0x30>
    1a50:	00054703          	lbu	a4,0(a0)
    1a54:	0005c783          	lbu	a5,0(a1)
    1a58:	cb19                	beqz	a4,1a6e <strncmp+0x3c>
    1a5a:	0005c783          	lbu	a5,0(a1)
    1a5e:	0585                	addi	a1,a1,1
    1a60:	f3fd                	bnez	a5,1a46 <strncmp+0x14>
        ;
    return *l - *r;
    1a62:	0007051b          	sext.w	a0,a4
    1a66:	9d1d                	subw	a0,a0,a5
    1a68:	8082                	ret
        return 0;
    1a6a:	4501                	li	a0,0
}
    1a6c:	8082                	ret
    1a6e:	4501                	li	a0,0
    return *l - *r;
    1a70:	9d1d                	subw	a0,a0,a5
    1a72:	8082                	ret

0000000000001a74 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1a74:	00757793          	andi	a5,a0,7
    1a78:	cf89                	beqz	a5,1a92 <strlen+0x1e>
    1a7a:	87aa                	mv	a5,a0
    1a7c:	a029                	j	1a86 <strlen+0x12>
    1a7e:	0785                	addi	a5,a5,1
    1a80:	0077f713          	andi	a4,a5,7
    1a84:	cb01                	beqz	a4,1a94 <strlen+0x20>
        if (!*s)
    1a86:	0007c703          	lbu	a4,0(a5)
    1a8a:	fb75                	bnez	a4,1a7e <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1a8c:	40a78533          	sub	a0,a5,a0
}
    1a90:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1a92:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1a94:	6394                	ld	a3,0(a5)
    1a96:	00000597          	auipc	a1,0x0
    1a9a:	58a5b583          	ld	a1,1418(a1) # 2020 <BUF_LEN+0x4>
    1a9e:	00000617          	auipc	a2,0x0
    1aa2:	58a63603          	ld	a2,1418(a2) # 2028 <BUF_LEN+0xc>
    1aa6:	a019                	j	1aac <strlen+0x38>
    1aa8:	6794                	ld	a3,8(a5)
    1aaa:	07a1                	addi	a5,a5,8
    1aac:	00b68733          	add	a4,a3,a1
    1ab0:	fff6c693          	not	a3,a3
    1ab4:	8f75                	and	a4,a4,a3
    1ab6:	8f71                	and	a4,a4,a2
    1ab8:	db65                	beqz	a4,1aa8 <strlen+0x34>
    for (; *s; s++)
    1aba:	0007c703          	lbu	a4,0(a5)
    1abe:	d779                	beqz	a4,1a8c <strlen+0x18>
    1ac0:	0017c703          	lbu	a4,1(a5)
    1ac4:	0785                	addi	a5,a5,1
    1ac6:	d379                	beqz	a4,1a8c <strlen+0x18>
    1ac8:	0017c703          	lbu	a4,1(a5)
    1acc:	0785                	addi	a5,a5,1
    1ace:	fb6d                	bnez	a4,1ac0 <strlen+0x4c>
    1ad0:	bf75                	j	1a8c <strlen+0x18>

0000000000001ad2 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1ad2:	00757713          	andi	a4,a0,7
{
    1ad6:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1ad8:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1adc:	cb19                	beqz	a4,1af2 <memchr+0x20>
    1ade:	ce25                	beqz	a2,1b56 <memchr+0x84>
    1ae0:	0007c703          	lbu	a4,0(a5)
    1ae4:	04b70e63          	beq	a4,a1,1b40 <memchr+0x6e>
    1ae8:	0785                	addi	a5,a5,1
    1aea:	0077f713          	andi	a4,a5,7
    1aee:	167d                	addi	a2,a2,-1
    1af0:	f77d                	bnez	a4,1ade <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1af2:	4501                	li	a0,0
    if (n && *s != c)
    1af4:	c235                	beqz	a2,1b58 <memchr+0x86>
    1af6:	0007c703          	lbu	a4,0(a5)
    1afa:	04b70363          	beq	a4,a1,1b40 <memchr+0x6e>
        size_t k = ONES * c;
    1afe:	00000517          	auipc	a0,0x0
    1b02:	53253503          	ld	a0,1330(a0) # 2030 <BUF_LEN+0x14>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1b06:	471d                	li	a4,7
        size_t k = ONES * c;
    1b08:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1b0c:	02c77a63          	bgeu	a4,a2,1b40 <memchr+0x6e>
    1b10:	00000897          	auipc	a7,0x0
    1b14:	5108b883          	ld	a7,1296(a7) # 2020 <BUF_LEN+0x4>
    1b18:	00000817          	auipc	a6,0x0
    1b1c:	51083803          	ld	a6,1296(a6) # 2028 <BUF_LEN+0xc>
    1b20:	431d                	li	t1,7
    1b22:	a029                	j	1b2c <memchr+0x5a>
    1b24:	1661                	addi	a2,a2,-8
    1b26:	07a1                	addi	a5,a5,8
    1b28:	02c37963          	bgeu	t1,a2,1b5a <memchr+0x88>
    1b2c:	6398                	ld	a4,0(a5)
    1b2e:	8f29                	xor	a4,a4,a0
    1b30:	011706b3          	add	a3,a4,a7
    1b34:	fff74713          	not	a4,a4
    1b38:	8f75                	and	a4,a4,a3
    1b3a:	01077733          	and	a4,a4,a6
    1b3e:	d37d                	beqz	a4,1b24 <memchr+0x52>
    1b40:	853e                	mv	a0,a5
    1b42:	97b2                	add	a5,a5,a2
    1b44:	a021                	j	1b4c <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1b46:	0505                	addi	a0,a0,1
    1b48:	00f50763          	beq	a0,a5,1b56 <memchr+0x84>
    1b4c:	00054703          	lbu	a4,0(a0)
    1b50:	feb71be3          	bne	a4,a1,1b46 <memchr+0x74>
    1b54:	8082                	ret
    return n ? (void *)s : 0;
    1b56:	4501                	li	a0,0
}
    1b58:	8082                	ret
    return n ? (void *)s : 0;
    1b5a:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1b5c:	f275                	bnez	a2,1b40 <memchr+0x6e>
}
    1b5e:	8082                	ret

0000000000001b60 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1b60:	1101                	addi	sp,sp,-32
    1b62:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1b64:	862e                	mv	a2,a1
{
    1b66:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1b68:	4581                	li	a1,0
{
    1b6a:	e426                	sd	s1,8(sp)
    1b6c:	ec06                	sd	ra,24(sp)
    1b6e:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1b70:	f63ff0ef          	jal	ra,1ad2 <memchr>
    return p ? p - s : n;
    1b74:	c519                	beqz	a0,1b82 <strnlen+0x22>
}
    1b76:	60e2                	ld	ra,24(sp)
    1b78:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1b7a:	8d05                	sub	a0,a0,s1
}
    1b7c:	64a2                	ld	s1,8(sp)
    1b7e:	6105                	addi	sp,sp,32
    1b80:	8082                	ret
    1b82:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1b84:	8522                	mv	a0,s0
}
    1b86:	6442                	ld	s0,16(sp)
    1b88:	64a2                	ld	s1,8(sp)
    1b8a:	6105                	addi	sp,sp,32
    1b8c:	8082                	ret

0000000000001b8e <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1b8e:	00b547b3          	xor	a5,a0,a1
    1b92:	8b9d                	andi	a5,a5,7
    1b94:	eb95                	bnez	a5,1bc8 <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1b96:	0075f793          	andi	a5,a1,7
    1b9a:	e7b1                	bnez	a5,1be6 <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1b9c:	6198                	ld	a4,0(a1)
    1b9e:	00000617          	auipc	a2,0x0
    1ba2:	48263603          	ld	a2,1154(a2) # 2020 <BUF_LEN+0x4>
    1ba6:	00000817          	auipc	a6,0x0
    1baa:	48283803          	ld	a6,1154(a6) # 2028 <BUF_LEN+0xc>
    1bae:	a029                	j	1bb8 <stpcpy+0x2a>
    1bb0:	e118                	sd	a4,0(a0)
    1bb2:	6598                	ld	a4,8(a1)
    1bb4:	05a1                	addi	a1,a1,8
    1bb6:	0521                	addi	a0,a0,8
    1bb8:	00c707b3          	add	a5,a4,a2
    1bbc:	fff74693          	not	a3,a4
    1bc0:	8ff5                	and	a5,a5,a3
    1bc2:	0107f7b3          	and	a5,a5,a6
    1bc6:	d7ed                	beqz	a5,1bb0 <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1bc8:	0005c783          	lbu	a5,0(a1)
    1bcc:	00f50023          	sb	a5,0(a0)
    1bd0:	c785                	beqz	a5,1bf8 <stpcpy+0x6a>
    1bd2:	0015c783          	lbu	a5,1(a1)
    1bd6:	0505                	addi	a0,a0,1
    1bd8:	0585                	addi	a1,a1,1
    1bda:	00f50023          	sb	a5,0(a0)
    1bde:	fbf5                	bnez	a5,1bd2 <stpcpy+0x44>
        ;
    return d;
}
    1be0:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1be2:	0505                	addi	a0,a0,1
    1be4:	df45                	beqz	a4,1b9c <stpcpy+0xe>
            if (!(*d = *s))
    1be6:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1bea:	0585                	addi	a1,a1,1
    1bec:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1bf0:	00f50023          	sb	a5,0(a0)
    1bf4:	f7fd                	bnez	a5,1be2 <stpcpy+0x54>
}
    1bf6:	8082                	ret
    1bf8:	8082                	ret

0000000000001bfa <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1bfa:	00b547b3          	xor	a5,a0,a1
    1bfe:	8b9d                	andi	a5,a5,7
    1c00:	1a079863          	bnez	a5,1db0 <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1c04:	0075f793          	andi	a5,a1,7
    1c08:	16078463          	beqz	a5,1d70 <stpncpy+0x176>
    1c0c:	ea01                	bnez	a2,1c1c <stpncpy+0x22>
    1c0e:	a421                	j	1e16 <stpncpy+0x21c>
    1c10:	167d                	addi	a2,a2,-1
    1c12:	0505                	addi	a0,a0,1
    1c14:	14070e63          	beqz	a4,1d70 <stpncpy+0x176>
    1c18:	1a060863          	beqz	a2,1dc8 <stpncpy+0x1ce>
    1c1c:	0005c783          	lbu	a5,0(a1)
    1c20:	0585                	addi	a1,a1,1
    1c22:	0075f713          	andi	a4,a1,7
    1c26:	00f50023          	sb	a5,0(a0)
    1c2a:	f3fd                	bnez	a5,1c10 <stpncpy+0x16>
    1c2c:	4805                	li	a6,1
    1c2e:	1a061863          	bnez	a2,1dde <stpncpy+0x1e4>
    1c32:	40a007b3          	neg	a5,a0
    1c36:	8b9d                	andi	a5,a5,7
    1c38:	4681                	li	a3,0
    1c3a:	18061a63          	bnez	a2,1dce <stpncpy+0x1d4>
    1c3e:	00778713          	addi	a4,a5,7
    1c42:	45ad                	li	a1,11
    1c44:	18b76363          	bltu	a4,a1,1dca <stpncpy+0x1d0>
    1c48:	1ae6eb63          	bltu	a3,a4,1dfe <stpncpy+0x204>
    1c4c:	1a078363          	beqz	a5,1df2 <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c50:	00050023          	sb	zero,0(a0)
    1c54:	4685                	li	a3,1
    1c56:	00150713          	addi	a4,a0,1
    1c5a:	18d78f63          	beq	a5,a3,1df8 <stpncpy+0x1fe>
    1c5e:	000500a3          	sb	zero,1(a0)
    1c62:	4689                	li	a3,2
    1c64:	00250713          	addi	a4,a0,2
    1c68:	18d78e63          	beq	a5,a3,1e04 <stpncpy+0x20a>
    1c6c:	00050123          	sb	zero,2(a0)
    1c70:	468d                	li	a3,3
    1c72:	00350713          	addi	a4,a0,3
    1c76:	16d78c63          	beq	a5,a3,1dee <stpncpy+0x1f4>
    1c7a:	000501a3          	sb	zero,3(a0)
    1c7e:	4691                	li	a3,4
    1c80:	00450713          	addi	a4,a0,4
    1c84:	18d78263          	beq	a5,a3,1e08 <stpncpy+0x20e>
    1c88:	00050223          	sb	zero,4(a0)
    1c8c:	4695                	li	a3,5
    1c8e:	00550713          	addi	a4,a0,5
    1c92:	16d78d63          	beq	a5,a3,1e0c <stpncpy+0x212>
    1c96:	000502a3          	sb	zero,5(a0)
    1c9a:	469d                	li	a3,7
    1c9c:	00650713          	addi	a4,a0,6
    1ca0:	16d79863          	bne	a5,a3,1e10 <stpncpy+0x216>
    1ca4:	00750713          	addi	a4,a0,7
    1ca8:	00050323          	sb	zero,6(a0)
    1cac:	40f80833          	sub	a6,a6,a5
    1cb0:	ff887593          	andi	a1,a6,-8
    1cb4:	97aa                	add	a5,a5,a0
    1cb6:	95be                	add	a1,a1,a5
    1cb8:	0007b023          	sd	zero,0(a5)
    1cbc:	07a1                	addi	a5,a5,8
    1cbe:	feb79de3          	bne	a5,a1,1cb8 <stpncpy+0xbe>
    1cc2:	ff887593          	andi	a1,a6,-8
    1cc6:	9ead                	addw	a3,a3,a1
    1cc8:	00b707b3          	add	a5,a4,a1
    1ccc:	12b80863          	beq	a6,a1,1dfc <stpncpy+0x202>
    1cd0:	00078023          	sb	zero,0(a5)
    1cd4:	0016871b          	addiw	a4,a3,1
    1cd8:	0ec77863          	bgeu	a4,a2,1dc8 <stpncpy+0x1ce>
    1cdc:	000780a3          	sb	zero,1(a5)
    1ce0:	0026871b          	addiw	a4,a3,2
    1ce4:	0ec77263          	bgeu	a4,a2,1dc8 <stpncpy+0x1ce>
    1ce8:	00078123          	sb	zero,2(a5)
    1cec:	0036871b          	addiw	a4,a3,3
    1cf0:	0cc77c63          	bgeu	a4,a2,1dc8 <stpncpy+0x1ce>
    1cf4:	000781a3          	sb	zero,3(a5)
    1cf8:	0046871b          	addiw	a4,a3,4
    1cfc:	0cc77663          	bgeu	a4,a2,1dc8 <stpncpy+0x1ce>
    1d00:	00078223          	sb	zero,4(a5)
    1d04:	0056871b          	addiw	a4,a3,5
    1d08:	0cc77063          	bgeu	a4,a2,1dc8 <stpncpy+0x1ce>
    1d0c:	000782a3          	sb	zero,5(a5)
    1d10:	0066871b          	addiw	a4,a3,6
    1d14:	0ac77a63          	bgeu	a4,a2,1dc8 <stpncpy+0x1ce>
    1d18:	00078323          	sb	zero,6(a5)
    1d1c:	0076871b          	addiw	a4,a3,7
    1d20:	0ac77463          	bgeu	a4,a2,1dc8 <stpncpy+0x1ce>
    1d24:	000783a3          	sb	zero,7(a5)
    1d28:	0086871b          	addiw	a4,a3,8
    1d2c:	08c77e63          	bgeu	a4,a2,1dc8 <stpncpy+0x1ce>
    1d30:	00078423          	sb	zero,8(a5)
    1d34:	0096871b          	addiw	a4,a3,9
    1d38:	08c77863          	bgeu	a4,a2,1dc8 <stpncpy+0x1ce>
    1d3c:	000784a3          	sb	zero,9(a5)
    1d40:	00a6871b          	addiw	a4,a3,10
    1d44:	08c77263          	bgeu	a4,a2,1dc8 <stpncpy+0x1ce>
    1d48:	00078523          	sb	zero,10(a5)
    1d4c:	00b6871b          	addiw	a4,a3,11
    1d50:	06c77c63          	bgeu	a4,a2,1dc8 <stpncpy+0x1ce>
    1d54:	000785a3          	sb	zero,11(a5)
    1d58:	00c6871b          	addiw	a4,a3,12
    1d5c:	06c77663          	bgeu	a4,a2,1dc8 <stpncpy+0x1ce>
    1d60:	00078623          	sb	zero,12(a5)
    1d64:	26b5                	addiw	a3,a3,13
    1d66:	06c6f163          	bgeu	a3,a2,1dc8 <stpncpy+0x1ce>
    1d6a:	000786a3          	sb	zero,13(a5)
    1d6e:	8082                	ret
            ;
        if (!n || !*s)
    1d70:	c645                	beqz	a2,1e18 <stpncpy+0x21e>
    1d72:	0005c783          	lbu	a5,0(a1)
    1d76:	ea078be3          	beqz	a5,1c2c <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d7a:	479d                	li	a5,7
    1d7c:	02c7ff63          	bgeu	a5,a2,1dba <stpncpy+0x1c0>
    1d80:	00000897          	auipc	a7,0x0
    1d84:	2a08b883          	ld	a7,672(a7) # 2020 <BUF_LEN+0x4>
    1d88:	00000817          	auipc	a6,0x0
    1d8c:	2a083803          	ld	a6,672(a6) # 2028 <BUF_LEN+0xc>
    1d90:	431d                	li	t1,7
    1d92:	6198                	ld	a4,0(a1)
    1d94:	011707b3          	add	a5,a4,a7
    1d98:	fff74693          	not	a3,a4
    1d9c:	8ff5                	and	a5,a5,a3
    1d9e:	0107f7b3          	and	a5,a5,a6
    1da2:	ef81                	bnez	a5,1dba <stpncpy+0x1c0>
            *wd = *ws;
    1da4:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1da6:	1661                	addi	a2,a2,-8
    1da8:	05a1                	addi	a1,a1,8
    1daa:	0521                	addi	a0,a0,8
    1dac:	fec363e3          	bltu	t1,a2,1d92 <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1db0:	e609                	bnez	a2,1dba <stpncpy+0x1c0>
    1db2:	a08d                	j	1e14 <stpncpy+0x21a>
    1db4:	167d                	addi	a2,a2,-1
    1db6:	0505                	addi	a0,a0,1
    1db8:	ca01                	beqz	a2,1dc8 <stpncpy+0x1ce>
    1dba:	0005c783          	lbu	a5,0(a1)
    1dbe:	0585                	addi	a1,a1,1
    1dc0:	00f50023          	sb	a5,0(a0)
    1dc4:	fbe5                	bnez	a5,1db4 <stpncpy+0x1ba>
        ;
tail:
    1dc6:	b59d                	j	1c2c <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1dc8:	8082                	ret
    1dca:	472d                	li	a4,11
    1dcc:	bdb5                	j	1c48 <stpncpy+0x4e>
    1dce:	00778713          	addi	a4,a5,7
    1dd2:	45ad                	li	a1,11
    1dd4:	fff60693          	addi	a3,a2,-1
    1dd8:	e6b778e3          	bgeu	a4,a1,1c48 <stpncpy+0x4e>
    1ddc:	b7fd                	j	1dca <stpncpy+0x1d0>
    1dde:	40a007b3          	neg	a5,a0
    1de2:	8832                	mv	a6,a2
    1de4:	8b9d                	andi	a5,a5,7
    1de6:	4681                	li	a3,0
    1de8:	e4060be3          	beqz	a2,1c3e <stpncpy+0x44>
    1dec:	b7cd                	j	1dce <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1dee:	468d                	li	a3,3
    1df0:	bd75                	j	1cac <stpncpy+0xb2>
    1df2:	872a                	mv	a4,a0
    1df4:	4681                	li	a3,0
    1df6:	bd5d                	j	1cac <stpncpy+0xb2>
    1df8:	4685                	li	a3,1
    1dfa:	bd4d                	j	1cac <stpncpy+0xb2>
    1dfc:	8082                	ret
    1dfe:	87aa                	mv	a5,a0
    1e00:	4681                	li	a3,0
    1e02:	b5f9                	j	1cd0 <stpncpy+0xd6>
    1e04:	4689                	li	a3,2
    1e06:	b55d                	j	1cac <stpncpy+0xb2>
    1e08:	4691                	li	a3,4
    1e0a:	b54d                	j	1cac <stpncpy+0xb2>
    1e0c:	4695                	li	a3,5
    1e0e:	bd79                	j	1cac <stpncpy+0xb2>
    1e10:	4699                	li	a3,6
    1e12:	bd69                	j	1cac <stpncpy+0xb2>
    1e14:	8082                	ret
    1e16:	8082                	ret
    1e18:	8082                	ret

0000000000001e1a <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1e1a:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1e1e:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e20:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1e24:	2501                	sext.w	a0,a0
    1e26:	8082                	ret

0000000000001e28 <close>:
    register long a7 __asm__("a7") = n;
    1e28:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1e2c:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1e30:	2501                	sext.w	a0,a0
    1e32:	8082                	ret

0000000000001e34 <read>:
    register long a7 __asm__("a7") = n;
    1e34:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e38:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1e3c:	8082                	ret

0000000000001e3e <write>:
    register long a7 __asm__("a7") = n;
    1e3e:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e42:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1e46:	8082                	ret

0000000000001e48 <getpid>:
    register long a7 __asm__("a7") = n;
    1e48:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1e4c:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1e50:	2501                	sext.w	a0,a0
    1e52:	8082                	ret

0000000000001e54 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1e54:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1e58:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1e5c:	2501                	sext.w	a0,a0
    1e5e:	8082                	ret

0000000000001e60 <fork>:
    register long a7 __asm__("a7") = n;
    1e60:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1e64:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1e68:	2501                	sext.w	a0,a0
    1e6a:	8082                	ret

0000000000001e6c <exit>:
    register long a7 __asm__("a7") = n;
    1e6c:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e70:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e74:	8082                	ret

0000000000001e76 <waitpid>:
    register long a7 __asm__("a7") = n;
    1e76:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e7a:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1e7e:	2501                	sext.w	a0,a0
    1e80:	8082                	ret

0000000000001e82 <exec>:
    register long a7 __asm__("a7") = n;
    1e82:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e86:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e8a:	2501                	sext.w	a0,a0
    1e8c:	8082                	ret

0000000000001e8e <get_time>:

int64 get_time()
{
    1e8e:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e90:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e94:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e96:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e98:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e9c:	2501                	sext.w	a0,a0
    1e9e:	ed09                	bnez	a0,1eb8 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ea0:	67a2                	ld	a5,8(sp)
    1ea2:	3e800713          	li	a4,1000
    1ea6:	00015503          	lhu	a0,0(sp)
    1eaa:	02e7d7b3          	divu	a5,a5,a4
    1eae:	02e50533          	mul	a0,a0,a4
    1eb2:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1eb4:	0141                	addi	sp,sp,16
    1eb6:	8082                	ret
        return -1;
    1eb8:	557d                	li	a0,-1
    1eba:	bfed                	j	1eb4 <get_time+0x26>

0000000000001ebc <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1ebc:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec0:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1ec4:	2501                	sext.w	a0,a0
    1ec6:	8082                	ret

0000000000001ec8 <sleep>:

int sleep(unsigned long long time)
{
    1ec8:	1141                	addi	sp,sp,-16
    1eca:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1ecc:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ed0:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ed2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed4:	00000073          	ecall
    if (err == 0)
    1ed8:	2501                	sext.w	a0,a0
    1eda:	e13d                	bnez	a0,1f40 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1edc:	6722                	ld	a4,8(sp)
    1ede:	3e800693          	li	a3,1000
    1ee2:	00015783          	lhu	a5,0(sp)
    1ee6:	02d75733          	divu	a4,a4,a3
    1eea:	02d787b3          	mul	a5,a5,a3
    1eee:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1ef0:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ef4:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ef6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef8:	00000073          	ecall
    if (err == 0)
    1efc:	2501                	sext.w	a0,a0
    1efe:	ed15                	bnez	a0,1f3a <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1f00:	6841                	lui	a6,0x10
    1f02:	963e                	add	a2,a2,a5
    1f04:	187d                	addi	a6,a6,-1
    1f06:	3e800693          	li	a3,1000
    1f0a:	a819                	j	1f20 <sleep+0x58>
    __asm_syscall("r"(a7))
    1f0c:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1f10:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1f14:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1f16:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f18:	00000073          	ecall
    if (err == 0)
    1f1c:	2501                	sext.w	a0,a0
    1f1e:	ed11                	bnez	a0,1f3a <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1f20:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1f22:	07c00893          	li	a7,124
    1f26:	02d7d733          	divu	a4,a5,a3
    1f2a:	6782                	ld	a5,0(sp)
    1f2c:	0107f7b3          	and	a5,a5,a6
    1f30:	02d787b3          	mul	a5,a5,a3
    1f34:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1f36:	fcc7ebe3          	bltu	a5,a2,1f0c <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1f3a:	4501                	li	a0,0
    1f3c:	0141                	addi	sp,sp,16
    1f3e:	8082                	ret
    1f40:	57fd                	li	a5,-1
    1f42:	b77d                	j	1ef0 <sleep+0x28>

0000000000001f44 <set_priority>:
    register long a7 __asm__("a7") = n;
    1f44:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1f48:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1f4c:	2501                	sext.w	a0,a0
    1f4e:	8082                	ret

0000000000001f50 <mmap>:
    register long a7 __asm__("a7") = n;
    1f50:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f54:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1f58:	2501                	sext.w	a0,a0
    1f5a:	8082                	ret

0000000000001f5c <munmap>:
    register long a7 __asm__("a7") = n;
    1f5c:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f60:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1f64:	2501                	sext.w	a0,a0
    1f66:	8082                	ret

0000000000001f68 <wait>:

int wait(int *code)
{
    1f68:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f6a:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1f6e:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f70:	00000073          	ecall
    return waitpid(-1, code);
}
    1f74:	2501                	sext.w	a0,a0
    1f76:	8082                	ret

0000000000001f78 <spawn>:
    register long a7 __asm__("a7") = n;
    1f78:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1f7c:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f80:	2501                	sext.w	a0,a0
    1f82:	8082                	ret

0000000000001f84 <mailread>:
    register long a7 __asm__("a7") = n;
    1f84:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f88:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f8c:	2501                	sext.w	a0,a0
    1f8e:	8082                	ret

0000000000001f90 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f90:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f94:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f98:	2501                	sext.w	a0,a0
    1f9a:	8082                	ret

0000000000001f9c <fstat>:
    register long a7 __asm__("a7") = n;
    1f9c:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fa0:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1fa4:	2501                	sext.w	a0,a0
    1fa6:	8082                	ret

0000000000001fa8 <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1fa8:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1faa:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1fae:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fb0:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1fb4:	2501                	sext.w	a0,a0
    1fb6:	8082                	ret

0000000000001fb8 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1fb8:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1fba:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1fbe:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fc0:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1fc4:	2501                	sext.w	a0,a0
    1fc6:	8082                	ret

0000000000001fc8 <link>:

int link(char *old_path, char *new_path)
{
    1fc8:	87aa                	mv	a5,a0
    1fca:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1fcc:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1fd0:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1fd4:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1fd6:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1fda:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fdc:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1fe0:	2501                	sext.w	a0,a0
    1fe2:	8082                	ret

0000000000001fe4 <unlink>:

int unlink(char *path)
{
    1fe4:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1fe6:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1fea:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1fee:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ff0:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1ff4:	2501                	sext.w	a0,a0
    1ff6:	8082                	ret
