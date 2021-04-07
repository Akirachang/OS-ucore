
/home/akira/Desktop/compare/OS2/user/build/riscv64/ch7_usertest:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0a20006f          	j	10a4 <__start_main>

0000000000001006 <main>:
    "ch7_file1\0",
    "ch7_file2\0",
};

int main()
{
    1006:	715d                	addi	sp,sp,-80
    1008:	f84a                	sd	s2,48(sp)
    100a:	f44e                	sd	s3,40(sp)
    100c:	f052                	sd	s4,32(sp)
    100e:	ec56                	sd	s5,24(sp)
    1010:	e486                	sd	ra,72(sp)
    1012:	e0a2                	sd	s0,64(sp)
    1014:	fc26                	sd	s1,56(sp)
    1016:	00001917          	auipc	s2,0x1
    101a:	03a90913          	addi	s2,s2,58 # 2050 <TESTS>
    101e:	00001a97          	auipc	s5,0x1
    1022:	0e2a8a93          	addi	s5,s5,226 # 2100 <TESTS+0xb0>
    int num_test = sizeof(TESTS) / sizeof(char *);
    for (int i = 0; i < num_test; ++i)
    {
        char *test = TESTS[i];
        printf("Usertests: Running %s\n", test);
    1026:	00001a17          	auipc	s4,0x1
    102a:	fa2a0a13          	addi	s4,s4,-94 # 1fc8 <unlink+0x18>
        int pid = spawn(test);
        int xstate = 0;
        int wait_pid = waitpid(pid, &xstate);
        assert(pid == wait_pid);
        printf("Usertests: Test %s in Process %d exited with code %d", test, pid, xstate);
    102e:	00001997          	auipc	s3,0x1
    1032:	fb298993          	addi	s3,s3,-78 # 1fe0 <unlink+0x30>
        char *test = TESTS[i];
    1036:	00093483          	ld	s1,0(s2)
        printf("Usertests: Running %s\n", test);
    103a:	8552                	mv	a0,s4
    103c:	85a6                	mv	a1,s1
    103e:	0f8000ef          	jal	ra,1136 <printf>
        int pid = spawn(test);
    1042:	8526                	mv	a0,s1
    1044:	701000ef          	jal	ra,1f44 <spawn>
        int wait_pid = waitpid(pid, &xstate);
    1048:	006c                	addi	a1,sp,12
        int pid = spawn(test);
    104a:	842a                	mv	s0,a0
        int xstate = 0;
    104c:	c602                	sw	zero,12(sp)
        int wait_pid = waitpid(pid, &xstate);
    104e:	5f5000ef          	jal	ra,1e42 <waitpid>
    1052:	87aa                	mv	a5,a0
        printf("Usertests: Test %s in Process %d exited with code %d", test, pid, xstate);
    1054:	8622                	mv	a2,s0
        assert(pid == wait_pid);
    1056:	557d                	li	a0,-1
        printf("Usertests: Test %s in Process %d exited with code %d", test, pid, xstate);
    1058:	85a6                	mv	a1,s1
        assert(pid == wait_pid);
    105a:	02f40d63          	beq	s0,a5,1094 <main+0x8e>
    105e:	5db000ef          	jal	ra,1e38 <exit>
        printf("Usertests: Test %s in Process %d exited with code %d", test, pid, xstate);
    1062:	46b2                	lw	a3,12(sp)
    1064:	0921                	addi	s2,s2,8
    1066:	8622                	mv	a2,s0
    1068:	85a6                	mv	a1,s1
    106a:	854e                	mv	a0,s3
    106c:	0ca000ef          	jal	ra,1136 <printf>
    for (int i = 0; i < num_test; ++i)
    1070:	fd2a93e3          	bne	s5,s2,1036 <main+0x30>
    }
    puts("ch7 Usertests passed!");
    1074:	00001517          	auipc	a0,0x1
    1078:	fa450513          	addi	a0,a0,-92 # 2018 <unlink+0x68>
    107c:	078000ef          	jal	ra,10f4 <puts>
    return 0;
    1080:	60a6                	ld	ra,72(sp)
    1082:	6406                	ld	s0,64(sp)
    1084:	74e2                	ld	s1,56(sp)
    1086:	7942                	ld	s2,48(sp)
    1088:	79a2                	ld	s3,40(sp)
    108a:	7a02                	ld	s4,32(sp)
    108c:	6ae2                	ld	s5,24(sp)
    108e:	4501                	li	a0,0
    1090:	6161                	addi	sp,sp,80
    1092:	8082                	ret
        printf("Usertests: Test %s in Process %d exited with code %d", test, pid, xstate);
    1094:	46b2                	lw	a3,12(sp)
    1096:	0921                	addi	s2,s2,8
    1098:	854e                	mv	a0,s3
    109a:	09c000ef          	jal	ra,1136 <printf>
    for (int i = 0; i < num_test; ++i)
    109e:	f9591ce3          	bne	s2,s5,1036 <main+0x30>
    10a2:	bfc9                	j	1074 <main+0x6e>

00000000000010a4 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10a4:	1141                	addi	sp,sp,-16
    10a6:	e406                	sd	ra,8(sp)
    exit(main());
    10a8:	f5fff0ef          	jal	ra,1006 <main>
    10ac:	58d000ef          	jal	ra,1e38 <exit>
    return 0;
}
    10b0:	60a2                	ld	ra,8(sp)
    10b2:	4501                	li	a0,0
    10b4:	0141                	addi	sp,sp,16
    10b6:	8082                	ret

00000000000010b8 <getchar>:

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

