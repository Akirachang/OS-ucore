
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch7_file2:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	17e0006f          	j	1180 <__start_main>

0000000000001006 <main>:
#include <stddef.h>

/// 测试 link/unlink，输出　Test link OK! 就算正确。

int main()
{
    1006:	712d                	addi	sp,sp,-288
    char *fname = "fname2";
    char *lname0 = "linkname0";
    char *lname1 = "linkname1";
    char *lname2 = "linkname2";

    int fd = open(fname, O_CREATE | O_WRONLY);
    1008:	20100593          	li	a1,513
    100c:	00001517          	auipc	a0,0x1
    1010:	09450513          	addi	a0,a0,148 # 20a0 <unlink+0x14>
{
    1014:	ee06                	sd	ra,280(sp)
    1016:	ea22                	sd	s0,272(sp)
    int fd = open(fname, O_CREATE | O_WRONLY);
    1018:	6ab000ef          	jal	ra,1ec2 <open>
    101c:	842a                	mv	s0,a0
    link(fname, lname0);
    101e:	00001597          	auipc	a1,0x1
    1022:	08a58593          	addi	a1,a1,138 # 20a8 <unlink+0x1c>
    1026:	00001517          	auipc	a0,0x1
    102a:	07a50513          	addi	a0,a0,122 # 20a0 <unlink+0x14>
    102e:	042010ef          	jal	ra,2070 <link>
    Stat stat;
    fstat(fd, &stat);
    1032:	002c                	addi	a1,sp,8
    1034:	8522                	mv	a0,s0
    1036:	00e010ef          	jal	ra,2044 <fstat>
    assert(stat.nlink == 2);
    103a:	4772                	lw	a4,28(sp)
    103c:	4789                	li	a5,2
    103e:	00f70563          	beq	a4,a5,1048 <main+0x42>
    1042:	557d                	li	a0,-1
    1044:	6d1000ef          	jal	ra,1f14 <exit>
    link(fname, lname1);
    1048:	00001597          	auipc	a1,0x1
    104c:	07058593          	addi	a1,a1,112 # 20b8 <unlink+0x2c>
    1050:	00001517          	auipc	a0,0x1
    1054:	05050513          	addi	a0,a0,80 # 20a0 <unlink+0x14>
    1058:	018010ef          	jal	ra,2070 <link>
    link(fname, lname2);
    105c:	00001597          	auipc	a1,0x1
    1060:	06c58593          	addi	a1,a1,108 # 20c8 <unlink+0x3c>
    1064:	00001517          	auipc	a0,0x1
    1068:	03c50513          	addi	a0,a0,60 # 20a0 <unlink+0x14>
    106c:	004010ef          	jal	ra,2070 <link>
    fstat(fd, &stat);
    1070:	002c                	addi	a1,sp,8
    1072:	8522                	mv	a0,s0
    1074:	7d1000ef          	jal	ra,2044 <fstat>
    assert(stat.nlink == 4);
    1078:	4772                	lw	a4,28(sp)
    107a:	4791                	li	a5,4
    107c:	00f70563          	beq	a4,a5,1086 <main+0x80>
    1080:	557d                	li	a0,-1
    1082:	693000ef          	jal	ra,1f14 <exit>
    write(fd, test_str, strlen(test_str));
    1086:	00001517          	auipc	a0,0x1
    108a:	05250513          	addi	a0,a0,82 # 20d8 <unlink+0x4c>
    108e:	28f000ef          	jal	ra,1b1c <strlen>
    1092:	862a                	mv	a2,a0
    1094:	00001597          	auipc	a1,0x1
    1098:	04458593          	addi	a1,a1,68 # 20d8 <unlink+0x4c>
    109c:	8522                	mv	a0,s0
    109e:	649000ef          	jal	ra,1ee6 <write>
    close(fd);
    10a2:	8522                	mv	a0,s0
    10a4:	62d000ef          	jal	ra,1ed0 <close>

    unlink(fname);
    10a8:	00001517          	auipc	a0,0x1
    10ac:	ff850513          	addi	a0,a0,-8 # 20a0 <unlink+0x14>
    10b0:	7dd000ef          	jal	ra,208c <unlink>
    fd = open(lname0, O_RDONLY);
    10b4:	4581                	li	a1,0
    10b6:	00001517          	auipc	a0,0x1
    10ba:	ff250513          	addi	a0,a0,-14 # 20a8 <unlink+0x1c>
    10be:	605000ef          	jal	ra,1ec2 <open>
    10c2:	842a                	mv	s0,a0
    Stat stat2;
    char buf[100];
    memset(buf, 0, sizeof(buf));
    10c4:	06400613          	li	a2,100
    10c8:	4581                	li	a1,0
    10ca:	1128                	addi	a0,sp,168
    10cc:	04b000ef          	jal	ra,1916 <memset>
    int read_len = read(fd, &buf, sizeof(buf));
    10d0:	06400613          	li	a2,100
    10d4:	112c                	addi	a1,sp,168
    10d6:	8522                	mv	a0,s0
    10d8:	605000ef          	jal	ra,1edc <read>
    assert(strncmp(test_str, buf, read_len) == 0);
    10dc:	0005061b          	sext.w	a2,a0
    10e0:	112c                	addi	a1,sp,168
    10e2:	00001517          	auipc	a0,0x1
    10e6:	ff650513          	addi	a0,a0,-10 # 20d8 <unlink+0x4c>
    10ea:	1f1000ef          	jal	ra,1ada <strncmp>
    10ee:	e549                	bnez	a0,1178 <main+0x172>
    fstat(fd, &stat2);
    10f0:	08ac                	addi	a1,sp,88
    10f2:	8522                	mv	a0,s0
    10f4:	751000ef          	jal	ra,2044 <fstat>
    assert(stat2.dev == stat.dev);
    10f8:	6766                	ld	a4,88(sp)
    10fa:	67a2                	ld	a5,8(sp)
    10fc:	00f70563          	beq	a4,a5,1106 <main+0x100>
    1100:	557d                	li	a0,-1
    1102:	613000ef          	jal	ra,1f14 <exit>
    assert(stat2.ino == stat.ino);
    1106:	7706                	ld	a4,96(sp)
    1108:	67c2                	ld	a5,16(sp)
    110a:	00f70563          	beq	a4,a5,1114 <main+0x10e>
    110e:	557d                	li	a0,-1
    1110:	605000ef          	jal	ra,1f14 <exit>
    assert(stat2.nlink == 3);
    1114:	5736                	lw	a4,108(sp)
    1116:	478d                	li	a5,3
    1118:	00f70563          	beq	a4,a5,1122 <main+0x11c>
    111c:	557d                	li	a0,-1
    111e:	5f7000ef          	jal	ra,1f14 <exit>
    unlink(lname1);
    1122:	00001517          	auipc	a0,0x1
    1126:	f9650513          	addi	a0,a0,-106 # 20b8 <unlink+0x2c>
    112a:	763000ef          	jal	ra,208c <unlink>
    unlink(lname2);
    112e:	00001517          	auipc	a0,0x1
    1132:	f9a50513          	addi	a0,a0,-102 # 20c8 <unlink+0x3c>
    1136:	757000ef          	jal	ra,208c <unlink>
    fstat(fd, &stat2);
    113a:	08ac                	addi	a1,sp,88
    113c:	8522                	mv	a0,s0
    113e:	707000ef          	jal	ra,2044 <fstat>
    assert(stat2.nlink == 1);
    1142:	5736                	lw	a4,108(sp)
    1144:	4785                	li	a5,1
    1146:	00f70563          	beq	a4,a5,1150 <main+0x14a>
    114a:	557d                	li	a0,-1
    114c:	5c9000ef          	jal	ra,1f14 <exit>
    close(fd);
    1150:	8522                	mv	a0,s0
    1152:	57f000ef          	jal	ra,1ed0 <close>
    unlink(lname0);
    1156:	00001517          	auipc	a0,0x1
    115a:	f5250513          	addi	a0,a0,-174 # 20a8 <unlink+0x1c>
    115e:	72f000ef          	jal	ra,208c <unlink>
    // It's Ok if you don't delete the inode and data blocks.
    puts("Test link OK!");
    1162:	00001517          	auipc	a0,0x1
    1166:	f8650513          	addi	a0,a0,-122 # 20e8 <unlink+0x5c>
    116a:	066000ef          	jal	ra,11d0 <puts>
    return 0;
    116e:	60f2                	ld	ra,280(sp)
    1170:	6452                	ld	s0,272(sp)
    1172:	4501                	li	a0,0
    1174:	6115                	addi	sp,sp,288
    1176:	8082                	ret
    assert(strncmp(test_str, buf, read_len) == 0);
    1178:	557d                	li	a0,-1
    117a:	59b000ef          	jal	ra,1f14 <exit>
    117e:	bf8d                	j	10f0 <main+0xea>

0000000000001180 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1180:	1141                	addi	sp,sp,-16
    1182:	e406                	sd	ra,8(sp)
    exit(main());
    1184:	e83ff0ef          	jal	ra,1006 <main>
    1188:	58d000ef          	jal	ra,1f14 <exit>
    return 0;
}
    118c:	60a2                	ld	ra,8(sp)
    118e:	4501                	li	a0,0
    1190:	0141                	addi	sp,sp,16
    1192:	8082                	ret

0000000000001194 <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    1194:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    1196:	00f10593          	addi	a1,sp,15
    119a:	4605                	li	a2,1
    119c:	4501                	li	a0,0
{
    119e:	ec06                	sd	ra,24(sp)
    char byte = 0;
    11a0:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    11a4:	539000ef          	jal	ra,1edc <read>
    return byte;
}
    11a8:	60e2                	ld	ra,24(sp)
    11aa:	00f14503          	lbu	a0,15(sp)
    11ae:	6105                	addi	sp,sp,32
    11b0:	8082                	ret

00000000000011b2 <putchar>:

int putchar(int c)
{
    11b2:	1101                	addi	sp,sp,-32
    11b4:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    11b6:	00f10593          	addi	a1,sp,15
    11ba:	4605                	li	a2,1
    11bc:	4505                	li	a0,1
{
    11be:	ec06                	sd	ra,24(sp)
    char byte = c;
    11c0:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    11c4:	523000ef          	jal	ra,1ee6 <write>
}
    11c8:	60e2                	ld	ra,24(sp)
    11ca:	2501                	sext.w	a0,a0
    11cc:	6105                	addi	sp,sp,32
    11ce:	8082                	ret

00000000000011d0 <puts>:

int puts(const char *s)
{
    11d0:	1101                	addi	sp,sp,-32
    11d2:	e822                	sd	s0,16(sp)
    11d4:	ec06                	sd	ra,24(sp)
    11d6:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    11d8:	145000ef          	jal	ra,1b1c <strlen>
    11dc:	862a                	mv	a2,a0
    11de:	85a2                	mv	a1,s0
    11e0:	4505                	li	a0,1
    11e2:	505000ef          	jal	ra,1ee6 <write>
    11e6:	00055763          	bgez	a0,11f4 <puts+0x24>
    return r;
}
    11ea:	60e2                	ld	ra,24(sp)
    11ec:	6442                	ld	s0,16(sp)
    11ee:	557d                	li	a0,-1
    11f0:	6105                	addi	sp,sp,32
    11f2:	8082                	ret
    return write(stdout, &byte, 1);
    11f4:	00f10593          	addi	a1,sp,15
    char byte = c;
    11f8:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    11fa:	4605                	li	a2,1
    11fc:	4505                	li	a0,1
    char byte = c;
    11fe:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1202:	4e5000ef          	jal	ra,1ee6 <write>
}
    1206:	60e2                	ld	ra,24(sp)
    1208:	6442                	ld	s0,16(sp)
    120a:	41f5551b          	sraiw	a0,a0,0x1f
    120e:	6105                	addi	sp,sp,32
    1210:	8082                	ret

0000000000001212 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1212:	7131                	addi	sp,sp,-192
    1214:	ecce                	sd	s3,88(sp)
    1216:	e8d2                	sd	s4,80(sp)
    1218:	e4d6                	sd	s5,72(sp)
    121a:	e0da                	sd	s6,64(sp)
    121c:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    121e:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1220:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    1222:	6ae1                	lui	s5,0x18
    1224:	000f4a37          	lui	s4,0xf4
    1228:	00989b37          	lui	s6,0x989
{
    122c:	fc86                	sd	ra,120(sp)
    122e:	f8a2                	sd	s0,112(sp)
    1230:	f4a6                	sd	s1,104(sp)
    1232:	f0ca                	sd	s2,96(sp)
    1234:	fc5e                	sd	s7,56(sp)
    1236:	e52e                	sd	a1,136(sp)
    1238:	e932                	sd	a2,144(sp)
    123a:	ed36                	sd	a3,152(sp)
    123c:	f13a                	sd	a4,160(sp)
    123e:	f942                	sd	a6,176(sp)
    1240:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1242:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    1244:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x5f7>
    1248:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x16587>
    124c:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf2127>
    1250:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x987567>
    for (;;)
    {
        if (!*s)
    1254:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    1258:	02500913          	li	s2,37
        if (!*s)
    125c:	1a078f63          	beqz	a5,141a <printf+0x208>
    1260:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1262:	17278e63          	beq	a5,s2,13de <printf+0x1cc>
    1266:	00164783          	lbu	a5,1(a2)
    126a:	0605                	addi	a2,a2,1
    126c:	fbfd                	bnez	a5,1262 <printf+0x50>
    126e:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    1270:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1274:	85aa                	mv	a1,a0
    1276:	8622                	mv	a2,s0
    1278:	4505                	li	a0,1
    127a:	46d000ef          	jal	ra,1ee6 <write>
        out(f, a, l);
        if (l)
    127e:	18041963          	bnez	s0,1410 <printf+0x1fe>
            continue;
        if (s[1] == 0)
    1282:	0014c783          	lbu	a5,1(s1)
    1286:	18078a63          	beqz	a5,141a <printf+0x208>
            break;
        switch (s[1])
    128a:	07300713          	li	a4,115
    128e:	28e78e63          	beq	a5,a4,152a <printf+0x318>
    1292:	18f76f63          	bltu	a4,a5,1430 <printf+0x21e>
    1296:	06400713          	li	a4,100
    129a:	2ae78c63          	beq	a5,a4,1552 <printf+0x340>
    129e:	07000713          	li	a4,112
    12a2:	3ce79c63          	bne	a5,a4,167a <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    12a6:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12a8:	00001797          	auipc	a5,0x1
    12ac:	e7078793          	addi	a5,a5,-400 # 2118 <digits>
            printptr(va_arg(ap, uint64));
    12b0:	6298                	ld	a4,0(a3)
    12b2:	00868093          	addi	ra,a3,8
    12b6:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    12b8:	00471293          	slli	t0,a4,0x4
    12bc:	00c71f13          	slli	t5,a4,0xc
    12c0:	01471e13          	slli	t3,a4,0x14
    12c4:	01c71893          	slli	a7,a4,0x1c
    12c8:	02471813          	slli	a6,a4,0x24
    12cc:	02871513          	slli	a0,a4,0x28
    12d0:	02c71593          	slli	a1,a4,0x2c
    12d4:	03071693          	slli	a3,a4,0x30
    12d8:	00871f93          	slli	t6,a4,0x8
    12dc:	01071e93          	slli	t4,a4,0x10
    12e0:	01871313          	slli	t1,a4,0x18
    12e4:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12e8:	03c2d293          	srli	t0,t0,0x3c
    12ec:	03cf5f13          	srli	t5,t5,0x3c
    12f0:	03ce5e13          	srli	t3,t3,0x3c
    12f4:	03c8d893          	srli	a7,a7,0x3c
    12f8:	03c85813          	srli	a6,a6,0x3c
    12fc:	9171                	srli	a0,a0,0x3c
    12fe:	91f1                	srli	a1,a1,0x3c
    1300:	92f1                	srli	a3,a3,0x3c
    1302:	92be                	add	t0,t0,a5
    1304:	9f3e                	add	t5,t5,a5
    1306:	9e3e                	add	t3,t3,a5
    1308:	98be                	add	a7,a7,a5
    130a:	983e                	add	a6,a6,a5
    130c:	953e                	add	a0,a0,a5
    130e:	95be                	add	a1,a1,a5
    1310:	96be                	add	a3,a3,a5
    1312:	03c75393          	srli	t2,a4,0x3c
    1316:	01c75b9b          	srliw	s7,a4,0x1c
    131a:	03cfdf93          	srli	t6,t6,0x3c
    131e:	03cede93          	srli	t4,t4,0x3c
    1322:	03c35313          	srli	t1,t1,0x3c
    1326:	9271                	srli	a2,a2,0x3c
    1328:	0002c403          	lbu	s0,0(t0)
    132c:	93be                	add	t2,t2,a5
    132e:	000f4283          	lbu	t0,0(t5)
    1332:	9fbe                	add	t6,t6,a5
    1334:	000e4f03          	lbu	t5,0(t3)
    1338:	9ebe                	add	t4,t4,a5
    133a:	0008ce03          	lbu	t3,0(a7)
    133e:	933e                	add	t1,t1,a5
    1340:	00084883          	lbu	a7,0(a6)
    1344:	9bbe                	add	s7,s7,a5
    1346:	00054803          	lbu	a6,0(a0)
    134a:	963e                	add	a2,a2,a5
    134c:	0005c503          	lbu	a0,0(a1)
    1350:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1354:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1358:	0003c903          	lbu	s2,0(t2)
    135c:	00064603          	lbu	a2,0(a2)
    1360:	000fc383          	lbu	t2,0(t6)
    1364:	8b3d                	andi	a4,a4,15
    1366:	000ecf83          	lbu	t6,0(t4)
    136a:	92f1                	srli	a3,a3,0x3c
    136c:	00034e83          	lbu	t4,0(t1)
    1370:	000bc303          	lbu	t1,0(s7)
    1374:	96be                	add	a3,a3,a5
    1376:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    1378:	7761                	lui	a4,0xffff8
    137a:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    137e:	00710623          	sb	t2,12(sp)
    1382:	005106a3          	sb	t0,13(sp)
    1386:	01f10723          	sb	t6,14(sp)
    138a:	01e107a3          	sb	t5,15(sp)
    138e:	01d10823          	sb	t4,16(sp)
    1392:	01c108a3          	sb	t3,17(sp)
    1396:	00610923          	sb	t1,18(sp)
    139a:	011109a3          	sb	a7,19(sp)
    139e:	01010a23          	sb	a6,20(sp)
    13a2:	00a10aa3          	sb	a0,21(sp)
    13a6:	00b10b23          	sb	a1,22(sp)
    13aa:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    13ae:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13b2:	01210523          	sb	s2,10(sp)
    13b6:	008105a3          	sb	s0,11(sp)
    13ba:	0006c703          	lbu	a4,0(a3)
    13be:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    13c2:	4649                	li	a2,18
    13c4:	002c                	addi	a1,sp,8
    13c6:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13c8:	00e10c23          	sb	a4,24(sp)
    13cc:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    13d0:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    13d4:	313000ef          	jal	ra,1ee6 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    13d8:	00248513          	addi	a0,s1,2
    13dc:	bda5                	j	1254 <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    13de:	00064783          	lbu	a5,0(a2)
    13e2:	84b2                	mv	s1,a2
    13e4:	01278963          	beq	a5,s2,13f6 <printf+0x1e4>
    13e8:	b561                	j	1270 <printf+0x5e>
    13ea:	0024c783          	lbu	a5,2(s1)
    13ee:	0605                	addi	a2,a2,1
    13f0:	0489                	addi	s1,s1,2
    13f2:	e7279fe3          	bne	a5,s2,1270 <printf+0x5e>
    13f6:	0014c783          	lbu	a5,1(s1)
    13fa:	ff2788e3          	beq	a5,s2,13ea <printf+0x1d8>
        l = z - a;
    13fe:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1402:	85aa                	mv	a1,a0
    1404:	8622                	mv	a2,s0
    1406:	4505                	li	a0,1
    1408:	2df000ef          	jal	ra,1ee6 <write>
        if (l)
    140c:	e6040be3          	beqz	s0,1282 <printf+0x70>
    1410:	8526                	mv	a0,s1
        if (!*s)
    1412:	00054783          	lbu	a5,0(a0)
    1416:	e40795e3          	bnez	a5,1260 <printf+0x4e>
    }
    va_end(ap);
    141a:	70e6                	ld	ra,120(sp)
    141c:	7446                	ld	s0,112(sp)
    141e:	74a6                	ld	s1,104(sp)
    1420:	7906                	ld	s2,96(sp)
    1422:	69e6                	ld	s3,88(sp)
    1424:	6a46                	ld	s4,80(sp)
    1426:	6aa6                	ld	s5,72(sp)
    1428:	6b06                	ld	s6,64(sp)
    142a:	7be2                	ld	s7,56(sp)
    142c:	6129                	addi	sp,sp,192
    142e:	8082                	ret
        switch (s[1])
    1430:	07800713          	li	a4,120
    1434:	24e79363          	bne	a5,a4,167a <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    1438:	6782                	ld	a5,0(sp)
    143a:	4394                	lw	a3,0(a5)
    143c:	07a1                	addi	a5,a5,8
    143e:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1440:	2606c263          	bltz	a3,16a4 <printf+0x492>
        buf[i--] = digits[x % base];
    1444:	00001797          	auipc	a5,0x1
    1448:	cd478793          	addi	a5,a5,-812 # 2118 <digits>
    144c:	00f6f713          	andi	a4,a3,15
    1450:	973e                	add	a4,a4,a5
    1452:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff5ee8>
    buf[16] = 0;
    1456:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    145a:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    145c:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1460:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    1464:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    1468:	0046d51b          	srliw	a0,a3,0x4
    146c:	0ad5d563          	bge	a1,a3,1516 <printf+0x304>
        buf[i--] = digits[x % base];
    1470:	8a3d                	andi	a2,a2,15
    1472:	963e                	add	a2,a2,a5
    1474:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1478:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    147c:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1480:	30a5fe63          	bgeu	a1,a0,179c <printf+0x58a>
        buf[i--] = digits[x % base];
    1484:	00f77613          	andi	a2,a4,15
    1488:	963e                	add	a2,a2,a5
    148a:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    148e:	45bd                	li	a1,15
    1490:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    1494:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    1498:	00475513          	srli	a0,a4,0x4
    149c:	30e5f963          	bgeu	a1,a4,17ae <printf+0x59c>
        buf[i--] = digits[x % base];
    14a0:	8a3d                	andi	a2,a2,15
    14a2:	963e                	add	a2,a2,a5
    14a4:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    14a8:	00875893          	srli	a7,a4,0x8
    14ac:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    14b0:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    14b4:	30a5fd63          	bgeu	a1,a0,17ce <printf+0x5bc>
        buf[i--] = digits[x % base];
    14b8:	8a3d                	andi	a2,a2,15
    14ba:	963e                	add	a2,a2,a5
    14bc:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    14c0:	00c75813          	srli	a6,a4,0xc
    14c4:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    14c8:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    14cc:	3315fe63          	bgeu	a1,a7,1808 <printf+0x5f6>
        buf[i--] = digits[x % base];
    14d0:	8a3d                	andi	a2,a2,15
    14d2:	963e                	add	a2,a2,a5
    14d4:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    14d8:	01075893          	srli	a7,a4,0x10
    14dc:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    14e0:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    14e4:	3305ff63          	bgeu	a1,a6,1822 <printf+0x610>
        buf[i--] = digits[x % base];
    14e8:	8a3d                	andi	a2,a2,15
    14ea:	963e                	add	a2,a2,a5
    14ec:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    14f0:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    14f4:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    14f8:	3515f863          	bgeu	a1,a7,1848 <printf+0x636>
        buf[i--] = digits[x % base];
    14fc:	97ba                	add	a5,a5,a4
    14fe:	0007c783          	lbu	a5,0(a5)
    1502:	45a1                	li	a1,8
    1504:	00f10823          	sb	a5,16(sp)
    if (sign)
    1508:	0006d763          	bgez	a3,1516 <printf+0x304>
        buf[i--] = '-';
    150c:	02d00793          	li	a5,45
    1510:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1514:	459d                	li	a1,7
    write(f, s, l);
    1516:	4641                	li	a2,16
    1518:	003c                	addi	a5,sp,8
    151a:	9e0d                	subw	a2,a2,a1
    151c:	4505                	li	a0,1
    151e:	95be                	add	a1,a1,a5
    1520:	1c7000ef          	jal	ra,1ee6 <write>
        s += 2;
    1524:	00248513          	addi	a0,s1,2
    1528:	b335                	j	1254 <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    152a:	6782                	ld	a5,0(sp)
    152c:	6380                	ld	s0,0(a5)
    152e:	07a1                	addi	a5,a5,8
    1530:	e03e                	sd	a5,0(sp)
    1532:	22040a63          	beqz	s0,1766 <printf+0x554>
            l = strnlen(a, 200);
    1536:	0c800593          	li	a1,200
    153a:	8522                	mv	a0,s0
    153c:	6cc000ef          	jal	ra,1c08 <strnlen>
    write(f, s, l);
    1540:	0005061b          	sext.w	a2,a0
    1544:	85a2                	mv	a1,s0
    1546:	4505                	li	a0,1
    1548:	19f000ef          	jal	ra,1ee6 <write>
        s += 2;
    154c:	00248513          	addi	a0,s1,2
    1550:	b311                	j	1254 <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    1552:	6782                	ld	a5,0(sp)
    1554:	4390                	lw	a2,0(a5)
    1556:	07a1                	addi	a5,a5,8
    1558:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    155a:	1a064363          	bltz	a2,1700 <printf+0x4ee>
        buf[i--] = digits[x % base];
    155e:	46a9                	li	a3,10
    1560:	02d6773b          	remuw	a4,a2,a3
    1564:	00001797          	auipc	a5,0x1
    1568:	bb478793          	addi	a5,a5,-1100 # 2118 <digits>
    buf[16] = 0;
    156c:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1570:	4525                	li	a0,9
        x = xx;
    1572:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    1576:	973e                	add	a4,a4,a5
    1578:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    157c:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    1580:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1584:	2cc55063          	bge	a0,a2,1844 <printf+0x632>
    1588:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    158c:	02d5f73b          	remuw	a4,a1,a3
    1590:	1702                	slli	a4,a4,0x20
    1592:	9301                	srli	a4,a4,0x20
    1594:	973e                	add	a4,a4,a5
    1596:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    159a:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    159e:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    15a2:	1f057d63          	bgeu	a0,a6,179c <printf+0x58a>
        buf[i--] = digits[x % base];
    15a6:	4529                	li	a0,10
    } while ((x /= base) != 0);
    15a8:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    15aa:	02a5f73b          	remuw	a4,a1,a0
    15ae:	973e                	add	a4,a4,a5
    15b0:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    15b4:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    15b8:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    15bc:	1ab6f163          	bgeu	a3,a1,175e <printf+0x54c>
    15c0:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    15c4:	02a776bb          	remuw	a3,a4,a0
    15c8:	96be                	add	a3,a3,a5
    15ca:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    15ce:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    15d2:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    15d6:	20b87c63          	bgeu	a6,a1,17ee <printf+0x5dc>
    15da:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    15de:	02a776bb          	remuw	a3,a4,a0
    15e2:	96be                	add	a3,a3,a5
    15e4:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    15e8:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    15ec:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    15f0:	20b87363          	bgeu	a6,a1,17f6 <printf+0x5e4>
        buf[i--] = digits[x % base];
    15f4:	02a776bb          	remuw	a3,a4,a0
    15f8:	96be                	add	a3,a3,a5
    15fa:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    15fe:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1602:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1606:	20b9f563          	bgeu	s3,a1,1810 <printf+0x5fe>
        buf[i--] = digits[x % base];
    160a:	02a776bb          	remuw	a3,a4,a0
    160e:	96be                	add	a3,a3,a5
    1610:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1614:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1618:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    161c:	20bafb63          	bgeu	s5,a1,1832 <printf+0x620>
        buf[i--] = digits[x % base];
    1620:	02a776bb          	remuw	a3,a4,a0
    1624:	96be                	add	a3,a3,a5
    1626:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    162a:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    162e:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1632:	1eba7c63          	bgeu	s4,a1,182a <printf+0x618>
        buf[i--] = digits[x % base];
    1636:	02a776bb          	remuw	a3,a4,a0
    163a:	96be                	add	a3,a3,a5
    163c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1640:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1644:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1648:	14bb7163          	bgeu	s6,a1,178a <printf+0x578>
        buf[i--] = digits[x % base];
    164c:	1702                	slli	a4,a4,0x20
    164e:	9301                	srli	a4,a4,0x20
    1650:	97ba                	add	a5,a5,a4
    1652:	0007c783          	lbu	a5,0(a5)
    1656:	4599                	li	a1,6
    1658:	00f10723          	sb	a5,14(sp)
    if (sign)
    165c:	ea065de3          	bgez	a2,1516 <printf+0x304>
        buf[i--] = '-';
    1660:	02d00793          	li	a5,45
    1664:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1668:	4595                	li	a1,5
    write(f, s, l);
    166a:	003c                	addi	a5,sp,8
    166c:	4641                	li	a2,16
    166e:	9e0d                	subw	a2,a2,a1
    1670:	4505                	li	a0,1
    1672:	95be                	add	a1,a1,a5
    1674:	073000ef          	jal	ra,1ee6 <write>
    1678:	b575                	j	1524 <printf+0x312>
    char byte = c;
    167a:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    167e:	4605                	li	a2,1
    1680:	002c                	addi	a1,sp,8
    1682:	4505                	li	a0,1
    char byte = c;
    1684:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1688:	05f000ef          	jal	ra,1ee6 <write>
    char byte = c;
    168c:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1690:	4605                	li	a2,1
    1692:	002c                	addi	a1,sp,8
    1694:	4505                	li	a0,1
    char byte = c;
    1696:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    169a:	04d000ef          	jal	ra,1ee6 <write>
        s += 2;
    169e:	00248513          	addi	a0,s1,2
    16a2:	be4d                	j	1254 <printf+0x42>
        x = -xx;
    16a4:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    16a8:	00001797          	auipc	a5,0x1
    16ac:	a7078793          	addi	a5,a5,-1424 # 2118 <digits>
    16b0:	00f77613          	andi	a2,a4,15
    16b4:	963e                	add	a2,a2,a5
    16b6:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    16ba:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    16be:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    16c0:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    16c4:	0047551b          	srliw	a0,a4,0x4
    16c8:	0047561b          	srliw	a2,a4,0x4
    16cc:	0ab6d263          	bge	a3,a1,1770 <printf+0x55e>
        buf[i--] = digits[x % base];
    16d0:	8a3d                	andi	a2,a2,15
    16d2:	963e                	add	a2,a2,a5
    16d4:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    16d8:	463d                	li	a2,15
    16da:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    16de:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    16e2:	daa661e3          	bltu	a2,a0,1484 <printf+0x272>
        buf[i--] = '-';
    16e6:	02d00793          	li	a5,45
    16ea:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    16ee:	45b5                	li	a1,13
    write(f, s, l);
    16f0:	003c                	addi	a5,sp,8
    16f2:	4641                	li	a2,16
    16f4:	9e0d                	subw	a2,a2,a1
    16f6:	4505                	li	a0,1
    16f8:	95be                	add	a1,a1,a5
    16fa:	7ec000ef          	jal	ra,1ee6 <write>
    16fe:	b51d                	j	1524 <printf+0x312>
        x = -xx;
    1700:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    1704:	46a9                	li	a3,10
    1706:	02d875bb          	remuw	a1,a6,a3
    170a:	00001797          	auipc	a5,0x1
    170e:	a0e78793          	addi	a5,a5,-1522 # 2118 <digits>
    buf[16] = 0;
    1712:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1716:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    1718:	95be                	add	a1,a1,a5
    171a:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    171e:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    1722:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    1726:	04a65563          	bge	a2,a0,1770 <printf+0x55e>
    172a:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    172e:	02d775bb          	remuw	a1,a4,a3
    1732:	95be                	add	a1,a1,a5
    1734:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    1738:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    173c:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    1740:	fb0573e3          	bgeu	a0,a6,16e6 <printf+0x4d4>
        buf[i--] = digits[x % base];
    1744:	4529                	li	a0,10
    } while ((x /= base) != 0);
    1746:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    1748:	02a5f73b          	remuw	a4,a1,a0
    174c:	973e                	add	a4,a4,a5
    174e:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    1752:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    1756:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    175a:	e6b6e3e3          	bltu	a3,a1,15c0 <printf+0x3ae>
        buf[i--] = digits[x % base];
    175e:	45b5                	li	a1,13
    if (sign)
    1760:	da065be3          	bgez	a2,1516 <printf+0x304>
    1764:	a881                	j	17b4 <printf+0x5a2>
                a = "(null)";
    1766:	00001417          	auipc	s0,0x1
    176a:	99240413          	addi	s0,s0,-1646 # 20f8 <unlink+0x6c>
    176e:	b3e1                	j	1536 <printf+0x324>
        buf[i--] = '-';
    1770:	02d00793          	li	a5,45
    1774:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1778:	45b9                	li	a1,14
    write(f, s, l);
    177a:	003c                	addi	a5,sp,8
    177c:	4641                	li	a2,16
    177e:	9e0d                	subw	a2,a2,a1
    1780:	4505                	li	a0,1
    1782:	95be                	add	a1,a1,a5
    1784:	762000ef          	jal	ra,1ee6 <write>
    1788:	bb71                	j	1524 <printf+0x312>
        buf[i--] = digits[x % base];
    178a:	459d                	li	a1,7
    if (sign)
    178c:	d80655e3          	bgez	a2,1516 <printf+0x304>
        buf[i--] = '-';
    1790:	02d00793          	li	a5,45
    1794:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    1798:	4599                	li	a1,6
    179a:	bbb5                	j	1516 <printf+0x304>
    179c:	45b9                	li	a1,14
    write(f, s, l);
    179e:	003c                	addi	a5,sp,8
    17a0:	4641                	li	a2,16
    17a2:	9e0d                	subw	a2,a2,a1
    17a4:	4505                	li	a0,1
    17a6:	95be                	add	a1,a1,a5
    17a8:	73e000ef          	jal	ra,1ee6 <write>
    17ac:	bba5                	j	1524 <printf+0x312>
        buf[i--] = digits[x % base];
    17ae:	45b5                	li	a1,13
    if (sign)
    17b0:	d606d3e3          	bgez	a3,1516 <printf+0x304>
        buf[i--] = '-';
    17b4:	02d00793          	li	a5,45
    17b8:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    17bc:	45b1                	li	a1,12
    write(f, s, l);
    17be:	003c                	addi	a5,sp,8
    17c0:	4641                	li	a2,16
    17c2:	9e0d                	subw	a2,a2,a1
    17c4:	4505                	li	a0,1
    17c6:	95be                	add	a1,a1,a5
    17c8:	71e000ef          	jal	ra,1ee6 <write>
    17cc:	bba1                	j	1524 <printf+0x312>
        buf[i--] = digits[x % base];
    17ce:	45b1                	li	a1,12
    if (sign)
    17d0:	d406d3e3          	bgez	a3,1516 <printf+0x304>
        buf[i--] = '-';
    17d4:	02d00793          	li	a5,45
    17d8:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    17dc:	45ad                	li	a1,11
    write(f, s, l);
    17de:	003c                	addi	a5,sp,8
    17e0:	4641                	li	a2,16
    17e2:	9e0d                	subw	a2,a2,a1
    17e4:	4505                	li	a0,1
    17e6:	95be                	add	a1,a1,a5
    17e8:	6fe000ef          	jal	ra,1ee6 <write>
    17ec:	bb25                	j	1524 <printf+0x312>
        buf[i--] = digits[x % base];
    17ee:	45b1                	li	a1,12
    if (sign)
    17f0:	d20653e3          	bgez	a2,1516 <printf+0x304>
    17f4:	b7c5                	j	17d4 <printf+0x5c2>
        buf[i--] = digits[x % base];
    17f6:	45ad                	li	a1,11
    if (sign)
    17f8:	d0065fe3          	bgez	a2,1516 <printf+0x304>
        buf[i--] = '-';
    17fc:	02d00793          	li	a5,45
    1800:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1804:	45a9                	li	a1,10
    1806:	bb01                	j	1516 <printf+0x304>
    1808:	45ad                	li	a1,11
    if (sign)
    180a:	d006d6e3          	bgez	a3,1516 <printf+0x304>
    180e:	b7fd                	j	17fc <printf+0x5ea>
        buf[i--] = digits[x % base];
    1810:	45a9                	li	a1,10
    if (sign)
    1812:	d00652e3          	bgez	a2,1516 <printf+0x304>
        buf[i--] = '-';
    1816:	02d00793          	li	a5,45
    181a:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    181e:	45a5                	li	a1,9
    1820:	b9dd                	j	1516 <printf+0x304>
    1822:	45a9                	li	a1,10
    if (sign)
    1824:	ce06d9e3          	bgez	a3,1516 <printf+0x304>
    1828:	b7fd                	j	1816 <printf+0x604>
        buf[i--] = digits[x % base];
    182a:	45a1                	li	a1,8
    if (sign)
    182c:	ce0655e3          	bgez	a2,1516 <printf+0x304>
    1830:	b9f1                	j	150c <printf+0x2fa>
        buf[i--] = digits[x % base];
    1832:	45a5                	li	a1,9
    if (sign)
    1834:	ce0651e3          	bgez	a2,1516 <printf+0x304>
        buf[i--] = '-';
    1838:	02d00793          	li	a5,45
    183c:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1840:	45a1                	li	a1,8
    1842:	b9d1                	j	1516 <printf+0x304>
    i = 15;
    1844:	45bd                	li	a1,15
    1846:	b9c1                	j	1516 <printf+0x304>
        buf[i--] = digits[x % base];
    1848:	45a5                	li	a1,9
    if (sign)
    184a:	cc06d6e3          	bgez	a3,1516 <printf+0x304>
    184e:	b7ed                	j	1838 <printf+0x626>

