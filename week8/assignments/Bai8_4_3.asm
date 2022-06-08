# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY

# Cach 3: Truy cap thanh ghi gian tiep
.data
	 		.float 0.0
	 		.float 0.0
	mpq:		.float 0.0	# miles/gallons
	prompt_mi: 	.asciiz "Enter the number of miles driven: "
	prompt_ga: 	.asciiz "Enter the number of gallons used: "
	output: 	.asciiz "Your mpg = "
.text

	la $a0, prompt_mi
	jal PromptFloat
	lui $t0, 0x1001
	swc1 $f0, 0($t0)		# miles
	lwc1 $f1, 0($t0)
	
	la $a0, prompt_ga	
	jal PromptFloat
	addi $t0, $t0, 4
	swc1 $f0, 0($t0)		# gallons
	lwc1 $f2, 0($t0)
	
	
	div.s $f3, $f1, $f2
	swc1 $f3, mpq
	
	la $a0, output
	lwc1 $f12, mpq
	jal PrintFloat
	
	jal Exit
.include "utils.asm"
