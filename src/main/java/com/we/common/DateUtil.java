package com.we.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by 123456 on 2018/4/2.
 */
public class DateUtil {

    public static Date StringToDate(String time){
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            return sdf.parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String DateToString(Date time){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(time);
    }

    public static String getNowTime(){
        Calendar c = Calendar.getInstance();
        int month = c.get(Calendar.MONTH) + 1;
        String nowTime = "";
        if(month < 10){
            nowTime = String.valueOf(c.get(Calendar.YEAR)) +"-0"+ month +"-"+String.valueOf(c.get(Calendar.DATE));
        }else{
            nowTime = String.valueOf(c.get(Calendar.YEAR)) +"-"+ month +"-"+String.valueOf(c.get(Calendar.DATE));
        }
        return nowTime;
    }
}
