.data
suma:	.word 0
vector: .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,
	      15,16,17,18,19,20,21,22,23,24,25,
	      26,27,28,29,30,31,32
	     
	     
.text
.globl main
main:	li $t0, 31
	la $t1, vector
	la $t3, suma

for:	blt $t0, $zero, fifor
	lw $t2, 0($t1)
	addiu $t1, $t1, 4
	addiu $t0, $t0, -1
	lw $t4, 0($t3)
	addu $t2, $t2, $t4
	sw $t2, 0($t3)
	b for

fifor:	jr $ra