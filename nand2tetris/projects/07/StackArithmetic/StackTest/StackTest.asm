//vm push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R14
@R14
M=D
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R13
@R13
M=D
// R13 minus  R14
@R13
D=M
@R14
D=D-M
@EQ0
D;JEQ
@SP
A=M
M=0
@SP
M=M+1

@ENDEQ0
0;JMP
(EQ0)
@SP
A=M
M=-1
@SP
M=M+1

(ENDEQ0)
//vm push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R14
@R14
M=D
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R13
@R13
M=D
// R13 minus  R14
@R13
D=M
@R14
D=D-M
@EQ1
D;JEQ
@SP
A=M
M=0
@SP
M=M+1

@ENDEQ1
0;JMP
(EQ1)
@SP
A=M
M=-1
@SP
M=M+1

(ENDEQ1)
//vm push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R14
@R14
M=D
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R13
@R13
M=D
// R13 minus  R14
@R13
D=M
@R14
D=D-M
@EQ2
D;JEQ
@SP
A=M
M=0
@SP
M=M+1

@ENDEQ2
0;JMP
(EQ2)
@SP
A=M
M=-1
@SP
M=M+1

(ENDEQ2)
//vm push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R14
@R14
M=D
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R13
@R13
M=D
// R13 minus  R14
@R13
D=M
@R14
D=D-M
@LT3
D;JLT
@SP
A=M
M=0
@SP
M=M+1

@ENDLT3
0;JMP
(LT3)
@SP
A=M
M=-1
@SP
M=M+1

(ENDLT3)
//vm push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R14
@R14
M=D
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R13
@R13
M=D
// R13 minus  R14
@R13
D=M
@R14
D=D-M
@LT4
D;JLT
@SP
A=M
M=0
@SP
M=M+1

@ENDLT4
0;JMP
(LT4)
@SP
A=M
M=-1
@SP
M=M+1

(ENDLT4)
//vm push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R14
@R14
M=D
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R13
@R13
M=D
// R13 minus  R14
@R13
D=M
@R14
D=D-M
@LT5
D;JLT
@SP
A=M
M=0
@SP
M=M+1

@ENDLT5
0;JMP
(LT5)
@SP
A=M
M=-1
@SP
M=M+1

(ENDLT5)
//vm push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R14
@R14
M=D
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R13
@R13
M=D
// R13 minus  R14
@R13
D=M
@R14
D=D-M
@GT6
D;JGT
@SP
A=M
M=0
@SP
M=M+1

@ENDGT6
0;JMP
(GT6)
@SP
A=M
M=-1
@SP
M=M+1

(ENDGT6)
//vm push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R14
@R14
M=D
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R13
@R13
M=D
// R13 minus  R14
@R13
D=M
@R14
D=D-M
@GT7
D;JGT
@SP
A=M
M=0
@SP
M=M+1

@ENDGT7
0;JMP
(GT7)
@SP
A=M
M=-1
@SP
M=M+1

(ENDGT7)
//vm push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R14
@R14
M=D
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R13
@R13
M=D
// R13 minus  R14
@R13
D=M
@R14
D=D-M
@GT8
D;JGT
@SP
A=M
M=0
@SP
M=M+1

@ENDGT8
0;JMP
(GT8)
@SP
A=M
M=-1
@SP
M=M+1

(ENDGT8)
//vm push constant 57
@57
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm push constant 53
@53
D=A
@SP
A=M
M=D
@SP
M=M+1
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R14
@R14
M=D
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R13
@R13
M=D
// R13 add  R14
@R13
D=M
@R14
D=D+M
@SP
A=M
M=D
@SP
M=M+1
//vm push constant 112
@112
D=A
@SP
A=M
M=D
@SP
M=M+1
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R14
@R14
M=D
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R13
@R13
M=D
// R13 minus  R14
@R13
D=M
@R14
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
D=-D
@SP
A=M
M=D
@SP
M=M+1
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R14
@R14
M=D
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R13
@R13
M=D
@R13
D=M
@R14
D=D&M
@SP
A=M
M=D
@SP
M=M+1
//vm push constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R14
@R14
M=D
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R13
@R13
M=D
@R13
D=M
@R14
D=D|M
@SP
A=M
M=D
@SP
M=M+1
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
