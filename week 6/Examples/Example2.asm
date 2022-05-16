.data
	num: .word 2
	EvenNumber: .asciiz "Number is even"
.text 
	# if (num>0 && num%2==0)
	lw $t0, num
	sgt $t1, $t0, $zero
	rem $t2, $t0, 2
	not $t2, $t2
	and $t1, $t1, $t2
	beqz $t1, end_if
	#{
	#print ("Number is even")
		la $a0, EvenNumber
		jal PrintString
	#}
	end_if:
		jal Exit
.include "utils.asm"