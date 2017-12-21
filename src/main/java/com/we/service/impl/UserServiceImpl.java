package com.we.service.impl;

import com.we.common.Pager;
import com.we.dao.UserDAO;
import com.we.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created on 2017/12/21 14:27
 *
 * @author mh
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Override
    public int removeById(Long id) {
        return 0;
    }

    @Override
    public int save(Object obj) {
        return 0;
    }

    @Override
    public int saveSelective(Object obj) {
        return userDAO.saveSelective(obj);
    }

    @Override
    public Object getById(Long id) {
        return null;
    }

    @Override
    public int updateSelective(Object obj) {
        return 0;
    }

    @Override
    public int update(Object obj) {
        return 0;
    }

    @Override
    public Pager listCriteria(Long offset, Long limit, Object object) {
        return null;
    }

    @Resource
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    public String isPhone(String phone) {
        return userDAO.isPhone(phone);
    }

    @Override
    public String isId(Integer id) {
        return userDAO.isId(id);
    }
}
