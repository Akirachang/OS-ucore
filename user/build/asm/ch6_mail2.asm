
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch6_mail2:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	2b20006f          	j	12b4 <__start_main>

0000000000001006 <main>:
const int BUF_LEN = 256;

// 双进程邮箱测试，最终输出 mail2 test OK! 就算正确。

int main()
{
    1006:	710d                	addi	sp,sp,-352
    1008:	eaa2                	sd	s0,336(sp)
    100a:	fe4e                	sd	s3,312(sp)
    100c:	ee86                	sd	ra,344(sp)
    100e:	e6a6                	sd	s1,328(sp)
    1010:	e2ca                	sd	s2,320(sp)
    1012:	fa52                	sd	s4,304(sp)
    1014:	f656                	sd	s5,296(sp)
    1016:	f25a                	sd	s6,288(sp)
    1018:	ee5e                	sd	s7,280(sp)
    101a:	1280                	addi	s0,sp,352
    int pid = fork();
    101c:	020010ef          	jal	ra,203c <fork>
    1020:	89aa                	mv	s3,a0
    if (pid == 0)
    1022:	12050263          	beqz	a0,1146 <main+0x140>
        assert(strncmp(buffer, ans, BUF_LEN) == 0);
        puts("child read 1 mail succeed");
        puts("child exit");
        exit(0);
    }
    puts("I am father");
    1026:	00001517          	auipc	a0,0x1
    102a:	24a50513          	addi	a0,a0,586 # 2270 <unlink+0xb0>
    102e:	2d6000ef          	jal	ra,1304 <puts>
    puts("father sleep 1s");
    1032:	00001517          	auipc	a0,0x1
    1036:	24e50513          	addi	a0,a0,590 # 2280 <unlink+0xc0>
    103a:	2ca000ef          	jal	ra,1304 <puts>
    sleep(1000);
    103e:	3e800513          	li	a0,1000
    1042:	062010ef          	jal	ra,20a4 <sleep>
    for (int i = 0; i < 16; ++i)
    1046:	4481                	li	s1,0
    1048:	4a41                	li	s4,16
    {
    104a:	890a                	mv	s2,sp
        char buffer[BUF_LEN];
    104c:	7111                	addi	sp,sp,-256
        memset(buffer, i, BUF_LEN);
    104e:	85a6                	mv	a1,s1
    1050:	10000613          	li	a2,256
    1054:	850a                	mv	a0,sp
    1056:	1f5000ef          	jal	ra,1a4a <memset>
        assert(mailwrite(pid, buffer, BUF_LEN) == BUF_LEN);
    105a:	858a                	mv	a1,sp
    105c:	10000613          	li	a2,256
    1060:	854e                	mv	a0,s3
    1062:	10a010ef          	jal	ra,216c <mailwrite>
    1066:	872a                	mv	a4,a0
    1068:	10000793          	li	a5,256
    106c:	557d                	li	a0,-1
    for (int i = 0; i < 16; ++i)
    106e:	2485                	addiw	s1,s1,1
        assert(mailwrite(pid, buffer, BUF_LEN) == BUF_LEN);
    1070:	0cf70763          	beq	a4,a5,113e <main+0x138>
    1074:	7d5000ef          	jal	ra,2048 <exit>
    1078:	814a                	mv	sp,s2
    for (int i = 0; i < 16; ++i)
    107a:	fd4498e3          	bne	s1,s4,104a <main+0x44>
    }
    puts("father write 16 mails succeed");
    107e:	00001517          	auipc	a0,0x1
    1082:	21250513          	addi	a0,a0,530 # 2290 <unlink+0xd0>
    1086:	27e000ef          	jal	ra,1304 <puts>
    char buffer[BUF_LEN];
    memset(buffer, 16, BUF_LEN);
    108a:	10000613          	li	a2,256
    108e:	45c1                	li	a1,16
    1090:	eb040513          	addi	a0,s0,-336
    1094:	1b7000ef          	jal	ra,1a4a <memset>
    assert(mailwrite(pid, buffer, BUF_LEN) == -1);
    1098:	10000613          	li	a2,256
    109c:	eb040593          	addi	a1,s0,-336
    10a0:	854e                	mv	a0,s3
    10a2:	0ca010ef          	jal	ra,216c <mailwrite>
    10a6:	57fd                	li	a5,-1
    10a8:	00f50563          	beq	a0,a5,10b2 <main+0xac>
    10ac:	557d                	li	a0,-1
    10ae:	79b000ef          	jal	ra,2048 <exit>
    puts("father wirte 1 mail fail");
    10b2:	00001517          	auipc	a0,0x1
    10b6:	1fe50513          	addi	a0,a0,510 # 22b0 <unlink+0xf0>
    10ba:	24a000ef          	jal	ra,1304 <puts>
    puts("father sleep 1.5s");
    10be:	00001517          	auipc	a0,0x1
    10c2:	21250513          	addi	a0,a0,530 # 22d0 <unlink+0x110>
    10c6:	23e000ef          	jal	ra,1304 <puts>
    sleep(1500);
    10ca:	5dc00513          	li	a0,1500
    10ce:	7d7000ef          	jal	ra,20a4 <sleep>
    assert(mailwrite(pid, buffer, BUF_LEN) == BUF_LEN);
    10d2:	10000613          	li	a2,256
    10d6:	eb040593          	addi	a1,s0,-336
    10da:	854e                	mv	a0,s3
    10dc:	090010ef          	jal	ra,216c <mailwrite>
    10e0:	10000793          	li	a5,256
    10e4:	00f50563          	beq	a0,a5,10ee <main+0xe8>
    10e8:	557d                	li	a0,-1
    10ea:	75f000ef          	jal	ra,2048 <exit>
    puts("father wirte 1 mail succeed");
    10ee:	00001517          	auipc	a0,0x1
    10f2:	1fa50513          	addi	a0,a0,506 # 22e8 <unlink+0x128>
    10f6:	20e000ef          	jal	ra,1304 <puts>

    int xstate = -100;
    10fa:	f9c00793          	li	a5,-100
    assert(wait(&xstate) > 0);
    10fe:	eac40513          	addi	a0,s0,-340
    int xstate = -100;
    1102:	eaf42623          	sw	a5,-340(s0)
    assert(wait(&xstate) > 0);
    1106:	03e010ef          	jal	ra,2144 <wait>
    110a:	18a05163          	blez	a0,128c <main+0x286>
    assert(xstate == 0);
    110e:	eac42783          	lw	a5,-340(s0)
    1112:	16079963          	bnez	a5,1284 <main+0x27e>
    puts("mail2 test OK!");
    1116:	00001517          	auipc	a0,0x1
    111a:	1f250513          	addi	a0,a0,498 # 2308 <unlink+0x148>
    111e:	1e6000ef          	jal	ra,1304 <puts>
    return 0;
    1122:	ea040113          	addi	sp,s0,-352
    1126:	60f6                	ld	ra,344(sp)
    1128:	6456                	ld	s0,336(sp)
    112a:	64b6                	ld	s1,328(sp)
    112c:	6916                	ld	s2,320(sp)
    112e:	79f2                	ld	s3,312(sp)
    1130:	7a52                	ld	s4,304(sp)
    1132:	7ab2                	ld	s5,296(sp)
    1134:	7b12                	ld	s6,288(sp)
    1136:	6bf2                	ld	s7,280(sp)
    1138:	4501                	li	a0,0
    113a:	6135                	addi	sp,sp,352
    113c:	8082                	ret
    113e:	814a                	mv	sp,s2
    for (int i = 0; i < 16; ++i)
    1140:	f14495e3          	bne	s1,s4,104a <main+0x44>
    1144:	bf2d                	j	107e <main+0x78>
        puts("I am child");
    1146:	00001517          	auipc	a0,0x1
    114a:	09250513          	addi	a0,a0,146 # 21d8 <unlink+0x18>
    114e:	1b6000ef          	jal	ra,1304 <puts>
    {
    1152:	8b8a                	mv	s7,sp
        char buffer[BUF_LEN];
    1154:	7111                	addi	sp,sp,-256
        memset(buffer, 0, sizeof(buffer));
    1156:	10000613          	li	a2,256
    115a:	4581                	li	a1,0
    115c:	850a                	mv	a0,sp
    115e:	0ed000ef          	jal	ra,1a4a <memset>
        assert(mailread(buffer, BUF_LEN) == -1);
    1162:	10000593          	li	a1,256
    1166:	850a                	mv	a0,sp
    1168:	7f9000ef          	jal	ra,2160 <mailread>
    116c:	57fd                	li	a5,-1
        char buffer[BUF_LEN];
    116e:	8b0a                	mv	s6,sp
        assert(mailread(buffer, BUF_LEN) == -1);
    1170:	12f51a63          	bne	a0,a5,12a4 <main+0x29e>
        puts("child read 1 mail fail");
    1174:	00001517          	auipc	a0,0x1
    1178:	07450513          	addi	a0,a0,116 # 21e8 <unlink+0x28>
    117c:	188000ef          	jal	ra,1304 <puts>
        puts("child sleep 2s");
    1180:	00001517          	auipc	a0,0x1
    1184:	08050513          	addi	a0,a0,128 # 2200 <unlink+0x40>
    1188:	17c000ef          	jal	ra,1304 <puts>
        sleep(2000);
    118c:	7d000513          	li	a0,2000
    1190:	715000ef          	jal	ra,20a4 <sleep>
        for (int i = 0; i < 16; ++i)
    1194:	4481                	li	s1,0
    1196:	4ac1                	li	s5,16
        {
    1198:	890a                	mv	s2,sp
            char buffer[BUF_LEN];
    119a:	7111                	addi	sp,sp,-256
            memset(buffer, 0, sizeof(buffer));
    119c:	10000613          	li	a2,256
    11a0:	4581                	li	a1,0
    11a2:	850a                	mv	a0,sp
    11a4:	0a7000ef          	jal	ra,1a4a <memset>
            assert(mailread(buffer, BUF_LEN) == BUF_LEN);
    11a8:	10000593          	li	a1,256
    11ac:	850a                	mv	a0,sp
    11ae:	7b3000ef          	jal	ra,2160 <mailread>
    11b2:	872a                	mv	a4,a0
    11b4:	10000793          	li	a5,256
    11b8:	557d                	li	a0,-1
            char buffer[BUF_LEN];
    11ba:	8a0a                	mv	s4,sp
            assert(mailread(buffer, BUF_LEN) == BUF_LEN);
    11bc:	00f70463          	beq	a4,a5,11c4 <main+0x1be>
    11c0:	689000ef          	jal	ra,2048 <exit>
            char ans[BUF_LEN];
    11c4:	7111                	addi	sp,sp,-256
            memset(ans, i, BUF_LEN);
    11c6:	85a6                	mv	a1,s1
    11c8:	10000613          	li	a2,256
    11cc:	850a                	mv	a0,sp
    11ce:	07d000ef          	jal	ra,1a4a <memset>
            assert(strncmp(ans, buffer, BUF_LEN) == 0);
    11d2:	850a                	mv	a0,sp
    11d4:	10000613          	li	a2,256
    11d8:	85d2                	mv	a1,s4
    11da:	235000ef          	jal	ra,1c0e <strncmp>
    11de:	e959                	bnez	a0,1274 <main+0x26e>
        for (int i = 0; i < 16; ++i)
    11e0:	2485                	addiw	s1,s1,1
    11e2:	814a                	mv	sp,s2
    11e4:	fb549ae3          	bne	s1,s5,1198 <main+0x192>
        puts("child read 16 mails succeed");
    11e8:	00001517          	auipc	a0,0x1
    11ec:	02850513          	addi	a0,a0,40 # 2210 <unlink+0x50>
    11f0:	114000ef          	jal	ra,1304 <puts>
        assert(mailread(buffer, BUF_LEN) == -1);
    11f4:	10000593          	li	a1,256
    11f8:	855a                	mv	a0,s6
    11fa:	767000ef          	jal	ra,2160 <mailread>
    11fe:	57fd                	li	a5,-1
    1200:	08f51e63          	bne	a0,a5,129c <main+0x296>
        puts("child read 1 mail fail");
    1204:	00001517          	auipc	a0,0x1
    1208:	fe450513          	addi	a0,a0,-28 # 21e8 <unlink+0x28>
    120c:	0f8000ef          	jal	ra,1304 <puts>
        puts("child sleep 1s");
    1210:	00001517          	auipc	a0,0x1
    1214:	02050513          	addi	a0,a0,32 # 2230 <unlink+0x70>
    1218:	0ec000ef          	jal	ra,1304 <puts>
        sleep(1000);
    121c:	3e800513          	li	a0,1000
    1220:	685000ef          	jal	ra,20a4 <sleep>
        assert(mailread(buffer, BUF_LEN) == BUF_LEN);
    1224:	10000593          	li	a1,256
    1228:	855a                	mv	a0,s6
    122a:	737000ef          	jal	ra,2160 <mailread>
    122e:	10000793          	li	a5,256
    1232:	06f51163          	bne	a0,a5,1294 <main+0x28e>
        char ans[BUF_LEN];
    1236:	7111                	addi	sp,sp,-256
        memset(ans, 16, BUF_LEN);
    1238:	10000613          	li	a2,256
    123c:	45c1                	li	a1,16
    123e:	850a                	mv	a0,sp
    1240:	00b000ef          	jal	ra,1a4a <memset>
        assert(strncmp(buffer, ans, BUF_LEN) == 0);
    1244:	10000613          	li	a2,256
    1248:	858a                	mv	a1,sp
    124a:	855a                	mv	a0,s6
    124c:	1c3000ef          	jal	ra,1c0e <strncmp>
    1250:	ed31                	bnez	a0,12ac <main+0x2a6>
        puts("child read 1 mail succeed");
    1252:	00001517          	auipc	a0,0x1
    1256:	fee50513          	addi	a0,a0,-18 # 2240 <unlink+0x80>
    125a:	0aa000ef          	jal	ra,1304 <puts>
        puts("child exit");
    125e:	00001517          	auipc	a0,0x1
    1262:	00250513          	addi	a0,a0,2 # 2260 <unlink+0xa0>
    1266:	09e000ef          	jal	ra,1304 <puts>
        exit(0);
    126a:	4501                	li	a0,0
    126c:	5dd000ef          	jal	ra,2048 <exit>
    1270:	815e                	mv	sp,s7
    1272:	bb55                	j	1026 <main+0x20>
            assert(strncmp(ans, buffer, BUF_LEN) == 0);
    1274:	557d                	li	a0,-1
        for (int i = 0; i < 16; ++i)
    1276:	2485                	addiw	s1,s1,1
            assert(strncmp(ans, buffer, BUF_LEN) == 0);
    1278:	5d1000ef          	jal	ra,2048 <exit>
    127c:	814a                	mv	sp,s2
        for (int i = 0; i < 16; ++i)
    127e:	f1549de3          	bne	s1,s5,1198 <main+0x192>
    1282:	b79d                	j	11e8 <main+0x1e2>
    assert(xstate == 0);
    1284:	557d                	li	a0,-1
    1286:	5c3000ef          	jal	ra,2048 <exit>
    128a:	b571                	j	1116 <main+0x110>
    assert(wait(&xstate) > 0);
    128c:	557d                	li	a0,-1
    128e:	5bb000ef          	jal	ra,2048 <exit>
    1292:	bdb5                	j	110e <main+0x108>
        assert(mailread(buffer, BUF_LEN) == BUF_LEN);
    1294:	557d                	li	a0,-1
    1296:	5b3000ef          	jal	ra,2048 <exit>
    129a:	bf71                	j	1236 <main+0x230>
        assert(mailread(buffer, BUF_LEN) == -1);
    129c:	557d                	li	a0,-1
    129e:	5ab000ef          	jal	ra,2048 <exit>
    12a2:	b78d                	j	1204 <main+0x1fe>
        assert(mailread(buffer, BUF_LEN) == -1);
    12a4:	557d                	li	a0,-1
    12a6:	5a3000ef          	jal	ra,2048 <exit>
    12aa:	b5e9                	j	1174 <main+0x16e>
        assert(strncmp(buffer, ans, BUF_LEN) == 0);
    12ac:	557d                	li	a0,-1
    12ae:	59b000ef          	jal	ra,2048 <exit>
    12b2:	b745                	j	1252 <main+0x24c>

00000000000012b4 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    12b4:	1141                	addi	sp,sp,-16
    12b6:	e406                	sd	ra,8(sp)
    exit(main());
    12b8:	d4fff0ef          	jal	ra,1006 <main>
    12bc:	58d000ef          	jal	ra,2048 <exit>
    return 0;
}
    12c0:	60a2                	ld	ra,8(sp)
    12c2:	4501                	li	a0,0
    12c4:	0141                	addi	sp,sp,16
    12c6:	8082                	ret

00000000000012c8 <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    12c8:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    12ca:	00f10593          	addi	a1,sp,15
    12ce:	4605                	li	a2,1
    12d0:	4501                	li	a0,0
{
    12d2:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12d4:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12d8:	539000ef          	jal	ra,2010 <read>
    return byte;
}
    12dc:	60e2                	ld	ra,24(sp)
    12de:	00f14503          	lbu	a0,15(sp)
    12e2:	6105                	addi	sp,sp,32
    12e4:	8082                	ret

00000000000012e6 <putchar>:

int putchar(int c)
{
    12e6:	1101                	addi	sp,sp,-32
    12e8:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    12ea:	00f10593          	addi	a1,sp,15
    12ee:	4605                	li	a2,1
    12f0:	4505                	li	a0,1
{
    12f2:	ec06                	sd	ra,24(sp)
    char byte = c;
    12f4:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12f8:	523000ef          	jal	ra,201a <write>
}
    12fc:	60e2                	ld	ra,24(sp)
    12fe:	2501                	sext.w	a0,a0
    1300:	6105                	addi	sp,sp,32
    1302:	8082                	ret

0000000000001304 <puts>:

int puts(const char *s)
{
    1304:	1101                	addi	sp,sp,-32
    1306:	e822                	sd	s0,16(sp)
    1308:	ec06                	sd	ra,24(sp)
    130a:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    130c:	145000ef          	jal	ra,1c50 <strlen>
    1310:	862a                	mv	a2,a0
    1312:	85a2                	mv	a1,s0
    1314:	4505                	li	a0,1
    1316:	505000ef          	jal	ra,201a <write>
    131a:	00055763          	bgez	a0,1328 <puts+0x24>
    return r;
}
    131e:	60e2                	ld	ra,24(sp)
    1320:	6442                	ld	s0,16(sp)
    1322:	557d                	li	a0,-1
    1324:	6105                	addi	sp,sp,32
    1326:	8082                	ret
    return write(stdout, &byte, 1);
    1328:	00f10593          	addi	a1,sp,15
    char byte = c;
    132c:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    132e:	4605                	li	a2,1
    1330:	4505                	li	a0,1
    char byte = c;
    1332:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1336:	4e5000ef          	jal	ra,201a <write>
}
    133a:	60e2                	ld	ra,24(sp)
    133c:	6442                	ld	s0,16(sp)
    133e:	41f5551b          	sraiw	a0,a0,0x1f
    1342:	6105                	addi	sp,sp,32
    1344:	8082                	ret

0000000000001346 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1346:	7131                	addi	sp,sp,-192
    1348:	ecce                	sd	s3,88(sp)
    134a:	e8d2                	sd	s4,80(sp)
    134c:	e4d6                	sd	s5,72(sp)
    134e:	e0da                	sd	s6,64(sp)
    1350:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    1352:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1354:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    1356:	6ae1                	lui	s5,0x18
    1358:	000f4a37          	lui	s4,0xf4
    135c:	00989b37          	lui	s6,0x989
{
    1360:	fc86                	sd	ra,120(sp)
    1362:	f8a2                	sd	s0,112(sp)
    1364:	f4a6                	sd	s1,104(sp)
    1366:	f0ca                	sd	s2,96(sp)
    1368:	fc5e                	sd	s7,56(sp)
    136a:	e52e                	sd	a1,136(sp)
    136c:	e932                	sd	a2,144(sp)
    136e:	ed36                	sd	a3,152(sp)
    1370:	f13a                	sd	a4,160(sp)
    1372:	f942                	sd	a6,176(sp)
    1374:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1376:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    1378:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x3cf>
    137c:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x1635f>
    1380:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf1eff>
    1384:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x98733f>
    for (;;)
    {
        if (!*s)
    1388:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    138c:	02500913          	li	s2,37
        if (!*s)
    1390:	1a078f63          	beqz	a5,154e <printf+0x208>
    1394:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1396:	17278e63          	beq	a5,s2,1512 <printf+0x1cc>
    139a:	00164783          	lbu	a5,1(a2)
    139e:	0605                	addi	a2,a2,1
    13a0:	fbfd                	bnez	a5,1396 <printf+0x50>
    13a2:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    13a4:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13a8:	85aa                	mv	a1,a0
    13aa:	8622                	mv	a2,s0
    13ac:	4505                	li	a0,1
    13ae:	46d000ef          	jal	ra,201a <write>
        out(f, a, l);
        if (l)
    13b2:	18041963          	bnez	s0,1544 <printf+0x1fe>
            continue;
        if (s[1] == 0)
    13b6:	0014c783          	lbu	a5,1(s1)
    13ba:	18078a63          	beqz	a5,154e <printf+0x208>
            break;
        switch (s[1])
    13be:	07300713          	li	a4,115
    13c2:	28e78e63          	beq	a5,a4,165e <printf+0x318>
    13c6:	18f76f63          	bltu	a4,a5,1564 <printf+0x21e>
    13ca:	06400713          	li	a4,100
    13ce:	2ae78c63          	beq	a5,a4,1686 <printf+0x340>
    13d2:	07000713          	li	a4,112
    13d6:	3ce79c63          	bne	a5,a4,17ae <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13da:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13dc:	00001797          	auipc	a5,0x1
    13e0:	f6478793          	addi	a5,a5,-156 # 2340 <digits>
            printptr(va_arg(ap, uint64));
    13e4:	6298                	ld	a4,0(a3)
    13e6:	00868093          	addi	ra,a3,8
    13ea:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13ec:	00471293          	slli	t0,a4,0x4
    13f0:	00c71f13          	slli	t5,a4,0xc
    13f4:	01471e13          	slli	t3,a4,0x14
    13f8:	01c71893          	slli	a7,a4,0x1c
    13fc:	02471813          	slli	a6,a4,0x24
    1400:	02871513          	slli	a0,a4,0x28
    1404:	02c71593          	slli	a1,a4,0x2c
    1408:	03071693          	slli	a3,a4,0x30
    140c:	00871f93          	slli	t6,a4,0x8
    1410:	01071e93          	slli	t4,a4,0x10
    1414:	01871313          	slli	t1,a4,0x18
    1418:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    141c:	03c2d293          	srli	t0,t0,0x3c
    1420:	03cf5f13          	srli	t5,t5,0x3c
    1424:	03ce5e13          	srli	t3,t3,0x3c
    1428:	03c8d893          	srli	a7,a7,0x3c
    142c:	03c85813          	srli	a6,a6,0x3c
    1430:	9171                	srli	a0,a0,0x3c
    1432:	91f1                	srli	a1,a1,0x3c
    1434:	92f1                	srli	a3,a3,0x3c
    1436:	92be                	add	t0,t0,a5
    1438:	9f3e                	add	t5,t5,a5
    143a:	9e3e                	add	t3,t3,a5
    143c:	98be                	add	a7,a7,a5
    143e:	983e                	add	a6,a6,a5
    1440:	953e                	add	a0,a0,a5
    1442:	95be                	add	a1,a1,a5
    1444:	96be                	add	a3,a3,a5
    1446:	03c75393          	srli	t2,a4,0x3c
    144a:	01c75b9b          	srliw	s7,a4,0x1c
    144e:	03cfdf93          	srli	t6,t6,0x3c
    1452:	03cede93          	srli	t4,t4,0x3c
    1456:	03c35313          	srli	t1,t1,0x3c
    145a:	9271                	srli	a2,a2,0x3c
    145c:	0002c403          	lbu	s0,0(t0)
    1460:	93be                	add	t2,t2,a5
    1462:	000f4283          	lbu	t0,0(t5)
    1466:	9fbe                	add	t6,t6,a5
    1468:	000e4f03          	lbu	t5,0(t3)
    146c:	9ebe                	add	t4,t4,a5
    146e:	0008ce03          	lbu	t3,0(a7)
    1472:	933e                	add	t1,t1,a5
    1474:	00084883          	lbu	a7,0(a6)
    1478:	9bbe                	add	s7,s7,a5
    147a:	00054803          	lbu	a6,0(a0)
    147e:	963e                	add	a2,a2,a5
    1480:	0005c503          	lbu	a0,0(a1)
    1484:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1488:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    148c:	0003c903          	lbu	s2,0(t2)
    1490:	00064603          	lbu	a2,0(a2)
    1494:	000fc383          	lbu	t2,0(t6)
    1498:	8b3d                	andi	a4,a4,15
    149a:	000ecf83          	lbu	t6,0(t4)
    149e:	92f1                	srli	a3,a3,0x3c
    14a0:	00034e83          	lbu	t4,0(t1)
    14a4:	000bc303          	lbu	t1,0(s7)
    14a8:	96be                	add	a3,a3,a5
    14aa:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    14ac:	7761                	lui	a4,0xffff8
    14ae:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14b2:	00710623          	sb	t2,12(sp)
    14b6:	005106a3          	sb	t0,13(sp)
    14ba:	01f10723          	sb	t6,14(sp)
    14be:	01e107a3          	sb	t5,15(sp)
    14c2:	01d10823          	sb	t4,16(sp)
    14c6:	01c108a3          	sb	t3,17(sp)
    14ca:	00610923          	sb	t1,18(sp)
    14ce:	011109a3          	sb	a7,19(sp)
    14d2:	01010a23          	sb	a6,20(sp)
    14d6:	00a10aa3          	sb	a0,21(sp)
    14da:	00b10b23          	sb	a1,22(sp)
    14de:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    14e2:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14e6:	01210523          	sb	s2,10(sp)
    14ea:	008105a3          	sb	s0,11(sp)
    14ee:	0006c703          	lbu	a4,0(a3)
    14f2:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14f6:	4649                	li	a2,18
    14f8:	002c                	addi	a1,sp,8
    14fa:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14fc:	00e10c23          	sb	a4,24(sp)
    1500:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1504:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1508:	313000ef          	jal	ra,201a <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    150c:	00248513          	addi	a0,s1,2
    1510:	bda5                	j	1388 <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1512:	00064783          	lbu	a5,0(a2)
    1516:	84b2                	mv	s1,a2
    1518:	01278963          	beq	a5,s2,152a <printf+0x1e4>
    151c:	b561                	j	13a4 <printf+0x5e>
    151e:	0024c783          	lbu	a5,2(s1)
    1522:	0605                	addi	a2,a2,1
    1524:	0489                	addi	s1,s1,2
    1526:	e7279fe3          	bne	a5,s2,13a4 <printf+0x5e>
    152a:	0014c783          	lbu	a5,1(s1)
    152e:	ff2788e3          	beq	a5,s2,151e <printf+0x1d8>
        l = z - a;
    1532:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1536:	85aa                	mv	a1,a0
    1538:	8622                	mv	a2,s0
    153a:	4505                	li	a0,1
    153c:	2df000ef          	jal	ra,201a <write>
        if (l)
    1540:	e6040be3          	beqz	s0,13b6 <printf+0x70>
    1544:	8526                	mv	a0,s1
        if (!*s)
    1546:	00054783          	lbu	a5,0(a0)
    154a:	e40795e3          	bnez	a5,1394 <printf+0x4e>
    }
    va_end(ap);
    154e:	70e6                	ld	ra,120(sp)
    1550:	7446                	ld	s0,112(sp)
    1552:	74a6                	ld	s1,104(sp)
    1554:	7906                	ld	s2,96(sp)
    1556:	69e6                	ld	s3,88(sp)
    1558:	6a46                	ld	s4,80(sp)
    155a:	6aa6                	ld	s5,72(sp)
    155c:	6b06                	ld	s6,64(sp)
    155e:	7be2                	ld	s7,56(sp)
    1560:	6129                	addi	sp,sp,192
    1562:	8082                	ret
        switch (s[1])
    1564:	07800713          	li	a4,120
    1568:	24e79363          	bne	a5,a4,17ae <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    156c:	6782                	ld	a5,0(sp)
    156e:	4394                	lw	a3,0(a5)
    1570:	07a1                	addi	a5,a5,8
    1572:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1574:	2606c263          	bltz	a3,17d8 <printf+0x492>
        buf[i--] = digits[x % base];
    1578:	00001797          	auipc	a5,0x1
    157c:	dc878793          	addi	a5,a5,-568 # 2340 <digits>
    1580:	00f6f713          	andi	a4,a3,15
    1584:	973e                	add	a4,a4,a5
    1586:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff5cc0>
    buf[16] = 0;
    158a:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    158e:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    1590:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1594:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    1598:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    159c:	0046d51b          	srliw	a0,a3,0x4
    15a0:	0ad5d563          	bge	a1,a3,164a <printf+0x304>
        buf[i--] = digits[x % base];
    15a4:	8a3d                	andi	a2,a2,15
    15a6:	963e                	add	a2,a2,a5
    15a8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    15ac:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    15b0:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    15b4:	30a5fe63          	bgeu	a1,a0,18d0 <printf+0x58a>
        buf[i--] = digits[x % base];
    15b8:	00f77613          	andi	a2,a4,15
    15bc:	963e                	add	a2,a2,a5
    15be:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    15c2:	45bd                	li	a1,15
    15c4:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    15c8:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    15cc:	00475513          	srli	a0,a4,0x4
    15d0:	30e5f963          	bgeu	a1,a4,18e2 <printf+0x59c>
        buf[i--] = digits[x % base];
    15d4:	8a3d                	andi	a2,a2,15
    15d6:	963e                	add	a2,a2,a5
    15d8:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    15dc:	00875893          	srli	a7,a4,0x8
    15e0:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    15e4:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    15e8:	30a5fd63          	bgeu	a1,a0,1902 <printf+0x5bc>
        buf[i--] = digits[x % base];
    15ec:	8a3d                	andi	a2,a2,15
    15ee:	963e                	add	a2,a2,a5
    15f0:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    15f4:	00c75813          	srli	a6,a4,0xc
    15f8:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    15fc:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    1600:	3315fe63          	bgeu	a1,a7,193c <printf+0x5f6>
        buf[i--] = digits[x % base];
    1604:	8a3d                	andi	a2,a2,15
    1606:	963e                	add	a2,a2,a5
    1608:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    160c:	01075893          	srli	a7,a4,0x10
    1610:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    1614:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    1618:	3305ff63          	bgeu	a1,a6,1956 <printf+0x610>
        buf[i--] = digits[x % base];
    161c:	8a3d                	andi	a2,a2,15
    161e:	963e                	add	a2,a2,a5
    1620:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1624:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    1628:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    162c:	3515f863          	bgeu	a1,a7,197c <printf+0x636>
        buf[i--] = digits[x % base];
    1630:	97ba                	add	a5,a5,a4
    1632:	0007c783          	lbu	a5,0(a5)
    1636:	45a1                	li	a1,8
    1638:	00f10823          	sb	a5,16(sp)
    if (sign)
    163c:	0006d763          	bgez	a3,164a <printf+0x304>
        buf[i--] = '-';
    1640:	02d00793          	li	a5,45
    1644:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1648:	459d                	li	a1,7
    write(f, s, l);
    164a:	4641                	li	a2,16
    164c:	003c                	addi	a5,sp,8
    164e:	9e0d                	subw	a2,a2,a1
    1650:	4505                	li	a0,1
    1652:	95be                	add	a1,a1,a5
    1654:	1c7000ef          	jal	ra,201a <write>
        s += 2;
    1658:	00248513          	addi	a0,s1,2
    165c:	b335                	j	1388 <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    165e:	6782                	ld	a5,0(sp)
    1660:	6380                	ld	s0,0(a5)
    1662:	07a1                	addi	a5,a5,8
    1664:	e03e                	sd	a5,0(sp)
    1666:	22040a63          	beqz	s0,189a <printf+0x554>
            l = strnlen(a, 200);
    166a:	0c800593          	li	a1,200
    166e:	8522                	mv	a0,s0
    1670:	6cc000ef          	jal	ra,1d3c <strnlen>
    write(f, s, l);
    1674:	0005061b          	sext.w	a2,a0
    1678:	85a2                	mv	a1,s0
    167a:	4505                	li	a0,1
    167c:	19f000ef          	jal	ra,201a <write>
        s += 2;
    1680:	00248513          	addi	a0,s1,2
    1684:	b311                	j	1388 <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    1686:	6782                	ld	a5,0(sp)
    1688:	4390                	lw	a2,0(a5)
    168a:	07a1                	addi	a5,a5,8
    168c:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    168e:	1a064363          	bltz	a2,1834 <printf+0x4ee>
        buf[i--] = digits[x % base];
    1692:	46a9                	li	a3,10
    1694:	02d6773b          	remuw	a4,a2,a3
    1698:	00001797          	auipc	a5,0x1
    169c:	ca878793          	addi	a5,a5,-856 # 2340 <digits>
    buf[16] = 0;
    16a0:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    16a4:	4525                	li	a0,9
        x = xx;
    16a6:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    16aa:	973e                	add	a4,a4,a5
    16ac:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    16b0:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    16b4:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    16b8:	2cc55063          	bge	a0,a2,1978 <printf+0x632>
    16bc:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    16c0:	02d5f73b          	remuw	a4,a1,a3
    16c4:	1702                	slli	a4,a4,0x20
    16c6:	9301                	srli	a4,a4,0x20
    16c8:	973e                	add	a4,a4,a5
    16ca:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    16ce:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    16d2:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    16d6:	1f057d63          	bgeu	a0,a6,18d0 <printf+0x58a>
        buf[i--] = digits[x % base];
    16da:	4529                	li	a0,10
    } while ((x /= base) != 0);
    16dc:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    16de:	02a5f73b          	remuw	a4,a1,a0
    16e2:	973e                	add	a4,a4,a5
    16e4:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    16e8:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    16ec:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    16f0:	1ab6f163          	bgeu	a3,a1,1892 <printf+0x54c>
    16f4:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    16f8:	02a776bb          	remuw	a3,a4,a0
    16fc:	96be                	add	a3,a3,a5
    16fe:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1702:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1706:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    170a:	20b87c63          	bgeu	a6,a1,1922 <printf+0x5dc>
    170e:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    1712:	02a776bb          	remuw	a3,a4,a0
    1716:	96be                	add	a3,a3,a5
    1718:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    171c:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1720:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1724:	20b87363          	bgeu	a6,a1,192a <printf+0x5e4>
        buf[i--] = digits[x % base];
    1728:	02a776bb          	remuw	a3,a4,a0
    172c:	96be                	add	a3,a3,a5
    172e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1732:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1736:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    173a:	20b9f563          	bgeu	s3,a1,1944 <printf+0x5fe>
        buf[i--] = digits[x % base];
    173e:	02a776bb          	remuw	a3,a4,a0
    1742:	96be                	add	a3,a3,a5
    1744:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1748:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    174c:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1750:	20bafb63          	bgeu	s5,a1,1966 <printf+0x620>
        buf[i--] = digits[x % base];
    1754:	02a776bb          	remuw	a3,a4,a0
    1758:	96be                	add	a3,a3,a5
    175a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    175e:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1762:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1766:	1eba7c63          	bgeu	s4,a1,195e <printf+0x618>
        buf[i--] = digits[x % base];
    176a:	02a776bb          	remuw	a3,a4,a0
    176e:	96be                	add	a3,a3,a5
    1770:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1774:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1778:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    177c:	14bb7163          	bgeu	s6,a1,18be <printf+0x578>
        buf[i--] = digits[x % base];
    1780:	1702                	slli	a4,a4,0x20
    1782:	9301                	srli	a4,a4,0x20
    1784:	97ba                	add	a5,a5,a4
    1786:	0007c783          	lbu	a5,0(a5)
    178a:	4599                	li	a1,6
    178c:	00f10723          	sb	a5,14(sp)
    if (sign)
    1790:	ea065de3          	bgez	a2,164a <printf+0x304>
        buf[i--] = '-';
    1794:	02d00793          	li	a5,45
    1798:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    179c:	4595                	li	a1,5
    write(f, s, l);
    179e:	003c                	addi	a5,sp,8
    17a0:	4641                	li	a2,16
    17a2:	9e0d                	subw	a2,a2,a1
    17a4:	4505                	li	a0,1
    17a6:	95be                	add	a1,a1,a5
    17a8:	073000ef          	jal	ra,201a <write>
    17ac:	b575                	j	1658 <printf+0x312>
    char byte = c;
    17ae:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    17b2:	4605                	li	a2,1
    17b4:	002c                	addi	a1,sp,8
    17b6:	4505                	li	a0,1
    char byte = c;
    17b8:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    17bc:	05f000ef          	jal	ra,201a <write>
    char byte = c;
    17c0:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    17c4:	4605                	li	a2,1
    17c6:	002c                	addi	a1,sp,8
    17c8:	4505                	li	a0,1
    char byte = c;
    17ca:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    17ce:	04d000ef          	jal	ra,201a <write>
        s += 2;
    17d2:	00248513          	addi	a0,s1,2
    17d6:	be4d                	j	1388 <printf+0x42>
        x = -xx;
    17d8:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    17dc:	00001797          	auipc	a5,0x1
    17e0:	b6478793          	addi	a5,a5,-1180 # 2340 <digits>
    17e4:	00f77613          	andi	a2,a4,15
    17e8:	963e                	add	a2,a2,a5
    17ea:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    17ee:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    17f2:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    17f4:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    17f8:	0047551b          	srliw	a0,a4,0x4
    17fc:	0047561b          	srliw	a2,a4,0x4
    1800:	0ab6d263          	bge	a3,a1,18a4 <printf+0x55e>
        buf[i--] = digits[x % base];
    1804:	8a3d                	andi	a2,a2,15
    1806:	963e                	add	a2,a2,a5
    1808:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    180c:	463d                	li	a2,15
    180e:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    1812:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    1816:	daa661e3          	bltu	a2,a0,15b8 <printf+0x272>
        buf[i--] = '-';
    181a:	02d00793          	li	a5,45
    181e:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1822:	45b5                	li	a1,13
    write(f, s, l);
    1824:	003c                	addi	a5,sp,8
    1826:	4641                	li	a2,16
    1828:	9e0d                	subw	a2,a2,a1
    182a:	4505                	li	a0,1
    182c:	95be                	add	a1,a1,a5
    182e:	7ec000ef          	jal	ra,201a <write>
    1832:	b51d                	j	1658 <printf+0x312>
        x = -xx;
    1834:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    1838:	46a9                	li	a3,10
    183a:	02d875bb          	remuw	a1,a6,a3
    183e:	00001797          	auipc	a5,0x1
    1842:	b0278793          	addi	a5,a5,-1278 # 2340 <digits>
    buf[16] = 0;
    1846:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    184a:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    184c:	95be                	add	a1,a1,a5
    184e:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    1852:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    1856:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    185a:	04a65563          	bge	a2,a0,18a4 <printf+0x55e>
    185e:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1862:	02d775bb          	remuw	a1,a4,a3
    1866:	95be                	add	a1,a1,a5
    1868:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    186c:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    1870:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    1874:	fb0573e3          	bgeu	a0,a6,181a <printf+0x4d4>
        buf[i--] = digits[x % base];
    1878:	4529                	li	a0,10
    } while ((x /= base) != 0);
    187a:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    187c:	02a5f73b          	remuw	a4,a1,a0
    1880:	973e                	add	a4,a4,a5
    1882:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    1886:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    188a:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    188e:	e6b6e3e3          	bltu	a3,a1,16f4 <printf+0x3ae>
        buf[i--] = digits[x % base];
    1892:	45b5                	li	a1,13
    if (sign)
    1894:	da065be3          	bgez	a2,164a <printf+0x304>
    1898:	a881                	j	18e8 <printf+0x5a2>
                a = "(null)";
    189a:	00001417          	auipc	s0,0x1
    189e:	a7e40413          	addi	s0,s0,-1410 # 2318 <unlink+0x158>
    18a2:	b3e1                	j	166a <printf+0x324>
        buf[i--] = '-';
    18a4:	02d00793          	li	a5,45
    18a8:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    18ac:	45b9                	li	a1,14
    write(f, s, l);
    18ae:	003c                	addi	a5,sp,8
    18b0:	4641                	li	a2,16
    18b2:	9e0d                	subw	a2,a2,a1
    18b4:	4505                	li	a0,1
    18b6:	95be                	add	a1,a1,a5
    18b8:	762000ef          	jal	ra,201a <write>
    18bc:	bb71                	j	1658 <printf+0x312>
        buf[i--] = digits[x % base];
    18be:	459d                	li	a1,7
    if (sign)
    18c0:	d80655e3          	bgez	a2,164a <printf+0x304>
        buf[i--] = '-';
    18c4:	02d00793          	li	a5,45
    18c8:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    18cc:	4599                	li	a1,6
    18ce:	bbb5                	j	164a <printf+0x304>
    18d0:	45b9                	li	a1,14
    write(f, s, l);
    18d2:	003c                	addi	a5,sp,8
    18d4:	4641                	li	a2,16
    18d6:	9e0d                	subw	a2,a2,a1
    18d8:	4505                	li	a0,1
    18da:	95be                	add	a1,a1,a5
    18dc:	73e000ef          	jal	ra,201a <write>
    18e0:	bba5                	j	1658 <printf+0x312>
        buf[i--] = digits[x % base];
    18e2:	45b5                	li	a1,13
    if (sign)
    18e4:	d606d3e3          	bgez	a3,164a <printf+0x304>
        buf[i--] = '-';
    18e8:	02d00793          	li	a5,45
    18ec:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    18f0:	45b1                	li	a1,12
    write(f, s, l);
    18f2:	003c                	addi	a5,sp,8
    18f4:	4641                	li	a2,16
    18f6:	9e0d                	subw	a2,a2,a1
    18f8:	4505                	li	a0,1
    18fa:	95be                	add	a1,a1,a5
    18fc:	71e000ef          	jal	ra,201a <write>
    1900:	bba1                	j	1658 <printf+0x312>
        buf[i--] = digits[x % base];
    1902:	45b1                	li	a1,12
    if (sign)
    1904:	d406d3e3          	bgez	a3,164a <printf+0x304>
        buf[i--] = '-';
    1908:	02d00793          	li	a5,45
    190c:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1910:	45ad                	li	a1,11
    write(f, s, l);
    1912:	003c                	addi	a5,sp,8
    1914:	4641                	li	a2,16
    1916:	9e0d                	subw	a2,a2,a1
    1918:	4505                	li	a0,1
    191a:	95be                	add	a1,a1,a5
    191c:	6fe000ef          	jal	ra,201a <write>
    1920:	bb25                	j	1658 <printf+0x312>
        buf[i--] = digits[x % base];
    1922:	45b1                	li	a1,12
    if (sign)
    1924:	d20653e3          	bgez	a2,164a <printf+0x304>
    1928:	b7c5                	j	1908 <printf+0x5c2>
        buf[i--] = digits[x % base];
    192a:	45ad                	li	a1,11
    if (sign)
    192c:	d0065fe3          	bgez	a2,164a <printf+0x304>
        buf[i--] = '-';
    1930:	02d00793          	li	a5,45
    1934:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1938:	45a9                	li	a1,10
    193a:	bb01                	j	164a <printf+0x304>
    193c:	45ad                	li	a1,11
    if (sign)
    193e:	d006d6e3          	bgez	a3,164a <printf+0x304>
    1942:	b7fd                	j	1930 <printf+0x5ea>
        buf[i--] = digits[x % base];
    1944:	45a9                	li	a1,10
    if (sign)
    1946:	d00652e3          	bgez	a2,164a <printf+0x304>
        buf[i--] = '-';
    194a:	02d00793          	li	a5,45
    194e:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1952:	45a5                	li	a1,9
    1954:	b9dd                	j	164a <printf+0x304>
    1956:	45a9                	li	a1,10
    if (sign)
    1958:	ce06d9e3          	bgez	a3,164a <printf+0x304>
    195c:	b7fd                	j	194a <printf+0x604>
        buf[i--] = digits[x % base];
    195e:	45a1                	li	a1,8
    if (sign)
    1960:	ce0655e3          	bgez	a2,164a <printf+0x304>
    1964:	b9f1                	j	1640 <printf+0x2fa>
        buf[i--] = digits[x % base];
    1966:	45a5                	li	a1,9
    if (sign)
    1968:	ce0651e3          	bgez	a2,164a <printf+0x304>
        buf[i--] = '-';
    196c:	02d00793          	li	a5,45
    1970:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1974:	45a1                	li	a1,8
    1976:	b9d1                	j	164a <printf+0x304>
    i = 15;
    1978:	45bd                	li	a1,15
    197a:	b9c1                	j	164a <printf+0x304>
        buf[i--] = digits[x % base];
    197c:	45a5                	li	a1,9
    if (sign)
    197e:	cc06d6e3          	bgez	a3,164a <printf+0x304>
    1982:	b7ed                	j	196c <printf+0x626>

