package com.we.service.impl;

import com.we.dao.RzvipCheckDAO;
import com.we.service.AbstractBaseService;
import com.we.service.RzvipCheckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RzvipCheckServiceImpl extends AbstractBaseService implements RzvipCheckService {

    private RzvipCheckDAO rzvipCheckDAO;

    @Autowired
    public void setUserDAO(RzvipCheckDAO rzvipCheckDAO) {
        super.setBaseDAO(rzvipCheckDAO);
        this.rzvipCheckDAO = rzvipCheckDAO;
    }

}
