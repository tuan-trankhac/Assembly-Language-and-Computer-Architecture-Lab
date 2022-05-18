# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY

.data
	array: .word 2,5,12,6,8,1,9
	result: .asciiz "Sum = "
.text
		or $s1, $0, $0	        #  i = 0
		la $s2, array		# address start with array A
		ori $s3, $0, 6		# n = 6
		ori $s4, $0, 1		# step = 1
		lw $t7, array($0)	# 
		add $s5, $0, $t7	# sum = 0
		
	loop:
		add $s1, $s1, $s4	# i = i+step
		add $t1, $s1, $s1	# t1 = 2*s1
		add $t1, $t1, $t1	# t1 = 4*s1
		add $t1, $t1, $s2	# t1 store the address of A[i]
		lw $t0, 0($t1)		# load value of A[i] in $t0
		add $s5, $s5, $t0	# sum = sum + A[i]
		bne $s1, $s3, loop	# if i!= n, goto loop

	end:
		la $a0, result
		move $a1, $s5
		jal PrintInt
.include "utils.asm"