package com.we.service.impl;

import com.we.dao.BaseDAO;
import com.we.dao.MoneyLogDAO;
import com.we.service.AbstractBaseService;
import com.we.service.BaseService;
import com.we.service.MoneyLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2018/1/8.
 */
@Service
public class MoneyLogServiceImpl extends AbstractBaseService implements MoneyLogService{

    private MoneyLogDAO moneylLogDAO;

    @Resource
    public void setMoneylLogDAO(MoneyLogDAO moneylLogDAO) {
        this.moneylLogDAO = moneylLogDAO;
        super.setBaseDAO(moneylLogDAO);
    }
}
