// Adds up two numbers
// RAM[2] = RAM[0] + RAM[1]
// Usage:put the values that you wish to add
//       in RAM[0] and RAM[1]

@0
D=M // 把RAM[0]的值 放到D寄存器上

@1
D=D+M // RAM[0] + RAM[1]

@2
M=D

// 下面这两行代码是一个无限循环，是为了防止程序继续往下执行，因为如果让cpu模拟器自动
// 执行的话，在执行完上面的代码，它还会继续的往下执行，
// 到第7行，就跳转到第6行，这样就无限循环了
@6  
0;JMP 

