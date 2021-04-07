
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch7_file1:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0740006f          	j	1076 <__start_main>

0000000000001006 <main>:
#include <stddef.h>

/// 测试 fstat，输出　Test fstat OK! 就算正确。

int main()
{
    1006:	711d                	addi	sp,sp,-96
    char *fname = "fname1";
    int fd = open(fname, O_CREATE | O_WRONLY);
    1008:	20100593          	li	a1,513
    100c:	00001517          	auipc	a0,0x1
    1010:	f8c50513          	addi	a0,a0,-116 # 1f98 <unlink+0x16>
{
    1014:	e8a2                	sd	s0,80(sp)
    1016:	ec86                	sd	ra,88(sp)
    int fd = open(fname, O_CREATE | O_WRONLY);
    1018:	5a1000ef          	jal	ra,1db8 <open>
    101c:	842a                	mv	s0,a0
    assert(fd > 0);
    101e:	04a05863          	blez	a0,106e <main+0x68>
    Stat stat;
    int ret = fstat(fd, &stat);
    1022:	858a                	mv	a1,sp
    1024:	8522                	mv	a0,s0
    1026:	715000ef          	jal	ra,1f3a <fstat>
    assert(ret == 0);
    102a:	ed15                	bnez	a0,1066 <main+0x60>
    assert(stat.mode == FILE);
    102c:	4742                	lw	a4,16(sp)
    102e:	001007b7          	lui	a5,0x100
    1032:	00f70563          	beq	a4,a5,103c <main+0x36>
    1036:	557d                	li	a0,-1
    1038:	5d3000ef          	jal	ra,1e0a <exit>
    assert(stat.nlink == 1);
    103c:	4752                	lw	a4,20(sp)
    103e:	4785                	li	a5,1
    1040:	00f70563          	beq	a4,a5,104a <main+0x44>
    1044:	557d                	li	a0,-1
    1046:	5c5000ef          	jal	ra,1e0a <exit>
    close(fd);
    104a:	8522                	mv	a0,s0
    104c:	57b000ef          	jal	ra,1dc6 <close>
    // unlink(fname);
    // It's recommended to rebuild the disk image. This program will not clean the file "fname1".
    puts("Test fstat OK!");
    1050:	00001517          	auipc	a0,0x1
    1054:	f5050513          	addi	a0,a0,-176 # 1fa0 <unlink+0x1e>
    1058:	06e000ef          	jal	ra,10c6 <puts>
    return 0;
    105c:	60e6                	ld	ra,88(sp)
    105e:	6446                	ld	s0,80(sp)
    1060:	4501                	li	a0,0
    1062:	6125                	addi	sp,sp,96
    1064:	8082                	ret
    assert(ret == 0);
    1066:	557d                	li	a0,-1
    1068:	5a3000ef          	jal	ra,1e0a <exit>
    106c:	b7c1                	j	102c <main+0x26>
    assert(fd > 0);
    106e:	557d                	li	a0,-1
    1070:	59b000ef          	jal	ra,1e0a <exit>
    1074:	b77d                	j	1022 <main+0x1c>

0000000000001076 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1076:	1141                	addi	sp,sp,-16
    1078:	e406                	sd	ra,8(sp)
    exit(main());
    107a:	f8dff0ef          	jal	ra,1006 <main>
    107e:	58d000ef          	jal	ra,1e0a <exit>
    return 0;
}
    1082:	60a2                	ld	ra,8(sp)
    1084:	4501                	li	a0,0
    1086:	0141                	addi	sp,sp,16
    1088:	8082                	ret

000000000000108a <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    108a:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    108c:	00f10593          	addi	a1,sp,15
    1090:	4605                	li	a2,1
    1092:	4501                	li	a0,0
{
    1094:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1096:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    109a:	539000ef          	jal	ra,1dd2 <read>
    return byte;
}
    109e:	60e2                	ld	ra,24(sp)
    10a0:	00f14503          	lbu	a0,15(sp)
    10a4:	6105                	addi	sp,sp,32
    10a6:	8082                	ret

00000000000010a8 <putchar>:

int putchar(int c)
{
    10a8:	1101                	addi	sp,sp,-32
    10aa:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    10ac:	00f10593          	addi	a1,sp,15
    10b0:	4605                	li	a2,1
    10b2:	4505                	li	a0,1
{
    10b4:	ec06                	sd	ra,24(sp)
    char byte = c;
    10b6:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    10ba:	523000ef          	jal	ra,1ddc <write>
}
    10be:	60e2                	ld	ra,24(sp)
    10c0:	2501                	sext.w	a0,a0
    10c2:	6105                	addi	sp,sp,32
    10c4:	8082                	ret

00000000000010c6 <puts>:

int puts(const char *s)
{
    10c6:	1101                	addi	sp,sp,-32
    10c8:	e822                	sd	s0,16(sp)
    10ca:	ec06                	sd	ra,24(sp)
    10cc:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    10ce:	145000ef          	jal	ra,1a12 <strlen>
    10d2:	862a                	mv	a2,a0
    10d4:	85a2                	mv	a1,s0
    10d6:	4505                	li	a0,1
    10d8:	505000ef          	jal	ra,1ddc <write>
    10dc:	00055763          	bgez	a0,10ea <puts+0x24>
    return r;
}
    10e0:	60e2                	ld	ra,24(sp)
    10e2:	6442                	ld	s0,16(sp)
    10e4:	557d                	li	a0,-1
    10e6:	6105                	addi	sp,sp,32
    10e8:	8082                	ret
    return write(stdout, &byte, 1);
    10ea:	00f10593          	addi	a1,sp,15
    char byte = c;
    10ee:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    10f0:	4605                	li	a2,1
    10f2:	4505                	li	a0,1
    char byte = c;
    10f4:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    10f8:	4e5000ef          	jal	ra,1ddc <write>
}
    10fc:	60e2                	ld	ra,24(sp)
    10fe:	6442                	ld	s0,16(sp)
    1100:	41f5551b          	sraiw	a0,a0,0x1f
    1104:	6105                	addi	sp,sp,32
    1106:	8082                	ret

0000000000001108 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1108:	7131                	addi	sp,sp,-192
    110a:	ecce                	sd	s3,88(sp)
    110c:	e8d2                	sd	s4,80(sp)
    110e:	e4d6                	sd	s5,72(sp)
    1110:	e0da                	sd	s6,64(sp)
    1112:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    1114:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1116:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    1118:	6ae1                	lui	s5,0x18
    111a:	000f4a37          	lui	s4,0xf4
    111e:	00989b37          	lui	s6,0x989
{
    1122:	fc86                	sd	ra,120(sp)
    1124:	f8a2                	sd	s0,112(sp)
    1126:	f4a6                	sd	s1,104(sp)
    1128:	f0ca                	sd	s2,96(sp)
    112a:	fc5e                	sd	s7,56(sp)
    112c:	e52e                	sd	a1,136(sp)
    112e:	e932                	sd	a2,144(sp)
    1130:	ed36                	sd	a3,152(sp)
    1132:	f13a                	sd	a4,160(sp)
    1134:	f942                	sd	a6,176(sp)
    1136:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1138:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    113a:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x73f>
    113e:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x166cf>
    1142:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf226f>
    1146:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x9876af>
    for (;;)
    {
        if (!*s)
    114a:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    114e:	02500913          	li	s2,37
        if (!*s)
    1152:	1a078f63          	beqz	a5,1310 <printf+0x208>
    1156:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1158:	17278e63          	beq	a5,s2,12d4 <printf+0x1cc>
    115c:	00164783          	lbu	a5,1(a2)
    1160:	0605                	addi	a2,a2,1
    1162:	fbfd                	bnez	a5,1158 <printf+0x50>
    1164:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    1166:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    116a:	85aa                	mv	a1,a0
    116c:	8622                	mv	a2,s0
    116e:	4505                	li	a0,1
    1170:	46d000ef          	jal	ra,1ddc <write>
        out(f, a, l);
        if (l)
    1174:	18041963          	bnez	s0,1306 <printf+0x1fe>
            continue;
        if (s[1] == 0)
    1178:	0014c783          	lbu	a5,1(s1)
    117c:	18078a63          	beqz	a5,1310 <printf+0x208>
            break;
        switch (s[1])
    1180:	07300713          	li	a4,115
    1184:	28e78e63          	beq	a5,a4,1420 <printf+0x318>
    1188:	18f76f63          	bltu	a4,a5,1326 <printf+0x21e>
    118c:	06400713          	li	a4,100
    1190:	2ae78c63          	beq	a5,a4,1448 <printf+0x340>
    1194:	07000713          	li	a4,112
    1198:	3ce79c63          	bne	a5,a4,1570 <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    119c:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    119e:	00001797          	auipc	a5,0x1
    11a2:	e3278793          	addi	a5,a5,-462 # 1fd0 <digits>
            printptr(va_arg(ap, uint64));
    11a6:	6298                	ld	a4,0(a3)
    11a8:	00868093          	addi	ra,a3,8
    11ac:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    11ae:	00471293          	slli	t0,a4,0x4
    11b2:	00c71f13          	slli	t5,a4,0xc
    11b6:	01471e13          	slli	t3,a4,0x14
    11ba:	01c71893          	slli	a7,a4,0x1c
    11be:	02471813          	slli	a6,a4,0x24
    11c2:	02871513          	slli	a0,a4,0x28
    11c6:	02c71593          	slli	a1,a4,0x2c
    11ca:	03071693          	slli	a3,a4,0x30
    11ce:	00871f93          	slli	t6,a4,0x8
    11d2:	01071e93          	slli	t4,a4,0x10
    11d6:	01871313          	slli	t1,a4,0x18
    11da:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    11de:	03c2d293          	srli	t0,t0,0x3c
    11e2:	03cf5f13          	srli	t5,t5,0x3c
    11e6:	03ce5e13          	srli	t3,t3,0x3c
    11ea:	03c8d893          	srli	a7,a7,0x3c
    11ee:	03c85813          	srli	a6,a6,0x3c
    11f2:	9171                	srli	a0,a0,0x3c
    11f4:	91f1                	srli	a1,a1,0x3c
    11f6:	92f1                	srli	a3,a3,0x3c
    11f8:	92be                	add	t0,t0,a5
    11fa:	9f3e                	add	t5,t5,a5
    11fc:	9e3e                	add	t3,t3,a5
    11fe:	98be                	add	a7,a7,a5
    1200:	983e                	add	a6,a6,a5
    1202:	953e                	add	a0,a0,a5
    1204:	95be                	add	a1,a1,a5
    1206:	96be                	add	a3,a3,a5
    1208:	03c75393          	srli	t2,a4,0x3c
    120c:	01c75b9b          	srliw	s7,a4,0x1c
    1210:	03cfdf93          	srli	t6,t6,0x3c
    1214:	03cede93          	srli	t4,t4,0x3c
    1218:	03c35313          	srli	t1,t1,0x3c
    121c:	9271                	srli	a2,a2,0x3c
    121e:	0002c403          	lbu	s0,0(t0)
    1222:	93be                	add	t2,t2,a5
    1224:	000f4283          	lbu	t0,0(t5)
    1228:	9fbe                	add	t6,t6,a5
    122a:	000e4f03          	lbu	t5,0(t3)
    122e:	9ebe                	add	t4,t4,a5
    1230:	0008ce03          	lbu	t3,0(a7)
    1234:	933e                	add	t1,t1,a5
    1236:	00084883          	lbu	a7,0(a6)
    123a:	9bbe                	add	s7,s7,a5
    123c:	00054803          	lbu	a6,0(a0)
    1240:	963e                	add	a2,a2,a5
    1242:	0005c503          	lbu	a0,0(a1)
    1246:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    124a:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    124e:	0003c903          	lbu	s2,0(t2)
    1252:	00064603          	lbu	a2,0(a2)
    1256:	000fc383          	lbu	t2,0(t6)
    125a:	8b3d                	andi	a4,a4,15
    125c:	000ecf83          	lbu	t6,0(t4)
    1260:	92f1                	srli	a3,a3,0x3c
    1262:	00034e83          	lbu	t4,0(t1)
    1266:	000bc303          	lbu	t1,0(s7)
    126a:	96be                	add	a3,a3,a5
    126c:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    126e:	7761                	lui	a4,0xffff8
    1270:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1274:	00710623          	sb	t2,12(sp)
    1278:	005106a3          	sb	t0,13(sp)
    127c:	01f10723          	sb	t6,14(sp)
    1280:	01e107a3          	sb	t5,15(sp)
    1284:	01d10823          	sb	t4,16(sp)
    1288:	01c108a3          	sb	t3,17(sp)
    128c:	00610923          	sb	t1,18(sp)
    1290:	011109a3          	sb	a7,19(sp)
    1294:	01010a23          	sb	a6,20(sp)
    1298:	00a10aa3          	sb	a0,21(sp)
    129c:	00b10b23          	sb	a1,22(sp)
    12a0:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    12a4:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12a8:	01210523          	sb	s2,10(sp)
    12ac:	008105a3          	sb	s0,11(sp)
    12b0:	0006c703          	lbu	a4,0(a3)
    12b4:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    12b8:	4649                	li	a2,18
    12ba:	002c                	addi	a1,sp,8
    12bc:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12be:	00e10c23          	sb	a4,24(sp)
    12c2:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    12c6:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    12ca:	313000ef          	jal	ra,1ddc <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    12ce:	00248513          	addi	a0,s1,2
    12d2:	bda5                	j	114a <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    12d4:	00064783          	lbu	a5,0(a2)
    12d8:	84b2                	mv	s1,a2
    12da:	01278963          	beq	a5,s2,12ec <printf+0x1e4>
    12de:	b561                	j	1166 <printf+0x5e>
    12e0:	0024c783          	lbu	a5,2(s1)
    12e4:	0605                	addi	a2,a2,1
    12e6:	0489                	addi	s1,s1,2
    12e8:	e7279fe3          	bne	a5,s2,1166 <printf+0x5e>
    12ec:	0014c783          	lbu	a5,1(s1)
    12f0:	ff2788e3          	beq	a5,s2,12e0 <printf+0x1d8>
        l = z - a;
    12f4:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    12f8:	85aa                	mv	a1,a0
    12fa:	8622                	mv	a2,s0
    12fc:	4505                	li	a0,1
    12fe:	2df000ef          	jal	ra,1ddc <write>
        if (l)
    1302:	e6040be3          	beqz	s0,1178 <printf+0x70>
    1306:	8526                	mv	a0,s1
        if (!*s)
    1308:	00054783          	lbu	a5,0(a0)
    130c:	e40795e3          	bnez	a5,1156 <printf+0x4e>
    }
    va_end(ap);
    1310:	70e6                	ld	ra,120(sp)
    1312:	7446                	ld	s0,112(sp)
    1314:	74a6                	ld	s1,104(sp)
    1316:	7906                	ld	s2,96(sp)
    1318:	69e6                	ld	s3,88(sp)
    131a:	6a46                	ld	s4,80(sp)
    131c:	6aa6                	ld	s5,72(sp)
    131e:	6b06                	ld	s6,64(sp)
    1320:	7be2                	ld	s7,56(sp)
    1322:	6129                	addi	sp,sp,192
    1324:	8082                	ret
        switch (s[1])
    1326:	07800713          	li	a4,120
    132a:	24e79363          	bne	a5,a4,1570 <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    132e:	6782                	ld	a5,0(sp)
    1330:	4394                	lw	a3,0(a5)
    1332:	07a1                	addi	a5,a5,8
    1334:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1336:	2606c263          	bltz	a3,159a <printf+0x492>
        buf[i--] = digits[x % base];
    133a:	00001797          	auipc	a5,0x1
    133e:	c9678793          	addi	a5,a5,-874 # 1fd0 <digits>
    1342:	00f6f713          	andi	a4,a3,15
    1346:	973e                	add	a4,a4,a5
    1348:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff6030>
    buf[16] = 0;
    134c:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1350:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    1352:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1356:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    135a:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    135e:	0046d51b          	srliw	a0,a3,0x4
    1362:	0ad5d563          	bge	a1,a3,140c <printf+0x304>
        buf[i--] = digits[x % base];
    1366:	8a3d                	andi	a2,a2,15
    1368:	963e                	add	a2,a2,a5
    136a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    136e:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    1372:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1376:	30a5fe63          	bgeu	a1,a0,1692 <printf+0x58a>
        buf[i--] = digits[x % base];
    137a:	00f77613          	andi	a2,a4,15
    137e:	963e                	add	a2,a2,a5
    1380:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1384:	45bd                	li	a1,15
    1386:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    138a:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    138e:	00475513          	srli	a0,a4,0x4
    1392:	30e5f963          	bgeu	a1,a4,16a4 <printf+0x59c>
        buf[i--] = digits[x % base];
    1396:	8a3d                	andi	a2,a2,15
    1398:	963e                	add	a2,a2,a5
    139a:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    139e:	00875893          	srli	a7,a4,0x8
    13a2:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    13a6:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    13aa:	30a5fd63          	bgeu	a1,a0,16c4 <printf+0x5bc>
        buf[i--] = digits[x % base];
    13ae:	8a3d                	andi	a2,a2,15
    13b0:	963e                	add	a2,a2,a5
    13b2:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13b6:	00c75813          	srli	a6,a4,0xc
    13ba:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    13be:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    13c2:	3315fe63          	bgeu	a1,a7,16fe <printf+0x5f6>
        buf[i--] = digits[x % base];
    13c6:	8a3d                	andi	a2,a2,15
    13c8:	963e                	add	a2,a2,a5
    13ca:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13ce:	01075893          	srli	a7,a4,0x10
    13d2:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    13d6:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    13da:	3305ff63          	bgeu	a1,a6,1718 <printf+0x610>
        buf[i--] = digits[x % base];
    13de:	8a3d                	andi	a2,a2,15
    13e0:	963e                	add	a2,a2,a5
    13e2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    13e6:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    13ea:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    13ee:	3515f863          	bgeu	a1,a7,173e <printf+0x636>
        buf[i--] = digits[x % base];
    13f2:	97ba                	add	a5,a5,a4
    13f4:	0007c783          	lbu	a5,0(a5)
    13f8:	45a1                	li	a1,8
    13fa:	00f10823          	sb	a5,16(sp)
    if (sign)
    13fe:	0006d763          	bgez	a3,140c <printf+0x304>
        buf[i--] = '-';
    1402:	02d00793          	li	a5,45
    1406:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    140a:	459d                	li	a1,7
    write(f, s, l);
    140c:	4641                	li	a2,16
    140e:	003c                	addi	a5,sp,8
    1410:	9e0d                	subw	a2,a2,a1
    1412:	4505                	li	a0,1
    1414:	95be                	add	a1,a1,a5
    1416:	1c7000ef          	jal	ra,1ddc <write>
        s += 2;
    141a:	00248513          	addi	a0,s1,2
    141e:	b335                	j	114a <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    1420:	6782                	ld	a5,0(sp)
    1422:	6380                	ld	s0,0(a5)
    1424:	07a1                	addi	a5,a5,8
    1426:	e03e                	sd	a5,0(sp)
    1428:	22040a63          	beqz	s0,165c <printf+0x554>
            l = strnlen(a, 200);
    142c:	0c800593          	li	a1,200
    1430:	8522                	mv	a0,s0
    1432:	6cc000ef          	jal	ra,1afe <strnlen>
    write(f, s, l);
    1436:	0005061b          	sext.w	a2,a0
    143a:	85a2                	mv	a1,s0
    143c:	4505                	li	a0,1
    143e:	19f000ef          	jal	ra,1ddc <write>
        s += 2;
    1442:	00248513          	addi	a0,s1,2
    1446:	b311                	j	114a <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    1448:	6782                	ld	a5,0(sp)
    144a:	4390                	lw	a2,0(a5)
    144c:	07a1                	addi	a5,a5,8
    144e:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1450:	1a064363          	bltz	a2,15f6 <printf+0x4ee>
        buf[i--] = digits[x % base];
    1454:	46a9                	li	a3,10
    1456:	02d6773b          	remuw	a4,a2,a3
    145a:	00001797          	auipc	a5,0x1
    145e:	b7678793          	addi	a5,a5,-1162 # 1fd0 <digits>
    buf[16] = 0;
    1462:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1466:	4525                	li	a0,9
        x = xx;
    1468:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    146c:	973e                	add	a4,a4,a5
    146e:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    1472:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    1476:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    147a:	2cc55063          	bge	a0,a2,173a <printf+0x632>
    147e:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1482:	02d5f73b          	remuw	a4,a1,a3
    1486:	1702                	slli	a4,a4,0x20
    1488:	9301                	srli	a4,a4,0x20
    148a:	973e                	add	a4,a4,a5
    148c:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    1490:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    1494:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    1498:	1f057d63          	bgeu	a0,a6,1692 <printf+0x58a>
        buf[i--] = digits[x % base];
    149c:	4529                	li	a0,10
    } while ((x /= base) != 0);
    149e:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    14a0:	02a5f73b          	remuw	a4,a1,a0
    14a4:	973e                	add	a4,a4,a5
    14a6:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    14aa:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    14ae:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    14b2:	1ab6f163          	bgeu	a3,a1,1654 <printf+0x54c>
    14b6:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    14ba:	02a776bb          	remuw	a3,a4,a0
    14be:	96be                	add	a3,a3,a5
    14c0:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14c4:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14c8:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    14cc:	20b87c63          	bgeu	a6,a1,16e4 <printf+0x5dc>
    14d0:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    14d4:	02a776bb          	remuw	a3,a4,a0
    14d8:	96be                	add	a3,a3,a5
    14da:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14de:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14e2:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    14e6:	20b87363          	bgeu	a6,a1,16ec <printf+0x5e4>
        buf[i--] = digits[x % base];
    14ea:	02a776bb          	remuw	a3,a4,a0
    14ee:	96be                	add	a3,a3,a5
    14f0:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14f4:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14f8:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    14fc:	20b9f563          	bgeu	s3,a1,1706 <printf+0x5fe>
        buf[i--] = digits[x % base];
    1500:	02a776bb          	remuw	a3,a4,a0
    1504:	96be                	add	a3,a3,a5
    1506:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    150a:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    150e:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1512:	20bafb63          	bgeu	s5,a1,1728 <printf+0x620>
        buf[i--] = digits[x % base];
    1516:	02a776bb          	remuw	a3,a4,a0
    151a:	96be                	add	a3,a3,a5
    151c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1520:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1524:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1528:	1eba7c63          	bgeu	s4,a1,1720 <printf+0x618>
        buf[i--] = digits[x % base];
    152c:	02a776bb          	remuw	a3,a4,a0
    1530:	96be                	add	a3,a3,a5
    1532:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1536:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    153a:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    153e:	14bb7163          	bgeu	s6,a1,1680 <printf+0x578>
        buf[i--] = digits[x % base];
    1542:	1702                	slli	a4,a4,0x20
    1544:	9301                	srli	a4,a4,0x20
    1546:	97ba                	add	a5,a5,a4
    1548:	0007c783          	lbu	a5,0(a5)
    154c:	4599                	li	a1,6
    154e:	00f10723          	sb	a5,14(sp)
    if (sign)
    1552:	ea065de3          	bgez	a2,140c <printf+0x304>
        buf[i--] = '-';
    1556:	02d00793          	li	a5,45
    155a:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    155e:	4595                	li	a1,5
    write(f, s, l);
    1560:	003c                	addi	a5,sp,8
    1562:	4641                	li	a2,16
    1564:	9e0d                	subw	a2,a2,a1
    1566:	4505                	li	a0,1
    1568:	95be                	add	a1,a1,a5
    156a:	073000ef          	jal	ra,1ddc <write>
    156e:	b575                	j	141a <printf+0x312>
    char byte = c;
    1570:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1574:	4605                	li	a2,1
    1576:	002c                	addi	a1,sp,8
    1578:	4505                	li	a0,1
    char byte = c;
    157a:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    157e:	05f000ef          	jal	ra,1ddc <write>
    char byte = c;
    1582:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1586:	4605                	li	a2,1
    1588:	002c                	addi	a1,sp,8
    158a:	4505                	li	a0,1
    char byte = c;
    158c:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1590:	04d000ef          	jal	ra,1ddc <write>
        s += 2;
    1594:	00248513          	addi	a0,s1,2
    1598:	be4d                	j	114a <printf+0x42>
        x = -xx;
    159a:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    159e:	00001797          	auipc	a5,0x1
    15a2:	a3278793          	addi	a5,a5,-1486 # 1fd0 <digits>
    15a6:	00f77613          	andi	a2,a4,15
    15aa:	963e                	add	a2,a2,a5
    15ac:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    15b0:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    15b4:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    15b6:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    15ba:	0047551b          	srliw	a0,a4,0x4
    15be:	0047561b          	srliw	a2,a4,0x4
    15c2:	0ab6d263          	bge	a3,a1,1666 <printf+0x55e>
        buf[i--] = digits[x % base];
    15c6:	8a3d                	andi	a2,a2,15
    15c8:	963e                	add	a2,a2,a5
    15ca:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    15ce:	463d                	li	a2,15
    15d0:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    15d4:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    15d8:	daa661e3          	bltu	a2,a0,137a <printf+0x272>
        buf[i--] = '-';
    15dc:	02d00793          	li	a5,45
    15e0:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    15e4:	45b5                	li	a1,13
    write(f, s, l);
    15e6:	003c                	addi	a5,sp,8
    15e8:	4641                	li	a2,16
    15ea:	9e0d                	subw	a2,a2,a1
    15ec:	4505                	li	a0,1
    15ee:	95be                	add	a1,a1,a5
    15f0:	7ec000ef          	jal	ra,1ddc <write>
    15f4:	b51d                	j	141a <printf+0x312>
        x = -xx;
    15f6:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    15fa:	46a9                	li	a3,10
    15fc:	02d875bb          	remuw	a1,a6,a3
    1600:	00001797          	auipc	a5,0x1
    1604:	9d078793          	addi	a5,a5,-1584 # 1fd0 <digits>
    buf[16] = 0;
    1608:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    160c:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    160e:	95be                	add	a1,a1,a5
    1610:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    1614:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    1618:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    161c:	04a65563          	bge	a2,a0,1666 <printf+0x55e>
    1620:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1624:	02d775bb          	remuw	a1,a4,a3
    1628:	95be                	add	a1,a1,a5
    162a:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    162e:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    1632:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    1636:	fb0573e3          	bgeu	a0,a6,15dc <printf+0x4d4>
        buf[i--] = digits[x % base];
    163a:	4529                	li	a0,10
    } while ((x /= base) != 0);
    163c:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    163e:	02a5f73b          	remuw	a4,a1,a0
    1642:	973e                	add	a4,a4,a5
    1644:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    1648:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    164c:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    1650:	e6b6e3e3          	bltu	a3,a1,14b6 <printf+0x3ae>
        buf[i--] = digits[x % base];
    1654:	45b5                	li	a1,13
    if (sign)
    1656:	da065be3          	bgez	a2,140c <printf+0x304>
    165a:	a881                	j	16aa <printf+0x5a2>
                a = "(null)";
    165c:	00001417          	auipc	s0,0x1
    1660:	95440413          	addi	s0,s0,-1708 # 1fb0 <unlink+0x2e>
    1664:	b3e1                	j	142c <printf+0x324>
        buf[i--] = '-';
    1666:	02d00793          	li	a5,45
    166a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    166e:	45b9                	li	a1,14
    write(f, s, l);
    1670:	003c                	addi	a5,sp,8
    1672:	4641                	li	a2,16
    1674:	9e0d                	subw	a2,a2,a1
    1676:	4505                	li	a0,1
    1678:	95be                	add	a1,a1,a5
    167a:	762000ef          	jal	ra,1ddc <write>
    167e:	bb71                	j	141a <printf+0x312>
        buf[i--] = digits[x % base];
    1680:	459d                	li	a1,7
    if (sign)
    1682:	d80655e3          	bgez	a2,140c <printf+0x304>
        buf[i--] = '-';
    1686:	02d00793          	li	a5,45
    168a:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    168e:	4599                	li	a1,6
    1690:	bbb5                	j	140c <printf+0x304>
    1692:	45b9                	li	a1,14
    write(f, s, l);
    1694:	003c                	addi	a5,sp,8
    1696:	4641                	li	a2,16
    1698:	9e0d                	subw	a2,a2,a1
    169a:	4505                	li	a0,1
    169c:	95be                	add	a1,a1,a5
    169e:	73e000ef          	jal	ra,1ddc <write>
    16a2:	bba5                	j	141a <printf+0x312>
        buf[i--] = digits[x % base];
    16a4:	45b5                	li	a1,13
    if (sign)
    16a6:	d606d3e3          	bgez	a3,140c <printf+0x304>
        buf[i--] = '-';
    16aa:	02d00793          	li	a5,45
    16ae:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    16b2:	45b1                	li	a1,12
    write(f, s, l);
    16b4:	003c                	addi	a5,sp,8
    16b6:	4641                	li	a2,16
    16b8:	9e0d                	subw	a2,a2,a1
    16ba:	4505                	li	a0,1
    16bc:	95be                	add	a1,a1,a5
    16be:	71e000ef          	jal	ra,1ddc <write>
    16c2:	bba1                	j	141a <printf+0x312>
        buf[i--] = digits[x % base];
    16c4:	45b1                	li	a1,12
    if (sign)
    16c6:	d406d3e3          	bgez	a3,140c <printf+0x304>
        buf[i--] = '-';
    16ca:	02d00793          	li	a5,45
    16ce:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    16d2:	45ad                	li	a1,11
    write(f, s, l);
    16d4:	003c                	addi	a5,sp,8
    16d6:	4641                	li	a2,16
    16d8:	9e0d                	subw	a2,a2,a1
    16da:	4505                	li	a0,1
    16dc:	95be                	add	a1,a1,a5
    16de:	6fe000ef          	jal	ra,1ddc <write>
    16e2:	bb25                	j	141a <printf+0x312>
        buf[i--] = digits[x % base];
    16e4:	45b1                	li	a1,12
    if (sign)
    16e6:	d20653e3          	bgez	a2,140c <printf+0x304>
    16ea:	b7c5                	j	16ca <printf+0x5c2>
        buf[i--] = digits[x % base];
    16ec:	45ad                	li	a1,11
    if (sign)
    16ee:	d0065fe3          	bgez	a2,140c <printf+0x304>
        buf[i--] = '-';
    16f2:	02d00793          	li	a5,45
    16f6:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    16fa:	45a9                	li	a1,10
    16fc:	bb01                	j	140c <printf+0x304>
    16fe:	45ad                	li	a1,11
    if (sign)
    1700:	d006d6e3          	bgez	a3,140c <printf+0x304>
    1704:	b7fd                	j	16f2 <printf+0x5ea>
        buf[i--] = digits[x % base];
    1706:	45a9                	li	a1,10
    if (sign)
    1708:	d00652e3          	bgez	a2,140c <printf+0x304>
        buf[i--] = '-';
    170c:	02d00793          	li	a5,45
    1710:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1714:	45a5                	li	a1,9
    1716:	b9dd                	j	140c <printf+0x304>
    1718:	45a9                	li	a1,10
    if (sign)
    171a:	ce06d9e3          	bgez	a3,140c <printf+0x304>
    171e:	b7fd                	j	170c <printf+0x604>
        buf[i--] = digits[x % base];
    1720:	45a1                	li	a1,8
    if (sign)
    1722:	ce0655e3          	bgez	a2,140c <printf+0x304>
    1726:	b9f1                	j	1402 <printf+0x2fa>
        buf[i--] = digits[x % base];
    1728:	45a5                	li	a1,9
    if (sign)
    172a:	ce0651e3          	bgez	a2,140c <printf+0x304>
        buf[i--] = '-';
    172e:	02d00793          	li	a5,45
    1732:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1736:	45a1                	li	a1,8
    1738:	b9d1                	j	140c <printf+0x304>
    i = 15;
    173a:	45bd                	li	a1,15
    173c:	b9c1                	j	140c <printf+0x304>
        buf[i--] = digits[x % base];
    173e:	45a5                	li	a1,9
    if (sign)
    1740:	cc06d6e3          	bgez	a3,140c <printf+0x304>
    1744:	b7ed                	j	172e <printf+0x626>

