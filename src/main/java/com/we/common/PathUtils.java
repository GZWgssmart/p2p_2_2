package com.we.common;

import org.springframework.web.context.ContextLoader;

import java.io.File;

public class PathUtils {

    public static String mkUploadImgs() {
        String path = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/static/uploads/");
        File file = new File(path, "img");
        if (!file.exists()) {
            file.mkdirs();
        }
        return file.getAbsolutePath();
    }

}
