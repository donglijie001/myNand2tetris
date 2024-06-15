// Program: Rectangle.asm
// Draws a filled rectangle at the screen's top left corner.
// The rectangle/s width is 16 pixels, ans its height is RAM[0]
// Usage: put a non-negative number (rectangle's height) in RAM[0]
@R0
D=M
@n //RAM[16]
M=D // n= RAM[0]

@i//RAM[17]
M=0 // i=0这里直接操作了内存地址

@SCREEN 
D=A
@address //RAM[18]
M=D // address = 16384 (base address of the Hack screen)

(LOOP)
@i 
D=M
@n
D=D-M // i-n
@END
D;JGT // if i>n goto END

@address
A=M
M=-1 //RAM[address] = -1 (16 pixels)

@i
M=M+1 // i = i + 1

@32
D=A
@address
M=D+M // address = address +32
@LOOP
0;JMP

(END)
@END // Program's END
0;JMP  // infinite loop

