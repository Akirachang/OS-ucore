
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch5_getpid:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0220006f          	j	1024 <__start_main>

0000000000001006 <main>:
/*
理想结果：得到进程 pid，注意要关注 pid 是否符合内核逻辑，不要单纯以 Test OK! 作为判断。
*/

int main()
{
    1006:	1141                	addi	sp,sp,-16
    1008:	e406                	sd	ra,8(sp)
    int pid = getpid();
    100a:	58b000ef          	jal	ra,1d94 <getpid>
    100e:	85aa                	mv	a1,a0
    printf("Test getpid OK! pid = %d\n", pid);
    1010:	00001517          	auipc	a0,0x1
    1014:	f3850513          	addi	a0,a0,-200 # 1f48 <unlink+0x18>
    1018:	09e000ef          	jal	ra,10b6 <printf>
    return 0;
    101c:	60a2                	ld	ra,8(sp)
    101e:	4501                	li	a0,0
    1020:	0141                	addi	sp,sp,16
    1022:	8082                	ret

0000000000001024 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1024:	1141                	addi	sp,sp,-16
    1026:	e406                	sd	ra,8(sp)
    exit(main());
    1028:	fdfff0ef          	jal	ra,1006 <main>
    102c:	58d000ef          	jal	ra,1db8 <exit>
    return 0;
}
    1030:	60a2                	ld	ra,8(sp)
    1032:	4501                	li	a0,0
    1034:	0141                	addi	sp,sp,16
    1036:	8082                	ret

0000000000001038 <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    1038:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    103a:	00f10593          	addi	a1,sp,15
    103e:	4605                	li	a2,1
    1040:	4501                	li	a0,0
{
    1042:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1044:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1048:	539000ef          	jal	ra,1d80 <read>
    return byte;
}
    104c:	60e2                	ld	ra,24(sp)
    104e:	00f14503          	lbu	a0,15(sp)
    1052:	6105                	addi	sp,sp,32
    1054:	8082                	ret

0000000000001056 <putchar>:

int putchar(int c)
{
    1056:	1101                	addi	sp,sp,-32
    1058:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    105a:	00f10593          	addi	a1,sp,15
    105e:	4605                	li	a2,1
    1060:	4505                	li	a0,1
{
    1062:	ec06                	sd	ra,24(sp)
    char byte = c;
    1064:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1068:	523000ef          	jal	ra,1d8a <write>
}
    106c:	60e2                	ld	ra,24(sp)
    106e:	2501                	sext.w	a0,a0
    1070:	6105                	addi	sp,sp,32
    1072:	8082                	ret

0000000000001074 <puts>:

int puts(const char *s)
{
    1074:	1101                	addi	sp,sp,-32
    1076:	e822                	sd	s0,16(sp)
    1078:	ec06                	sd	ra,24(sp)
    107a:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    107c:	145000ef          	jal	ra,19c0 <strlen>
    1080:	862a                	mv	a2,a0
    1082:	85a2                	mv	a1,s0
    1084:	4505                	li	a0,1
    1086:	505000ef          	jal	ra,1d8a <write>
    108a:	00055763          	bgez	a0,1098 <puts+0x24>
    return r;
}
    108e:	60e2                	ld	ra,24(sp)
    1090:	6442                	ld	s0,16(sp)
    1092:	557d                	li	a0,-1
    1094:	6105                	addi	sp,sp,32
    1096:	8082                	ret
    return write(stdout, &byte, 1);
    1098:	00f10593          	addi	a1,sp,15
    char byte = c;
    109c:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    109e:	4605                	li	a2,1
    10a0:	4505                	li	a0,1
    char byte = c;
    10a2:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    10a6:	4e5000ef          	jal	ra,1d8a <write>
}
    10aa:	60e2                	ld	ra,24(sp)
    10ac:	6442                	ld	s0,16(sp)
    10ae:	41f5551b          	sraiw	a0,a0,0x1f
    10b2:	6105                	addi	sp,sp,32
    10b4:	8082                	ret

