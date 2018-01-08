package com.we.service.impl;

import com.we.bean.*;
import com.we.common.OurConstants;
import com.we.common.loan.*;
import com.we.dao.*;
import com.we.dto.TzbDTO;
import com.we.enums.RequestResultEnum;
import com.we.service.AbstractBaseService;
import com.we.service.TzbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Service
public class TzbServiceImpl extends AbstractBaseService implements TzbService {

    private TzbDAO tzbDAO;
    private UsermoneyDAO usermoneyDAO;
    private TicketDAO ticketDAO;
    private MoneyLogDAO moneyLogDAO;
    private BorrowapplyDAO borrowapplyDAO;
    private BorrowdetailDAO borrowdetailDAO;
    private HkbDAO hkbDAO;
    private ShborrowDAO shborrowDAO;

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
        if (kymoney != null && ticket != null) {
            kymoney = kymoney.add(ticket.getTkmoney());
        }
        Borrowapply borrowapply = (Borrowapply) borrowapplyDAO.getById(tzbDTO.getBaid());
        BigDecimal symoney = borrowapply.getSymoney();
        //判断标的可投余额是否 大于等于 所投金额
        if (symoney.compareTo(money) != -1) {
            //判断用户资金是否充足
            if (kymoney != null && kymoney.compareTo(money) != -1) {
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
                    Borrowdetail borrowdetail = borrowdetailDAO.getByApplyId(borrowapply.getBaid());
                    result += hkbDAO.saveList(gainHkbData(borrowapply, borrowdetail));
                }
            }
        }
        return result;
    }

    private List<Hkb> gainHkbData(Borrowapply borrowapply, Borrowdetail borrowdetail) {
        List<Hkb> hkbList = new ArrayList<>();
        Integer bz = borrowapply.getBzid();
        BigDecimal money = borrowapply.getMoney();
        Integer term = borrowapply.getTerm();
        Integer baid = borrowapply.getBaid();
        String rname = borrowapply.getRname();
        Integer uid = borrowapply.getUid();
        Integer huid = shborrowDAO.getByBaid(baid).getHuid();

        String cpname = borrowdetail.getCpname();
        BigDecimal nprofit = borrowdetail.getNprofit();
        String bzname = "";
        LoanCalculatorAdapter calculator = null;
        if (OurConstants.BZ_XXHB.equals(bz)) {
            bzname = "先息后本";
            calculator = new XXHBLoanCalculator();
        } else if (OurConstants.BZ_ACM.equals(bz)) {
            bzname = "等额本金";
            calculator = new ACMLoanCalculator();
        } else if (OurConstants.BZ_ACPIM.equals(bz)) {
            bzname = "等额本息";
            calculator = new ACPIMLoanCalculator();
        } else if (OurConstants.BZ_YCHQ.equals(bz)) {
            bzname = "一次还清";
            calculator = new YCHQLoanCalculator();
        }
        Loan loan = calculator.calLoan(LoanUtil.totalLoanMoney(money, LoanUtil.PERCENT),
                term,
                LoanUtil.rate(nprofit.doubleValue(), LoanUtil.RATEDISCOUNT),
                LoanUtil.RATE_TYPE_YEAR);
        List<LoanByMonth> allLoans = loan.getAllLoans();
        for (int i = 0, len = allLoans.size(); i < len; i++) {
            LoanByMonth loanByMonth = allLoans.get(i);
            Hkb hkb = new Hkb();
            hkb.setUid(uid);
            hkb.setRname(rname);
            hkb.setCpname(cpname);
            hkb.setTnum(term);
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.MONTH, (i + 1));
            hkb.setYtime(calendar.getTime());
            hkb.setBzname(bzname);
            hkb.setState(OurConstants.TZB_WH);
            hkb.setBaid(baid);
            calendar.add(Calendar.DAY_OF_MONTH, 1);
            hkb.setYustartime(calendar.getTime());
            hkb.setHuid(huid);

            hkb.setYlx(loanByMonth.getInterest());
            hkb.setYbj(loanByMonth.getPayPrincipal());
            hkb.setYbx(loanByMonth.getRepayment());
            hkbList.add(hkb);
        }
        return hkbList;
    }

    @Override
    public Long countAllMoney() {
        return tzbDAO.countAllMoney();
    }

    @Override
    public Long countUid(String beginTime, String endTime) {
        return tzbDAO.countUid(beginTime, endTime);
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

    @Autowired
    public void setBorrowdetailDAO(BorrowdetailDAO borrowdetailDAO) {
        this.borrowdetailDAO = borrowdetailDAO;
    }

    @Autowired
    public void setHkbDAO(HkbDAO hkbDAO) {
        this.hkbDAO = hkbDAO;
    }

    @Autowired
    public void setShborrowDAO(ShborrowDAO shborrowDAO) {
        this.shborrowDAO = shborrowDAO;
    }
}
