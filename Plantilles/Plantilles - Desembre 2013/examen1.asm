# Plantilla creada per PETRU RARES SINCRAIAN
	.data
matrix:	.word 2, 0, 4, 8
	.word 1, 9, 3, 6
	.word 7, 5, 2, 4
	.word 0, 1, 5, 3
max:	.space 16
	
	.text
	.globl main
main:
	li $t0, 0 #i
	li $t1, 4
	la $t2, matrix #t2 = M
	la $t3, max
for: 	bge $t0, $t1, fifor
	lw $t4, 0($t2) #M[i][0]
	sw $t4, 0($t3)
	
	li $t5, 1
for2: 	bge $t5, $t1, fifor2
	sll $t6, $t0, 4
	sll $t7, $t5, 2
	addu $t7, $t7, $t6
	la $t8, matrix
	addu $t7, $t8, $t7  #@M[i][j]
	lw $t7, 0($t7)
	lw $t8, 0($t3)
	bge $t8, $t7, fif
	sw $t7, 0($t3)
fif:	addiu $t5, $t5, 1
	b for2
fifor2: addiu $t2, $t2, 16
	addiu $t3, $t3, 4
	addiu $t0, $t0, 1
	b for
	
fifor: 	jr $ra
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	