00000000000010b6 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    10b6:	7131                	addi	sp,sp,-192
    10b8:	ecce                	sd	s3,88(sp)
    10ba:	e8d2                	sd	s4,80(sp)
    10bc:	e4d6                	sd	s5,72(sp)
    10be:	e0da                	sd	s6,64(sp)
    10c0:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    10c2:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    10c4:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    10c6:	6ae1                	lui	s5,0x18
    10c8:	000f4a37          	lui	s4,0xf4
    10cc:	00989b37          	lui	s6,0x989
{
    10d0:	fc86                	sd	ra,120(sp)
    10d2:	f8a2                	sd	s0,112(sp)
    10d4:	f4a6                	sd	s1,104(sp)
    10d6:	f0ca                	sd	s2,96(sp)
    10d8:	fc5e                	sd	s7,56(sp)
    10da:	e52e                	sd	a1,136(sp)
    10dc:	e932                	sd	a2,144(sp)
    10de:	ed36                	sd	a3,152(sp)
    10e0:	f13a                	sd	a4,160(sp)
    10e2:	f942                	sd	a6,176(sp)
    10e4:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    10e6:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    10e8:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x787>
    10ec:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x16717>
    10f0:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf22b7>
    10f4:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x9876f7>
    for (;;)
    {
        if (!*s)
    10f8:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    10fc:	02500913          	li	s2,37
        if (!*s)
    1100:	1a078f63          	beqz	a5,12be <printf+0x208>
    1104:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1106:	17278e63          	beq	a5,s2,1282 <printf+0x1cc>
    110a:	00164783          	lbu	a5,1(a2)
    110e:	0605                	addi	a2,a2,1
    1110:	fbfd                	bnez	a5,1106 <printf+0x50>
    1112:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    1114:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1118:	85aa                	mv	a1,a0
    111a:	8622                	mv	a2,s0
    111c:	4505                	li	a0,1
    111e:	46d000ef          	jal	ra,1d8a <write>
        out(f, a, l);
        if (l)
    1122:	18041963          	bnez	s0,12b4 <printf+0x1fe>
            continue;
        if (s[1] == 0)
    1126:	0014c783          	lbu	a5,1(s1)
    112a:	18078a63          	beqz	a5,12be <printf+0x208>
            break;
        switch (s[1])
    112e:	07300713          	li	a4,115
    1132:	28e78e63          	beq	a5,a4,13ce <printf+0x318>
    1136:	18f76f63          	bltu	a4,a5,12d4 <printf+0x21e>
    113a:	06400713          	li	a4,100
    113e:	2ae78c63          	beq	a5,a4,13f6 <printf+0x340>
    1142:	07000713          	li	a4,112
    1146:	3ce79c63          	bne	a5,a4,151e <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    114a:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    114c:	00001797          	auipc	a5,0x1
    1150:	e3c78793          	addi	a5,a5,-452 # 1f88 <digits>
            printptr(va_arg(ap, uint64));
    1154:	6298                	ld	a4,0(a3)
    1156:	00868093          	addi	ra,a3,8
    115a:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    115c:	00471293          	slli	t0,a4,0x4
    1160:	00c71f13          	slli	t5,a4,0xc
    1164:	01471e13          	slli	t3,a4,0x14
    1168:	01c71893          	slli	a7,a4,0x1c
    116c:	02471813          	slli	a6,a4,0x24
    1170:	02871513          	slli	a0,a4,0x28
    1174:	02c71593          	slli	a1,a4,0x2c
    1178:	03071693          	slli	a3,a4,0x30
    117c:	00871f93          	slli	t6,a4,0x8
    1180:	01071e93          	slli	t4,a4,0x10
    1184:	01871313          	slli	t1,a4,0x18
    1188:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    118c:	03c2d293          	srli	t0,t0,0x3c
    1190:	03cf5f13          	srli	t5,t5,0x3c
    1194:	03ce5e13          	srli	t3,t3,0x3c
    1198:	03c8d893          	srli	a7,a7,0x3c
    119c:	03c85813          	srli	a6,a6,0x3c
    11a0:	9171                	srli	a0,a0,0x3c
    11a2:	91f1                	srli	a1,a1,0x3c
    11a4:	92f1                	srli	a3,a3,0x3c
    11a6:	92be                	add	t0,t0,a5
    11a8:	9f3e                	add	t5,t5,a5
    11aa:	9e3e                	add	t3,t3,a5
    11ac:	98be                	add	a7,a7,a5
    11ae:	983e                	add	a6,a6,a5
    11b0:	953e                	add	a0,a0,a5
    11b2:	95be                	add	a1,a1,a5
    11b4:	96be                	add	a3,a3,a5
    11b6:	03c75393          	srli	t2,a4,0x3c
    11ba:	01c75b9b          	srliw	s7,a4,0x1c
    11be:	03cfdf93          	srli	t6,t6,0x3c
    11c2:	03cede93          	srli	t4,t4,0x3c
    11c6:	03c35313          	srli	t1,t1,0x3c
    11ca:	9271                	srli	a2,a2,0x3c
    11cc:	0002c403          	lbu	s0,0(t0)
    11d0:	93be                	add	t2,t2,a5
    11d2:	000f4283          	lbu	t0,0(t5)
    11d6:	9fbe                	add	t6,t6,a5
    11d8:	000e4f03          	lbu	t5,0(t3)
    11dc:	9ebe                	add	t4,t4,a5
    11de:	0008ce03          	lbu	t3,0(a7)
    11e2:	933e                	add	t1,t1,a5
    11e4:	00084883          	lbu	a7,0(a6)
    11e8:	9bbe                	add	s7,s7,a5
    11ea:	00054803          	lbu	a6,0(a0)
    11ee:	963e                	add	a2,a2,a5
    11f0:	0005c503          	lbu	a0,0(a1)
    11f4:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    11f8:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    11fc:	0003c903          	lbu	s2,0(t2)
    1200:	00064603          	lbu	a2,0(a2)
    1204:	000fc383          	lbu	t2,0(t6)
    1208:	8b3d                	andi	a4,a4,15
    120a:	000ecf83          	lbu	t6,0(t4)
    120e:	92f1                	srli	a3,a3,0x3c
    1210:	00034e83          	lbu	t4,0(t1)
    1214:	000bc303          	lbu	t1,0(s7)
    1218:	96be                	add	a3,a3,a5
    121a:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    121c:	7761                	lui	a4,0xffff8
    121e:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1222:	00710623          	sb	t2,12(sp)
    1226:	005106a3          	sb	t0,13(sp)
    122a:	01f10723          	sb	t6,14(sp)
    122e:	01e107a3          	sb	t5,15(sp)
    1232:	01d10823          	sb	t4,16(sp)
    1236:	01c108a3          	sb	t3,17(sp)
    123a:	00610923          	sb	t1,18(sp)
    123e:	011109a3          	sb	a7,19(sp)
    1242:	01010a23          	sb	a6,20(sp)
    1246:	00a10aa3          	sb	a0,21(sp)
    124a:	00b10b23          	sb	a1,22(sp)
    124e:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    1252:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1256:	01210523          	sb	s2,10(sp)
    125a:	008105a3          	sb	s0,11(sp)
    125e:	0006c703          	lbu	a4,0(a3)
    1262:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1266:	4649                	li	a2,18
    1268:	002c                	addi	a1,sp,8
    126a:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    126c:	00e10c23          	sb	a4,24(sp)
    1270:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1274:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1278:	313000ef          	jal	ra,1d8a <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    127c:	00248513          	addi	a0,s1,2
    1280:	bda5                	j	10f8 <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1282:	00064783          	lbu	a5,0(a2)
    1286:	84b2                	mv	s1,a2
    1288:	01278963          	beq	a5,s2,129a <printf+0x1e4>
    128c:	b561                	j	1114 <printf+0x5e>
    128e:	0024c783          	lbu	a5,2(s1)
    1292:	0605                	addi	a2,a2,1
    1294:	0489                	addi	s1,s1,2
    1296:	e7279fe3          	bne	a5,s2,1114 <printf+0x5e>
    129a:	0014c783          	lbu	a5,1(s1)
    129e:	ff2788e3          	beq	a5,s2,128e <printf+0x1d8>
        l = z - a;
    12a2:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    12a6:	85aa                	mv	a1,a0
    12a8:	8622                	mv	a2,s0
    12aa:	4505                	li	a0,1
    12ac:	2df000ef          	jal	ra,1d8a <write>
        if (l)
    12b0:	e6040be3          	beqz	s0,1126 <printf+0x70>
    12b4:	8526                	mv	a0,s1
        if (!*s)
    12b6:	00054783          	lbu	a5,0(a0)
    12ba:	e40795e3          	bnez	a5,1104 <printf+0x4e>
    }
    va_end(ap);
    12be:	70e6                	ld	ra,120(sp)
    12c0:	7446                	ld	s0,112(sp)
    12c2:	74a6                	ld	s1,104(sp)
    12c4:	7906                	ld	s2,96(sp)
    12c6:	69e6                	ld	s3,88(sp)
    12c8:	6a46                	ld	s4,80(sp)
    12ca:	6aa6                	ld	s5,72(sp)
    12cc:	6b06                	ld	s6,64(sp)
    12ce:	7be2                	ld	s7,56(sp)
    12d0:	6129                	addi	sp,sp,192
    12d2:	8082                	ret
        switch (s[1])
    12d4:	07800713          	li	a4,120
    12d8:	24e79363          	bne	a5,a4,151e <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    12dc:	6782                	ld	a5,0(sp)
    12de:	4394                	lw	a3,0(a5)
    12e0:	07a1                	addi	a5,a5,8
    12e2:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    12e4:	2606c263          	bltz	a3,1548 <printf+0x492>
        buf[i--] = digits[x % base];
    12e8:	00001797          	auipc	a5,0x1
    12ec:	ca078793          	addi	a5,a5,-864 # 1f88 <digits>
    12f0:	00f6f713          	andi	a4,a3,15
    12f4:	973e                	add	a4,a4,a5
    12f6:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff6078>
    buf[16] = 0;
    12fa:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    12fe:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    1300:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1304:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    1308:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    130c:	0046d51b          	srliw	a0,a3,0x4
    1310:	0ad5d563          	bge	a1,a3,13ba <printf+0x304>
        buf[i--] = digits[x % base];
    1314:	8a3d                	andi	a2,a2,15
    1316:	963e                	add	a2,a2,a5
    1318:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    131c:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    1320:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1324:	30a5fe63          	bgeu	a1,a0,1640 <printf+0x58a>
        buf[i--] = digits[x % base];
    1328:	00f77613          	andi	a2,a4,15
    132c:	963e                	add	a2,a2,a5
    132e:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1332:	45bd                	li	a1,15
    1334:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    1338:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    133c:	00475513          	srli	a0,a4,0x4
    1340:	30e5f963          	bgeu	a1,a4,1652 <printf+0x59c>
        buf[i--] = digits[x % base];
    1344:	8a3d                	andi	a2,a2,15
    1346:	963e                	add	a2,a2,a5
    1348:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    134c:	00875893          	srli	a7,a4,0x8
    1350:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    1354:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    1358:	30a5fd63          	bgeu	a1,a0,1672 <printf+0x5bc>
        buf[i--] = digits[x % base];
    135c:	8a3d                	andi	a2,a2,15
    135e:	963e                	add	a2,a2,a5
    1360:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    1364:	00c75813          	srli	a6,a4,0xc
    1368:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    136c:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    1370:	3315fe63          	bgeu	a1,a7,16ac <printf+0x5f6>
        buf[i--] = digits[x % base];
    1374:	8a3d                	andi	a2,a2,15
    1376:	963e                	add	a2,a2,a5
    1378:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    137c:	01075893          	srli	a7,a4,0x10
    1380:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    1384:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    1388:	3305ff63          	bgeu	a1,a6,16c6 <printf+0x610>
        buf[i--] = digits[x % base];
    138c:	8a3d                	andi	a2,a2,15
    138e:	963e                	add	a2,a2,a5
    1390:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1394:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    1398:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    139c:	3515f863          	bgeu	a1,a7,16ec <printf+0x636>
        buf[i--] = digits[x % base];
    13a0:	97ba                	add	a5,a5,a4
    13a2:	0007c783          	lbu	a5,0(a5)
    13a6:	45a1                	li	a1,8
    13a8:	00f10823          	sb	a5,16(sp)
    if (sign)
    13ac:	0006d763          	bgez	a3,13ba <printf+0x304>
        buf[i--] = '-';
    13b0:	02d00793          	li	a5,45
    13b4:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    13b8:	459d                	li	a1,7
    write(f, s, l);
    13ba:	4641                	li	a2,16
    13bc:	003c                	addi	a5,sp,8
    13be:	9e0d                	subw	a2,a2,a1
    13c0:	4505                	li	a0,1
    13c2:	95be                	add	a1,a1,a5
    13c4:	1c7000ef          	jal	ra,1d8a <write>
        s += 2;
    13c8:	00248513          	addi	a0,s1,2
    13cc:	b335                	j	10f8 <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    13ce:	6782                	ld	a5,0(sp)
    13d0:	6380                	ld	s0,0(a5)
    13d2:	07a1                	addi	a5,a5,8
    13d4:	e03e                	sd	a5,0(sp)
    13d6:	22040a63          	beqz	s0,160a <printf+0x554>
            l = strnlen(a, 200);
    13da:	0c800593          	li	a1,200
    13de:	8522                	mv	a0,s0
    13e0:	6cc000ef          	jal	ra,1aac <strnlen>
    write(f, s, l);
    13e4:	0005061b          	sext.w	a2,a0
    13e8:	85a2                	mv	a1,s0
    13ea:	4505                	li	a0,1
    13ec:	19f000ef          	jal	ra,1d8a <write>
        s += 2;
    13f0:	00248513          	addi	a0,s1,2
    13f4:	b311                	j	10f8 <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    13f6:	6782                	ld	a5,0(sp)
    13f8:	4390                	lw	a2,0(a5)
    13fa:	07a1                	addi	a5,a5,8
    13fc:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    13fe:	1a064363          	bltz	a2,15a4 <printf+0x4ee>
        buf[i--] = digits[x % base];
    1402:	46a9                	li	a3,10
    1404:	02d6773b          	remuw	a4,a2,a3
    1408:	00001797          	auipc	a5,0x1
    140c:	b8078793          	addi	a5,a5,-1152 # 1f88 <digits>
    buf[16] = 0;
    1410:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1414:	4525                	li	a0,9
        x = xx;
    1416:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    141a:	973e                	add	a4,a4,a5
    141c:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    1420:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    1424:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1428:	2cc55063          	bge	a0,a2,16e8 <printf+0x632>
    142c:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1430:	02d5f73b          	remuw	a4,a1,a3
    1434:	1702                	slli	a4,a4,0x20
    1436:	9301                	srli	a4,a4,0x20
    1438:	973e                	add	a4,a4,a5
    143a:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    143e:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    1442:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    1446:	1f057d63          	bgeu	a0,a6,1640 <printf+0x58a>
        buf[i--] = digits[x % base];
    144a:	4529                	li	a0,10
    } while ((x /= base) != 0);
    144c:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    144e:	02a5f73b          	remuw	a4,a1,a0
    1452:	973e                	add	a4,a4,a5
    1454:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    1458:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    145c:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    1460:	1ab6f163          	bgeu	a3,a1,1602 <printf+0x54c>
    1464:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    1468:	02a776bb          	remuw	a3,a4,a0
    146c:	96be                	add	a3,a3,a5
    146e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1472:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1476:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    147a:	20b87c63          	bgeu	a6,a1,1692 <printf+0x5dc>
    147e:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    1482:	02a776bb          	remuw	a3,a4,a0
    1486:	96be                	add	a3,a3,a5
    1488:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    148c:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1490:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1494:	20b87363          	bgeu	a6,a1,169a <printf+0x5e4>
        buf[i--] = digits[x % base];
    1498:	02a776bb          	remuw	a3,a4,a0
    149c:	96be                	add	a3,a3,a5
    149e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14a2:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14a6:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    14aa:	20b9f563          	bgeu	s3,a1,16b4 <printf+0x5fe>
        buf[i--] = digits[x % base];
    14ae:	02a776bb          	remuw	a3,a4,a0
    14b2:	96be                	add	a3,a3,a5
    14b4:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14b8:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14bc:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    14c0:	20bafb63          	bgeu	s5,a1,16d6 <printf+0x620>
        buf[i--] = digits[x % base];
    14c4:	02a776bb          	remuw	a3,a4,a0
    14c8:	96be                	add	a3,a3,a5
    14ca:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14ce:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14d2:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    14d6:	1eba7c63          	bgeu	s4,a1,16ce <printf+0x618>
        buf[i--] = digits[x % base];
    14da:	02a776bb          	remuw	a3,a4,a0
    14de:	96be                	add	a3,a3,a5
    14e0:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14e4:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14e8:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    14ec:	14bb7163          	bgeu	s6,a1,162e <printf+0x578>
        buf[i--] = digits[x % base];
    14f0:	1702                	slli	a4,a4,0x20
    14f2:	9301                	srli	a4,a4,0x20
    14f4:	97ba                	add	a5,a5,a4
    14f6:	0007c783          	lbu	a5,0(a5)
    14fa:	4599                	li	a1,6
    14fc:	00f10723          	sb	a5,14(sp)
    if (sign)
    1500:	ea065de3          	bgez	a2,13ba <printf+0x304>
        buf[i--] = '-';
    1504:	02d00793          	li	a5,45
    1508:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    150c:	4595                	li	a1,5
    write(f, s, l);
    150e:	003c                	addi	a5,sp,8
    1510:	4641                	li	a2,16
    1512:	9e0d                	subw	a2,a2,a1
    1514:	4505                	li	a0,1
    1516:	95be                	add	a1,a1,a5
    1518:	073000ef          	jal	ra,1d8a <write>
    151c:	b575                	j	13c8 <printf+0x312>
    char byte = c;
    151e:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1522:	4605                	li	a2,1
    1524:	002c                	addi	a1,sp,8
    1526:	4505                	li	a0,1
    char byte = c;
    1528:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    152c:	05f000ef          	jal	ra,1d8a <write>
    char byte = c;
    1530:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1534:	4605                	li	a2,1
    1536:	002c                	addi	a1,sp,8
    1538:	4505                	li	a0,1
    char byte = c;
    153a:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    153e:	04d000ef          	jal	ra,1d8a <write>
        s += 2;
    1542:	00248513          	addi	a0,s1,2
    1546:	be4d                	j	10f8 <printf+0x42>
        x = -xx;
    1548:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    154c:	00001797          	auipc	a5,0x1
    1550:	a3c78793          	addi	a5,a5,-1476 # 1f88 <digits>
    1554:	00f77613          	andi	a2,a4,15
    1558:	963e                	add	a2,a2,a5
    155a:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    155e:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1562:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    1564:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1568:	0047551b          	srliw	a0,a4,0x4
    156c:	0047561b          	srliw	a2,a4,0x4
    1570:	0ab6d263          	bge	a3,a1,1614 <printf+0x55e>
        buf[i--] = digits[x % base];
    1574:	8a3d                	andi	a2,a2,15
    1576:	963e                	add	a2,a2,a5
    1578:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    157c:	463d                	li	a2,15
    157e:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    1582:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    1586:	daa661e3          	bltu	a2,a0,1328 <printf+0x272>
        buf[i--] = '-';
    158a:	02d00793          	li	a5,45
    158e:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1592:	45b5                	li	a1,13
    write(f, s, l);
    1594:	003c                	addi	a5,sp,8
    1596:	4641                	li	a2,16
    1598:	9e0d                	subw	a2,a2,a1
    159a:	4505                	li	a0,1
    159c:	95be                	add	a1,a1,a5
    159e:	7ec000ef          	jal	ra,1d8a <write>
    15a2:	b51d                	j	13c8 <printf+0x312>
        x = -xx;
    15a4:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    15a8:	46a9                	li	a3,10
    15aa:	02d875bb          	remuw	a1,a6,a3
    15ae:	00001797          	auipc	a5,0x1
    15b2:	9da78793          	addi	a5,a5,-1574 # 1f88 <digits>
    buf[16] = 0;
    15b6:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    15ba:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    15bc:	95be                	add	a1,a1,a5
    15be:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    15c2:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    15c6:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    15ca:	04a65563          	bge	a2,a0,1614 <printf+0x55e>
    15ce:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    15d2:	02d775bb          	remuw	a1,a4,a3
    15d6:	95be                	add	a1,a1,a5
    15d8:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    15dc:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    15e0:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    15e4:	fb0573e3          	bgeu	a0,a6,158a <printf+0x4d4>
        buf[i--] = digits[x % base];
    15e8:	4529                	li	a0,10
    } while ((x /= base) != 0);
    15ea:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    15ec:	02a5f73b          	remuw	a4,a1,a0
    15f0:	973e                	add	a4,a4,a5
    15f2:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    15f6:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    15fa:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    15fe:	e6b6e3e3          	bltu	a3,a1,1464 <printf+0x3ae>
        buf[i--] = digits[x % base];
    1602:	45b5                	li	a1,13
    if (sign)
    1604:	da065be3          	bgez	a2,13ba <printf+0x304>
    1608:	a881                	j	1658 <printf+0x5a2>
                a = "(null)";
    160a:	00001417          	auipc	s0,0x1
    160e:	95e40413          	addi	s0,s0,-1698 # 1f68 <unlink+0x38>
    1612:	b3e1                	j	13da <printf+0x324>
        buf[i--] = '-';
    1614:	02d00793          	li	a5,45
    1618:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    161c:	45b9                	li	a1,14
    write(f, s, l);
    161e:	003c                	addi	a5,sp,8
    1620:	4641                	li	a2,16
    1622:	9e0d                	subw	a2,a2,a1
    1624:	4505                	li	a0,1
    1626:	95be                	add	a1,a1,a5
    1628:	762000ef          	jal	ra,1d8a <write>
    162c:	bb71                	j	13c8 <printf+0x312>
        buf[i--] = digits[x % base];
    162e:	459d                	li	a1,7
    if (sign)
    1630:	d80655e3          	bgez	a2,13ba <printf+0x304>
        buf[i--] = '-';
    1634:	02d00793          	li	a5,45
    1638:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    163c:	4599                	li	a1,6
    163e:	bbb5                	j	13ba <printf+0x304>
    1640:	45b9                	li	a1,14
    write(f, s, l);
    1642:	003c                	addi	a5,sp,8
    1644:	4641                	li	a2,16
    1646:	9e0d                	subw	a2,a2,a1
    1648:	4505                	li	a0,1
    164a:	95be                	add	a1,a1,a5
    164c:	73e000ef          	jal	ra,1d8a <write>
    1650:	bba5                	j	13c8 <printf+0x312>
        buf[i--] = digits[x % base];
    1652:	45b5                	li	a1,13
    if (sign)
    1654:	d606d3e3          	bgez	a3,13ba <printf+0x304>
        buf[i--] = '-';
    1658:	02d00793          	li	a5,45
    165c:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1660:	45b1                	li	a1,12
    write(f, s, l);
    1662:	003c                	addi	a5,sp,8
    1664:	4641                	li	a2,16
    1666:	9e0d                	subw	a2,a2,a1
    1668:	4505                	li	a0,1
    166a:	95be                	add	a1,a1,a5
    166c:	71e000ef          	jal	ra,1d8a <write>
    1670:	bba1                	j	13c8 <printf+0x312>
        buf[i--] = digits[x % base];
    1672:	45b1                	li	a1,12
    if (sign)
    1674:	d406d3e3          	bgez	a3,13ba <printf+0x304>
        buf[i--] = '-';
    1678:	02d00793          	li	a5,45
    167c:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1680:	45ad                	li	a1,11
    write(f, s, l);
    1682:	003c                	addi	a5,sp,8
    1684:	4641                	li	a2,16
    1686:	9e0d                	subw	a2,a2,a1
    1688:	4505                	li	a0,1
    168a:	95be                	add	a1,a1,a5
    168c:	6fe000ef          	jal	ra,1d8a <write>
    1690:	bb25                	j	13c8 <printf+0x312>
        buf[i--] = digits[x % base];
    1692:	45b1                	li	a1,12
    if (sign)
    1694:	d20653e3          	bgez	a2,13ba <printf+0x304>
    1698:	b7c5                	j	1678 <printf+0x5c2>
        buf[i--] = digits[x % base];
    169a:	45ad                	li	a1,11
    if (sign)
    169c:	d0065fe3          	bgez	a2,13ba <printf+0x304>
        buf[i--] = '-';
    16a0:	02d00793          	li	a5,45
    16a4:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    16a8:	45a9                	li	a1,10
    16aa:	bb01                	j	13ba <printf+0x304>
    16ac:	45ad                	li	a1,11
    if (sign)
    16ae:	d006d6e3          	bgez	a3,13ba <printf+0x304>
    16b2:	b7fd                	j	16a0 <printf+0x5ea>
        buf[i--] = digits[x % base];
    16b4:	45a9                	li	a1,10
    if (sign)
    16b6:	d00652e3          	bgez	a2,13ba <printf+0x304>
        buf[i--] = '-';
    16ba:	02d00793          	li	a5,45
    16be:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    16c2:	45a5                	li	a1,9
    16c4:	b9dd                	j	13ba <printf+0x304>
    16c6:	45a9                	li	a1,10
    if (sign)
    16c8:	ce06d9e3          	bgez	a3,13ba <printf+0x304>
    16cc:	b7fd                	j	16ba <printf+0x604>
        buf[i--] = digits[x % base];
    16ce:	45a1                	li	a1,8
    if (sign)
    16d0:	ce0655e3          	bgez	a2,13ba <printf+0x304>
    16d4:	b9f1                	j	13b0 <printf+0x2fa>
        buf[i--] = digits[x % base];
    16d6:	45a5                	li	a1,9
    if (sign)
    16d8:	ce0651e3          	bgez	a2,13ba <printf+0x304>
        buf[i--] = '-';
    16dc:	02d00793          	li	a5,45
    16e0:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    16e4:	45a1                	li	a1,8
    16e6:	b9d1                	j	13ba <printf+0x304>
    i = 15;
    16e8:	45bd                	li	a1,15
    16ea:	b9c1                	j	13ba <printf+0x304>
        buf[i--] = digits[x % base];
    16ec:	45a5                	li	a1,9
    if (sign)
    16ee:	cc06d6e3          	bgez	a3,13ba <printf+0x304>
    16f2:	b7ed                	j	16dc <printf+0x626>