0000000000001746 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1746:	02000793          	li	a5,32
    174a:	00f50663          	beq	a0,a5,1756 <isspace+0x10>
    174e:	355d                	addiw	a0,a0,-9
    1750:	00553513          	sltiu	a0,a0,5
    1754:	8082                	ret
    1756:	4505                	li	a0,1
}
    1758:	8082                	ret

000000000000175a <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    175a:	fd05051b          	addiw	a0,a0,-48
}
    175e:	00a53513          	sltiu	a0,a0,10
    1762:	8082                	ret

0000000000001764 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1764:	02000613          	li	a2,32
    1768:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    176a:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    176e:	ff77069b          	addiw	a3,a4,-9
    1772:	04c70d63          	beq	a4,a2,17cc <atoi+0x68>
    1776:	0007079b          	sext.w	a5,a4
    177a:	04d5f963          	bgeu	a1,a3,17cc <atoi+0x68>
        s++;
    switch (*s)
    177e:	02b00693          	li	a3,43
    1782:	04d70a63          	beq	a4,a3,17d6 <atoi+0x72>
    1786:	02d00693          	li	a3,45
    178a:	06d70463          	beq	a4,a3,17f2 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    178e:	fd07859b          	addiw	a1,a5,-48
    1792:	4625                	li	a2,9
    1794:	873e                	mv	a4,a5
    1796:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1798:	4e01                	li	t3,0
    while (isdigit(*s))
    179a:	04b66a63          	bltu	a2,a1,17ee <atoi+0x8a>
    int n = 0, neg = 0;
    179e:	4501                	li	a0,0
    while (isdigit(*s))
    17a0:	4825                	li	a6,9
    17a2:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    17a6:	0025179b          	slliw	a5,a0,0x2
    17aa:	9d3d                	addw	a0,a0,a5
    17ac:	fd07031b          	addiw	t1,a4,-48
    17b0:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    17b4:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    17b8:	0685                	addi	a3,a3,1
    17ba:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    17be:	0006071b          	sext.w	a4,a2
    17c2:	feb870e3          	bgeu	a6,a1,17a2 <atoi+0x3e>
    return neg ? n : -n;
    17c6:	000e0563          	beqz	t3,17d0 <atoi+0x6c>
}
    17ca:	8082                	ret
        s++;
    17cc:	0505                	addi	a0,a0,1
    17ce:	bf71                	j	176a <atoi+0x6>
    17d0:	4113053b          	subw	a0,t1,a7
    17d4:	8082                	ret
    while (isdigit(*s))
    17d6:	00154783          	lbu	a5,1(a0)
    17da:	4625                	li	a2,9
        s++;
    17dc:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17e0:	fd07859b          	addiw	a1,a5,-48
    17e4:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    17e8:	4e01                	li	t3,0
    while (isdigit(*s))
    17ea:	fab67ae3          	bgeu	a2,a1,179e <atoi+0x3a>
    17ee:	4501                	li	a0,0
}
    17f0:	8082                	ret
    while (isdigit(*s))
    17f2:	00154783          	lbu	a5,1(a0)
    17f6:	4625                	li	a2,9
        s++;
    17f8:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17fc:	fd07859b          	addiw	a1,a5,-48
    1800:	0007871b          	sext.w	a4,a5
    1804:	feb665e3          	bltu	a2,a1,17ee <atoi+0x8a>
        neg = 1;
    1808:	4e05                	li	t3,1
    180a:	bf51                	j	179e <atoi+0x3a>