0000000000001850 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1850:	02000793          	li	a5,32
    1854:	00f50663          	beq	a0,a5,1860 <isspace+0x10>
    1858:	355d                	addiw	a0,a0,-9
    185a:	00553513          	sltiu	a0,a0,5
    185e:	8082                	ret
    1860:	4505                	li	a0,1
}
    1862:	8082                	ret

0000000000001864 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1864:	fd05051b          	addiw	a0,a0,-48
}
    1868:	00a53513          	sltiu	a0,a0,10
    186c:	8082                	ret

000000000000186e <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    186e:	02000613          	li	a2,32
    1872:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1874:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1878:	ff77069b          	addiw	a3,a4,-9
    187c:	04c70d63          	beq	a4,a2,18d6 <atoi+0x68>
    1880:	0007079b          	sext.w	a5,a4
    1884:	04d5f963          	bgeu	a1,a3,18d6 <atoi+0x68>
        s++;
    switch (*s)
    1888:	02b00693          	li	a3,43
    188c:	04d70a63          	beq	a4,a3,18e0 <atoi+0x72>
    1890:	02d00693          	li	a3,45
    1894:	06d70463          	beq	a4,a3,18fc <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1898:	fd07859b          	addiw	a1,a5,-48
    189c:	4625                	li	a2,9
    189e:	873e                	mv	a4,a5
    18a0:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    18a2:	4e01                	li	t3,0
    while (isdigit(*s))
    18a4:	04b66a63          	bltu	a2,a1,18f8 <atoi+0x8a>
    int n = 0, neg = 0;
    18a8:	4501                	li	a0,0
    while (isdigit(*s))
    18aa:	4825                	li	a6,9
    18ac:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    18b0:	0025179b          	slliw	a5,a0,0x2
    18b4:	9d3d                	addw	a0,a0,a5
    18b6:	fd07031b          	addiw	t1,a4,-48
    18ba:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    18be:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    18c2:	0685                	addi	a3,a3,1
    18c4:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    18c8:	0006071b          	sext.w	a4,a2
    18cc:	feb870e3          	bgeu	a6,a1,18ac <atoi+0x3e>
    return neg ? n : -n;
    18d0:	000e0563          	beqz	t3,18da <atoi+0x6c>
}
    18d4:	8082                	ret
        s++;
    18d6:	0505                	addi	a0,a0,1
    18d8:	bf71                	j	1874 <atoi+0x6>
    18da:	4113053b          	subw	a0,t1,a7
    18de:	8082                	ret
    while (isdigit(*s))
    18e0:	00154783          	lbu	a5,1(a0)
    18e4:	4625                	li	a2,9
        s++;
    18e6:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    18ea:	fd07859b          	addiw	a1,a5,-48
    18ee:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    18f2:	4e01                	li	t3,0
    while (isdigit(*s))
    18f4:	fab67ae3          	bgeu	a2,a1,18a8 <atoi+0x3a>
    18f8:	4501                	li	a0,0
}
    18fa:	8082                	ret
    while (isdigit(*s))
    18fc:	00154783          	lbu	a5,1(a0)
    1900:	4625                	li	a2,9
        s++;
    1902:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1906:	fd07859b          	addiw	a1,a5,-48
    190a:	0007871b          	sext.w	a4,a5
    190e:	feb665e3          	bltu	a2,a1,18f8 <atoi+0x8a>
        neg = 1;
    1912:	4e05                	li	t3,1
    1914:	bf51                	j	18a8 <atoi+0x3a>

