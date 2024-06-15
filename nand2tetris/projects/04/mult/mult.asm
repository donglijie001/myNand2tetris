// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// 书里面没有 乘，所以这里要用累加，这里先用伪代码写
// i = R0
// n = R1
// sum = 0
// LOOP:
//  if i <= 0 goto STOP
//  sum = sum + n
// STOP:
//  R2=sum

@R0
D=M
@i
M=D
@R1
D=M
@n
M=D
@sum 
M=0

(LOOP)
@i
MD=M-1 // i=i-1
@STOP
D;JLT // if i <0 jump

@n
D=M
@sum
M=M+D
@LOOP
0;JMP

(STOP)
@sum
D=M
@R2
M=D

(END)
@END
0;JMP