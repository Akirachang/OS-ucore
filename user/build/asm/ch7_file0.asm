
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch7_file0:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0ba0006f          	j	10bc <__start_main>

0000000000001006 <main>:
#include <stddef.h>

/// 测试文件基本读写，输出　Test file0 OK! 就算正确。

int main()
{
    1006:	7119                	addi	sp,sp,-128
    char *test_str = "Hello, world!";
    char *fname = "fname";
    int fd = open(fname, O_CREATE | O_WRONLY);
    1008:	20100593          	li	a1,513
    100c:	00001517          	auipc	a0,0x1
    1010:	fd450513          	addi	a0,a0,-44 # 1fe0 <unlink+0x18>
{
    1014:	f8a2                	sd	s0,112(sp)
    1016:	fc86                	sd	ra,120(sp)
    int fd = open(fname, O_CREATE | O_WRONLY);
    1018:	5e7000ef          	jal	ra,1dfe <open>
    101c:	842a                	mv	s0,a0
    assert(fd > 0);
    101e:	08a05b63          	blez	a0,10b4 <main+0xae>
    write(fd, test_str, strlen(test_str));
    1022:	00001517          	auipc	a0,0x1
    1026:	fc650513          	addi	a0,a0,-58 # 1fe8 <unlink+0x20>
    102a:	22f000ef          	jal	ra,1a58 <strlen>
    102e:	862a                	mv	a2,a0
    1030:	00001597          	auipc	a1,0x1
    1034:	fb858593          	addi	a1,a1,-72 # 1fe8 <unlink+0x20>
    1038:	8522                	mv	a0,s0
    103a:	5e9000ef          	jal	ra,1e22 <write>
    close(fd);
    103e:	8522                	mv	a0,s0
    1040:	5cd000ef          	jal	ra,1e0c <close>

    fd = open(fname, O_RDONLY);
    1044:	4581                	li	a1,0
    1046:	00001517          	auipc	a0,0x1
    104a:	f9a50513          	addi	a0,a0,-102 # 1fe0 <unlink+0x18>
    104e:	5b1000ef          	jal	ra,1dfe <open>
    1052:	842a                	mv	s0,a0
    assert(fd > 0);
    1054:	04a05c63          	blez	a0,10ac <main+0xa6>

    char buffer[100];
    memset(buffer, 0, sizeof(buffer));
    1058:	06400613          	li	a2,100
    105c:	4581                	li	a1,0
    105e:	0028                	addi	a0,sp,8
    1060:	7f2000ef          	jal	ra,1852 <memset>
    int read_len = read(fd, &buffer, sizeof(buffer));
    1064:	002c                	addi	a1,sp,8
    1066:	06400613          	li	a2,100
    106a:	8522                	mv	a0,s0
    106c:	5ad000ef          	jal	ra,1e18 <read>
    1070:	862a                	mv	a2,a0
    close(fd);
    1072:	8522                	mv	a0,s0
    int read_len = read(fd, &buffer, sizeof(buffer));
    1074:	8432                	mv	s0,a2
    close(fd);
    1076:	597000ef          	jal	ra,1e0c <close>

    assert(strncmp(buffer, test_str, read_len) == 0);
    107a:	0004061b          	sext.w	a2,s0
    107e:	00001597          	auipc	a1,0x1
    1082:	f6a58593          	addi	a1,a1,-150 # 1fe8 <unlink+0x20>
    1086:	0028                	addi	a0,sp,8
    1088:	18f000ef          	jal	ra,1a16 <strncmp>
    108c:	ed01                	bnez	a0,10a4 <main+0x9e>
    puts("Test file0 OK!");
    108e:	00001517          	auipc	a0,0x1
    1092:	f6a50513          	addi	a0,a0,-150 # 1ff8 <unlink+0x30>
    1096:	076000ef          	jal	ra,110c <puts>
    return 0;
    109a:	70e6                	ld	ra,120(sp)
    109c:	7446                	ld	s0,112(sp)
    109e:	4501                	li	a0,0
    10a0:	6109                	addi	sp,sp,128
    10a2:	8082                	ret
    assert(strncmp(buffer, test_str, read_len) == 0);
    10a4:	557d                	li	a0,-1
    10a6:	5ab000ef          	jal	ra,1e50 <exit>
    10aa:	b7d5                	j	108e <main+0x88>
    assert(fd > 0);
    10ac:	557d                	li	a0,-1
    10ae:	5a3000ef          	jal	ra,1e50 <exit>
    10b2:	b75d                	j	1058 <main+0x52>
    assert(fd > 0);
    10b4:	557d                	li	a0,-1
    10b6:	59b000ef          	jal	ra,1e50 <exit>
    10ba:	b7a5                	j	1022 <main+0x1c>

00000000000010bc <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10bc:	1141                	addi	sp,sp,-16
    10be:	e406                	sd	ra,8(sp)
    exit(main());
    10c0:	f47ff0ef          	jal	ra,1006 <main>
    10c4:	58d000ef          	jal	ra,1e50 <exit>
    return 0;
}
    10c8:	60a2                	ld	ra,8(sp)
    10ca:	4501                	li	a0,0
    10cc:	0141                	addi	sp,sp,16
    10ce:	8082                	ret

00000000000010d0 <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    10d0:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    10d2:	00f10593          	addi	a1,sp,15
    10d6:	4605                	li	a2,1
    10d8:	4501                	li	a0,0
{
    10da:	ec06                	sd	ra,24(sp)
    char byte = 0;
    10dc:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    10e0:	539000ef          	jal	ra,1e18 <read>
    return byte;
}
    10e4:	60e2                	ld	ra,24(sp)
    10e6:	00f14503          	lbu	a0,15(sp)
    10ea:	6105                	addi	sp,sp,32
    10ec:	8082                	ret

00000000000010ee <putchar>:

int putchar(int c)
{
    10ee:	1101                	addi	sp,sp,-32
    10f0:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    10f2:	00f10593          	addi	a1,sp,15
    10f6:	4605                	li	a2,1
    10f8:	4505                	li	a0,1
{
    10fa:	ec06                	sd	ra,24(sp)
    char byte = c;
    10fc:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1100:	523000ef          	jal	ra,1e22 <write>
}
    1104:	60e2                	ld	ra,24(sp)
    1106:	2501                	sext.w	a0,a0
    1108:	6105                	addi	sp,sp,32
    110a:	8082                	ret

000000000000110c <puts>:

int puts(const char *s)
{
    110c:	1101                	addi	sp,sp,-32
    110e:	e822                	sd	s0,16(sp)
    1110:	ec06                	sd	ra,24(sp)
    1112:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    1114:	145000ef          	jal	ra,1a58 <strlen>
    1118:	862a                	mv	a2,a0
    111a:	85a2                	mv	a1,s0
    111c:	4505                	li	a0,1
    111e:	505000ef          	jal	ra,1e22 <write>
    1122:	00055763          	bgez	a0,1130 <puts+0x24>
    return r;
}
    1126:	60e2                	ld	ra,24(sp)
    1128:	6442                	ld	s0,16(sp)
    112a:	557d                	li	a0,-1
    112c:	6105                	addi	sp,sp,32
    112e:	8082                	ret
    return write(stdout, &byte, 1);
    1130:	00f10593          	addi	a1,sp,15
    char byte = c;
    1134:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    1136:	4605                	li	a2,1
    1138:	4505                	li	a0,1
    char byte = c;
    113a:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    113e:	4e5000ef          	jal	ra,1e22 <write>
}
    1142:	60e2                	ld	ra,24(sp)
    1144:	6442                	ld	s0,16(sp)
    1146:	41f5551b          	sraiw	a0,a0,0x1f
    114a:	6105                	addi	sp,sp,32
    114c:	8082                	ret

000000000000114e <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    114e:	7131                	addi	sp,sp,-192
    1150:	ecce                	sd	s3,88(sp)
    1152:	e8d2                	sd	s4,80(sp)
    1154:	e4d6                	sd	s5,72(sp)
    1156:	e0da                	sd	s6,64(sp)
    1158:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    115a:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    115c:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    115e:	6ae1                	lui	s5,0x18
    1160:	000f4a37          	lui	s4,0xf4
    1164:	00989b37          	lui	s6,0x989
{
    1168:	fc86                	sd	ra,120(sp)
    116a:	f8a2                	sd	s0,112(sp)
    116c:	f4a6                	sd	s1,104(sp)
    116e:	f0ca                	sd	s2,96(sp)
    1170:	fc5e                	sd	s7,56(sp)
    1172:	e52e                	sd	a1,136(sp)
    1174:	e932                	sd	a2,144(sp)
    1176:	ed36                	sd	a3,152(sp)
    1178:	f13a                	sd	a4,160(sp)
    117a:	f942                	sd	a6,176(sp)
    117c:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    117e:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    1180:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x6e7>
    1184:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x16677>
    1188:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf2217>
    118c:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x987657>
    for (;;)
    {
        if (!*s)
    1190:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    1194:	02500913          	li	s2,37
        if (!*s)
    1198:	1a078f63          	beqz	a5,1356 <printf+0x208>
    119c:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    119e:	17278e63          	beq	a5,s2,131a <printf+0x1cc>
    11a2:	00164783          	lbu	a5,1(a2)
    11a6:	0605                	addi	a2,a2,1
    11a8:	fbfd                	bnez	a5,119e <printf+0x50>
    11aa:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    11ac:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    11b0:	85aa                	mv	a1,a0
    11b2:	8622                	mv	a2,s0
    11b4:	4505                	li	a0,1
    11b6:	46d000ef          	jal	ra,1e22 <write>
        out(f, a, l);
        if (l)
    11ba:	18041963          	bnez	s0,134c <printf+0x1fe>
            continue;
        if (s[1] == 0)
    11be:	0014c783          	lbu	a5,1(s1)
    11c2:	18078a63          	beqz	a5,1356 <printf+0x208>
            break;
        switch (s[1])
    11c6:	07300713          	li	a4,115
    11ca:	28e78e63          	beq	a5,a4,1466 <printf+0x318>
    11ce:	18f76f63          	bltu	a4,a5,136c <printf+0x21e>
    11d2:	06400713          	li	a4,100
    11d6:	2ae78c63          	beq	a5,a4,148e <printf+0x340>
    11da:	07000713          	li	a4,112
    11de:	3ce79c63          	bne	a5,a4,15b6 <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    11e2:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    11e4:	00001797          	auipc	a5,0x1
    11e8:	e4478793          	addi	a5,a5,-444 # 2028 <digits>
            printptr(va_arg(ap, uint64));
    11ec:	6298                	ld	a4,0(a3)
    11ee:	00868093          	addi	ra,a3,8
    11f2:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    11f4:	00471293          	slli	t0,a4,0x4
    11f8:	00c71f13          	slli	t5,a4,0xc
    11fc:	01471e13          	slli	t3,a4,0x14
    1200:	01c71893          	slli	a7,a4,0x1c
    1204:	02471813          	slli	a6,a4,0x24
    1208:	02871513          	slli	a0,a4,0x28
    120c:	02c71593          	slli	a1,a4,0x2c
    1210:	03071693          	slli	a3,a4,0x30
    1214:	00871f93          	slli	t6,a4,0x8
    1218:	01071e93          	slli	t4,a4,0x10
    121c:	01871313          	slli	t1,a4,0x18
    1220:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1224:	03c2d293          	srli	t0,t0,0x3c
    1228:	03cf5f13          	srli	t5,t5,0x3c
    122c:	03ce5e13          	srli	t3,t3,0x3c
    1230:	03c8d893          	srli	a7,a7,0x3c
    1234:	03c85813          	srli	a6,a6,0x3c
    1238:	9171                	srli	a0,a0,0x3c
    123a:	91f1                	srli	a1,a1,0x3c
    123c:	92f1                	srli	a3,a3,0x3c
    123e:	92be                	add	t0,t0,a5
    1240:	9f3e                	add	t5,t5,a5
    1242:	9e3e                	add	t3,t3,a5
    1244:	98be                	add	a7,a7,a5
    1246:	983e                	add	a6,a6,a5
    1248:	953e                	add	a0,a0,a5
    124a:	95be                	add	a1,a1,a5
    124c:	96be                	add	a3,a3,a5
    124e:	03c75393          	srli	t2,a4,0x3c
    1252:	01c75b9b          	srliw	s7,a4,0x1c
    1256:	03cfdf93          	srli	t6,t6,0x3c
    125a:	03cede93          	srli	t4,t4,0x3c
    125e:	03c35313          	srli	t1,t1,0x3c
    1262:	9271                	srli	a2,a2,0x3c
    1264:	0002c403          	lbu	s0,0(t0)
    1268:	93be                	add	t2,t2,a5
    126a:	000f4283          	lbu	t0,0(t5)
    126e:	9fbe                	add	t6,t6,a5
    1270:	000e4f03          	lbu	t5,0(t3)
    1274:	9ebe                	add	t4,t4,a5
    1276:	0008ce03          	lbu	t3,0(a7)
    127a:	933e                	add	t1,t1,a5
    127c:	00084883          	lbu	a7,0(a6)
    1280:	9bbe                	add	s7,s7,a5
    1282:	00054803          	lbu	a6,0(a0)
    1286:	963e                	add	a2,a2,a5
    1288:	0005c503          	lbu	a0,0(a1)
    128c:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1290:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1294:	0003c903          	lbu	s2,0(t2)
    1298:	00064603          	lbu	a2,0(a2)
    129c:	000fc383          	lbu	t2,0(t6)
    12a0:	8b3d                	andi	a4,a4,15
    12a2:	000ecf83          	lbu	t6,0(t4)
    12a6:	92f1                	srli	a3,a3,0x3c
    12a8:	00034e83          	lbu	t4,0(t1)
    12ac:	000bc303          	lbu	t1,0(s7)
    12b0:	96be                	add	a3,a3,a5
    12b2:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    12b4:	7761                	lui	a4,0xffff8
    12b6:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12ba:	00710623          	sb	t2,12(sp)
    12be:	005106a3          	sb	t0,13(sp)
    12c2:	01f10723          	sb	t6,14(sp)
    12c6:	01e107a3          	sb	t5,15(sp)
    12ca:	01d10823          	sb	t4,16(sp)
    12ce:	01c108a3          	sb	t3,17(sp)
    12d2:	00610923          	sb	t1,18(sp)
    12d6:	011109a3          	sb	a7,19(sp)
    12da:	01010a23          	sb	a6,20(sp)
    12de:	00a10aa3          	sb	a0,21(sp)
    12e2:	00b10b23          	sb	a1,22(sp)
    12e6:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    12ea:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12ee:	01210523          	sb	s2,10(sp)
    12f2:	008105a3          	sb	s0,11(sp)
    12f6:	0006c703          	lbu	a4,0(a3)
    12fa:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    12fe:	4649                	li	a2,18
    1300:	002c                	addi	a1,sp,8
    1302:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1304:	00e10c23          	sb	a4,24(sp)
    1308:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    130c:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1310:	313000ef          	jal	ra,1e22 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1314:	00248513          	addi	a0,s1,2
    1318:	bda5                	j	1190 <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    131a:	00064783          	lbu	a5,0(a2)
    131e:	84b2                	mv	s1,a2
    1320:	01278963          	beq	a5,s2,1332 <printf+0x1e4>
    1324:	b561                	j	11ac <printf+0x5e>
    1326:	0024c783          	lbu	a5,2(s1)
    132a:	0605                	addi	a2,a2,1
    132c:	0489                	addi	s1,s1,2
    132e:	e7279fe3          	bne	a5,s2,11ac <printf+0x5e>
    1332:	0014c783          	lbu	a5,1(s1)
    1336:	ff2788e3          	beq	a5,s2,1326 <printf+0x1d8>
        l = z - a;
    133a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    133e:	85aa                	mv	a1,a0
    1340:	8622                	mv	a2,s0
    1342:	4505                	li	a0,1
    1344:	2df000ef          	jal	ra,1e22 <write>
        if (l)
    1348:	e6040be3          	beqz	s0,11be <printf+0x70>
    134c:	8526                	mv	a0,s1
        if (!*s)
    134e:	00054783          	lbu	a5,0(a0)
    1352:	e40795e3          	bnez	a5,119c <printf+0x4e>
    }
    va_end(ap);
    1356:	70e6                	ld	ra,120(sp)
    1358:	7446                	ld	s0,112(sp)
    135a:	74a6                	ld	s1,104(sp)
    135c:	7906                	ld	s2,96(sp)
    135e:	69e6                	ld	s3,88(sp)
    1360:	6a46                	ld	s4,80(sp)
    1362:	6aa6                	ld	s5,72(sp)
    1364:	6b06                	ld	s6,64(sp)
    1366:	7be2                	ld	s7,56(sp)
    1368:	6129                	addi	sp,sp,192
    136a:	8082                	ret
        switch (s[1])
    136c:	07800713          	li	a4,120
    1370:	24e79363          	bne	a5,a4,15b6 <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    1374:	6782                	ld	a5,0(sp)
    1376:	4394                	lw	a3,0(a5)
    1378:	07a1                	addi	a5,a5,8
    137a:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    137c:	2606c263          	bltz	a3,15e0 <printf+0x492>
        buf[i--] = digits[x % base];
    1380:	00001797          	auipc	a5,0x1
    1384:	ca878793          	addi	a5,a5,-856 # 2028 <digits>
    1388:	00f6f713          	andi	a4,a3,15
    138c:	973e                	add	a4,a4,a5
    138e:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff5fd8>
    buf[16] = 0;
    1392:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1396:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    1398:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    139c:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    13a0:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    13a4:	0046d51b          	srliw	a0,a3,0x4
    13a8:	0ad5d563          	bge	a1,a3,1452 <printf+0x304>
        buf[i--] = digits[x % base];
    13ac:	8a3d                	andi	a2,a2,15
    13ae:	963e                	add	a2,a2,a5
    13b0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    13b4:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    13b8:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    13bc:	30a5fe63          	bgeu	a1,a0,16d8 <printf+0x58a>
        buf[i--] = digits[x % base];
    13c0:	00f77613          	andi	a2,a4,15
    13c4:	963e                	add	a2,a2,a5
    13c6:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13ca:	45bd                	li	a1,15
    13cc:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    13d0:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    13d4:	00475513          	srli	a0,a4,0x4
    13d8:	30e5f963          	bgeu	a1,a4,16ea <printf+0x59c>
        buf[i--] = digits[x % base];
    13dc:	8a3d                	andi	a2,a2,15
    13de:	963e                	add	a2,a2,a5
    13e0:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    13e4:	00875893          	srli	a7,a4,0x8
    13e8:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    13ec:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    13f0:	30a5fd63          	bgeu	a1,a0,170a <printf+0x5bc>
        buf[i--] = digits[x % base];
    13f4:	8a3d                	andi	a2,a2,15
    13f6:	963e                	add	a2,a2,a5
    13f8:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13fc:	00c75813          	srli	a6,a4,0xc
    1400:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    1404:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    1408:	3315fe63          	bgeu	a1,a7,1744 <printf+0x5f6>
        buf[i--] = digits[x % base];
    140c:	8a3d                	andi	a2,a2,15
    140e:	963e                	add	a2,a2,a5
    1410:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1414:	01075893          	srli	a7,a4,0x10
    1418:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    141c:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    1420:	3305ff63          	bgeu	a1,a6,175e <printf+0x610>
        buf[i--] = digits[x % base];
    1424:	8a3d                	andi	a2,a2,15
    1426:	963e                	add	a2,a2,a5
    1428:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    142c:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    1430:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1434:	3515f863          	bgeu	a1,a7,1784 <printf+0x636>
        buf[i--] = digits[x % base];
    1438:	97ba                	add	a5,a5,a4
    143a:	0007c783          	lbu	a5,0(a5)
    143e:	45a1                	li	a1,8
    1440:	00f10823          	sb	a5,16(sp)
    if (sign)
    1444:	0006d763          	bgez	a3,1452 <printf+0x304>
        buf[i--] = '-';
    1448:	02d00793          	li	a5,45
    144c:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1450:	459d                	li	a1,7
    write(f, s, l);
    1452:	4641                	li	a2,16
    1454:	003c                	addi	a5,sp,8
    1456:	9e0d                	subw	a2,a2,a1
    1458:	4505                	li	a0,1
    145a:	95be                	add	a1,a1,a5
    145c:	1c7000ef          	jal	ra,1e22 <write>
        s += 2;
    1460:	00248513          	addi	a0,s1,2
    1464:	b335                	j	1190 <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    1466:	6782                	ld	a5,0(sp)
    1468:	6380                	ld	s0,0(a5)
    146a:	07a1                	addi	a5,a5,8
    146c:	e03e                	sd	a5,0(sp)
    146e:	22040a63          	beqz	s0,16a2 <printf+0x554>
            l = strnlen(a, 200);
    1472:	0c800593          	li	a1,200
    1476:	8522                	mv	a0,s0
    1478:	6cc000ef          	jal	ra,1b44 <strnlen>
    write(f, s, l);
    147c:	0005061b          	sext.w	a2,a0
    1480:	85a2                	mv	a1,s0
    1482:	4505                	li	a0,1
    1484:	19f000ef          	jal	ra,1e22 <write>
        s += 2;
    1488:	00248513          	addi	a0,s1,2
    148c:	b311                	j	1190 <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    148e:	6782                	ld	a5,0(sp)
    1490:	4390                	lw	a2,0(a5)
    1492:	07a1                	addi	a5,a5,8
    1494:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1496:	1a064363          	bltz	a2,163c <printf+0x4ee>
        buf[i--] = digits[x % base];
    149a:	46a9                	li	a3,10
    149c:	02d6773b          	remuw	a4,a2,a3
    14a0:	00001797          	auipc	a5,0x1
    14a4:	b8878793          	addi	a5,a5,-1144 # 2028 <digits>
    buf[16] = 0;
    14a8:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    14ac:	4525                	li	a0,9
        x = xx;
    14ae:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    14b2:	973e                	add	a4,a4,a5
    14b4:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    14b8:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    14bc:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    14c0:	2cc55063          	bge	a0,a2,1780 <printf+0x632>
    14c4:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    14c8:	02d5f73b          	remuw	a4,a1,a3
    14cc:	1702                	slli	a4,a4,0x20
    14ce:	9301                	srli	a4,a4,0x20
    14d0:	973e                	add	a4,a4,a5
    14d2:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    14d6:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    14da:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    14de:	1f057d63          	bgeu	a0,a6,16d8 <printf+0x58a>
        buf[i--] = digits[x % base];
    14e2:	4529                	li	a0,10
    } while ((x /= base) != 0);
    14e4:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    14e6:	02a5f73b          	remuw	a4,a1,a0
    14ea:	973e                	add	a4,a4,a5
    14ec:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    14f0:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    14f4:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    14f8:	1ab6f163          	bgeu	a3,a1,169a <printf+0x54c>
    14fc:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    1500:	02a776bb          	remuw	a3,a4,a0
    1504:	96be                	add	a3,a3,a5
    1506:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    150a:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    150e:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1512:	20b87c63          	bgeu	a6,a1,172a <printf+0x5dc>
    1516:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    151a:	02a776bb          	remuw	a3,a4,a0
    151e:	96be                	add	a3,a3,a5
    1520:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1524:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1528:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    152c:	20b87363          	bgeu	a6,a1,1732 <printf+0x5e4>
        buf[i--] = digits[x % base];
    1530:	02a776bb          	remuw	a3,a4,a0
    1534:	96be                	add	a3,a3,a5
    1536:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    153a:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    153e:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1542:	20b9f563          	bgeu	s3,a1,174c <printf+0x5fe>
        buf[i--] = digits[x % base];
    1546:	02a776bb          	remuw	a3,a4,a0
    154a:	96be                	add	a3,a3,a5
    154c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1550:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1554:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1558:	20bafb63          	bgeu	s5,a1,176e <printf+0x620>
        buf[i--] = digits[x % base];
    155c:	02a776bb          	remuw	a3,a4,a0
    1560:	96be                	add	a3,a3,a5
    1562:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1566:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    156a:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    156e:	1eba7c63          	bgeu	s4,a1,1766 <printf+0x618>
        buf[i--] = digits[x % base];
    1572:	02a776bb          	remuw	a3,a4,a0
    1576:	96be                	add	a3,a3,a5
    1578:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    157c:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1580:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1584:	14bb7163          	bgeu	s6,a1,16c6 <printf+0x578>
        buf[i--] = digits[x % base];
    1588:	1702                	slli	a4,a4,0x20
    158a:	9301                	srli	a4,a4,0x20
    158c:	97ba                	add	a5,a5,a4
    158e:	0007c783          	lbu	a5,0(a5)
    1592:	4599                	li	a1,6
    1594:	00f10723          	sb	a5,14(sp)
    if (sign)
    1598:	ea065de3          	bgez	a2,1452 <printf+0x304>
        buf[i--] = '-';
    159c:	02d00793          	li	a5,45
    15a0:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    15a4:	4595                	li	a1,5
    write(f, s, l);
    15a6:	003c                	addi	a5,sp,8
    15a8:	4641                	li	a2,16
    15aa:	9e0d                	subw	a2,a2,a1
    15ac:	4505                	li	a0,1
    15ae:	95be                	add	a1,a1,a5
    15b0:	073000ef          	jal	ra,1e22 <write>
    15b4:	b575                	j	1460 <printf+0x312>
    char byte = c;
    15b6:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    15ba:	4605                	li	a2,1
    15bc:	002c                	addi	a1,sp,8
    15be:	4505                	li	a0,1
    char byte = c;
    15c0:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15c4:	05f000ef          	jal	ra,1e22 <write>
    char byte = c;
    15c8:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15cc:	4605                	li	a2,1
    15ce:	002c                	addi	a1,sp,8
    15d0:	4505                	li	a0,1
    char byte = c;
    15d2:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15d6:	04d000ef          	jal	ra,1e22 <write>
        s += 2;
    15da:	00248513          	addi	a0,s1,2
    15de:	be4d                	j	1190 <printf+0x42>
        x = -xx;
    15e0:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    15e4:	00001797          	auipc	a5,0x1
    15e8:	a4478793          	addi	a5,a5,-1468 # 2028 <digits>
    15ec:	00f77613          	andi	a2,a4,15
    15f0:	963e                	add	a2,a2,a5
    15f2:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    15f6:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    15fa:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    15fc:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1600:	0047551b          	srliw	a0,a4,0x4
    1604:	0047561b          	srliw	a2,a4,0x4
    1608:	0ab6d263          	bge	a3,a1,16ac <printf+0x55e>
        buf[i--] = digits[x % base];
    160c:	8a3d                	andi	a2,a2,15
    160e:	963e                	add	a2,a2,a5
    1610:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    1614:	463d                	li	a2,15
    1616:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    161a:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    161e:	daa661e3          	bltu	a2,a0,13c0 <printf+0x272>
        buf[i--] = '-';
    1622:	02d00793          	li	a5,45
    1626:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    162a:	45b5                	li	a1,13
    write(f, s, l);
    162c:	003c                	addi	a5,sp,8
    162e:	4641                	li	a2,16
    1630:	9e0d                	subw	a2,a2,a1
    1632:	4505                	li	a0,1
    1634:	95be                	add	a1,a1,a5
    1636:	7ec000ef          	jal	ra,1e22 <write>
    163a:	b51d                	j	1460 <printf+0x312>
        x = -xx;
    163c:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    1640:	46a9                	li	a3,10
    1642:	02d875bb          	remuw	a1,a6,a3
    1646:	00001797          	auipc	a5,0x1
    164a:	9e278793          	addi	a5,a5,-1566 # 2028 <digits>
    buf[16] = 0;
    164e:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1652:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    1654:	95be                	add	a1,a1,a5
    1656:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    165a:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    165e:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    1662:	04a65563          	bge	a2,a0,16ac <printf+0x55e>
    1666:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    166a:	02d775bb          	remuw	a1,a4,a3
    166e:	95be                	add	a1,a1,a5
    1670:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    1674:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    1678:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    167c:	fb0573e3          	bgeu	a0,a6,1622 <printf+0x4d4>
        buf[i--] = digits[x % base];
    1680:	4529                	li	a0,10
    } while ((x /= base) != 0);
    1682:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1684:	02a5f73b          	remuw	a4,a1,a0
    1688:	973e                	add	a4,a4,a5
    168a:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    168e:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    1692:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    1696:	e6b6e3e3          	bltu	a3,a1,14fc <printf+0x3ae>
        buf[i--] = digits[x % base];
    169a:	45b5                	li	a1,13
    if (sign)
    169c:	da065be3          	bgez	a2,1452 <printf+0x304>
    16a0:	a881                	j	16f0 <printf+0x5a2>
                a = "(null)";
    16a2:	00001417          	auipc	s0,0x1
    16a6:	96640413          	addi	s0,s0,-1690 # 2008 <unlink+0x40>
    16aa:	b3e1                	j	1472 <printf+0x324>
        buf[i--] = '-';
    16ac:	02d00793          	li	a5,45
    16b0:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    16b4:	45b9                	li	a1,14
    write(f, s, l);
    16b6:	003c                	addi	a5,sp,8
    16b8:	4641                	li	a2,16
    16ba:	9e0d                	subw	a2,a2,a1
    16bc:	4505                	li	a0,1
    16be:	95be                	add	a1,a1,a5
    16c0:	762000ef          	jal	ra,1e22 <write>
    16c4:	bb71                	j	1460 <printf+0x312>
        buf[i--] = digits[x % base];
    16c6:	459d                	li	a1,7
    if (sign)
    16c8:	d80655e3          	bgez	a2,1452 <printf+0x304>
        buf[i--] = '-';
    16cc:	02d00793          	li	a5,45
    16d0:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    16d4:	4599                	li	a1,6
    16d6:	bbb5                	j	1452 <printf+0x304>
    16d8:	45b9                	li	a1,14
    write(f, s, l);
    16da:	003c                	addi	a5,sp,8
    16dc:	4641                	li	a2,16
    16de:	9e0d                	subw	a2,a2,a1
    16e0:	4505                	li	a0,1
    16e2:	95be                	add	a1,a1,a5
    16e4:	73e000ef          	jal	ra,1e22 <write>
    16e8:	bba5                	j	1460 <printf+0x312>
        buf[i--] = digits[x % base];
    16ea:	45b5                	li	a1,13
    if (sign)
    16ec:	d606d3e3          	bgez	a3,1452 <printf+0x304>
        buf[i--] = '-';
    16f0:	02d00793          	li	a5,45
    16f4:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    16f8:	45b1                	li	a1,12
    write(f, s, l);
    16fa:	003c                	addi	a5,sp,8
    16fc:	4641                	li	a2,16
    16fe:	9e0d                	subw	a2,a2,a1
    1700:	4505                	li	a0,1
    1702:	95be                	add	a1,a1,a5
    1704:	71e000ef          	jal	ra,1e22 <write>
    1708:	bba1                	j	1460 <printf+0x312>
        buf[i--] = digits[x % base];
    170a:	45b1                	li	a1,12
    if (sign)
    170c:	d406d3e3          	bgez	a3,1452 <printf+0x304>
        buf[i--] = '-';
    1710:	02d00793          	li	a5,45
    1714:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1718:	45ad                	li	a1,11
    write(f, s, l);
    171a:	003c                	addi	a5,sp,8
    171c:	4641                	li	a2,16
    171e:	9e0d                	subw	a2,a2,a1
    1720:	4505                	li	a0,1
    1722:	95be                	add	a1,a1,a5
    1724:	6fe000ef          	jal	ra,1e22 <write>
    1728:	bb25                	j	1460 <printf+0x312>
        buf[i--] = digits[x % base];
    172a:	45b1                	li	a1,12
    if (sign)
    172c:	d20653e3          	bgez	a2,1452 <printf+0x304>
    1730:	b7c5                	j	1710 <printf+0x5c2>
        buf[i--] = digits[x % base];
    1732:	45ad                	li	a1,11
    if (sign)
    1734:	d0065fe3          	bgez	a2,1452 <printf+0x304>
        buf[i--] = '-';
    1738:	02d00793          	li	a5,45
    173c:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1740:	45a9                	li	a1,10
    1742:	bb01                	j	1452 <printf+0x304>
    1744:	45ad                	li	a1,11
    if (sign)
    1746:	d006d6e3          	bgez	a3,1452 <printf+0x304>
    174a:	b7fd                	j	1738 <printf+0x5ea>
        buf[i--] = digits[x % base];
    174c:	45a9                	li	a1,10
    if (sign)
    174e:	d00652e3          	bgez	a2,1452 <printf+0x304>
        buf[i--] = '-';
    1752:	02d00793          	li	a5,45
    1756:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    175a:	45a5                	li	a1,9
    175c:	b9dd                	j	1452 <printf+0x304>
    175e:	45a9                	li	a1,10
    if (sign)
    1760:	ce06d9e3          	bgez	a3,1452 <printf+0x304>
    1764:	b7fd                	j	1752 <printf+0x604>
        buf[i--] = digits[x % base];
    1766:	45a1                	li	a1,8
    if (sign)
    1768:	ce0655e3          	bgez	a2,1452 <printf+0x304>
    176c:	b9f1                	j	1448 <printf+0x2fa>
        buf[i--] = digits[x % base];
    176e:	45a5                	li	a1,9
    if (sign)
    1770:	ce0651e3          	bgez	a2,1452 <printf+0x304>
        buf[i--] = '-';
    1774:	02d00793          	li	a5,45
    1778:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    177c:	45a1                	li	a1,8
    177e:	b9d1                	j	1452 <printf+0x304>
    i = 15;
    1780:	45bd                	li	a1,15
    1782:	b9c1                	j	1452 <printf+0x304>
        buf[i--] = digits[x % base];
    1784:	45a5                	li	a1,9
    if (sign)
    1786:	cc06d6e3          	bgez	a3,1452 <printf+0x304>
    178a:	b7ed                	j	1774 <printf+0x626>

