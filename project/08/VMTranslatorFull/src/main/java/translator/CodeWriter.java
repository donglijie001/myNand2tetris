package translator;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

/**
 * @author donglijie <donglijie@kuaishou.com>
 * Created on 2024-07-21
 */
public class CodeWriter {
    private FileWriter fileWriter;
    private int i = 0;
    // 用来区分符号链接，比如一个文件里可能会有很多个eq命令，加上这个是为了进行区分，实际上可以不用，
    // 我参考的代码里有这个，先暂时保留这个


    public FileWriter getFileWriter() {
        return fileWriter;
    }

    public CodeWriter(File outFile) throws IOException {
        this.fileWriter = new FileWriter(outFile);
    }

    public void writeArithmetic(Parser parser) throws IOException {
        // 这里的栈顶是不存数据的，所以需要先将栈顶减1
        String command = parser.getCommand();
        String commandLabel = parser.arg1();
        String content = "//vm " + command + System.lineSeparator();
        switch (commandLabel) {
            case "add":
                content = getTopTwoElementOfStackAndStoreThemInReg() // 将两个元素存储到R13和R14寄存器里
                        + getR13AddR14() // R13 和R14 元素相加
                        + getPutValueIntoStack("D");
                break;
            case "sub": // s-y
                content = getTopTwoElementOfStackAndStoreThemInReg() // 将两个元素存储到R13和R14寄存器
                        + getR13MinusR14()
                        + getPutValueIntoStack("D");
                break;
            case "neg": // -y
                content = getTopSP()  // 获取栈顶元素
                        + "D=-D" + System.lineSeparator() // 取反
                        + getPutValueIntoStack("D") // 入栈
                ;
                break;
            case "eq": // x==y
                // 判断是否相等是根据跳转指令来塞值的
                content = getTopTwoElementOfStackAndStoreThemInReg()
                        + getR13MinusR14() // R13 -R14 ,
                        + "@EQ" + i + System.lineSeparator()
                        + "D;JEQ" + System.lineSeparator()
                        + getPutValueIntoStack("0") + System.lineSeparator()
                        + "@ENDEQ" + i + System.lineSeparator()
                        + "0;JMP" + System.lineSeparator()
                        + "(EQ" + i + ")" + System.lineSeparator()
                        + getPutValueIntoStack("-1") + System.lineSeparator()
                        + "(ENDEQ" + (i++) + ")" + System.lineSeparator();
                break;
            case "gt": // x>y
                content = getTopTwoElementOfStackAndStoreThemInReg()
                        + getR13MinusR14() // R13 -R14 ,
                        + "@GT" + i + System.lineSeparator()
                        + "D;JGT" + System.lineSeparator()
                        + getPutValueIntoStack("0") + System.lineSeparator()
                        + "@ENDGT" + i + System.lineSeparator()
                        + "0;JMP" + System.lineSeparator()
                        + "(GT" + i + ")" + System.lineSeparator()
                        + getPutValueIntoStack("-1") + System.lineSeparator()
                        + "(ENDGT" + (i++) + ")" + System.lineSeparator();
                break;
            case "lt": //x<y
                content = getTopTwoElementOfStackAndStoreThemInReg()
                        + getR13MinusR14() // R13 -R14 ,
                        + "@LT" + i + System.lineSeparator()
                        + "D;JLT" + System.lineSeparator()
                        + getPutValueIntoStack("0") + System.lineSeparator()
                        + "@ENDLT" + i + System.lineSeparator()
                        + "0;JMP" + System.lineSeparator()
                        + "(LT" + i + ")" + System.lineSeparator()
                        + getPutValueIntoStack("-1") + System.lineSeparator()
                        + "(ENDLT" + (i++) + ")" + System.lineSeparator();
                break;
            case "and": // x and y
                content = getTopTwoElementOfStackAndStoreThemInReg()
                        + getR13()
                        + "@R14" + System.lineSeparator()
                        + "D=D&M" + System.lineSeparator()
                        + getPutValueIntoStack("D");
                break;
            case "or": // x Or y
                content = getTopTwoElementOfStackAndStoreThemInReg()
                        + getR13()
                        + "@R14" + System.lineSeparator()
                        + "D=D|M" + System.lineSeparator()
                        + getPutValueIntoStack("D");
                break;
            case "not": // Not y
                content = getTopSP()
                        + "D=!D" + System.lineSeparator()
                        + getPutValueIntoStack("D");
                break;
            default:
                break;
        }
        writeTranslatedCommand(content);
    }

    private String getTopSP() {
        // 取出栈顶元素，并将栈顶减1
        return "// get the  top element of stack and make sp minus 1" + System.lineSeparator()
                + "@SP" + System.lineSeparator()
                + "M=M-1" + System.lineSeparator() // 栈顶减1
                + "A=M" + System.lineSeparator()
                + "D=M" + System.lineSeparator();
    }

