# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY
.data
	test: .asciiz "Hello World"
.text 
	li $v0, 4
	la $a0, test
	syscall
# Chuoi duoc luu tru vao trong bo nho theo cach: moi vung dia chi se luu
# 4 ky tu (tuong ung 4 byte) theo thu tu nguoc lai
