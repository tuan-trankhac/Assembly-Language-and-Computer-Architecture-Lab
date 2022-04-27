# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY
.data
	output1: .asciiz "s1 <= s2"
	output2: .asciiz "s1 > s2"
.text
	ori $s1, $zero, -4	# $s1 = -4
	ori $s2, $zero, 0	# $s2 = -5
	# abs $s0, s1 
	# s0 <= |$s1|
	abs $s0, $s1
	
	# move #s0, s1
	# s0 <= $s1
	move $s0, $s1
	
	# not $s0
	# s0 <= it invert (s0)
	not $s0, $s0
	
	# ble $s1, $s2, L
	# if (s1 <= $s2)
	#	j L
	ble $s1, $s2, Printsmth
	
	li $v0, 4
	la $a0, output2
	syscall
	
	# end program
	li $v0, 10
	syscall
	# Jump to this case if s1<= s2
	Printsmth:
		li $v0, 4
		la $a0, output1
		syscall
		
