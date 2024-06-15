//Example：
// Program:Signum.asm
// Comutes:if R0>0
//			  R1=1
//		    else
//			  R1=0

@R0 //0
D=M //1


@8    //2
D;JGT //3


@R1 //4
M=0 // 5

@10 //6
0;JMP //7

@R1 //8
M=1 //9

@10
0;JMP