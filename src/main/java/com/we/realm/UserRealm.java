package com.we.realm;

import com.we.bean.User;
import com.we.service.UserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

public class UserRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;
    
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    /**
     * 认证
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String emailOrPhone = (String) token.getPrincipal();
        if(emailOrPhone != null){
            if(emailOrPhone.endsWith(".com")){
                User user = userService.getByEmail(emailOrPhone);
                if (user != null) {
                    AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(user.getEmail(), user.getUpwd(), "xx");
                    return authcInfo;
                } else {
                    return null;
                }
            }else {
                User user = userService.getByPhone(emailOrPhone);
                if (user != null) {
                    AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(user.getPhone(), user.getUpwd(), "xx");
                    return authcInfo;
                } else {
                    return null;
                }
            }
        }
        return null;
    }
}
