package com.we.service.impl;

import com.we.bean.Usermoney;
import com.we.dao.UsermoneyDAO;
import com.we.service.AbstractBaseService;
import com.we.service.UsermoneyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2018/1/9.
 */
@Service
public class UsermoneyServiceImpl extends AbstractBaseService implements UsermoneyService {

    private UsermoneyDAO usermoneyDAO;

    @Override
    public Usermoney getByUid(Integer uid) {
        return usermoneyDAO.getByUid(uid);
    }

    @Override
    public void updateByUid(Object obj) {
        usermoneyDAO.updateByUid(obj);
    }

    @Override
    public void updateByTx(Object obj) {

    }

    @Resource
    public void setUsermoneyDAO(UsermoneyDAO usermoneyDAO) {
        this.usermoneyDAO = usermoneyDAO;
        super.setBaseDAO(usermoneyDAO);
    }

}
