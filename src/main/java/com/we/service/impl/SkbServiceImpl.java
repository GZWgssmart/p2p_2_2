package com.we.service.impl;

import com.we.bean.Borrowapply;
import com.we.bean.Borrowdetail;
import com.we.bean.Skb;
import com.we.common.Pager;
import com.we.common.loan.Loan;
import com.we.common.loan.LoanByMonth;
import com.we.common.loan.LoanCalculatorAdapter;
import com.we.common.loan.LoanUtil;
import com.we.dao.BorrowapplyDAO;
import com.we.dao.BorrowdetailDAO;
import com.we.dao.SkbDAO;
import com.we.dao.TzbDAO;
import com.we.service.AbstractBaseService;
import com.we.service.SkbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
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

    @Autowired
    public void setSkbDAO(SkbDAO skbDAO) {
        super.setBaseDAO(skbDAO);
        this.skbDAO = skbDAO;
    }

    @Override
    public Pager listCriteria(Long offset, Long limit, Object object) {
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
                itemSkb.setBaid(baid);
                rows.add(itemSkb);
            }
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
}