0000000000001984 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1984:	02000793          	li	a5,32
    1988:	00f50663          	beq	a0,a5,1994 <isspace+0x10>
    198c:	355d                	addiw	a0,a0,-9
    198e:	00553513          	sltiu	a0,a0,5
    1992:	8082                	ret
    1994:	4505                	li	a0,1
}
    1996:	8082                	ret

0000000000001998 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1998:	fd05051b          	addiw	a0,a0,-48
}
    199c:	00a53513          	sltiu	a0,a0,10
    19a0:	8082                	ret

00000000000019a2 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    19a2:	02000613          	li	a2,32
    19a6:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    19a8:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    19ac:	ff77069b          	addiw	a3,a4,-9
    19b0:	04c70d63          	beq	a4,a2,1a0a <atoi+0x68>
    19b4:	0007079b          	sext.w	a5,a4
    19b8:	04d5f963          	bgeu	a1,a3,1a0a <atoi+0x68>
        s++;
    switch (*s)
    19bc:	02b00693          	li	a3,43
    19c0:	04d70a63          	beq	a4,a3,1a14 <atoi+0x72>
    19c4:	02d00693          	li	a3,45
    19c8:	06d70463          	beq	a4,a3,1a30 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    19cc:	fd07859b          	addiw	a1,a5,-48
    19d0:	4625                	li	a2,9
    19d2:	873e                	mv	a4,a5
    19d4:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    19d6:	4e01                	li	t3,0
    while (isdigit(*s))
    19d8:	04b66a63          	bltu	a2,a1,1a2c <atoi+0x8a>
    int n = 0, neg = 0;
    19dc:	4501                	li	a0,0
    while (isdigit(*s))
    19de:	4825                	li	a6,9
    19e0:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    19e4:	0025179b          	slliw	a5,a0,0x2
    19e8:	9d3d                	addw	a0,a0,a5
    19ea:	fd07031b          	addiw	t1,a4,-48
    19ee:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    19f2:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    19f6:	0685                	addi	a3,a3,1
    19f8:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    19fc:	0006071b          	sext.w	a4,a2
    1a00:	feb870e3          	bgeu	a6,a1,19e0 <atoi+0x3e>
    return neg ? n : -n;
    1a04:	000e0563          	beqz	t3,1a0e <atoi+0x6c>
}
    1a08:	8082                	ret
        s++;
    1a0a:	0505                	addi	a0,a0,1
    1a0c:	bf71                	j	19a8 <atoi+0x6>
    1a0e:	4113053b          	subw	a0,t1,a7
    1a12:	8082                	ret
    while (isdigit(*s))
    1a14:	00154783          	lbu	a5,1(a0)
    1a18:	4625                	li	a2,9
        s++;
    1a1a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1a1e:	fd07859b          	addiw	a1,a5,-48
    1a22:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1a26:	4e01                	li	t3,0
    while (isdigit(*s))
    1a28:	fab67ae3          	bgeu	a2,a1,19dc <atoi+0x3a>
    1a2c:	4501                	li	a0,0
}
    1a2e:	8082                	ret
    while (isdigit(*s))
    1a30:	00154783          	lbu	a5,1(a0)
    1a34:	4625                	li	a2,9
        s++;
    1a36:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1a3a:	fd07859b          	addiw	a1,a5,-48
    1a3e:	0007871b          	sext.w	a4,a5
    1a42:	feb665e3          	bltu	a2,a1,1a2c <atoi+0x8a>
        neg = 1;
    1a46:	4e05                	li	t3,1
    1a48:	bf51                	j	19dc <atoi+0x3a>