00000000000016f4 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    16f4:	02000793          	li	a5,32
    16f8:	00f50663          	beq	a0,a5,1704 <isspace+0x10>
    16fc:	355d                	addiw	a0,a0,-9
    16fe:	00553513          	sltiu	a0,a0,5
    1702:	8082                	ret
    1704:	4505                	li	a0,1
}
    1706:	8082                	ret

0000000000001708 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1708:	fd05051b          	addiw	a0,a0,-48
}
    170c:	00a53513          	sltiu	a0,a0,10
    1710:	8082                	ret

0000000000001712 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1712:	02000613          	li	a2,32
    1716:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1718:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    171c:	ff77069b          	addiw	a3,a4,-9
    1720:	04c70d63          	beq	a4,a2,177a <atoi+0x68>
    1724:	0007079b          	sext.w	a5,a4
    1728:	04d5f963          	bgeu	a1,a3,177a <atoi+0x68>
        s++;
    switch (*s)
    172c:	02b00693          	li	a3,43
    1730:	04d70a63          	beq	a4,a3,1784 <atoi+0x72>
    1734:	02d00693          	li	a3,45
    1738:	06d70463          	beq	a4,a3,17a0 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    173c:	fd07859b          	addiw	a1,a5,-48
    1740:	4625                	li	a2,9
    1742:	873e                	mv	a4,a5
    1744:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1746:	4e01                	li	t3,0
    while (isdigit(*s))
    1748:	04b66a63          	bltu	a2,a1,179c <atoi+0x8a>
    int n = 0, neg = 0;
    174c:	4501                	li	a0,0
    while (isdigit(*s))
    174e:	4825                	li	a6,9
    1750:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1754:	0025179b          	slliw	a5,a0,0x2
    1758:	9d3d                	addw	a0,a0,a5
    175a:	fd07031b          	addiw	t1,a4,-48
    175e:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1762:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1766:	0685                	addi	a3,a3,1
    1768:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    176c:	0006071b          	sext.w	a4,a2
    1770:	feb870e3          	bgeu	a6,a1,1750 <atoi+0x3e>
    return neg ? n : -n;
    1774:	000e0563          	beqz	t3,177e <atoi+0x6c>
}
    1778:	8082                	ret
        s++;
    177a:	0505                	addi	a0,a0,1
    177c:	bf71                	j	1718 <atoi+0x6>
    177e:	4113053b          	subw	a0,t1,a7
    1782:	8082                	ret
    while (isdigit(*s))
    1784:	00154783          	lbu	a5,1(a0)
    1788:	4625                	li	a2,9
        s++;
    178a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    178e:	fd07859b          	addiw	a1,a5,-48
    1792:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1796:	4e01                	li	t3,0
    while (isdigit(*s))
    1798:	fab67ae3          	bgeu	a2,a1,174c <atoi+0x3a>
    179c:	4501                	li	a0,0
}
    179e:	8082                	ret
    while (isdigit(*s))
    17a0:	00154783          	lbu	a5,1(a0)
    17a4:	4625                	li	a2,9
        s++;
    17a6:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    17aa:	fd07859b          	addiw	a1,a5,-48
    17ae:	0007871b          	sext.w	a4,a5
    17b2:	feb665e3          	bltu	a2,a1,179c <atoi+0x8a>
        neg = 1;
    17b6:	4e05                	li	t3,1
    17b8:	bf51                	j	174c <atoi+0x3a>

