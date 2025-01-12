# Plantilla creada per PETRU RARES SINCRAIAN
	.data
V:	.word 12, -3, 24, 41, -7, 5, 9, 1
M:	.space 256
resultat: .space 4

	.text
	.globl main
main:	
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	
	la 	$a0, V
	la 	$a1, M
	li 	$a2, 8
	jal	func
	la 	$t0, resultat
	sw 	$v0, 0($t0)
	
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr $ra

nofares:
	li	$t0, 0x12345678
	move	$t1, $t0
	move	$t2, $t0
	move	$t3, $t0
	move	$t4, $t0
	move 	$t5, $t0
	move	$t6, $t0
	move 	$t7, $t0
	move 	$t8, $t0
	move 	$t9, $t0
	move	$a0, $t0
	move	$a1, $t0
	move	$a2, $t0
	move	$a3, $t0
	jr	$ra
	
func:
	addiu $sp, $sp, -20
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $ra, 16($sp)
	
	move $s0, $a0
	li $s2, 0
	li $t0, 7
	sll $t0, $t0, 2
	addu $s3, $a1, $t0
	
	move $s1, $a2
for:	bge $s2, $s1, fifor
	sll $t0, $s2, 2
	addu $t0, $s0, $t0
	lw $t1, 0($t0)
	ble $t1, $zero, fif
	move $a1, $t0
	move $a0, $s3
	jal posar
	
fif:	addiu $s3, $s3, 32
	addiu $s2, $s2, 1
	b for
	
fifor:	addiu $t0, $s3, -32
	lw $v0, 0($t0)
	
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $s3, 12($sp)
	lw $ra, 16($sp)
	
	addiu $sp, $sp, 20
	

posar:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	lw $t0, 0($a1)
	sw $t0, 0($a0)
	
	jal nofares
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