000000000000180c <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    180c:	16060d63          	beqz	a2,1986 <memset+0x17a>
    1810:	40a007b3          	neg	a5,a0
    1814:	8b9d                	andi	a5,a5,7
    1816:	00778713          	addi	a4,a5,7
    181a:	482d                	li	a6,11
    181c:	0ff5f593          	andi	a1,a1,255
    1820:	fff60693          	addi	a3,a2,-1
    1824:	17076263          	bltu	a4,a6,1988 <memset+0x17c>
    1828:	16e6ea63          	bltu	a3,a4,199c <memset+0x190>
    182c:	16078563          	beqz	a5,1996 <memset+0x18a>
    1830:	00b50023          	sb	a1,0(a0)
    1834:	4705                	li	a4,1
    1836:	00150e93          	addi	t4,a0,1
    183a:	14e78c63          	beq	a5,a4,1992 <memset+0x186>
    183e:	00b500a3          	sb	a1,1(a0)
    1842:	4709                	li	a4,2
    1844:	00250e93          	addi	t4,a0,2
    1848:	14e78d63          	beq	a5,a4,19a2 <memset+0x196>
    184c:	00b50123          	sb	a1,2(a0)
    1850:	470d                	li	a4,3
    1852:	00350e93          	addi	t4,a0,3
    1856:	12e78b63          	beq	a5,a4,198c <memset+0x180>
    185a:	00b501a3          	sb	a1,3(a0)
    185e:	4711                	li	a4,4
    1860:	00450e93          	addi	t4,a0,4
    1864:	14e78163          	beq	a5,a4,19a6 <memset+0x19a>
    1868:	00b50223          	sb	a1,4(a0)
    186c:	4715                	li	a4,5
    186e:	00550e93          	addi	t4,a0,5
    1872:	12e78c63          	beq	a5,a4,19aa <memset+0x19e>
    1876:	00b502a3          	sb	a1,5(a0)
    187a:	471d                	li	a4,7
    187c:	00650e93          	addi	t4,a0,6
    1880:	12e79763          	bne	a5,a4,19ae <memset+0x1a2>
    1884:	00750e93          	addi	t4,a0,7
    1888:	00b50323          	sb	a1,6(a0)
    188c:	4f1d                	li	t5,7
    188e:	00859713          	slli	a4,a1,0x8
    1892:	8f4d                	or	a4,a4,a1
    1894:	01059e13          	slli	t3,a1,0x10
    1898:	01c76e33          	or	t3,a4,t3
    189c:	01859313          	slli	t1,a1,0x18
    18a0:	006e6333          	or	t1,t3,t1
    18a4:	02059893          	slli	a7,a1,0x20
    18a8:	011368b3          	or	a7,t1,a7
    18ac:	02859813          	slli	a6,a1,0x28
    18b0:	40f60333          	sub	t1,a2,a5
    18b4:	0108e833          	or	a6,a7,a6
    18b8:	03059693          	slli	a3,a1,0x30
    18bc:	00d866b3          	or	a3,a6,a3
    18c0:	03859713          	slli	a4,a1,0x38
    18c4:	97aa                	add	a5,a5,a0
    18c6:	ff837813          	andi	a6,t1,-8
    18ca:	8f55                	or	a4,a4,a3
    18cc:	00f806b3          	add	a3,a6,a5
    18d0:	e398                	sd	a4,0(a5)
    18d2:	07a1                	addi	a5,a5,8
    18d4:	fed79ee3          	bne	a5,a3,18d0 <memset+0xc4>
    18d8:	ff837693          	andi	a3,t1,-8
    18dc:	00de87b3          	add	a5,t4,a3
    18e0:	01e6873b          	addw	a4,a3,t5
    18e4:	0ad30663          	beq	t1,a3,1990 <memset+0x184>
    18e8:	00b78023          	sb	a1,0(a5)
    18ec:	0017069b          	addiw	a3,a4,1
    18f0:	08c6fb63          	bgeu	a3,a2,1986 <memset+0x17a>
    18f4:	00b780a3          	sb	a1,1(a5)
    18f8:	0027069b          	addiw	a3,a4,2
    18fc:	08c6f563          	bgeu	a3,a2,1986 <memset+0x17a>
    1900:	00b78123          	sb	a1,2(a5)
    1904:	0037069b          	addiw	a3,a4,3
    1908:	06c6ff63          	bgeu	a3,a2,1986 <memset+0x17a>
    190c:	00b781a3          	sb	a1,3(a5)
    1910:	0047069b          	addiw	a3,a4,4
    1914:	06c6f963          	bgeu	a3,a2,1986 <memset+0x17a>
    1918:	00b78223          	sb	a1,4(a5)
    191c:	0057069b          	addiw	a3,a4,5
    1920:	06c6f363          	bgeu	a3,a2,1986 <memset+0x17a>
    1924:	00b782a3          	sb	a1,5(a5)
    1928:	0067069b          	addiw	a3,a4,6
    192c:	04c6fd63          	bgeu	a3,a2,1986 <memset+0x17a>
    1930:	00b78323          	sb	a1,6(a5)
    1934:	0077069b          	addiw	a3,a4,7
    1938:	04c6f763          	bgeu	a3,a2,1986 <memset+0x17a>
    193c:	00b783a3          	sb	a1,7(a5)
    1940:	0087069b          	addiw	a3,a4,8
    1944:	04c6f163          	bgeu	a3,a2,1986 <memset+0x17a>
    1948:	00b78423          	sb	a1,8(a5)
    194c:	0097069b          	addiw	a3,a4,9
    1950:	02c6fb63          	bgeu	a3,a2,1986 <memset+0x17a>
    1954:	00b784a3          	sb	a1,9(a5)
    1958:	00a7069b          	addiw	a3,a4,10
    195c:	02c6f563          	bgeu	a3,a2,1986 <memset+0x17a>
    1960:	00b78523          	sb	a1,10(a5)
    1964:	00b7069b          	addiw	a3,a4,11
    1968:	00c6ff63          	bgeu	a3,a2,1986 <memset+0x17a>
    196c:	00b785a3          	sb	a1,11(a5)
    1970:	00c7069b          	addiw	a3,a4,12
    1974:	00c6f963          	bgeu	a3,a2,1986 <memset+0x17a>
    1978:	00b78623          	sb	a1,12(a5)
    197c:	2735                	addiw	a4,a4,13
    197e:	00c77463          	bgeu	a4,a2,1986 <memset+0x17a>
    1982:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1986:	8082                	ret
    1988:	472d                	li	a4,11
    198a:	bd79                	j	1828 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    198c:	4f0d                	li	t5,3
    198e:	b701                	j	188e <memset+0x82>
    1990:	8082                	ret
    1992:	4f05                	li	t5,1
    1994:	bded                	j	188e <memset+0x82>
    1996:	8eaa                	mv	t4,a0
    1998:	4f01                	li	t5,0
    199a:	bdd5                	j	188e <memset+0x82>
    199c:	87aa                	mv	a5,a0
    199e:	4701                	li	a4,0
    19a0:	b7a1                	j	18e8 <memset+0xdc>
    19a2:	4f09                	li	t5,2
    19a4:	b5ed                	j	188e <memset+0x82>
    19a6:	4f11                	li	t5,4
    19a8:	b5dd                	j	188e <memset+0x82>
    19aa:	4f15                	li	t5,5
    19ac:	b5cd                	j	188e <memset+0x82>
    19ae:	4f19                	li	t5,6
    19b0:	bdf9                	j	188e <memset+0x82>