00000000000017ba <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ba:	16060d63          	beqz	a2,1934 <memset+0x17a>
    17be:	40a007b3          	neg	a5,a0
    17c2:	8b9d                	andi	a5,a5,7
    17c4:	00778713          	addi	a4,a5,7
    17c8:	482d                	li	a6,11
    17ca:	0ff5f593          	andi	a1,a1,255
    17ce:	fff60693          	addi	a3,a2,-1
    17d2:	17076263          	bltu	a4,a6,1936 <memset+0x17c>
    17d6:	16e6ea63          	bltu	a3,a4,194a <memset+0x190>
    17da:	16078563          	beqz	a5,1944 <memset+0x18a>
    17de:	00b50023          	sb	a1,0(a0)
    17e2:	4705                	li	a4,1
    17e4:	00150e93          	addi	t4,a0,1
    17e8:	14e78c63          	beq	a5,a4,1940 <memset+0x186>
    17ec:	00b500a3          	sb	a1,1(a0)
    17f0:	4709                	li	a4,2
    17f2:	00250e93          	addi	t4,a0,2
    17f6:	14e78d63          	beq	a5,a4,1950 <memset+0x196>
    17fa:	00b50123          	sb	a1,2(a0)
    17fe:	470d                	li	a4,3
    1800:	00350e93          	addi	t4,a0,3
    1804:	12e78b63          	beq	a5,a4,193a <memset+0x180>
    1808:	00b501a3          	sb	a1,3(a0)
    180c:	4711                	li	a4,4
    180e:	00450e93          	addi	t4,a0,4
    1812:	14e78163          	beq	a5,a4,1954 <memset+0x19a>
    1816:	00b50223          	sb	a1,4(a0)
    181a:	4715                	li	a4,5
    181c:	00550e93          	addi	t4,a0,5
    1820:	12e78c63          	beq	a5,a4,1958 <memset+0x19e>
    1824:	00b502a3          	sb	a1,5(a0)
    1828:	471d                	li	a4,7
    182a:	00650e93          	addi	t4,a0,6
    182e:	12e79763          	bne	a5,a4,195c <memset+0x1a2>
    1832:	00750e93          	addi	t4,a0,7
    1836:	00b50323          	sb	a1,6(a0)
    183a:	4f1d                	li	t5,7
    183c:	00859713          	slli	a4,a1,0x8
    1840:	8f4d                	or	a4,a4,a1
    1842:	01059e13          	slli	t3,a1,0x10
    1846:	01c76e33          	or	t3,a4,t3
    184a:	01859313          	slli	t1,a1,0x18
    184e:	006e6333          	or	t1,t3,t1
    1852:	02059893          	slli	a7,a1,0x20
    1856:	011368b3          	or	a7,t1,a7
    185a:	02859813          	slli	a6,a1,0x28
    185e:	40f60333          	sub	t1,a2,a5
    1862:	0108e833          	or	a6,a7,a6
    1866:	03059693          	slli	a3,a1,0x30
    186a:	00d866b3          	or	a3,a6,a3
    186e:	03859713          	slli	a4,a1,0x38
    1872:	97aa                	add	a5,a5,a0
    1874:	ff837813          	andi	a6,t1,-8
    1878:	8f55                	or	a4,a4,a3
    187a:	00f806b3          	add	a3,a6,a5
    187e:	e398                	sd	a4,0(a5)
    1880:	07a1                	addi	a5,a5,8
    1882:	fed79ee3          	bne	a5,a3,187e <memset+0xc4>
    1886:	ff837693          	andi	a3,t1,-8
    188a:	00de87b3          	add	a5,t4,a3
    188e:	01e6873b          	addw	a4,a3,t5
    1892:	0ad30663          	beq	t1,a3,193e <memset+0x184>
    1896:	00b78023          	sb	a1,0(a5)
    189a:	0017069b          	addiw	a3,a4,1
    189e:	08c6fb63          	bgeu	a3,a2,1934 <memset+0x17a>
    18a2:	00b780a3          	sb	a1,1(a5)
    18a6:	0027069b          	addiw	a3,a4,2
    18aa:	08c6f563          	bgeu	a3,a2,1934 <memset+0x17a>
    18ae:	00b78123          	sb	a1,2(a5)
    18b2:	0037069b          	addiw	a3,a4,3
    18b6:	06c6ff63          	bgeu	a3,a2,1934 <memset+0x17a>
    18ba:	00b781a3          	sb	a1,3(a5)
    18be:	0047069b          	addiw	a3,a4,4
    18c2:	06c6f963          	bgeu	a3,a2,1934 <memset+0x17a>
    18c6:	00b78223          	sb	a1,4(a5)
    18ca:	0057069b          	addiw	a3,a4,5
    18ce:	06c6f363          	bgeu	a3,a2,1934 <memset+0x17a>
    18d2:	00b782a3          	sb	a1,5(a5)
    18d6:	0067069b          	addiw	a3,a4,6
    18da:	04c6fd63          	bgeu	a3,a2,1934 <memset+0x17a>
    18de:	00b78323          	sb	a1,6(a5)
    18e2:	0077069b          	addiw	a3,a4,7
    18e6:	04c6f763          	bgeu	a3,a2,1934 <memset+0x17a>
    18ea:	00b783a3          	sb	a1,7(a5)
    18ee:	0087069b          	addiw	a3,a4,8
    18f2:	04c6f163          	bgeu	a3,a2,1934 <memset+0x17a>
    18f6:	00b78423          	sb	a1,8(a5)
    18fa:	0097069b          	addiw	a3,a4,9
    18fe:	02c6fb63          	bgeu	a3,a2,1934 <memset+0x17a>
    1902:	00b784a3          	sb	a1,9(a5)
    1906:	00a7069b          	addiw	a3,a4,10
    190a:	02c6f563          	bgeu	a3,a2,1934 <memset+0x17a>
    190e:	00b78523          	sb	a1,10(a5)
    1912:	00b7069b          	addiw	a3,a4,11
    1916:	00c6ff63          	bgeu	a3,a2,1934 <memset+0x17a>
    191a:	00b785a3          	sb	a1,11(a5)
    191e:	00c7069b          	addiw	a3,a4,12
    1922:	00c6f963          	bgeu	a3,a2,1934 <memset+0x17a>
    1926:	00b78623          	sb	a1,12(a5)
    192a:	2735                	addiw	a4,a4,13
    192c:	00c77463          	bgeu	a4,a2,1934 <memset+0x17a>
    1930:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1934:	8082                	ret
    1936:	472d                	li	a4,11
    1938:	bd79                	j	17d6 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    193a:	4f0d                	li	t5,3
    193c:	b701                	j	183c <memset+0x82>
    193e:	8082                	ret
    1940:	4f05                	li	t5,1
    1942:	bded                	j	183c <memset+0x82>
    1944:	8eaa                	mv	t4,a0
    1946:	4f01                	li	t5,0
    1948:	bdd5                	j	183c <memset+0x82>
    194a:	87aa                	mv	a5,a0
    194c:	4701                	li	a4,0
    194e:	b7a1                	j	1896 <memset+0xdc>
    1950:	4f09                	li	t5,2
    1952:	b5ed                	j	183c <memset+0x82>
    1954:	4f11                	li	t5,4
    1956:	b5dd                	j	183c <memset+0x82>
    1958:	4f15                	li	t5,5
    195a:	b5cd                	j	183c <memset+0x82>
    195c:	4f19                	li	t5,6
    195e:	bdf9                	j	183c <memset+0x82>

