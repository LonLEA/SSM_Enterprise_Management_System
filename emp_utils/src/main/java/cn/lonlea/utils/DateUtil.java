package cn.lonlea.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
    //日期转换为字符串
    public static String date_to_String(Date date, String patt){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(patt);
        String date_string = simpleDateFormat.format(date);
        return date_string;
    }

    //字符串转换为日期
    public static Date string_to_Date(String date_string,String patt) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(patt);
        Date date = simpleDateFormat.parse(date_string);
        return date;
    }
}