# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY
.data
	ReadInput: .asciiz "Enter your integer number to check prime: "
	Prime: .asciiz "Number that you entered is prime"
	NotPrime: .asciiz "Number that you entered is NOT prime"
.text
	# Read Input from stdin
	la $a0, ReadInput
	jal PromptInt
	move $t0, $v0
	# Check Prime
		# if number < 2, that number is not prime
		slti  $t1, $t0, 2
		bne $t1, 0, Notice_NOT_Prime
		# if number >= 2
		xori $t1, $0, 0		# count = 0
		xori $t2, $0, 2		# i = 2
		xor $t3, $t0, $0		# n = t0
		for:
			sge $t4, $t2, $t3
			bnez $t4, end_for
			rem $t5, $t0, $t2
			# if t5 = 0 then count = count+1
			bnez $t5, continue
			addi $t1, $t1, 1
			j end_for
			continue:
			addi $t2, $t2, 1
			j for
		end_for:
			# if count == 0 -> prime
			bnez $t1, Notice_NOT_Prime
	Notice_Prime:
		la $a0, Prime
		jal PrintString
		jal Exit
	Notice_NOT_Prime:
		la $a0, NotPrime
		jal PrintString
		jal Exit
.include "utils.asm"