package com.we.dao;

import com.we.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;

@Repository
public interface UserDAO extends BaseDAO {

    /**
     * 通过手机号查找用户
     * @param phone
     * @return
     */
    User getByPhone(String phone);

    /**
     * 通过邮箱或电话号码登入
     * @param user
     * @return
     */
    User getByPhoneOrEmailAndUpwd(User user);

    /**
     * 通过手机号码修改登入密码
     * @param phone
     * @param pwd
     */
    void updatePwdByPhone(@Param("phone") String phone, @Param("pwd") String pwd);

}