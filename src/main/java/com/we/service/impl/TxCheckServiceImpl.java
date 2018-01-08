package com.we.service.impl;

import com.we.dao.TxCheckDAO;
import com.we.service.AbstractBaseService;
import com.we.service.TxCheckService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2018/1/2.
 */
@Service
public class TxCheckServiceImpl extends AbstractBaseService implements TxCheckService {

    private TxCheckDAO txCheckDAO;

    @Resource
    public void setTxCheckDAO(TxCheckDAO txCheckDAO) {
        super.setBaseDAO(txCheckDAO);
        this.txCheckDAO = txCheckDAO;
    }
}