0000000000001960 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1960:	00054783          	lbu	a5,0(a0)
    1964:	0005c703          	lbu	a4,0(a1)
    1968:	00e79863          	bne	a5,a4,1978 <strcmp+0x18>
    196c:	0505                	addi	a0,a0,1
    196e:	0585                	addi	a1,a1,1
    1970:	fbe5                	bnez	a5,1960 <strcmp>
    1972:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1974:	9d19                	subw	a0,a0,a4
    1976:	8082                	ret
    1978:	0007851b          	sext.w	a0,a5
    197c:	bfe5                	j	1974 <strcmp+0x14>

000000000000197e <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    197e:	ce05                	beqz	a2,19b6 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1980:	00054703          	lbu	a4,0(a0)
    1984:	0005c783          	lbu	a5,0(a1)
    1988:	cb0d                	beqz	a4,19ba <strncmp+0x3c>
    if (!n--)
    198a:	167d                	addi	a2,a2,-1
    198c:	00c506b3          	add	a3,a0,a2
    1990:	a819                	j	19a6 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1992:	00a68e63          	beq	a3,a0,19ae <strncmp+0x30>
    1996:	0505                	addi	a0,a0,1
    1998:	00e79b63          	bne	a5,a4,19ae <strncmp+0x30>
    199c:	00054703          	lbu	a4,0(a0)
    19a0:	0005c783          	lbu	a5,0(a1)
    19a4:	cb19                	beqz	a4,19ba <strncmp+0x3c>
    19a6:	0005c783          	lbu	a5,0(a1)
    19aa:	0585                	addi	a1,a1,1
    19ac:	f3fd                	bnez	a5,1992 <strncmp+0x14>
        ;
    return *l - *r;
    19ae:	0007051b          	sext.w	a0,a4
    19b2:	9d1d                	subw	a0,a0,a5
    19b4:	8082                	ret
        return 0;
    19b6:	4501                	li	a0,0
}
    19b8:	8082                	ret
    19ba:	4501                	li	a0,0
    return *l - *r;
    19bc:	9d1d                	subw	a0,a0,a5
    19be:	8082                	ret