    // 获取栈顶的两个元素，并将它们存储在寄存器中，书里面R13和R14以及R15
    private String storeInReg(String registerName) {
        return "// store the element in register:" + registerName + System.lineSeparator()
                + "@" + registerName + System.lineSeparator()
                + "M=D" + System.lineSeparator();
    }

    private String getR13() {
        return "@R13" + System.lineSeparator()
                + "D=M" + System.lineSeparator();
    }

    private String getR13AddR14() {
        return "// R13 add  R14" + System.lineSeparator()
                + getR13()
                + "@R14" + System.lineSeparator()
                + "D=D+M" + System.lineSeparator();
    }

    private String getR13MinusR14() {
        return "// R13 minus  R14" + System.lineSeparator()
                + getR13()
                + "@R14" + System.lineSeparator()
                + "D=D-M" + System.lineSeparator();
    }

    private String getTopTwoElementOfStackAndStoreThemInReg() {
        return getTopSP() + storeInReg("R14") + getTopSP() + storeInReg("R13");
    }

    /* 下面这个是我最开始写的，没有使用临时寄存器，但是感觉用临时寄存器会好一些
    而且里面有一些重复的逻辑，比如获取栈顶元素，等等都可以抽取出来。
    */
    public void writeArithmetic1(Parser parser) throws IOException {
        // 这里的栈顶是不存数据的，所以需要先将栈顶减1
        String command = parser.getCommand();
        String commandLabel = parser.arg1();
        if ("add".equals(commandLabel)) {

            String content = "//vm " + command + System.lineSeparator()
                    + "@SP" + System.lineSeparator()
                    + "M=M-1" + System.lineSeparator() // 栈顶减1
                    + "A=M" + System.lineSeparator()
                    + "D=M" + System.lineSeparator() // 取出栈顶元素
                    + "@SP" + System.lineSeparator()
                    + "M=M-1" + System.lineSeparator()
                    + "@SP" + System.lineSeparator()
                    + "A=M" + System.lineSeparator()
                    + "D=D+M" + System.lineSeparator() // 取出栈顶元素和第一个元素相加
                    + "@SP" + System.lineSeparator()
                    + "A=M" + System.lineSeparator()
                    + "M=D" + System.lineSeparator() // 入栈
                    + "@SP" + System.lineSeparator()
                    + "M=M+1" + System.lineSeparator(); // 栈顶元素加1
            writeTranslatedCommand(content);
        }
    }

    private String getPushByArg(String arg1, String arg2) {
        // push 就是入栈
        return "@" + arg1 + System.lineSeparator()
                + "D=M" + System.lineSeparator()
                + "@" + arg2 + System.lineSeparator()
                + "A=A+D" + System.lineSeparator()
                + "D=M" + System.lineSeparator()
                + getPutValueIntoStack("D");
    }

    private String getPopByArg(String arg1, String arg2) {
        return "@" + arg1 + System.lineSeparator()
                + "D=M" + System.lineSeparator()
                + "@" + arg2 + System.lineSeparator()
                + "D=A+D" + System.lineSeparator()
                + storeInReg("R13")
                + getTopSP()
                + "@R13" + System.lineSeparator()
                + "A=M" + System.lineSeparator()
                + "M=D" + System.lineSeparator();
    }


