//vm command push constant 3030
@3030
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command pop pointer 0
//get pointer address
@3
D=A
@0
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
//vm command push constant 3040
@3040
D=A
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
//vm command push constant 32
@32
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
// getTHIS final address 
@THIS
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
//vm command push constant 46
@46
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
// getTHAT final address 
@THAT
D=M
@6
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
//vm command push pointer 0
//get pointer address
@3
D=A
@0
A=D+A
D=M
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
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
//vm command push this 2
// get THISbase address
@THIS
D=M
@2
// base address + i
A=D+A
D=M
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
//vm command push that 6
// get THATbase address
@THAT
D=M
@6
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
