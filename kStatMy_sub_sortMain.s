.text
kStatMy_sub_sortMain:
.globl kStatMy_sub_sortMain
  lw a3, array_length # a3 = 6 | array_lenght
  la a4, array # a4 = <адрес 0-го элемента массива>
  lw a6, k # a6 = k

  add s1, s1, ra # s1 = <возвращаемый адрес на kStatMy_Sub_Setup>
  
  call kStatMy_sub_sortSub  # call fun
  
  mv ra, s1 # устанавливаем в возвращаемый регистр сохраненный адрес 
  ret # return

.rodata
array_length:
  .word 6
k:
  .word 4
    
.data
array: #1, 6, 12, 36, 99, 110
  .word 12, 36, 110, 1, 6, 99