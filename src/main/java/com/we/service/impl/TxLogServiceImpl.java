package com.we.service.impl;

import com.we.bean.*;
import com.we.common.Pager;
import com.we.dao.MoneyLogDAO;
import com.we.dao.TxCheckDAO;
import com.we.dao.TxLogDAO;
import com.we.dao.UsermoneyDAO;
import com.we.enums.RequestResultEnum;
import com.we.service.AbstractBaseService;
import com.we.service.TxLogService;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by Administrator on 2018/1/2.
 */
@Service
public class TxLogServiceImpl extends AbstractBaseService implements TxLogService {

    private TxLogDAO txLogDAO;

    @Override
    public Pager listCriteria(Long offset, Long limit, Object object) {
        Pager pager = new Pager(offset, limit);
        pager.setRows(txLogDAO.listCriteria(pager, object));
        long size = txLogDAO.listCount(object).size();
        pager.setTotal(size);
        return pager;
    }

    @Resource
    public void setTxLogDAO(TxLogDAO txLogDAO) {
        super.setBaseDAO(txLogDAO);
        this.txLogDAO = txLogDAO;
    }
}