int getchar()
{
    10b8:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    10ba:	00f10593          	addi	a1,sp,15
    10be:	4605                	li	a2,1
    10c0:	4501                	li	a0,0
{
    10c2:	ec06                	sd	ra,24(sp)
    char byte = 0;
    10c4:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    10c8:	539000ef          	jal	ra,1e00 <read>
    return byte;
}
    10cc:	60e2                	ld	ra,24(sp)
    10ce:	00f14503          	lbu	a0,15(sp)
    10d2:	6105                	addi	sp,sp,32
    10d4:	8082                	ret

00000000000010d6 <putchar>:

int putchar(int c)
{
    10d6:	1101                	addi	sp,sp,-32
    10d8:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    10da:	00f10593          	addi	a1,sp,15
    10de:	4605                	li	a2,1
    10e0:	4505                	li	a0,1
{
    10e2:	ec06                	sd	ra,24(sp)
    char byte = c;
    10e4:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    10e8:	523000ef          	jal	ra,1e0a <write>
}
    10ec:	60e2                	ld	ra,24(sp)
    10ee:	2501                	sext.w	a0,a0
    10f0:	6105                	addi	sp,sp,32
    10f2:	8082                	ret

00000000000010f4 <puts>:

int puts(const char *s)
{
    10f4:	1101                	addi	sp,sp,-32
    10f6:	e822                	sd	s0,16(sp)
    10f8:	ec06                	sd	ra,24(sp)
    10fa:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    10fc:	145000ef          	jal	ra,1a40 <strlen>
    1100:	862a                	mv	a2,a0
    1102:	85a2                	mv	a1,s0
    1104:	4505                	li	a0,1
    1106:	505000ef          	jal	ra,1e0a <write>
    110a:	00055763          	bgez	a0,1118 <puts+0x24>
    return r;
}
    110e:	60e2                	ld	ra,24(sp)
    1110:	6442                	ld	s0,16(sp)
    1112:	557d                	li	a0,-1
    1114:	6105                	addi	sp,sp,32
    1116:	8082                	ret
    return write(stdout, &byte, 1);
    1118:	00f10593          	addi	a1,sp,15
    char byte = c;
    111c:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    111e:	4605                	li	a2,1
    1120:	4505                	li	a0,1
    char byte = c;
    1122:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1126:	4e5000ef          	jal	ra,1e0a <write>
}
    112a:	60e2                	ld	ra,24(sp)
    112c:	6442                	ld	s0,16(sp)
    112e:	41f5551b          	sraiw	a0,a0,0x1f
    1132:	6105                	addi	sp,sp,32
    1134:	8082                	ret

0000000000001136 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1136:	7131                	addi	sp,sp,-192
    1138:	ecce                	sd	s3,88(sp)
    113a:	e8d2                	sd	s4,80(sp)
    113c:	e4d6                	sd	s5,72(sp)
    113e:	e0da                	sd	s6,64(sp)
    1140:	f53e                	sd	a5,168(sp)
    } while ((x /= base) != 0);
    1142:	6989                	lui	s3,0x2
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1144:	013c                	addi	a5,sp,136
    } while ((x /= base) != 0);
    1146:	6ae1                	lui	s5,0x18
    1148:	000f4a37          	lui	s4,0xf4
    114c:	00989b37          	lui	s6,0x989
{
    1150:	fc86                	sd	ra,120(sp)
    1152:	f8a2                	sd	s0,112(sp)
    1154:	f4a6                	sd	s1,104(sp)
    1156:	f0ca                	sd	s2,96(sp)
    1158:	fc5e                	sd	s7,56(sp)
    115a:	e52e                	sd	a1,136(sp)
    115c:	e932                	sd	a2,144(sp)
    115e:	ed36                	sd	a3,152(sp)
    1160:	f13a                	sd	a4,160(sp)
    1162:	f942                	sd	a6,176(sp)
    1164:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1166:	e03e                	sd	a5,0(sp)
    } while ((x /= base) != 0);
    1168:	70f98993          	addi	s3,s3,1807 # 270f <digits+0x4a7>
    116c:	69fa8a93          	addi	s5,s5,1695 # 1869f <digits+0x16437>
    1170:	23fa0a13          	addi	s4,s4,575 # f423f <digits+0xf1fd7>
    1174:	67fb0b13          	addi	s6,s6,1663 # 98967f <digits+0x987417>
    for (;;)
    {
        if (!*s)
    1178:	00054783          	lbu	a5,0(a0)
            break;
        for (a = s; *s && *s != '%'; s++)
    117c:	02500913          	li	s2,37
        if (!*s)
    1180:	1a078f63          	beqz	a5,133e <printf+0x208>
    1184:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1186:	17278e63          	beq	a5,s2,1302 <printf+0x1cc>
    118a:	00164783          	lbu	a5,1(a2)
    118e:	0605                	addi	a2,a2,1
    1190:	fbfd                	bnez	a5,1186 <printf+0x50>
    1192:	84b2                	mv	s1,a2
            ;
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
            ;
        l = z - a;
    1194:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1198:	85aa                	mv	a1,a0
    119a:	8622                	mv	a2,s0
    119c:	4505                	li	a0,1
    119e:	46d000ef          	jal	ra,1e0a <write>
        out(f, a, l);
        if (l)
    11a2:	18041963          	bnez	s0,1334 <printf+0x1fe>
            continue;
        if (s[1] == 0)
    11a6:	0014c783          	lbu	a5,1(s1)
    11aa:	18078a63          	beqz	a5,133e <printf+0x208>
            break;
        switch (s[1])
    11ae:	07300713          	li	a4,115
    11b2:	28e78e63          	beq	a5,a4,144e <printf+0x318>
    11b6:	18f76f63          	bltu	a4,a5,1354 <printf+0x21e>
    11ba:	06400713          	li	a4,100
    11be:	2ae78c63          	beq	a5,a4,1476 <printf+0x340>
    11c2:	07000713          	li	a4,112
    11c6:	3ce79c63          	bne	a5,a4,159e <printf+0x468>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    11ca:	6682                	ld	a3,0(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    11cc:	00001797          	auipc	a5,0x1
    11d0:	09c78793          	addi	a5,a5,156 # 2268 <digits>
            printptr(va_arg(ap, uint64));
    11d4:	6298                	ld	a4,0(a3)
    11d6:	00868093          	addi	ra,a3,8
    11da:	e006                	sd	ra,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    11dc:	00471293          	slli	t0,a4,0x4
    11e0:	00c71f13          	slli	t5,a4,0xc
    11e4:	01471e13          	slli	t3,a4,0x14
    11e8:	01c71893          	slli	a7,a4,0x1c
    11ec:	02471813          	slli	a6,a4,0x24
    11f0:	02871513          	slli	a0,a4,0x28
    11f4:	02c71593          	slli	a1,a4,0x2c
    11f8:	03071693          	slli	a3,a4,0x30
    11fc:	00871f93          	slli	t6,a4,0x8
    1200:	01071e93          	slli	t4,a4,0x10
    1204:	01871313          	slli	t1,a4,0x18
    1208:	03471613          	slli	a2,a4,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    120c:	03c2d293          	srli	t0,t0,0x3c
    1210:	03cf5f13          	srli	t5,t5,0x3c
    1214:	03ce5e13          	srli	t3,t3,0x3c
    1218:	03c8d893          	srli	a7,a7,0x3c
    121c:	03c85813          	srli	a6,a6,0x3c
    1220:	9171                	srli	a0,a0,0x3c
    1222:	91f1                	srli	a1,a1,0x3c
    1224:	92f1                	srli	a3,a3,0x3c
    1226:	92be                	add	t0,t0,a5
    1228:	9f3e                	add	t5,t5,a5
    122a:	9e3e                	add	t3,t3,a5
    122c:	98be                	add	a7,a7,a5
    122e:	983e                	add	a6,a6,a5
    1230:	953e                	add	a0,a0,a5
    1232:	95be                	add	a1,a1,a5
    1234:	96be                	add	a3,a3,a5
    1236:	03c75393          	srli	t2,a4,0x3c
    123a:	01c75b9b          	srliw	s7,a4,0x1c
    123e:	03cfdf93          	srli	t6,t6,0x3c
    1242:	03cede93          	srli	t4,t4,0x3c
    1246:	03c35313          	srli	t1,t1,0x3c
    124a:	9271                	srli	a2,a2,0x3c
    124c:	0002c403          	lbu	s0,0(t0)
    1250:	93be                	add	t2,t2,a5
    1252:	000f4283          	lbu	t0,0(t5)
    1256:	9fbe                	add	t6,t6,a5
    1258:	000e4f03          	lbu	t5,0(t3)
    125c:	9ebe                	add	t4,t4,a5
    125e:	0008ce03          	lbu	t3,0(a7)
    1262:	933e                	add	t1,t1,a5
    1264:	00084883          	lbu	a7,0(a6)
    1268:	9bbe                	add	s7,s7,a5
    126a:	00054803          	lbu	a6,0(a0)
    126e:	963e                	add	a2,a2,a5
    1270:	0005c503          	lbu	a0,0(a1)
    1274:	0006c583          	lbu	a1,0(a3)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1278:	03871693          	slli	a3,a4,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    127c:	0003c903          	lbu	s2,0(t2)
    1280:	00064603          	lbu	a2,0(a2)
    1284:	000fc383          	lbu	t2,0(t6)
    1288:	8b3d                	andi	a4,a4,15
    128a:	000ecf83          	lbu	t6,0(t4)
    128e:	92f1                	srli	a3,a3,0x3c
    1290:	00034e83          	lbu	t4,0(t1)
    1294:	000bc303          	lbu	t1,0(s7)
    1298:	96be                	add	a3,a3,a5
    129a:	97ba                	add	a5,a5,a4
    buf[i++] = '0';
    129c:	7761                	lui	a4,0xffff8
    129e:	83074713          	xori	a4,a4,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12a2:	00710623          	sb	t2,12(sp)
    12a6:	005106a3          	sb	t0,13(sp)
    12aa:	01f10723          	sb	t6,14(sp)
    12ae:	01e107a3          	sb	t5,15(sp)
    12b2:	01d10823          	sb	t4,16(sp)
    12b6:	01c108a3          	sb	t3,17(sp)
    12ba:	00610923          	sb	t1,18(sp)
    12be:	011109a3          	sb	a7,19(sp)
    12c2:	01010a23          	sb	a6,20(sp)
    12c6:	00a10aa3          	sb	a0,21(sp)
    12ca:	00b10b23          	sb	a1,22(sp)
    12ce:	00c10ba3          	sb	a2,23(sp)
    buf[i++] = '0';
    12d2:	00e11423          	sh	a4,8(sp)
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12d6:	01210523          	sb	s2,10(sp)
    12da:	008105a3          	sb	s0,11(sp)
    12de:	0006c703          	lbu	a4,0(a3)
    12e2:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    12e6:	4649                	li	a2,18
    12e8:	002c                	addi	a1,sp,8
    12ea:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12ec:	00e10c23          	sb	a4,24(sp)
    12f0:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    12f4:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    12f8:	313000ef          	jal	ra,1e0a <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    12fc:	00248513          	addi	a0,s1,2
    1300:	bda5                	j	1178 <printf+0x42>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1302:	00064783          	lbu	a5,0(a2)
    1306:	84b2                	mv	s1,a2
    1308:	01278963          	beq	a5,s2,131a <printf+0x1e4>
    130c:	b561                	j	1194 <printf+0x5e>
    130e:	0024c783          	lbu	a5,2(s1)
    1312:	0605                	addi	a2,a2,1
    1314:	0489                	addi	s1,s1,2
    1316:	e7279fe3          	bne	a5,s2,1194 <printf+0x5e>
    131a:	0014c783          	lbu	a5,1(s1)
    131e:	ff2788e3          	beq	a5,s2,130e <printf+0x1d8>
        l = z - a;
    1322:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1326:	85aa                	mv	a1,a0
    1328:	8622                	mv	a2,s0
    132a:	4505                	li	a0,1
    132c:	2df000ef          	jal	ra,1e0a <write>
        if (l)
    1330:	e6040be3          	beqz	s0,11a6 <printf+0x70>
    1334:	8526                	mv	a0,s1
        if (!*s)
    1336:	00054783          	lbu	a5,0(a0)
    133a:	e40795e3          	bnez	a5,1184 <printf+0x4e>
    }
    va_end(ap);
    133e:	70e6                	ld	ra,120(sp)
    1340:	7446                	ld	s0,112(sp)
    1342:	74a6                	ld	s1,104(sp)
    1344:	7906                	ld	s2,96(sp)
    1346:	69e6                	ld	s3,88(sp)
    1348:	6a46                	ld	s4,80(sp)
    134a:	6aa6                	ld	s5,72(sp)
    134c:	6b06                	ld	s6,64(sp)
    134e:	7be2                	ld	s7,56(sp)
    1350:	6129                	addi	sp,sp,192
    1352:	8082                	ret
        switch (s[1])
    1354:	07800713          	li	a4,120
    1358:	24e79363          	bne	a5,a4,159e <printf+0x468>
            printint(va_arg(ap, int), 16, 1);
    135c:	6782                	ld	a5,0(sp)
    135e:	4394                	lw	a3,0(a5)
    1360:	07a1                	addi	a5,a5,8
    1362:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    1364:	2606c263          	bltz	a3,15c8 <printf+0x492>
        buf[i--] = digits[x % base];
    1368:	00001797          	auipc	a5,0x1
    136c:	f0078793          	addi	a5,a5,-256 # 2268 <digits>
    1370:	00f6f713          	andi	a4,a3,15
    1374:	973e                	add	a4,a4,a5
    1376:	00074703          	lbu	a4,0(a4) # ffffffffffff8000 <digits+0xffffffffffff5d98>
    buf[16] = 0;
    137a:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    137e:	45bd                	li	a1,15
        buf[i--] = digits[x % base];
    1380:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    1384:	0046d61b          	srliw	a2,a3,0x4
        x = xx;
    1388:	0006871b          	sext.w	a4,a3
    } while ((x /= base) != 0);
    138c:	0046d51b          	srliw	a0,a3,0x4
    1390:	0ad5d563          	bge	a1,a3,143a <printf+0x304>
        buf[i--] = digits[x % base];
    1394:	8a3d                	andi	a2,a2,15
    1396:	963e                	add	a2,a2,a5
    1398:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    139c:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    13a0:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    13a4:	30a5fe63          	bgeu	a1,a0,16c0 <printf+0x58a>
        buf[i--] = digits[x % base];
    13a8:	00f77613          	andi	a2,a4,15
    13ac:	963e                	add	a2,a2,a5
    13ae:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13b2:	45bd                	li	a1,15
    13b4:	0047561b          	srliw	a2,a4,0x4
        buf[i--] = digits[x % base];
    13b8:	00a10aa3          	sb	a0,21(sp)
    } while ((x /= base) != 0);
    13bc:	00475513          	srli	a0,a4,0x4
    13c0:	30e5f963          	bgeu	a1,a4,16d2 <printf+0x59c>
        buf[i--] = digits[x % base];
    13c4:	8a3d                	andi	a2,a2,15
    13c6:	963e                	add	a2,a2,a5
    13c8:	00064803          	lbu	a6,0(a2)
    } while ((x /= base) != 0);
    13cc:	00875893          	srli	a7,a4,0x8
    13d0:	0087561b          	srliw	a2,a4,0x8
        buf[i--] = digits[x % base];
    13d4:	01010a23          	sb	a6,20(sp)
    } while ((x /= base) != 0);
    13d8:	30a5fd63          	bgeu	a1,a0,16f2 <printf+0x5bc>
        buf[i--] = digits[x % base];
    13dc:	8a3d                	andi	a2,a2,15
    13de:	963e                	add	a2,a2,a5
    13e0:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13e4:	00c75813          	srli	a6,a4,0xc
    13e8:	00c7561b          	srliw	a2,a4,0xc
        buf[i--] = digits[x % base];
    13ec:	00a109a3          	sb	a0,19(sp)
    } while ((x /= base) != 0);
    13f0:	3315fe63          	bgeu	a1,a7,172c <printf+0x5f6>
        buf[i--] = digits[x % base];
    13f4:	8a3d                	andi	a2,a2,15
    13f6:	963e                	add	a2,a2,a5
    13f8:	00064503          	lbu	a0,0(a2)
    } while ((x /= base) != 0);
    13fc:	01075893          	srli	a7,a4,0x10
    1400:	0107561b          	srliw	a2,a4,0x10
        buf[i--] = digits[x % base];
    1404:	00a10923          	sb	a0,18(sp)
    } while ((x /= base) != 0);
    1408:	3305ff63          	bgeu	a1,a6,1746 <printf+0x610>
        buf[i--] = digits[x % base];
    140c:	8a3d                	andi	a2,a2,15
    140e:	963e                	add	a2,a2,a5
    1410:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1414:	0147571b          	srliw	a4,a4,0x14
        buf[i--] = digits[x % base];
    1418:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    141c:	3515f863          	bgeu	a1,a7,176c <printf+0x636>
        buf[i--] = digits[x % base];
    1420:	97ba                	add	a5,a5,a4
    1422:	0007c783          	lbu	a5,0(a5)
    1426:	45a1                	li	a1,8
    1428:	00f10823          	sb	a5,16(sp)
    if (sign)
    142c:	0006d763          	bgez	a3,143a <printf+0x304>
        buf[i--] = '-';
    1430:	02d00793          	li	a5,45
    1434:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    1438:	459d                	li	a1,7
    write(f, s, l);
    143a:	4641                	li	a2,16
    143c:	003c                	addi	a5,sp,8
    143e:	9e0d                	subw	a2,a2,a1
    1440:	4505                	li	a0,1
    1442:	95be                	add	a1,a1,a5
    1444:	1c7000ef          	jal	ra,1e0a <write>
        s += 2;
    1448:	00248513          	addi	a0,s1,2
    144c:	b335                	j	1178 <printf+0x42>
            if ((a = va_arg(ap, char *)) == 0)
    144e:	6782                	ld	a5,0(sp)
    1450:	6380                	ld	s0,0(a5)
    1452:	07a1                	addi	a5,a5,8
    1454:	e03e                	sd	a5,0(sp)
    1456:	22040a63          	beqz	s0,168a <printf+0x554>
            l = strnlen(a, 200);
    145a:	0c800593          	li	a1,200
    145e:	8522                	mv	a0,s0
    1460:	6cc000ef          	jal	ra,1b2c <strnlen>
    write(f, s, l);
    1464:	0005061b          	sext.w	a2,a0
    1468:	85a2                	mv	a1,s0
    146a:	4505                	li	a0,1
    146c:	19f000ef          	jal	ra,1e0a <write>
        s += 2;
    1470:	00248513          	addi	a0,s1,2
    1474:	b311                	j	1178 <printf+0x42>
            printint(va_arg(ap, int), 10, 1);
    1476:	6782                	ld	a5,0(sp)
    1478:	4390                	lw	a2,0(a5)
    147a:	07a1                	addi	a5,a5,8
    147c:	e03e                	sd	a5,0(sp)
    if (sign && (sign = xx < 0))
    147e:	1a064363          	bltz	a2,1624 <printf+0x4ee>
        buf[i--] = digits[x % base];
    1482:	46a9                	li	a3,10
    1484:	02d6773b          	remuw	a4,a2,a3
    1488:	00001797          	auipc	a5,0x1
    148c:	de078793          	addi	a5,a5,-544 # 2268 <digits>
    buf[16] = 0;
    1490:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    1494:	4525                	li	a0,9
        x = xx;
    1496:	0006081b          	sext.w	a6,a2
        buf[i--] = digits[x % base];
    149a:	973e                	add	a4,a4,a5
    149c:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    14a0:	02d655bb          	divuw	a1,a2,a3
        buf[i--] = digits[x % base];
    14a4:	00e10ba3          	sb	a4,23(sp)
    } while ((x /= base) != 0);
    14a8:	2cc55063          	bge	a0,a2,1768 <printf+0x632>
    14ac:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    14b0:	02d5f73b          	remuw	a4,a1,a3
    14b4:	1702                	slli	a4,a4,0x20
    14b6:	9301                	srli	a4,a4,0x20
    14b8:	973e                	add	a4,a4,a5
    14ba:	00074703          	lbu	a4,0(a4)
    } while ((x /= base) != 0);
    14be:	02d5d5bb          	divuw	a1,a1,a3
        buf[i--] = digits[x % base];
    14c2:	00e10b23          	sb	a4,22(sp)
    } while ((x /= base) != 0);
    14c6:	1f057d63          	bgeu	a0,a6,16c0 <printf+0x58a>
        buf[i--] = digits[x % base];
    14ca:	4529                	li	a0,10
    } while ((x /= base) != 0);
    14cc:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    14ce:	02a5f73b          	remuw	a4,a1,a0
    14d2:	973e                	add	a4,a4,a5
    14d4:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    14d8:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    14dc:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    14e0:	1ab6f163          	bgeu	a3,a1,1682 <printf+0x54c>
    14e4:	06300813          	li	a6,99
        buf[i--] = digits[x % base];
    14e8:	02a776bb          	remuw	a3,a4,a0
    14ec:	96be                	add	a3,a3,a5
    14ee:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    14f2:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    14f6:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    14fa:	20b87c63          	bgeu	a6,a1,1712 <printf+0x5dc>
    14fe:	3e700813          	li	a6,999
        buf[i--] = digits[x % base];
    1502:	02a776bb          	remuw	a3,a4,a0
    1506:	96be                	add	a3,a3,a5
    1508:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    150c:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1510:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1514:	20b87363          	bgeu	a6,a1,171a <printf+0x5e4>
        buf[i--] = digits[x % base];
    1518:	02a776bb          	remuw	a3,a4,a0
    151c:	96be                	add	a3,a3,a5
    151e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1522:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1526:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    152a:	20b9f563          	bgeu	s3,a1,1734 <printf+0x5fe>
        buf[i--] = digits[x % base];
    152e:	02a776bb          	remuw	a3,a4,a0
    1532:	96be                	add	a3,a3,a5
    1534:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1538:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    153c:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1540:	20bafb63          	bgeu	s5,a1,1756 <printf+0x620>
        buf[i--] = digits[x % base];
    1544:	02a776bb          	remuw	a3,a4,a0
    1548:	96be                	add	a3,a3,a5
    154a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    154e:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1552:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1556:	1eba7c63          	bgeu	s4,a1,174e <printf+0x618>
        buf[i--] = digits[x % base];
    155a:	02a776bb          	remuw	a3,a4,a0
    155e:	96be                	add	a3,a3,a5
    1560:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1564:	02a7573b          	divuw	a4,a4,a0
        buf[i--] = digits[x % base];
    1568:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    156c:	14bb7163          	bgeu	s6,a1,16ae <printf+0x578>
        buf[i--] = digits[x % base];
    1570:	1702                	slli	a4,a4,0x20
    1572:	9301                	srli	a4,a4,0x20
    1574:	97ba                	add	a5,a5,a4
    1576:	0007c783          	lbu	a5,0(a5)
    157a:	4599                	li	a1,6
    157c:	00f10723          	sb	a5,14(sp)
    if (sign)
    1580:	ea065de3          	bgez	a2,143a <printf+0x304>
        buf[i--] = '-';
    1584:	02d00793          	li	a5,45
    1588:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    158c:	4595                	li	a1,5
    write(f, s, l);
    158e:	003c                	addi	a5,sp,8
    1590:	4641                	li	a2,16
    1592:	9e0d                	subw	a2,a2,a1
    1594:	4505                	li	a0,1
    1596:	95be                	add	a1,a1,a5
    1598:	073000ef          	jal	ra,1e0a <write>
    159c:	b575                	j	1448 <printf+0x312>
    char byte = c;
    159e:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    15a2:	4605                	li	a2,1
    15a4:	002c                	addi	a1,sp,8
    15a6:	4505                	li	a0,1
    char byte = c;
    15a8:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15ac:	05f000ef          	jal	ra,1e0a <write>
    char byte = c;
    15b0:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15b4:	4605                	li	a2,1
    15b6:	002c                	addi	a1,sp,8
    15b8:	4505                	li	a0,1
    char byte = c;
    15ba:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15be:	04d000ef          	jal	ra,1e0a <write>
        s += 2;
    15c2:	00248513          	addi	a0,s1,2
    15c6:	be4d                	j	1178 <printf+0x42>
        x = -xx;
    15c8:	40d0073b          	negw	a4,a3
        buf[i--] = digits[x % base];
    15cc:	00001797          	auipc	a5,0x1
    15d0:	c9c78793          	addi	a5,a5,-868 # 2268 <digits>
    15d4:	00f77613          	andi	a2,a4,15
    15d8:	963e                	add	a2,a2,a5
    15da:	00064603          	lbu	a2,0(a2)
    buf[16] = 0;
    15de:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    15e2:	55c5                	li	a1,-15
        buf[i--] = digits[x % base];
    15e4:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    15e8:	0047551b          	srliw	a0,a4,0x4
    15ec:	0047561b          	srliw	a2,a4,0x4
    15f0:	0ab6d263          	bge	a3,a1,1694 <printf+0x55e>
        buf[i--] = digits[x % base];
    15f4:	8a3d                	andi	a2,a2,15
    15f6:	963e                	add	a2,a2,a5
    15f8:	00064583          	lbu	a1,0(a2)
    } while ((x /= base) != 0);
    15fc:	463d                	li	a2,15
    15fe:	0087571b          	srliw	a4,a4,0x8
        buf[i--] = digits[x % base];
    1602:	00b10b23          	sb	a1,22(sp)
    } while ((x /= base) != 0);
    1606:	daa661e3          	bltu	a2,a0,13a8 <printf+0x272>
        buf[i--] = '-';
    160a:	02d00793          	li	a5,45
    160e:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1612:	45b5                	li	a1,13
    write(f, s, l);
    1614:	003c                	addi	a5,sp,8
    1616:	4641                	li	a2,16
    1618:	9e0d                	subw	a2,a2,a1
    161a:	4505                	li	a0,1
    161c:	95be                	add	a1,a1,a5
    161e:	7ec000ef          	jal	ra,1e0a <write>
    1622:	b51d                	j	1448 <printf+0x312>
        x = -xx;
    1624:	40c0083b          	negw	a6,a2
        buf[i--] = digits[x % base];
    1628:	46a9                	li	a3,10
    162a:	02d875bb          	remuw	a1,a6,a3
    162e:	00001797          	auipc	a5,0x1
    1632:	c3a78793          	addi	a5,a5,-966 # 2268 <digits>
    buf[16] = 0;
    1636:	00010c23          	sb	zero,24(sp)
    } while ((x /= base) != 0);
    163a:	555d                	li	a0,-9
        buf[i--] = digits[x % base];
    163c:	95be                	add	a1,a1,a5
    163e:	0005c583          	lbu	a1,0(a1)
    } while ((x /= base) != 0);
    1642:	02d8573b          	divuw	a4,a6,a3
        buf[i--] = digits[x % base];
    1646:	00b10ba3          	sb	a1,23(sp)
    } while ((x /= base) != 0);
    164a:	04a65563          	bge	a2,a0,1694 <printf+0x55e>
    164e:	06300513          	li	a0,99
        buf[i--] = digits[x % base];
    1652:	02d775bb          	remuw	a1,a4,a3
    1656:	95be                	add	a1,a1,a5
    1658:	0005c883          	lbu	a7,0(a1)
    } while ((x /= base) != 0);
    165c:	02d755bb          	divuw	a1,a4,a3
        buf[i--] = digits[x % base];
    1660:	01110b23          	sb	a7,22(sp)
    } while ((x /= base) != 0);
    1664:	fb0573e3          	bgeu	a0,a6,160a <printf+0x4d4>
        buf[i--] = digits[x % base];
    1668:	4529                	li	a0,10
    } while ((x /= base) != 0);
    166a:	46a5                	li	a3,9
        buf[i--] = digits[x % base];
    166c:	02a5f73b          	remuw	a4,a1,a0
    1670:	973e                	add	a4,a4,a5
    1672:	00074803          	lbu	a6,0(a4)
    } while ((x /= base) != 0);
    1676:	02a5d73b          	divuw	a4,a1,a0
        buf[i--] = digits[x % base];
    167a:	01010aa3          	sb	a6,21(sp)
    } while ((x /= base) != 0);
    167e:	e6b6e3e3          	bltu	a3,a1,14e4 <printf+0x3ae>
        buf[i--] = digits[x % base];
    1682:	45b5                	li	a1,13
    if (sign)
    1684:	da065be3          	bgez	a2,143a <printf+0x304>
    1688:	a881                	j	16d8 <printf+0x5a2>
                a = "(null)";
    168a:	00001417          	auipc	s0,0x1
    168e:	9a640413          	addi	s0,s0,-1626 # 2030 <unlink+0x80>
    1692:	b3e1                	j	145a <printf+0x324>
        buf[i--] = '-';
    1694:	02d00793          	li	a5,45
    1698:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    169c:	45b9                	li	a1,14
    write(f, s, l);
    169e:	003c                	addi	a5,sp,8
    16a0:	4641                	li	a2,16
    16a2:	9e0d                	subw	a2,a2,a1
    16a4:	4505                	li	a0,1
    16a6:	95be                	add	a1,a1,a5
    16a8:	762000ef          	jal	ra,1e0a <write>
    16ac:	bb71                	j	1448 <printf+0x312>
        buf[i--] = digits[x % base];
    16ae:	459d                	li	a1,7
    if (sign)
    16b0:	d80655e3          	bgez	a2,143a <printf+0x304>
        buf[i--] = '-';
    16b4:	02d00793          	li	a5,45
    16b8:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    16bc:	4599                	li	a1,6
    16be:	bbb5                	j	143a <printf+0x304>
    16c0:	45b9                	li	a1,14
    write(f, s, l);
    16c2:	003c                	addi	a5,sp,8
    16c4:	4641                	li	a2,16
    16c6:	9e0d                	subw	a2,a2,a1
    16c8:	4505                	li	a0,1
    16ca:	95be                	add	a1,a1,a5
    16cc:	73e000ef          	jal	ra,1e0a <write>
    16d0:	bba5                	j	1448 <printf+0x312>
        buf[i--] = digits[x % base];
    16d2:	45b5                	li	a1,13
    if (sign)
    16d4:	d606d3e3          	bgez	a3,143a <printf+0x304>
        buf[i--] = '-';
    16d8:	02d00793          	li	a5,45
    16dc:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    16e0:	45b1                	li	a1,12
    write(f, s, l);
    16e2:	003c                	addi	a5,sp,8
    16e4:	4641                	li	a2,16
    16e6:	9e0d                	subw	a2,a2,a1
    16e8:	4505                	li	a0,1
    16ea:	95be                	add	a1,a1,a5
    16ec:	71e000ef          	jal	ra,1e0a <write>
    16f0:	bba1                	j	1448 <printf+0x312>
        buf[i--] = digits[x % base];
    16f2:	45b1                	li	a1,12
    if (sign)
    16f4:	d406d3e3          	bgez	a3,143a <printf+0x304>
        buf[i--] = '-';
    16f8:	02d00793          	li	a5,45
    16fc:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1700:	45ad                	li	a1,11
    write(f, s, l);
    1702:	003c                	addi	a5,sp,8
    1704:	4641                	li	a2,16
    1706:	9e0d                	subw	a2,a2,a1
    1708:	4505                	li	a0,1
    170a:	95be                	add	a1,a1,a5
    170c:	6fe000ef          	jal	ra,1e0a <write>
    1710:	bb25                	j	1448 <printf+0x312>
        buf[i--] = digits[x % base];
    1712:	45b1                	li	a1,12
    if (sign)
    1714:	d20653e3          	bgez	a2,143a <printf+0x304>
    1718:	b7c5                	j	16f8 <printf+0x5c2>
        buf[i--] = digits[x % base];
    171a:	45ad                	li	a1,11
    if (sign)
    171c:	d0065fe3          	bgez	a2,143a <printf+0x304>
        buf[i--] = '-';
    1720:	02d00793          	li	a5,45
    1724:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    1728:	45a9                	li	a1,10
    172a:	bb01                	j	143a <printf+0x304>
    172c:	45ad                	li	a1,11
    if (sign)
    172e:	d006d6e3          	bgez	a3,143a <printf+0x304>
    1732:	b7fd                	j	1720 <printf+0x5ea>
        buf[i--] = digits[x % base];
    1734:	45a9                	li	a1,10
    if (sign)
    1736:	d00652e3          	bgez	a2,143a <printf+0x304>
        buf[i--] = '-';
    173a:	02d00793          	li	a5,45
    173e:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1742:	45a5                	li	a1,9
    1744:	b9dd                	j	143a <printf+0x304>
    1746:	45a9                	li	a1,10
    if (sign)
    1748:	ce06d9e3          	bgez	a3,143a <printf+0x304>
    174c:	b7fd                	j	173a <printf+0x604>
        buf[i--] = digits[x % base];
    174e:	45a1                	li	a1,8
    if (sign)
    1750:	ce0655e3          	bgez	a2,143a <printf+0x304>
    1754:	b9f1                	j	1430 <printf+0x2fa>
        buf[i--] = digits[x % base];
    1756:	45a5                	li	a1,9
    if (sign)
    1758:	ce0651e3          	bgez	a2,143a <printf+0x304>
        buf[i--] = '-';
    175c:	02d00793          	li	a5,45
    1760:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    1764:	45a1                	li	a1,8
    1766:	b9d1                	j	143a <printf+0x304>
    i = 15;
    1768:	45bd                	li	a1,15
    176a:	b9c1                	j	143a <printf+0x304>
        buf[i--] = digits[x % base];
    176c:	45a5                	li	a1,9
    if (sign)
    176e:	cc06d6e3          	bgez	a3,143a <printf+0x304>
    1772:	b7ed                	j	175c <printf+0x626>

