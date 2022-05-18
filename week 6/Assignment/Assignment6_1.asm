# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY
.data
	x: .word 10
	y: .word 5
	z: .word 4
	outputx: .asciiz "x = "
	outputy: .asciiz "y = "
	outputz: .asciiz "z = "
.text
	ori $s1, $0, 3	# i = 3
	ori $s2, $0, 5	# j = 5
	lw $t1, x
	lw $t2, y
	lw $t3, z
	start:
		slt $t0, $s2, $s1	# j < i
		bne $t0, $0, else	# branch to else if j < i
		addi $t1, $t1, 1	#	then part: x+=1
		addi $t3, $0, 1		# z = 1
		j endif			# skip "else" part
	else:	
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
.include "utils.asm"