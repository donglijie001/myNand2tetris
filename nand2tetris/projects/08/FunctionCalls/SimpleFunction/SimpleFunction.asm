//vmfunction SimpleFunction.test 2
(SimpleFunction.test)
//initialize local segment
@2
D=A
(SimpleFunction.test$LOOP)
D=D-1
@SimpleFunction.test$END
D;JLT
// push the value into stack0
@SP
A=M
M=0
@SP
M=M+1
@SimpleFunction.test$LOOP
0;JMP
(SimpleFunction.test$END)
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
//vm push local 1
@LCL
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
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
D=!D
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
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
//vmreturn
@LCL
D=M
@R13
M=D //temporarily store the endFrame 
@R13
D=M
@5
A=D-A // get the return address
D=M
@R14
M=D // temporarily store the return address
@ARG
D=M
@0
D=D+A// store the element in register:R15
@R15
M=D
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
// store the top value
@R15
A=M
M=D
// set the SP
@ARG
D=M
@SP
M=D+1
// restore scene
@R13
D=M
@R15
M=D

@R15
M=M-1
A=M
D=M
@THAT
M=D

@R15
M=M-1
A=M
D=M
@THIS
M=D

@R15
M=M-1
A=M
D=M
@ARG
M=D

@R15
M=M-1
A=M
D=M
@LCL
M=D

// goto return address
@R14
A=M
0;JMP
