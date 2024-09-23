package v2;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

/**
 * 这个类的作用就是将vm命令进行翻译然后写入到文件里
 *
 * @author donglijie <donglijie@kuaishou.com>
 * Created on 2024-09-08
 */
public class CodeWriterV2 {
    private FileWriter fileWriter;
    private int index = 0;

    public CodeWriterV2(File file) throws IOException {
        this.fileWriter = new FileWriter(file);

    }

    private String getR13ValueIntoD() {
        return "//read R13 value" + System.lineSeparator()
                + "@R13" + System.lineSeparator()
                + "D=M" + System.lineSeparator();
    }

    private String getLoadR14() {
        return "//read R14 value" + System.lineSeparator()
                + "@R14" + System.lineSeparator();
    }

    public void writeArithmetic(String command, String vmFileName) throws IOException {
        String content = "//vm command " + command + System.lineSeparator();
        String args1 = ParserV2.getArgs1(command);
        if ("add".equals(args1)) {
            content += getTopTwoValueFromStackAndStoreInR14AndR13()
                    + getR13ValueIntoD()
                    + getLoadR14()
                    + "// execute add" + System.lineSeparator()
                    + "D=D+M" + System.lineSeparator()
                    + getPushValueIntoStack("D");

        } else if ("sub".equals(args1)) {
            content += getTopTwoValueFromStackAndStoreInR14AndR13()
                    + getR13ValueIntoD()
                    + getLoadR14()
                    + "// execute sub" + System.lineSeparator()
                    + "D=D-M" + System.lineSeparator()
                    + getPushValueIntoStack("D");
        } else if ("neg".equals(args1)) {
            content += getTopSPIntoD()
                    + "// execute neg" + System.lineSeparator()
                    + "D=-D" + System.lineSeparator()
                    + getPushValueIntoStack("D");

        } else if ("eq".equals(args1)) {
            content += getTopTwoValueFromStackAndStoreInR14AndR13()
                    + getR13ValueIntoD()
                    + getLoadR14()
                    + "// execute sub" + System.lineSeparator()
                    + "D=D-M" + System.lineSeparator()
                    + "@EQ" + index + System.lineSeparator()
                    + "D;JEQ" + System.lineSeparator()
                    + "// not equal, 0 false, -1 true"
                    + "D=0" + System.lineSeparator()
                    + getPushValueIntoStack("D")
                    + "@END" + index + System.lineSeparator()
                    + "0;JMP" + System.lineSeparator()
                    + "(EQ" + index + ")" + System.lineSeparator()
                    + getPushValueIntoStack("-1")
                    + "(END" + index + ")" + System.lineSeparator();
        } else if ("gt".equals(args1)) {
            content += getTopTwoValueFromStackAndStoreInR14AndR13()
                    + getR13ValueIntoD()
                    + getLoadR14()
                    + "// execute sub" + System.lineSeparator()
                    + "D=D-M" + System.lineSeparator()
                    + "@GT" + index + System.lineSeparator()
                    + "D;JGT" + System.lineSeparator()
                    + "// not equal, 0 false, -1 true"
                    + "D=0" + System.lineSeparator()
                    + getPushValueIntoStack("D")
                    + "@ENDGT" + index + System.lineSeparator()
                    + "0;JMP" + System.lineSeparator()
                    + "(GT" + index + ")" + System.lineSeparator()
                    + getPushValueIntoStack("-1")
                    + "(ENDGT" + index + ")" + System.lineSeparator();
        } else if ("lt".equals(args1)) {
            content += getTopTwoValueFromStackAndStoreInR14AndR13()
                    + getR13ValueIntoD()
                    + getLoadR14()
                    + "// execute sub" + System.lineSeparator()
                    + "D=D-M" + System.lineSeparator()
                    + "@LT" + index + System.lineSeparator()
                    + "D;JLT" + System.lineSeparator()
                    + "// not equal, 0 false, -1 true"
                    + "D=0" + System.lineSeparator()
                    + getPushValueIntoStack("D")
                    + "@ENDLT" + index + System.lineSeparator()
                    + "0;JMP" + System.lineSeparator()
                    + "(LT" + index + ")" + System.lineSeparator()
                    + getPushValueIntoStack("-1")
                    + "(ENDLT" + index + ")" + System.lineSeparator();
        } else if ("and".equals(args1)) {
            content += getTopTwoValueFromStackAndStoreInR14AndR13()
                    + getR13ValueIntoD()
                    + getLoadR14()
                    + "// execute &" + System.lineSeparator()
                    + "D=D&M" + System.lineSeparator()
                    + getPushValueIntoStack("D");
        } else if ("or".equals(args1)) {
            content += getTopTwoValueFromStackAndStoreInR14AndR13()
                    + getR13ValueIntoD()
                    + getLoadR14()
                    + "// execute |" + System.lineSeparator()
                    + "D=D|M" + System.lineSeparator()
                    + getPushValueIntoStack("D");
        } else if ("not".equals(args1)) {
            content += getTopSPIntoD()
                    + "// execute not" + System.lineSeparator()
                    + "D=!D" + System.lineSeparator()
                    + getPushValueIntoStack("D");
        }
        index++;
        writeTranslatorContent(content);
    }