0000000000001774 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1774:	02000793          	li	a5,32
    1778:	00f50663          	beq	a0,a5,1784 <isspace+0x10>
    177c:	355d                	addiw	a0,a0,-9
    177e:	00553513          	sltiu	a0,a0,5
    1782:	8082                	ret
    1784:	4505                	li	a0,1
}
    1786:	8082                	ret

0000000000001788 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1788:	fd05051b          	addiw	a0,a0,-48
}
    178c:	00a53513          	sltiu	a0,a0,10
    1790:	8082                	ret

0000000000001792 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1792:	02000613          	li	a2,32
    1796:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1798:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    179c:	ff77069b          	addiw	a3,a4,-9
    17a0:	04c70d63          	beq	a4,a2,17fa <atoi+0x68>
    17a4:	0007079b          	sext.w	a5,a4
    17a8:	04d5f963          	bgeu	a1,a3,17fa <atoi+0x68>
        s++;
    switch (*s)
    17ac:	02b00693          	li	a3,43
    17b0:	04d70a63          	beq	a4,a3,1804 <atoi+0x72>
    17b4:	02d00693          	li	a3,45
    17b8:	06d70463          	beq	a4,a3,1820 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    17bc:	fd07859b          	addiw	a1,a5,-48
    17c0:	4625                	li	a2,9
    17c2:	873e                	mv	a4,a5
    17c4:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    17c6:	4e01                	li	t3,0
    while (isdigit(*s))
    17c8:	04b66a63          	bltu	a2,a1,181c <atoi+0x8a>
    int n = 0, neg = 0;
    17cc:	4501                	li	a0,0
    while (isdigit(*s))
    17ce:	4825                	li	a6,9
    17d0:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    17d4:	0025179b          	slliw	a5,a0,0x2
    17d8:	9d3d                	addw	a0,a0,a5
    17da:	fd07031b          	addiw	t1,a4,-48
    17de:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    17e2:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    17e6:	0685                	addi	a3,a3,1
    17e8:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    17ec:	0006071b          	sext.w	a4,a2
    17f0:	feb870e3          	bgeu	a6,a1,17d0 <atoi+0x3e>
    return neg ? n : -n;
    17f4:	000e0563          	beqz	t3,17fe <atoi+0x6c>
}
    17f8:	8082                	ret
        s++;
    17fa:	0505                	addi	a0,a0,1
    17fc:	bf71                	j	1798 <atoi+0x6>
    17fe:	4113053b          	subw	a0,t1,a7
    1802:	8082                	ret
    while (isdigit(*s))
    1804:	00154783          	lbu	a5,1(a0)
    1808:	4625                	li	a2,9
        s++;
    180a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    180e:	fd07859b          	addiw	a1,a5,-48
    1812:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1816:	4e01                	li	t3,0
    while (isdigit(*s))
    1818:	fab67ae3          	bgeu	a2,a1,17cc <atoi+0x3a>
    181c:	4501                	li	a0,0
}
    181e:	8082                	ret
    while (isdigit(*s))
    1820:	00154783          	lbu	a5,1(a0)
    1824:	4625                	li	a2,9
        s++;
    1826:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    182a:	fd07859b          	addiw	a1,a5,-48
    182e:	0007871b          	sext.w	a4,a5
    1832:	feb665e3          	bltu	a2,a1,181c <atoi+0x8a>
        neg = 1;
    1836:	4e05                	li	t3,1
    1838:	bf51                	j	17cc <atoi+0x3a>

