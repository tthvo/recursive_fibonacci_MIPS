.text
# int fact(int n) {
# if (a0 == 0) v0 = 1
# else v0 = a0*fact(a0-1);
#return v0;}

main:
	li $a0, 4
	jal fact #v0 = 4*3*2*1 = 24 = 0x18
	j exit
fact:

# Prologue
	addi $sp $sp -8
	sw $ra ($sp)
	sw $a0 4($sp)

# Body
if:	bne $a0, $0, else
	# Otherwise
	addi $v0, $0, 1
	j next

else:
# fact(a0 - 1)
	# Decrement a0 by 1
	addi $a0, $a0, -1
	
	jal fact # v0 = fact(a0-1)
	lw $a0 4($sp) # restore a0
	
	mult $v0, $a0 # v0 = a0 * fact(a0 - 1)
	mflo $v0
next:
# Epi	
	lw $ra ($sp)
	addi $sp $sp 8
	jr $ra
	
exit:
	#Exit the program