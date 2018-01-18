package com.we.service.impl;

import com.we.bean.MoneyLog;
import com.we.bean.TxCheck;
import com.we.bean.TxLog;
import com.we.bean.Usermoney;
import com.we.common.OurConstants;
import com.we.dao.MoneyLogDAO;
import com.we.dao.TxCheckDAO;
import com.we.dao.TxLogDAO;
import com.we.dao.UsermoneyDAO;
import com.we.enums.RequestResultEnum;
import com.we.service.AbstractBaseService;
import com.we.service.TxCheckService;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Calendar;

/**
 * Created by Administrator on 2018/1/2.
 */
@Service
public class TxCheckServiceImpl extends AbstractBaseService implements TxCheckService {

    private TxCheckDAO txCheckDAO;
    private TxLogDAO txLogDAO;
    private MoneyLogDAO moneyLogDAO;
    private UsermoneyDAO usermoneyDAO;

    @Resource
    public void setTxCheckDAO(TxCheckDAO txCheckDAO) {
        super.setBaseDAO(txCheckDAO);
        this.txCheckDAO = txCheckDAO;
    }

    @Override
    public RequestResultVO updateCheck(TxCheck txCheck) {
        RequestResultVO resultVO = null;
        Integer tid = txCheck.getTxid();
        txCheck.setDate(Calendar.getInstance().getTime());
        TxLog txLog = (TxLog) txLogDAO.getById(tid);
        Integer uid = txLog.getUid();
        BigDecimal money = txLog.getMoney();
        Usermoney usermoney = usermoneyDAO.getByUid(uid);
        BigDecimal djmoney = usermoney.getDjmoney();
        if (OurConstants.TX_CHECK_OK.equals(txCheck.getIsok())) {
            txLog.setState(OurConstants.TX_CHECK_OK);
            MoneyLog moneyLog = new MoneyLog(uid, OurConstants.MONEY_LOG_TX,
                    money, Calendar.getInstance().getTime());
            moneyLogDAO.save(moneyLog);
            resultVO = RequestResultVO.status(RequestResultEnum.CHECK_OK);
        } else if (OurConstants.TX_CHECK_NO.equals(txCheck.getIsok())) {
            txLog.setState(OurConstants.TX_CHECK_NO);
            usermoney.setSymoney(usermoney.getKymoney().add(money));
            resultVO = RequestResultVO.status(RequestResultEnum.CHECK_NO);
        }
        usermoney.setDjmoney(djmoney.subtract(money));
        usermoneyDAO.update(usermoney);
        txCheckDAO.updateSelective(txCheck);
        txLogDAO.update(txLog);
        return resultVO;
    }

    @Autowired
    public void setTxLogDAO(TxLogDAO txLogDAO) {
        this.txLogDAO = txLogDAO;
    }

    @Autowired
    public void setMoneyLogDAO(MoneyLogDAO moneyLogDAO) {
        this.moneyLogDAO = moneyLogDAO;
    }

    @Autowired
    public void setUsermoneyDAO(UsermoneyDAO usermoneyDAO) {
        this.usermoneyDAO = usermoneyDAO;
    }
}
