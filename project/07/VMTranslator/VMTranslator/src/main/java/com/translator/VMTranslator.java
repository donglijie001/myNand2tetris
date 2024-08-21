package com.translator;

import java.io.File;
import java.io.IOException;

/**
 * @author donglijie <donglijie@kuaishou.com>
 * Created on 2024-07-21
 */
public class VMTranslator {

    public static void main(String[] args) throws IOException {
        System.out.println("VM Translator begin!");
        String vmFileFullPath = args[0];
        // 根据输入的全路径，在同级目录目录下生成同名的asm文件，放便使用测试
        String vmFilePath = vmFileFullPath.substring(0, vmFileFullPath.lastIndexOf(File.separator) + 1);
        String vmFileName = vmFileFullPath.substring(vmFileFullPath.lastIndexOf(File.separator) + 1);
        String asmFilePath = vmFilePath + vmFileName.substring(0, vmFileName.lastIndexOf(".")) + ".asm";
        File asmFile = new File(asmFilePath);
        // 删除asmFile 方便多次运行。
        if (asmFile.exists()) {
            asmFile.delete();
            System.out.println("delete asm file");
        }
        Parser parser = new Parser(new File(vmFileFullPath));
        // 这里设置fileName是为了
        parser.setVmFileName(vmFileName);
        CodeWriter codeWriter = new CodeWriter(asmFile);
        translate(parser, codeWriter);
        System.out.println("VM Translator end!");
    }

    private static void translate(Parser parser, CodeWriter codeWriter) throws IOException {
        do {
            // 读取一行，
            parser.advance();
            // 获取命令类型
            CommandType commandType = parser.commandType();
            if (CommandType.C_POP.equals(commandType) || CommandType.C_PUSH.equals(commandType)) {
                codeWriter.writePushPop(parser);
            } else if (CommandType.C_ARITHMETIC.equals(commandType)) {
                codeWriter.writeArithmetic(parser);
            }
            System.out.println(parser.getCommand() + ":commandType:" + commandType);


        } while (parser.hasMoreCommands());
        // 关闭输入文件
        parser.close();
        // 关闭输出文件
        codeWriter.close();
    }
}