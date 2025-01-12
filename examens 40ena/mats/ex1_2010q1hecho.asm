.data
M:	.word	2,0,0,0,0,-2,
		0,-3,0,0,3,0,
		0,0,1,-1,0,0,
		0,0,-5,5,0,0,
		0,2,0,0,-2,0,
		-3,0,0,0,0,3
sum1:	.word	0
sum2:	.word	0

	.text
	.globl main
	
main:	li $t0, 0   #$t0 = i
	li $t1, 6
	la $t2, M   #$t2 = @M
	addiu $t3, $t2, 20   #$t3 = @M[0][5]
	la $t5, sum1
	la $t6, sum2
	
for:	bge $t0, $t1, fifor
	#sum1 += M[i][i] -> sum1 = sum1 + M[][] stridde 28
	#sum2 += M[i][i] -> sum2 = sum2 + M[][] stride 20
	lw $t4, 0($t2)  #$t4 = M[0][0]
	lw $t7, 0($t2)  #sum1
	addu $t7, $t4, $t7  #$t7 = sum1 + M[i][i]
	sw $t7, 0($t5)
	
	lw $t7, 0($t3)  #$t7 = M[i][5-i]
	lw $t4, 0($t6)  #$t4 = sum2
	addu $t7, $t4, $t7  #sum2 M[][]
	sw $t7, 0($t6)  #sum2 = suma
	
	addiu $t2, $t2, 28
	addiu $t3, $t3, 20
	
	addiu $t0, $t0, 1
	b for

fifor:	jr $ra
	