0000000000001916 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1916:	16060d63          	beqz	a2,1a90 <memset+0x17a>
    191a:	40a007b3          	neg	a5,a0
    191e:	8b9d                	andi	a5,a5,7
    1920:	00778713          	addi	a4,a5,7
    1924:	482d                	li	a6,11
    1926:	0ff5f593          	andi	a1,a1,255
    192a:	fff60693          	addi	a3,a2,-1
    192e:	17076263          	bltu	a4,a6,1a92 <memset+0x17c>
    1932:	16e6ea63          	bltu	a3,a4,1aa6 <memset+0x190>
    1936:	16078563          	beqz	a5,1aa0 <memset+0x18a>
    193a:	00b50023          	sb	a1,0(a0)
    193e:	4705                	li	a4,1
    1940:	00150e93          	addi	t4,a0,1
    1944:	14e78c63          	beq	a5,a4,1a9c <memset+0x186>
    1948:	00b500a3          	sb	a1,1(a0)
    194c:	4709                	li	a4,2
    194e:	00250e93          	addi	t4,a0,2
    1952:	14e78d63          	beq	a5,a4,1aac <memset+0x196>
    1956:	00b50123          	sb	a1,2(a0)
    195a:	470d                	li	a4,3
    195c:	00350e93          	addi	t4,a0,3
    1960:	12e78b63          	beq	a5,a4,1a96 <memset+0x180>
    1964:	00b501a3          	sb	a1,3(a0)
    1968:	4711                	li	a4,4
    196a:	00450e93          	addi	t4,a0,4
    196e:	14e78163          	beq	a5,a4,1ab0 <memset+0x19a>
    1972:	00b50223          	sb	a1,4(a0)
    1976:	4715                	li	a4,5
    1978:	00550e93          	addi	t4,a0,5
    197c:	12e78c63          	beq	a5,a4,1ab4 <memset+0x19e>
    1980:	00b502a3          	sb	a1,5(a0)
    1984:	471d                	li	a4,7
    1986:	00650e93          	addi	t4,a0,6
    198a:	12e79763          	bne	a5,a4,1ab8 <memset+0x1a2>
    198e:	00750e93          	addi	t4,a0,7
    1992:	00b50323          	sb	a1,6(a0)
    1996:	4f1d                	li	t5,7
    1998:	00859713          	slli	a4,a1,0x8
    199c:	8f4d                	or	a4,a4,a1
    199e:	01059e13          	slli	t3,a1,0x10
    19a2:	01c76e33          	or	t3,a4,t3
    19a6:	01859313          	slli	t1,a1,0x18
    19aa:	006e6333          	or	t1,t3,t1
    19ae:	02059893          	slli	a7,a1,0x20
    19b2:	011368b3          	or	a7,t1,a7
    19b6:	02859813          	slli	a6,a1,0x28
    19ba:	40f60333          	sub	t1,a2,a5
    19be:	0108e833          	or	a6,a7,a6
    19c2:	03059693          	slli	a3,a1,0x30
    19c6:	00d866b3          	or	a3,a6,a3
    19ca:	03859713          	slli	a4,a1,0x38
    19ce:	97aa                	add	a5,a5,a0
    19d0:	ff837813          	andi	a6,t1,-8
    19d4:	8f55                	or	a4,a4,a3
    19d6:	00f806b3          	add	a3,a6,a5
    19da:	e398                	sd	a4,0(a5)
    19dc:	07a1                	addi	a5,a5,8
    19de:	fed79ee3          	bne	a5,a3,19da <memset+0xc4>
    19e2:	ff837693          	andi	a3,t1,-8
    19e6:	00de87b3          	add	a5,t4,a3
    19ea:	01e6873b          	addw	a4,a3,t5
    19ee:	0ad30663          	beq	t1,a3,1a9a <memset+0x184>
    19f2:	00b78023          	sb	a1,0(a5)
    19f6:	0017069b          	addiw	a3,a4,1
    19fa:	08c6fb63          	bgeu	a3,a2,1a90 <memset+0x17a>
    19fe:	00b780a3          	sb	a1,1(a5)
    1a02:	0027069b          	addiw	a3,a4,2
    1a06:	08c6f563          	bgeu	a3,a2,1a90 <memset+0x17a>
    1a0a:	00b78123          	sb	a1,2(a5)
    1a0e:	0037069b          	addiw	a3,a4,3
    1a12:	06c6ff63          	bgeu	a3,a2,1a90 <memset+0x17a>
    1a16:	00b781a3          	sb	a1,3(a5)
    1a1a:	0047069b          	addiw	a3,a4,4
    1a1e:	06c6f963          	bgeu	a3,a2,1a90 <memset+0x17a>
    1a22:	00b78223          	sb	a1,4(a5)
    1a26:	0057069b          	addiw	a3,a4,5
    1a2a:	06c6f363          	bgeu	a3,a2,1a90 <memset+0x17a>
    1a2e:	00b782a3          	sb	a1,5(a5)
    1a32:	0067069b          	addiw	a3,a4,6
    1a36:	04c6fd63          	bgeu	a3,a2,1a90 <memset+0x17a>
    1a3a:	00b78323          	sb	a1,6(a5)
    1a3e:	0077069b          	addiw	a3,a4,7
    1a42:	04c6f763          	bgeu	a3,a2,1a90 <memset+0x17a>
    1a46:	00b783a3          	sb	a1,7(a5)
    1a4a:	0087069b          	addiw	a3,a4,8
    1a4e:	04c6f163          	bgeu	a3,a2,1a90 <memset+0x17a>
    1a52:	00b78423          	sb	a1,8(a5)
    1a56:	0097069b          	addiw	a3,a4,9
    1a5a:	02c6fb63          	bgeu	a3,a2,1a90 <memset+0x17a>
    1a5e:	00b784a3          	sb	a1,9(a5)
    1a62:	00a7069b          	addiw	a3,a4,10
    1a66:	02c6f563          	bgeu	a3,a2,1a90 <memset+0x17a>
    1a6a:	00b78523          	sb	a1,10(a5)
    1a6e:	00b7069b          	addiw	a3,a4,11
    1a72:	00c6ff63          	bgeu	a3,a2,1a90 <memset+0x17a>
    1a76:	00b785a3          	sb	a1,11(a5)
    1a7a:	00c7069b          	addiw	a3,a4,12
    1a7e:	00c6f963          	bgeu	a3,a2,1a90 <memset+0x17a>
    1a82:	00b78623          	sb	a1,12(a5)
    1a86:	2735                	addiw	a4,a4,13
    1a88:	00c77463          	bgeu	a4,a2,1a90 <memset+0x17a>
    1a8c:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1a90:	8082                	ret
    1a92:	472d                	li	a4,11
    1a94:	bd79                	j	1932 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a96:	4f0d                	li	t5,3
    1a98:	b701                	j	1998 <memset+0x82>
    1a9a:	8082                	ret
    1a9c:	4f05                	li	t5,1
    1a9e:	bded                	j	1998 <memset+0x82>
    1aa0:	8eaa                	mv	t4,a0
    1aa2:	4f01                	li	t5,0
    1aa4:	bdd5                	j	1998 <memset+0x82>
    1aa6:	87aa                	mv	a5,a0
    1aa8:	4701                	li	a4,0
    1aaa:	b7a1                	j	19f2 <memset+0xdc>
    1aac:	4f09                	li	t5,2
    1aae:	b5ed                	j	1998 <memset+0x82>
    1ab0:	4f11                	li	t5,4
    1ab2:	b5dd                	j	1998 <memset+0x82>
    1ab4:	4f15                	li	t5,5
    1ab6:	b5cd                	j	1998 <memset+0x82>
    1ab8:	4f19                	li	t5,6
    1aba:	bdf9                	j	1998 <memset+0x82>

