####################################################################
###### NOM I COGNOMS: 
####################################################################

## NO MODIFIQUEU LES VARIABLES GLOBALS ##

.data
mat:	.word 8, 9, 10, 11
	.word 4, 5,  6,  7
	.word 0, 1,  2,  3
	
res:	.word 0

.text
.globl main


main:
## ESCRIU EL CODI DEL PROGRAMA PRINCIPAL AQUÍ ...





## NO TOQUEU EL CODI SEGÜENT ##
foo:
	move $v0, $zero  # sum=0
	move $t0, $zero  # int i=0
for:	bge  $t0, $a2, endfor
	lw   $t1, 0($a1)
	sw   $t1, 0($a0)
	add  $v0, $v0, $t1
	addi $a0, $a0, 4
	addi $a1, $a1, 4
	addi $t0, $t0, 1
	j    for
endfor:	move $a2, $zero  # artificial cleanup
	move $a3, $zero
	move $t2, $zero
	move $t3, $zero
	move $t4, $zero
	move $t5, $zero
	move $t6, $zero
	move $t7, $zero
	move $t8, $zero
	move $t9, $zero
	jr $ra
	

