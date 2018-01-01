package com.we.service.impl;

import com.we.bean.Usermoney;
import com.we.dao.UserDAO;
import com.we.dao.UsermoneyDAO;
import com.we.service.AbstractBaseService;
import com.we.service.UsermoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 123456 on 2017/12/29.
 */
@Service
public class UserMoneyServiceImpl  extends AbstractBaseService implements UsermoneyService{

    private UsermoneyDAO usermoneyDAO;

    @Autowired
    public void setUsermoneyDAO(UsermoneyDAO usermoneyDAO) {
        super.setBaseDAO(usermoneyDAO);
        this.usermoneyDAO = usermoneyDAO;
    }

    @Override
    public Usermoney getByUid(Integer uid) {
        return usermoneyDAO.getByUid(uid);
    }

    @Override
    public void updateByUid(Object obj) {
        usermoneyDAO.updateByUid(obj);
    }
}
