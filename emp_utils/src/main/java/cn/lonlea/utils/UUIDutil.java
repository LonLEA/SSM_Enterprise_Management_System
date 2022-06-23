package cn.lonlea.utils;

import java.util.UUID;

public class UUIDutil {
    public static String getuuid(){
        return UUID.randomUUID().toString()
                .replace("-", "").toLowerCase();
    }
}
