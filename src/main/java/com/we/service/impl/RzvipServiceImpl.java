package com.we.service.impl;

import com.we.bean.Rzvip;
import com.we.dao.RzvipCheckDAO;
import com.we.dao.RzvipDAO;
import com.we.service.AbstractBaseService;
import com.we.service.RzvipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RzvipServiceImpl extends AbstractBaseService implements RzvipService {

    private RzvipDAO rzvipDAO;

    @Autowired
    public void setRzvipDAO(RzvipDAO rzvipDAO) {
        super.setBaseDAO(rzvipDAO);
        this.rzvipDAO = rzvipDAO;
    }

    @Override
    public Rzvip getByUid(Integer userId) {
        return rzvipDAO.getByUid(userId);
    }
}
