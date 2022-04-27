.data
	prompt: .asciiz "\nSleeping....."
	prompt1: .asciiz "\n Exiting..."
.text
	li $v0,4
	la $a0, prompt
	syscall
	
	li $v0,32
	li $a0,4000
	syscall
	
	li $v0, 4
	la $a0,prompt1
	syscall
	
	li $v0,10
	syscall