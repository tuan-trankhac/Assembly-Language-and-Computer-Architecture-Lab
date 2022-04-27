# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY

.data
	output1: .asciiz "\nEnter two integers value (a, b): "
	output2: .asciiz "\n Input value in hexa: "
	outputtemp: .asciiz "  "
	output3: .asciiz "\n Result of a XOR b: "
	output4: .asciiz "\n Result of (a XOR b) XOR b: "

.text
.globl main
main:
	ori $v0, $zero, 4
	la $a0, output1
	syscall
	
	# Read input
	ori $v0, $zero, 5
	syscall
	move $s0, $v0
	
	ori $v0, $zero, 5
	syscall
	move $s1, $v0
	
	# Print input in hexa
	
	ori $v0, $zero, 4
	la $a0, output2
	syscall
	
	ori $v0, $zero, 34
	move $a0, $s0
	syscall
	
	ori $v0, $zero, 4
	la $a0, outputtemp
	syscall
	
	ori $v0, $zero, 34
	move $a0, $s1
	syscall
	
	# a XOR b
	ori $v0, $zero, 4
	la $a0, output3
	syscall 
	
	xor $s0, $s0, $s1
	move $a0, $s0
	
	ori $v0, $zero, 34
	syscall
	
	# a XOR b XOR b
	ori $v0, $zero, 4
	la $a0, output4
	syscall
	
	xor $s0, $s0, $s1
	move $a0, $s0
	
	ori $v0, $zero, 34
	syscall
	
	# End program
	ori $v0, $zero, 10
	syscall