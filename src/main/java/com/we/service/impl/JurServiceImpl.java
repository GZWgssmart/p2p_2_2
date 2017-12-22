package com.we.service.impl;

import com.we.dao.BaseDAO;
import com.we.dao.JurDAO;
import com.we.service.AbstractBaseService;
import com.we.service.JurService;
import org.springframework.beans.factory.annotation.Autowired;

public class JurServiceImpl extends AbstractBaseService implements JurService {

    private JurDAO jurDAO;


    @Autowired
    public void setJurDAO(JurDAO jurDAO) {
        super.setBaseDAO(jurDAO);
        this.jurDAO = jurDAO;
    }
}
