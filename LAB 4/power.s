power: li t0, 0
 	addi t1, a0, 0
 loop:	bge t0,a1, end
 	mul a0, a0, t1
 	addi t0, t0, 1
	jal x0, loop
end:	jr ra