    public void writePush(String command, String vmFileName) throws IOException {
        String content = "//vm command " + command + System.lineSeparator();
        String args1 = ParserV2.getArgs1(command);
        String args2 = ParserV2.getArgs2(command);
        if ("argument".equals(args1)) {
            content += getPushFromStackToRegister("ARG", args2);
        } else if ("local".equals(args1)) {
            content += getPushFromStackToRegister("LCL", args2);
        } else if ("static".equals(args1)) {
            content += "@" + vmFileName + "." + args2 + System.lineSeparator()
                    + "D=M" + System.lineSeparator()
                    + getPushValueIntoStack("D");
        } else if ("constant".equals(args1)) {
            content += "@" + args2 + System.lineSeparator()
                    + "D=A" + System.lineSeparator()
                    + getPushValueIntoStack("D");

        } else if ("this".equals(args1)) {
            content += getPushFromStackToRegister("THIS", args2);

        } else if ("that".equals(args1)) {
            content += getPushFromStackToRegister("THAT", args2);

        } else if ("pointer".equals(args1)) {
            // pointer 映射到3/4， 3+i ，i为0或1
            content += "//get pointer address" + System.lineSeparator()
                    + "@3" + System.lineSeparator()
                    + "D=A" + System.lineSeparator()
                    + "@" + args2 + System.lineSeparator()
                    + "A=D+A" + System.lineSeparator() // A=D+A 以后，A就变成了3或4，就是THIS或者THAT段的base地址
                    + "D=M" + System.lineSeparator()
                    + getPushValueIntoStack("D");

        } else if ("temp".equals(args1)) {
            // 5~12 存储的是temp段的内容
            content += "//get temp address" + System.lineSeparator()
                    + "@5" + System.lineSeparator()
                    + "D=A" + System.lineSeparator()
                    + "@" + args2 + System.lineSeparator()
                    + "A=D+A" + System.lineSeparator()
                    + "D=M" + System.lineSeparator()
                    + getPushValueIntoStack("D");

        }
        writeTranslatorContent(content);
    }

    private String getTopTwoValueFromStackAndStoreInR14AndR13() {
        // 因为栈里面先出来的是y，后出来的是x，所以把x存储在R13中，y存储在R14中，这样执行x+y 或者x-y就没有问题了
        // 然后把x和y都pop出来
        return "// get top two value and tmp store" + System.lineSeparator()
                + getTopSPIntoD() + System.lineSeparator()
                + "// tmp store in R14" + System.lineSeparator()
                + "@R14" + System.lineSeparator()
                + "M=D" + System.lineSeparator()
                + getTopSPIntoD()
                + "// tmp store in R13" + System.lineSeparator()
                + "@R13" + System.lineSeparator()
                + "M=D" + System.lineSeparator()
                ;
    }

    private String getPopFromStackToRegister(String args1, String args2) throws IOException {
        return "// get" + args1 + " final address " + System.lineSeparator()
                + "@" + args1 + System.lineSeparator()
                + "D=M" + System.lineSeparator()
                + "@" + args2 + System.lineSeparator()
                + "A=D+A" + System.lineSeparator()
                + "D=A" + System.lineSeparator()
                + "// tmp store in R13" + System.lineSeparator()
                + "@R13" + System.lineSeparator()
                + "M=D" + System.lineSeparator()
                + getTopSPIntoD()
                + "@R13" + System.lineSeparator()
                + "A=M" + System.lineSeparator()
                + "M=D" + System.lineSeparator();

    }

    private String getTopSPIntoD() {
        return "// get top stack value and make sp minus 1" + System.lineSeparator()
                + "@SP" + System.lineSeparator()
                + "M=M-1" + System.lineSeparator()
                + "A=M" + System.lineSeparator()
                + "D=M" + System.lineSeparator();
    }

    private String getPushFromStackToRegister(String args1, String args2) {
        return "// get " + args1 + "base address" + System.lineSeparator()
                + "@" + args1 + System.lineSeparator()
                + "D=M" + System.lineSeparator()
                + "@" + args2 + System.lineSeparator()
                + "// base address + i" + System.lineSeparator()
                + "A=D+A" + System.lineSeparator()
                + "D=M" + System.lineSeparator()
                + getPushValueIntoStack("D");
    }

