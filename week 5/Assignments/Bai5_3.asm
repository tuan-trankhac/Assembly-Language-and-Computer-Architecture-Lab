# $a0 NOR $a1
	# Input: $a0, $a1
	# return: $v0 result of norring
.text
NOR:
	# $a0 or $a1
	or $t0, $a0, $a1
	# not($a0 or $a1)== $a0 NOR $a1
	not $v0, $t0
	jr $ra
	
# $a0 NAND $a1
	# Input: $a0, $a1
	# retrun: $v0 result of nanding
.text
NAND: 
	and $t0, $a0, $a1
	not $v0, $t0
	jr $ra

# NOT ($a0)
	# Input: $a0
	# return: $v0 result of bit inversion
.text
NOT:
	not $v0, $a0
	jr $ra

# Mult4 ($a0 x 4)
	# Input: $a0: tham so dau vao
	# return: $v0: result of multing with 4
.text
Mult4:
	move $s0, $a0		# $s0: Multicand
	addi $s1, $0, 4	# $s1: Multilier
	# For and brench
	addi $s7, $0, 33 # n = 33
	addi $s6, $0, 0    # $s6: product
	addi $s5, $0, 1    # i = 1
	FOR:
		slt $t0, $s5, $s7  # $t0 = i < n?
		beq $t0, $0, RESULT   # if !(i < n) goto RESULT
		andi $s4, $s1, 0x1
		addi $s3, $zero, 0x1
		beq $s4, $s3, PLUS
		
		CONTINUE:
		sll $s0, $s0, 1
		srl $s1, $s1, 1
		addi $s5, $s5, 1   # i = i + 1
		j FOR
	# Multicand + product:
	PLUS:
		add $s6, $s6, $s0
		j CONTINUE
	RESULT:
		move $v0, $s6
	jr $ra

# Mult10
	# Input: $a0: tham so dau vao
	# retrun: $v0: result of multing with 10
.text
Mult10:
	move $s0, $a0		# $s0: Multicand
	addi $s1, $0, 10	# $s1: Multilier
	# For and brench
	addi $s7, $0, 33 # n = 33
	addi $s6, $0, 0    # $s6: product
	addi $s5, $0, 1    # i = 1
	For:
		slt $t0, $s5, $s7  # $t0 = i < n?
		beq $t0, $0, Result   # if !(i < n) goto RESULT
		andi $s4, $s1, 0x1
		addi $s3, $zero, 0x1
		beq $s4, $s3, Plus
		
		Continue:
		sll $s0, $s0, 1
		srl $s1, $s1, 1
		addi $s5, $s5, 1   # i = i + 1
		j For
	# Multicand + product:
	Plus:
		add $s6, $s6, $s0
		j Continue
	Result:
		move $v0, $s6
	jr $ra
# Swap($a0, $a1) -> $a0 = $a1, $a1 = $a0
	# Input: $a0, $a1
	# Return: None
.text
Swap:
	xor $t0, $a0, $a1
	xor $a0, $t0, $a0
	xor $a1, $t0, $a1
	jr $ra

# UpperCase
.text
Uppercase:
    li $v0, 8	# read string
    li $a1, 4  	# max space
   # la $a0, input	# address of input
    syscall
    jal PrintNewLine
    li $v0, 4	# v0 = 4
    li $t0, 0	# t0 = 0

loop:
    lb $t1, upper($t0)
    beq $t1, 0, exit
    blt $t1, 'a', case 
    bgt $t1, 'z', case
    subi $t1, $t1, 32
    sb $t1, upper($t0)

case: 
    addi $t0, $t0, 1
    j loop

exit:
    li $v0, 4
    la $a0, upper
    syscall
    li $v0, 10
    syscall
    
    jr $ra
# LowerCase
.text
Lowercase:
    li $v0, 8	# read string
    li $a1, 4  	# max space
    syscall
    jal PrintNewLine
    li $v0, 4	# v0 = 4
    li $t0, 0	# t0 = 0

LOOP:
    lb $t1, lower($t0)
    beq $t1, 0, EXIT
    blt $t1, 'A', CASE
    bgt $t1, 'Z', CASE
    addi $t1, $t1, 32
    sb $t1, lower($t0)

CASE: 
    addi $t0, $t0, 1
    j LOOP

EXIT:
    li $v0, 4
    la $a0, lower
    syscall
    li $v0, 10
    syscall
    
    jr $ra
# Right Circular Shift
	# Input: $a0
	# Return: $v0, $v1
.text
RightCS:
	andi $t7, $a0, 0x1
	ror $v0, $a0, 1
	bne $t7, $0, addmore
	or $v1, $0, $0
	jr $ra
addmore:   ori $v1, $0, 1
	jr $ra
# Left Circular Shift
	# Input: $a0
	# Return: $v0, $v1
.text
LeftCS:
	rol $v0, $a0, 1
	andi $t7, $v0, 0x1
	bne $t7, $0, done
	or $v1, $0, $0
	jr $ra
done:   ori $v1, $0, 1
	jr $ra
.include "utils.asm"
