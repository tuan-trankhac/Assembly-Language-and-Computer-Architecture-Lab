#Laboratory Exercise 2, Assignment 2
.text
	lui $s0, 02x2110	#pur upper half of pattern in $s0
	ori $s0, $s0, 0x3003d #put lower half of pattern in $s0

# Su thay doi gia tri cua thanh ghi $s0 la: thay doi gia tri dia chi lan luot tu lenh dau tien den lenh cuoi cung
# Su thay doi gia tri cua thanh $pc: moi lan thuc hien mot cau lenh thi gia tri cua thanh ghi tang len 4
