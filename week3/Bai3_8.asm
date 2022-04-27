# Tran Khac Tuan - 20200554

.data
	variable_x: .asciiz "Enter x: "
	variable_y: .asciiz "Enter y: "
	variable_z: .asciiz "Enter z: "
	result1: .asciiz "\n 5x+y+z = "
	result2: .asciiz "\n((5x+3y+z)/2)*3 = "
	result3: .asciiz "\n 4x/3*y = "

.text
main:
	#Get x
	li $v0, 4
	la $a0, variable_x
	syscall 
	addi $v0, $zero, 5
	syscall
	move $s0, $v0
	
	#Get y
	li $v0, 4
	la $a0, variable_y
	syscall 
	addi $v0, $zero, 5
	syscall
	move $s1, $v0
	
	#Get z
	li $v0, 4
	la $a0, variable_z
	syscall 
	addi $v0, $zero, 5
	syscall
	move $s2, $v0
	
	# 5x+y+z
	mul $t0, $s0, 5
	add $t0, $t0, $s1
	add $t0, $t0, $s2
	move $s3, $t0
	
	# Print output
	addi $v0, $zero, 4	# Print result string
	la $a0, result1
	syscall
	addi $v0, $zero, 1
	move $a0, $s3
	syscall
	
	# ((5x+3y+z)/2)*3
	mul $t0, $s0, 5
	mul $t1, $s1, 3
	add $t0, $t0, $t1
	add $t0, $t0, $s2
	mul $t0, $t0, 3
	div $t0, $t0, 2
	move $s3, $t0
	# Print output
	addi $v0, $zero, 4	# Print result string
	la $a0, result2
	syscall
	addi $v0, $zero, 1
	move $a0, $s3
	syscall
	
	# 4x/3*y
	mul $t0, $s0, 4
	mul $t0, $t0, $s2
	div $t0, $t0, 3
	move $s3, $t0
	# Print output
	addi $v0, $zero, 4	# Print result string
	la $a0, result3
	syscall
	addi $v0, $zero, 1
	move $a0, $s3
	syscall
	
	addi $v0, $zero, 10 # Exit program
	syscall