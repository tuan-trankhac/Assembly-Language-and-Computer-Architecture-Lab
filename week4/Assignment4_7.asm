# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY
# Purpose: Calculate mult of a integer number with 10 then check with mult and mflo, mfhi
.data
	output1: .asciiz "\nEnter a integer number: "
	output2: .asciiz "\nResult: "
	output3: .asciiz "\nResult with mult and mflo: "
	space: .asciiz "\n"
	s1: .asciiz "\n$s1: "
	s3: .asciiz "\n$s3: "
	s4: .asciiz "\n$s4: "
	
.text
.globl main
main:
	# Print string output1
	ori $v0, $zero, 4
	la $a0, output1
	syscall
	# Read input
	ori $v0, $zero, 5
	syscall
	move $s0, $v0	# $s0: Multicand
	move $t6, $v0
	# Multilier
	addi $s1, $zero, 10
	move $t7, $s1
	# For and brench
	addi $s7, $0, 33 # n = 33
	addi $s6, $0, 0    # $s6: product
	addi $s5, $0, 1    # i = 1
	FOR:
		slt $t0, $s5, $s7  # $t0 = i < n?
		beq $t0, $0, RESULT   # if !(i < n) goto RESULT
		andi $s4, $s1, 0x1
		#
		ori $v0, $zero, 4
		la $a0, space
		syscall
		ori $v0, $zero, 4
		la $a0, s1
		syscall
		ori $v0, $zero, 35
		move $a0, $s1
		syscall
		
		ori $v0, $zero, 4
		la $a0, space
		syscall
		#
		
		addi $s3, $zero, 0x1
		beq $s4, $s3, PLUS
		
		CONTINUE:
		sll $s0, $s0, 1
		srl $s1, $s1, 1
		#
		ori $v0, $zero, 4
		la $a0, s3
		syscall
		ori $v0, $zero, 35
		move $a0, $s3
		syscall
		
		ori $v0, $zero, 4
		la $a0, space
		syscall
		ori $v0, $zero, 4
		la $a0, s4
		syscall
		ori $v0, $zero, 35
		move $a0, $s4
		syscall
		
		ori $v0, $zero, 4
		la $a0, space
		syscall
		
		#ori $v0, $zero, 35
		#move $a0, $s6
		#syscall
		#
		addi $s5, $s5, 1   # i = i + 1
		j FOR
	# Multicand + product:
	PLUS:
		add $s6, $s6, $s0
		j CONTINUE
	RESULT:
		# Print output2
		ori $v0, $zero, 4
		la $a0, output2
		syscall
		# Print result in binary
		ori $v0, $zero, 35
		move $a0, $s6
		syscall
	# Check with mult and mflo, mfhi
	mult $t6, $t7
	mflo $t6
	mfhi $t7
	add $t6, $t6, $t7
		# Print output3
		ori $v0, $zero, 4
		la $a0, output3
		syscall
		# Print result with mult and mflo, mfhi
		ori $v0, $zero, 35
		move $a0, $t6
		syscall
	# End program
	ori $v0, $zero, 10
	syscall