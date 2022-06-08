# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY

# Cach 2: Truy cap thanh ghi truc tiep
.data
	prompt_mi: 	.asciiz "Enter the number of miles driven: "
	prompt_ga: 	.asciiz "Enter the number of gallons used: "
	output: 	.asciiz "Your mpg = "
.text
	la $a0, prompt_mi
	jal PromptFloat
	mov.s $f1, $f0			# miles
	
	la $a0, prompt_ga	
	jal PromptFloat
	mov.s $f2, $f0			# gallons

	
	div.s $f3, $f1, $f2
	mov.s $f12, $f3
	
	la $a0, output
	jal PrintFloat
	
	jal Exit
.include "utils.asm"
