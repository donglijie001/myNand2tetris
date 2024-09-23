package v2;

import java.io.File;
import java.io.IOException;

/**
 * 看了别人实现的代码，现在自己重新手写一遍
 *
 * @author donglijie <donglijie@kuaishou.com>
 * Created on 2024-09-08
 */
public class VMTranslatorV2 {
    public static void main(String[] args) throws IOException {
        System.out.println("VM Translator begin!");
        if (args.length != 1) {
            System.out.println("args illegal, VM Translator stop");
            return;
        }
        String vmFullPath = args[0];
        File vmFullPathFile = new File(vmFullPath);
        // 路径有可能是文件，也有可能是文件夹
        if (vmFullPathFile.isFile()) {
            translatorSimpleFile(vmFullPathFile);
        } else {

        }
        System.out.println("VM Translator end!");

    }

    public static String getVmFileNameContentSuffix(String vmFileFullPath) {
        String[] split = vmFileFullPath.split(File.separator);
        return split[split.length - 1];
    }

    public static String getVmFilePath(String vmFileFullPath) {
        return vmFileFullPath.substring(0, vmFileFullPath.lastIndexOf(File.separator));
    }

    public static void translatorSimpleFile(File vmFullPathFile) throws IOException {
        String vmFileNameContentSuffix = getVmFileNameContentSuffix(vmFullPathFile.getAbsolutePath());
        // vm 文件是以 .vm 结尾，所以可以直接截取
        String vmFileName = vmFileNameContentSuffix.substring(0, vmFileNameContentSuffix.length() - 3);
        String asmFileName = vmFileName;
        String asmFileDir = getVmFilePath(vmFullPathFile.getAbsolutePath());
        String asmFileFullPath = asmFileDir + File.separator + asmFileName + ".asm";
        System.out.println();
        File asmFile = new File(asmFileFullPath);
        if (asmFile.exists()) {
            asmFile.delete();
        }
        CodeWriterV2 codeWriter = new CodeWriterV2(asmFile);
        ParserV2 parser = new ParserV2(vmFullPathFile, vmFileName);
        translatorInner(parser, codeWriter);

    }

    private static void translatorInner(ParserV2 parser, CodeWriterV2 codeWriter) throws IOException {
        String vmFileName = parser.getVmFileName();
        while (parser.hasMoreCommands()) {
            // 取命令，判断命令是否有效，有效则获取命令类型
            String command = parser.advance();
            if (ParserV2.commandValid(command)) {
                System.out.println(command);
                // 命令合法，开始解析
                CommandTypeV2 commandTypeV2 = ParserV2.getCommandType(command);
                if (CommandTypeV2.C_ARITHMETIC.equals(commandTypeV2)) {
                    codeWriter.writeArithmetic(command, vmFileName);
                } else if (CommandTypeV2.C_PUSH.equals(commandTypeV2)) {
                    codeWriter.writePush(command, vmFileName);
                } else if (CommandTypeV2.C_POP.equals(commandTypeV2)) {
                    codeWriter.writePop(command, vmFileName);
                }else if (CommandTypeV2.C_LABEL.equals(commandTypeV2)){
                    codeWriter.writeLabel(command, vmFileName);
                }else if (CommandTypeV2.C_IF.equals(commandTypeV2)){
                    codeWriter.writeIf(command, vmFileName);
                }else if (CommandTypeV2.C_GOTO.equals(commandTypeV2)){
                    codeWriter.writeGoto(command, vmFileName);
                }else if (CommandTypeV2.C_FUNCTION.equals(commandTypeV2)){
                    codeWriter.writeFunction(command, vmFileName);
                }
            }
        }
        parser.close();
    }
}
