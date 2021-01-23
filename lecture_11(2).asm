# int calc(int a, int b, int c, int d) {
# 	return multiply(sum(a,b), multiply(c,d));}

# equivalent to 

#int calc(int a, int b, int c, int d) {
# 	int x = sum(a,b); 
#	int y = multiply(c,d);
#	int v0 = multiply(x,y)
#	return v0;
# }

# assume a = 10, b = 20, c = 5, d = 4
# a0 = a, a1 = 20, a2 = 5, a3 = 4
# s0 = x, s1 = y
cacl:
# Prologue
	addi $sp $sp, -16 # activiation frames
	sw $s0, ($sp)
	sw $ra, 4($sp)
	sw $a2, 8($sp)
	sw $a3, 12($sp)
# Body
	# int x = sum (a,b)
	
	jal sum 
	move $s0, $v0 #  v0 = sum(a,b)
	
	# int y = multiply(c,d)
	# a0 and a1 may be changed
	lw $a0, 8($sp) # a0 = c
	lw $a1, 12($sp) # a1 = d
	
	jal multiply 
	
	#
	move $a0, $s0 #a0 = s0 = sum(a,b)
	move $a1, $v0 # a1 = multiply(c,d)
	
	jal multiply
	#v0 = multiply(sum(a,b), multiply(c,d))
# Epi
	lw $s0, ($sp)
	lw $ra, 4($sp)
	addi $sp $sp, 16 # activiation frames
	
	jr $ra


sum:
	
	jr $ra
multiply:

	jr $ra
