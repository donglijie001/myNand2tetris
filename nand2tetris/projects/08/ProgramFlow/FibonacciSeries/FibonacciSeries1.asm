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
//vm push constant 0
@0
D=A
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vm pop that 0
@THAT
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
//vm push constant 1
@1
D=A
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vm pop that 1
@THAT
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
//vm push constant 2
@2
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
//vmlabel MAIN_LOOP_START
(MAIN_LOOP_START)
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
//vmif-goto COMPUTE_ELEMENT
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
@COMPUTE_ELEMENT
D;JNE
//vmgoto END_PROGRAM
@END_PROGRAM
0;JMP
//vmlabel COMPUTE_ELEMENT
(COMPUTE_ELEMENT)
//vm push that 0
@THAT
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
//vm push that 1
@THAT
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
//vmgoto MAIN_LOOP_START
@MAIN_LOOP_START
0;JMP
//vmlabel END_PROGRAM
(END_PROGRAM)
