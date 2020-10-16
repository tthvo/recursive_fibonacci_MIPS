.text
# int fib(int n) {
# 	if (n == 0) return 1;
# 	if (n == 1) return 1;
# 	return fib(n-1) + fib(n-2);
# }
#EQUIVALENT:
# int fib(int n) {
#	int v0 = 1;
# 	if (n == 0) return v0;
# 	if (n == 1) return v0;
#	s0 = fib(n-1);
#	s1 = fib(n-2) 
#	v0 = s0 + s1;
# 	return v0;
# }

	addi $a0, $0, 6
	jal fib
	j exit


fib:
# Prologue
	addi $sp $sp -12 # Decrement for more space
	sw $ra ($sp) # push $ra
	sw $a0 4($sp) # push $a0s
	sw $s0 8($sp)
# Body
if:
	addi $v0, $0, 1 # Intialize v0 = 1
	# Want to check if n <= 1 -> check ~(n>1)
	slt $t0, $v0, $a0 # Checking if 1 < a0 (1<n), if not, 1>= n -> t0 = 0
	bne $t0, $0, else # Branch if t0 = 1 as n > 1
	
	j next
else:
	addi $a0, $a0, -1 # n-1
	jal fib
	add $s0, $0, $v0  #s0 = fib(n-1)
	
	# This is why $a0 need to saved in order to call another recursive call
	addi $a0, $a0, -1 # n-1 -1 = n-2
	jal fib
	add $v0, $s0, $v0 # v0 = s0 + (new)v0 = fib(n-1) + fin(n-2)
	
next:

# Epi
	
	lw $ra ($sp) # push $ra
	lw $a0 4($sp) # push $a0
	lw $s0 8($sp)
	addi $sp $sp 12 # Increment by 12
	
	jr $ra

exit: 
	# Exit the program
