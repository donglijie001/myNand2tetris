package translator;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

/**
 * @author donglijie <donglijie@kuaishou.com>
 * Created on 2024-07-21
 */
public class Parser {
    private Scanner scanner;
    private String command;
    private String vmFileName;

    public String getVmFileName() {
        return vmFileName;
    }

    public void setVmFileName(String vmFileName) {
        this.vmFileName = vmFileName;
    }

    public Scanner getScanner() {
        return scanner;
    }

    public String getCommand() {
        return command;
    }

    public Parser(File file) throws FileNotFoundException {
        this.scanner = new Scanner(file);
    }

    private boolean getValidCommand() {
        String currentLine = this.command.trim();
        // 对取一行文件内容，有可能是空行也有可能是注释，所以需要判断
        if (currentLine.equals("")) {
            return false;
        }
        if (currentLine.startsWith("//")) {
            return false;
        }
        if (currentLine.contains("//")) {
            // 既有命令又有注释，这里去掉注释
            this.command = currentLine.substring(0, currentLine.indexOf("//")).trim();
            return true;
        }
        this.command = currentLine;
        return true;
    }

    public void advance() {
        if (this.hasMoreCommands()) {
            do {
                // 去掉两头空格
                this.command = this.scanner.nextLine().trim();
            } while (!getValidCommand());
        }
    }

    public boolean hasMoreCommands() {
        return this.scanner.hasNextLine();
    }

    public CommandType commandType() {
        // 把命令按照空格进行分割,因为vm命令有多种格式
        String[] strs = this.command.split(" ");
        switch (strs[0]) {
            case "add":
            case "sub":
            case "neg":
            case "eq":
            case "gt":
            case "lt":
            case "and":
            case "or":
            case "not":
                return CommandType.C_ARITHMETIC;
            case "push":
                return CommandType.C_PUSH;
            case "pop":
                return CommandType.C_POP;
            case "label":
                return CommandType.C_LABEL;
            case "goto":
                return CommandType.C_GOTO;
            case "if-goto":
                return CommandType.C_IF;
            case "function":
                return CommandType.C_FUNCTION;
            case "call":
                return CommandType.C_CALL;
            case "return":
                return CommandType.C_RETURN;
            default:
                break;

        }

        return null;
    }

    public String arg1() {
        CommandType commandType = commandType();
        if (CommandType.C_ARITHMETIC.equals(commandType)) {
            return command.trim();
        } else if (CommandType.C_PUSH.equals(commandType) || CommandType.C_POP.equals(commandType)
                || CommandType.C_LABEL.equals(commandType) || CommandType.C_GOTO.equals(commandType)
                || CommandType.C_IF.equals(commandType) || CommandType.C_FUNCTION.equals(commandType)
                || CommandType.C_CALL.equals(commandType)
        ) {
            return command.split(" ")[1].trim();
        }
        return null;
    }

    public String arg2() {
        CommandType commandType = commandType();
        if (CommandType.C_PUSH.equals(commandType) || CommandType.C_POP.equals(commandType)
                || CommandType.C_FUNCTION.equals(commandType) || CommandType.C_CALL.equals(commandType)) {
            return command.split(" ")[2].trim();
        } else {
            return null;
        }
    }

    public void close() {
        this.scanner.close();
        this.command = null;
    }

}