0000000000001a4a <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a4a:	16060d63          	beqz	a2,1bc4 <memset+0x17a>
    1a4e:	40a007b3          	neg	a5,a0
    1a52:	8b9d                	andi	a5,a5,7
    1a54:	00778713          	addi	a4,a5,7
    1a58:	482d                	li	a6,11
    1a5a:	0ff5f593          	andi	a1,a1,255
    1a5e:	fff60693          	addi	a3,a2,-1
    1a62:	17076263          	bltu	a4,a6,1bc6 <memset+0x17c>
    1a66:	16e6ea63          	bltu	a3,a4,1bda <memset+0x190>
    1a6a:	16078563          	beqz	a5,1bd4 <memset+0x18a>
    1a6e:	00b50023          	sb	a1,0(a0)
    1a72:	4705                	li	a4,1
    1a74:	00150e93          	addi	t4,a0,1
    1a78:	14e78c63          	beq	a5,a4,1bd0 <memset+0x186>
    1a7c:	00b500a3          	sb	a1,1(a0)
    1a80:	4709                	li	a4,2
    1a82:	00250e93          	addi	t4,a0,2
    1a86:	14e78d63          	beq	a5,a4,1be0 <memset+0x196>
    1a8a:	00b50123          	sb	a1,2(a0)
    1a8e:	470d                	li	a4,3
    1a90:	00350e93          	addi	t4,a0,3
    1a94:	12e78b63          	beq	a5,a4,1bca <memset+0x180>
    1a98:	00b501a3          	sb	a1,3(a0)
    1a9c:	4711                	li	a4,4
    1a9e:	00450e93          	addi	t4,a0,4
    1aa2:	14e78163          	beq	a5,a4,1be4 <memset+0x19a>
    1aa6:	00b50223          	sb	a1,4(a0)
    1aaa:	4715                	li	a4,5
    1aac:	00550e93          	addi	t4,a0,5
    1ab0:	12e78c63          	beq	a5,a4,1be8 <memset+0x19e>
    1ab4:	00b502a3          	sb	a1,5(a0)
    1ab8:	471d                	li	a4,7
    1aba:	00650e93          	addi	t4,a0,6
    1abe:	12e79763          	bne	a5,a4,1bec <memset+0x1a2>
    1ac2:	00750e93          	addi	t4,a0,7
    1ac6:	00b50323          	sb	a1,6(a0)
    1aca:	4f1d                	li	t5,7
    1acc:	00859713          	slli	a4,a1,0x8
    1ad0:	8f4d                	or	a4,a4,a1
    1ad2:	01059e13          	slli	t3,a1,0x10
    1ad6:	01c76e33          	or	t3,a4,t3
    1ada:	01859313          	slli	t1,a1,0x18
    1ade:	006e6333          	or	t1,t3,t1
    1ae2:	02059893          	slli	a7,a1,0x20
    1ae6:	011368b3          	or	a7,t1,a7
    1aea:	02859813          	slli	a6,a1,0x28
    1aee:	40f60333          	sub	t1,a2,a5
    1af2:	0108e833          	or	a6,a7,a6
    1af6:	03059693          	slli	a3,a1,0x30
    1afa:	00d866b3          	or	a3,a6,a3
    1afe:	03859713          	slli	a4,a1,0x38
    1b02:	97aa                	add	a5,a5,a0
    1b04:	ff837813          	andi	a6,t1,-8
    1b08:	8f55                	or	a4,a4,a3
    1b0a:	00f806b3          	add	a3,a6,a5
    1b0e:	e398                	sd	a4,0(a5)
    1b10:	07a1                	addi	a5,a5,8
    1b12:	fed79ee3          	bne	a5,a3,1b0e <memset+0xc4>
    1b16:	ff837693          	andi	a3,t1,-8
    1b1a:	00de87b3          	add	a5,t4,a3
    1b1e:	01e6873b          	addw	a4,a3,t5
    1b22:	0ad30663          	beq	t1,a3,1bce <memset+0x184>
    1b26:	00b78023          	sb	a1,0(a5)
    1b2a:	0017069b          	addiw	a3,a4,1
    1b2e:	08c6fb63          	bgeu	a3,a2,1bc4 <memset+0x17a>
    1b32:	00b780a3          	sb	a1,1(a5)
    1b36:	0027069b          	addiw	a3,a4,2
    1b3a:	08c6f563          	bgeu	a3,a2,1bc4 <memset+0x17a>
    1b3e:	00b78123          	sb	a1,2(a5)
    1b42:	0037069b          	addiw	a3,a4,3
    1b46:	06c6ff63          	bgeu	a3,a2,1bc4 <memset+0x17a>
    1b4a:	00b781a3          	sb	a1,3(a5)
    1b4e:	0047069b          	addiw	a3,a4,4
    1b52:	06c6f963          	bgeu	a3,a2,1bc4 <memset+0x17a>
    1b56:	00b78223          	sb	a1,4(a5)
    1b5a:	0057069b          	addiw	a3,a4,5
    1b5e:	06c6f363          	bgeu	a3,a2,1bc4 <memset+0x17a>
    1b62:	00b782a3          	sb	a1,5(a5)
    1b66:	0067069b          	addiw	a3,a4,6
    1b6a:	04c6fd63          	bgeu	a3,a2,1bc4 <memset+0x17a>
    1b6e:	00b78323          	sb	a1,6(a5)
    1b72:	0077069b          	addiw	a3,a4,7
    1b76:	04c6f763          	bgeu	a3,a2,1bc4 <memset+0x17a>
    1b7a:	00b783a3          	sb	a1,7(a5)
    1b7e:	0087069b          	addiw	a3,a4,8
    1b82:	04c6f163          	bgeu	a3,a2,1bc4 <memset+0x17a>
    1b86:	00b78423          	sb	a1,8(a5)
    1b8a:	0097069b          	addiw	a3,a4,9
    1b8e:	02c6fb63          	bgeu	a3,a2,1bc4 <memset+0x17a>
    1b92:	00b784a3          	sb	a1,9(a5)
    1b96:	00a7069b          	addiw	a3,a4,10
    1b9a:	02c6f563          	bgeu	a3,a2,1bc4 <memset+0x17a>
    1b9e:	00b78523          	sb	a1,10(a5)
    1ba2:	00b7069b          	addiw	a3,a4,11
    1ba6:	00c6ff63          	bgeu	a3,a2,1bc4 <memset+0x17a>
    1baa:	00b785a3          	sb	a1,11(a5)
    1bae:	00c7069b          	addiw	a3,a4,12
    1bb2:	00c6f963          	bgeu	a3,a2,1bc4 <memset+0x17a>
    1bb6:	00b78623          	sb	a1,12(a5)
    1bba:	2735                	addiw	a4,a4,13
    1bbc:	00c77463          	bgeu	a4,a2,1bc4 <memset+0x17a>
    1bc0:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1bc4:	8082                	ret
    1bc6:	472d                	li	a4,11
    1bc8:	bd79                	j	1a66 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bca:	4f0d                	li	t5,3
    1bcc:	b701                	j	1acc <memset+0x82>
    1bce:	8082                	ret
    1bd0:	4f05                	li	t5,1
    1bd2:	bded                	j	1acc <memset+0x82>
    1bd4:	8eaa                	mv	t4,a0
    1bd6:	4f01                	li	t5,0
    1bd8:	bdd5                	j	1acc <memset+0x82>
    1bda:	87aa                	mv	a5,a0
    1bdc:	4701                	li	a4,0
    1bde:	b7a1                	j	1b26 <memset+0xdc>
    1be0:	4f09                	li	t5,2
    1be2:	b5ed                	j	1acc <memset+0x82>
    1be4:	4f11                	li	t5,4
    1be6:	b5dd                	j	1acc <memset+0x82>
    1be8:	4f15                	li	t5,5
    1bea:	b5cd                	j	1acc <memset+0x82>
    1bec:	4f19                	li	t5,6
    1bee:	bdf9                	j	1acc <memset+0x82>

