# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY
.data
	prompt: 	.asciiz "Enter number of the max bound: "
	number_guess: 	.asciiz "Enter your number that you guess: "
	times_guess: 	.asciiz "You got it.\nThe number of times that you have to guess is: "
	Less: 		.asciiz "Your number is too low"
	Greater: 	.asciiz "You got it. Your number is too high"
.text
	la $a0, prompt
	jal PromptInt
	move $a1, $v0
	addi $a0, $0, 1
	li $v0, 42
	syscall
	
	move $t0, $a0
	ori $t1, $0, 1		# t1 = count = 1
Guess:
	la $a0, number_guess
	jal PromptInt
	beq $v0, $t0, end_guess
	slt $t2, $t0, $v0
	beqz $t2, less
	j greater
	Go_on:
		addi $t1, $t1, 1
	j Guess
less:
	la $a0, Less
	jal PrintString
	jal PrintNewLine
	j Go_on
greater:
	la $a0, Greater
	jal PrintString
	jal PrintNewLine
	j Go_on
end_guess:
	la $a0, times_guess
	move $a1, $t1
	jal PrintInt
	jal Exit
.include "utils.asm"