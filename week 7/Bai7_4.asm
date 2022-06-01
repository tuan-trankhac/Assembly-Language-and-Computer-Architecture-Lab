# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY
.data
	y: .space 100
	string: .space 100
	prompt1: .asciiz "Da duyet het chuoi"
	prompt2: .asciiz "Do dai cua chuoi la: "
.text
get_string:
	la $a0, string
	xori $a1, $0, 100
	li $v0, 8
	syscall
	move $t7, $a0
	move $a1, $a0
	la $a0, y
	jal strcpy
get_length:
	move $a0, $t7
	xor $v0, $0, $0
	xor $t0, $0, $0
check_char:
	add $t1, $a0, $t0
	lb $t2, 0($t1)
	beq $t2, $0, end_of_str
	addi $v0, $v0, 1
	addi $t0, $t0, 1
	j check_char
end_of_str:
	move $t7, $v0
	la $a0, prompt1
	li $v0, 4
	syscall
	jal PrintNewLine
end_of_get_length:
	la $a0, prompt2
	li $v0, 4
	syscall
print_length:
	move $a0, $t7
	li $v0, 1
	syscall
.include "utils.asm"