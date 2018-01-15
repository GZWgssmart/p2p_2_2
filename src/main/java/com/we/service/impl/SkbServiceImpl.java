package com.we.service.impl;

import com.we.bean.*;
import com.we.common.OurConstants;
import com.we.common.Pager;
import com.we.common.loan.Loan;
import com.we.common.loan.LoanByMonth;
import com.we.common.loan.LoanCalculatorAdapter;
import com.we.common.loan.LoanUtil;
import com.we.dao.*;
import com.we.enums.RequestResultEnum;
import com.we.service.AbstractBaseService;
import com.we.service.SkbService;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by mh
 */
@Service
public class SkbServiceImpl extends AbstractBaseService implements SkbService {

    private SkbDAO skbDAO;
    private BorrowapplyDAO borrowapplyDAO;
    private BorrowdetailDAO borrowdetailDAO;
    private TzbDAO tzbDAO;
    private HkbDAO hkbDAO;
    private UsermoneyDAO usermoneyDAO;
    private MoneyLogDAO moneyLogDAO;

    @Autowired
    public void setSkbDAO(SkbDAO skbDAO) {
        super.setBaseDAO(skbDAO);
        this.skbDAO = skbDAO;
    }

    @Override
    public Pager saveListCriteria(Long offset, Long limit, Object object) {
        Pager pager = new Pager(offset, limit);
        Skb skb = (Skb) object;
        Integer baid = skb.getBaid();
        Integer uid = skb.getUid();
        int intZero = 0;
        Long longResult = skbDAO.countUserBorrow(uid, baid);
        if (longResult == null || longResult == 0) {
            Borrowapply borrowapply = (Borrowapply) borrowapplyDAO.getById(baid);
            Borrowdetail borrowdetail = borrowdetailDAO.getByApplyId(baid);
            Integer borrowUserId = borrowapply.getUid();
            Integer term = borrowapply.getTerm();
            BigDecimal tzMoney = tzbDAO.countUserTzTotal(uid, baid);
            LoanCalculatorAdapter calculator = LoanUtil.getCalculator(borrowapply.getBzid());
            Loan loan = calculator.calLoan(LoanUtil.totalLoanMoney(tzMoney, LoanUtil.PERCENT), term,
                    LoanUtil.rate(borrowdetail.getNprofit().doubleValue(), LoanUtil.RATEDISCOUNT),
                    LoanUtil.RATE_TYPE_YEAR);
            List<LoanByMonth> allLoans = loan.getAllLoans();
            List<Integer> hkStateList = hkbDAO.listHkState(baid);
            List<Object> rows = new ArrayList<>();
            for (int i = 0; i < allLoans.size(); i++) {
                Skb itemSkb = new Skb();
                itemSkb.setUid(uid);
                itemSkb.setJuid(borrowUserId);
                LoanByMonth loanByMonth = allLoans.get(i);
                BigDecimal zero = new BigDecimal(intZero);
                itemSkb.setYbx(loanByMonth.getRepayment());
                itemSkb.setRbx(zero);
                itemSkb.setYlx(loanByMonth.getInterest());
                itemSkb.setRlx(zero);
                itemSkb.setYbj(loanByMonth.getPayPrincipal());
                itemSkb.setRbj(zero);
                itemSkb.setRnum(intZero);
                itemSkb.setTnum(1);
                itemSkb.setBaid(baid);
                itemSkb.setState(gainSkState(hkStateList.get(i)));
                rows.add(itemSkb);
            }
            skbDAO.saveList(rows);
            pager.setRows(rows);
            pager.setTotal(term.longValue());
        } else {
            List <Object> resultList = skbDAO.listCriteria(pager, object);
            Long total = skbDAO.countCriteria(object);
            pager.setRows(resultList);
            pager.setTotal(total);
        }
        return pager;
    }

    @Override
    public RequestResultVO saveGathering(Integer uid, Integer skid) {
        Usermoney usermoney = usermoneyDAO.getByUid(uid);
        Skb skb = (Skb) skbDAO.getById(skid);
        BigDecimal ybx = skb.getYbx();
        BigDecimal ylx = skb.getYlx();
        skb.setRbx(ybx);
        skb.setRlx(ylx);
        skb.setRbj(skb.getYbj());
        skb.setRnum(1);
        skb.setDate(Calendar.getInstance().getTime());
        skb.setState(OurConstants.SKB_YS);
        skbDAO.update(skb);
        usermoney.setKymoney(ybx.add(usermoney.getKymoney()));
        usermoney.setZymoney(ybx.add(usermoney.getZymoney()));
        usermoney.setDsmoney(usermoney.getDsmoney().subtract(ybx));
        usermoney.setSymoney(ylx.add(usermoney.getSymoney()));
        usermoneyDAO.update(usermoney);
        MoneyLog moneyLog = new MoneyLog(uid, OurConstants.MONEY_LOG_HK,
            Calendar.getInstance().getTime(), ybx);
        moneyLogDAO.saveSelective(moneyLog);
        return RequestResultVO.status(RequestResultEnum.SK_SUCCESS);
    }

    private Integer gainSkState(Integer hkState) {
        if (OurConstants.HKB_YH.equals(hkState)) {
            return OurConstants.SKB_YH;
        }
        return OurConstants.SKB_WH;
    }

    @Autowired
    public void setBorrowapplyDAO(BorrowapplyDAO borrowapplyDAO) {
        this.borrowapplyDAO = borrowapplyDAO;
    }

    @Autowired
    public void setTzbDAO(TzbDAO tzbDAO) {
        this.tzbDAO = tzbDAO;
    }

    @Autowired
    public void setBorrowdetailDAO(BorrowdetailDAO borrowdetailDAO) {
        this.borrowdetailDAO = borrowdetailDAO;
    }

    @Autowired
    public void setHkbDAO(HkbDAO hkbDAO) {
        this.hkbDAO = hkbDAO;
    }

    @Autowired
    public void setUsermoneyDAO(UsermoneyDAO usermoneyDAO) {
        this.usermoneyDAO = usermoneyDAO;
    }

    @Autowired
    public void setMoneyLogDAO(MoneyLogDAO moneyLogDAO) {
        this.moneyLogDAO = moneyLogDAO;
    }
}
