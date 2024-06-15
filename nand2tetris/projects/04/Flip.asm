// Program:Signum.asm
// fips the values of RAM[0] and RAM[1]
// temp = RAM[1]
// RAM[1]= RAM[0]
// RAM[0] = temp
@R1
D=M
@temp
M=D

@R0
D=M
@R1
M=D

@temp
D=M
@R0
M=D


(END)
@END
0;JMP
