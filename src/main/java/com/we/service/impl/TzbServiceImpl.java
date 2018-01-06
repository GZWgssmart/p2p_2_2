package com.we.service.impl;

import com.we.bean.*;
import com.we.common.OurConstants;
import com.we.dao.*;
import com.we.dto.TzbDTO;
import com.we.service.AbstractBaseService;
import com.we.service.TzbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Calendar;

@Service
public class TzbServiceImpl extends AbstractBaseService implements TzbService {

    private TzbDAO tzbDAO;
    private UsermoneyDAO usermoneyDAO;
    private TicketDAO ticketDAO;
    private MoneyLogDAO moneyLogDAO;
    private BorrowapplyDAO borrowapplyDAO;

    @Override
    public Integer save(TzbDTO tzbDTO) {
        Integer uid = tzbDTO.getUid();
        Integer result = 0;
        Ticket ticket = null;
        if (tzbDTO.getTid() != null) {
            ticket = (Ticket) ticketDAO.getById(tzbDTO.getTid());
        }
        Usermoney usermoney = usermoneyDAO.getByUid(uid);
        BigDecimal kymoney = usermoney.getKymoney();
        BigDecimal money = tzbDTO.getMoney();
        if (ticket != null) {
            kymoney = kymoney.add(ticket.getTkmoney());
        }
        Borrowapply borrowapply = (Borrowapply) borrowapplyDAO.getById(tzbDTO.getBaid());
        BigDecimal symoney = borrowapply.getSymoney();
        //判断标的可投余额是否 大于等于 所投金额
        if (symoney.compareTo(money) != -1) {
            //判断用户资金是否充足
            if (kymoney != null && money != null && kymoney.compareTo(money) != -1) {
                usermoney.setKymoney(kymoney.subtract(money));
                usermoney.setTzmoney(usermoney.getTzmoney().add(money));
                //更新用户资金的数据，是否还需更新收益总额，待收金额？
                result += usermoneyDAO.updateSelective(usermoney);
                tzbDTO.setTime(Calendar.getInstance().getTime());
                Tzb tzb = new Tzb(tzbDTO);
                result += tzbDAO.saveSelective(tzb);//添加投标记录
                borrowapply.setSymoney(borrowapply.getMoney().subtract(money));
                result += borrowapplyDAO.updateSelective(borrowapply);//更新剩余可投金额
                MoneyLog moneyLog = new MoneyLog(tzbDTO.getUid(), OurConstants.MONEY_LOG_TZ, money, Calendar.getInstance().getTime());
                result += moneyLogDAO.saveSelective(moneyLog);// 增加资金流向记录
                //剩余可投金额等于已投金额，生成还款表数据
                if (symoney.compareTo(money) == 0) {

                }
            }
        }
        return result;
    }

    @Autowired
    public void setTzbDAO(TzbDAO tzbDAO) {
        super.setBaseDAO(tzbDAO);
        this.tzbDAO = tzbDAO;
    }

    @Autowired
    public void setUsermoneyDAO(UsermoneyDAO usermoneyDAO) {
        this.usermoneyDAO = usermoneyDAO;
    }

    @Autowired
    public void setTicketDAO(TicketDAO ticketDAO) {
        this.ticketDAO = ticketDAO;
    }

    @Autowired
    public void setMoneyLogDAO(MoneyLogDAO moneyLogDAO) {
        this.moneyLogDAO = moneyLogDAO;
    }

    @Autowired
    public void setBorrowapplyDAO(BorrowapplyDAO borrowapplyDAO) {
        this.borrowapplyDAO = borrowapplyDAO;
    }
}
