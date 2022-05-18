# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY

.data
	x: .word 10
	y: .word 5
	z: .word 4
	error: .asciiz "This option doesn't exist"
	outputx: .asciiz "x = "
	outputy: .asciiz "y = "
	outputz: .asciiz "z = "
	choice: .asciiz " Enter 1, 2, 3, 4 for i<j, i>=j, i+j<=0, i+j>m+n: "
.text
	ori $s1, $0, 3	# i = 3
	ori $s2, $0, 5	# j = 5
	lw $t1, x
	lw $t2, y
	lw $t3, z
	la $a0, choice
	jal PromptInt
	slt $t7, $v0, $0
	beqz $t7, option1
	j default
	option1: # i < j
		bne $v0, 1, option2
		start1:
		sge $t0, $s1, $s2	# i >= j
		bne $t0, $0, else1	# branch to else if i >= j
		addi $t1, $t1, 1	#	then part: x+=1
		addi $t3, $0, 1		# z = 1
		j endif			# skip "else" part
		else1:	
		addi $t2, $t2, -1	# begin else part: y = y-1
		add $t3, $t3, $t3	# z = 2*z
		j endif
	option2: # i >= j
		bne $v0, 2, option3
		start2:
		slt $t0, $s1, $s2	# i < j
		bne $t0, $0, else2	# branch to else if i < j
		addi $t1, $t1, 1	#	then part: x+=1
		addi $t3, $0, 1		# z = 1
		j endif			# skip "else" part
		else2:	
		addi $t2, $t2, -1	# begin else part: y = y-1
		add $t3, $t3, $t3	# z = 2*z
		j endif
	option3: # i+j<=0
		bne $v0, 3, option4
		start3:
		add $t7, $s1, $s2	# t7 = i+j
		sgt $t0, $t7, $0	# i+j>0
		bne $t0, $0, else3	# branch to else if i+j>0
		addi $t1, $t1, 1	#	then part: x+=1
		addi $t3, $0, 1		# z = 1
		j endif			# skip "else" part
		else3:	
		addi $t2, $t2, -1	# begin else part: y = y-1
		add $t3, $t3, $t3	# z = 2*z
		j endif
	
	option4: # i+j>m+n
		li $t6, 3		# m
		li $t5, 4		# n
		add $t7, $s1, $s2	# t7 = i+j
		add $t5, $t5, $t6	# t5 = m+n
		bne $v0, 4, default
		start4:
		sle $t0, $t7, $t5	# i+j <= m+n
		bne $t0, $0, else4	# branch to else if i+j <= m+n
		addi $t1, $t1, 1	#	then part: x+=1
		addi $t3, $0, 1		# z = 1
		j endif			# skip "else" part
		else4:	
		addi $t2, $t2, -1	# begin else part: y = y-1
		add $t3, $t3, $t3	# z = 2*z
	
endif:
	la $a0, outputx
	move $a1, $t1
	jal PrintInt
	
	jal PrintNewLine 
	
	la $a0, outputy
	move $a1, $t2
	jal PrintInt
	
	jal PrintNewLine
	
	la $a0, outputz
	move $a1, $t3
	jal PrintInt
	
	jal Exit
default:
	la $a0, error
	jal PrintString
	jal Exit
	
.include "utils.asm"
