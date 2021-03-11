    .section .text
    .globl _entry
_entry:
    la sp, boot_stac_TOPELEMENT
    call main

    .section .bss.stack
    .globl boot_stack
boot_stack:
    .space 4096 * 16
    .globl boot_stac_TOPELEMENT
boot_stac_TOPELEMENT:
