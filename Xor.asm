// Calculate R2 = R0 XOR R1
// Step 1: Calculate A = R0 AND NOT R1
@R1 // Load R1 into the D register 
D=M
D=! D // D = NOT R1
@R0 // Load R0 into the A register 
D=D&M // D = R0 AND NOT R1
@temp // Store the intermediate result in temp 
M=D
// Step 2: Calculate B = NOT R0 AND R1
@R0 // Load R0 into the D register 
D=M
D=! D // D = NOT R0
@R1 // Load R1 into the A register 
D=D&M // D = NOT R0 AND R1
// Step 3: Calculate R2 = A OR B
@temp // Load intermediate result A 
D=D|M // D = (R0 AND NOT R1) OR (NOT R0 AND R1)
@R2 // Store the result in R2 
M = D
