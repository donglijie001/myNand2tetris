//vm push constant 3030
@3030
D=A
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vm pop pointer 0
@THIS
D=A
@0
D=D+A 
// store the element in register:R13
@R13
M=D
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//vm push constant 3040
@3040
D=A
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vm pop pointer 1
@THIS
D=A
@1
D=D+A 
// store the element in register:R13
@R13
M=D
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//vm push constant 32
@32
D=A
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vm pop this 2
@THIS
D=M
@2
D=A+D
// store the element in register:R13
@R13
M=D
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//vm push constant 46
@46
D=A
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vm pop that 6
@THAT
D=M
@6
D=A+D
// store the element in register:R13
@R13
M=D
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//vm push pointer 0
@THIS
D=A
@0
A=D+A 
D=M
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vm push pointer 1
@THIS
D=A
@1
A=D+A 
D=M
// push the value into stackD
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
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vm push this 2
@THIS
D=M
@2
A=A+D
D=M
// push the value into stackD
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
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vm push that 6
@THAT
D=M
@6
A=A+D
D=M
// push the value into stackD
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
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
