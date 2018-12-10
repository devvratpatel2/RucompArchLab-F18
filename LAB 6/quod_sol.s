# quad_sol.s
# This assembly program calculates the integer solutions of a quadratic polynomial.
# Inputs : The coefficients a,b,c of the equation a*x^2 + b*x + c = 0
# Output : The two integer solutions. 
#
# All numbers are 32 bit integers

.globl main

main: 					# Read all inputs and put them in floating point registers.

	li t1, 1           # a=1
    li t2, -3          # b=-3
    li t3, 2           # c=2
	
	
	# In the following lines all the necessary steps are taken to 
	# calculate the discriminant of the quadratic equation
	# D = b^2 - 4*a*c
	
	mul t4,t2,t2 		# t4 = t2*t2, where t2 holds b
	mul t5,t1,t3 		# t5 = t1*t3, where t1 holds a and t3 holds c
	li a3, 4
	mul t5,t5,a3 		# Multiply value of s0 with 4, creating 4*a*c
	sub t6,t4,t5 		# Calculate D = b^2-4*a*c
	
	
	# calculating the integer square root by the equation x*x = D
	li s0, 1 		    # Square Root Partial Result, sqrt(D).
	mv s1,t6 			# Move value in register t6 to register s1 for safety purposes.
	
	sqrtloop:			# calculating the integer square root of D

		mul s2,s0,s0
		addi s0,x0, 1
		bge s2, s1, endsqrt

	
	
	endsqrt:
		neg s2,t2	
		li t0, 2
		add s3,s2,s0 	
		sub s4,s2,s0 	
		mul s5,t1,t0 
		div s6,s3,s5 	
		div s7,s4,s5 



		
	#Print the calculated solutions.

	li a0, 4			# Load print_string syscall code to register v0 for the 1st result string
	la a1, str1 			# Load actual string to register a0
	ecall
	
	li a0 1			# Load print_int syscall code to register v0 for the 1st result string
	mv a1, s6			# Load actual integer to register a0
	ecall
	
	li a0, 4			# Load print_string syscall code to register v0 for the 1st result string
	la a1, str2			# Load actual string to register a0
	ecall
	
	li a0, 1
	mv a1, s7
	ecall
	
	li a0, 10
	ecall
	
.data
	
	str1: .asciiz "The first integer solution is: "
	
	str2: .asciiz "\nThe second integer solution is: "