00000000000019c0 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    19c0:	00757793          	andi	a5,a0,7
    19c4:	cf89                	beqz	a5,19de <strlen+0x1e>
    19c6:	87aa                	mv	a5,a0
    19c8:	a029                	j	19d2 <strlen+0x12>
    19ca:	0785                	addi	a5,a5,1
    19cc:	0077f713          	andi	a4,a5,7
    19d0:	cb01                	beqz	a4,19e0 <strlen+0x20>
        if (!*s)
    19d2:	0007c703          	lbu	a4,0(a5)
    19d6:	fb75                	bnez	a4,19ca <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    19d8:	40a78533          	sub	a0,a5,a0
}
    19dc:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    19de:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    19e0:	6394                	ld	a3,0(a5)
    19e2:	00000597          	auipc	a1,0x0
    19e6:	58e5b583          	ld	a1,1422(a1) # 1f70 <unlink+0x40>
    19ea:	00000617          	auipc	a2,0x0
    19ee:	58e63603          	ld	a2,1422(a2) # 1f78 <unlink+0x48>
    19f2:	a019                	j	19f8 <strlen+0x38>
    19f4:	6794                	ld	a3,8(a5)
    19f6:	07a1                	addi	a5,a5,8
    19f8:	00b68733          	add	a4,a3,a1
    19fc:	fff6c693          	not	a3,a3
    1a00:	8f75                	and	a4,a4,a3
    1a02:	8f71                	and	a4,a4,a2
    1a04:	db65                	beqz	a4,19f4 <strlen+0x34>
    for (; *s; s++)
    1a06:	0007c703          	lbu	a4,0(a5)
    1a0a:	d779                	beqz	a4,19d8 <strlen+0x18>
    1a0c:	0017c703          	lbu	a4,1(a5)
    1a10:	0785                	addi	a5,a5,1
    1a12:	d379                	beqz	a4,19d8 <strlen+0x18>
    1a14:	0017c703          	lbu	a4,1(a5)
    1a18:	0785                	addi	a5,a5,1
    1a1a:	fb6d                	bnez	a4,1a0c <strlen+0x4c>
    1a1c:	bf75                	j	19d8 <strlen+0x18>

0000000000001a1e <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a1e:	00757713          	andi	a4,a0,7
{
    1a22:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1a24:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a28:	cb19                	beqz	a4,1a3e <memchr+0x20>
    1a2a:	ce25                	beqz	a2,1aa2 <memchr+0x84>
    1a2c:	0007c703          	lbu	a4,0(a5)
    1a30:	04b70e63          	beq	a4,a1,1a8c <memchr+0x6e>
    1a34:	0785                	addi	a5,a5,1
    1a36:	0077f713          	andi	a4,a5,7
    1a3a:	167d                	addi	a2,a2,-1
    1a3c:	f77d                	bnez	a4,1a2a <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1a3e:	4501                	li	a0,0
    if (n && *s != c)
    1a40:	c235                	beqz	a2,1aa4 <memchr+0x86>
    1a42:	0007c703          	lbu	a4,0(a5)
    1a46:	04b70363          	beq	a4,a1,1a8c <memchr+0x6e>
        size_t k = ONES * c;
    1a4a:	00000517          	auipc	a0,0x0
    1a4e:	53653503          	ld	a0,1334(a0) # 1f80 <unlink+0x50>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a52:	471d                	li	a4,7
        size_t k = ONES * c;
    1a54:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a58:	02c77a63          	bgeu	a4,a2,1a8c <memchr+0x6e>
    1a5c:	00000897          	auipc	a7,0x0
    1a60:	5148b883          	ld	a7,1300(a7) # 1f70 <unlink+0x40>
    1a64:	00000817          	auipc	a6,0x0
    1a68:	51483803          	ld	a6,1300(a6) # 1f78 <unlink+0x48>
    1a6c:	431d                	li	t1,7
    1a6e:	a029                	j	1a78 <memchr+0x5a>
    1a70:	1661                	addi	a2,a2,-8
    1a72:	07a1                	addi	a5,a5,8
    1a74:	02c37963          	bgeu	t1,a2,1aa6 <memchr+0x88>
    1a78:	6398                	ld	a4,0(a5)
    1a7a:	8f29                	xor	a4,a4,a0
    1a7c:	011706b3          	add	a3,a4,a7
    1a80:	fff74713          	not	a4,a4
    1a84:	8f75                	and	a4,a4,a3
    1a86:	01077733          	and	a4,a4,a6
    1a8a:	d37d                	beqz	a4,1a70 <memchr+0x52>
    1a8c:	853e                	mv	a0,a5
    1a8e:	97b2                	add	a5,a5,a2
    1a90:	a021                	j	1a98 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1a92:	0505                	addi	a0,a0,1
    1a94:	00f50763          	beq	a0,a5,1aa2 <memchr+0x84>
    1a98:	00054703          	lbu	a4,0(a0)
    1a9c:	feb71be3          	bne	a4,a1,1a92 <memchr+0x74>
    1aa0:	8082                	ret
    return n ? (void *)s : 0;
    1aa2:	4501                	li	a0,0
}
    1aa4:	8082                	ret
    return n ? (void *)s : 0;
    1aa6:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1aa8:	f275                	bnez	a2,1a8c <memchr+0x6e>
}
    1aaa:	8082                	ret

0000000000001aac <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1aac:	1101                	addi	sp,sp,-32
    1aae:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1ab0:	862e                	mv	a2,a1
{
    1ab2:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1ab4:	4581                	li	a1,0
{
    1ab6:	e426                	sd	s1,8(sp)
    1ab8:	ec06                	sd	ra,24(sp)
    1aba:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1abc:	f63ff0ef          	jal	ra,1a1e <memchr>
    return p ? p - s : n;
    1ac0:	c519                	beqz	a0,1ace <strnlen+0x22>
}
    1ac2:	60e2                	ld	ra,24(sp)
    1ac4:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1ac6:	8d05                	sub	a0,a0,s1
}
    1ac8:	64a2                	ld	s1,8(sp)
    1aca:	6105                	addi	sp,sp,32
    1acc:	8082                	ret
    1ace:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1ad0:	8522                	mv	a0,s0
}
    1ad2:	6442                	ld	s0,16(sp)
    1ad4:	64a2                	ld	s1,8(sp)
    1ad6:	6105                	addi	sp,sp,32
    1ad8:	8082                	ret

0000000000001ada <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1ada:	00b547b3          	xor	a5,a0,a1
    1ade:	8b9d                	andi	a5,a5,7
    1ae0:	eb95                	bnez	a5,1b14 <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1ae2:	0075f793          	andi	a5,a1,7
    1ae6:	e7b1                	bnez	a5,1b32 <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1ae8:	6198                	ld	a4,0(a1)
    1aea:	00000617          	auipc	a2,0x0
    1aee:	48663603          	ld	a2,1158(a2) # 1f70 <unlink+0x40>
    1af2:	00000817          	auipc	a6,0x0
    1af6:	48683803          	ld	a6,1158(a6) # 1f78 <unlink+0x48>
    1afa:	a029                	j	1b04 <stpcpy+0x2a>
    1afc:	e118                	sd	a4,0(a0)
    1afe:	6598                	ld	a4,8(a1)
    1b00:	05a1                	addi	a1,a1,8
    1b02:	0521                	addi	a0,a0,8
    1b04:	00c707b3          	add	a5,a4,a2
    1b08:	fff74693          	not	a3,a4
    1b0c:	8ff5                	and	a5,a5,a3
    1b0e:	0107f7b3          	and	a5,a5,a6
    1b12:	d7ed                	beqz	a5,1afc <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b14:	0005c783          	lbu	a5,0(a1)
    1b18:	00f50023          	sb	a5,0(a0)
    1b1c:	c785                	beqz	a5,1b44 <stpcpy+0x6a>
    1b1e:	0015c783          	lbu	a5,1(a1)
    1b22:	0505                	addi	a0,a0,1
    1b24:	0585                	addi	a1,a1,1
    1b26:	00f50023          	sb	a5,0(a0)
    1b2a:	fbf5                	bnez	a5,1b1e <stpcpy+0x44>
        ;
    return d;
}
    1b2c:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1b2e:	0505                	addi	a0,a0,1
    1b30:	df45                	beqz	a4,1ae8 <stpcpy+0xe>
            if (!(*d = *s))
    1b32:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1b36:	0585                	addi	a1,a1,1
    1b38:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1b3c:	00f50023          	sb	a5,0(a0)
    1b40:	f7fd                	bnez	a5,1b2e <stpcpy+0x54>
}
    1b42:	8082                	ret
    1b44:	8082                	ret