00000000000019b2 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    19b2:	00054783          	lbu	a5,0(a0)
    19b6:	0005c703          	lbu	a4,0(a1)
    19ba:	00e79863          	bne	a5,a4,19ca <strcmp+0x18>
    19be:	0505                	addi	a0,a0,1
    19c0:	0585                	addi	a1,a1,1
    19c2:	fbe5                	bnez	a5,19b2 <strcmp>
    19c4:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    19c6:	9d19                	subw	a0,a0,a4
    19c8:	8082                	ret
    19ca:	0007851b          	sext.w	a0,a5
    19ce:	bfe5                	j	19c6 <strcmp+0x14>

00000000000019d0 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    19d0:	ce05                	beqz	a2,1a08 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19d2:	00054703          	lbu	a4,0(a0)
    19d6:	0005c783          	lbu	a5,0(a1)
    19da:	cb0d                	beqz	a4,1a0c <strncmp+0x3c>
    if (!n--)
    19dc:	167d                	addi	a2,a2,-1
    19de:	00c506b3          	add	a3,a0,a2
    19e2:	a819                	j	19f8 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    19e4:	00a68e63          	beq	a3,a0,1a00 <strncmp+0x30>
    19e8:	0505                	addi	a0,a0,1
    19ea:	00e79b63          	bne	a5,a4,1a00 <strncmp+0x30>
    19ee:	00054703          	lbu	a4,0(a0)
    19f2:	0005c783          	lbu	a5,0(a1)
    19f6:	cb19                	beqz	a4,1a0c <strncmp+0x3c>
    19f8:	0005c783          	lbu	a5,0(a1)
    19fc:	0585                	addi	a1,a1,1
    19fe:	f3fd                	bnez	a5,19e4 <strncmp+0x14>
        ;
    return *l - *r;
    1a00:	0007051b          	sext.w	a0,a4
    1a04:	9d1d                	subw	a0,a0,a5
    1a06:	8082                	ret
        return 0;
    1a08:	4501                	li	a0,0
}
    1a0a:	8082                	ret
    1a0c:	4501                	li	a0,0
    return *l - *r;
    1a0e:	9d1d                	subw	a0,a0,a5
    1a10:	8082                	ret

