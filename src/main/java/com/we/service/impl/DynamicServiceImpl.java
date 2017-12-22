package com.we.service.impl;

import com.we.dao.DynamicDAO;
import com.we.service.AbstractBaseService;
import com.we.service.DynamicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by ID.LQF on 2017/12/22.
 */
@Service
public class DynamicServiceImpl extends AbstractBaseService implements DynamicService {

    public DynamicDAO dynamicDAO;

    @Autowired
    public void setDynamicDAO(DynamicDAO dynamicDAO) {
        super.setBaseDAO(dynamicDAO);
        this.dynamicDAO = dynamicDAO;
    }

}