0000000000001bf0 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1bf0:	00054783          	lbu	a5,0(a0)
    1bf4:	0005c703          	lbu	a4,0(a1)
    1bf8:	00e79863          	bne	a5,a4,1c08 <strcmp+0x18>
    1bfc:	0505                	addi	a0,a0,1
    1bfe:	0585                	addi	a1,a1,1
    1c00:	fbe5                	bnez	a5,1bf0 <strcmp>
    1c02:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1c04:	9d19                	subw	a0,a0,a4
    1c06:	8082                	ret
    1c08:	0007851b          	sext.w	a0,a5
    1c0c:	bfe5                	j	1c04 <strcmp+0x14>

0000000000001c0e <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1c0e:	ce05                	beqz	a2,1c46 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1c10:	00054703          	lbu	a4,0(a0)
    1c14:	0005c783          	lbu	a5,0(a1)
    1c18:	cb0d                	beqz	a4,1c4a <strncmp+0x3c>
    if (!n--)
    1c1a:	167d                	addi	a2,a2,-1
    1c1c:	00c506b3          	add	a3,a0,a2
    1c20:	a819                	j	1c36 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1c22:	00a68e63          	beq	a3,a0,1c3e <strncmp+0x30>
    1c26:	0505                	addi	a0,a0,1
    1c28:	00e79b63          	bne	a5,a4,1c3e <strncmp+0x30>
    1c2c:	00054703          	lbu	a4,0(a0)
    1c30:	0005c783          	lbu	a5,0(a1)
    1c34:	cb19                	beqz	a4,1c4a <strncmp+0x3c>
    1c36:	0005c783          	lbu	a5,0(a1)
    1c3a:	0585                	addi	a1,a1,1
    1c3c:	f3fd                	bnez	a5,1c22 <strncmp+0x14>
        ;
    return *l - *r;
    1c3e:	0007051b          	sext.w	a0,a4
    1c42:	9d1d                	subw	a0,a0,a5
    1c44:	8082                	ret
        return 0;
    1c46:	4501                	li	a0,0
}
    1c48:	8082                	ret
    1c4a:	4501                	li	a0,0
    return *l - *r;
    1c4c:	9d1d                	subw	a0,a0,a5
    1c4e:	8082                	ret

