# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY
.data
	string: .asciiz "Tong cua (s0) va (s1) la: "
.text 
	# Print String
	la $a0, string
	xori $v0, $0, 4
	syscall
	# Result of sum
	add $a0, $s0, $s1	# t0 = s0+s1
	xori $v0, $0, 1
	syscall