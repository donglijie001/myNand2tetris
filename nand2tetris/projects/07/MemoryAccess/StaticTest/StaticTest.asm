//vm command push constant 111
@111
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command push constant 333
@333
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command push constant 888
@888
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command pop static 8
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
@StaticTest.8
M=D
//vm command pop static 3
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
@StaticTest.3
M=D
//vm command pop static 1
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
@StaticTest.1
M=D
//vm command push static 3
@StaticTest.3
D=M
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command push static 1
@StaticTest.1
D=M
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
//vm command push static 8
@StaticTest.8
D=M
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
