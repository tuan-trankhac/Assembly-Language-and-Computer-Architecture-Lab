# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY

# Lenh "la label" luon can duoc dich thanh 2 dong ma gia vi day la lenh gia
	# va no duoc tach ra thanh 2 lenh lui $at 0x00001001 va ori $Rd, $at, imm
	# lenh lui la de gan vao dia chi dau tien cua vung data vao thanh ghi at
	# lenh ori se thuc hien phep toan or giua gia tri cua $at voi imm de gian gia tri vao cho thanh ghi Rd
	
# Lenh "lw label" cung la lenh gia nen duoc dich thanh 2 dong ma gia
	# va no duoc dich thanh 2 lenh lui $at 0x00001001 va lw Rs, offset($at)
	# lenh lui se gan dia chi dau tien cua vung data vao thanh ghi at
	# lenh lw Rs, offset($at) la lenh that va se sao chep tu bo nho co dia chi la $at+offset vao thanh ghi Rs
# Diem giong:
	# Deu co lenh lui de gan cho thanh ghi $at dia chi dau tien cua vung data 
	# de lam moc tro toi cac thanh ghi khac.
# Khac nhau:
	# la label: lenh ori dung de gan dia chi cua label vao thanh ghi duoc chi dinh
	# lw label: lenh lw dung de sao chep dia tu bo nho vao thanh ghi duoc chi dinh

# VD:
	
.data 
	a: .word 2
	b: .word 5
	c: .word 10
.text
la $t0, b
lw $t1, c
