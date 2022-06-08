# program 8.2: Quadratic program
# Date 2/4/2020
# Purpose: register direct access

.text
.globl main 
	
	# Get input value and store it in $v0
main:
	la $a0, prompt
	jal PromptInt
	move $s0, $v0
	
	# load constants a, b and c into registers
	li $t5, 5
	li $t6, 2
	li $t7, 3
	
	# Calculate the result of y = a*x*x + b*x + c
	mul $t0, $s0, $s0
	mul $t0, $t0, $t5
	mul $t1, $s0, $t1
	add $t0, $t0, $t1
	add $s1, $t0, $t7
	
	# store the result from $s1 to y
	sw $s1, y
	
	# Print output from memory y
	la $a0, result
	lw $a1, y
	jal PrintInt
	jal PrintNewLine
	nop
	
	# Exit
	jal Exit
.data
	y: .word 0
	prompt: .asciiz "Enter a value for x: "
	result: .asciiz "The result is: "
	
.include "utils.asm"