000000000000178c <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    178c:	02000793          	li	a5,32
    1790:	00f50663          	beq	a0,a5,179c <isspace+0x10>
    1794:	355d                	addiw	a0,a0,-9
    1796:	00553513          	sltiu	a0,a0,5
    179a:	8082                	ret
    179c:	4505                	li	a0,1
}
    179e:	8082                	ret

00000000000017a0 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    17a0:	fd05051b          	addiw	a0,a0,-48
}
    17a4:	00a53513          	sltiu	a0,a0,10
    17a8:	8082                	ret

00000000000017aa <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    17aa:	02000613          	li	a2,32
    17ae:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    17b0:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    17b4:	ff77069b          	addiw	a3,a4,-9
    17b8:	04c70d63          	beq	a4,a2,1812 <atoi+0x68>
    17bc:	0007079b          	sext.w	a5,a4
    17c0:	04d5f963          	bgeu	a1,a3,1812 <atoi+0x68>
        s++;
    switch (*s)
    17c4:	02b00693          	li	a3,43
    17c8:	04d70a63          	beq	a4,a3,181c <atoi+0x72>
    17cc:	02d00693          	li	a3,45
    17d0:	06d70463          	beq	a4,a3,1838 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    17d4:	fd07859b          	addiw	a1,a5,-48
    17d8:	4625                	li	a2,9
    17da:	873e                	mv	a4,a5
    17dc:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    17de:	4e01                	li	t3,0
    while (isdigit(*s))
    17e0:	04b66a63          	bltu	a2,a1,1834 <atoi+0x8a>
    int n = 0, neg = 0;
    17e4:	4501                	li	a0,0
    while (isdigit(*s))
    17e6:	4825                	li	a6,9
    17e8:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    17ec:	0025179b          	slliw	a5,a0,0x2
    17f0:	9d3d                	addw	a0,a0,a5
    17f2:	fd07031b          	addiw	t1,a4,-48
    17f6:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    17fa:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    17fe:	0685                	addi	a3,a3,1
    1800:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1804:	0006071b          	sext.w	a4,a2
    1808:	feb870e3          	bgeu	a6,a1,17e8 <atoi+0x3e>
    return neg ? n : -n;
    180c:	000e0563          	beqz	t3,1816 <atoi+0x6c>
}
    1810:	8082                	ret
        s++;
    1812:	0505                	addi	a0,a0,1
    1814:	bf71                	j	17b0 <atoi+0x6>
    1816:	4113053b          	subw	a0,t1,a7
    181a:	8082                	ret
    while (isdigit(*s))
    181c:	00154783          	lbu	a5,1(a0)
    1820:	4625                	li	a2,9
        s++;
    1822:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1826:	fd07859b          	addiw	a1,a5,-48
    182a:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    182e:	4e01                	li	t3,0
    while (isdigit(*s))
    1830:	fab67ae3          	bgeu	a2,a1,17e4 <atoi+0x3a>
    1834:	4501                	li	a0,0
}
    1836:	8082                	ret
    while (isdigit(*s))
    1838:	00154783          	lbu	a5,1(a0)
    183c:	4625                	li	a2,9
        s++;
    183e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1842:	fd07859b          	addiw	a1,a5,-48
    1846:	0007871b          	sext.w	a4,a5
    184a:	feb665e3          	bltu	a2,a1,1834 <atoi+0x8a>
        neg = 1;
    184e:	4e05                	li	t3,1
    1850:	bf51                	j	17e4 <atoi+0x3a>

