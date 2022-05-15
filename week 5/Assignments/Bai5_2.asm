# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY

# Van de cua chuong trinh la:
#	 Khong the thuc hien duoc khoi lenh trong nhan PrintTab.
# Giai thich:
# 	 Vi chuong trinh con nay khong duoc bat dau bang chi thi .text
#	 dan den viec trinh bien dich nghi rang dang bien dich doan .data
# Giai quyet: them chi thi .text vao truoc chuong trinh con
# 	Newline - Print a new line character (\n) to the console
.text
PrintNewLine:
	li $v0, 4
	la $a0, _PNL_newline
	syscall
	jr $ra
.data
	_PNL_newline: .asciiz "\n"

# Print tab
.text
	PrintTab:
	li $v0, 4
	la $a0, tab
	syscall
	jr $ra
.data
	tab: .asciiz "\t"
