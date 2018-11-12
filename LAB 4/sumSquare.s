sumSquare: addi sp, sp -12 # allocates space for three words on the stack
sw ra, 0(sp) # stores the return address
sw s0, 4(sp) # stores the register s0
sw s1, 8(sp) # Stores the register s1
add s0, a0, x0 # Sets s0 equal to the n
add s1, x0, x0 # Sets s1 equal to 0 
loop: bge x0, s0, end # if s0 is not positive then branch
add a0, s0, x0 # Sets a0 to the value of s0 
jal ra, square # Calls the square function
add s1, s1, a0 # Adds the returned value to s1
addi s0, s0, -1 # Decreases s0 by 1
jal x0, loop # Jumps back to the loop label
end: add a0, s1, x0 # Sets a0 to the value of s1
lw ra, 0(sp) # Restores ra
lw s0, 4(sp) # Restores s0
lw s1, 8(sp) # Restores s1
addi sp, sp, 12 # Frees the space that was allocated first to the 3 words
jr ra # Returns to the caller
