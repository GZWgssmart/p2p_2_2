package com.we.service.impl;

import com.we.common.Pager;
import com.we.dao.RoleDAO;
import com.we.service.AbstractBaseService;
import com.we.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RoleServiceImpl extends AbstractBaseService implements RoleService{

    private RoleDAO roleDAO;

    @Autowired
    public void setRoleDAO(RoleDAO roleDAO) {
        super.setBaseDAO(roleDAO);
        this.roleDAO = roleDAO;
    }



    @Override
    public Pager listPager(Long offset, Long limit) {
        Pager pager = new Pager(offset,limit);
        pager.setRows(roleDAO.listPager(pager));
        pager.setTotal(roleDAO.countAll());
        return pager;
    }

    @Override
    public Pager listCriteria(Long offset, Long limit, Object object) {
        Pager pager = new Pager();
        pager.setRows(roleDAO.listCriteria(pager,object));
        pager.setTotal(roleDAO.countCriteria(object));
        return pager;
    }
}
