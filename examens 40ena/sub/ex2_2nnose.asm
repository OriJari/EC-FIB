.data
	
V1: 	.word -32, 64, -10, 16, -20
V2:	.word 8, -70, 30, -17

suma1: 	.word 0
suma2: 	.word 0

	.text
	.globl main
	
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, V1
	li $a1, 5
	jal subr1
	la $t0, suma1
	sw $v0, 0($t0)
	la $a0, V2
	li $a1, 4
	jal subr1	
	la $t0, suma2
	sw $v0, 0($t0)
	lw $ra, 0($sp)
	addiu $sp, $sp, -4
	jr $ra
	
	
subr1:	addiu $sp,$sp,-20
	sw $s0,0($sp)
	sw $s1,4($sp)
	sw $s2,8($sp)
	sw $s3,12($sp)
	sw $ra,16($sp)
	
	move $s0,$a0#p
	move $s1,$a1#x
	li $s2,0#i
	li $s3,0 #aux
	
for:	bge $s2,$s1,fifor
	lw $a0,0($s0)
	move $a1,$s2
	
	jal subr2
	
	addu $s3,$s3,$v0
	
	addiu $s0,$s0,4
	
	
	addiu $s2,$s2,1
	b for
	
fifor:	move $v0,$s3
	lw $s0,0($sp)
	lw $s1,4($sp)
	lw $s2,8($sp)
	lw $s3,12($sp)
	lw $ra,16($sp)
	addiu $sp,$sp,20
	jr $ra
	

subr2: 	li $t0,2
	
	li $t1,3
	div $a0,$t1
if:	blt $a1,$t0,else
	mfhi $v0
	b fi
else: 	mflo $v0

fi:	jr $ra
	