0000000000001a12 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1a12:	00757793          	andi	a5,a0,7
    1a16:	cf89                	beqz	a5,1a30 <strlen+0x1e>
    1a18:	87aa                	mv	a5,a0
    1a1a:	a029                	j	1a24 <strlen+0x12>
    1a1c:	0785                	addi	a5,a5,1
    1a1e:	0077f713          	andi	a4,a5,7
    1a22:	cb01                	beqz	a4,1a32 <strlen+0x20>
        if (!*s)
    1a24:	0007c703          	lbu	a4,0(a5)
    1a28:	fb75                	bnez	a4,1a1c <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1a2a:	40a78533          	sub	a0,a5,a0
}
    1a2e:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1a30:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1a32:	6394                	ld	a3,0(a5)
    1a34:	00000597          	auipc	a1,0x0
    1a38:	5845b583          	ld	a1,1412(a1) # 1fb8 <unlink+0x36>
    1a3c:	00000617          	auipc	a2,0x0
    1a40:	58463603          	ld	a2,1412(a2) # 1fc0 <unlink+0x3e>
    1a44:	a019                	j	1a4a <strlen+0x38>
    1a46:	6794                	ld	a3,8(a5)
    1a48:	07a1                	addi	a5,a5,8
    1a4a:	00b68733          	add	a4,a3,a1
    1a4e:	fff6c693          	not	a3,a3
    1a52:	8f75                	and	a4,a4,a3
    1a54:	8f71                	and	a4,a4,a2
    1a56:	db65                	beqz	a4,1a46 <strlen+0x34>
    for (; *s; s++)
    1a58:	0007c703          	lbu	a4,0(a5)
    1a5c:	d779                	beqz	a4,1a2a <strlen+0x18>
    1a5e:	0017c703          	lbu	a4,1(a5)
    1a62:	0785                	addi	a5,a5,1
    1a64:	d379                	beqz	a4,1a2a <strlen+0x18>
    1a66:	0017c703          	lbu	a4,1(a5)
    1a6a:	0785                	addi	a5,a5,1
    1a6c:	fb6d                	bnez	a4,1a5e <strlen+0x4c>
    1a6e:	bf75                	j	1a2a <strlen+0x18>

