.data
	num: .word 2
	EvenNumber: .asciiz "Number is even"
.text 
	# if (num>0 && num%2==0 %% num<10)
	lw $t0, num
	sgt $t1, $t0, $zero
	li $t5, 10
	slt $t2, $t0, $t5
	rem $t3, $t0, 2
	not $t3, $t3
	and $t1, $t1, $t2
	and $t1, $t1, $t3
	beqz $t1, end_if
	#{
	#print ("Number is even")
		la $a0, EvenNumber
		jal PrintString
	#}
	end_if:
		jal Exit
.include "utils.asm"