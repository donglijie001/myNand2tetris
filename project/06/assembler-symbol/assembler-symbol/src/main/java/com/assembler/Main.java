package com.assembler;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

/**
 * @author donglijie <donglijie@kuaishou.com>
 * Created on 2024-06-22
 */
public class Main {
    private static int freeVarAddress = 16;

    public static void main(String[] args) throws IOException {
        System.out.println("begin parse");
        String asmFilePath = args[0];
        String asmFileName = asmFilePath.substring(asmFilePath.lastIndexOf(File.separator) + 1);
        String hackFilePath = System.getProperty("user.dir") + File.separator + asmFileName.substring(0, asmFileName.lastIndexOf(".")) + ".hack";
        System.out.println("hackFilePath:" + hackFilePath);
        Parser parser = new Parser(new File(asmFilePath));
        SymbolTable symbolTable = new SymbolTable();
        // 为了可以多次运行，如果编译后的文件存在的话，就先删除
        File hackFile = new File(hackFilePath);
        if (hackFile.exists()) {
            hackFile.delete();
            System.out.println("delete hackFile");
        }
        // 第一遍，遍历符号表
        firstScan(parser, symbolTable);
        secondScan(hackFilePath, parser, symbolTable);
        System.out.println("parse end");
    }

    private static void firstScan(Parser parser, SymbolTable symbolTable) {
        do {
            // 读取一行
            parser.advance();
            CommandType commandType = parser.commandType();
            if (CommandType.L_COMMAND.equals(commandType)) {
                // 把符号存到符号表里
                symbolTable.addEntry(parser.currentCommand.substring(1, parser.currentCommand.length() - 1), parser.address + 1);
            }
        } while (parser.hasMoreCommands());
    }

    private static void secondScan(String hackFilePath, Parser parser, SymbolTable symbolTable) {
        Code code = new Code();
        try (FileWriter fileWriter = new FileWriter(hackFilePath)) {
            for (String instruction : parser.validInstructionSet) {
                parser.currentCommand = instruction;
                CommandType commandType = parser.commandType();
                String binary = "";
                switch (commandType) {
                    case A_COMMAND:
                        // 获取命令内容，去掉@符号
                        String commandContent = parser.currentCommand.substring(1);
                        if (parser.isDigit(commandContent)) {
                            // 如果是数字，则直接转换成二进制
                            binary = parser.symbol();
                        } else {
                            int address = 0;
                            // 不是数字，就判断符号表里是否已经包含这个符号或者变量。
                            if (symbolTable.contains(commandContent)) {
                                address = symbolTable.getAddress(commandContent);
                            } else {
                                // 如果是变量，第一次遇到，就将其放到符号符号表
                                symbolTable.addEntry(commandContent, freeVarAddress);
                                address = freeVarAddress++;
                            }
                            binary = parser.paddingZero(Integer.toBinaryString(address));
                        }
                        fileWriter.write(binary);
                        // 写入换行符
                        fileWriter.write(System.lineSeparator());
                        fileWriter.flush();
                        break;
                    case C_COMMAND:
                        // 进入这里之前，保证了命令类型是c command，所以parser在解析的时候，不会返回null。
                        String comp = code.comp(parser.comp());
                        String dest = code.dest(parser.dest());
                        String jump = code.jump(parser.jump());
                        binary = "111" + comp + dest + jump;
                        fileWriter.write(binary);
                        // 写入换行符
                        fileWriter.write(System.lineSeparator());
                        fileWriter.flush();
                        break;
                    case L_COMMAND:
                        System.out.println("l_command" + parser.currentCommand + "skip");
                        break;
                    default:
                        break;
                }
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}