0000000000001852 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1852:	16060d63          	beqz	a2,19cc <memset+0x17a>
    1856:	40a007b3          	neg	a5,a0
    185a:	8b9d                	andi	a5,a5,7
    185c:	00778713          	addi	a4,a5,7
    1860:	482d                	li	a6,11
    1862:	0ff5f593          	andi	a1,a1,255
    1866:	fff60693          	addi	a3,a2,-1
    186a:	17076263          	bltu	a4,a6,19ce <memset+0x17c>
    186e:	16e6ea63          	bltu	a3,a4,19e2 <memset+0x190>
    1872:	16078563          	beqz	a5,19dc <memset+0x18a>
    1876:	00b50023          	sb	a1,0(a0)
    187a:	4705                	li	a4,1
    187c:	00150e93          	addi	t4,a0,1
    1880:	14e78c63          	beq	a5,a4,19d8 <memset+0x186>
    1884:	00b500a3          	sb	a1,1(a0)
    1888:	4709                	li	a4,2
    188a:	00250e93          	addi	t4,a0,2
    188e:	14e78d63          	beq	a5,a4,19e8 <memset+0x196>
    1892:	00b50123          	sb	a1,2(a0)
    1896:	470d                	li	a4,3
    1898:	00350e93          	addi	t4,a0,3
    189c:	12e78b63          	beq	a5,a4,19d2 <memset+0x180>
    18a0:	00b501a3          	sb	a1,3(a0)
    18a4:	4711                	li	a4,4
    18a6:	00450e93          	addi	t4,a0,4
    18aa:	14e78163          	beq	a5,a4,19ec <memset+0x19a>
    18ae:	00b50223          	sb	a1,4(a0)
    18b2:	4715                	li	a4,5
    18b4:	00550e93          	addi	t4,a0,5
    18b8:	12e78c63          	beq	a5,a4,19f0 <memset+0x19e>
    18bc:	00b502a3          	sb	a1,5(a0)
    18c0:	471d                	li	a4,7
    18c2:	00650e93          	addi	t4,a0,6
    18c6:	12e79763          	bne	a5,a4,19f4 <memset+0x1a2>
    18ca:	00750e93          	addi	t4,a0,7
    18ce:	00b50323          	sb	a1,6(a0)
    18d2:	4f1d                	li	t5,7
    18d4:	00859713          	slli	a4,a1,0x8
    18d8:	8f4d                	or	a4,a4,a1
    18da:	01059e13          	slli	t3,a1,0x10
    18de:	01c76e33          	or	t3,a4,t3
    18e2:	01859313          	slli	t1,a1,0x18
    18e6:	006e6333          	or	t1,t3,t1
    18ea:	02059893          	slli	a7,a1,0x20
    18ee:	011368b3          	or	a7,t1,a7
    18f2:	02859813          	slli	a6,a1,0x28
    18f6:	40f60333          	sub	t1,a2,a5
    18fa:	0108e833          	or	a6,a7,a6
    18fe:	03059693          	slli	a3,a1,0x30
    1902:	00d866b3          	or	a3,a6,a3
    1906:	03859713          	slli	a4,a1,0x38
    190a:	97aa                	add	a5,a5,a0
    190c:	ff837813          	andi	a6,t1,-8
    1910:	8f55                	or	a4,a4,a3
    1912:	00f806b3          	add	a3,a6,a5
    1916:	e398                	sd	a4,0(a5)
    1918:	07a1                	addi	a5,a5,8
    191a:	fed79ee3          	bne	a5,a3,1916 <memset+0xc4>
    191e:	ff837693          	andi	a3,t1,-8
    1922:	00de87b3          	add	a5,t4,a3
    1926:	01e6873b          	addw	a4,a3,t5
    192a:	0ad30663          	beq	t1,a3,19d6 <memset+0x184>
    192e:	00b78023          	sb	a1,0(a5)
    1932:	0017069b          	addiw	a3,a4,1
    1936:	08c6fb63          	bgeu	a3,a2,19cc <memset+0x17a>
    193a:	00b780a3          	sb	a1,1(a5)
    193e:	0027069b          	addiw	a3,a4,2
    1942:	08c6f563          	bgeu	a3,a2,19cc <memset+0x17a>
    1946:	00b78123          	sb	a1,2(a5)
    194a:	0037069b          	addiw	a3,a4,3
    194e:	06c6ff63          	bgeu	a3,a2,19cc <memset+0x17a>
    1952:	00b781a3          	sb	a1,3(a5)
    1956:	0047069b          	addiw	a3,a4,4
    195a:	06c6f963          	bgeu	a3,a2,19cc <memset+0x17a>
    195e:	00b78223          	sb	a1,4(a5)
    1962:	0057069b          	addiw	a3,a4,5
    1966:	06c6f363          	bgeu	a3,a2,19cc <memset+0x17a>
    196a:	00b782a3          	sb	a1,5(a5)
    196e:	0067069b          	addiw	a3,a4,6
    1972:	04c6fd63          	bgeu	a3,a2,19cc <memset+0x17a>
    1976:	00b78323          	sb	a1,6(a5)
    197a:	0077069b          	addiw	a3,a4,7
    197e:	04c6f763          	bgeu	a3,a2,19cc <memset+0x17a>
    1982:	00b783a3          	sb	a1,7(a5)
    1986:	0087069b          	addiw	a3,a4,8
    198a:	04c6f163          	bgeu	a3,a2,19cc <memset+0x17a>
    198e:	00b78423          	sb	a1,8(a5)
    1992:	0097069b          	addiw	a3,a4,9
    1996:	02c6fb63          	bgeu	a3,a2,19cc <memset+0x17a>
    199a:	00b784a3          	sb	a1,9(a5)
    199e:	00a7069b          	addiw	a3,a4,10
    19a2:	02c6f563          	bgeu	a3,a2,19cc <memset+0x17a>
    19a6:	00b78523          	sb	a1,10(a5)
    19aa:	00b7069b          	addiw	a3,a4,11
    19ae:	00c6ff63          	bgeu	a3,a2,19cc <memset+0x17a>
    19b2:	00b785a3          	sb	a1,11(a5)
    19b6:	00c7069b          	addiw	a3,a4,12
    19ba:	00c6f963          	bgeu	a3,a2,19cc <memset+0x17a>
    19be:	00b78623          	sb	a1,12(a5)
    19c2:	2735                	addiw	a4,a4,13
    19c4:	00c77463          	bgeu	a4,a2,19cc <memset+0x17a>
    19c8:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    19cc:	8082                	ret
    19ce:	472d                	li	a4,11
    19d0:	bd79                	j	186e <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    19d2:	4f0d                	li	t5,3
    19d4:	b701                	j	18d4 <memset+0x82>
    19d6:	8082                	ret
    19d8:	4f05                	li	t5,1
    19da:	bded                	j	18d4 <memset+0x82>
    19dc:	8eaa                	mv	t4,a0
    19de:	4f01                	li	t5,0
    19e0:	bdd5                	j	18d4 <memset+0x82>
    19e2:	87aa                	mv	a5,a0
    19e4:	4701                	li	a4,0
    19e6:	b7a1                	j	192e <memset+0xdc>
    19e8:	4f09                	li	t5,2
    19ea:	b5ed                	j	18d4 <memset+0x82>
    19ec:	4f11                	li	t5,4
    19ee:	b5dd                	j	18d4 <memset+0x82>
    19f0:	4f15                	li	t5,5
    19f2:	b5cd                	j	18d4 <memset+0x82>
    19f4:	4f19                	li	t5,6
    19f6:	bdf9                	j	18d4 <memset+0x82>

