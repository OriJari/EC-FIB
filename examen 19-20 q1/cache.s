
.data

M:     	
	.word	11,12,13,14,15,16,17,18
	.word	21,22,23,24,25,26,27,28
	.word	31,32,33,34,35,36,37,38
	.word	41,42,43,44,45,46,47,48
	.word	51,52,53,54,55,56,57,58
	.word	61,62,63,64,65,66,67,68
V:
	.word	0, 0, 0, 0, 0, 0, 0, 0

.text
.globl main

main:

	la	$t8, M
	la	$t9, V
	li	$t0, 0
buc_i:
	slti	$t2, $t0, 6
	beq	$t2, $zero, fi_i
	li	$t1, 0
buc_j:
	slti	$t2, $t1, 4
	beq	$t2, $zero, fi_j
	sll	$t3, $t0, 3
	addu	$t3, $t3, $t1
	sll	$t3, $t3, 2
	addu	$t3, $t3, $t8
	lw	$t6, 0($t3)
	sll	$t4, $t1, 3
	subu	$t4, $t3, $t4
	lw	$t5, 28($t4)
	sw	$t5, 0($t3)
	sw	$t6, 28($t4)
	
	sll	$t7, $t1, 2
	addu	$t3, $t9, $t7
	lw	$t2, 0($t3)
	addu	$t2, $t2, $t5
	sw	$t2, 0($t3)
	subu	$t3, $t9, $t7
	lw	$t2, 28($t3)
	addu	$t2, $t2, $t6
	sw	$t2, 28($t3)
	addiu	$t1, $t1, 1
	b	buc_j
fi_j:
	addiu	$t0, $t0, 1
	b	buc_i
fi_i:
  
        jr      $ra
