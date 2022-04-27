# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY
.data
	output1: .asciiz "\nEnter your 2 integer number: "
	output2: .asciiz "\nResult of NAND: "
	
.text 
.globl main
main:
	#Print string output1
	ori $v0, $zero, 4
	la $a0, output1
	syscall
	#Read input from stdin
	ori $v0, $zero, 5
	syscall
	move $s0, $v0
	
	ori $v0, $zero, 5
	syscall
	move $s1, $v0
	# NAND
	and $0, $s0, $s1
	not $s0, $s0
	# Print string output2
	ori $v0, $zero, 4
	la $a0, output2
	syscall
	# Print result
	move $a0, $s0
	ori $v0, $zero, 35
	syscall
	# End program
	ori $v0, $0, 10
	syscall