package com.we.common;

import javax.servlet.http.HttpServletRequest;
import java.io.*;

/**
 * Created by ID.LQF on 2017/12/27.
 */
public class FileUtil {

    public static void copyFile(File sourceFile, File targetFile) throws IOException {
        BufferedInputStream inBuff=null;
        BufferedOutputStream outBuff=null;
        try {
            // 新建文件输入流并对它进行缓冲
            inBuff=new BufferedInputStream(new FileInputStream(sourceFile));
            // 新建文件输出流并对它进行缓冲
            outBuff=new BufferedOutputStream(new FileOutputStream(targetFile));
            // 缓冲数组
            byte[] b=new byte[1024 * 5];
            int len;
            while((len=inBuff.read(b)) != -1) {
                outBuff.write(b, 0, len);
            }
            // 刷新此缓冲的输出流
            outBuff.flush();
        } finally {
            // 关闭流
            if(inBuff != null)
                inBuff.close();
            if(outBuff != null)
                outBuff.close();
        }
    }


}
