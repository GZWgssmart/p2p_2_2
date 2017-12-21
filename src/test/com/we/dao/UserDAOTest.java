package com.we.dao;

import com.we.bean.User;
import com.we.service.impl.BaseTest;
import org.junit.Test;

import javax.annotation.Resource;

/**
 * Created on 2017/12/21 8:17
 *
 * @author mh
 */
public class UserDAOTest extends BaseTest {

    private UserDAO userDAO;

    @Test
    public void testSave() {
        User user = new User();
        user.setEmail("email");
        user.setPhone("1887970007");
        user.setUpwd("123321");
        userDAO.saveSelective(user);
    }

    @Resource
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }
}
