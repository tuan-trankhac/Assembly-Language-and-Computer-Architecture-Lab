# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY
.data 
	output1: .asciiz "\nEnter integer number: "
	output2: .asciiz "\nResult: "

.text
.globl main
main:
	#Print output1
	ori $v0, $zero, 4
	la $a0, output1
	syscall
	# Read Integer from stdin
	ori $v0, $zero, 5
	syscall
	move $s0, $v0
	# Calculate
		# Abs($s0)
	abs $s0, $s0
		# bit reverse
	xori $t0, $s0, 0xffffffff
		# add to 1
	addi $t0, $t0, 1
	# Print result
		# Print output2
	ori $v0, $zero, 4
	la $a0, output2
	syscall
		# Print result
	ori $v0, $zero, 35
	move $a0, $t0
	syscall
	
