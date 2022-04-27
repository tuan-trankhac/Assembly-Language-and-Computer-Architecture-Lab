# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY
.text
	li $s0, 0x563		# Nap dia chi 0x563 vao thanh ghi $s0
	andi $t0, $s0, 0xff	# Lay 8 bit dia chi cuoi cua dia chi tren thanh ghi $s0
	andi $t1, $s0, 0x0400	# Lay 1 bit dia chi thu 2 tu dau cua dia chi tren thanh ghi $s0