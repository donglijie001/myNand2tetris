//vm push constant 0
@0
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
//vmlabel LOOP_START
(LOOP_START)
//vm push argument 0
@ARG
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
//vm push argument 0
@ARG
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
//vm push constant 1
@1
D=A
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
//vm pop argument 0
@ARG
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
//vm push argument 0
@ARG
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
//vmif-goto LOOP_START
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
@LOOP_START
D;JNE
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
