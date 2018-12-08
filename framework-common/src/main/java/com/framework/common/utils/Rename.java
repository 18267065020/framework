package com.framework.common.utils;


import java.io.File;
import java.util.Map;

/**
 * 重命名类
 * @author Jack
 */
class Rename {

    /**
     * 批量重命名
     * @param path
     * @param replacementChain
     */
    public static void multiRename(String path, FileRename replacementChain){
        File file = new File(path);
        boolean isDirectory = file.isDirectory();

        /** 如果不是文件夹，就返回* */
        if(!isDirectory){
            System.out.println(path + "不是一个文件夹！");
            return;
        }

        String[] files = file.list();
        File f = null;
        String filename = "";
        String oldFileName = ""; //之前的名字
        /** 循环遍历所有文件* */
        for(String fileName : files){
            oldFileName = fileName;
            Map<String, String> map = replacementChain.getMap();
            for (Map.Entry<String, String> entry : map.entrySet()) {
                fileName = fileName.replace(entry.getKey(), entry.getValue());
            }

            f = new File(path + "\\" + oldFileName); //输出地址和原路径保持一致
            f.renameTo(new File(path + "\\" +  fileName));
        }
        System.out.println("恭喜，批量重命名成功！");
    }

    public static void main(String[] args) {
        FileRename replacementChain = new FileRename();
        replacementChain.addRegulation("urKWjNnI2654", "");
        Rename.multiRename("C:\\大明王朝\\66", replacementChain);
    }
}
