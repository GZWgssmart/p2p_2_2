package com.we.dao;

import com.we.bean.User;
import org.springframework.stereotype.Repository;
@Repository
public interface UserDAO extends BaseDAO {

    /**
     * ͨ�������ѯ���ݿ��Ƿ��иú���
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
     * @param user
     */
    void updateByPhone(User user);

}