00000000000019f8 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    19f8:	00054783          	lbu	a5,0(a0)
    19fc:	0005c703          	lbu	a4,0(a1)
    1a00:	00e79863          	bne	a5,a4,1a10 <strcmp+0x18>
    1a04:	0505                	addi	a0,a0,1
    1a06:	0585                	addi	a1,a1,1
    1a08:	fbe5                	bnez	a5,19f8 <strcmp>
    1a0a:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1a0c:	9d19                	subw	a0,a0,a4
    1a0e:	8082                	ret
    1a10:	0007851b          	sext.w	a0,a5
    1a14:	bfe5                	j	1a0c <strcmp+0x14>

0000000000001a16 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1a16:	ce05                	beqz	a2,1a4e <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1a18:	00054703          	lbu	a4,0(a0)
    1a1c:	0005c783          	lbu	a5,0(a1)
    1a20:	cb0d                	beqz	a4,1a52 <strncmp+0x3c>
    if (!n--)
    1a22:	167d                	addi	a2,a2,-1
    1a24:	00c506b3          	add	a3,a0,a2
    1a28:	a819                	j	1a3e <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1a2a:	00a68e63          	beq	a3,a0,1a46 <strncmp+0x30>
    1a2e:	0505                	addi	a0,a0,1
    1a30:	00e79b63          	bne	a5,a4,1a46 <strncmp+0x30>
    1a34:	00054703          	lbu	a4,0(a0)
    1a38:	0005c783          	lbu	a5,0(a1)
    1a3c:	cb19                	beqz	a4,1a52 <strncmp+0x3c>
    1a3e:	0005c783          	lbu	a5,0(a1)
    1a42:	0585                	addi	a1,a1,1
    1a44:	f3fd                	bnez	a5,1a2a <strncmp+0x14>
        ;
    return *l - *r;
    1a46:	0007051b          	sext.w	a0,a4
    1a4a:	9d1d                	subw	a0,a0,a5
    1a4c:	8082                	ret
        return 0;
    1a4e:	4501                	li	a0,0
}
    1a50:	8082                	ret
    1a52:	4501                	li	a0,0
    return *l - *r;
    1a54:	9d1d                	subw	a0,a0,a5
    1a56:	8082                	ret

