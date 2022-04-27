# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY

.data
result1: .asciiz "\n first value = "
result2: .asciiz "\n second value = "

.text
main:
	li $v0, 4
	la $a0, result1
	syscall
	
	li $v0,	1
	li $a0, 4
	syscall 

	li $v0, 4
	la $a0, result2
	syscall
	
	li $v0, 1
	li $a0, 8
	syscall
	
	addi $v0, $zero, 10 # Exit program
	syscall
