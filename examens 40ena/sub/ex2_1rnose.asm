.data
V:	.word	0,3,2,1,4,5,6,7,8,9
k:	.word	0

	.text
	.globl main
	
main:	addiu $sp, $sp, -8
	sw $s0, 0($sp)
	sw $ra, 4($sp)
	
	li $s0, 0   #$s0 = i
for:	li $t0, 8
	bge $s0, $t0, fifor
	#k = k + subr(V,i,i+2)
	la $a0, V  #$a0 = @V
	move $a1, $s0  #$a1 = i
	addiu $a2, $s0, 2
	
	jal subr
	
	la $t0, k  #$t0 = @k
	lw $t1, 0($t0)  #$t1 = k
	addu $t1, $t1, $v0
	
	sw $t1, 0($t0)  #k = k + subr
	
	addiu $s0, $s0, 1
	b for
	
fifor:	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addiu $sp, $sp, 8
	
	jr $ra
	
subr2:	andi $v0, $a0, 0x03
	jr $ra
	
	
subr:	addiu $sp, $sp, -12
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	
	move $s0, $a0   #$s0 = @vector
	move $s1, $a1   #$s1 = x
	
	#@vector + x*4
	sll $t0, $s1, 2  #$t0 = x*4
	addu $t0, $t0, $s0  #$t0 = @vector + x*4 = @vector[x]
	lw $t0, 0($t0)    #$t0 = vector[x]
	
	#@vector + y*4
	sll $t1, $a2, 2  #$t1 = y*4
	addu $t1, $t1, $s0  #$t1 = @vector`+ y*4
	lw $t1, 0($t1)  #$t1 = vector[y]
	
if:	bge $t0, $t1, else
	ble $a2, $s1, else
	
	move $a0, $a2
	jal subr2
	
	move $t2, $v0   #asignar $t2 a aux2, aux2 = subr2(y)
	
	sll $t0, $s1, 2  #$t0 = x*4
	addu $t0, $t0, $s0   #$t0 = @vector + x*4
	lw $t0, 0($t0)    #$t0 = vector[x]
	
	#@vector[aux2] = @vector + aux2*4
	sll $t2, $t2, 2  #$t2 = aux*4
	addu $t2, $t2, $s0  #$t2 = @vector + aux2*4
	sw $t0, 0($t2)  #vector[aux2] = vector[x]
	
	li $v0, 1
	b fi
	
else:	li $v0, 0

fi:	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	addiu $sp, $sp, 12
	jr $ra
	
	


	#li $t0, 4
	#div $a0, $t0
	#mfhi $v0
	

	
	
	
	
	
