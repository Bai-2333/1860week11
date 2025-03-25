// Calculate R1 = |R0|, set flags R2 and R3
@R0
D=M // Load R0 to D register
@POSITIVE
D;JGE // If D ≥ 0, jump to non-negative number processing
// Process negative numbers: calculate the complement and check for overflow
D=!D // Bitwise inversion
D=D+1 // Add 1 to get the complement (i.e., absolute value attempt)
@CHECK_NEG
D;JLT // If the complement is still negative, the original value is -32768 (overflow)
// Normal situation: the complement is valid
@R1
M=D // R1 = positive value after complement
@R2
M=1 // R2 = 1 (original value is negative)
@R3
M=0 // R3 = 0 (no error)
@END
0;JMP // End program
CHECK_NEG:
// Error handling: original value is -32768
@R0
D=M // Reload the original value to D
@R1
M=D // R1 = original value (absolute value cannot be calculated)
@R2
M=1 // R2 = 1 (original value is negative)
@R3
M=1 // R3 = 1 (error occurs)
@END
0;JMP
POSITIVE:
// Non-negative number processing
@R0
D=M // Load the original value to D
@R1
M=D // R1 = original value (non-negative number is directly stored)
@R2
M=0 // R2 = 0 (original value is non-negative)
@R3
M=0 // R3 = 0 (no error)
END:
@END // Program termination
0;JMP
