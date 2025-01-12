###########################################################
## NOM I COGNOMS:
###########################################################

.data
V1:	.word 2,-3,6,2,-8,5,6,2
V2:	.word 0,0,0,0,0,0,0,0
V3:	.word 0,0,0,0,0,0,0,0
res1:	.word 0
res2:	.word 0

.globl	main
.text 



############################################################
## ESCRIU AQUI EL CODI DE LA SUBRUTINA buscar
############################################################
buscar:	addiu $sp, $sp, -24
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	sw $s3, 16($sp)
	sw $ra, 20($sp)
	
	move $s0, $a0   #$s0 = A
	move $s1, $a1   #$s1 = B
	move $s2, $a2   #$s2 = c
	li $s3, 0       #$s3 = i
	
for:	li $t0, 8
	bge $s3, $t0, fifor
	lw $t0, 0($s0)    #$t0 = *A
	bne $t0, $s2, fif
	
	move $a0, $s1   #B como primer parametro
	move $a1, $sp   #@cont como segundo parametro
	jal comptar
	
fif:	addiu $s0, $s0, 4  #A++
	addiu $s1, $s1, 4   #B++
	addiu $s3, $s3, 1  #++i
	b for
	
fifor:	lw $v0, 0($sp)

	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	lw $s3, 16($sp)
	lw $ra, 20($sp)
	addiu $sp, $sp, 24
	
	jr $ra


############################################################
## NO MODIFIQUIS EL CODI QUE HI HA A PARTIR D'AQUÃ?
############################################################
comptar:
lw $t0,0($a1)
addiu $t0,$t0,1
sw $t0,0($a1)
li $t1,-1
sw $t1,0($a0)
li $t0, 0x12345678
move $t1, $t0
move $t2, $t0
move $t3, $t0
move $t4, $t0
move $t5, $t0
move $t6, $t0
move $t7, $t0
move $t8, $t0
move $t9, $t0
move $a0, $t0
move $a1, $t0
move $a2, $t0
move $a3, $t0
jr $ra


main:
addiu $sp,$sp,-4
sw $ra,0($sp)

la $a0,V1
la $a1,V2
la $a2,2
jal buscar
la $t0,res1
sw $v0,0($t0)
la $a0,V1
la $a1,V3
la $a2,6
jal buscar
la $t0,res2
sw $v0,0($t0)

lw $ra,0($sp)
addiu $sp,$sp,4
jr $ra

  
    
	








