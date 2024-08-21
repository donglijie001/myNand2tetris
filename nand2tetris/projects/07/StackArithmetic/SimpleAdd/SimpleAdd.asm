//vm push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
//vm add
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R13
@R13
M=D
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the element in register:R14
@R14
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
