# Author: Tran Khac Tuan 
# Student Code : 20200554
# SCHOOL OF INFORMATION AND COMMUNICATION TECHNOLOGY - HANOI UNIVERSITY OF SCIENCE AND TECHNOLOGY


# 1. Van de cua chuong trinh la:
#	 chuong trinh khong the nhay ra khoi chuong trinh
#    	 con de tro ve chuong trinh chinh 
# 2. Co che cho thay chuong trinh roi vao vong lap vo han:
#	khi thuc hien lenh jal PrintNewLine xong luc nay thanh ghi $ra se chua
#	dia chi cua cau lenh ngay sau do la jr $ra
#	khi toi cau lenh jr $ra luc nay thanh ghi $ra dang chua dia chi cua 
#	chinh cau lenh do, nen khi thuc hien cau lenh jr $ra thi thanh ghi $pc 
#	se tiep tuc tro toi cau lenh do
# 3. Giai phap giai quyet van de:
# 	Truoc khi goi toi lenh jal PrintNewLine ta se luu gia tri
#	cua thanh ghi $ra ra 1 thanh ghi khac (vidu: $t0).
#	Sau khi thuc hien xong lenh jal PrintNewLine ta se khoi phuc
#	lai gia tri cho thanh ghi $ra
.text
PrintInt:
	# Print string. The string address is already in $a0
	li $v0, 4
	syscall
	# Print integer. The integer value is in $a1, and mus be first moved to $a0
	move $a0, $a1
	li $v0, 1
	syscall	
	move $t0, $ra
	# Print a new line character
	jal PrintNewLine
	move $ra, $t0
	#return 
	jr $ra