0000000000001a58 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1a58:	00757793          	andi	a5,a0,7
    1a5c:	cf89                	beqz	a5,1a76 <strlen+0x1e>
    1a5e:	87aa                	mv	a5,a0
    1a60:	a029                	j	1a6a <strlen+0x12>
    1a62:	0785                	addi	a5,a5,1
    1a64:	0077f713          	andi	a4,a5,7
    1a68:	cb01                	beqz	a4,1a78 <strlen+0x20>
        if (!*s)
    1a6a:	0007c703          	lbu	a4,0(a5)
    1a6e:	fb75                	bnez	a4,1a62 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1a70:	40a78533          	sub	a0,a5,a0
}
    1a74:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1a76:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1a78:	6394                	ld	a3,0(a5)
    1a7a:	00000597          	auipc	a1,0x0
    1a7e:	5965b583          	ld	a1,1430(a1) # 2010 <unlink+0x48>
    1a82:	00000617          	auipc	a2,0x0
    1a86:	59663603          	ld	a2,1430(a2) # 2018 <unlink+0x50>
    1a8a:	a019                	j	1a90 <strlen+0x38>
    1a8c:	6794                	ld	a3,8(a5)
    1a8e:	07a1                	addi	a5,a5,8
    1a90:	00b68733          	add	a4,a3,a1
    1a94:	fff6c693          	not	a3,a3
    1a98:	8f75                	and	a4,a4,a3
    1a9a:	8f71                	and	a4,a4,a2
    1a9c:	db65                	beqz	a4,1a8c <strlen+0x34>
    for (; *s; s++)
    1a9e:	0007c703          	lbu	a4,0(a5)
    1aa2:	d779                	beqz	a4,1a70 <strlen+0x18>
    1aa4:	0017c703          	lbu	a4,1(a5)
    1aa8:	0785                	addi	a5,a5,1
    1aaa:	d379                	beqz	a4,1a70 <strlen+0x18>
    1aac:	0017c703          	lbu	a4,1(a5)
    1ab0:	0785                	addi	a5,a5,1
    1ab2:	fb6d                	bnez	a4,1aa4 <strlen+0x4c>
    1ab4:	bf75                	j	1a70 <strlen+0x18>

