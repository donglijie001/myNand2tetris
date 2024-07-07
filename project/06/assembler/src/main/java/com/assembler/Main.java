package com.assembler;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

/**
 * @author donglijie <donglijie@kuaishou.com>
 * Created on 2024-06-22
 */
public class Main {
    public static void main(String[] args) throws IOException {
        System.out.println("begin parse");
        String asmFilePath = args[0];
        String asmFileName = asmFilePath.substring(asmFilePath.lastIndexOf(File.separator) + 1);
        String hackFilePath = System.getProperty("user.dir") + File.separator + asmFileName.substring(0, asmFileName.lastIndexOf(".")) + ".hack";
        System.out.println("hackFilePath:" + hackFilePath);
        Parser parser = new Parser(new File(asmFilePath));
        Code code = new Code();
        // 为了可以多次运行，如果编译后的文件存在的话，就先删除
        File hackFile = new File(hackFilePath);
        if (hackFile.exists()) {
            hackFile.delete();
            System.out.println("delete hackFile");
        }
        try (FileWriter fileWriter = new FileWriter(hackFilePath)) {
            while (parser.hasMoreCommands()) {
                // 读取一行
                parser.advance();
                CommandType commandType = parser.commandType();
                String binary = "";
                if (CommandType.C_COMMAND.equals(commandType)) {
                    // 进入这里之前，保证了命令类型是c command，所以parser在解析的时候，不会返回null。
                    String comp = code.comp(parser.comp());
                    String dest = code.dest(parser.dest());
                    String jump = code.jump(parser.jump());
                    binary = "111" + comp + dest + jump;

                } else if (CommandType.A_COMMAND.equals(commandType)) {
                    binary = parser.symbol();
                }
                System.out.println(binary);
                fileWriter.write(binary);
                // 写入换行符
                fileWriter.write(System.lineSeparator());
            }
        }

        System.out.println("parse end");
    }
}