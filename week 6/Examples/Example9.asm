# Sentinel Control Loop
.data
	prompt: .asciiz "\nEnter an integer, -1 top stop: "
	error: .asciiz "\nValues for n must be >0 "
	output: .asciiz "\nThe total is: "
.text
	la $a0, prompt
	jal PromptInt
	move $s0, $v0
	start_outer_loop:
		sne $t1, $s0, -1
		beqz $t1, end_outer_loop
		
		# code block
		# If test for valid input
		slti $t1, $s0, -1
		beqz $t1, else
			# if block
			la $a0, error
			jal PrintInt
			b end_if
		else:
			#else block
			#sumation loop
			li $s1, 0
			li $s2, 0 #initialize loop
			start_inner_loop:
			
			sle $t1, $s1, $s0
			beqz $t1, end_inner_loop
		
			add $s2, $s2, $s1
		
			addi $s1, $s1, 1
			b start_inner_loop
			
			end_inner_loop:
			la $a0, output
			move $a1, $s2
			jal PrintInt
		end_if:
			la $a0, prompt
			jal PromptInt
			move $s0, $v0
			b start_outer_loop

	end_outer_loop:
		jal Exit
.include "utils.asm"