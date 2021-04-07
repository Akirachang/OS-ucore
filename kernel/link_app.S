    .align 4
    .section .data
    .global _app_num
_app_num:
    .quad 1
    .quad app_0_start
    .quad app_0_end

    .global _app_names
_app_names:
   .string "ch2_exit.bin"

    .section .data.app0
    .global app_0_start
app_0_start:
    .incbin "../user/target/bin/ch2_exit.bin"
app_0_end:

