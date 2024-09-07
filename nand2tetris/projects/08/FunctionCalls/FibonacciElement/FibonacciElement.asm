//vmfunction Sys.init 0
// Sys.init function start
(Sys.init)
//vm push constant 4
@4
D=A
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
//vmcall Main.fibonacci 1
// save work
@Main.fibonacci1$retAddr1
D=A
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
// argument process
@SP
D=M
@5
D=D-A
@1
D=D-A
@ARG
M=D
// LCL=SP
@SP
D=M
@LCL
M=D
// go to called function
@Main.fibonacci
0;JMP
(Main.fibonacci1$retAddr1)
//vmlabel WHILE
(Main.fibonacci1$WHILE)
//vmgoto WHILE
@Main.fibonacci1$WHILE
0;JMP
//vmfunction Main.fibonacci 0
(Main.fibonacci)
//initialize local segment
@0
D=A
(Main.fibonacci$LOOP)
D=D-1
@Main.fibonacci$END
D;JLT
// push the value into stack0
@SP
A=M
M=0
@SP
M=M+1
@Main.fibonacci$LOOP
0;JMP
(Main.fibonacci$END)
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
@LT1
D;JLT
// push the value into stack0
@SP
A=M
M=0
@SP
M=M+1

@ENDLT1
0;JMP
(LT1)
// push the value into stack-1
@SP
A=M
M=-1
@SP
M=M+1

(ENDLT1)
//vmif-goto IF_TRUE
// get the  top element of stack and make sp minus 1
@SP
M=M-1
A=M
D=M
@Main.vm$IF_TRUE
D;JNE
//vmgoto IF_FALSE
@Main.vm$IF_FALSE
0;JMP
//vmlabel IF_TRUE
(Main.vm$IF_TRUE)
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
//vmlabel IF_FALSE
(Main.vm$IF_FALSE)
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
//vmcall Main.fibonacci 1
// save work
@Main.fibonacci3$retAddr3
D=A
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
// argument process
@SP
D=M
@5
D=D-A
@1
D=D-A
@ARG
M=D
// LCL=SP
@SP
D=M
@LCL
M=D
// go to called function
@Main.fibonacci
0;JMP
(Main.fibonacci3$retAddr3)
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
//vmcall Main.fibonacci 1
// save work
@Main.fibonacci4$retAddr4
D=A
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
// push the value into stackD
@SP
A=M
M=D
@SP
M=M+1
// argument process
@SP
D=M
@5
D=D-A
@1
D=D-A
@ARG
M=D
// LCL=SP
@SP
D=M
@LCL
M=D
// go to called function
@Main.fibonacci
0;JMP
(Main.fibonacci4$retAddr4)
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
