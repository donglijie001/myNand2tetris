package com.assembler;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 * @author donglijie <donglijie@kuaishou.com>
 * Created on 2024-06-22
 */
@SuppressWarnings("checkstyle:VisibilityModifier")
public class Parser {
    File file;
    Scanner scanner;
    int address;
    List<String> validInstructionSet;
    String currentCommand;

    public Parser(File file) throws FileNotFoundException {
        this.file = file;
        this.scanner = new Scanner(file);
        this.validInstructionSet = new ArrayList<>();
    }

    public boolean hasMoreCommands() {
        /*if (this.scanner.hasNextLine()) {
            return true;
        } else {
            return false;
        }*/
        //参考代码里是这样，完全没有必要
        return this.scanner.hasNextLine();
    }

    public void advance() {
        // 解析一条新的命令
        if (hasMoreCommands()) {
            /* when we don't get the command, loop*/
            do {
                this.currentCommand = this.scanner.nextLine();
            } while (!getCommand());
            // when we get a a-command or c-command, let the address++;
            if (this.commandType().equals(CommandType.A_COMMAND) || this.commandType().equals(CommandType.C_COMMAND)) {
                this.address++;
            }
            validInstructionSet.add(this.currentCommand);

        } else {
            // 没有命令后关闭链接。
            this.scanner.close();
        }
    }

    private boolean getCommand() {
        String stringLine = this.currentCommand;
        /* remove the space line*/
        if (stringLine.equals("")) {
            return false;
        }
        /* Remove the comment line*/
        String headChar = stringLine.trim().substring(0, 2); // get the first two characters
        if (headChar.equals("//")) {
            return false;
        }
        /* Throw the comment away*/
        if (stringLine.contains("//")) {
            this.currentCommand = stringLine.substring(0, stringLine.indexOf("//")).trim();
            return true;
        }
        this.currentCommand = stringLine.trim();
        return true;
    }

    public CommandType commandType() {
        if (this.currentCommand.substring(0, 1).equals("@")) {
            return CommandType.A_COMMAND;
        } else if (this.currentCommand.substring(0, 1).equals("(")) {
            return CommandType.L_COMMAND;
        } else if (this.currentCommand.contains(";") || this.currentCommand.contains("=")) {
            return CommandType.C_COMMAND;
        } else {
            return CommandType.UNKNOW;
        }
    }

    /**
     * Judge whether the symbol is integer symbol
     *
     * @param symbol
     * @return
     */
    public boolean isDigit(String symbol) {
        for (int i = 0; i < symbol.length(); i++) {
            if (!Character.isDigit(symbol.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    /**
     * Padding the string to get the 15 bit address
     *
     * @param str
     * @return
     */
    public String paddingZero(String str) {
        while (str.length() <= 15) {
            str = "0" + str;
        }
        return str;
    }

    @SuppressWarnings("checkstyle:MagicNumber")
    public String symbol() {
        /**
         * basically, whatever the command is a-command or l-command, if the symbol is represented
         * by address, we return the binary form of the address, if the symbol is represented by
         * string, we return the string.
         * When we first scan the file, if we get the binary string of the address we don't do
         * anything, if we get the string symbol we add the string and it's binary address to the
         * symbol table.
         * When we second scan the file, if we get the binary string of the address we translate it
         * , if we get the string symbol we get it's address from hash table.
         */
        String subStr = null;
        if (commandType().equals(CommandType.A_COMMAND)) {
            subStr = this.currentCommand.substring(1, this.currentCommand.length());
        }
        if (subStr == null) {
            return null;
        }
        Long address = Long.parseLong(subStr);
        String addressStr = Long.toBinaryString(address);
        return paddingZero(addressStr);
    }

    /**
     * get the dest symbol of c command
     *
     * @return dest if the command has dest domain
     * ""   if the command has not dest domain
     * null if the command is not the c command
     */
    public String dest() {
        if (commandType().equals(CommandType.C_COMMAND)) {
            String command = this.currentCommand;
            if (command.contains("=")) {
                return command.substring(0, command.indexOf("="));
            } else {
                return "";
            }
        }
        return null;
    }

    /**
     * get the comp domain of the c command
     *
     * @return comp if the command has comp domain
     * ""   if the command has not comp domain
     * null if the command is not the c command
     */
    public String comp() {
        if (commandType().equals(CommandType.C_COMMAND)) {
            String command = this.currentCommand;
            if (command.contains("=") && command.contains(";")) {
                return command.substring(command.indexOf("=") + 1, command.indexOf(";"));
            } else if (command.contains(";")) {
                return command.substring(0, command.indexOf(";"));
            } else if (command.contains("=")) {
                return command.substring(command.indexOf("=") + 1, command.length());
            } else {
                return "";
            }
        }
        return null;
    }

    /**
     * get the jump domain of the c command
     *
     * @return jump if the command has jump domain
     * ""   if the command has not the jump domain
     * null if the command is not the c command
     */
    public String jump() {
        if (commandType().equals(CommandType.C_COMMAND)) {
            String command = this.currentCommand;
            if (command.contains(";")) {
                return command.substring(command.indexOf(";") + 1, command.length());
            } else {
                return "";
            }
        }
        return null;
    }

    public void printInstructions() {
        for (int i = 0; i < this.validInstructionSet.size(); i++) {
            System.out.println(this.validInstructionSet.get(i));
        }
    }
}
