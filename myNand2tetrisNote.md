# 01布尔逻辑

什么是nand门？

就是与非门，所有的布尔函数都可以用与非门实现。

<img src="note.assets/image-20240413195746044.png" alt="image-20240413195746044" style="zoom:50%;" />

实现各种逻辑门。

在nand2tetris\tools目录下，HardwareSimulator.bat 运行硬件模拟器。另外，在projects目录下已经有对应的半成品文件，可以直接在那个基础上改，因为，它有测试脚本，在运行模拟器的时候，自动会加载测试脚本所在目录的hdl文件，所以直接在projects目录里改对应的内容就行了。

![image-20240414165309866](note.assets/image-20240414165309866.png)

实现Not gate， Not.hdl

```
/**
 * Not gate:
 * out = not in
 */

CHIP Not {
    IN in;
    OUT out;

    PARTS:
    Nand(a=in, b=in, out=out);
}
```

实现And gate And.hdl

> ps： 我自己实现的和参考资料里给的不太一样。但是测试用例也是通过的。我看了参考资料里答案，它只不过是多用了一个nand门，思路和我是一样的。

```
/**
 * And gate: 
 * out = 1 if (a == 1 and b == 1)
 *       0 otherwise
 */

CHIP And {
    IN a, b;
    OUT out;

    PARTS:
    Nand(a=a, b=b, out=o1);
    Nand(a=o1, b=o1, out=out);
}
```

实现Or Gate

> 设计这个的时候，想了好多种方式都没有实现，最后先用了Not 门，最终才实现的。
>
> or = (not a) nand (not b)

```
// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/01/Or.hdl

 /**
 * Or gate:
 * out = 1 if (a == 1 or b == 1)
 *       0 otherwise
 */

CHIP Or {
    IN a, b;
    OUT out;

    PARTS:
    Nand(a=a,b=a, out=o1);
    Nand(a=b,b=b, out=o2);
    Nand(a=o1,b=o2, out=out);
}

```

Xor gate

> 我实现的时候，都是用的nand gate，实际上可以使用and not or 这些封装好的门代替。这样就会轻松一些
>
> xor = （a &（not b））Or（（not a） & b） 

```
// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/01/Xor.hdl

/**
 * Exclusive-or gate:
 * out = not (a == b)
 */

CHIP Xor {
    IN a, b;
    OUT out;

    PARTS:
    // Put your code here:
    // not gate
    Nand(a=a, b=a, out =nota);
    Nand(a=b, b=b, out =notb);
    //and gate
    Nand(a=a, b=notb, out =and1);
    Nand(a=and1,b=and1, out = o1);
    Nand(a=nota, b=b, out =and2);
    Nand(a=and2, b=and2, out =o2);


    // or gate
    Nand(a=o1,b=o1, out=o3);
    Nand(a=o2,b=o2, out=o4);
    Nand(a=o3,b=o4, out=out);

    

}
```



# 参考资料

[github参考项目](https://github.com/woai3c/nand2tetris)