package v2;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

/**
 * 解析命令类型
 *
 * @author donglijie <donglijie@kuaishou.com>
 * Created on 2024-09-08
 */
public class ParserV2 {
    private Scanner scanner;

    private String vmFileName;

    public String getVmFileName() {
        return vmFileName;
    }

    public void setVmFileName(String vmFileName) {
        this.vmFileName = vmFileName;
    }

    public ParserV2(File vmFile, String vmFileName) throws FileNotFoundException {
        this.scanner = new Scanner(vmFile);
        this.vmFileName = vmFileName;
    }

    public boolean hasMoreCommands() {
        return scanner.hasNextLine();
    }

    public static boolean commandValid(String command) {
        String trim = command.trim(); // 去掉前后空格
        // 去掉空格以后，如果为空或者以//开头，则认为是注释，不处理，否则长度不为0 ，就说明是合法的命令。
        return trim.length() != 0 && !trim.startsWith("//");
    }

    public static CommandTypeV2 getCommandType(String command) {
        String trim = command.trim();
        if (trim.startsWith("push")) {
            return CommandTypeV2.C_PUSH;
        } else if (trim.startsWith("pop")) {
            return CommandTypeV2.C_POP;
        } else if (trim.equals("add") || trim.equals("sub") || trim.equals("neg") || trim.equals("eq")
                || trim.equals("gt") || trim.equals("lt") || trim.equals("and") || trim.equals("or")
                || trim.equals("not")) {
            return CommandTypeV2.C_ARITHMETIC;
        } else if (trim.startsWith("call")) {
            return CommandTypeV2.C_CALL;
        } else if (trim.startsWith("return")) {
            return CommandTypeV2.C_RETURN;
        } else if (trim.startsWith("label")) {
            return CommandTypeV2.C_LABEL;
        } else if (trim.startsWith("if-goto")) {
            return CommandTypeV2.C_IF;
        } else if (trim.startsWith("function")) {
            return CommandTypeV2.C_FUNCTION;
        }else if (trim.startsWith("goto")) {
            return CommandTypeV2.C_GOTO;
        }

        throw new RuntimeException("不支持的命令：" + command);
    }

    public String advance() {
        // 获取命令，这里就把注释给去掉
        String command = scanner.nextLine();
        if (command.contains("//")) {
            command = command.substring(0, command.indexOf("//")).trim();
        }
        return command;
    }

    public static String getArgs1(String command){
        String[] commands = command.split(" ");
        if (commands.length ==1){
            // 如果是算术命令，直接返回命令本身
            return commands[0];
        }
        return commands[1];

    }
    public static String getArgs2(String command){
        String[] commands = command.split(" ");
        return commands[2];
    }
    public void close(){
        scanner.close();
    }
}