0000000000001b46 <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b46:	00b547b3          	xor	a5,a0,a1
    1b4a:	8b9d                	andi	a5,a5,7
    1b4c:	1a079863          	bnez	a5,1cfc <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b50:	0075f793          	andi	a5,a1,7
    1b54:	16078463          	beqz	a5,1cbc <stpncpy+0x176>
    1b58:	ea01                	bnez	a2,1b68 <stpncpy+0x22>
    1b5a:	a421                	j	1d62 <stpncpy+0x21c>
    1b5c:	167d                	addi	a2,a2,-1
    1b5e:	0505                	addi	a0,a0,1
    1b60:	14070e63          	beqz	a4,1cbc <stpncpy+0x176>
    1b64:	1a060863          	beqz	a2,1d14 <stpncpy+0x1ce>
    1b68:	0005c783          	lbu	a5,0(a1)
    1b6c:	0585                	addi	a1,a1,1
    1b6e:	0075f713          	andi	a4,a1,7
    1b72:	00f50023          	sb	a5,0(a0)
    1b76:	f3fd                	bnez	a5,1b5c <stpncpy+0x16>
    1b78:	4805                	li	a6,1
    1b7a:	1a061863          	bnez	a2,1d2a <stpncpy+0x1e4>
    1b7e:	40a007b3          	neg	a5,a0
    1b82:	8b9d                	andi	a5,a5,7
    1b84:	4681                	li	a3,0
    1b86:	18061a63          	bnez	a2,1d1a <stpncpy+0x1d4>
    1b8a:	00778713          	addi	a4,a5,7
    1b8e:	45ad                	li	a1,11
    1b90:	18b76363          	bltu	a4,a1,1d16 <stpncpy+0x1d0>
    1b94:	1ae6eb63          	bltu	a3,a4,1d4a <stpncpy+0x204>
    1b98:	1a078363          	beqz	a5,1d3e <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b9c:	00050023          	sb	zero,0(a0)
    1ba0:	4685                	li	a3,1
    1ba2:	00150713          	addi	a4,a0,1
    1ba6:	18d78f63          	beq	a5,a3,1d44 <stpncpy+0x1fe>
    1baa:	000500a3          	sb	zero,1(a0)
    1bae:	4689                	li	a3,2
    1bb0:	00250713          	addi	a4,a0,2
    1bb4:	18d78e63          	beq	a5,a3,1d50 <stpncpy+0x20a>
    1bb8:	00050123          	sb	zero,2(a0)
    1bbc:	468d                	li	a3,3
    1bbe:	00350713          	addi	a4,a0,3
    1bc2:	16d78c63          	beq	a5,a3,1d3a <stpncpy+0x1f4>
    1bc6:	000501a3          	sb	zero,3(a0)
    1bca:	4691                	li	a3,4
    1bcc:	00450713          	addi	a4,a0,4
    1bd0:	18d78263          	beq	a5,a3,1d54 <stpncpy+0x20e>
    1bd4:	00050223          	sb	zero,4(a0)
    1bd8:	4695                	li	a3,5
    1bda:	00550713          	addi	a4,a0,5
    1bde:	16d78d63          	beq	a5,a3,1d58 <stpncpy+0x212>
    1be2:	000502a3          	sb	zero,5(a0)
    1be6:	469d                	li	a3,7
    1be8:	00650713          	addi	a4,a0,6
    1bec:	16d79863          	bne	a5,a3,1d5c <stpncpy+0x216>
    1bf0:	00750713          	addi	a4,a0,7
    1bf4:	00050323          	sb	zero,6(a0)
    1bf8:	40f80833          	sub	a6,a6,a5
    1bfc:	ff887593          	andi	a1,a6,-8
    1c00:	97aa                	add	a5,a5,a0
    1c02:	95be                	add	a1,a1,a5
    1c04:	0007b023          	sd	zero,0(a5)
    1c08:	07a1                	addi	a5,a5,8
    1c0a:	feb79de3          	bne	a5,a1,1c04 <stpncpy+0xbe>
    1c0e:	ff887593          	andi	a1,a6,-8
    1c12:	9ead                	addw	a3,a3,a1
    1c14:	00b707b3          	add	a5,a4,a1
    1c18:	12b80863          	beq	a6,a1,1d48 <stpncpy+0x202>
    1c1c:	00078023          	sb	zero,0(a5)
    1c20:	0016871b          	addiw	a4,a3,1
    1c24:	0ec77863          	bgeu	a4,a2,1d14 <stpncpy+0x1ce>
    1c28:	000780a3          	sb	zero,1(a5)
    1c2c:	0026871b          	addiw	a4,a3,2
    1c30:	0ec77263          	bgeu	a4,a2,1d14 <stpncpy+0x1ce>
    1c34:	00078123          	sb	zero,2(a5)
    1c38:	0036871b          	addiw	a4,a3,3
    1c3c:	0cc77c63          	bgeu	a4,a2,1d14 <stpncpy+0x1ce>
    1c40:	000781a3          	sb	zero,3(a5)
    1c44:	0046871b          	addiw	a4,a3,4
    1c48:	0cc77663          	bgeu	a4,a2,1d14 <stpncpy+0x1ce>
    1c4c:	00078223          	sb	zero,4(a5)
    1c50:	0056871b          	addiw	a4,a3,5
    1c54:	0cc77063          	bgeu	a4,a2,1d14 <stpncpy+0x1ce>
    1c58:	000782a3          	sb	zero,5(a5)
    1c5c:	0066871b          	addiw	a4,a3,6
    1c60:	0ac77a63          	bgeu	a4,a2,1d14 <stpncpy+0x1ce>
    1c64:	00078323          	sb	zero,6(a5)
    1c68:	0076871b          	addiw	a4,a3,7
    1c6c:	0ac77463          	bgeu	a4,a2,1d14 <stpncpy+0x1ce>
    1c70:	000783a3          	sb	zero,7(a5)
    1c74:	0086871b          	addiw	a4,a3,8
    1c78:	08c77e63          	bgeu	a4,a2,1d14 <stpncpy+0x1ce>
    1c7c:	00078423          	sb	zero,8(a5)
    1c80:	0096871b          	addiw	a4,a3,9
    1c84:	08c77863          	bgeu	a4,a2,1d14 <stpncpy+0x1ce>
    1c88:	000784a3          	sb	zero,9(a5)
    1c8c:	00a6871b          	addiw	a4,a3,10
    1c90:	08c77263          	bgeu	a4,a2,1d14 <stpncpy+0x1ce>
    1c94:	00078523          	sb	zero,10(a5)
    1c98:	00b6871b          	addiw	a4,a3,11
    1c9c:	06c77c63          	bgeu	a4,a2,1d14 <stpncpy+0x1ce>
    1ca0:	000785a3          	sb	zero,11(a5)
    1ca4:	00c6871b          	addiw	a4,a3,12
    1ca8:	06c77663          	bgeu	a4,a2,1d14 <stpncpy+0x1ce>
    1cac:	00078623          	sb	zero,12(a5)
    1cb0:	26b5                	addiw	a3,a3,13
    1cb2:	06c6f163          	bgeu	a3,a2,1d14 <stpncpy+0x1ce>
    1cb6:	000786a3          	sb	zero,13(a5)
    1cba:	8082                	ret
            ;
        if (!n || !*s)
    1cbc:	c645                	beqz	a2,1d64 <stpncpy+0x21e>
    1cbe:	0005c783          	lbu	a5,0(a1)
    1cc2:	ea078be3          	beqz	a5,1b78 <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1cc6:	479d                	li	a5,7
    1cc8:	02c7ff63          	bgeu	a5,a2,1d06 <stpncpy+0x1c0>
    1ccc:	00000897          	auipc	a7,0x0
    1cd0:	2a48b883          	ld	a7,676(a7) # 1f70 <unlink+0x40>
    1cd4:	00000817          	auipc	a6,0x0
    1cd8:	2a483803          	ld	a6,676(a6) # 1f78 <unlink+0x48>
    1cdc:	431d                	li	t1,7
    1cde:	6198                	ld	a4,0(a1)
    1ce0:	011707b3          	add	a5,a4,a7
    1ce4:	fff74693          	not	a3,a4
    1ce8:	8ff5                	and	a5,a5,a3
    1cea:	0107f7b3          	and	a5,a5,a6
    1cee:	ef81                	bnez	a5,1d06 <stpncpy+0x1c0>
            *wd = *ws;
    1cf0:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1cf2:	1661                	addi	a2,a2,-8
    1cf4:	05a1                	addi	a1,a1,8
    1cf6:	0521                	addi	a0,a0,8
    1cf8:	fec363e3          	bltu	t1,a2,1cde <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1cfc:	e609                	bnez	a2,1d06 <stpncpy+0x1c0>
    1cfe:	a08d                	j	1d60 <stpncpy+0x21a>
    1d00:	167d                	addi	a2,a2,-1
    1d02:	0505                	addi	a0,a0,1
    1d04:	ca01                	beqz	a2,1d14 <stpncpy+0x1ce>
    1d06:	0005c783          	lbu	a5,0(a1)
    1d0a:	0585                	addi	a1,a1,1
    1d0c:	00f50023          	sb	a5,0(a0)
    1d10:	fbe5                	bnez	a5,1d00 <stpncpy+0x1ba>
        ;
