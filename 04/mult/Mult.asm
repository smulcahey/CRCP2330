// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// Start R2 at 0.
@R2
M=0

// Start the first STEP if R0 > 0.
@R0
D=M
@STEP
D;JGT

// If it doesn't jump, go to END.
@END
0;JMP

// This function adds R1 to R2 and removes 1 from R0.
// If R0 is more than 0 the function STEP runs again.
(STEP)
    // Get R2.
    @R2
    D=M

    // Add R1 to it.
    @R1
    D=D+M

    // Copy the result back into R2.
    @R2
    M=D

    // Reduce R0 by 1.
    @R0
    D=M-1
    M=D

    // If R0 is still > 0 then loop.
    @STEP
    D;JGT

(END)
    @END
    0;JMP