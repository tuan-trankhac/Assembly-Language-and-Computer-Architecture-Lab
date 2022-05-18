# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY

# Purpose: Detect overflow with addition
# For signed numbers: adding 2 numbers with different signs does not overflow,
# adding 2 numbers with the same sign overflow occurs when the sign of the result 
# is different from the signs of the 2 given numbers
.data
	readinput: .asciiz "\nEnter your 2 integer number: "
	notice: .asciiz "\nOVERFLOW"
.text
.globl main
main:
	# Print string readinput
	la $a0, readinput
	jal PrintString
	# Read input from stdin
	jal ReadInteger
	move $s0, $v0
	move $t0, $v0
	
	jal ReadInteger
	move $s1, $v0
	move $t1, $v0
	# Detect overflow
	# for signed numbers
		addu $s2, $s0, $s1
		# variable initialization
		addi $s7, $0, 33 # n = 33
		addi $s5, $0, 1    # i = 1
		
		for:
		slt $t0, $s5, $s7  # $t0 = i < n?
		beq $t0, $0, END   # if !(i < n) goto END
		andi $s3, $s0, 0x80000000
		andi $s4, $s2, 0x80000000
		bne $s0, $s2, NOTICE
		sll $s0, $s0, 1
		sll $s2, $s2, 1
		addi $s5, $s5, 1   # i = i + 1
		j for
		
		NOTICE:
		la $a0, notice
		jal PrintString
		j ENDPROGRAM
		
		END:
		# Print result of adding
		move $a0, $s0
		jal PrintIntNoPrompt
	# for unsigned numbers
		add $t0, $t0, $t1 # The system automatically warns when an overflow occurs
	ENDPROGRAM:
		jal Exit
.include "utils.asm"