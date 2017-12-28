package com.we.service.impl;

import com.we.dao.SwayDAO;
import com.we.service.AbstractBaseService;
import com.we.service.SwayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by hasee on 2017/12/22.
 */
@Service
public class SwayServiceImpl extends AbstractBaseService implements SwayService {

    private SwayDAO swayDAO;
    @Autowired
    public void setSwayDAO(SwayDAO swayDAO){
        super.setBaseDAO(swayDAO);
        this.swayDAO = swayDAO;
    }
}
