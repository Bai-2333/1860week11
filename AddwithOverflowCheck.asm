// R2 = R0 + R1
@R0
D=M
@R1
D=D+M
@R2
M=D

// Check if R0 is non-negative
@R0
D=M
@POSITIVE_R0
D;JGE

// R0 is negative
// If R1 is also negative and the result is non-negative, overflow occurred
@R1
D=M
@NOT_OVERFLOW
D;JGE // No overflow if R1 is non-negative

@R2
D=M
@OVERFLOW
D;JGE // If result is non-negative, overflow occurred
@NOT_OVERFLOW
0;JMP

(POSITIVE_R0)
// R0 is non-negative
// If R1 is also non-negative and result is negative, overflow occurred
@R1
D=M
@NOT_OVERFLOW
D;JLT // No overflow if R1 is negative

@R2
D=M
@OVERFLOW
D;JLT // If result is negative, overflow occurred
@NOT_OVERFLOW
0;JMP

(OVERFLOW)
@R3
M=1 // Set overflow flag to 1
@END
0;JMP

(NOT_OVERFLOW)
@R3
M=0 // No overflow

(END)
@END
0;JMP
