// R2 = R0 XOR R1 using XOR = (R0 & !R1) | (!R0 & R1)

// Step 1: A = R0 AND NOT R1
@R1
D=M
D=!D
@R4        // temp register
M=D
@R0
D=M
@R4
D=D&M
@R5        // temp register to hold A
M=D

// Step 2: B = NOT R0 AND R1
@R0
D=M
D=!D
@R6
M=D
@R1
D=M
@R6
D=D&M      // B in D

// Step 3: R2 = A OR B
@R5
D=D|M
@R2
M=D
