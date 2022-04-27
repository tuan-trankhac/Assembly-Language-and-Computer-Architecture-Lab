# Tran Khac Tuan - 20200554
# Bai tap 3-1

# Laboratory exercise 2, Assignment 1
.text
	addi $s0, $zero, 0x2110003d	# $s0 = 0 + 0x3007 = 0x3007; I-type
	add $s0, $zero, $0	# $s0 = 0 + 0 = 0	   ; R-type	
# Do dia chi gan vao thanh ghi $s0 la 0x2110003d lon hon 16 bit nen MIPS da
# dich lenh addi thanh 2 lenh lui va ori
# lui: ghi mot hang so 16-bit vao 2 byte thanh ghi, 2 byte thap se bang 0
# ori: thiet lap 16 bit thap ve 0
# thanh ghi pc: luu dia chi cua cau lenh tiep theo
# thanh ghi $s0: luu dia chi cua thanh ghi