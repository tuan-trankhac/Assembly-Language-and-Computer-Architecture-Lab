# File: Program5-2.asm
# Author: Charles Kann
# Purpose: To illustrate implementing and calling a subprogram named exit

.text
main:
	# read an input value from the user
	li $v0, 4
	la $a0, prompt
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
	
	# print the value back to the user
	jal PrintNewLine
	li $v0, 4
	la $a0, result
	syscall
	li $v0, 1
	move $a0, $s0
	syscall
	
	#call the exit subprogram to exit
	jal Exit
.data
	prompt: .asciiz "Please enter an integer: "
	result: .asciiz "\nYou entered: "
# subprogram: PrintNewLine
# author: charles kann
# purpose: to outpput a new line to the user console
# input: None
# output: None
# side effects: A new line character is printed to the user's console
.text
PrintNewLine:
	li $v0, 4
	la $a0, _PNL_newline
	syscall
	jr $ra
.data
	_PNL_newline: .asciiz "\n"

# subprogram: Exit
# author: Charles Kann
# Purpose: to use syscall service 10 to exit a program
# input: None
# output: None
# side effects: the program is exited
.text
Exit:
	li $v0, 10
	syscall
	