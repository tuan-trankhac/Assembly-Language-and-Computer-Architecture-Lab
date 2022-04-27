# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY
.data
	result: .asciiz "15 * 3 is "
.text
.globl main
main:
	ori $t0, $zero, 15	
		# Lenh dinh dang I
		# Opcode: 13 -> 001101
		# Rt: Thanh ghi $t0 la $8 hay 01000
		# Rs: Thanh ghi $zero hay 00000
		# Gia tri tuc thi la 15 hay 0x000F
		# Ma may: 00110100000010000000000000001111 hay 0x3408000f
	ori $t1, $zero, 3
		# Lenh dinh dang I
		# Opcode: 13 -> 001101
		# Rs: Thanh ghi $zero hay 00000
		# Rt: Thanh ghi $t1 la $9 hay 01001
		# Gia tri tuc thi la 3 hay 0x0003
		# Ma may: 00110100000010010000000000000011 hay 0x34090003
	add $t1, $zero, $t1
		# Lenh dinh dang R
		# Opcode/ function: 0/20 -> 000000/ 100000
		# Rd: Thanh ghi $t1 la $9 hay 01001
		# Rs: Thanh ghi $zero la $0 hay 00000
		# Rt: Thanh ghi $t1 la $9 hay 01001
		# sa (shamt) la 00000
		# Ma may: 00000000000010010100100000100000 hay 0x00094820
	sub $t2, $t0, $t1
		# Lenh dinh dang R
		# Opcode/ function: 0/22 -> 000000/ 100010
		# Rd: Thanh ghi $t2 la $10 hay 01010
		# Rs: Thanh ghi $t0 la $8 hay 01000
		# Rt: Thanh ghi $t1 la $9 hay 01001
		# sa (shamt) la 00000
		# Ma may: 00000001000010010101000000100010 hay 0x01095022
	sra $t2, $t2, 2
		# Lenh dinh dang R
		# Opcode/ function : 0/3 -> 000000/ 000011
		# Rs: 00000
		# Rd: Thanh ghi $t2 ($10) -> 01010
		# Rt: Thanh ghi $t2 ($10) -> 01010
		# sa (shamt) la 2 -> 00010
		# Ma may: 000000/00000/01010/01010/00010/000011 hay 0x000a5083
	mult $t0, $t1
		# Dinh dang R
		# Opcode/function: 0/18 -> 000000/011000
		# Rd: khong co
		# Rs: Thanh ghi $t0 la $8 hay 01000
		# Rt: Thanh ghi $t1 la $9 hay 01001
		# sa (shamt) la 00000
		# Ma may: 000000/01000/01001/00000/00000/011000 hay 0x01090018
	mflo $a0
		# Dinh dang R
		# Opcode/ function: 0/12 -> 000000/010010
		# Rd: $a0 (4) -> 00100
		# Rs: 00000
		# Rt: 00000
		# sa: 00000
		# Ma may: 00000000000000000010000000010010 hay 0x00002012
	ori $v0, $zero, 1
		# Lenh dinh dang I
		# Opcode: 13 -> 001101
		# Rt: Thanh ghi $v0 la $2 hay 00010
		# Rs: Thanh ghi $zero hay 00000
		# Gia tri tuc thi la 1 hay 0x0001 (1)
		# Ma may: 00110100000000100000000000000001 hay 0x34020001
	syscall
	addi $v0, $zero, 10
		# Lenh dinh dang I
		# Opcode: 8 -> 001000
		# Rt: Thanh ghi $v0 la $2 hay 00010
		# Rs: Thanh ghi $zero hay 00000
		# Gia tri tuc thi la 10 hay 0x000A(1010)
		# Ma may: 00100000000000100000000000001010 hay 0x2002000a
	syscall
	