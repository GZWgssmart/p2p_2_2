package com.we.service.impl;

import com.we.dao.ShborrowDAO;
import com.we.service.AbstractBaseService;
import com.we.service.ShborrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by ID.LQF on 2017/12/22.
 */
@Service
public class ShborrowServiceImpl extends AbstractBaseService implements ShborrowService {

    private ShborrowDAO shborrowDAO;

    @Autowired
    public void setShborrowDAO(ShborrowDAO shborrowDAO) {
        super.setBaseDAO(shborrowDAO);
        this.shborrowDAO = shborrowDAO;
    }

}
