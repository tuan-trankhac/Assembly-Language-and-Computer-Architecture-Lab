.data
	n: .word 5
.text
	li $s0, 0
	lw $s1, n
	start_loop:
		sle $t1, $s0, $s1
		beqz $t1, end_loop
		#code block
		addi $s0, $s0, 1
		b start_loop
	end_loop:
		jal Exit
.include "utils.asm"