    public void writePop(String command, String vmFileName) throws IOException {
        String content = "//vm command " + command + System.lineSeparator();
        String args1 = ParserV2.getArgs1(command);
        String args2 = ParserV2.getArgs2(command);
        if ("argument".equals(args1)) {
            content += getPopFromStackToRegister("ARG", args2);

        } else if ("local".equals(args1)) {
            content += getPopFromStackToRegister("LCL", args2);

        } else if ("static".equals(args1)) {
            // static 段变量，就按照vm文件名.变量名 去操作。
            content += getTopSPIntoD()
                    + "@" + vmFileName + "." + args2 + System.lineSeparator()
                    + "M=D" + System.lineSeparator();

        } else if ("this".equals(args1)) {
            content += getPopFromStackToRegister("THIS", args2);

        } else if ("that".equals(args1)) {
            content += getPopFromStackToRegister("THAT", args2);
        } else if ("pointer".equals(args1)) {
            // pointer 映射到3/4， 3+i ，i为0或1
            content += "//get pointer address" + System.lineSeparator()
                    + "@3" + System.lineSeparator()
                    + "D=A" + System.lineSeparator()
                    + "@" + args2 + System.lineSeparator()
                    + "D=D+A" + System.lineSeparator() // D=D+A 以后，A就变成了3或4，就是THIS或者THAT段的base地址
                    + "//tmp store pointer into R13" + System.lineSeparator()
                    + "@R13" + System.lineSeparator()
                    + "M=D" + System.lineSeparator()
                    + getTopSPIntoD()
                    + "//load pointer address fromR13" + System.lineSeparator()
                    + "@R13" + System.lineSeparator()
                    + "A=M" + System.lineSeparator()
                    + "M=D" + System.lineSeparator()
            ;

        } else if ("temp".equals(args1)) {
            // 5~12 存储的是temp段的内容
            content += "//get temp address" + System.lineSeparator()
                    + "@5" + System.lineSeparator()
                    + "D=A" + System.lineSeparator()
                    + "@" + args2 + System.lineSeparator()
                    + "D=D+A" + System.lineSeparator()
                    + "//store tmp address into R13" + System.lineSeparator()
                    + "@R13" + System.lineSeparator()
                    + "M=D" + System.lineSeparator()
                    + getTopSPIntoD()
                    + "//read tmp address from R13" + System.lineSeparator()
                    + "@R13" + System.lineSeparator()
                    + "A=M" + System.lineSeparator()
                    + "M=D" + System.lineSeparator()
            ;
        }
        writeTranslatorContent(content);

    }

    public void writeLabel(String command, String vmFileName) throws IOException {
        String content = "//vm command " + command + System.lineSeparator();
        String args1 = ParserV2.getArgs1(command);
        content += "(" + args1 + ")" + System.lineSeparator();
        writeTranslatorContent(content);

    }

    public void writeGoto(String command, String vmFileName) throws IOException {
        String content = "//vm command " + command + System.lineSeparator();
        String args1 = ParserV2.getArgs1(command);
        content += "@" + args1 + System.lineSeparator()
                + "0;JMP" + System.lineSeparator();
        writeTranslatorContent(content);

    }

    public void writeFunction(String command, String vmFileName) throws IOException {
        String content = "//vm command " + command + System.lineSeparator();
        String args1 = ParserV2.getArgs1(command); // functionName
        String args2 = ParserV2.getArgs2(command); // localVarCount
        /**
         * 1、声明一个函数标签
         * 2、创建localVarCount 个局部变量
         * 3、将这些变量初始化为0
         */
        content+="("+args1+") // functionName" + System.lineSeparator();
        content+="//init local segment" + System.lineSeparator()
                +"@"+args2+System.lineSeparator()
                +"D=A // store localVarCount to D  "+System.lineSeparator()
                +"(" +vmFileName+args1+"$LOOP)" + System.lineSeparator() // 这里使用fileName+functionName 作为符号标签
                +"D;JEQ" + System.lineSeparator()
                +"D=D-1" + System.lineSeparator()
                +"@"+vmFileName+args1+"$ENDLOOP" + System.lineSeparator()
                +"D;JLT" + System.lineSeparator()
                +getPushValueIntoStack("0")
                +"@"+vmFileName+args1+"$LOOP" + System.lineSeparator()
                +"0;JMP"+ System.lineSeparator()
                +"("+vmFileName+args1+"$ENDLOOP" + System.lineSeparator();


        writeTranslatorContent(content);

    }

    public void writeIf(String command, String vmFileName) throws IOException {
        String content = "//vm command " + command + System.lineSeparator();
        String args1 = ParserV2.getArgs1(command);
        content += getTopSPIntoD()
                + "@" + args1 + System.lineSeparator()
                + "D;JGT";
        writeTranslatorContent(content);


    }

    public String getPushValueIntoStack(String value) {
        // 把一个值写到栈里，同时更新栈指针 sp=sp+1
        return "//push value:" + value + " into stack" + System.lineSeparator()
                + "@SP" + System.lineSeparator()
                + "A=M" + System.lineSeparator()
                + "M=" + value + System.lineSeparator()
                + "@SP" + System.lineSeparator()
                + "M=M+1" + System.lineSeparator();
    }

    private void writeTranslatorContent(String content) throws IOException {
        this.fileWriter.write(content);
        this.fileWriter.flush();
    }
}
