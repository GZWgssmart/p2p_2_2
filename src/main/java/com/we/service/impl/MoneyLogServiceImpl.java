package com.we.service.impl;

import com.we.bean.*;
import com.we.common.OurConstants;
import com.we.common.Pager;
import com.we.dao.*;
import com.we.dto.TxAndCz;
import com.we.enums.RequestResultEnum;
import com.we.dto.TxAndCz;
import com.we.service.AbstractBaseService;
import com.we.service.MoneyLogService;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Random;

/**
 * Created by Administrator on 2018/1/8.
 */
@Service
public class MoneyLogServiceImpl extends AbstractBaseService implements MoneyLogService{

    private MoneyLogDAO moneylLogDAO;
    private BankcardDAO bankcardDAO;
    private UsermoneyDAO usermoneyDAO;
    private TxLogDAO txLogDAO;
    private TxCheckDAO txCheckDAO;

    @Override
    public RequestResultVO tx(TxAndCz tx) {
        RequestResultVO resultVO = null;
        Random random = new Random();
        Integer anInt = random.nextInt(10);
        if (anInt > 2) {
            Integer uid = tx.getUid();
            Usermoney usermoney = usermoneyDAO.getByUid(uid);
            BigDecimal kymoney = usermoney.getKymoney();
            BigDecimal money = tx.getMoney();
            if (kymoney != null && money != null && kymoney.compareTo(money) == 1) {
                usermoney.setKymoney(kymoney.subtract(money));
                usermoney.setZymoney(usermoney.getZymoney().subtract(money));
                usermoney.setDjmoney(usermoney.getDjmoney().add(money));
                usermoneyDAO.update(usermoney);
                Bankcard bankcard = (Bankcard) bankcardDAO.getById(tx.getBcid());
                TxLog txLog = new TxLog();
                txLog.setUid(uid);
                txLog.setBankcard(bankcard.getCardno());
                txLog.setBanktype(bankcard.getType());
                txLog.setMoney(money);
                txLog.setDate(Calendar.getInstance().getTime());
                txLog.setState(OurConstants.TX_CHECKING);
                txLogDAO.saveSelective(txLog);
                TxCheck txCheck = new TxCheck();
                txCheck.setTxid(txLog.getTid());
                txCheckDAO.saveSelective(txCheck);
                resultVO = RequestResultVO.status(RequestResultEnum.TX_SUCCESS);
            } else {
                resultVO = RequestResultVO.status(RequestResultEnum.USERMONEY_KYMONEY_NOT_ENOUGH);
            }
        } else {
            resultVO = RequestResultVO.status(RequestResultEnum.TX_FAIL);
        }
        return resultVO;
    }

    @Override
    public RequestResultVO cz(TxAndCz cz) {
        RequestResultVO resultVO = null;
        Random random = new Random();
        Integer anInt = random.nextInt(10);
        if (anInt > 2) {
            Integer uid = cz.getUid();
            Usermoney usermoney = usermoneyDAO.getByUid(uid);
            BigDecimal kymoney = usermoney.getKymoney();
            BigDecimal money = cz.getMoney();
            if (kymoney != null && money != null) {
                usermoney.setKymoney(kymoney.add(money));
                usermoney.setZymoney(usermoney.getZymoney().add(money));
                usermoneyDAO.update(usermoney);
                MoneyLog moneyLog = new MoneyLog(uid, OurConstants.MONEY_LOG_CZ, Calendar.getInstance().getTime(), money);
                moneylLogDAO.saveSelective(moneyLog);
                resultVO = RequestResultVO.status(RequestResultEnum.CZ_SUCCESS);
            }
        } else {
            resultVO = RequestResultVO.status(RequestResultEnum.CZ_FAIL);
        }
        return resultVO;
    }

    @Override
    public Pager listQueryDate(Long offset, Long limit, Object object) {
        Pager pager = new Pager(offset, limit);
        pager.setRows(moneylLogDAO.listQueryDate(pager, object));
        pager.setTotal(moneylLogDAO.countQueryDate(object));
        return pager;
    }

    @Resource
    public void setMoneylLogDAO(MoneyLogDAO moneylLogDAO) {
        this.moneylLogDAO = moneylLogDAO;
        super.setBaseDAO(moneylLogDAO);
    }

    @Autowired
    public void setUsermoneyDAO(UsermoneyDAO usermoneyDAO) {
        this.usermoneyDAO = usermoneyDAO;
    }

    @Autowired
    public void setBankcardDAO(BankcardDAO bankcardDAO) {
        this.bankcardDAO = bankcardDAO;
    }

    @Autowired
    public void setTxLogDAO(TxLogDAO txLogDAO) {
        this.txLogDAO = txLogDAO;
    }

    @Autowired
    public void setTxCheckDAO(TxCheckDAO txCheckDAO) {
        this.txCheckDAO = txCheckDAO;
    }
}
