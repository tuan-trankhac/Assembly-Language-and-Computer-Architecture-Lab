.data
	num: .word 5
	PositiveNumber: .asciiz "Number is positive"
.text 
	# if (num>0)
	lw $t0, num
	sgt $t1, $t0, $zero 	# $t1 is the boolean (num>0)
	beqz $t1, end_if	# note: the code block is entered if logical is true, skipped if false
	
	#{
	#print ("Number is positive")
		la $a0, PositiveNumber
		jal PrintString
	#}
	end_if:
		jal Exit
.include "utils.asm"