000000000000183a <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    183a:	16060d63          	beqz	a2,19b4 <memset+0x17a>
    183e:	40a007b3          	neg	a5,a0
    1842:	8b9d                	andi	a5,a5,7
    1844:	00778713          	addi	a4,a5,7
    1848:	482d                	li	a6,11
    184a:	0ff5f593          	andi	a1,a1,255
    184e:	fff60693          	addi	a3,a2,-1
    1852:	17076263          	bltu	a4,a6,19b6 <memset+0x17c>
    1856:	16e6ea63          	bltu	a3,a4,19ca <memset+0x190>
    185a:	16078563          	beqz	a5,19c4 <memset+0x18a>
    185e:	00b50023          	sb	a1,0(a0)
    1862:	4705                	li	a4,1
    1864:	00150e93          	addi	t4,a0,1
    1868:	14e78c63          	beq	a5,a4,19c0 <memset+0x186>
    186c:	00b500a3          	sb	a1,1(a0)
    1870:	4709                	li	a4,2
    1872:	00250e93          	addi	t4,a0,2
    1876:	14e78d63          	beq	a5,a4,19d0 <memset+0x196>
    187a:	00b50123          	sb	a1,2(a0)
    187e:	470d                	li	a4,3
    1880:	00350e93          	addi	t4,a0,3
    1884:	12e78b63          	beq	a5,a4,19ba <memset+0x180>
    1888:	00b501a3          	sb	a1,3(a0)
    188c:	4711                	li	a4,4
    188e:	00450e93          	addi	t4,a0,4
    1892:	14e78163          	beq	a5,a4,19d4 <memset+0x19a>
    1896:	00b50223          	sb	a1,4(a0)
    189a:	4715                	li	a4,5
    189c:	00550e93          	addi	t4,a0,5
    18a0:	12e78c63          	beq	a5,a4,19d8 <memset+0x19e>
    18a4:	00b502a3          	sb	a1,5(a0)
    18a8:	471d                	li	a4,7
    18aa:	00650e93          	addi	t4,a0,6
    18ae:	12e79763          	bne	a5,a4,19dc <memset+0x1a2>
    18b2:	00750e93          	addi	t4,a0,7
    18b6:	00b50323          	sb	a1,6(a0)
    18ba:	4f1d                	li	t5,7
    18bc:	00859713          	slli	a4,a1,0x8
    18c0:	8f4d                	or	a4,a4,a1
    18c2:	01059e13          	slli	t3,a1,0x10
    18c6:	01c76e33          	or	t3,a4,t3
    18ca:	01859313          	slli	t1,a1,0x18
    18ce:	006e6333          	or	t1,t3,t1
    18d2:	02059893          	slli	a7,a1,0x20
    18d6:	011368b3          	or	a7,t1,a7
    18da:	02859813          	slli	a6,a1,0x28
    18de:	40f60333          	sub	t1,a2,a5
    18e2:	0108e833          	or	a6,a7,a6
    18e6:	03059693          	slli	a3,a1,0x30
    18ea:	00d866b3          	or	a3,a6,a3
    18ee:	03859713          	slli	a4,a1,0x38
    18f2:	97aa                	add	a5,a5,a0
    18f4:	ff837813          	andi	a6,t1,-8
    18f8:	8f55                	or	a4,a4,a3
    18fa:	00f806b3          	add	a3,a6,a5
    18fe:	e398                	sd	a4,0(a5)
    1900:	07a1                	addi	a5,a5,8
    1902:	fed79ee3          	bne	a5,a3,18fe <memset+0xc4>
    1906:	ff837693          	andi	a3,t1,-8
    190a:	00de87b3          	add	a5,t4,a3
    190e:	01e6873b          	addw	a4,a3,t5
    1912:	0ad30663          	beq	t1,a3,19be <memset+0x184>
    1916:	00b78023          	sb	a1,0(a5)
    191a:	0017069b          	addiw	a3,a4,1
    191e:	08c6fb63          	bgeu	a3,a2,19b4 <memset+0x17a>
    1922:	00b780a3          	sb	a1,1(a5)
    1926:	0027069b          	addiw	a3,a4,2
    192a:	08c6f563          	bgeu	a3,a2,19b4 <memset+0x17a>
    192e:	00b78123          	sb	a1,2(a5)
    1932:	0037069b          	addiw	a3,a4,3
    1936:	06c6ff63          	bgeu	a3,a2,19b4 <memset+0x17a>
    193a:	00b781a3          	sb	a1,3(a5)
    193e:	0047069b          	addiw	a3,a4,4
    1942:	06c6f963          	bgeu	a3,a2,19b4 <memset+0x17a>
    1946:	00b78223          	sb	a1,4(a5)
    194a:	0057069b          	addiw	a3,a4,5
    194e:	06c6f363          	bgeu	a3,a2,19b4 <memset+0x17a>
    1952:	00b782a3          	sb	a1,5(a5)
    1956:	0067069b          	addiw	a3,a4,6
    195a:	04c6fd63          	bgeu	a3,a2,19b4 <memset+0x17a>
    195e:	00b78323          	sb	a1,6(a5)
    1962:	0077069b          	addiw	a3,a4,7
    1966:	04c6f763          	bgeu	a3,a2,19b4 <memset+0x17a>
    196a:	00b783a3          	sb	a1,7(a5)
    196e:	0087069b          	addiw	a3,a4,8
    1972:	04c6f163          	bgeu	a3,a2,19b4 <memset+0x17a>
    1976:	00b78423          	sb	a1,8(a5)
    197a:	0097069b          	addiw	a3,a4,9
    197e:	02c6fb63          	bgeu	a3,a2,19b4 <memset+0x17a>
    1982:	00b784a3          	sb	a1,9(a5)
    1986:	00a7069b          	addiw	a3,a4,10
    198a:	02c6f563          	bgeu	a3,a2,19b4 <memset+0x17a>
    198e:	00b78523          	sb	a1,10(a5)
    1992:	00b7069b          	addiw	a3,a4,11
    1996:	00c6ff63          	bgeu	a3,a2,19b4 <memset+0x17a>
    199a:	00b785a3          	sb	a1,11(a5)
    199e:	00c7069b          	addiw	a3,a4,12
    19a2:	00c6f963          	bgeu	a3,a2,19b4 <memset+0x17a>
    19a6:	00b78623          	sb	a1,12(a5)
    19aa:	2735                	addiw	a4,a4,13
    19ac:	00c77463          	bgeu	a4,a2,19b4 <memset+0x17a>
    19b0:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    19b4:	8082                	ret
    19b6:	472d                	li	a4,11
    19b8:	bd79                	j	1856 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    19ba:	4f0d                	li	t5,3
    19bc:	b701                	j	18bc <memset+0x82>
    19be:	8082                	ret
    19c0:	4f05                	li	t5,1
    19c2:	bded                	j	18bc <memset+0x82>
    19c4:	8eaa                	mv	t4,a0
    19c6:	4f01                	li	t5,0
    19c8:	bdd5                	j	18bc <memset+0x82>
    19ca:	87aa                	mv	a5,a0
    19cc:	4701                	li	a4,0
    19ce:	b7a1                	j	1916 <memset+0xdc>
    19d0:	4f09                	li	t5,2
    19d2:	b5ed                	j	18bc <memset+0x82>
    19d4:	4f11                	li	t5,4
    19d6:	b5dd                	j	18bc <memset+0x82>
    19d8:	4f15                	li	t5,5
    19da:	b5cd                	j	18bc <memset+0x82>
    19dc:	4f19                	li	t5,6
    19de:	bdf9                	j	18bc <memset+0x82>