0000000000001c50 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1c50:	00757793          	andi	a5,a0,7
    1c54:	cf89                	beqz	a5,1c6e <strlen+0x1e>
    1c56:	87aa                	mv	a5,a0
    1c58:	a029                	j	1c62 <strlen+0x12>
    1c5a:	0785                	addi	a5,a5,1
    1c5c:	0077f713          	andi	a4,a5,7
    1c60:	cb01                	beqz	a4,1c70 <strlen+0x20>
        if (!*s)
    1c62:	0007c703          	lbu	a4,0(a5)
    1c66:	fb75                	bnez	a4,1c5a <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1c68:	40a78533          	sub	a0,a5,a0
}
    1c6c:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1c6e:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1c70:	6394                	ld	a3,0(a5)
    1c72:	00000597          	auipc	a1,0x0
    1c76:	6b65b583          	ld	a1,1718(a1) # 2328 <BUF_LEN+0x8>
    1c7a:	00000617          	auipc	a2,0x0
    1c7e:	6b663603          	ld	a2,1718(a2) # 2330 <BUF_LEN+0x10>
    1c82:	a019                	j	1c88 <strlen+0x38>
    1c84:	6794                	ld	a3,8(a5)
    1c86:	07a1                	addi	a5,a5,8
    1c88:	00b68733          	add	a4,a3,a1
    1c8c:	fff6c693          	not	a3,a3
    1c90:	8f75                	and	a4,a4,a3
    1c92:	8f71                	and	a4,a4,a2
    1c94:	db65                	beqz	a4,1c84 <strlen+0x34>
    for (; *s; s++)
    1c96:	0007c703          	lbu	a4,0(a5)
    1c9a:	d779                	beqz	a4,1c68 <strlen+0x18>
    1c9c:	0017c703          	lbu	a4,1(a5)
    1ca0:	0785                	addi	a5,a5,1
    1ca2:	d379                	beqz	a4,1c68 <strlen+0x18>
    1ca4:	0017c703          	lbu	a4,1(a5)
    1ca8:	0785                	addi	a5,a5,1
    1caa:	fb6d                	bnez	a4,1c9c <strlen+0x4c>
    1cac:	bf75                	j	1c68 <strlen+0x18>

0000000000001cae <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1cae:	00757713          	andi	a4,a0,7
{
    1cb2:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1cb4:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1cb8:	cb19                	beqz	a4,1cce <memchr+0x20>
    1cba:	ce25                	beqz	a2,1d32 <memchr+0x84>
    1cbc:	0007c703          	lbu	a4,0(a5)
    1cc0:	04b70e63          	beq	a4,a1,1d1c <memchr+0x6e>
    1cc4:	0785                	addi	a5,a5,1
    1cc6:	0077f713          	andi	a4,a5,7
    1cca:	167d                	addi	a2,a2,-1
    1ccc:	f77d                	bnez	a4,1cba <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1cce:	4501                	li	a0,0
    if (n && *s != c)
    1cd0:	c235                	beqz	a2,1d34 <memchr+0x86>
    1cd2:	0007c703          	lbu	a4,0(a5)
    1cd6:	04b70363          	beq	a4,a1,1d1c <memchr+0x6e>
        size_t k = ONES * c;
    1cda:	00000517          	auipc	a0,0x0
    1cde:	65e53503          	ld	a0,1630(a0) # 2338 <BUF_LEN+0x18>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1ce2:	471d                	li	a4,7
        size_t k = ONES * c;
    1ce4:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1ce8:	02c77a63          	bgeu	a4,a2,1d1c <memchr+0x6e>
    1cec:	00000897          	auipc	a7,0x0
    1cf0:	63c8b883          	ld	a7,1596(a7) # 2328 <BUF_LEN+0x8>
    1cf4:	00000817          	auipc	a6,0x0
    1cf8:	63c83803          	ld	a6,1596(a6) # 2330 <BUF_LEN+0x10>
    1cfc:	431d                	li	t1,7
    1cfe:	a029                	j	1d08 <memchr+0x5a>
    1d00:	1661                	addi	a2,a2,-8
    1d02:	07a1                	addi	a5,a5,8
    1d04:	02c37963          	bgeu	t1,a2,1d36 <memchr+0x88>
    1d08:	6398                	ld	a4,0(a5)
    1d0a:	8f29                	xor	a4,a4,a0
    1d0c:	011706b3          	add	a3,a4,a7
    1d10:	fff74713          	not	a4,a4
    1d14:	8f75                	and	a4,a4,a3
    1d16:	01077733          	and	a4,a4,a6
    1d1a:	d37d                	beqz	a4,1d00 <memchr+0x52>
    1d1c:	853e                	mv	a0,a5
    1d1e:	97b2                	add	a5,a5,a2
    1d20:	a021                	j	1d28 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1d22:	0505                	addi	a0,a0,1
    1d24:	00f50763          	beq	a0,a5,1d32 <memchr+0x84>
    1d28:	00054703          	lbu	a4,0(a0)
    1d2c:	feb71be3          	bne	a4,a1,1d22 <memchr+0x74>
    1d30:	8082                	ret
    return n ? (void *)s : 0;
    1d32:	4501                	li	a0,0
}
    1d34:	8082                	ret
    return n ? (void *)s : 0;
    1d36:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1d38:	f275                	bnez	a2,1d1c <memchr+0x6e>
}
    1d3a:	8082                	ret

0000000000001d3c <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1d3c:	1101                	addi	sp,sp,-32
    1d3e:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1d40:	862e                	mv	a2,a1
{
    1d42:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1d44:	4581                	li	a1,0
{
    1d46:	e426                	sd	s1,8(sp)
    1d48:	ec06                	sd	ra,24(sp)
    1d4a:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1d4c:	f63ff0ef          	jal	ra,1cae <memchr>
    return p ? p - s : n;
    1d50:	c519                	beqz	a0,1d5e <strnlen+0x22>
}
    1d52:	60e2                	ld	ra,24(sp)
    1d54:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1d56:	8d05                	sub	a0,a0,s1
}
    1d58:	64a2                	ld	s1,8(sp)
    1d5a:	6105                	addi	sp,sp,32
    1d5c:	8082                	ret
    1d5e:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1d60:	8522                	mv	a0,s0
}
    1d62:	6442                	ld	s0,16(sp)
    1d64:	64a2                	ld	s1,8(sp)
    1d66:	6105                	addi	sp,sp,32
    1d68:	8082                	ret

0000000000001d6a <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1d6a:	00b547b3          	xor	a5,a0,a1
    1d6e:	8b9d                	andi	a5,a5,7
    1d70:	eb95                	bnez	a5,1da4 <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1d72:	0075f793          	andi	a5,a1,7
    1d76:	e7b1                	bnez	a5,1dc2 <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1d78:	6198                	ld	a4,0(a1)
    1d7a:	00000617          	auipc	a2,0x0
    1d7e:	5ae63603          	ld	a2,1454(a2) # 2328 <BUF_LEN+0x8>
    1d82:	00000817          	auipc	a6,0x0
    1d86:	5ae83803          	ld	a6,1454(a6) # 2330 <BUF_LEN+0x10>
    1d8a:	a029                	j	1d94 <stpcpy+0x2a>
    1d8c:	e118                	sd	a4,0(a0)
    1d8e:	6598                	ld	a4,8(a1)
    1d90:	05a1                	addi	a1,a1,8
    1d92:	0521                	addi	a0,a0,8
    1d94:	00c707b3          	add	a5,a4,a2
    1d98:	fff74693          	not	a3,a4
    1d9c:	8ff5                	and	a5,a5,a3
    1d9e:	0107f7b3          	and	a5,a5,a6
    1da2:	d7ed                	beqz	a5,1d8c <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1da4:	0005c783          	lbu	a5,0(a1)
    1da8:	00f50023          	sb	a5,0(a0)
    1dac:	c785                	beqz	a5,1dd4 <stpcpy+0x6a>
    1dae:	0015c783          	lbu	a5,1(a1)
    1db2:	0505                	addi	a0,a0,1
    1db4:	0585                	addi	a1,a1,1
    1db6:	00f50023          	sb	a5,0(a0)
    1dba:	fbf5                	bnez	a5,1dae <stpcpy+0x44>
        ;
    return d;
}
    1dbc:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1dbe:	0505                	addi	a0,a0,1
    1dc0:	df45                	beqz	a4,1d78 <stpcpy+0xe>
            if (!(*d = *s))
    1dc2:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1dc6:	0585                	addi	a1,a1,1
    1dc8:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1dcc:	00f50023          	sb	a5,0(a0)
    1dd0:	f7fd                	bnez	a5,1dbe <stpcpy+0x54>
}
    1dd2:	8082                	ret
    1dd4:	8082                	ret

0000000000001dd6 <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1dd6:	00b547b3          	xor	a5,a0,a1
    1dda:	8b9d                	andi	a5,a5,7
    1ddc:	1a079863          	bnez	a5,1f8c <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1de0:	0075f793          	andi	a5,a1,7
    1de4:	16078463          	beqz	a5,1f4c <stpncpy+0x176>
    1de8:	ea01                	bnez	a2,1df8 <stpncpy+0x22>
    1dea:	a421                	j	1ff2 <stpncpy+0x21c>
    1dec:	167d                	addi	a2,a2,-1
    1dee:	0505                	addi	a0,a0,1
    1df0:	14070e63          	beqz	a4,1f4c <stpncpy+0x176>
    1df4:	1a060863          	beqz	a2,1fa4 <stpncpy+0x1ce>
    1df8:	0005c783          	lbu	a5,0(a1)
    1dfc:	0585                	addi	a1,a1,1
    1dfe:	0075f713          	andi	a4,a1,7
    1e02:	00f50023          	sb	a5,0(a0)
    1e06:	f3fd                	bnez	a5,1dec <stpncpy+0x16>
    1e08:	4805                	li	a6,1
    1e0a:	1a061863          	bnez	a2,1fba <stpncpy+0x1e4>
    1e0e:	40a007b3          	neg	a5,a0
    1e12:	8b9d                	andi	a5,a5,7
    1e14:	4681                	li	a3,0
    1e16:	18061a63          	bnez	a2,1faa <stpncpy+0x1d4>
    1e1a:	00778713          	addi	a4,a5,7
    1e1e:	45ad                	li	a1,11
    1e20:	18b76363          	bltu	a4,a1,1fa6 <stpncpy+0x1d0>
    1e24:	1ae6eb63          	bltu	a3,a4,1fda <stpncpy+0x204>
    1e28:	1a078363          	beqz	a5,1fce <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1e2c:	00050023          	sb	zero,0(a0)
    1e30:	4685                	li	a3,1
    1e32:	00150713          	addi	a4,a0,1
    1e36:	18d78f63          	beq	a5,a3,1fd4 <stpncpy+0x1fe>
    1e3a:	000500a3          	sb	zero,1(a0)
    1e3e:	4689                	li	a3,2
    1e40:	00250713          	addi	a4,a0,2
    1e44:	18d78e63          	beq	a5,a3,1fe0 <stpncpy+0x20a>
    1e48:	00050123          	sb	zero,2(a0)
    1e4c:	468d                	li	a3,3
    1e4e:	00350713          	addi	a4,a0,3
    1e52:	16d78c63          	beq	a5,a3,1fca <stpncpy+0x1f4>
    1e56:	000501a3          	sb	zero,3(a0)
    1e5a:	4691                	li	a3,4
    1e5c:	00450713          	addi	a4,a0,4
    1e60:	18d78263          	beq	a5,a3,1fe4 <stpncpy+0x20e>
    1e64:	00050223          	sb	zero,4(a0)
    1e68:	4695                	li	a3,5
    1e6a:	00550713          	addi	a4,a0,5
    1e6e:	16d78d63          	beq	a5,a3,1fe8 <stpncpy+0x212>
    1e72:	000502a3          	sb	zero,5(a0)
    1e76:	469d                	li	a3,7
    1e78:	00650713          	addi	a4,a0,6
    1e7c:	16d79863          	bne	a5,a3,1fec <stpncpy+0x216>
    1e80:	00750713          	addi	a4,a0,7
    1e84:	00050323          	sb	zero,6(a0)
    1e88:	40f80833          	sub	a6,a6,a5
    1e8c:	ff887593          	andi	a1,a6,-8
    1e90:	97aa                	add	a5,a5,a0
    1e92:	95be                	add	a1,a1,a5
    1e94:	0007b023          	sd	zero,0(a5)
    1e98:	07a1                	addi	a5,a5,8
    1e9a:	feb79de3          	bne	a5,a1,1e94 <stpncpy+0xbe>
    1e9e:	ff887593          	andi	a1,a6,-8
    1ea2:	9ead                	addw	a3,a3,a1
    1ea4:	00b707b3          	add	a5,a4,a1
    1ea8:	12b80863          	beq	a6,a1,1fd8 <stpncpy+0x202>
    1eac:	00078023          	sb	zero,0(a5)
    1eb0:	0016871b          	addiw	a4,a3,1
    1eb4:	0ec77863          	bgeu	a4,a2,1fa4 <stpncpy+0x1ce>
    1eb8:	000780a3          	sb	zero,1(a5)
    1ebc:	0026871b          	addiw	a4,a3,2
    1ec0:	0ec77263          	bgeu	a4,a2,1fa4 <stpncpy+0x1ce>
    1ec4:	00078123          	sb	zero,2(a5)
    1ec8:	0036871b          	addiw	a4,a3,3
    1ecc:	0cc77c63          	bgeu	a4,a2,1fa4 <stpncpy+0x1ce>
    1ed0:	000781a3          	sb	zero,3(a5)
    1ed4:	0046871b          	addiw	a4,a3,4
    1ed8:	0cc77663          	bgeu	a4,a2,1fa4 <stpncpy+0x1ce>
    1edc:	00078223          	sb	zero,4(a5)
    1ee0:	0056871b          	addiw	a4,a3,5
    1ee4:	0cc77063          	bgeu	a4,a2,1fa4 <stpncpy+0x1ce>
    1ee8:	000782a3          	sb	zero,5(a5)
    1eec:	0066871b          	addiw	a4,a3,6
    1ef0:	0ac77a63          	bgeu	a4,a2,1fa4 <stpncpy+0x1ce>
    1ef4:	00078323          	sb	zero,6(a5)
    1ef8:	0076871b          	addiw	a4,a3,7
    1efc:	0ac77463          	bgeu	a4,a2,1fa4 <stpncpy+0x1ce>
    1f00:	000783a3          	sb	zero,7(a5)
    1f04:	0086871b          	addiw	a4,a3,8
    1f08:	08c77e63          	bgeu	a4,a2,1fa4 <stpncpy+0x1ce>
    1f0c:	00078423          	sb	zero,8(a5)
    1f10:	0096871b          	addiw	a4,a3,9
    1f14:	08c77863          	bgeu	a4,a2,1fa4 <stpncpy+0x1ce>
    1f18:	000784a3          	sb	zero,9(a5)
    1f1c:	00a6871b          	addiw	a4,a3,10
    1f20:	08c77263          	bgeu	a4,a2,1fa4 <stpncpy+0x1ce>
    1f24:	00078523          	sb	zero,10(a5)
    1f28:	00b6871b          	addiw	a4,a3,11
    1f2c:	06c77c63          	bgeu	a4,a2,1fa4 <stpncpy+0x1ce>
    1f30:	000785a3          	sb	zero,11(a5)
    1f34:	00c6871b          	addiw	a4,a3,12
    1f38:	06c77663          	bgeu	a4,a2,1fa4 <stpncpy+0x1ce>
    1f3c:	00078623          	sb	zero,12(a5)
    1f40:	26b5                	addiw	a3,a3,13
    1f42:	06c6f163          	bgeu	a3,a2,1fa4 <stpncpy+0x1ce>
    1f46:	000786a3          	sb	zero,13(a5)
    1f4a:	8082                	ret
            ;
        if (!n || !*s)
    1f4c:	c645                	beqz	a2,1ff4 <stpncpy+0x21e>
    1f4e:	0005c783          	lbu	a5,0(a1)
    1f52:	ea078be3          	beqz	a5,1e08 <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1f56:	479d                	li	a5,7
    1f58:	02c7ff63          	bgeu	a5,a2,1f96 <stpncpy+0x1c0>
    1f5c:	00000897          	auipc	a7,0x0
    1f60:	3cc8b883          	ld	a7,972(a7) # 2328 <BUF_LEN+0x8>
    1f64:	00000817          	auipc	a6,0x0
    1f68:	3cc83803          	ld	a6,972(a6) # 2330 <BUF_LEN+0x10>
    1f6c:	431d                	li	t1,7
    1f6e:	6198                	ld	a4,0(a1)
    1f70:	011707b3          	add	a5,a4,a7
    1f74:	fff74693          	not	a3,a4
    1f78:	8ff5                	and	a5,a5,a3
    1f7a:	0107f7b3          	and	a5,a5,a6
    1f7e:	ef81                	bnez	a5,1f96 <stpncpy+0x1c0>
            *wd = *ws;
    1f80:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1f82:	1661                	addi	a2,a2,-8
    1f84:	05a1                	addi	a1,a1,8
    1f86:	0521                	addi	a0,a0,8
    1f88:	fec363e3          	bltu	t1,a2,1f6e <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1f8c:	e609                	bnez	a2,1f96 <stpncpy+0x1c0>
    1f8e:	a08d                	j	1ff0 <stpncpy+0x21a>
    1f90:	167d                	addi	a2,a2,-1
    1f92:	0505                	addi	a0,a0,1
    1f94:	ca01                	beqz	a2,1fa4 <stpncpy+0x1ce>
    1f96:	0005c783          	lbu	a5,0(a1)
    1f9a:	0585                	addi	a1,a1,1
    1f9c:	00f50023          	sb	a5,0(a0)
    1fa0:	fbe5                	bnez	a5,1f90 <stpncpy+0x1ba>
        ;
