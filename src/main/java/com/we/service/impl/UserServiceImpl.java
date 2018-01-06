package com.we.service.impl;

import com.we.bean.User;
import com.we.common.Pager;
import com.we.dao.BaseDAO;
import com.we.dao.UserDAO;
import com.we.service.AbstractBaseService;
import com.we.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created on 2017/12/21 14:27
 *
 * @author mh
 */
@Service
public class UserServiceImpl extends AbstractBaseService implements UserService {

    private UserDAO userDAO;

    @Autowired
    public void setUserDAO(UserDAO userDAO) {
        super.setBaseDAO(userDAO);
        this.userDAO = userDAO;
    }

    @Override
    public User getByPhone(String phone) {
        return userDAO.getByPhone(phone);
    }

    @Override
    public User getByEmail(String email) {
        return userDAO.getByEmail(email);
    }

    @Override
    public User getByPhoneOrEmailAndUpwd(User user) {
        return userDAO.getByPhoneOrEmailAndUpwd(user);
    }

    @Override
    public void updateByPhone(User user) {
        userDAO.updateByPhone(user);
    }

    @Override
    public List<Integer> getUserId() {
        return userDAO.getUserId();
    }

    @Override
    public Long countMonthById(String beginTime, String endTime) {
        return userDAO.countMonthById(beginTime, endTime);
    }


}
