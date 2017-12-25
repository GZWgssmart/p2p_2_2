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


    public BankcardDAO bankcardDAO;

    @Override
    public Integer removeById(Integer id) {
        return bankcardDAO.removeById(id);
    }

    @Override
    public Integer save(Object obj) {
        return bankcardDAO.save(obj);
    }

    @Override
    public Integer saveSelective(Object obj) {
        return bankcardDAO.saveSelective(obj);
    }

    @Override
    public Object getById(Integer id) {
        return bankcardDAO.getById(id);
    }

    @Override
    public Integer updateSelective(Object obj) {
        return bankcardDAO.updateSelective(obj);
    }

    @Override
    public Integer update(Object obj) {
        return bankcardDAO.update(obj);
    }

    @Resource
    public void setBankcardDAO(BankcardDAO bankcardDAO) {
        this.bankcardDAO = bankcardDAO;
    }
}
