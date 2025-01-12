.data

A: .word    2,-1,-1,-2,
            1,-4, 0, 0,
            1, 2, 8, 2,
            0, 4,-2, 3                                                                    

.text
.globl main
main:
 	move $t0,$zero #i
 	li $t2,4 # 4
 	la $t7,A
 	
 fori:	bge $t0,$t2 fi #i<4
 
 	addiu $t1,$t0,1 #j
 forj:	bge $t1,$t2 fij #j<4
 	
 	addiu $t3,$t7,4 #@A+4
 	lw $t4,0($t3) 	
 if:	
 
 
 else:	
 
 	addiu $t1,$t1,1
 	b forj
 fij:	addiu $t0,$t0,1
 	b fori
 fi:



      jr  $ra 