0000000000001ab6 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1ab6:	00757713          	andi	a4,a0,7
{
    1aba:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1abc:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1ac0:	cb19                	beqz	a4,1ad6 <memchr+0x20>
    1ac2:	ce25                	beqz	a2,1b3a <memchr+0x84>
    1ac4:	0007c703          	lbu	a4,0(a5)
    1ac8:	04b70e63          	beq	a4,a1,1b24 <memchr+0x6e>
    1acc:	0785                	addi	a5,a5,1
    1ace:	0077f713          	andi	a4,a5,7
    1ad2:	167d                	addi	a2,a2,-1
    1ad4:	f77d                	bnez	a4,1ac2 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1ad6:	4501                	li	a0,0
    if (n && *s != c)
    1ad8:	c235                	beqz	a2,1b3c <memchr+0x86>
    1ada:	0007c703          	lbu	a4,0(a5)
    1ade:	04b70363          	beq	a4,a1,1b24 <memchr+0x6e>
        size_t k = ONES * c;
    1ae2:	00000517          	auipc	a0,0x0
    1ae6:	53e53503          	ld	a0,1342(a0) # 2020 <unlink+0x58>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1aea:	471d                	li	a4,7
        size_t k = ONES * c;
    1aec:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1af0:	02c77a63          	bgeu	a4,a2,1b24 <memchr+0x6e>
    1af4:	00000897          	auipc	a7,0x0
    1af8:	51c8b883          	ld	a7,1308(a7) # 2010 <unlink+0x48>
    1afc:	00000817          	auipc	a6,0x0
    1b00:	51c83803          	ld	a6,1308(a6) # 2018 <unlink+0x50>
    1b04:	431d                	li	t1,7
    1b06:	a029                	j	1b10 <memchr+0x5a>
    1b08:	1661                	addi	a2,a2,-8
    1b0a:	07a1                	addi	a5,a5,8
    1b0c:	02c37963          	bgeu	t1,a2,1b3e <memchr+0x88>
    1b10:	6398                	ld	a4,0(a5)
    1b12:	8f29                	xor	a4,a4,a0
    1b14:	011706b3          	add	a3,a4,a7
    1b18:	fff74713          	not	a4,a4
    1b1c:	8f75                	and	a4,a4,a3
    1b1e:	01077733          	and	a4,a4,a6
    1b22:	d37d                	beqz	a4,1b08 <memchr+0x52>
    1b24:	853e                	mv	a0,a5
    1b26:	97b2                	add	a5,a5,a2
    1b28:	a021                	j	1b30 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1b2a:	0505                	addi	a0,a0,1
    1b2c:	00f50763          	beq	a0,a5,1b3a <memchr+0x84>
    1b30:	00054703          	lbu	a4,0(a0)
    1b34:	feb71be3          	bne	a4,a1,1b2a <memchr+0x74>
    1b38:	8082                	ret
    return n ? (void *)s : 0;
    1b3a:	4501                	li	a0,0
}
    1b3c:	8082                	ret
    return n ? (void *)s : 0;
    1b3e:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1b40:	f275                	bnez	a2,1b24 <memchr+0x6e>
}
    1b42:	8082                	ret

0000000000001b44 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1b44:	1101                	addi	sp,sp,-32
    1b46:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1b48:	862e                	mv	a2,a1
{
    1b4a:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1b4c:	4581                	li	a1,0
{
    1b4e:	e426                	sd	s1,8(sp)
    1b50:	ec06                	sd	ra,24(sp)
    1b52:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1b54:	f63ff0ef          	jal	ra,1ab6 <memchr>
    return p ? p - s : n;
    1b58:	c519                	beqz	a0,1b66 <strnlen+0x22>
}
    1b5a:	60e2                	ld	ra,24(sp)
    1b5c:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1b5e:	8d05                	sub	a0,a0,s1
}
    1b60:	64a2                	ld	s1,8(sp)
    1b62:	6105                	addi	sp,sp,32
    1b64:	8082                	ret
    1b66:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1b68:	8522                	mv	a0,s0
}
    1b6a:	6442                	ld	s0,16(sp)
    1b6c:	64a2                	ld	s1,8(sp)
    1b6e:	6105                	addi	sp,sp,32
    1b70:	8082                	ret

0000000000001b72 <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1b72:	00b547b3          	xor	a5,a0,a1
    1b76:	8b9d                	andi	a5,a5,7
    1b78:	eb95                	bnez	a5,1bac <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1b7a:	0075f793          	andi	a5,a1,7
    1b7e:	e7b1                	bnez	a5,1bca <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1b80:	6198                	ld	a4,0(a1)
    1b82:	00000617          	auipc	a2,0x0
    1b86:	48e63603          	ld	a2,1166(a2) # 2010 <unlink+0x48>
    1b8a:	00000817          	auipc	a6,0x0
    1b8e:	48e83803          	ld	a6,1166(a6) # 2018 <unlink+0x50>
    1b92:	a029                	j	1b9c <stpcpy+0x2a>
    1b94:	e118                	sd	a4,0(a0)
    1b96:	6598                	ld	a4,8(a1)
    1b98:	05a1                	addi	a1,a1,8
    1b9a:	0521                	addi	a0,a0,8
    1b9c:	00c707b3          	add	a5,a4,a2
    1ba0:	fff74693          	not	a3,a4
    1ba4:	8ff5                	and	a5,a5,a3
    1ba6:	0107f7b3          	and	a5,a5,a6
    1baa:	d7ed                	beqz	a5,1b94 <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1bac:	0005c783          	lbu	a5,0(a1)
    1bb0:	00f50023          	sb	a5,0(a0)
    1bb4:	c785                	beqz	a5,1bdc <stpcpy+0x6a>
    1bb6:	0015c783          	lbu	a5,1(a1)
    1bba:	0505                	addi	a0,a0,1
    1bbc:	0585                	addi	a1,a1,1
    1bbe:	00f50023          	sb	a5,0(a0)
    1bc2:	fbf5                	bnez	a5,1bb6 <stpcpy+0x44>
        ;
    return d;
}
    1bc4:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1bc6:	0505                	addi	a0,a0,1
    1bc8:	df45                	beqz	a4,1b80 <stpcpy+0xe>
            if (!(*d = *s))
    1bca:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1bce:	0585                	addi	a1,a1,1
    1bd0:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1bd4:	00f50023          	sb	a5,0(a0)
    1bd8:	f7fd                	bnez	a5,1bc6 <stpcpy+0x54>
}
    1bda:	8082                	ret
    1bdc:	8082                	ret

