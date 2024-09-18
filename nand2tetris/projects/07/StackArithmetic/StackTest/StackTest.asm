//vm command push constant 17
@17
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command push constant 17
@17
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command eq
// get top two value and tmp store
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M

// tmp store in R14
@R14
M=D
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
// tmp store in R13
@R13
M=D
//read R13 value
@R13
D=M
//read R14 value
@R14
// execute sub
D=D-M
@EQ0
D;JEQ
// not equal, 0 false, -1 trueD=0
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
@END0
0;JMP
(EQ0)
//push value:-1 into stack
@SP
A=M
M=-1
@SP
M=M+1
(END0)
//vm command push constant 17
@17
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command push constant 16
@16
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command eq
// get top two value and tmp store
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M

// tmp store in R14
@R14
M=D
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
// tmp store in R13
@R13
M=D
//read R13 value
@R13
D=M
//read R14 value
@R14
// execute sub
D=D-M
@EQ1
D;JEQ
// not equal, 0 false, -1 trueD=0
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
@END1
0;JMP
(EQ1)
//push value:-1 into stack
@SP
A=M
M=-1
@SP
M=M+1
(END1)
//vm command push constant 16
@16
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command push constant 17
@17
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command eq
// get top two value and tmp store
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M

// tmp store in R14
@R14
M=D
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
// tmp store in R13
@R13
M=D
//read R13 value
@R13
D=M
//read R14 value
@R14
// execute sub
D=D-M
@EQ2
D;JEQ
// not equal, 0 false, -1 trueD=0
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
@END2
0;JMP
(EQ2)
//push value:-1 into stack
@SP
A=M
M=-1
@SP
M=M+1
(END2)
//vm command push constant 892
@892
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command push constant 891
@891
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command lt
// get top two value and tmp store
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M

// tmp store in R14
@R14
M=D
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
// tmp store in R13
@R13
M=D
//read R13 value
@R13
D=M
//read R14 value
@R14
// execute sub
D=D-M
@LT3
D;JLT
// not equal, 0 false, -1 trueD=0
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
@ENDLT3
0;JMP
(LT3)
//push value:-1 into stack
@SP
A=M
M=-1
@SP
M=M+1
(ENDLT3)
//vm command push constant 891
@891
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command push constant 892
@892
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command lt
// get top two value and tmp store
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M

// tmp store in R14
@R14
M=D
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
// tmp store in R13
@R13
M=D
//read R13 value
@R13
D=M
//read R14 value
@R14
// execute sub
D=D-M
@LT4
D;JLT
// not equal, 0 false, -1 trueD=0
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
@ENDLT4
0;JMP
(LT4)
//push value:-1 into stack
@SP
A=M
M=-1
@SP
M=M+1
(ENDLT4)
//vm command push constant 891
@891
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command push constant 891
@891
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command lt
// get top two value and tmp store
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M

// tmp store in R14
@R14
M=D
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
// tmp store in R13
@R13
M=D
//read R13 value
@R13
D=M
//read R14 value
@R14
// execute sub
D=D-M
@LT5
D;JLT
// not equal, 0 false, -1 trueD=0
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
@ENDLT5
0;JMP
(LT5)
//push value:-1 into stack
@SP
A=M
M=-1
@SP
M=M+1
(ENDLT5)
//vm command push constant 32767
@32767
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command push constant 32766
@32766
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command gt
// get top two value and tmp store
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M

// tmp store in R14
@R14
M=D
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
// tmp store in R13
@R13
M=D
//read R13 value
@R13
D=M
//read R14 value
@R14
// execute sub
D=D-M
@GT6
D;JGT
// not equal, 0 false, -1 trueD=0
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
@ENDGT6
0;JMP
(GT6)
//push value:-1 into stack
@SP
A=M
M=-1
@SP
M=M+1
(ENDGT6)
//vm command push constant 32766
@32766
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command push constant 32767
@32767
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command gt
// get top two value and tmp store
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M

// tmp store in R14
@R14
M=D
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
// tmp store in R13
@R13
M=D
//read R13 value
@R13
D=M
//read R14 value
@R14
// execute sub
D=D-M
@GT7
D;JGT
// not equal, 0 false, -1 trueD=0
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
@ENDGT7
0;JMP
(GT7)
//push value:-1 into stack
@SP
A=M
M=-1
@SP
M=M+1
(ENDGT7)
//vm command push constant 32766
@32766
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command push constant 32766
@32766
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command gt
// get top two value and tmp store
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M

// tmp store in R14
@R14
M=D
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
// tmp store in R13
@R13
M=D
//read R13 value
@R13
D=M
//read R14 value
@R14
// execute sub
D=D-M
@GT8
D;JGT
// not equal, 0 false, -1 trueD=0
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
@ENDGT8
0;JMP
(GT8)
//push value:-1 into stack
@SP
A=M
M=-1
@SP
M=M+1
(ENDGT8)
//vm command push constant 57
@57
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command push constant 31
@31
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command push constant 53
@53
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command add
// get top two value and tmp store
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M

// tmp store in R14
@R14
M=D
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
// tmp store in R13
@R13
M=D
//read R13 value
@R13
D=M
//read R14 value
@R14
// execute add
D=D+M
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command push constant 112
@112
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command sub
// get top two value and tmp store
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M

// tmp store in R14
@R14
M=D
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
// tmp store in R13
@R13
M=D
//read R13 value
@R13
D=M
//read R14 value
@R14
// execute sub
D=D-M
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command neg
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
// execute neg
D=-D
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command and
// get top two value and tmp store
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M

// tmp store in R14
@R14
M=D
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
// tmp store in R13
@R13
M=D
//read R13 value
@R13
D=M
//read R14 value
@R14
// execute &
D=D&M
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command push constant 82
@82
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command or
// get top two value and tmp store
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M

// tmp store in R14
@R14
M=D
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
// tmp store in R13
@R13
M=D
//read R13 value
@R13
D=M
//read R14 value
@R14
// execute |
D=D|M
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command not
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
// execute not
D=!D
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
