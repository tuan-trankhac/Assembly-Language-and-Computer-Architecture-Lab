# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY
.data
	output1: .asciiz "\nEnter a integer number: "
	output2: .asciiz "\nResult of bitwiser NOT is: "
	output3: .asciiz "\nResult by XOR is: "
	
.text
.globl main
main:
	# Print string output1
	ori $v0, $zero, 4
	la $a0, output1
	syscall
	# Read integer number from stdin
	ori $v0, $zero, 5
	syscall
	move $s0, $v0
	# NOT
	not $s1, $s0
	# Print string output2
	ori $v0, $zero, 4
	la $a0, output2
	syscall
	# Print result of NOT
	move $a0, $s1
	ori $v0, $zero, 35
	syscall
	# XOR to caculate NOT of integer number
	xori $t0, $s0, 0xffffffff
	# Print string output2
	ori $v0, $zero, 4
	la $a0, output3
	syscall
	# Print result of XOR
	move $a0, $t0
	ori $v0, $zero, 35
	syscall
	# End program
	ori $v0, $0, 10
	syscall

