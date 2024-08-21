//vm push constant 111
@111
D=A
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vm push constant 333
@333
D=A
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vm push constant 888
@888
D=A
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vm pop static 8
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
@StaticTest.vm.8
M=D
//vm pop static 3
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
@StaticTest.vm.3
M=D
//vm pop static 1
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
@StaticTest.vm.1
M=D
//vm push static 3
@StaticTest.vm.3
D=M
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vm push static 1
@StaticTest.vm.1
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
//vm push static 8
@StaticTest.vm.8
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