    public void writePushPop(Parser parser) throws IOException {
        CommandType commandType = parser.commandType();
        String command = parser.getCommand();
        SegmentType segmentType = SegmentType.getSegmentType(parser.arg1());
        if (segmentType == null) {
            throw new RuntimeException("unknown segmentType" + parser.arg1());
        }
        String arg2 = parser.arg2();
        if (!(CommandType.C_POP.equals(commandType) || CommandType.C_PUSH.equals(commandType))) {
            // 不是pop或者push直接返回
            return;
        }
        String content = "//vm " + command + System.lineSeparator();
        if (CommandType.C_PUSH.equals(commandType)) {
            switch (segmentType) {
                case CONSTANT:
                    content += "@" + arg2 + System.lineSeparator()
                            + "D=A" + System.lineSeparator()
                            + getPutValueIntoStack("D");

                    break;
                case LOCAL:
                    content += getPushByArg("LCL", arg2);
                    break;
                case ARGUMENT:
                    content += getPushByArg("ARG", arg2);
                    break;
                case THIS:
                    content += getPushByArg("THIS", arg2);
                    break;
                case THAT:
                    content += getPushByArg("THAT", arg2);
                    break;
                case STATIC:
                    // static 段，在翻译时的变量名是文件名+ . + index
                    content += "@" + parser.getVmFileName() + "." + arg2 + System.lineSeparator()
                            + "D=M" + System.lineSeparator()
                            + getPutValueIntoStack("D");
                    break;
                case TEMP:
                    /* int tmpAddr = 5 + Integer.parseInt(arg2);
                    content = "@" + tmpAddr + System.lineSeparator()
                            + "D=M" + System.lineSeparator()
                            + getPutValueIntoStack("D");*/
                    content += "@R5" + System.lineSeparator()  // 这种方式和下面POINTER一样。
                            + "D=A" + System.lineSeparator()
                            + "@" + arg2 + System.lineSeparator()
                            + "A=D+A" + System.lineSeparator()
                            + "D=M" + System.lineSeparator()
                            + getPutValueIntoStack("D");
                    break;
                case POINTER:
                    content += "@THIS" + System.lineSeparator()
                            + "D=A" + System.lineSeparator() // 先吧this 的地址放到D寄存器里，然后，再看arg2 有可能为0
                            // 也有可能为1， 为0 ，
                            + "@" + arg2 + System.lineSeparator()
                            + "A=D+A " + System.lineSeparator() // 如果为0， A的值就是This寄存器的地址，否则就是That寄存器的地址
                            + "D=M" + System.lineSeparator() // 这一步就this 或者that寄存器里的值存到了that寄存器，感觉好绕呀。
                            + getPutValueIntoStack("D");
                    // 感觉用下面这种方式更简单。先暂时用上面的，方便和参考代码对比。
                    /*content = "0".equals(arg2) ? "@THIS" : "@THAT" + System.lineSeparator()
                            + "D=M" + System.lineSeparator()
                            + getPutValueIntoStack("D");*/
                    break;
                default:
                    break;

            }

        } else if (CommandType.C_POP.equals(commandType)) {
            switch (segmentType) {
                case LOCAL:
                    content += getPopByArg("LCL", arg2);

                    break;
                case ARGUMENT:
                    content += getPopByArg("ARG", arg2);
                    break;
                case THIS:
                    content += getPopByArg("THIS", arg2);
                    break;
                case THAT:
                    content += getPopByArg("THAT", arg2);
                    break;
                case STATIC:
                    content += getTopSP()
                            + "@" + parser.getVmFileName() + "." + arg2 + System.lineSeparator()
                            + "M=D" + System.lineSeparator();
                    break;
                case TEMP:
                    content += "@R5" + System.lineSeparator()  // 这种方式和下面POINTER一样。
                            + "D=A" + System.lineSeparator()
                            + "@" + arg2 + System.lineSeparator()
                            + "D=D+A" + System.lineSeparator()
                            + storeInReg("R13")
                            + getTopSP()
                            + "@R13" + System.lineSeparator()
                            + "A=M" + System.lineSeparator()
                            + "M=D" + System.lineSeparator();
                    break;
                case POINTER:
                    content += "@THIS" + System.lineSeparator()
                            + "D=A" + System.lineSeparator() // 先吧this 的地址放到D寄存器里，然后，再看arg2 有可能为0
                            // 也有可能为1， 为0 ，
                            + "@" + arg2 + System.lineSeparator()
                            + "D=D+A " + System.lineSeparator() // 如果为0， A的值就是This寄存器的地址，否则就是That寄存器的地址
                            + storeInReg("R13")
                            + getTopSP()
                            + "@R13" + System.lineSeparator()
                            + "A=M" + System.lineSeparator()
                            + "M=D" + System.lineSeparator();
                    break;
                default:
                    break;
            }
        }
        writeTranslatedCommand(content);
    }

    private String getPutValueIntoStack(String value) {
        // 下面这一段就是生成把数据写入栈里，并更新sp指针的值的代码，sp是栈顶指针，且栈顶指针对应的位置，并没有存数据
        return "// push the value into stack" + value + System.lineSeparator()
                + "@SP" + System.lineSeparator()
                + "A=M" + System.lineSeparator()
                + "M=" + value + System.lineSeparator()
                + "@SP" + System.lineSeparator()
                + "M=M+1" + System.lineSeparator();
    }

    public void close() throws IOException {
        this.fileWriter.close();
    }

    public void writeLabel(Parser parser) throws IOException {
        String command = parser.getCommand();
        String label = parser.arg1();
        String content = "//vm" + command + System.lineSeparator()
                + "(" + label + ")" + System.lineSeparator();
        writeTranslatedCommand(content);
    }

    public void writeGoto(Parser parser) throws IOException {
        String command = parser.getCommand();
        String label = parser.arg1();
        String content = "//vm" + command + System.lineSeparator()
                + "@" + label + System.lineSeparator()
                + "0;JMP" + System.lineSeparator();
        writeTranslatedCommand(content);

    }

    public void writeIf(Parser parser) throws IOException {
        String command = parser.getCommand();
        String label = parser.arg1();
        String content = "//vm" + command + System.lineSeparator()
                + getTopSP()
                + "@" + label + System.lineSeparator()
                + "D;JNE" + System.lineSeparator();
        writeTranslatedCommand(content);
    }

    private void writeTranslatedCommand(String content) throws IOException {
        this.fileWriter.write(content);
        this.fileWriter.flush();
    }

    private void writeInit() {
        String content = "//vm init program" + System.lineSeparator()
                + "";
    }


}
