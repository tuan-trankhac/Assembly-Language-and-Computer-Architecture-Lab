# File: Program5-4.asm
# Author: Charles Kann
# Purpose: To illustrate implementing and calling a subprogram named PrintNewLine

.text
main:
	# read an input value from the user
	la $a0, prompt
	jal PrintString
	li $v0, 5
	syscall
	move $s0, $v0
	
	# print the value back to the user
	jal PrintNewLine
	la $a0, result
	move $a1, $s0
	jal PrintInt
	
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

# subprogram: PrintInt
# author: Charles W. kann
# Purpose: To print a string to the console
# input: $a0 - the adress of the string to print
# 	 $a1 - the value of the int to print
# returns: none
# side effects: the string is printed followed by the integer value
.text
PrintInt:
	# Print string. The string address is already in $a0
	li $v0, 4
	syscall
	# Print integer. The integer value is in $a1, and mus be first moved to $a0
	move $a0, $a1
	li $v0, 1
	syscall
	#return 
	jr $ra

# purpose: PrintString
# author: Charles W.kann
# purpose: To print a string to the console
# Input: $a0 - The adress of the string to print
# returns: None
# side effects: the string is printed to the console
.text
PrintString:
	addi $v0, $0, 4
	syscall
	jr $ra

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
	