00000000000019e0 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    19e0:	00054783          	lbu	a5,0(a0)
    19e4:	0005c703          	lbu	a4,0(a1)
    19e8:	00e79863          	bne	a5,a4,19f8 <strcmp+0x18>
    19ec:	0505                	addi	a0,a0,1
    19ee:	0585                	addi	a1,a1,1
    19f0:	fbe5                	bnez	a5,19e0 <strcmp>
    19f2:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    19f4:	9d19                	subw	a0,a0,a4
    19f6:	8082                	ret
    19f8:	0007851b          	sext.w	a0,a5
    19fc:	bfe5                	j	19f4 <strcmp+0x14>

00000000000019fe <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    19fe:	ce05                	beqz	a2,1a36 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1a00:	00054703          	lbu	a4,0(a0)
    1a04:	0005c783          	lbu	a5,0(a1)
    1a08:	cb0d                	beqz	a4,1a3a <strncmp+0x3c>
    if (!n--)
    1a0a:	167d                	addi	a2,a2,-1
    1a0c:	00c506b3          	add	a3,a0,a2
    1a10:	a819                	j	1a26 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1a12:	00a68e63          	beq	a3,a0,1a2e <strncmp+0x30>
    1a16:	0505                	addi	a0,a0,1
    1a18:	00e79b63          	bne	a5,a4,1a2e <strncmp+0x30>
    1a1c:	00054703          	lbu	a4,0(a0)
    1a20:	0005c783          	lbu	a5,0(a1)
    1a24:	cb19                	beqz	a4,1a3a <strncmp+0x3c>
    1a26:	0005c783          	lbu	a5,0(a1)
    1a2a:	0585                	addi	a1,a1,1
    1a2c:	f3fd                	bnez	a5,1a12 <strncmp+0x14>
        ;
    return *l - *r;
    1a2e:	0007051b          	sext.w	a0,a4
    1a32:	9d1d                	subw	a0,a0,a5
    1a34:	8082                	ret
        return 0;
    1a36:	4501                	li	a0,0
}
    1a38:	8082                	ret
    1a3a:	4501                	li	a0,0
    return *l - *r;
    1a3c:	9d1d                	subw	a0,a0,a5
    1a3e:	8082                	ret

