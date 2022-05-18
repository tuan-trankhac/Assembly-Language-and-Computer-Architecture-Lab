.data
	test: .word 4
	error: .asciiz "This option doesn't exist"
	result: .asciiz "Ending program"
.text
	xori $s2, $0, 4	# s2 = 4
	xori $s3, $0, 5	# s3 = 5
	la $s0, test	# load the address of test variable
	lw $s1, 0($s0)	# load the value of test to register $t1
	li $t0, 0	# load value for test case
	li $t1, 1	
	li $t2, 2
	beq $s1, $t0, case_0
	beq $s1, $t1, case_1
	beq $s1, $t2, case_2
	j default
case_0:
	addi $s2, $s2, 1	# a = a+1
	j continue
case_1:
	sub $s2, $s2, $t1	# a = a-1
	j continue
case_2:
	add $s3, $s3, $s3	# b = 2*b
	j continue
default:
	la $a0, error
	jal PrintString
	jal PrintNewLine
continue:
	la $a0, result
	jal PrintString
	jal Exit
	
.include "utils.asm"