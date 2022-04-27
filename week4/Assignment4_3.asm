# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY
.data
	space: .asciiz "\n"
.text
.globl main
main:
	addi $s7, $0, 5 # n = 5
	addi $s6, $0, 1    # s = 1
	addi $s5, $0, 1    # i = 1
	addi $s0, $0, 2
	FOR:
		slt $t0, $s5, $s7  # $t0 = i < n?
		beq $t0, $0, END   # if !(i < n) goto END
		# Multi
		mul $s6, $s6, $s0
		# Print result
		ori $v0, $zero, 1
		move $a0, $s6
		syscall
		# Print space
		ori $v0, $zero, 4
		la $a0, space
		syscall
		addi $s5, $s5, 1   # i = i + 1
		j FOR
	END:
		ori $v0, $0, 10
		syscall