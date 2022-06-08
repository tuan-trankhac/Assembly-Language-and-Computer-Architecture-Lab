# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY

# Cach 5: Truy cap thanh ghi qua con tro
.data
	 		.word twofloat
	mpq:		.float 0.0	# miles/gallons
	prompt_mi: 	.asciiz "Enter the number of miles driven: "
	prompt_ga: 	.asciiz "Enter the number of gallons used: "
	output: 	.asciiz "Your mpg = "
	twofloat:
		.float 0.0
		.float 0.0
.text
.globl main
main:
	la $a0, prompt_mi
	jal PromptFloat
	lui $t0, 0x1001
	lw $t0, 0($t0)
	swc1 $f0, 0($t0)		# miles
	lwc1 $f1, 0($t0)
	
	la $a0, prompt_ga	
	jal PromptFloat
	swc1 $f0, 4($t0)		# gallons
	lwc1 $f2, 4($t0)
	
	
	div.s $f3, $f1, $f2
	swc1 $f3, mpq
	
	la $a0, output
	lwc1 $f12, mpq
	jal PrintFloat
	jal Exit
.include "utils.asm"