0000000000001abc <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1abc:	00054783          	lbu	a5,0(a0)
    1ac0:	0005c703          	lbu	a4,0(a1)
    1ac4:	00e79863          	bne	a5,a4,1ad4 <strcmp+0x18>
    1ac8:	0505                	addi	a0,a0,1
    1aca:	0585                	addi	a1,a1,1
    1acc:	fbe5                	bnez	a5,1abc <strcmp>
    1ace:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1ad0:	9d19                	subw	a0,a0,a4
    1ad2:	8082                	ret
    1ad4:	0007851b          	sext.w	a0,a5
    1ad8:	bfe5                	j	1ad0 <strcmp+0x14>

0000000000001ada <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1ada:	ce05                	beqz	a2,1b12 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1adc:	00054703          	lbu	a4,0(a0)
    1ae0:	0005c783          	lbu	a5,0(a1)
    1ae4:	cb0d                	beqz	a4,1b16 <strncmp+0x3c>
    if (!n--)
    1ae6:	167d                	addi	a2,a2,-1
    1ae8:	00c506b3          	add	a3,a0,a2
    1aec:	a819                	j	1b02 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1aee:	00a68e63          	beq	a3,a0,1b0a <strncmp+0x30>
    1af2:	0505                	addi	a0,a0,1
    1af4:	00e79b63          	bne	a5,a4,1b0a <strncmp+0x30>
    1af8:	00054703          	lbu	a4,0(a0)
    1afc:	0005c783          	lbu	a5,0(a1)
    1b00:	cb19                	beqz	a4,1b16 <strncmp+0x3c>
    1b02:	0005c783          	lbu	a5,0(a1)
    1b06:	0585                	addi	a1,a1,1
    1b08:	f3fd                	bnez	a5,1aee <strncmp+0x14>
        ;
    return *l - *r;
    1b0a:	0007051b          	sext.w	a0,a4
    1b0e:	9d1d                	subw	a0,a0,a5
    1b10:	8082                	ret
        return 0;
    1b12:	4501                	li	a0,0
}
    1b14:	8082                	ret
    1b16:	4501                	li	a0,0
    return *l - *r;
    1b18:	9d1d                	subw	a0,a0,a5
    1b1a:	8082                	ret

