.data

files:		.word 1,2,3,4
columnes:	.word 1,3,1,4
M:		.word 0,0,0,0,0, 0,1,0,0,0 0,0,0,2,0 0,4,0,0,0 0,0,0,0,5
suma:		.word 1

	.text
	.globl main
	
	#@M + i*NC*tam + j*tam = @M + files[k]*5*4 + columnes[k]*4 = @M + files*20(files*16+ files*4) + columnes*4
	
main:	li $t0, 0  #$t0 = k
	li $t1, 4
	la $t2, files  #stride 4
	la $t3, columnes  #stride 4
	la $t7, M
	
for:	bge $t0, $t1, fifor
	lw $t4, 0($t2)  #$t4 = files[k]
	lw $t5, 0($t3)  #$t5 = columnes[k]
	
	addiu $t2, $t2, 4 #stride files
	addiu $t3, $t3, 4 #stride columnes
	
	sll $t5, $t5, 2  #$t5 = columnes[k]*4
	li $t6, 20
	mult $t4, $t6
	mflo $t6  #$t6 = files[k]*20
	
	addu $t6, $t6, $t5  #$t6 = columnes*4 + files*20
	addu $t6, $t6, $t7  #$t6 = columnes*4 + files*20 + @M
	
	lw $t6, 0($t6)   #$t6 = M[files[k]][columnes[k]]

	la $t5, suma
	lw $t4, 0($t5)  #$t4 = suma
	
	addu $t4, $t6, $t4  #$t4 = suma + M[][]
	
	sw $t4, 0($t5)
	
	addiu $t0, $t0, 1
	b for	

fifor:	jr $ra
	
