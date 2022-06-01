# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY
.data
	string: .space 21
	output: .space 21
.text
	la $a0, string
	li $a1, 21
	li $v0, 8
	syscall
	
	# get length of string
	jal strlen
	subi $t0, $v0, 1	# t0 = j = length of string
	xor $t1, $0, $0		# t1 = i = 0

Reverse:
	add $t2, $a0, $t1
	lb $t3, 0($t2)
	beqz $t3, display_str
	sb $t3, output($t0)
	addi $t1, $t1, 1
	subi $t0, $t0, 1
	j Reverse
display_str:
	la $a0, output
	li $v0, 4
	syscall
.include "utils.asm"