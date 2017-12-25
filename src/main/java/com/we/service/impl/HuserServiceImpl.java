package com.we.service.impl;

import com.we.dao.HuserDAO;
import com.we.service.AbstractBaseService;
import com.we.service.HuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HuserServiceImpl extends AbstractBaseService implements HuserService {

    private HuserDAO husrDAO;

    @Autowired
    public void setHusrDAO(HuserDAO husrDAO) {
        super.setBaseDAO(husrDAO);
        this.husrDAO = husrDAO;
    }
}
