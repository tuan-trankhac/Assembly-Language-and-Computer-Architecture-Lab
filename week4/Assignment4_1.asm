# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY
.data
	space: .asciiz "\n"
.text
	ori $s0, $zero, 0x12345678	# $s0 = 0x12345678
	
	# Lay bit MSB cua $a0
	andi $t0, $s0, 0xff000000
	# Check 
	move $a0, $t0
	li $v0, 34
	syscall
	
	# print space
	ori $v0, $zero, 4
	la $a0, space
	syscall
	
	# Xoa bit LSB cua $s0
	andi $t0, $s0, 0x12345600
	# Check
	move $a0, $t0
	li $v0, 34
	syscall
	
	# print space
	ori $v0, $zero, 4
	la $a0, space
	syscall
	
	# Thiet lap bit LSB cua $s0 (bit 7 -> 0 thiet lap ve 1)
	ori $t0, $s0, 0x100
	# Check
	move $a0, $t0
	li $v0, 34
	syscall
	
	and $s0, $zero, $s0
	# print space
	ori $v0, $zero, 4
	la $a0, space
	syscall
	# Check
	move $a0, $s0
	li $v0, 34
	syscall