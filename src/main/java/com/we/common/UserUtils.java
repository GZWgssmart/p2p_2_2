package com.we.common;

import com.we.bean.Huser;
import com.we.bean.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import javax.servlet.http.HttpSession;

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

    public static User getUser (HttpSession session) {
        return (User) session.getAttribute(OurConstants.SESSION_IN_USER);
    }

    public static Huser getHuser (HttpSession session) {
        return (Huser) session.getAttribute(OurConstants.SESSION_IN_USER);
    }
}
