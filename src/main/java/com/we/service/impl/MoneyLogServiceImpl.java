package com.we.service.impl;

import com.we.common.Pager;
import com.we.dao.MoneyLogDAO;
import com.we.dto.TxAndCz;
import com.we.service.AbstractBaseService;
import com.we.service.MoneyLogService;
import com.we.vo.RequestResultVO;
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

    @Override
    public RequestResultVO tx(TxAndCz tx) {
        return null;
    }

    @Override
    public RequestResultVO cz(TxAndCz cz) {
        return null;
    }

    @Override
    public Pager listQueryDate(Long offset, Long limit, Object object) {
        Pager pager = new Pager(offset, limit);
        pager.setRows(moneylLogDAO.listQueryDate(pager, object));
        pager.setTotal(moneylLogDAO.countQueryDate(object));
        return pager;
    }
}