0000000000001bde <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1bde:	00b547b3          	xor	a5,a0,a1
    1be2:	8b9d                	andi	a5,a5,7
    1be4:	1a079863          	bnez	a5,1d94 <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1be8:	0075f793          	andi	a5,a1,7
    1bec:	16078463          	beqz	a5,1d54 <stpncpy+0x176>
    1bf0:	ea01                	bnez	a2,1c00 <stpncpy+0x22>
    1bf2:	a421                	j	1dfa <stpncpy+0x21c>
    1bf4:	167d                	addi	a2,a2,-1
    1bf6:	0505                	addi	a0,a0,1
    1bf8:	14070e63          	beqz	a4,1d54 <stpncpy+0x176>
    1bfc:	1a060863          	beqz	a2,1dac <stpncpy+0x1ce>
    1c00:	0005c783          	lbu	a5,0(a1)
    1c04:	0585                	addi	a1,a1,1
    1c06:	0075f713          	andi	a4,a1,7
    1c0a:	00f50023          	sb	a5,0(a0)
    1c0e:	f3fd                	bnez	a5,1bf4 <stpncpy+0x16>
    1c10:	4805                	li	a6,1
    1c12:	1a061863          	bnez	a2,1dc2 <stpncpy+0x1e4>
    1c16:	40a007b3          	neg	a5,a0
    1c1a:	8b9d                	andi	a5,a5,7
    1c1c:	4681                	li	a3,0
    1c1e:	18061a63          	bnez	a2,1db2 <stpncpy+0x1d4>
    1c22:	00778713          	addi	a4,a5,7
    1c26:	45ad                	li	a1,11
    1c28:	18b76363          	bltu	a4,a1,1dae <stpncpy+0x1d0>
    1c2c:	1ae6eb63          	bltu	a3,a4,1de2 <stpncpy+0x204>
    1c30:	1a078363          	beqz	a5,1dd6 <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c34:	00050023          	sb	zero,0(a0)
    1c38:	4685                	li	a3,1
    1c3a:	00150713          	addi	a4,a0,1
    1c3e:	18d78f63          	beq	a5,a3,1ddc <stpncpy+0x1fe>
    1c42:	000500a3          	sb	zero,1(a0)
    1c46:	4689                	li	a3,2
    1c48:	00250713          	addi	a4,a0,2
    1c4c:	18d78e63          	beq	a5,a3,1de8 <stpncpy+0x20a>
    1c50:	00050123          	sb	zero,2(a0)
    1c54:	468d                	li	a3,3
    1c56:	00350713          	addi	a4,a0,3
    1c5a:	16d78c63          	beq	a5,a3,1dd2 <stpncpy+0x1f4>
    1c5e:	000501a3          	sb	zero,3(a0)
    1c62:	4691                	li	a3,4
    1c64:	00450713          	addi	a4,a0,4
    1c68:	18d78263          	beq	a5,a3,1dec <stpncpy+0x20e>
    1c6c:	00050223          	sb	zero,4(a0)
    1c70:	4695                	li	a3,5
    1c72:	00550713          	addi	a4,a0,5
    1c76:	16d78d63          	beq	a5,a3,1df0 <stpncpy+0x212>
    1c7a:	000502a3          	sb	zero,5(a0)
    1c7e:	469d                	li	a3,7
    1c80:	00650713          	addi	a4,a0,6
    1c84:	16d79863          	bne	a5,a3,1df4 <stpncpy+0x216>
    1c88:	00750713          	addi	a4,a0,7
    1c8c:	00050323          	sb	zero,6(a0)
    1c90:	40f80833          	sub	a6,a6,a5
    1c94:	ff887593          	andi	a1,a6,-8
    1c98:	97aa                	add	a5,a5,a0
    1c9a:	95be                	add	a1,a1,a5
    1c9c:	0007b023          	sd	zero,0(a5)
    1ca0:	07a1                	addi	a5,a5,8
    1ca2:	feb79de3          	bne	a5,a1,1c9c <stpncpy+0xbe>
    1ca6:	ff887593          	andi	a1,a6,-8
    1caa:	9ead                	addw	a3,a3,a1
    1cac:	00b707b3          	add	a5,a4,a1
    1cb0:	12b80863          	beq	a6,a1,1de0 <stpncpy+0x202>
    1cb4:	00078023          	sb	zero,0(a5)
    1cb8:	0016871b          	addiw	a4,a3,1
    1cbc:	0ec77863          	bgeu	a4,a2,1dac <stpncpy+0x1ce>
    1cc0:	000780a3          	sb	zero,1(a5)
    1cc4:	0026871b          	addiw	a4,a3,2
    1cc8:	0ec77263          	bgeu	a4,a2,1dac <stpncpy+0x1ce>
    1ccc:	00078123          	sb	zero,2(a5)
    1cd0:	0036871b          	addiw	a4,a3,3
    1cd4:	0cc77c63          	bgeu	a4,a2,1dac <stpncpy+0x1ce>
    1cd8:	000781a3          	sb	zero,3(a5)
    1cdc:	0046871b          	addiw	a4,a3,4
    1ce0:	0cc77663          	bgeu	a4,a2,1dac <stpncpy+0x1ce>
    1ce4:	00078223          	sb	zero,4(a5)
    1ce8:	0056871b          	addiw	a4,a3,5
    1cec:	0cc77063          	bgeu	a4,a2,1dac <stpncpy+0x1ce>
    1cf0:	000782a3          	sb	zero,5(a5)
    1cf4:	0066871b          	addiw	a4,a3,6
    1cf8:	0ac77a63          	bgeu	a4,a2,1dac <stpncpy+0x1ce>
    1cfc:	00078323          	sb	zero,6(a5)
    1d00:	0076871b          	addiw	a4,a3,7
    1d04:	0ac77463          	bgeu	a4,a2,1dac <stpncpy+0x1ce>
    1d08:	000783a3          	sb	zero,7(a5)
    1d0c:	0086871b          	addiw	a4,a3,8
    1d10:	08c77e63          	bgeu	a4,a2,1dac <stpncpy+0x1ce>
    1d14:	00078423          	sb	zero,8(a5)
    1d18:	0096871b          	addiw	a4,a3,9
    1d1c:	08c77863          	bgeu	a4,a2,1dac <stpncpy+0x1ce>
    1d20:	000784a3          	sb	zero,9(a5)
    1d24:	00a6871b          	addiw	a4,a3,10
    1d28:	08c77263          	bgeu	a4,a2,1dac <stpncpy+0x1ce>
    1d2c:	00078523          	sb	zero,10(a5)
    1d30:	00b6871b          	addiw	a4,a3,11
    1d34:	06c77c63          	bgeu	a4,a2,1dac <stpncpy+0x1ce>
    1d38:	000785a3          	sb	zero,11(a5)
    1d3c:	00c6871b          	addiw	a4,a3,12
    1d40:	06c77663          	bgeu	a4,a2,1dac <stpncpy+0x1ce>
    1d44:	00078623          	sb	zero,12(a5)
    1d48:	26b5                	addiw	a3,a3,13
    1d4a:	06c6f163          	bgeu	a3,a2,1dac <stpncpy+0x1ce>
    1d4e:	000786a3          	sb	zero,13(a5)
    1d52:	8082                	ret
            ;
        if (!n || !*s)
    1d54:	c645                	beqz	a2,1dfc <stpncpy+0x21e>
    1d56:	0005c783          	lbu	a5,0(a1)
    1d5a:	ea078be3          	beqz	a5,1c10 <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d5e:	479d                	li	a5,7
    1d60:	02c7ff63          	bgeu	a5,a2,1d9e <stpncpy+0x1c0>
    1d64:	00000897          	auipc	a7,0x0
    1d68:	2ac8b883          	ld	a7,684(a7) # 2010 <unlink+0x48>
    1d6c:	00000817          	auipc	a6,0x0
    1d70:	2ac83803          	ld	a6,684(a6) # 2018 <unlink+0x50>
    1d74:	431d                	li	t1,7
    1d76:	6198                	ld	a4,0(a1)
    1d78:	011707b3          	add	a5,a4,a7
    1d7c:	fff74693          	not	a3,a4
    1d80:	8ff5                	and	a5,a5,a3
    1d82:	0107f7b3          	and	a5,a5,a6
    1d86:	ef81                	bnez	a5,1d9e <stpncpy+0x1c0>
            *wd = *ws;
    1d88:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d8a:	1661                	addi	a2,a2,-8
    1d8c:	05a1                	addi	a1,a1,8
    1d8e:	0521                	addi	a0,a0,8
    1d90:	fec363e3          	bltu	t1,a2,1d76 <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1d94:	e609                	bnez	a2,1d9e <stpncpy+0x1c0>
    1d96:	a08d                	j	1df8 <stpncpy+0x21a>
    1d98:	167d                	addi	a2,a2,-1
    1d9a:	0505                	addi	a0,a0,1
    1d9c:	ca01                	beqz	a2,1dac <stpncpy+0x1ce>
    1d9e:	0005c783          	lbu	a5,0(a1)
    1da2:	0585                	addi	a1,a1,1
    1da4:	00f50023          	sb	a5,0(a0)
    1da8:	fbe5                	bnez	a5,1d98 <stpncpy+0x1ba>
        ;