0000000000001b1c <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1b1c:	00757793          	andi	a5,a0,7
    1b20:	cf89                	beqz	a5,1b3a <strlen+0x1e>
    1b22:	87aa                	mv	a5,a0
    1b24:	a029                	j	1b2e <strlen+0x12>
    1b26:	0785                	addi	a5,a5,1
    1b28:	0077f713          	andi	a4,a5,7
    1b2c:	cb01                	beqz	a4,1b3c <strlen+0x20>
        if (!*s)
    1b2e:	0007c703          	lbu	a4,0(a5)
    1b32:	fb75                	bnez	a4,1b26 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1b34:	40a78533          	sub	a0,a5,a0
}
    1b38:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1b3a:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1b3c:	6394                	ld	a3,0(a5)
    1b3e:	00000597          	auipc	a1,0x0
    1b42:	5c25b583          	ld	a1,1474(a1) # 2100 <unlink+0x74>
    1b46:	00000617          	auipc	a2,0x0
    1b4a:	5c263603          	ld	a2,1474(a2) # 2108 <unlink+0x7c>
    1b4e:	a019                	j	1b54 <strlen+0x38>
    1b50:	6794                	ld	a3,8(a5)
    1b52:	07a1                	addi	a5,a5,8
    1b54:	00b68733          	add	a4,a3,a1
    1b58:	fff6c693          	not	a3,a3
    1b5c:	8f75                	and	a4,a4,a3
    1b5e:	8f71                	and	a4,a4,a2
    1b60:	db65                	beqz	a4,1b50 <strlen+0x34>
    for (; *s; s++)
    1b62:	0007c703          	lbu	a4,0(a5)
    1b66:	d779                	beqz	a4,1b34 <strlen+0x18>
    1b68:	0017c703          	lbu	a4,1(a5)
    1b6c:	0785                	addi	a5,a5,1
    1b6e:	d379                	beqz	a4,1b34 <strlen+0x18>
    1b70:	0017c703          	lbu	a4,1(a5)
    1b74:	0785                	addi	a5,a5,1
    1b76:	fb6d                	bnez	a4,1b68 <strlen+0x4c>
    1b78:	bf75                	j	1b34 <strlen+0x18>

