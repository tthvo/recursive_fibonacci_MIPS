.text
main:
	j foo


foo:
# prologue
	addi $sp, $sp, -16 # Space for s0
	sw $s0, ($sp) # push s0 to stack
	sw $a0, 4($sp)# push a0 to stack
	sw $ra, 8($sp)# push ra to stack
	
#body
	add $t0 $a0 $a1
	# save t0 into stack
	# we do not save t0 before body
	sw $t0, 12($sp)
	
# Call moo
	move $a0, $t0 
	jal moo
	
# Restore t0
	lw $t0, 12($sp)
# Restore a0
	lw $a0, 4($sp)
	
	move $s0, $v0 # s0 = moo(t0)
	
	add $s0, $s0, $a0 # s0 = s0 + a
	add $v0, $s0, $t0 # v0 = $a0 + t0
	
	
#epi	
	lw $s0, ($sp) # pop s0
	lw $ra, 8($sp) # pop ra
	addi $sp, $sp, 16 # Restore
	
	jr $ra


moo:
	# Do sometthing!
	jr $ra
