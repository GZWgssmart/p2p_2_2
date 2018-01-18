package com.we.service.impl;

import com.we.bean.*;
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

    @Resource
    public void setTxLogDAO(TxLogDAO txLogDAO) {
        super.setBaseDAO(txLogDAO);
        this.txLogDAO = txLogDAO;
    }
}