0000000000001b7a <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1b7a:	00757713          	andi	a4,a0,7
{
    1b7e:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1b80:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1b84:	cb19                	beqz	a4,1b9a <memchr+0x20>
    1b86:	ce25                	beqz	a2,1bfe <memchr+0x84>
    1b88:	0007c703          	lbu	a4,0(a5)
    1b8c:	04b70e63          	beq	a4,a1,1be8 <memchr+0x6e>
    1b90:	0785                	addi	a5,a5,1
    1b92:	0077f713          	andi	a4,a5,7
    1b96:	167d                	addi	a2,a2,-1
    1b98:	f77d                	bnez	a4,1b86 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1b9a:	4501                	li	a0,0
    if (n && *s != c)
    1b9c:	c235                	beqz	a2,1c00 <memchr+0x86>
    1b9e:	0007c703          	lbu	a4,0(a5)
    1ba2:	04b70363          	beq	a4,a1,1be8 <memchr+0x6e>
        size_t k = ONES * c;
    1ba6:	00000517          	auipc	a0,0x0
    1baa:	56a53503          	ld	a0,1386(a0) # 2110 <unlink+0x84>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1bae:	471d                	li	a4,7
        size_t k = ONES * c;
    1bb0:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1bb4:	02c77a63          	bgeu	a4,a2,1be8 <memchr+0x6e>
    1bb8:	00000897          	auipc	a7,0x0
    1bbc:	5488b883          	ld	a7,1352(a7) # 2100 <unlink+0x74>
    1bc0:	00000817          	auipc	a6,0x0
    1bc4:	54883803          	ld	a6,1352(a6) # 2108 <unlink+0x7c>
    1bc8:	431d                	li	t1,7
    1bca:	a029                	j	1bd4 <memchr+0x5a>
    1bcc:	1661                	addi	a2,a2,-8
    1bce:	07a1                	addi	a5,a5,8
    1bd0:	02c37963          	bgeu	t1,a2,1c02 <memchr+0x88>
    1bd4:	6398                	ld	a4,0(a5)
    1bd6:	8f29                	xor	a4,a4,a0
    1bd8:	011706b3          	add	a3,a4,a7
    1bdc:	fff74713          	not	a4,a4
    1be0:	8f75                	and	a4,a4,a3
    1be2:	01077733          	and	a4,a4,a6
    1be6:	d37d                	beqz	a4,1bcc <memchr+0x52>
    1be8:	853e                	mv	a0,a5
    1bea:	97b2                	add	a5,a5,a2
    1bec:	a021                	j	1bf4 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1bee:	0505                	addi	a0,a0,1
    1bf0:	00f50763          	beq	a0,a5,1bfe <memchr+0x84>
    1bf4:	00054703          	lbu	a4,0(a0)
    1bf8:	feb71be3          	bne	a4,a1,1bee <memchr+0x74>
    1bfc:	8082                	ret
    return n ? (void *)s : 0;
    1bfe:	4501                	li	a0,0
}
    1c00:	8082                	ret
    return n ? (void *)s : 0;
    1c02:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1c04:	f275                	bnez	a2,1be8 <memchr+0x6e>
}
    1c06:	8082                	ret

0000000000001c08 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1c08:	1101                	addi	sp,sp,-32
    1c0a:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1c0c:	862e                	mv	a2,a1
{
    1c0e:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1c10:	4581                	li	a1,0
{
    1c12:	e426                	sd	s1,8(sp)
    1c14:	ec06                	sd	ra,24(sp)
    1c16:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1c18:	f63ff0ef          	jal	ra,1b7a <memchr>
    return p ? p - s : n;
    1c1c:	c519                	beqz	a0,1c2a <strnlen+0x22>
}
    1c1e:	60e2                	ld	ra,24(sp)
    1c20:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1c22:	8d05                	sub	a0,a0,s1
}
    1c24:	64a2                	ld	s1,8(sp)
    1c26:	6105                	addi	sp,sp,32
    1c28:	8082                	ret
    1c2a:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1c2c:	8522                	mv	a0,s0
}
    1c2e:	6442                	ld	s0,16(sp)
    1c30:	64a2                	ld	s1,8(sp)
    1c32:	6105                	addi	sp,sp,32
    1c34:	8082                	ret