0000000000001a40 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1a40:	00757793          	andi	a5,a0,7
    1a44:	cf89                	beqz	a5,1a5e <strlen+0x1e>
    1a46:	87aa                	mv	a5,a0
    1a48:	a029                	j	1a52 <strlen+0x12>
    1a4a:	0785                	addi	a5,a5,1
    1a4c:	0077f713          	andi	a4,a5,7
    1a50:	cb01                	beqz	a4,1a60 <strlen+0x20>
        if (!*s)
    1a52:	0007c703          	lbu	a4,0(a5)
    1a56:	fb75                	bnez	a4,1a4a <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1a58:	40a78533          	sub	a0,a5,a0
}
    1a5c:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1a5e:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1a60:	6394                	ld	a3,0(a5)
    1a62:	00000597          	auipc	a1,0x0
    1a66:	5d65b583          	ld	a1,1494(a1) # 2038 <unlink+0x88>
    1a6a:	00000617          	auipc	a2,0x0
    1a6e:	5d663603          	ld	a2,1494(a2) # 2040 <unlink+0x90>
    1a72:	a019                	j	1a78 <strlen+0x38>
    1a74:	6794                	ld	a3,8(a5)
    1a76:	07a1                	addi	a5,a5,8
    1a78:	00b68733          	add	a4,a3,a1
    1a7c:	fff6c693          	not	a3,a3
    1a80:	8f75                	and	a4,a4,a3
    1a82:	8f71                	and	a4,a4,a2
    1a84:	db65                	beqz	a4,1a74 <strlen+0x34>
    for (; *s; s++)
    1a86:	0007c703          	lbu	a4,0(a5)
    1a8a:	d779                	beqz	a4,1a58 <strlen+0x18>
    1a8c:	0017c703          	lbu	a4,1(a5)
    1a90:	0785                	addi	a5,a5,1
    1a92:	d379                	beqz	a4,1a58 <strlen+0x18>
    1a94:	0017c703          	lbu	a4,1(a5)
    1a98:	0785                	addi	a5,a5,1
    1a9a:	fb6d                	bnez	a4,1a8c <strlen+0x4c>
    1a9c:	bf75                	j	1a58 <strlen+0x18>

0000000000001a9e <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a9e:	00757713          	andi	a4,a0,7
{
    1aa2:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1aa4:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1aa8:	cb19                	beqz	a4,1abe <memchr+0x20>
    1aaa:	ce25                	beqz	a2,1b22 <memchr+0x84>
    1aac:	0007c703          	lbu	a4,0(a5)
    1ab0:	04b70e63          	beq	a4,a1,1b0c <memchr+0x6e>
    1ab4:	0785                	addi	a5,a5,1
    1ab6:	0077f713          	andi	a4,a5,7
    1aba:	167d                	addi	a2,a2,-1
    1abc:	f77d                	bnez	a4,1aaa <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1abe:	4501                	li	a0,0
    if (n && *s != c)
    1ac0:	c235                	beqz	a2,1b24 <memchr+0x86>
    1ac2:	0007c703          	lbu	a4,0(a5)
    1ac6:	04b70363          	beq	a4,a1,1b0c <memchr+0x6e>
        size_t k = ONES * c;
    1aca:	00000517          	auipc	a0,0x0
    1ace:	57e53503          	ld	a0,1406(a0) # 2048 <unlink+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1ad2:	471d                	li	a4,7
        size_t k = ONES * c;
    1ad4:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1ad8:	02c77a63          	bgeu	a4,a2,1b0c <memchr+0x6e>
    1adc:	00000897          	auipc	a7,0x0
    1ae0:	55c8b883          	ld	a7,1372(a7) # 2038 <unlink+0x88>
    1ae4:	00000817          	auipc	a6,0x0
    1ae8:	55c83803          	ld	a6,1372(a6) # 2040 <unlink+0x90>
    1aec:	431d                	li	t1,7
    1aee:	a029                	j	1af8 <memchr+0x5a>
    1af0:	1661                	addi	a2,a2,-8
    1af2:	07a1                	addi	a5,a5,8
    1af4:	02c37963          	bgeu	t1,a2,1b26 <memchr+0x88>
    1af8:	6398                	ld	a4,0(a5)
    1afa:	8f29                	xor	a4,a4,a0
    1afc:	011706b3          	add	a3,a4,a7
    1b00:	fff74713          	not	a4,a4
    1b04:	8f75                	and	a4,a4,a3
    1b06:	01077733          	and	a4,a4,a6
    1b0a:	d37d                	beqz	a4,1af0 <memchr+0x52>
    1b0c:	853e                	mv	a0,a5
    1b0e:	97b2                	add	a5,a5,a2
    1b10:	a021                	j	1b18 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1b12:	0505                	addi	a0,a0,1
    1b14:	00f50763          	beq	a0,a5,1b22 <memchr+0x84>
    1b18:	00054703          	lbu	a4,0(a0)
    1b1c:	feb71be3          	bne	a4,a1,1b12 <memchr+0x74>
    1b20:	8082                	ret
    return n ? (void *)s : 0;
    1b22:	4501                	li	a0,0
}
    1b24:	8082                	ret
    return n ? (void *)s : 0;
    1b26:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1b28:	f275                	bnez	a2,1b0c <memchr+0x6e>
}
    1b2a:	8082                	ret

0000000000001b2c <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1b2c:	1101                	addi	sp,sp,-32
    1b2e:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1b30:	862e                	mv	a2,a1
{
    1b32:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1b34:	4581                	li	a1,0
{
    1b36:	e426                	sd	s1,8(sp)
    1b38:	ec06                	sd	ra,24(sp)
    1b3a:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1b3c:	f63ff0ef          	jal	ra,1a9e <memchr>
    return p ? p - s : n;
    1b40:	c519                	beqz	a0,1b4e <strnlen+0x22>
}
    1b42:	60e2                	ld	ra,24(sp)
    1b44:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1b46:	8d05                	sub	a0,a0,s1
}
    1b48:	64a2                	ld	s1,8(sp)
    1b4a:	6105                	addi	sp,sp,32
    1b4c:	8082                	ret
    1b4e:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1b50:	8522                	mv	a0,s0
}
    1b52:	6442                	ld	s0,16(sp)
    1b54:	64a2                	ld	s1,8(sp)
    1b56:	6105                	addi	sp,sp,32
    1b58:	8082                	ret

0000000000001b5a <stpcpy>:
char *stpcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1b5a:	00b547b3          	xor	a5,a0,a1
    1b5e:	8b9d                	andi	a5,a5,7
    1b60:	eb95                	bnez	a5,1b94 <stpcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1b62:	0075f793          	andi	a5,a1,7
    1b66:	e7b1                	bnez	a5,1bb2 <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1b68:	6198                	ld	a4,0(a1)
    1b6a:	00000617          	auipc	a2,0x0
    1b6e:	4ce63603          	ld	a2,1230(a2) # 2038 <unlink+0x88>
    1b72:	00000817          	auipc	a6,0x0
    1b76:	4ce83803          	ld	a6,1230(a6) # 2040 <unlink+0x90>
    1b7a:	a029                	j	1b84 <stpcpy+0x2a>
    1b7c:	e118                	sd	a4,0(a0)
    1b7e:	6598                	ld	a4,8(a1)
    1b80:	05a1                	addi	a1,a1,8
    1b82:	0521                	addi	a0,a0,8
    1b84:	00c707b3          	add	a5,a4,a2
    1b88:	fff74693          	not	a3,a4
    1b8c:	8ff5                	and	a5,a5,a3
    1b8e:	0107f7b3          	and	a5,a5,a6
    1b92:	d7ed                	beqz	a5,1b7c <stpcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b94:	0005c783          	lbu	a5,0(a1)
    1b98:	00f50023          	sb	a5,0(a0)
    1b9c:	c785                	beqz	a5,1bc4 <stpcpy+0x6a>
    1b9e:	0015c783          	lbu	a5,1(a1)
    1ba2:	0505                	addi	a0,a0,1
    1ba4:	0585                	addi	a1,a1,1
    1ba6:	00f50023          	sb	a5,0(a0)
    1baa:	fbf5                	bnez	a5,1b9e <stpcpy+0x44>
        ;
    return d;
}
    1bac:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1bae:	0505                	addi	a0,a0,1
    1bb0:	df45                	beqz	a4,1b68 <stpcpy+0xe>
            if (!(*d = *s))
    1bb2:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1bb6:	0585                	addi	a1,a1,1
    1bb8:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1bbc:	00f50023          	sb	a5,0(a0)
    1bc0:	f7fd                	bnez	a5,1bae <stpcpy+0x54>
}
    1bc2:	8082                	ret
    1bc4:	8082                	ret