0000000000001a70 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a70:	00757713          	andi	a4,a0,7
{
    1a74:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1a76:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a7a:	cb19                	beqz	a4,1a90 <memchr+0x20>
    1a7c:	ce25                	beqz	a2,1af4 <memchr+0x84>
    1a7e:	0007c703          	lbu	a4,0(a5)
    1a82:	04b70e63          	beq	a4,a1,1ade <memchr+0x6e>
    1a86:	0785                	addi	a5,a5,1
    1a88:	0077f713          	andi	a4,a5,7
    1a8c:	167d                	addi	a2,a2,-1
    1a8e:	f77d                	bnez	a4,1a7c <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1a90:	4501                	li	a0,0
    if (n && *s != c)
    1a92:	c235                	beqz	a2,1af6 <memchr+0x86>
    1a94:	0007c703          	lbu	a4,0(a5)
    1a98:	04b70363          	beq	a4,a1,1ade <memchr+0x6e>
        size_t k = ONES * c;
    1a9c:	00000517          	auipc	a0,0x0
    1aa0:	52c53503          	ld	a0,1324(a0) # 1fc8 <unlink+0x46>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1aa4:	471d                	li	a4,7
        size_t k = ONES * c;
    1aa6:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1aaa:	02c77a63          	bgeu	a4,a2,1ade <memchr+0x6e>
    1aae:	00000897          	auipc	a7,0x0
    1ab2:	50a8b883          	ld	a7,1290(a7) # 1fb8 <unlink+0x36>
    1ab6:	00000817          	auipc	a6,0x0
    1aba:	50a83803          	ld	a6,1290(a6) # 1fc0 <unlink+0x3e>
    1abe:	431d                	li	t1,7
    1ac0:	a029                	j	1aca <memchr+0x5a>
    1ac2:	1661                	addi	a2,a2,-8
    1ac4:	07a1                	addi	a5,a5,8
    1ac6:	02c37963          	bgeu	t1,a2,1af8 <memchr+0x88>
    1aca:	6398                	ld	a4,0(a5)
    1acc:	8f29                	xor	a4,a4,a0
    1ace:	011706b3          	add	a3,a4,a7
    1ad2:	fff74713          	not	a4,a4
    1ad6:	8f75                	and	a4,a4,a3
    1ad8:	01077733          	and	a4,a4,a6
    1adc:	d37d                	beqz	a4,1ac2 <memchr+0x52>
    1ade:	853e                	mv	a0,a5
    1ae0:	97b2                	add	a5,a5,a2
    1ae2:	a021                	j	1aea <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1ae4:	0505                	addi	a0,a0,1
    1ae6:	00f50763          	beq	a0,a5,1af4 <memchr+0x84>
    1aea:	00054703          	lbu	a4,0(a0)
    1aee:	feb71be3          	bne	a4,a1,1ae4 <memchr+0x74>
    1af2:	8082                	ret
    return n ? (void *)s : 0;
    1af4:	4501                	li	a0,0
}
    1af6:	8082                	ret
    return n ? (void *)s : 0;
    1af8:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1afa:	f275                	bnez	a2,1ade <memchr+0x6e>
}
    1afc:	8082                	ret

0000000000001afe <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1afe:	1101                	addi	sp,sp,-32
    1b00:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1b02:	862e                	mv	a2,a1
{
    1b04:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1b06:	4581                	li	a1,0
{
    1b08:	e426                	sd	s1,8(sp)
    1b0a:	ec06                	sd	ra,24(sp)
    1b0c:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1b0e:	f63ff0ef          	jal	ra,1a70 <memchr>
    return p ? p - s : n;
    1b12:	c519                	beqz	a0,1b20 <strnlen+0x22>
}
    1b14:	60e2                	ld	ra,24(sp)
    1b16:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1b18:	8d05                	sub	a0,a0,s1
}
    1b1a:	64a2                	ld	s1,8(sp)
    1b1c:	6105                	addi	sp,sp,32
    1b1e:	8082                	ret
    1b20:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1b22:	8522                	mv	a0,s0
}
    1b24:	6442                	ld	s0,16(sp)
    1b26:	64a2                	ld	s1,8(sp)
    1b28:	6105                	addi	sp,sp,32
    1b2a:	8082                	ret

0000000000001b2c <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1b2c:	00b547b3          	xor	a5,a0,a1
    1b30:	8b9d                	andi	a5,a5,7
    1b32:	eb95                	bnez	a5,1b66 <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1b34:	0075f793          	andi	a5,a1,7
    1b38:	e7b1                	bnez	a5,1b84 <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1b3a:	6198                	ld	a4,0(a1)
    1b3c:	00000617          	auipc	a2,0x0
    1b40:	47c63603          	ld	a2,1148(a2) # 1fb8 <unlink+0x36>
    1b44:	00000817          	auipc	a6,0x0
    1b48:	47c83803          	ld	a6,1148(a6) # 1fc0 <unlink+0x3e>
    1b4c:	a029                	j	1b56 <stpcpy+0x2a>
    1b4e:	e118                	sd	a4,0(a0)
    1b50:	6598                	ld	a4,8(a1)
    1b52:	05a1                	addi	a1,a1,8
    1b54:	0521                	addi	a0,a0,8
    1b56:	00c707b3          	add	a5,a4,a2
    1b5a:	fff74693          	not	a3,a4
    1b5e:	8ff5                	and	a5,a5,a3
    1b60:	0107f7b3          	and	a5,a5,a6
    1b64:	d7ed                	beqz	a5,1b4e <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b66:	0005c783          	lbu	a5,0(a1)
    1b6a:	00f50023          	sb	a5,0(a0)
    1b6e:	c785                	beqz	a5,1b96 <stpcpy+0x6a>
    1b70:	0015c783          	lbu	a5,1(a1)
    1b74:	0505                	addi	a0,a0,1
    1b76:	0585                	addi	a1,a1,1
    1b78:	00f50023          	sb	a5,0(a0)
    1b7c:	fbf5                	bnez	a5,1b70 <stpcpy+0x44>
        ;
    return d;
}
    1b7e:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1b80:	0505                	addi	a0,a0,1
    1b82:	df45                	beqz	a4,1b3a <stpcpy+0xe>
            if (!(*d = *s))
    1b84:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1b88:	0585                	addi	a1,a1,1
    1b8a:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1b8e:	00f50023          	sb	a5,0(a0)
    1b92:	f7fd                	bnez	a5,1b80 <stpcpy+0x54>
}
    1b94:	8082                	ret
    1b96:	8082                	ret

