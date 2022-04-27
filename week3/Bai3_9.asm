# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY

.data
	get_n: .asciiz "Enter n: "
	get_T: .asciiz "Enter T: "
	get_P: .asciiz "Enter P: "
	result: .asciiz "V = nRT/P = "

.text
main:
	#R = 8314/1000
	 
	#Get n
	li $v0, 4
	la $a0, get_n
	syscall 
	addi $v0, $zero, 5
	syscall
	move $s0, $v0
	
	#Get T
	li $v0, 4
	la $a0, get_T
	syscall 
	addi $v0, $zero, 5
	syscall
	move $s1, $v0
	
	#Get P
	li $v0, 4
	la $a0, get_P
	syscall 
	addi $v0, $zero, 5
	syscall
	move $s2, $v0
	
	#Calculate
	mul $t0, $s0, $s1
	mul $t0, $t0, 8314
	div $t0, $t0, 1000
	div $t0, $t0, $s2
	move $s3, $t0
	
	# Print output
	addi $v0, $zero, 4	# Print result string
	la $a0, result
	syscall
	addi $v0, $zero, 1
	move $a0, $s3
	syscall
	
	addi $v0, $zero, 10 # Exit program
	syscall
