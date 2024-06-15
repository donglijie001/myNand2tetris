// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.
// 这里执行的时候，要把模拟器设置成no animation
// Put your code here. 下面这样简单的循环，只能把16的像素给置黑，而题目里是要
// 把所有的像素都给置黑
// LOOP:
//  KBD !=0
// SCREEN =-1 //置白
// else 
// SCREEN =1
// 需要改成下面这个，再多加一个循环, 我的思路是看看github上别人的参考答案，
// 24576为键盘的地址 16384-24575 刚好8K 为屏幕的地址，这句话给了我很大的启发，我看书的时候，没有注意到这句话
// 所以我就从16384开始，每次刷新16个像素，然后让address=address+1， 然后把address和KBD 比较，如果比KBD小，
// 就继续子循环刷新。
// LOOP:
//  KBD !=0
// WHITE_LOOP:
//   i=0
//   if SCREEN + i < 8192
//     SCREEN =-11// 置白
//     i++
// else 
// BLACK_LOOP:
// i=0
//   if SCREEN + i < 8192
//     SCREEN =1
//     i++

(LOOP)
@KBD // 获取键盘输入
D=M

@BLACK
D;JGT

@SCREEN // 刷白
D=A // 把screen 的开始地址放到D寄存器里
@address 
M=D // 把screen 的开始地址赋值给address变量
(WHITE_REFRESH) // 子循环，用于将整个屏幕刷白
@address
A=M
M=0 // 设置16个像素变黑
@address
MD=M+1 // address存储的地址+1
@KBD 
D=D-A  //  让address 存储的地址和KBD的地址进行比较，如果大于等于0，就说明可以结束子循环了
@WHITE_REFRESH
D;JLT

@LOOP
0;JMP

(BLACK)
@SCREEN
D=A // 把screen 的开始地址放到D寄存器里
@address 
M=D // 把screen 的开始地址赋值给address变量
(BLACK_REFRESH) // 子循环，用于将整个屏幕刷黑
@address
A=M
M=-1 // 设置16个像素变黑
@address
MD=M+1 // address存储的地址+1
@KBD 
D=D-A  //  让address 存储的地址和KBD的地址进行比较，如果大于等于0，就说明可以结束子循环了
@BLACK_REFRESH
D;JLT

@LOOP
0;JMP