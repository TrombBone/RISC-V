.text
__start:
.globl __start
  call kStatMy_sub_sortMain
finish:
  li a0, 10
  ecall