tail:
    1fa2:	b59d                	j	1e08 <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1fa4:	8082                	ret
    1fa6:	472d                	li	a4,11
    1fa8:	bdb5                	j	1e24 <stpncpy+0x4e>
    1faa:	00778713          	addi	a4,a5,7
    1fae:	45ad                	li	a1,11
    1fb0:	fff60693          	addi	a3,a2,-1
    1fb4:	e6b778e3          	bgeu	a4,a1,1e24 <stpncpy+0x4e>
    1fb8:	b7fd                	j	1fa6 <stpncpy+0x1d0>
    1fba:	40a007b3          	neg	a5,a0
    1fbe:	8832                	mv	a6,a2
    1fc0:	8b9d                	andi	a5,a5,7
    1fc2:	4681                	li	a3,0
    1fc4:	e4060be3          	beqz	a2,1e1a <stpncpy+0x44>
    1fc8:	b7cd                	j	1faa <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1fca:	468d                	li	a3,3
    1fcc:	bd75                	j	1e88 <stpncpy+0xb2>
    1fce:	872a                	mv	a4,a0
    1fd0:	4681                	li	a3,0
    1fd2:	bd5d                	j	1e88 <stpncpy+0xb2>
    1fd4:	4685                	li	a3,1
    1fd6:	bd4d                	j	1e88 <stpncpy+0xb2>
    1fd8:	8082                	ret
    1fda:	87aa                	mv	a5,a0
    1fdc:	4681                	li	a3,0
    1fde:	b5f9                	j	1eac <stpncpy+0xd6>
    1fe0:	4689                	li	a3,2
    1fe2:	b55d                	j	1e88 <stpncpy+0xb2>
    1fe4:	4691                	li	a3,4
    1fe6:	b54d                	j	1e88 <stpncpy+0xb2>
    1fe8:	4695                	li	a3,5
    1fea:	bd79                	j	1e88 <stpncpy+0xb2>
    1fec:	4699                	li	a3,6
    1fee:	bd69                	j	1e88 <stpncpy+0xb2>
    1ff0:	8082                	ret
    1ff2:	8082                	ret
    1ff4:	8082                	ret

0000000000001ff6 <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1ff6:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1ffa:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ffc:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    2000:	2501                	sext.w	a0,a0
    2002:	8082                	ret

0000000000002004 <close>:
    register long a7 __asm__("a7") = n;
    2004:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    2008:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    200c:	2501                	sext.w	a0,a0
    200e:	8082                	ret

0000000000002010 <read>:
    register long a7 __asm__("a7") = n;
    2010:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2014:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    2018:	8082                	ret

000000000000201a <write>:
    register long a7 __asm__("a7") = n;
    201a:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    201e:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    2022:	8082                	ret

0000000000002024 <getpid>:
    register long a7 __asm__("a7") = n;
    2024:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    2028:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    202c:	2501                	sext.w	a0,a0
    202e:	8082                	ret

0000000000002030 <sched_yield>:
    register long a7 __asm__("a7") = n;
    2030:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    2034:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    2038:	2501                	sext.w	a0,a0
    203a:	8082                	ret

000000000000203c <fork>:
    register long a7 __asm__("a7") = n;
    203c:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    2040:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    2044:	2501                	sext.w	a0,a0
    2046:	8082                	ret

0000000000002048 <exit>:
    register long a7 __asm__("a7") = n;
    2048:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    204c:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    2050:	8082                	ret

0000000000002052 <waitpid>:
    register long a7 __asm__("a7") = n;
    2052:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2056:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    205a:	2501                	sext.w	a0,a0
    205c:	8082                	ret

000000000000205e <exec>:
    register long a7 __asm__("a7") = n;
    205e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    2062:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    2066:	2501                	sext.w	a0,a0
    2068:	8082                	ret

000000000000206a <get_time>:

int64 get_time()
{
    206a:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    206c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    2070:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    2072:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2074:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    2078:	2501                	sext.w	a0,a0
    207a:	ed09                	bnez	a0,2094 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    207c:	67a2                	ld	a5,8(sp)
    207e:	3e800713          	li	a4,1000
    2082:	00015503          	lhu	a0,0(sp)
    2086:	02e7d7b3          	divu	a5,a5,a4
    208a:	02e50533          	mul	a0,a0,a4
    208e:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    2090:	0141                	addi	sp,sp,16
    2092:	8082                	ret
        return -1;
    2094:	557d                	li	a0,-1
    2096:	bfed                	j	2090 <get_time+0x26>

0000000000002098 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    2098:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    209c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    20a0:	2501                	sext.w	a0,a0
    20a2:	8082                	ret

00000000000020a4 <sleep>:

int sleep(unsigned long long time)
{
    20a4:	1141                	addi	sp,sp,-16
    20a6:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    20a8:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    20ac:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    20ae:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    20b0:	00000073          	ecall
    if (err == 0)
    20b4:	2501                	sext.w	a0,a0
    20b6:	e13d                	bnez	a0,211c <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    20b8:	6722                	ld	a4,8(sp)
    20ba:	3e800693          	li	a3,1000
    20be:	00015783          	lhu	a5,0(sp)
    20c2:	02d75733          	divu	a4,a4,a3
    20c6:	02d787b3          	mul	a5,a5,a3
    20ca:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    20cc:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    20d0:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    20d2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    20d4:	00000073          	ecall
    if (err == 0)
    20d8:	2501                	sext.w	a0,a0
    20da:	ed15                	bnez	a0,2116 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    20dc:	6841                	lui	a6,0x10
    20de:	963e                	add	a2,a2,a5
    20e0:	187d                	addi	a6,a6,-1
    20e2:	3e800693          	li	a3,1000
    20e6:	a819                	j	20fc <sleep+0x58>
    __asm_syscall("r"(a7))
    20e8:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    20ec:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    20f0:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    20f2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    20f4:	00000073          	ecall
    if (err == 0)
    20f8:	2501                	sext.w	a0,a0
    20fa:	ed11                	bnez	a0,2116 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    20fc:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    20fe:	07c00893          	li	a7,124
    2102:	02d7d733          	divu	a4,a5,a3
    2106:	6782                	ld	a5,0(sp)
    2108:	0107f7b3          	and	a5,a5,a6
    210c:	02d787b3          	mul	a5,a5,a3
    2110:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    2112:	fcc7ebe3          	bltu	a5,a2,20e8 <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    2116:	4501                	li	a0,0
    2118:	0141                	addi	sp,sp,16
    211a:	8082                	ret
    211c:	57fd                	li	a5,-1
    211e:	b77d                	j	20cc <sleep+0x28>

0000000000002120 <set_priority>:
    register long a7 __asm__("a7") = n;
    2120:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    2124:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    2128:	2501                	sext.w	a0,a0
    212a:	8082                	ret

000000000000212c <mmap>:
    register long a7 __asm__("a7") = n;
    212c:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2130:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    2134:	2501                	sext.w	a0,a0
    2136:	8082                	ret

0000000000002138 <munmap>:
    register long a7 __asm__("a7") = n;
    2138:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    213c:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    2140:	2501                	sext.w	a0,a0
    2142:	8082                	ret

0000000000002144 <wait>:

int wait(int *code)
{
    2144:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    2146:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    214a:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    214c:	00000073          	ecall
    return waitpid(-1, code);
}
    2150:	2501                	sext.w	a0,a0
    2152:	8082                	ret

0000000000002154 <spawn>:
    register long a7 __asm__("a7") = n;
    2154:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    2158:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    215c:	2501                	sext.w	a0,a0
    215e:	8082                	ret

0000000000002160 <mailread>:
    register long a7 __asm__("a7") = n;
    2160:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    2164:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    2168:	2501                	sext.w	a0,a0
    216a:	8082                	ret

000000000000216c <mailwrite>:
    register long a7 __asm__("a7") = n;
    216c:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    2170:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    2174:	2501                	sext.w	a0,a0
    2176:	8082                	ret

0000000000002178 <fstat>:
    register long a7 __asm__("a7") = n;
    2178:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    217c:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    2180:	2501                	sext.w	a0,a0
    2182:	8082                	ret

0000000000002184 <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    2184:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    2186:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    218a:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    218c:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    2190:	2501                	sext.w	a0,a0
    2192:	8082                	ret

0000000000002194 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    2194:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    2196:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    219a:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    219c:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    21a0:	2501                	sext.w	a0,a0
    21a2:	8082                	ret

00000000000021a4 <link>:

int link(char *old_path, char *new_path)
{
    21a4:	87aa                	mv	a5,a0
    21a6:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    21a8:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    21ac:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    21b0:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    21b2:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    21b6:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    21b8:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    21bc:	2501                	sext.w	a0,a0
    21be:	8082                	ret

00000000000021c0 <unlink>:

int unlink(char *path)
{
    21c0:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    21c2:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    21c6:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    21ca:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    21cc:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    21d0:	2501                	sext.w	a0,a0
    21d2:	8082                	ret
