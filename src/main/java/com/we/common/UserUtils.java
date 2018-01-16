package com.we.common;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

/**
 * Created on 2018/1/16 8:35
 *
 * @author mh
 */
public class UserUtils {

    public static boolean isAdmin() {
        Subject subject = SecurityUtils.getSubject();
        if (subject != null) {
            return subject.hasRole("admin");
        }
        return false;
    }

    public static boolean isLogin() {
        return SecurityUtils.getSubject() != null;
    }

}