0000000000001bc6 <stpncpy>:
char *stpncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1bc6:	00b547b3          	xor	a5,a0,a1
    1bca:	8b9d                	andi	a5,a5,7
    1bcc:	1a079863          	bnez	a5,1d7c <stpncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1bd0:	0075f793          	andi	a5,a1,7
    1bd4:	16078463          	beqz	a5,1d3c <stpncpy+0x176>
    1bd8:	ea01                	bnez	a2,1be8 <stpncpy+0x22>
    1bda:	a421                	j	1de2 <stpncpy+0x21c>
    1bdc:	167d                	addi	a2,a2,-1
    1bde:	0505                	addi	a0,a0,1
    1be0:	14070e63          	beqz	a4,1d3c <stpncpy+0x176>
    1be4:	1a060863          	beqz	a2,1d94 <stpncpy+0x1ce>
    1be8:	0005c783          	lbu	a5,0(a1)
    1bec:	0585                	addi	a1,a1,1
    1bee:	0075f713          	andi	a4,a1,7
    1bf2:	00f50023          	sb	a5,0(a0)
    1bf6:	f3fd                	bnez	a5,1bdc <stpncpy+0x16>
    1bf8:	4805                	li	a6,1
    1bfa:	1a061863          	bnez	a2,1daa <stpncpy+0x1e4>
    1bfe:	40a007b3          	neg	a5,a0
    1c02:	8b9d                	andi	a5,a5,7
    1c04:	4681                	li	a3,0
    1c06:	18061a63          	bnez	a2,1d9a <stpncpy+0x1d4>
    1c0a:	00778713          	addi	a4,a5,7
    1c0e:	45ad                	li	a1,11
    1c10:	18b76363          	bltu	a4,a1,1d96 <stpncpy+0x1d0>
    1c14:	1ae6eb63          	bltu	a3,a4,1dca <stpncpy+0x204>
    1c18:	1a078363          	beqz	a5,1dbe <stpncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c1c:	00050023          	sb	zero,0(a0)
    1c20:	4685                	li	a3,1
    1c22:	00150713          	addi	a4,a0,1
    1c26:	18d78f63          	beq	a5,a3,1dc4 <stpncpy+0x1fe>
    1c2a:	000500a3          	sb	zero,1(a0)
    1c2e:	4689                	li	a3,2
    1c30:	00250713          	addi	a4,a0,2
    1c34:	18d78e63          	beq	a5,a3,1dd0 <stpncpy+0x20a>
    1c38:	00050123          	sb	zero,2(a0)
    1c3c:	468d                	li	a3,3
    1c3e:	00350713          	addi	a4,a0,3
    1c42:	16d78c63          	beq	a5,a3,1dba <stpncpy+0x1f4>
    1c46:	000501a3          	sb	zero,3(a0)
    1c4a:	4691                	li	a3,4
    1c4c:	00450713          	addi	a4,a0,4
    1c50:	18d78263          	beq	a5,a3,1dd4 <stpncpy+0x20e>
    1c54:	00050223          	sb	zero,4(a0)
    1c58:	4695                	li	a3,5
    1c5a:	00550713          	addi	a4,a0,5
    1c5e:	16d78d63          	beq	a5,a3,1dd8 <stpncpy+0x212>
    1c62:	000502a3          	sb	zero,5(a0)
    1c66:	469d                	li	a3,7
    1c68:	00650713          	addi	a4,a0,6
    1c6c:	16d79863          	bne	a5,a3,1ddc <stpncpy+0x216>
    1c70:	00750713          	addi	a4,a0,7
    1c74:	00050323          	sb	zero,6(a0)
    1c78:	40f80833          	sub	a6,a6,a5
    1c7c:	ff887593          	andi	a1,a6,-8
    1c80:	97aa                	add	a5,a5,a0
    1c82:	95be                	add	a1,a1,a5
    1c84:	0007b023          	sd	zero,0(a5)
    1c88:	07a1                	addi	a5,a5,8
    1c8a:	feb79de3          	bne	a5,a1,1c84 <stpncpy+0xbe>
    1c8e:	ff887593          	andi	a1,a6,-8
    1c92:	9ead                	addw	a3,a3,a1
    1c94:	00b707b3          	add	a5,a4,a1
    1c98:	12b80863          	beq	a6,a1,1dc8 <stpncpy+0x202>
    1c9c:	00078023          	sb	zero,0(a5)
    1ca0:	0016871b          	addiw	a4,a3,1
    1ca4:	0ec77863          	bgeu	a4,a2,1d94 <stpncpy+0x1ce>
    1ca8:	000780a3          	sb	zero,1(a5)
    1cac:	0026871b          	addiw	a4,a3,2
    1cb0:	0ec77263          	bgeu	a4,a2,1d94 <stpncpy+0x1ce>
    1cb4:	00078123          	sb	zero,2(a5)
    1cb8:	0036871b          	addiw	a4,a3,3
    1cbc:	0cc77c63          	bgeu	a4,a2,1d94 <stpncpy+0x1ce>
    1cc0:	000781a3          	sb	zero,3(a5)
    1cc4:	0046871b          	addiw	a4,a3,4
    1cc8:	0cc77663          	bgeu	a4,a2,1d94 <stpncpy+0x1ce>
    1ccc:	00078223          	sb	zero,4(a5)
    1cd0:	0056871b          	addiw	a4,a3,5
    1cd4:	0cc77063          	bgeu	a4,a2,1d94 <stpncpy+0x1ce>
    1cd8:	000782a3          	sb	zero,5(a5)
    1cdc:	0066871b          	addiw	a4,a3,6
    1ce0:	0ac77a63          	bgeu	a4,a2,1d94 <stpncpy+0x1ce>
    1ce4:	00078323          	sb	zero,6(a5)
    1ce8:	0076871b          	addiw	a4,a3,7
    1cec:	0ac77463          	bgeu	a4,a2,1d94 <stpncpy+0x1ce>
    1cf0:	000783a3          	sb	zero,7(a5)
    1cf4:	0086871b          	addiw	a4,a3,8
    1cf8:	08c77e63          	bgeu	a4,a2,1d94 <stpncpy+0x1ce>
    1cfc:	00078423          	sb	zero,8(a5)
    1d00:	0096871b          	addiw	a4,a3,9
    1d04:	08c77863          	bgeu	a4,a2,1d94 <stpncpy+0x1ce>
    1d08:	000784a3          	sb	zero,9(a5)
    1d0c:	00a6871b          	addiw	a4,a3,10
    1d10:	08c77263          	bgeu	a4,a2,1d94 <stpncpy+0x1ce>
    1d14:	00078523          	sb	zero,10(a5)
    1d18:	00b6871b          	addiw	a4,a3,11
    1d1c:	06c77c63          	bgeu	a4,a2,1d94 <stpncpy+0x1ce>
    1d20:	000785a3          	sb	zero,11(a5)
    1d24:	00c6871b          	addiw	a4,a3,12
    1d28:	06c77663          	bgeu	a4,a2,1d94 <stpncpy+0x1ce>
    1d2c:	00078623          	sb	zero,12(a5)
    1d30:	26b5                	addiw	a3,a3,13
    1d32:	06c6f163          	bgeu	a3,a2,1d94 <stpncpy+0x1ce>
    1d36:	000786a3          	sb	zero,13(a5)
    1d3a:	8082                	ret
            ;
        if (!n || !*s)
    1d3c:	c645                	beqz	a2,1de4 <stpncpy+0x21e>
    1d3e:	0005c783          	lbu	a5,0(a1)
    1d42:	ea078be3          	beqz	a5,1bf8 <stpncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d46:	479d                	li	a5,7
    1d48:	02c7ff63          	bgeu	a5,a2,1d86 <stpncpy+0x1c0>
    1d4c:	00000897          	auipc	a7,0x0
    1d50:	2ec8b883          	ld	a7,748(a7) # 2038 <unlink+0x88>
    1d54:	00000817          	auipc	a6,0x0
    1d58:	2ec83803          	ld	a6,748(a6) # 2040 <unlink+0x90>
    1d5c:	431d                	li	t1,7
    1d5e:	6198                	ld	a4,0(a1)
    1d60:	011707b3          	add	a5,a4,a7
    1d64:	fff74693          	not	a3,a4
    1d68:	8ff5                	and	a5,a5,a3
    1d6a:	0107f7b3          	and	a5,a5,a6
    1d6e:	ef81                	bnez	a5,1d86 <stpncpy+0x1c0>
            *wd = *ws;
    1d70:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d72:	1661                	addi	a2,a2,-8
    1d74:	05a1                	addi	a1,a1,8
    1d76:	0521                	addi	a0,a0,8
    1d78:	fec363e3          	bltu	t1,a2,1d5e <stpncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1d7c:	e609                	bnez	a2,1d86 <stpncpy+0x1c0>
    1d7e:	a08d                	j	1de0 <stpncpy+0x21a>
    1d80:	167d                	addi	a2,a2,-1
    1d82:	0505                	addi	a0,a0,1
    1d84:	ca01                	beqz	a2,1d94 <stpncpy+0x1ce>
    1d86:	0005c783          	lbu	a5,0(a1)
    1d8a:	0585                	addi	a1,a1,1
    1d8c:	00f50023          	sb	a5,0(a0)
    1d90:	fbe5                	bnez	a5,1d80 <stpncpy+0x1ba>
        ;
