// Load R0 into D
@R0
D=M

// Check if value is negative
@NEG
D;JLT

// --------- NON-NEGATIVE CASE ---------
@R1
M=D      // R1 = R0
@R2
M=0      // R2 = 0 (not negative)
@R3
M=0      // R3 = 0 (no error)
@END
0;JMP

// --------- NEGATIVE CASE ---------
(NEG)
@R2
M=1      // R2 = 1 (negative flag)

// Take two's complement of R0
@R0
D=M
D=!D
D=D+1

// Check if D is still negative (i.e., overflow case: -32768)
@OVERFLOW
D;JLT

// ---------- Normal negative value ----------
@R1
M=D      // R1 = absolute value
@R3
M=0      // R3 = 0 (no error)
@END
0;JMP

// ---------- Overflow case (-32768) ----------
(OVERFLOW)
@R3
M=1      // R3 = 1 (error: can't represent abs value)
@R0
D=M
@R1
M=D      // R1 = original value (no change)

(END)
@END
0;JMP
