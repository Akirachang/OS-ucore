typedef unsigned int   uint;
typedef unsigned short ushort;
typedef unsigned char  uchar;
typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned int  uint32;
typedef unsigned long long uint64;
typedef struct{
    uint64 sec;	// 自 Unix 纪元起的秒数
    uint64 usec;	// 微秒数
}TimeVal;
// typedef uint64 pte_t;
// typedef uint64 pde_t;
// typedef uint64 *pagetable_t;// 512 PTEs
