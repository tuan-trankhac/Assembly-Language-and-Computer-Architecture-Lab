.data 
input: .space 81
inputsize: .word 80
prompt: .asciiz "Enter name of the cake that you like: "
mess1: .asciiz "So you like "
mess2: .asciiz " pie"

.text
main:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0,8
	la $a0, input
	lw $a1, inputsize
	syscall
	
	li $v0,4
	la $a0, mess1
	syscall
	
	li $v0,4
	la $a0, input
	syscall
	
	li $v0,4
	la $a0, mess2
	syscall
	
	li $v0, 10
	syscall
	
#Giai thich: Do $a0 = address of null-terminated string to print ( in chuoi co ki tu ket thuc sau )