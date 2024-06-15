// Program:Sum1ToN.asm
// Computes RAM[1]= 1+2+...+n 
// Usge: put a number(n) in RAM[0]

@R0
D=M
@n
M=D // n=RAM[0]

@i
M=1 // i=1

@sum 
M=0 // sum =0


(LOOP)
@i
D=M // D=i
@n
D=D-M  //i-n
@STOP
D;JGT // i-n >0 jump , 上面几行先把i给读进来，然后再把n给读进来，然后判断i-n


@sum
D=M // 读取sum的值
@i
D=D+M // sum + i
@sum
M=D // sum =sum +i， 把sum + i 赋值给sum
@i
M=M+1 // i= i+1 把i+1 赋值给i
@LOOP 
0;JMP // 跳转到LOOP 开始的地方。

(STOP)
@sum
D=M
@R1
M=D // RAM[1] =sum 

(END)
@END
0;JMP
