
.data
A: 	.word 	0,  8,  0,  0
	 	0,  0, -2,  0
	 	0,  0,  4,  0
	 	5,  0,  0,  0

Y: 	.word 	1,  2,  2,  0

sum: 	.word 	0


.text
.globl main

main:
	li $t0, 0 #t0 = i = 0
	li $t1, 4
	la $t2, Y
for:	bge $t0, $t1, fifor
	lw $t3, 0($t2) #t3 = Y[i]
	sll $t3, $t3, 2 #t3 = Y[i]*4
	sll $t4, $t0, 4 #t4 = i*16 (i*NC*tam)
	addu $t4, $t3, $t4 #Y[i]*4 + i*NC*tam
	la $t3, A
	addu $t3, $t3, $t4 #t3 = @A[i][Y[i]]
	lw $t5, 0($t3) #t5 = val = A[i][Y[i]]
	ble $t5, $zero, fif #salto si val <= 0
	la $t6, sum    #t6 = @sum
	lw $t7, 0($t6)  #t7 = sum
	addu $t7, $t7, $t5  #t7 = sum + val
	sw $t7, 0($t6)  #sum = sum + val
	
fif:	addiu $t2, $t2, 4 #stride para acceso secuencial de Y[i]
	addiu $t0, $t0, 1 #++i
	b for
	
fifor: jr $ra
	
	
	
	
	
	
	
	
	
	
	
	
	
	
