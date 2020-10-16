.data
radius: .word 10

.globl main
.text
main:
	la $s0, radius
	# Load into a0 the value of the radius
	lw $a0, ($s0)
	# Call circle Area
	jal circleArea
	# Skip the area method
	j exit
circleArea:

	# Push s0 into the stack
	addi $sp, $sp, -4 # Decrement the pointer
	sw $s0, ($sp)
	# Body
	mult  $a0, $a0
	mflo $s0
	
	addi $t0, $0, 3
	mult $s0, $t0 # we dont use floating point so use 3 
	mflo $s0
	
	add $v0, $s0, $s0 # Copy the value to v0
	# Pop and restore s0
	lw $s0, ($sp)
	addi $sp, $sp, -4 # Increment the pointer
	
	jr $ra
exit:	
	addi $v0, $0, 10
	syscall
	
	