.text
kStatMy_sub_sortSub:
.globl kStatMy_sub_sortSub

  li a2, 1 # a2 = 1 | i
  
loop_i_start:
  bgeu a2, a3, loops_exit # if(a2 >= a3) goto loops_exit | if(i >= arr_len)
  
  slli t0, a2, 2 # t0 = a2(i) << 2 = a2(i) * 4
  add t0, a4, t0 # t0 = a4 + t0 = a4 + a2(i) * 4 | [i]
  lw a7, 0(t0) # a7(insertElement) = arr[i]
  
  addi a5, a2, -1 # a5 = a2 - 1 | j = i - 1  
  
loop_j:
  bltz a5, loop_i_end # if(j < 0) goto loop_i_end
  
  slli t1, a5, 2 # t1 = a5(j) << 2 = a5(j) * 4
  add t1, a4, t1 # t1 = a4 + t1 = a4 + a5(j) * 4 | [j]
  lw t3, 0(t1) # t3 = arr[j]
  
  bgeu a7, t3, loop_i_end # if(a7 >= t3) goto loop_i_end | if(insertElement >= arr[j])
  
  addi t2, t1, 4 # t2 = t1 + 4 | [j+1]
  sw t3, 0(t2) # arr[j+1] = arr[j]
  
  addi a5, a5, -1 # a5 = a5 - 1 | j--  
  j loop_j
  
loop_i_end:
  slli t1, a5, 2 # t1 = a5(j) << 2 = a5(j) * 4
  add t1, a4, t1 # t1 = a4 + t1 = a4 + a5(j) * 4 | [j]
  addi t2, t1, 4 # t2 = t1 + 4 | [j+1]
  
  sw a7, 0(t2) # arr[j+1] = insertElement
  
  addi a2, a2, 1  # i++
  j loop_i_start

loops_exit:
  slli t4, a6, 2 # t4 = a6(k) << 2 = a6(k) * 4
  add t4, a4, t4 # t4 = a4 + t4 = a4 + a6(k) * 4 | [k]
  addi t4, t4, -4 # t4 = t4 - 4 | [k-1] | т.к. нумерация в массиве с 0
  lw a6, 0(t4) # a6 = arr[k]

  ret