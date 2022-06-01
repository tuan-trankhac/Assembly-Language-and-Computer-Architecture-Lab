# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY
.data
	message_int: .asciiz "Length of string is: "
	message_input_string: .asciiz "Please input a string: "
	string: .space 100
.text
	# Input Dialog String
	la $a0, message_input_string
	la $a1, string
	la $a2, 200
	li $v0, 54
	syscall
	# Length of string
	la $a0, string
	jal strlen
	
	# Message dialog int
	move $a1, $v0
	la $a0, message_int
	li $v0, 56
	#move $a1, $t6
	syscall
.include "utils.asm"