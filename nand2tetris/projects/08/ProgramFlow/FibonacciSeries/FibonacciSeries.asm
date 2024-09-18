//vm command push argument 1
// get ARGbase address
@ARG
D=M
@1
// base address + i
A=D+A
D=M
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command pop pointer 1
//get pointer address
@3
D=A
@1
D=D+A
//tmp store pointer into R13
@R13
M=D
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
//load pointer address fromR13
@R13
A=M
M=D
//vm command push constant 0
@0
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command pop that 0
// getTHAT final address 
@THAT
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
//vm command push constant 1
@1
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command pop that 1
// getTHAT final address 
@THAT
D=M
@1
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
//vm command push constant 2
@2
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
//vm command label MAIN_LOOP_START
(MAIN_LOOP_START)
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
//vm command if-goto COMPUTE_ELEMENT
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
@COMPUTE_ELEMENT
D;JGT//vm command goto END_PROGRAM
@END_PROGRAM
0;JMP
//vm command label COMPUTE_ELEMENT
(COMPUTE_ELEMENT)
//vm command push that 0
// get THATbase address
@THAT
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
//vm command push that 1
// get THATbase address
@THAT
D=M
@1
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
//vm command pop that 2
// getTHAT final address 
@THAT
D=M
@2
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
//vm command push pointer 1
//get pointer address
@3
D=A
@1
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
//vm command pop pointer 1
//get pointer address
@3
D=A
@1
D=D+A
//tmp store pointer into R13
@R13
M=D
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
//load pointer address fromR13
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
//vm command goto MAIN_LOOP_START
@MAIN_LOOP_START
0;JMP
//vm command label END_PROGRAM
(END_PROGRAM)
