# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY

# Cach 1: Danh dia chi theo nhan
.data
	miles: 		.float 0.0
	gallons: 	.float 0.0
	mpq:		.float 0.0	# miles/gallons
	prompt_mi: 	.asciiz "Enter the number of miles driven: "
	prompt_ga: 	.asciiz "Enter the number of gallons used: "
	output: 	.asciiz "Your mpg = "
.text
	la $a0, prompt_mi
	jal PromptFloat
	swc1 $f0, miles			# miles
	
	la $a0, prompt_ga	
	jal PromptFloat
	swc1 $f0, gallons		# gallons
	
	lwc1 $f1, miles
	lwc1 $f2, gallons
	
	div.s $f3, $f1, $f2
	swc1 $f3, mpq
	
	la $a0, output
	lwc1 $f12, mpq
	jal PrintFloat
	
	jal Exit
.include "utils.asm"
