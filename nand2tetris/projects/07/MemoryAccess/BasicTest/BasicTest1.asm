//vm push constant 10
@10
D=A
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vm pop local 0
@LCL
D=M
@0
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
//vm push constant 21
@21
D=A
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vm push constant 22
@22
D=A
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vm pop argument 2
@ARG
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
//vm pop argument 1
@ARG
D=M
@1
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
//vm push constant 36
@36
D=A
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vm pop this 6
@THIS
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
//vm push constant 42
@42
D=A
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vm push constant 45
@45
D=A
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vm pop that 5
@THAT
D=M
@5
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
//vm pop that 2
@THAT
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
//vm push constant 510
@510
D=A
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vm pop temp 6
@R5
D=A
@6
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
//vm push local 0
@LCL
D=M
@0
A=A+D
D=M
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vm push that 5
@THAT
D=M
@5
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
//vm push argument 1
@ARG
D=M
@1
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
//vm push this 6
@THIS
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
//vm push this 6
@THIS
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
//vm push temp 6
@R5
D=A
@6
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