0000000000001c36 <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1c36:	00b547b3          	xor	a5,a0,a1
    1c3a:	8b9d                	andi	a5,a5,7
    1c3c:	eb95                	bnez	a5,1c70 <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1c3e:	0075f793          	andi	a5,a1,7
    1c42:	e7b1                	bnez	a5,1c8e <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1c44:	6198                	ld	a4,0(a1)
    1c46:	00000617          	auipc	a2,0x0
    1c4a:	4ba63603          	ld	a2,1210(a2) # 2100 <unlink+0x74>
    1c4e:	00000817          	auipc	a6,0x0
    1c52:	4ba83803          	ld	a6,1210(a6) # 2108 <unlink+0x7c>
    1c56:	a029                	j	1c60 <stpcpy+0x2a>
    1c58:	e118                	sd	a4,0(a0)
    1c5a:	6598                	ld	a4,8(a1)
    1c5c:	05a1                	addi	a1,a1,8
    1c5e:	0521                	addi	a0,a0,8
    1c60:	00c707b3          	add	a5,a4,a2
    1c64:	fff74693          	not	a3,a4
    1c68:	8ff5                	and	a5,a5,a3
    1c6a:	0107f7b3          	and	a5,a5,a6
    1c6e:	d7ed                	beqz	a5,1c58 <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1c70:	0005c783          	lbu	a5,0(a1)
    1c74:	00f50023          	sb	a5,0(a0)
    1c78:	c785                	beqz	a5,1ca0 <stpcpy+0x6a>
    1c7a:	0015c783          	lbu	a5,1(a1)
    1c7e:	0505                	addi	a0,a0,1
    1c80:	0585                	addi	a1,a1,1
    1c82:	00f50023          	sb	a5,0(a0)
    1c86:	fbf5                	bnez	a5,1c7a <stpcpy+0x44>
        ;
    return d;
}
    1c88:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1c8a:	0505                	addi	a0,a0,1
    1c8c:	df45                	beqz	a4,1c44 <stpcpy+0xe>
            if (!(*d = *s))
    1c8e:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1c92:	0585                	addi	a1,a1,1
    1c94:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1c98:	00f50023          	sb	a5,0(a0)
    1c9c:	f7fd                	bnez	a5,1c8a <stpcpy+0x54>
}
    1c9e:	8082                	ret
    1ca0:	8082                	ret

0000000000001ca2 <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ca2:	00b547b3          	xor	a5,a0,a1
    1ca6:	8b9d                	andi	a5,a5,7
    1ca8:	1a079863          	bnez	a5,1e58 <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1cac:	0075f793          	andi	a5,a1,7
    1cb0:	16078463          	beqz	a5,1e18 <stpncpy+0x176>
    1cb4:	ea01                	bnez	a2,1cc4 <stpncpy+0x22>
    1cb6:	a421                	j	1ebe <stpncpy+0x21c>
    1cb8:	167d                	addi	a2,a2,-1
    1cba:	0505                	addi	a0,a0,1
    1cbc:	14070e63          	beqz	a4,1e18 <stpncpy+0x176>
    1cc0:	1a060863          	beqz	a2,1e70 <stpncpy+0x1ce>
    1cc4:	0005c783          	lbu	a5,0(a1)
    1cc8:	0585                	addi	a1,a1,1
    1cca:	0075f713          	andi	a4,a1,7
    1cce:	00f50023          	sb	a5,0(a0)
    1cd2:	f3fd                	bnez	a5,1cb8 <stpncpy+0x16>
    1cd4:	4805                	li	a6,1
    1cd6:	1a061863          	bnez	a2,1e86 <stpncpy+0x1e4>
    1cda:	40a007b3          	neg	a5,a0
    1cde:	8b9d                	andi	a5,a5,7
    1ce0:	4681                	li	a3,0
    1ce2:	18061a63          	bnez	a2,1e76 <stpncpy+0x1d4>
    1ce6:	00778713          	addi	a4,a5,7
    1cea:	45ad                	li	a1,11
    1cec:	18b76363          	bltu	a4,a1,1e72 <stpncpy+0x1d0>
    1cf0:	1ae6eb63          	bltu	a3,a4,1ea6 <stpncpy+0x204>
    1cf4:	1a078363          	beqz	a5,1e9a <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cf8:	00050023          	sb	zero,0(a0)
    1cfc:	4685                	li	a3,1
    1cfe:	00150713          	addi	a4,a0,1
    1d02:	18d78f63          	beq	a5,a3,1ea0 <stpncpy+0x1fe>
    1d06:	000500a3          	sb	zero,1(a0)
    1d0a:	4689                	li	a3,2
    1d0c:	00250713          	addi	a4,a0,2
    1d10:	18d78e63          	beq	a5,a3,1eac <stpncpy+0x20a>
    1d14:	00050123          	sb	zero,2(a0)
    1d18:	468d                	li	a3,3
    1d1a:	00350713          	addi	a4,a0,3
    1d1e:	16d78c63          	beq	a5,a3,1e96 <stpncpy+0x1f4>
    1d22:	000501a3          	sb	zero,3(a0)
    1d26:	4691                	li	a3,4
    1d28:	00450713          	addi	a4,a0,4
    1d2c:	18d78263          	beq	a5,a3,1eb0 <stpncpy+0x20e>
    1d30:	00050223          	sb	zero,4(a0)
    1d34:	4695                	li	a3,5
    1d36:	00550713          	addi	a4,a0,5
    1d3a:	16d78d63          	beq	a5,a3,1eb4 <stpncpy+0x212>
    1d3e:	000502a3          	sb	zero,5(a0)
    1d42:	469d                	li	a3,7
    1d44:	00650713          	addi	a4,a0,6
    1d48:	16d79863          	bne	a5,a3,1eb8 <stpncpy+0x216>
    1d4c:	00750713          	addi	a4,a0,7
    1d50:	00050323          	sb	zero,6(a0)
    1d54:	40f80833          	sub	a6,a6,a5
    1d58:	ff887593          	andi	a1,a6,-8
    1d5c:	97aa                	add	a5,a5,a0
    1d5e:	95be                	add	a1,a1,a5
    1d60:	0007b023          	sd	zero,0(a5)
    1d64:	07a1                	addi	a5,a5,8
    1d66:	feb79de3          	bne	a5,a1,1d60 <stpncpy+0xbe>
    1d6a:	ff887593          	andi	a1,a6,-8
    1d6e:	9ead                	addw	a3,a3,a1
    1d70:	00b707b3          	add	a5,a4,a1
    1d74:	12b80863          	beq	a6,a1,1ea4 <stpncpy+0x202>
    1d78:	00078023          	sb	zero,0(a5)
    1d7c:	0016871b          	addiw	a4,a3,1
    1d80:	0ec77863          	bgeu	a4,a2,1e70 <stpncpy+0x1ce>
    1d84:	000780a3          	sb	zero,1(a5)
    1d88:	0026871b          	addiw	a4,a3,2
    1d8c:	0ec77263          	bgeu	a4,a2,1e70 <stpncpy+0x1ce>
    1d90:	00078123          	sb	zero,2(a5)
    1d94:	0036871b          	addiw	a4,a3,3
    1d98:	0cc77c63          	bgeu	a4,a2,1e70 <stpncpy+0x1ce>
    1d9c:	000781a3          	sb	zero,3(a5)
    1da0:	0046871b          	addiw	a4,a3,4
    1da4:	0cc77663          	bgeu	a4,a2,1e70 <stpncpy+0x1ce>
    1da8:	00078223          	sb	zero,4(a5)
    1dac:	0056871b          	addiw	a4,a3,5
    1db0:	0cc77063          	bgeu	a4,a2,1e70 <stpncpy+0x1ce>
    1db4:	000782a3          	sb	zero,5(a5)
    1db8:	0066871b          	addiw	a4,a3,6
    1dbc:	0ac77a63          	bgeu	a4,a2,1e70 <stpncpy+0x1ce>
    1dc0:	00078323          	sb	zero,6(a5)
    1dc4:	0076871b          	addiw	a4,a3,7
    1dc8:	0ac77463          	bgeu	a4,a2,1e70 <stpncpy+0x1ce>
    1dcc:	000783a3          	sb	zero,7(a5)
    1dd0:	0086871b          	addiw	a4,a3,8
    1dd4:	08c77e63          	bgeu	a4,a2,1e70 <stpncpy+0x1ce>
    1dd8:	00078423          	sb	zero,8(a5)
    1ddc:	0096871b          	addiw	a4,a3,9
    1de0:	08c77863          	bgeu	a4,a2,1e70 <stpncpy+0x1ce>
    1de4:	000784a3          	sb	zero,9(a5)
    1de8:	00a6871b          	addiw	a4,a3,10
    1dec:	08c77263          	bgeu	a4,a2,1e70 <stpncpy+0x1ce>
    1df0:	00078523          	sb	zero,10(a5)
    1df4:	00b6871b          	addiw	a4,a3,11
    1df8:	06c77c63          	bgeu	a4,a2,1e70 <stpncpy+0x1ce>
    1dfc:	000785a3          	sb	zero,11(a5)
    1e00:	00c6871b          	addiw	a4,a3,12
    1e04:	06c77663          	bgeu	a4,a2,1e70 <stpncpy+0x1ce>
    1e08:	00078623          	sb	zero,12(a5)
    1e0c:	26b5                	addiw	a3,a3,13
    1e0e:	06c6f163          	bgeu	a3,a2,1e70 <stpncpy+0x1ce>
    1e12:	000786a3          	sb	zero,13(a5)
    1e16:	8082                	ret
            ;
        if (!n || !*s)
    1e18:	c645                	beqz	a2,1ec0 <stpncpy+0x21e>
    1e1a:	0005c783          	lbu	a5,0(a1)
    1e1e:	ea078be3          	beqz	a5,1cd4 <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1e22:	479d                	li	a5,7
    1e24:	02c7ff63          	bgeu	a5,a2,1e62 <stpncpy+0x1c0>
    1e28:	00000897          	auipc	a7,0x0
    1e2c:	2d88b883          	ld	a7,728(a7) # 2100 <unlink+0x74>
    1e30:	00000817          	auipc	a6,0x0
    1e34:	2d883803          	ld	a6,728(a6) # 2108 <unlink+0x7c>
    1e38:	431d                	li	t1,7
    1e3a:	6198                	ld	a4,0(a1)
    1e3c:	011707b3          	add	a5,a4,a7
    1e40:	fff74693          	not	a3,a4
    1e44:	8ff5                	and	a5,a5,a3
    1e46:	0107f7b3          	and	a5,a5,a6
    1e4a:	ef81                	bnez	a5,1e62 <stpncpy+0x1c0>
            *wd = *ws;
    1e4c:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1e4e:	1661                	addi	a2,a2,-8
    1e50:	05a1                	addi	a1,a1,8
    1e52:	0521                	addi	a0,a0,8
    1e54:	fec363e3          	bltu	t1,a2,1e3a <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1e58:	e609                	bnez	a2,1e62 <stpncpy+0x1c0>
    1e5a:	a08d                	j	1ebc <stpncpy+0x21a>
    1e5c:	167d                	addi	a2,a2,-1
    1e5e:	0505                	addi	a0,a0,1
    1e60:	ca01                	beqz	a2,1e70 <stpncpy+0x1ce>
    1e62:	0005c783          	lbu	a5,0(a1)
    1e66:	0585                	addi	a1,a1,1
    1e68:	00f50023          	sb	a5,0(a0)
    1e6c:	fbe5                	bnez	a5,1e5c <stpncpy+0x1ba>
        ;
