# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY

# Chuong trinh nay khong the nap gia tri 8 vao thanh ghi $t0 vi

.text
	lui $t0, 1001	# nap gia tri dia chi 1001 vao thanh ghi t0 
			# ma khong phai dia chi dau tien cua vung data

	lw $a0, 0($t0)	# sao chep gia tri tu thanh ghi (0+$t0=$t0)
			# vao thanh ghi $a0
	
	li $v0, 1	# in ra so nguyen o thanh ghi $a0
	syscall
	
	li $v0, 10	# exit
	syscall
.data 
	.word 8
