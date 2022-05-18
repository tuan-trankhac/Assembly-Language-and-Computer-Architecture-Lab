# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY

.data
	array: .word 2,5,12,6,8,1,9
	result: .asciiz "Sum = "
	choice: .asciiz " Enter 1, 2, 3, 4 for i < n, i <= n, sum >= 0, A[i]==0: "
	error: .asciiz "This option doesn't exist"
	
.text
		or $s1, $0, $0	        #  i = 0
		la $s2, array		# address start with array A
		ori $s3, $0, 6		# n = 6
		ori $s4, $0, 1		# step = 1
		lw $t7, array($0)	# 
		add $s5, $0, $t7	# sum = 0
		la $a0, choice
		jal PromptInt
		sle $t7, $0, $v0	# choice >= 0
		beq $t7, $0, default
	option1: # i < n
		bne $v0, 1, option2
		loop1:
		add $s1, $s1, $s4	# i = i+step
		add $t1, $s1, $s1	# t1 = 2*s1
		add $t1, $t1, $t1	# t1 = 4*s1
		add $t1, $t1, $s2	# t1 store the address of A[i]
		lw $t0, 0($t1)		# load value of A[i] in $t0
		add $s5, $s5, $t0	# sum = sum + A[i]
		slt $t5, $s1, $s3	# if i!= n, goto loop
		bne $t5, $0, loop1	
		j end

	option2: # i <= n
		bne $v0, 2, option3
		loop2:
		add $s1, $s1, $s4	# i = i+step
		add $t1, $s1, $s1	# t1 = 2*s1
		add $t1, $t1, $t1	# t1 = 4*s1
		add $t1, $t1, $s2	# t1 store the address of A[i]
		lw $t0, 0($t1)		# load value of A[i] in $t0
		add $s5, $s5, $t0	# sum = sum + A[i]
		sle $t5, $s1, $s3	# if i!= n, goto loop
		bne $t5, $0, loop2
		j end

	option3: # sum >= 0
		bne $v0, 3, option4
		loop3:
		add $s1, $s1, $s4	# i = i+step
		add $t1, $s1, $s1	# t1 = 2*s1
		add $t1, $t1, $t1	# t1 = 4*s1
		add $t1, $t1, $s2	# t1 store the address of A[i]
		lw $t0, 0($t1)		# load value of A[i] in $t0
		add $s5, $s5, $t0	# sum = sum + A[i]
		sge $t5, $s5, $0
		bne $t5, $0, loop3	# if i!= n, goto loop
		j end

	option4: # A[i] == 0
		bne $v0, 4, default
		loop4:
		add $s1, $s1, $s4	# i = i+step
		add $t1, $s1, $s1	# t1 = 2*s1
		add $t1, $t1, $t1	# t1 = 4*s1
		add $t1, $t1, $s2	# t1 store the address of A[i]
		lw $t0, 0($t1)		# load value of A[i] in $t0
		add $s5, $s5, $t0	# sum = sum + A[i]
		bne $t0, $0, loop4	# if i!= n, goto loop

	end:
		la $a0, result
		move $a1, $s5
		jal PrintInt
	default:
		la $a0, error
		jal PrintString
		jal Exit
		
.include "utils.asm"