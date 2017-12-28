package com.we.service.impl;

import com.we.dao.JklxDAO;
import com.we.service.AbstractBaseService;
import com.we.service.JklxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by hasee on 2017/12/27.
 */
@Service
public class JklxServiceImpl extends AbstractBaseService implements JklxService {

    private JklxDAO jklxDAO;
    @Autowired
    public void setBzDAO(JklxDAO jklxDAO){
        super.setBaseDAO(jklxDAO);
        this.jklxDAO =jklxDAO;
    }
}
