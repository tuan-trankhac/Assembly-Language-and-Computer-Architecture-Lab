# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY
.data
	output1: .asciiz "\nNhap 1 so nguyen: "
	output2: .asciiz "\nKet qua cua dich bit trai: "
	output3: .asciiz "\nKet qua cua dich bit phai: "
	output4: .asciiz "\nKet qua cua dich bit so hoc: "
	output5: .asciiz "\nKet qua cua dich bit vong: "
	
.text
.globl main
main:
	# Doc dau vao
	ori $v0, $zero, 4
	la $a0, output1
	syscall
	
	ori $v0, $zero, 5
	syscall
	move $s0, $v0
	
	# Dich 4 bit
	
	# Dich trai
	ori $v0, $zero, 4
	la $a0, output2
	syscall
	
	sll $s1, $s0, 4
	move $a0, $s1
	
	ori $v0, $zero, 35
	syscall
	
	# Dich phai
	ori $v0, $zero, 4
	la $a0, output3
	syscall
	
	srl $s1, $s0, 4
	move $a0, $s1
	
	ori $v0, $zero, 35
	syscall
	
	# Dich so hoc phai
	ori $v0, $zero, 4
	la $a0, output4
	syscall
	
	sra $s1, $s0, 4
	move $a0, $s1
	
	ori $v0, $zero, 35
	syscall
	
	#Dich vong phai
	ori $v0, $zero, 4
	la $a0, output5
	syscall
	
	ror $s1, $s0, 4
	move $a0, $s1
	
	ori $v0, $zero, 35
	syscall
	
	#end program
	ori $v0, $zero, 10
	syscall