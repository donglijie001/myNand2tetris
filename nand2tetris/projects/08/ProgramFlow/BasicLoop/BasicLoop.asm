//vm command push constant 0    
@0
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command pop local 0
// getLCL final address 
@LCL
D=M
@0
A=D+A
D=A
// tmp store in R13
@R13
M=D
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//vm command label LOOP_START
(LOOP_START)
//vm command push argument 0    
// get ARGbase address
@ARG
D=M
@0
// base address + i
A=D+A
D=M
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command push local 0
// get LCLbase address
@LCL
D=M
@0
// base address + i
A=D+A
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
//vm command pop local 0
// getLCL final address 
@LCL
D=M
@0
A=D+A
D=A
// tmp store in R13
@R13
M=D
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//vm command push argument 0
// get ARGbase address
@ARG
D=M
@0
// base address + i
A=D+A
D=M
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command push constant 1
@1
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
//vm command pop argument 0
// getARG final address 
@ARG
D=M
@0
A=D+A
D=A
// tmp store in R13
@R13
M=D
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//vm command push argument 0
// get ARGbase address
@ARG
D=M
@0
// base address + i
A=D+A
D=M
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command if-goto LOOP_START
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
@LOOP_START
D;JGT//vm command push local 0
// get LCLbase address
@LCL
D=M
@0
// base address + i
A=D+A
D=M
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
