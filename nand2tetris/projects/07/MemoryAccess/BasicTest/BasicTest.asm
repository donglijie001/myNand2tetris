//vm command push constant 10
@10
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
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
//vm command push constant 21
@21
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command push constant 22
@22
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
// getARG final address 
@ARG
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
// getARG final address 
@ARG
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
//vm command push constant 36
@36
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
//vm command push constant 42
@42
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command push constant 45
@45
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
@5
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
//vm command push constant 510
@510
D=A
//push value:D into stack
@SP
A=M
M=D
@SP
M=M+1
//vm command pop temp 6
//get temp address
@5
D=A
@6
D=D+A
//store tmp address into R13
@R13
M=D
// get top stack value and make sp minus 1
@SP
M=M-1
A=M
D=M
//read tmp address from R13
@R13
A=M
M=D
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
//vm command push that 5
// get THATbase address
@THAT
D=M
@5
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
//vm command push this 6
// get THISbase address
@THIS
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
//vm command push this 6
// get THISbase address
@THIS
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
//vm command push temp 6
//get temp address
@5
D=A
@6
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