0000000000001b98 <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b98:	00b547b3          	xor	a5,a0,a1
    1b9c:	8b9d                	andi	a5,a5,7
    1b9e:	1a079863          	bnez	a5,1d4e <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1ba2:	0075f793          	andi	a5,a1,7
    1ba6:	16078463          	beqz	a5,1d0e <stpncpy+0x176>
    1baa:	ea01                	bnez	a2,1bba <stpncpy+0x22>
    1bac:	a421                	j	1db4 <stpncpy+0x21c>
    1bae:	167d                	addi	a2,a2,-1
    1bb0:	0505                	addi	a0,a0,1
    1bb2:	14070e63          	beqz	a4,1d0e <stpncpy+0x176>
    1bb6:	1a060863          	beqz	a2,1d66 <stpncpy+0x1ce>
    1bba:	0005c783          	lbu	a5,0(a1)
    1bbe:	0585                	addi	a1,a1,1
    1bc0:	0075f713          	andi	a4,a1,7
    1bc4:	00f50023          	sb	a5,0(a0)
    1bc8:	f3fd                	bnez	a5,1bae <stpncpy+0x16>
    1bca:	4805                	li	a6,1
    1bcc:	1a061863          	bnez	a2,1d7c <stpncpy+0x1e4>
    1bd0:	40a007b3          	neg	a5,a0
    1bd4:	8b9d                	andi	a5,a5,7
    1bd6:	4681                	li	a3,0
    1bd8:	18061a63          	bnez	a2,1d6c <stpncpy+0x1d4>
    1bdc:	00778713          	addi	a4,a5,7
    1be0:	45ad                	li	a1,11
    1be2:	18b76363          	bltu	a4,a1,1d68 <stpncpy+0x1d0>
    1be6:	1ae6eb63          	bltu	a3,a4,1d9c <stpncpy+0x204>
    1bea:	1a078363          	beqz	a5,1d90 <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bee:	00050023          	sb	zero,0(a0)
    1bf2:	4685                	li	a3,1
    1bf4:	00150713          	addi	a4,a0,1
    1bf8:	18d78f63          	beq	a5,a3,1d96 <stpncpy+0x1fe>
    1bfc:	000500a3          	sb	zero,1(a0)
    1c00:	4689                	li	a3,2
    1c02:	00250713          	addi	a4,a0,2
    1c06:	18d78e63          	beq	a5,a3,1da2 <stpncpy+0x20a>
    1c0a:	00050123          	sb	zero,2(a0)
    1c0e:	468d                	li	a3,3
    1c10:	00350713          	addi	a4,a0,3
    1c14:	16d78c63          	beq	a5,a3,1d8c <stpncpy+0x1f4>
    1c18:	000501a3          	sb	zero,3(a0)
    1c1c:	4691                	li	a3,4
    1c1e:	00450713          	addi	a4,a0,4
    1c22:	18d78263          	beq	a5,a3,1da6 <stpncpy+0x20e>
    1c26:	00050223          	sb	zero,4(a0)
    1c2a:	4695                	li	a3,5
    1c2c:	00550713          	addi	a4,a0,5
    1c30:	16d78d63          	beq	a5,a3,1daa <stpncpy+0x212>
    1c34:	000502a3          	sb	zero,5(a0)
    1c38:	469d                	li	a3,7
    1c3a:	00650713          	addi	a4,a0,6
    1c3e:	16d79863          	bne	a5,a3,1dae <stpncpy+0x216>
    1c42:	00750713          	addi	a4,a0,7
    1c46:	00050323          	sb	zero,6(a0)
    1c4a:	40f80833          	sub	a6,a6,a5
    1c4e:	ff887593          	andi	a1,a6,-8
    1c52:	97aa                	add	a5,a5,a0
    1c54:	95be                	add	a1,a1,a5
    1c56:	0007b023          	sd	zero,0(a5)
    1c5a:	07a1                	addi	a5,a5,8
    1c5c:	feb79de3          	bne	a5,a1,1c56 <stpncpy+0xbe>
    1c60:	ff887593          	andi	a1,a6,-8
    1c64:	9ead                	addw	a3,a3,a1
    1c66:	00b707b3          	add	a5,a4,a1
    1c6a:	12b80863          	beq	a6,a1,1d9a <stpncpy+0x202>
    1c6e:	00078023          	sb	zero,0(a5)
    1c72:	0016871b          	addiw	a4,a3,1
    1c76:	0ec77863          	bgeu	a4,a2,1d66 <stpncpy+0x1ce>
    1c7a:	000780a3          	sb	zero,1(a5)
    1c7e:	0026871b          	addiw	a4,a3,2
    1c82:	0ec77263          	bgeu	a4,a2,1d66 <stpncpy+0x1ce>
    1c86:	00078123          	sb	zero,2(a5)
    1c8a:	0036871b          	addiw	a4,a3,3
    1c8e:	0cc77c63          	bgeu	a4,a2,1d66 <stpncpy+0x1ce>
    1c92:	000781a3          	sb	zero,3(a5)
    1c96:	0046871b          	addiw	a4,a3,4
    1c9a:	0cc77663          	bgeu	a4,a2,1d66 <stpncpy+0x1ce>
    1c9e:	00078223          	sb	zero,4(a5)
    1ca2:	0056871b          	addiw	a4,a3,5
    1ca6:	0cc77063          	bgeu	a4,a2,1d66 <stpncpy+0x1ce>
    1caa:	000782a3          	sb	zero,5(a5)
    1cae:	0066871b          	addiw	a4,a3,6
    1cb2:	0ac77a63          	bgeu	a4,a2,1d66 <stpncpy+0x1ce>
    1cb6:	00078323          	sb	zero,6(a5)
    1cba:	0076871b          	addiw	a4,a3,7
    1cbe:	0ac77463          	bgeu	a4,a2,1d66 <stpncpy+0x1ce>
    1cc2:	000783a3          	sb	zero,7(a5)
    1cc6:	0086871b          	addiw	a4,a3,8
    1cca:	08c77e63          	bgeu	a4,a2,1d66 <stpncpy+0x1ce>
    1cce:	00078423          	sb	zero,8(a5)
    1cd2:	0096871b          	addiw	a4,a3,9
    1cd6:	08c77863          	bgeu	a4,a2,1d66 <stpncpy+0x1ce>
    1cda:	000784a3          	sb	zero,9(a5)
    1cde:	00a6871b          	addiw	a4,a3,10
    1ce2:	08c77263          	bgeu	a4,a2,1d66 <stpncpy+0x1ce>
    1ce6:	00078523          	sb	zero,10(a5)
    1cea:	00b6871b          	addiw	a4,a3,11
    1cee:	06c77c63          	bgeu	a4,a2,1d66 <stpncpy+0x1ce>
    1cf2:	000785a3          	sb	zero,11(a5)
    1cf6:	00c6871b          	addiw	a4,a3,12
    1cfa:	06c77663          	bgeu	a4,a2,1d66 <stpncpy+0x1ce>
    1cfe:	00078623          	sb	zero,12(a5)
    1d02:	26b5                	addiw	a3,a3,13
    1d04:	06c6f163          	bgeu	a3,a2,1d66 <stpncpy+0x1ce>
    1d08:	000786a3          	sb	zero,13(a5)
    1d0c:	8082                	ret
            ;
        if (!n || !*s)
    1d0e:	c645                	beqz	a2,1db6 <stpncpy+0x21e>
    1d10:	0005c783          	lbu	a5,0(a1)
    1d14:	ea078be3          	beqz	a5,1bca <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d18:	479d                	li	a5,7
    1d1a:	02c7ff63          	bgeu	a5,a2,1d58 <stpncpy+0x1c0>
    1d1e:	00000897          	auipc	a7,0x0
    1d22:	29a8b883          	ld	a7,666(a7) # 1fb8 <unlink+0x36>
    1d26:	00000817          	auipc	a6,0x0
    1d2a:	29a83803          	ld	a6,666(a6) # 1fc0 <unlink+0x3e>
    1d2e:	431d                	li	t1,7
    1d30:	6198                	ld	a4,0(a1)
    1d32:	011707b3          	add	a5,a4,a7
    1d36:	fff74693          	not	a3,a4
    1d3a:	8ff5                	and	a5,a5,a3
    1d3c:	0107f7b3          	and	a5,a5,a6
    1d40:	ef81                	bnez	a5,1d58 <stpncpy+0x1c0>
            *wd = *ws;
    1d42:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d44:	1661                	addi	a2,a2,-8
    1d46:	05a1                	addi	a1,a1,8
    1d48:	0521                	addi	a0,a0,8
    1d4a:	fec363e3          	bltu	t1,a2,1d30 <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1d4e:	e609                	bnez	a2,1d58 <stpncpy+0x1c0>
    1d50:	a08d                	j	1db2 <stpncpy+0x21a>
    1d52:	167d                	addi	a2,a2,-1
    1d54:	0505                	addi	a0,a0,1
    1d56:	ca01                	beqz	a2,1d66 <stpncpy+0x1ce>
    1d58:	0005c783          	lbu	a5,0(a1)
    1d5c:	0585                	addi	a1,a1,1
    1d5e:	00f50023          	sb	a5,0(a0)
    1d62:	fbe5                	bnez	a5,1d52 <stpncpy+0x1ba>
        ;