tail:
    1daa:	b59d                	j	1c10 <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1dac:	8082                	ret
    1dae:	472d                	li	a4,11
    1db0:	bdb5                	j	1c2c <stpncpy+0x4e>
    1db2:	00778713          	addi	a4,a5,7
    1db6:	45ad                	li	a1,11
    1db8:	fff60693          	addi	a3,a2,-1
    1dbc:	e6b778e3          	bgeu	a4,a1,1c2c <stpncpy+0x4e>
    1dc0:	b7fd                	j	1dae <stpncpy+0x1d0>
    1dc2:	40a007b3          	neg	a5,a0
    1dc6:	8832                	mv	a6,a2
    1dc8:	8b9d                	andi	a5,a5,7
    1dca:	4681                	li	a3,0
    1dcc:	e4060be3          	beqz	a2,1c22 <stpncpy+0x44>
    1dd0:	b7cd                	j	1db2 <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1dd2:	468d                	li	a3,3
    1dd4:	bd75                	j	1c90 <stpncpy+0xb2>
    1dd6:	872a                	mv	a4,a0
    1dd8:	4681                	li	a3,0
    1dda:	bd5d                	j	1c90 <stpncpy+0xb2>
    1ddc:	4685                	li	a3,1
    1dde:	bd4d                	j	1c90 <stpncpy+0xb2>
    1de0:	8082                	ret
    1de2:	87aa                	mv	a5,a0
    1de4:	4681                	li	a3,0
    1de6:	b5f9                	j	1cb4 <stpncpy+0xd6>
    1de8:	4689                	li	a3,2
    1dea:	b55d                	j	1c90 <stpncpy+0xb2>
    1dec:	4691                	li	a3,4
    1dee:	b54d                	j	1c90 <stpncpy+0xb2>
    1df0:	4695                	li	a3,5
    1df2:	bd79                	j	1c90 <stpncpy+0xb2>
    1df4:	4699                	li	a3,6
    1df6:	bd69                	j	1c90 <stpncpy+0xb2>
    1df8:	8082                	ret
    1dfa:	8082                	ret
    1dfc:	8082                	ret

0000000000001dfe <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1dfe:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1e02:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e04:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1e08:	2501                	sext.w	a0,a0
    1e0a:	8082                	ret

0000000000001e0c <close>:
    register long a7 __asm__("a7") = n;
    1e0c:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1e10:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1e14:	2501                	sext.w	a0,a0
    1e16:	8082                	ret

0000000000001e18 <read>:
    register long a7 __asm__("a7") = n;
    1e18:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e1c:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1e20:	8082                	ret

0000000000001e22 <write>:
    register long a7 __asm__("a7") = n;
    1e22:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e26:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1e2a:	8082                	ret

0000000000001e2c <getpid>:
    register long a7 __asm__("a7") = n;
    1e2c:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1e30:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1e38:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1e3c:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <fork>:
    register long a7 __asm__("a7") = n;
    1e44:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1e48:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1e4c:	2501                	sext.w	a0,a0
    1e4e:	8082                	ret

0000000000001e50 <exit>:
    register long a7 __asm__("a7") = n;
    1e50:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e54:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e58:	8082                	ret

0000000000001e5a <waitpid>:
    register long a7 __asm__("a7") = n;
    1e5a:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5e:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1e62:	2501                	sext.w	a0,a0
    1e64:	8082                	ret

0000000000001e66 <exec>:
    register long a7 __asm__("a7") = n;
    1e66:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e6a:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e6e:	2501                	sext.w	a0,a0
    1e70:	8082                	ret

0000000000001e72 <get_time>:

int64 get_time()
{
    1e72:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e74:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e78:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e7a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e7c:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e80:	2501                	sext.w	a0,a0
    1e82:	ed09                	bnez	a0,1e9c <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e84:	67a2                	ld	a5,8(sp)
    1e86:	3e800713          	li	a4,1000
    1e8a:	00015503          	lhu	a0,0(sp)
    1e8e:	02e7d7b3          	divu	a5,a5,a4
    1e92:	02e50533          	mul	a0,a0,a4
    1e96:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e98:	0141                	addi	sp,sp,16
    1e9a:	8082                	ret
        return -1;
    1e9c:	557d                	li	a0,-1
    1e9e:	bfed                	j	1e98 <get_time+0x26>

0000000000001ea0 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1ea0:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea4:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	8082                	ret

0000000000001eac <sleep>:

int sleep(unsigned long long time)
{
    1eac:	1141                	addi	sp,sp,-16
    1eae:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1eb0:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1eb4:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1eb6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb8:	00000073          	ecall
    if (err == 0)
    1ebc:	2501                	sext.w	a0,a0
    1ebe:	e13d                	bnez	a0,1f24 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ec0:	6722                	ld	a4,8(sp)
    1ec2:	3e800693          	li	a3,1000
    1ec6:	00015783          	lhu	a5,0(sp)
    1eca:	02d75733          	divu	a4,a4,a3
    1ece:	02d787b3          	mul	a5,a5,a3
    1ed2:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1ed4:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ed8:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1eda:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1edc:	00000073          	ecall
    if (err == 0)
    1ee0:	2501                	sext.w	a0,a0
    1ee2:	ed15                	bnez	a0,1f1e <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ee4:	6841                	lui	a6,0x10
    1ee6:	963e                	add	a2,a2,a5
    1ee8:	187d                	addi	a6,a6,-1
    1eea:	3e800693          	li	a3,1000
    1eee:	a819                	j	1f04 <sleep+0x58>
    __asm_syscall("r"(a7))
    1ef0:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1ef4:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ef8:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1efa:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1efc:	00000073          	ecall
    if (err == 0)
    1f00:	2501                	sext.w	a0,a0
    1f02:	ed11                	bnez	a0,1f1e <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1f04:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1f06:	07c00893          	li	a7,124
    1f0a:	02d7d733          	divu	a4,a5,a3
    1f0e:	6782                	ld	a5,0(sp)
    1f10:	0107f7b3          	and	a5,a5,a6
    1f14:	02d787b3          	mul	a5,a5,a3
    1f18:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1f1a:	fcc7ebe3          	bltu	a5,a2,1ef0 <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1f1e:	4501                	li	a0,0
    1f20:	0141                	addi	sp,sp,16
    1f22:	8082                	ret
    1f24:	57fd                	li	a5,-1
    1f26:	b77d                	j	1ed4 <sleep+0x28>

0000000000001f28 <set_priority>:
    register long a7 __asm__("a7") = n;
    1f28:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1f2c:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1f30:	2501                	sext.w	a0,a0
    1f32:	8082                	ret

0000000000001f34 <mmap>:
    register long a7 __asm__("a7") = n;
    1f34:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f38:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1f3c:	2501                	sext.w	a0,a0
    1f3e:	8082                	ret

0000000000001f40 <munmap>:
    register long a7 __asm__("a7") = n;
    1f40:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f44:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1f48:	2501                	sext.w	a0,a0
    1f4a:	8082                	ret

0000000000001f4c <wait>:

int wait(int *code)
{
    1f4c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f4e:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1f52:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f54:	00000073          	ecall
    return waitpid(-1, code);
}
    1f58:	2501                	sext.w	a0,a0
    1f5a:	8082                	ret

0000000000001f5c <spawn>:
    register long a7 __asm__("a7") = n;
    1f5c:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1f60:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f64:	2501                	sext.w	a0,a0
    1f66:	8082                	ret

0000000000001f68 <mailread>:
    register long a7 __asm__("a7") = n;
    1f68:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f6c:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f70:	2501                	sext.w	a0,a0
    1f72:	8082                	ret

0000000000001f74 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f74:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f78:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f7c:	2501                	sext.w	a0,a0
    1f7e:	8082                	ret

0000000000001f80 <fstat>:
    register long a7 __asm__("a7") = n;
    1f80:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f84:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f88:	2501                	sext.w	a0,a0
    1f8a:	8082                	ret

0000000000001f8c <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1f8c:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f8e:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f92:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f94:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f98:	2501                	sext.w	a0,a0
    1f9a:	8082                	ret

0000000000001f9c <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f9c:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f9e:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1fa2:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fa4:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1fa8:	2501                	sext.w	a0,a0
    1faa:	8082                	ret

0000000000001fac <link>:

int link(char *old_path, char *new_path)
{
    1fac:	87aa                	mv	a5,a0
    1fae:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1fb0:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1fb4:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1fb8:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1fba:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1fbe:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fc0:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1fc4:	2501                	sext.w	a0,a0
    1fc6:	8082                	ret

0000000000001fc8 <unlink>:

int unlink(char *path)
{
    1fc8:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1fca:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1fce:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1fd2:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fd4:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1fd8:	2501                	sext.w	a0,a0
    1fda:	8082                	ret
