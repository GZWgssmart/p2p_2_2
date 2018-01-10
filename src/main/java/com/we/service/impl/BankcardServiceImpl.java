package com.we.service.impl;

import com.we.common.Pager;
import com.we.dao.BankcardDAO;
import com.we.dao.BaseDAO;
import com.we.service.AbstractBaseService;
import com.we.service.BankcardService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/12/25.
 */
@Service
public class BankcardServiceImpl extends AbstractBaseService implements BankcardService {


    private BankcardDAO bankcardDAO;

    @Resource
    public void setBankcardDAO(BankcardDAO bankcardDAO) {
        this.bankcardDAO = bankcardDAO;
        super.setBaseDAO(bankcardDAO);
    }
}
