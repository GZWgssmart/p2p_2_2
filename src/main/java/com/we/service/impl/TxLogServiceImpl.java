package com.we.service.impl;

import com.we.dao.TxLogDAO;
import com.we.service.AbstractBaseService;
import com.we.service.TxLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2018/1/2.
 */
@Service
public class TxLogServiceImpl extends AbstractBaseService implements TxLogService {

    private TxLogDAO txLogDAO;

    @Resource
    public void setTxLogDAO(TxLogDAO txLogDAO) {
        super.setBaseDAO(txLogDAO);
        this.txLogDAO = txLogDAO;
    }
}