tail:
    1d12:	b59d                	j	1b78 <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1d14:	8082                	ret
    1d16:	472d                	li	a4,11
    1d18:	bdb5                	j	1b94 <stpncpy+0x4e>
    1d1a:	00778713          	addi	a4,a5,7
    1d1e:	45ad                	li	a1,11
    1d20:	fff60693          	addi	a3,a2,-1
    1d24:	e6b778e3          	bgeu	a4,a1,1b94 <stpncpy+0x4e>
    1d28:	b7fd                	j	1d16 <stpncpy+0x1d0>
    1d2a:	40a007b3          	neg	a5,a0
    1d2e:	8832                	mv	a6,a2
    1d30:	8b9d                	andi	a5,a5,7
    1d32:	4681                	li	a3,0
    1d34:	e4060be3          	beqz	a2,1b8a <stpncpy+0x44>
    1d38:	b7cd                	j	1d1a <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d3a:	468d                	li	a3,3
    1d3c:	bd75                	j	1bf8 <stpncpy+0xb2>
    1d3e:	872a                	mv	a4,a0
    1d40:	4681                	li	a3,0
    1d42:	bd5d                	j	1bf8 <stpncpy+0xb2>
    1d44:	4685                	li	a3,1
    1d46:	bd4d                	j	1bf8 <stpncpy+0xb2>
    1d48:	8082                	ret
    1d4a:	87aa                	mv	a5,a0
    1d4c:	4681                	li	a3,0
    1d4e:	b5f9                	j	1c1c <stpncpy+0xd6>
    1d50:	4689                	li	a3,2
    1d52:	b55d                	j	1bf8 <stpncpy+0xb2>
    1d54:	4691                	li	a3,4
    1d56:	b54d                	j	1bf8 <stpncpy+0xb2>
    1d58:	4695                	li	a3,5
    1d5a:	bd79                	j	1bf8 <stpncpy+0xb2>
    1d5c:	4699                	li	a3,6
    1d5e:	bd69                	j	1bf8 <stpncpy+0xb2>
    1d60:	8082                	ret
    1d62:	8082                	ret
    1d64:	8082                	ret

0000000000001d66 <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1d66:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1d6a:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d6c:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1d70:	2501                	sext.w	a0,a0
    1d72:	8082                	ret

0000000000001d74 <close>:
    register long a7 __asm__("a7") = n;
    1d74:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d78:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d7c:	2501                	sext.w	a0,a0
    1d7e:	8082                	ret

0000000000001d80 <read>:
    register long a7 __asm__("a7") = n;
    1d80:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d84:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d88:	8082                	ret

0000000000001d8a <write>:
    register long a7 __asm__("a7") = n;
    1d8a:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d8e:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d92:	8082                	ret

0000000000001d94 <getpid>:
    register long a7 __asm__("a7") = n;
    1d94:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d98:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1d9c:	2501                	sext.w	a0,a0
    1d9e:	8082                	ret

0000000000001da0 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1da0:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1da4:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1da8:	2501                	sext.w	a0,a0
    1daa:	8082                	ret

0000000000001dac <fork>:
    register long a7 __asm__("a7") = n;
    1dac:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1db0:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1db4:	2501                	sext.w	a0,a0
    1db6:	8082                	ret

0000000000001db8 <exit>:
    register long a7 __asm__("a7") = n;
    1db8:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1dbc:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1dc0:	8082                	ret

0000000000001dc2 <waitpid>:
    register long a7 __asm__("a7") = n;
    1dc2:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc6:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <exec>:
    register long a7 __asm__("a7") = n;
    1dce:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1dd2:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <get_time>:

int64 get_time()
{
    1dda:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1ddc:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1de0:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1de2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de4:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1de8:	2501                	sext.w	a0,a0
    1dea:	ed09                	bnez	a0,1e04 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1dec:	67a2                	ld	a5,8(sp)
    1dee:	3e800713          	li	a4,1000
    1df2:	00015503          	lhu	a0,0(sp)
    1df6:	02e7d7b3          	divu	a5,a5,a4
    1dfa:	02e50533          	mul	a0,a0,a4
    1dfe:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e00:	0141                	addi	sp,sp,16
    1e02:	8082                	ret
        return -1;
    1e04:	557d                	li	a0,-1
    1e06:	bfed                	j	1e00 <get_time+0x26>

0000000000001e08 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e08:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e0c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <sleep>:

int sleep(unsigned long long time)
{
    1e14:	1141                	addi	sp,sp,-16
    1e16:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1e18:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e1c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e1e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e20:	00000073          	ecall
    if (err == 0)
    1e24:	2501                	sext.w	a0,a0
    1e26:	e13d                	bnez	a0,1e8c <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e28:	6722                	ld	a4,8(sp)
    1e2a:	3e800693          	li	a3,1000
    1e2e:	00015783          	lhu	a5,0(sp)
    1e32:	02d75733          	divu	a4,a4,a3
    1e36:	02d787b3          	mul	a5,a5,a3
    1e3a:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1e3c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e40:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e42:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e44:	00000073          	ecall
    if (err == 0)
    1e48:	2501                	sext.w	a0,a0
    1e4a:	ed15                	bnez	a0,1e86 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e4c:	6841                	lui	a6,0x10
    1e4e:	963e                	add	a2,a2,a5
    1e50:	187d                	addi	a6,a6,-1
    1e52:	3e800693          	li	a3,1000
    1e56:	a819                	j	1e6c <sleep+0x58>
    __asm_syscall("r"(a7))
    1e58:	00000073          	ecall
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
    1e6a:	ed11                	bnez	a0,1e86 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e6c:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1e6e:	07c00893          	li	a7,124
    1e72:	02d7d733          	divu	a4,a5,a3
    1e76:	6782                	ld	a5,0(sp)
    1e78:	0107f7b3          	and	a5,a5,a6
    1e7c:	02d787b3          	mul	a5,a5,a3
    1e80:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1e82:	fcc7ebe3          	bltu	a5,a2,1e58 <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1e86:	4501                	li	a0,0
    1e88:	0141                	addi	sp,sp,16
    1e8a:	8082                	ret
    1e8c:	57fd                	li	a5,-1
    1e8e:	b77d                	j	1e3c <sleep+0x28>

0000000000001e90 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e90:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e94:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e98:	2501                	sext.w	a0,a0
    1e9a:	8082                	ret

0000000000001e9c <mmap>:
    register long a7 __asm__("a7") = n;
    1e9c:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea0:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1ea4:	2501                	sext.w	a0,a0
    1ea6:	8082                	ret

0000000000001ea8 <munmap>:
    register long a7 __asm__("a7") = n;
    1ea8:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eac:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1eb0:	2501                	sext.w	a0,a0
    1eb2:	8082                	ret

0000000000001eb4 <wait>:

int wait(int *code)
{
    1eb4:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1eb6:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1eba:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ebc:	00000073          	ecall
    return waitpid(-1, code);
}
    1ec0:	2501                	sext.w	a0,a0
    1ec2:	8082                	ret

0000000000001ec4 <spawn>:
    register long a7 __asm__("a7") = n;
    1ec4:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1ec8:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1ecc:	2501                	sext.w	a0,a0
    1ece:	8082                	ret

0000000000001ed0 <mailread>:
    register long a7 __asm__("a7") = n;
    1ed0:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed4:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ed8:	2501                	sext.w	a0,a0
    1eda:	8082                	ret

0000000000001edc <mailwrite>:
    register long a7 __asm__("a7") = n;
    1edc:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ee0:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1ee4:	2501                	sext.w	a0,a0
    1ee6:	8082                	ret

0000000000001ee8 <fstat>:
    register long a7 __asm__("a7") = n;
    1ee8:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eec:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1ef0:	2501                	sext.w	a0,a0
    1ef2:	8082                	ret

0000000000001ef4 <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1ef4:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1ef6:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1efa:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1efc:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f00:	2501                	sext.w	a0,a0
    1f02:	8082                	ret

0000000000001f04 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f04:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f06:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f0a:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f0c:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f10:	2501                	sext.w	a0,a0
    1f12:	8082                	ret

0000000000001f14 <link>:

int link(char *old_path, char *new_path)
{
    1f14:	87aa                	mv	a5,a0
    1f16:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f18:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f1c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f20:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f22:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f26:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f28:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f2c:	2501                	sext.w	a0,a0
    1f2e:	8082                	ret

0000000000001f30 <unlink>:

int unlink(char *path)
{
    1f30:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f32:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f36:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f3a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f3c:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f40:	2501                	sext.w	a0,a0
    1f42:	8082                	ret
