package com.we.common;

import org.springframework.web.context.ContextLoader;

import java.io.File;

public class PathUtils {

    public static String mkUploads() {
        String path = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/");
        File file = new File(path, "uploads");
        if (!file.exists()) {
            file.mkdirs();
        }
        return file.getAbsolutePath();
    }

}
