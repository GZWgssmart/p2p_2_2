package com.we.common;

import com.we.vo.RequestResultVO;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Created by 7025 on 2018/1/15.
 */
public class HttpUtils {

    public static final String BIND = "http://localhost:8080/bank/bind";
    public static final String UNBIND = "http://localhost:8080/bank/unbind";
    public static final String RECHARGE = "http://localhost:8080/bank/recharge";
    public static final String MENTION = "http://localhost:8080/bank/mention";

    public static RequestResultVO sendPost(String url, String params) {
        try {
            RequestResultVO resultVO = null;
            URL realUrl = new URL(url);
            HttpURLConnection conn = (HttpURLConnection) realUrl.openConnection();
            conn.setDoInput(true);
            conn.setDoOutput(true);
            conn.setRequestMethod("POST");
            PrintWriter printWriter = new PrintWriter(conn.getOutputStream());
            printWriter.write(params);
            printWriter.flush();
            InputStream inputStream = conn.getInputStream();
            byte[] bytes = new byte[1024];
            int len = -1;
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            while ((len = inputStream.read(bytes)) > 0) {
                baos.write(bytes, 0, len);
            }
//            return baos.toString("utf-8");
            return null;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String getParams(String realName, String bankType,
                                   String bankCardNo, String phone) {
        return "realName=" + realName + "&bank="
                + bankType + "&bankCardNo=" + bankCardNo + "&phone=" + phone;
    }
}
