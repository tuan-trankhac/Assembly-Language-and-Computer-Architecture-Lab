.data
	prompt: .asciiz "Enter the value to calculate the sum up to: "
	output: .asciiz "The final result is: "
.text 
	la $a0, prompt
	jal PromptInt
	move $s1, $v0
	li $s0, 0
	# Initialize the total
	li $s2, 0
	
	start_loop:
		sle $t1, $s0, $s1
		beqz $t1, end_loop
	# code block
		add $s2, $s2, $s0
		addi $s0, $s0, 1
		b start_loop
	end_loop:
		la $a0, output
		move $a1, $s2
		jal PrintInt
		
		jal Exit
.include "utils.asm"