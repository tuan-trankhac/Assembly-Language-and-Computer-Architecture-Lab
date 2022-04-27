.text
	li $a1, 100
	li $v0, 42
	syscall
	
	add $a0,$a0, 1
	li $v0,1
	syscall
	
	li $v0, 10
	syscall