# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY
.data
upper: .space 20
lower: .space 20
result: .asciiz "result: "
true: .asciiz "true"
.text
	# Check NOR
	ori $a0, $0, 2
	ori $a1, $0, 10
	jal NOR
	nor $t0, $a0, $a1
	bne $t0, $v0, End
	la $a0, true
	jal PrintString
	# Newline
	jal PrintNewLine
	# Check Nand
	ori $a0, $0, 2
	ori $a1, $0, 10
	jal NAND
	and $t0, $a0, $a1
	not $t0, $t0
	bne $t0, $v0, End
	la $a0, true
	jal PrintString
	# Newline
	jal PrintNewLine
	# Check Not
	ori $a0, $0, 2
	not $t0, $a0
	jal NOT
	bne $t0, $v0, End
	la $a0, true
	jal PrintString
	# Newline
	jal PrintNewLine
	# Check mult4
	ori $a0, $0, 2
	jal Mult4
	ori $a1, $0, 4
	mul $t0, $a0, $a1
	bne $t0, $v0, End
	la $a0, true
	jal PrintString
	# Newline
	jal PrintNewLine
	# Check mult10
	ori $a0, $0, 2
	jal Mult10
	ori $a1, $0, 10
	mul $t0, $a0, $a1
	bne $t0, $v0, End
	la $a0, true
	jal PrintString
	# Newline
	jal PrintNewLine
	# Check Swap
	ori $a0, $0, 2
	ori $a1, $0, 10
	move $t6, $a0
	move $t7, $a1
	jal Swap
	bne $t6, $a1, End
	ori $t3, $0, 1
	bne $t7, $a0, End
	addi $t3, $t3, 1
	ori $t4, $0, 2
	bne $t3, $t4, End 
	la $a0, true
	jal PrintString
	# Newline
	jal PrintNewLine
	# Check Right Circular Shift
	ori $a0, $0, 17
	jal RightCS
	move $a0, $v0
	li $v0, 35
	syscall
	jal PrintNewLine
	move $a0, $v1
	li $v0, 1
	syscall
	# Newline
	jal PrintNewLine
	# Check Left Circular Shift
	ori $a0, $0, 2155905154
	jal LeftCS
	move $a0, $v0
	li $v0, 35
	syscall
	jal PrintNewLine
	move $a0, $v1
	li $v0, 1
	syscall
	# Newline
	jal PrintNewLine
	# Check Uppercase
	la $a0, upper
	jal Uppercase
	# Newline
	jal PrintNewLine
	# Check Lowercase
	la $a0, lower
	jal Lowercase
End:
	ori $v0, $0, 10
	syscall
.include "Bai5_3.asm", "utils.asm"