tail:
    1d64:	b59d                	j	1bca <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1d66:	8082                	ret
    1d68:	472d                	li	a4,11
    1d6a:	bdb5                	j	1be6 <stpncpy+0x4e>
    1d6c:	00778713          	addi	a4,a5,7
    1d70:	45ad                	li	a1,11
    1d72:	fff60693          	addi	a3,a2,-1
    1d76:	e6b778e3          	bgeu	a4,a1,1be6 <stpncpy+0x4e>
    1d7a:	b7fd                	j	1d68 <stpncpy+0x1d0>
    1d7c:	40a007b3          	neg	a5,a0
    1d80:	8832                	mv	a6,a2
    1d82:	8b9d                	andi	a5,a5,7
    1d84:	4681                	li	a3,0
    1d86:	e4060be3          	beqz	a2,1bdc <stpncpy+0x44>
    1d8a:	b7cd                	j	1d6c <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d8c:	468d                	li	a3,3
    1d8e:	bd75                	j	1c4a <stpncpy+0xb2>
    1d90:	872a                	mv	a4,a0
    1d92:	4681                	li	a3,0
    1d94:	bd5d                	j	1c4a <stpncpy+0xb2>
    1d96:	4685                	li	a3,1
    1d98:	bd4d                	j	1c4a <stpncpy+0xb2>
    1d9a:	8082                	ret
    1d9c:	87aa                	mv	a5,a0
    1d9e:	4681                	li	a3,0
    1da0:	b5f9                	j	1c6e <stpncpy+0xd6>
    1da2:	4689                	li	a3,2
    1da4:	b55d                	j	1c4a <stpncpy+0xb2>
    1da6:	4691                	li	a3,4
    1da8:	b54d                	j	1c4a <stpncpy+0xb2>
    1daa:	4695                	li	a3,5
    1dac:	bd79                	j	1c4a <stpncpy+0xb2>
    1dae:	4699                	li	a3,6
    1db0:	bd69                	j	1c4a <stpncpy+0xb2>
    1db2:	8082                	ret
    1db4:	8082                	ret
    1db6:	8082                	ret

0000000000001db8 <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1db8:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1dbc:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dbe:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1dc2:	2501                	sext.w	a0,a0
    1dc4:	8082                	ret

0000000000001dc6 <close>:
    register long a7 __asm__("a7") = n;
    1dc6:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1dca:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1dce:	2501                	sext.w	a0,a0
    1dd0:	8082                	ret

0000000000001dd2 <read>:
    register long a7 __asm__("a7") = n;
    1dd2:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd6:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1dda:	8082                	ret

0000000000001ddc <write>:
    register long a7 __asm__("a7") = n;
    1ddc:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de0:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1de4:	8082                	ret

0000000000001de6 <getpid>:
    register long a7 __asm__("a7") = n;
    1de6:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1dea:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1dee:	2501                	sext.w	a0,a0
    1df0:	8082                	ret

0000000000001df2 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1df2:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1df6:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1dfa:	2501                	sext.w	a0,a0
    1dfc:	8082                	ret

0000000000001dfe <fork>:
    register long a7 __asm__("a7") = n;
    1dfe:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1e02:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1e06:	2501                	sext.w	a0,a0
    1e08:	8082                	ret

0000000000001e0a <exit>:
    register long a7 __asm__("a7") = n;
    1e0a:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e0e:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e12:	8082                	ret

0000000000001e14 <waitpid>:
    register long a7 __asm__("a7") = n;
    1e14:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e18:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <exec>:
    register long a7 __asm__("a7") = n;
    1e20:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e24:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <get_time>:

int64 get_time()
{
    1e2c:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e2e:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e32:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e34:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e36:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e3a:	2501                	sext.w	a0,a0
    1e3c:	ed09                	bnez	a0,1e56 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e3e:	67a2                	ld	a5,8(sp)
    1e40:	3e800713          	li	a4,1000
    1e44:	00015503          	lhu	a0,0(sp)
    1e48:	02e7d7b3          	divu	a5,a5,a4
    1e4c:	02e50533          	mul	a0,a0,a4
    1e50:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e52:	0141                	addi	sp,sp,16
    1e54:	8082                	ret
        return -1;
    1e56:	557d                	li	a0,-1
    1e58:	bfed                	j	1e52 <get_time+0x26>

0000000000001e5a <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e5a:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5e:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e62:	2501                	sext.w	a0,a0
    1e64:	8082                	ret

0000000000001e66 <sleep>:

int sleep(unsigned long long time)
{
    1e66:	1141                	addi	sp,sp,-16
    1e68:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1e6a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e6e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e70:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e72:	00000073          	ecall
    if (err == 0)
    1e76:	2501                	sext.w	a0,a0
    1e78:	e13d                	bnez	a0,1ede <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e7a:	6722                	ld	a4,8(sp)
    1e7c:	3e800693          	li	a3,1000
    1e80:	00015783          	lhu	a5,0(sp)
    1e84:	02d75733          	divu	a4,a4,a3
    1e88:	02d787b3          	mul	a5,a5,a3
    1e8c:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1e8e:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e92:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e94:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e96:	00000073          	ecall
    if (err == 0)
    1e9a:	2501                	sext.w	a0,a0
    1e9c:	ed15                	bnez	a0,1ed8 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e9e:	6841                	lui	a6,0x10
    1ea0:	963e                	add	a2,a2,a5
    1ea2:	187d                	addi	a6,a6,-1
    1ea4:	3e800693          	li	a3,1000
    1ea8:	a819                	j	1ebe <sleep+0x58>
    __asm_syscall("r"(a7))
    1eaa:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1eae:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1eb2:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1eb4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb6:	00000073          	ecall
    if (err == 0)
    1eba:	2501                	sext.w	a0,a0
    1ebc:	ed11                	bnez	a0,1ed8 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ebe:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1ec0:	07c00893          	li	a7,124
    1ec4:	02d7d733          	divu	a4,a5,a3
    1ec8:	6782                	ld	a5,0(sp)
    1eca:	0107f7b3          	and	a5,a5,a6
    1ece:	02d787b3          	mul	a5,a5,a3
    1ed2:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1ed4:	fcc7ebe3          	bltu	a5,a2,1eaa <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1ed8:	4501                	li	a0,0
    1eda:	0141                	addi	sp,sp,16
    1edc:	8082                	ret
    1ede:	57fd                	li	a5,-1
    1ee0:	b77d                	j	1e8e <sleep+0x28>

0000000000001ee2 <set_priority>:
    register long a7 __asm__("a7") = n;
    1ee2:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1ee6:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1eea:	2501                	sext.w	a0,a0
    1eec:	8082                	ret

0000000000001eee <mmap>:
    register long a7 __asm__("a7") = n;
    1eee:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ef2:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1ef6:	2501                	sext.w	a0,a0
    1ef8:	8082                	ret

0000000000001efa <munmap>:
    register long a7 __asm__("a7") = n;
    1efa:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1efe:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1f02:	2501                	sext.w	a0,a0
    1f04:	8082                	ret

0000000000001f06 <wait>:

int wait(int *code)
{
    1f06:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f08:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1f0c:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f0e:	00000073          	ecall
    return waitpid(-1, code);
}
    1f12:	2501                	sext.w	a0,a0
    1f14:	8082                	ret

0000000000001f16 <spawn>:
    register long a7 __asm__("a7") = n;
    1f16:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1f1a:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f1e:	2501                	sext.w	a0,a0
    1f20:	8082                	ret

0000000000001f22 <mailread>:
    register long a7 __asm__("a7") = n;
    1f22:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f26:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f2a:	2501                	sext.w	a0,a0
    1f2c:	8082                	ret

0000000000001f2e <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f2e:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f32:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f36:	2501                	sext.w	a0,a0
    1f38:	8082                	ret

0000000000001f3a <fstat>:
    register long a7 __asm__("a7") = n;
    1f3a:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f3e:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f42:	2501                	sext.w	a0,a0
    1f44:	8082                	ret

0000000000001f46 <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1f46:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f48:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f4c:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f4e:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f52:	2501                	sext.w	a0,a0
    1f54:	8082                	ret

0000000000001f56 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f56:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f58:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f5c:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f5e:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f62:	2501                	sext.w	a0,a0
    1f64:	8082                	ret

0000000000001f66 <link>:

int link(char *old_path, char *new_path)
{
    1f66:	87aa                	mv	a5,a0
    1f68:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f6a:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f6e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f72:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f74:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f78:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f7a:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f7e:	2501                	sext.w	a0,a0
    1f80:	8082                	ret

0000000000001f82 <unlink>:

int unlink(char *path)
{
    1f82:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f84:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f88:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f8c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f8e:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f92:	2501                	sext.w	a0,a0
    1f94:	8082                	ret