tail:
    1d92:	b59d                	j	1bf8 <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    1d94:	8082                	ret
    1d96:	472d                	li	a4,11
    1d98:	bdb5                	j	1c14 <stpncpy+0x4e>
    1d9a:	00778713          	addi	a4,a5,7
    1d9e:	45ad                	li	a1,11
    1da0:	fff60693          	addi	a3,a2,-1
    1da4:	e6b778e3          	bgeu	a4,a1,1c14 <stpncpy+0x4e>
    1da8:	b7fd                	j	1d96 <stpncpy+0x1d0>
    1daa:	40a007b3          	neg	a5,a0
    1dae:	8832                	mv	a6,a2
    1db0:	8b9d                	andi	a5,a5,7
    1db2:	4681                	li	a3,0
    1db4:	e4060be3          	beqz	a2,1c0a <stpncpy+0x44>
    1db8:	b7cd                	j	1d9a <stpncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1dba:	468d                	li	a3,3
    1dbc:	bd75                	j	1c78 <stpncpy+0xb2>
    1dbe:	872a                	mv	a4,a0
    1dc0:	4681                	li	a3,0
    1dc2:	bd5d                	j	1c78 <stpncpy+0xb2>
    1dc4:	4685                	li	a3,1
    1dc6:	bd4d                	j	1c78 <stpncpy+0xb2>
    1dc8:	8082                	ret
    1dca:	87aa                	mv	a5,a0
    1dcc:	4681                	li	a3,0
    1dce:	b5f9                	j	1c9c <stpncpy+0xd6>
    1dd0:	4689                	li	a3,2
    1dd2:	b55d                	j	1c78 <stpncpy+0xb2>
    1dd4:	4691                	li	a3,4
    1dd6:	b54d                	j	1c78 <stpncpy+0xb2>
    1dd8:	4695                	li	a3,5
    1dda:	bd79                	j	1c78 <stpncpy+0xb2>
    1ddc:	4699                	li	a3,6
    1dde:	bd69                	j	1c78 <stpncpy+0xb2>
    1de0:	8082                	ret
    1de2:	8082                	ret
    1de4:	8082                	ret

0000000000001de6 <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    1de6:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    1dea:	4609                	li	a2,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dec:	00000073          	ecall
#include "syscall.h"

int open(const char *path, int flags)
{
    return syscall(SYS_openat, path, flags, O_RDWR);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <close>:
    register long a7 __asm__("a7") = n;
    1df4:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1df8:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1dfc:	2501                	sext.w	a0,a0
    1dfe:	8082                	ret

0000000000001e00 <read>:
    register long a7 __asm__("a7") = n;
    1e00:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e04:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1e08:	8082                	ret

0000000000001e0a <write>:
    register long a7 __asm__("a7") = n;
    1e0a:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e0e:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1e12:	8082                	ret

0000000000001e14 <getpid>:
    register long a7 __asm__("a7") = n;
    1e14:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1e18:	00000073          	ecall

int getpid(void)
{
    return syscall(SYS_getpid);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1e20:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1e24:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <fork>:
    register long a7 __asm__("a7") = n;
    1e2c:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    1e30:	00000073          	ecall

int fork(void)
{
    return syscall(SYS_clone);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <exit>:
    register long a7 __asm__("a7") = n;
    1e38:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e3c:	00000073          	ecall

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e40:	8082                	ret

0000000000001e42 <waitpid>:
    register long a7 __asm__("a7") = n;
    1e42:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e46:	00000073          	ecall

int waitpid(int pid, int *code)
{
    return syscall(SYS_wait4, pid, code);
}
    1e4a:	2501                	sext.w	a0,a0
    1e4c:	8082                	ret

0000000000001e4e <exec>:
    register long a7 __asm__("a7") = n;
    1e4e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e52:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e56:	2501                	sext.w	a0,a0
    1e58:	8082                	ret

0000000000001e5a <get_time>:

int64 get_time()
{
    1e5a:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e5c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e60:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e62:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e64:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e68:	2501                	sext.w	a0,a0
    1e6a:	ed09                	bnez	a0,1e84 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e6c:	67a2                	ld	a5,8(sp)
    1e6e:	3e800713          	li	a4,1000
    1e72:	00015503          	lhu	a0,0(sp)
    1e76:	02e7d7b3          	divu	a5,a5,a4
    1e7a:	02e50533          	mul	a0,a0,a4
    1e7e:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e80:	0141                	addi	sp,sp,16
    1e82:	8082                	ret
        return -1;
    1e84:	557d                	li	a0,-1
    1e86:	bfed                	j	1e80 <get_time+0x26>

0000000000001e88 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e88:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e8c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e90:	2501                	sext.w	a0,a0
    1e92:	8082                	ret

0000000000001e94 <sleep>:

int sleep(unsigned long long time)
{
    1e94:	1141                	addi	sp,sp,-16
    1e96:	862a                	mv	a2,a0
    register long a7 __asm__("a7") = n;
    1e98:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e9c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e9e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea0:	00000073          	ecall
    if (err == 0)
    1ea4:	2501                	sext.w	a0,a0
    1ea6:	e13d                	bnez	a0,1f0c <sleep+0x78>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ea8:	6722                	ld	a4,8(sp)
    1eaa:	3e800693          	li	a3,1000
    1eae:	00015783          	lhu	a5,0(sp)
    1eb2:	02d75733          	divu	a4,a4,a3
    1eb6:	02d787b3          	mul	a5,a5,a3
    1eba:	97ba                	add	a5,a5,a4
    register long a7 __asm__("a7") = n;
    1ebc:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ec0:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ec2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec4:	00000073          	ecall
    if (err == 0)
    1ec8:	2501                	sext.w	a0,a0
    1eca:	ed15                	bnez	a0,1f06 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ecc:	6841                	lui	a6,0x10
    1ece:	963e                	add	a2,a2,a5
    1ed0:	187d                	addi	a6,a6,-1
    1ed2:	3e800693          	li	a3,1000
    1ed6:	a819                	j	1eec <sleep+0x58>
    __asm_syscall("r"(a7))
    1ed8:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    1edc:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ee0:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ee2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ee4:	00000073          	ecall
    if (err == 0)
    1ee8:	2501                	sext.w	a0,a0
    1eea:	ed11                	bnez	a0,1f06 <sleep+0x72>
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1eec:	67a2                	ld	a5,8(sp)
    register long a7 __asm__("a7") = n;
    1eee:	07c00893          	li	a7,124
    1ef2:	02d7d733          	divu	a4,a5,a3
    1ef6:	6782                	ld	a5,0(sp)
    1ef8:	0107f7b3          	and	a5,a5,a6
    1efc:	02d787b3          	mul	a5,a5,a3
    1f00:	97ba                	add	a5,a5,a4
    unsigned long long s = get_time();
    while (get_time() < s + time)
    1f02:	fcc7ebe3          	bltu	a5,a2,1ed8 <sleep+0x44>
    {
        sched_yield();
    }
    return 0;
}
    1f06:	4501                	li	a0,0
    1f08:	0141                	addi	sp,sp,16
    1f0a:	8082                	ret
    1f0c:	57fd                	li	a5,-1
    1f0e:	b77d                	j	1ebc <sleep+0x28>

0000000000001f10 <set_priority>:
    register long a7 __asm__("a7") = n;
    1f10:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1f14:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1f18:	2501                	sext.w	a0,a0
    1f1a:	8082                	ret

0000000000001f1c <mmap>:
    register long a7 __asm__("a7") = n;
    1f1c:	0de00893          	li	a7,222
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f20:	00000073          	ecall

int mmap(void *start, unsigned long long len, int prot)
{
    return syscall(SYS_mmap, start, len, prot);
}
    1f24:	2501                	sext.w	a0,a0
    1f26:	8082                	ret

0000000000001f28 <munmap>:
    register long a7 __asm__("a7") = n;
    1f28:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f2c:	00000073          	ecall

int munmap(void *start, unsigned long long len)
{
    return syscall(SYS_munmap, start, len);
}
    1f30:	2501                	sext.w	a0,a0
    1f32:	8082                	ret

0000000000001f34 <wait>:

int wait(int *code)
{
    1f34:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f36:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1f3a:	557d                	li	a0,-1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f3c:	00000073          	ecall
    return waitpid(-1, code);
}
    1f40:	2501                	sext.w	a0,a0
    1f42:	8082                	ret

0000000000001f44 <spawn>:
    register long a7 __asm__("a7") = n;
    1f44:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1f48:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1f4c:	2501                	sext.w	a0,a0
    1f4e:	8082                	ret

0000000000001f50 <mailread>:
    register long a7 __asm__("a7") = n;
    1f50:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f54:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f58:	2501                	sext.w	a0,a0
    1f5a:	8082                	ret

0000000000001f5c <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f5c:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f60:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f64:	2501                	sext.w	a0,a0
    1f66:	8082                	ret

0000000000001f68 <fstat>:
    register long a7 __asm__("a7") = n;
    1f68:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f6c:	00000073          	ecall

int fstat(int fd, Stat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f70:	2501                	sext.w	a0,a0
    1f72:	8082                	ret

0000000000001f74 <sys_linkat>:
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    1f74:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f76:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f7a:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f7c:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f80:	2501                	sext.w	a0,a0
    1f82:	8082                	ret

0000000000001f84 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f84:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f86:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f8a:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f8c:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f90:	2501                	sext.w	a0,a0
    1f92:	8082                	ret

0000000000001f94 <link>:

int link(char *old_path, char *new_path)
{
    1f94:	87aa                	mv	a5,a0
    1f96:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f98:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f9c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1fa0:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1fa2:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1fa6:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fa8:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1fac:	2501                	sext.w	a0,a0
    1fae:	8082                	ret

0000000000001fb0 <unlink>:

int unlink(char *path)
{
    1fb0:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1fb2:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1fb6:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1fba:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fbc:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1fc0:	2501                	sext.w	a0,a0
    1fc2:	8082                	ret
