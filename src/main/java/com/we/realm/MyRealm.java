package com.we.realm;

import com.we.bean.Huser;
import com.we.service.HuserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class MyRealm extends AuthorizingRealm {

    @Autowired
    private HuserService huserService;

    @Autowired
    private HttpServletRequest request;

    /**
     * 授权
     *
     * @param principals
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String eamilOrPhone = (String) principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        if(eamilOrPhone.endsWith(".com")){
            authorizationInfo.setRoles(huserService.getRolesByEmail(eamilOrPhone));
            authorizationInfo.setStringPermissions(huserService.getPermissionsByEmail(eamilOrPhone));
        }else{
            authorizationInfo.setRoles(huserService.getRolesByPhone(eamilOrPhone));
            authorizationInfo.setStringPermissions(huserService.getPermissionsByPhone(eamilOrPhone));
        }
        return authorizationInfo;
    }

    /**
     * 认证
     *
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String emailOrPhone = (String) token.getPrincipal();
        HttpSession session = request.getSession();
        if(emailOrPhone.endsWith(".com")){
            Huser huser = huserService.getByEmail(emailOrPhone);
            if (huser != null) {
                session.setAttribute("huser",huser);
                AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(huser.getEmail(), huser.getPassword(), "xx");
                return authcInfo;
            } else {
                return null;
            }
        }else {
            Huser huser = huserService.getByPhone(emailOrPhone);
            if (huser != null) {
                session.setAttribute("huser",huser);
                AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(huser.getPhone(), huser.getPassword(), "xx");
                return authcInfo;
            } else {
                return null;
            }
        }
    }

}
