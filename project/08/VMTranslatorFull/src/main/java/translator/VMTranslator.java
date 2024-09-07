package translator;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author donglijie <donglijie@kuaishou.com>
 * Created on 2024-07-21
 */
public class VMTranslator {

    public static void main(String[] args) throws IOException {
        System.out.println("VM Translator begin!");
        String vmFileFullPath = args[0];
        File file = new File(vmFileFullPath);
        if (file.isFile()) {
            translatorSimpleFile(vmFileFullPath);
        } else {
            translatorDirectory(vmFileFullPath);
        }

        System.out.println("VM Translator end!");
    }

    private static void translatorDirectory(String vmFileDirectory) throws IOException {
        // add/bb 路径类似这种，获取bb，最终编译的文件路径是add/bb/bb.asm
        String vmDirectoryLastPath = vmFileDirectory.substring(vmFileDirectory.lastIndexOf(File.separator) + 1);
        String asmFileName = vmDirectoryLastPath + ".asm";
        File asmFile = new File(vmFileDirectory + File.separator + asmFileName);
        File directory = new File(vmFileDirectory);

        File[] files = directory.listFiles();
        if (files == null) {
            System.out.println("translatorDirectory error!");
            return;
        }
        if (asmFile.exists()) {
            asmFile.delete();
            System.out.println("delete asm file");
        }
        List<File> filterVmFiles = Arrays.stream(files)
                .filter(file -> file.getAbsolutePath().substring(file.getAbsolutePath().lastIndexOf(".") + 1).equals("vm"))
                .collect(Collectors.toList());
        CodeWriter codeWriter = new CodeWriter(asmFile);
        // 开始解析文件, Sys.vm 优先处理
        for (File file : filterVmFiles) {
            if (file.getName().equals("Sys.vm")) {
                translatorInner(codeWriter, file, getVMFileNameWithoutExtension(file.getAbsolutePath()));
            }
        }

        for (File file : filterVmFiles) {
            if (!file.getName().equals("Sys.vm")) {
                translatorInner(codeWriter, file, getVMFileNameWithoutExtension(file.getAbsolutePath()));
            }
        }
        codeWriter.close();

    }

    private static String getVMFileNameWithoutExtension(String vmFileFullPath) {
        return vmFileFullPath.substring(vmFileFullPath.lastIndexOf(File.separator) + 1);
    }

    private static void translatorSimpleFile(String vmFileFullPath) throws IOException {
        // 根据输入的全路径，在同级目录目录下生成同名的asm文件，放便使用测试
        String vmFilePath = vmFileFullPath.substring(0, vmFileFullPath.lastIndexOf(File.separator) + 1);
        String vmFileNameWithoutExtension = getVMFileNameWithoutExtension(vmFileFullPath);
        String asmFilePath = vmFilePath + File.separator + vmFileNameWithoutExtension + ".asm";
        File asmFile = new File(asmFilePath);
        File vmFile = new File(vmFileFullPath);
        CodeWriter codeWriter = new CodeWriter(asmFile);
        // 删除asmFile 方便多次运行。
        if (asmFile.exists()) {
            asmFile.delete();
            System.out.println("delete asm file");
        }
        translatorInner(codeWriter, vmFile, vmFileNameWithoutExtension);
        codeWriter.close();
    }

    private static void translatorInner(CodeWriter codeWriter, File vmFile, String vmFileName) throws IOException {
        Parser parser = new Parser(vmFile);
        // 这里设置fileName是为了生成全局的静态变量使用
        parser.setVmFileName(vmFileName);
        codeWriter.callStack.push(vmFileName); // 把vmFileName 入栈，方便后面使用,避免栈空
        translate(parser, codeWriter);
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
            } else if (CommandType.C_LABEL.equals(commandType)) {
                codeWriter.writeLabel(parser);
            } else if (CommandType.C_GOTO.equals(commandType)) {
                codeWriter.writeGoto(parser);
            } else if (CommandType.C_IF.equals(commandType)) {
                codeWriter.writeIf(parser);
            } else if (CommandType.C_FUNCTION.equals(commandType)) {
                codeWriter.writeFunction(parser);
            } else if (CommandType.C_RETURN.equals(commandType)) {
                codeWriter.writeReturn(parser);
            } else if (CommandType.C_CALL.equals(commandType)) {
                codeWriter.writeCall(parser);

            }
            System.out.println(parser.getCommand() + ":commandType:" + commandType);


        } while (parser.hasMoreCommands());
        // 关闭输入文件
        parser.close();
        // 关闭输出文件

    }
}