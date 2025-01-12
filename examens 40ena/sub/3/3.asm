.data
vec1: 	.word	1,2,3,4,5,6,7,8,9,0
vec2:	.word	-1,1,-2,2,-3,3,-4,4,-5,5,-6,6,-7

	.text
	.globl main

main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	li $a0, 10
	la $a1, vec1
	jal subr
	
	li $a0, 13
	la $a1, vec2
	jal subr 
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra	

func:
	move $v0, $a0
	jr $ra
	

	
	
	
	
	
	
	