tail:
    1e6e:	b59d                	j	1cd4 <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1e70:	8082                	ret
    1e72:	472d                	li	a4,11
    1e74:	bdb5                	j	1cf0 <stpncpy+0x4e>
    1e76:	00778713          	addi	a4,a5,7
    1e7a:	45ad                	li	a1,11
    1e7c:	fff60693          	addi	a3,a2,-1
    1e80:	e6b778e3          	bgeu	a4,a1,1cf0 <stpncpy+0x4e>
    1e84:	b7fd                	j	1e72 <stpncpy+0x1d0>
    1e86:	40a007b3          	neg	a5,a0
    1e8a:	8832                	mv	a6,a2
    1e8c:	8b9d                	andi	a5,a5,7
    1e8e:	4681                	li	a3,0
    1e90:	e4060be3          	beqz	a2,1ce6 <stpncpy+0x44>
    1e94:	b7cd                	j	1e76 <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1e96:	468d                	li	a3,3
    1e98:	bd75                	j	1d54 <stpncpy+0xb2>
    1e9a:	872a                	mv	a4,a0
    1e9c:	4681                	li	a3,0
    1e9e:	bd5d                	j	1d54 <stpncpy+0xb2>
    1ea0:	4685                	li	a3,1
    1ea2:	bd4d                	j	1d54 <stpncpy+0xb2>
    1ea4:	8082                	ret
    1ea6:	87aa                	mv	a5,a0
    1ea8:	4681                	li	a3,0
    1eaa:	b5f9                	j	1d78 <stpncpy+0xd6>
    1eac:	4689                	li	a3,2
    1eae:	b55d                	j	1d54 <stpncpy+0xb2>
    1eb0:	4691                	li	a3,4
    1eb2:	b54d                	j	1d54 <stpncpy+0xb2>
    1eb4:	4695                	li	a3,5
    1eb6:	bd79                	j	1d54 <stpncpy+0xb2>
    1eb8:	4699                	li	a3,6
    1eba:	bd69                	j	1d54 <stpncpy+0xb2>
    1ebc:	8082                	ret
    1ebe:	8082                	ret
    1ec0:	8082                	ret

0000000000001ec2 <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1ec2:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1ec6:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ec8:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1ecc:	2501                	sext.w	a0,a0
    1ece:	8082                	ret

0000000000001ed0 <close>:
    register long a7 __asm__("a7") = n;
    1ed0:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1ed4:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1ed8:	2501                	sext.w	a0,a0
    1eda:	8082                	ret

0000000000001edc <read>:
    register long a7 __asm__("a7") = n;
    1edc:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ee0:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1ee4:	8082                	ret

0000000000001ee6 <write>:
    register long a7 __asm__("a7") = n;
    1ee6:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eea:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1eee:	8082                	ret

0000000000001ef0 <getpid>:
    register long a7 __asm__("a7") = n;
    1ef0:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1ef4:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1ef8:	2501                	sext.w	a0,a0
    1efa:	8082                	ret

0000000000001efc <sched_yield>:
    register long a7 __asm__("a7") = n;
    1efc:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1f00:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1f04:	2501                	sext.w	a0,a0
    1f06:	8082                	ret

0000000000001f08 <fork>:
    register long a7 __asm__("a7") = n;
    1f08:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1f0c:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1f10:	2501                	sext.w	a0,a0
    1f12:	8082                	ret

0000000000001f14 <exit>:
    register long a7 __asm__("a7") = n;
    1f14:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1f18:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1f1c:	8082                	ret

0000000000001f1e <waitpid>:
    register long a7 __asm__("a7") = n;
    1f1e:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f22:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1f26:	2501                	sext.w	a0,a0
    1f28:	8082                	ret

0000000000001f2a <exec>:
    register long a7 __asm__("a7") = n;
    1f2a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1f2e:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1f32:	2501                	sext.w	a0,a0
    1f34:	8082                	ret

0000000000001f36 <get_time>:

int64 get_time()
{
    1f36:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1f38:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1f3c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1f3e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f40:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1f44:	2501                	sext.w	a0,a0
    1f46:	ed09                	bnez	a0,1f60 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1f48:	67a2                	ld	a5,8(sp)
    1f4a:	3e800713          	li	a4,1000
    1f4e:	00015503          	lhu	a0,0(sp)
    1f52:	02e7d7b3          	divu	a5,a5,a4
    1f56:	02e50533          	mul	a0,a0,a4
    1f5a:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1f5c:	0141                	addi	sp,sp,16
    1f5e:	8082                	ret
        return -1;
    1f60:	557d                	li	a0,-1
    1f62:	bfed                	j	1f5c <get_time+0x26>

0000000000001f64 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1f64:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f68:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1f6c:	2501                	sext.w	a0,a0
    1f6e:	8082                	ret

0000000000001f70 <sleep>:

int sleep(unsigned long long time)
{
    1f70:	1141                	addi	sp,sp,-16
    1f72:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1f74:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1f78:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1f7a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f7c:	00000073          	ecall
    if (err == 0)
    1f80:	2501                	sext.w	a0,a0
    1f82:	e13d                	bnez	a0,1fe8 <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1f84:	6722                	ld	a4,8(sp)
    1f86:	3e800693          	li	a3,1000
    1f8a:	00015783          	lhu	a5,0(sp)
    1f8e:	02d75733          	divu	a4,a4,a3
    1f92:	02d787b3          	mul	a5,a5,a3
    1f96:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1f98:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1f9c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1f9e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fa0:	00000073          	ecall
    if (err == 0)
    1fa4:	2501                	sext.w	a0,a0
    1fa6:	ed15                	bnez	a0,1fe2 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1fa8:	6841                	lui	a6,0x10
    1faa:	963e                	add	a2,a2,a5
    1fac:	187d                	addi	a6,a6,-1
    1fae:	3e800693          	li	a3,1000
    1fb2:	a819                	j	1fc8 <sleep+0x58>
    __asm_syscall("r"(a7))
    1fb4:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1fb8:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1fbc:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1fbe:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fc0:	00000073          	ecall
    if (err == 0)
    1fc4:	2501                	sext.w	a0,a0
    1fc6:	ed11                	bnez	a0,1fe2 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1fc8:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1fca:	07c00893          	li	a7,124
    1fce:	02d7d733          	divu	a4,a5,a3
    1fd2:	6782                	ld	a5,0(sp)
    1fd4:	0107f7b3          	and	a5,a5,a6
    1fd8:	02d787b3          	mul	a5,a5,a3
    1fdc:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1fde:	fcc7ebe3          	bltu	a5,a2,1fb4 <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1fe2:	4501                	li	a0,0
    1fe4:	0141                	addi	sp,sp,16
    1fe6:	8082                	ret
    1fe8:	57fd                	li	a5,-1
    1fea:	b77d                	j	1f98 <sleep+0x28>

0000000000001fec <set_priority>:
    register long a7 __asm__("a7") = n;
    1fec:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1ff0:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1ff4:	2501                	sext.w	a0,a0
    1ff6:	8082                	ret

0000000000001ff8 <mmap>:
    register long a7 __asm__("a7") = n;
    1ff8:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ffc:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    2000:	2501                	sext.w	a0,a0
    2002:	8082                	ret

0000000000002004 <munmap>:
    register long a7 __asm__("a7") = n;
    2004:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2008:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    200c:	2501                	sext.w	a0,a0
    200e:	8082                	ret

0000000000002010 <wait>:

int wait(int *code)
{
    2010:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    2012:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    2016:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2018:	00000073          	ecall
    return waitpid(-1, code);
}
    201c:	2501                	sext.w	a0,a0
    201e:	8082                	ret

0000000000002020 <spawn>:
    register long a7 __asm__("a7") = n;
    2020:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    2024:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    2028:	2501                	sext.w	a0,a0
    202a:	8082                	ret

000000000000202c <mailread>:
    register long a7 __asm__("a7") = n;
    202c:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2030:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    2034:	2501                	sext.w	a0,a0
    2036:	8082                	ret

0000000000002038 <mailwrite>:
    register long a7 __asm__("a7") = n;
    2038:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    203c:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    2040:	2501                	sext.w	a0,a0
    2042:	8082                	ret

0000000000002044 <fstat>:
    register long a7 __asm__("a7") = n;
    2044:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2048:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    204c:	2501                	sext.w	a0,a0
    204e:	8082                	ret

0000000000002050 <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    2050:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    2052:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    2056:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    2058:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    205c:	2501                	sext.w	a0,a0
    205e:	8082                	ret

0000000000002060 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    2060:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    2062:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    2066:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2068:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    206c:	2501                	sext.w	a0,a0
    206e:	8082                	ret

0000000000002070 <link>:

int link(char *old_path, char *new_path)
{
    2070:	87aa                	mv	a5,a0
    2072:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    2074:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    2078:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    207c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    207e:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    2082:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    2084:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    2088:	2501                	sext.w	a0,a0
    208a:	8082                	ret

000000000000208c <unlink>:

int unlink(char *path)
{
    208c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    208e:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    2092:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    2096:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2098:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    209c:	2501                	sext.w	a0,a0
    209e:	8082                	ret
