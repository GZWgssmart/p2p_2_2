package com.we.service.impl;

import com.we.bean.*;
import com.we.common.OurConstants;
import com.we.common.Pager;
import com.we.common.loan.*;
import com.we.dao.*;
import com.we.dto.TzbDTO;
import com.we.enums.RequestResultEnum;
import com.we.exception.InvestException;
import com.we.service.AbstractBaseService;
import com.we.service.TzbService;
import com.we.vo.InvestHistoryVO;
import com.we.vo.TzbVO;
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
    private UserTicketDAO userTicketDAO;

    @Override
    public Integer save(TzbDTO tzbDTO) throws InvestException {
        Integer uid = tzbDTO.getUid();
        Integer result = 0;
        Ticket ticket = null;
        if (tzbDTO.getUid().equals(tzbDTO.getJuid())) {
            throw new InvestException(RequestResultEnum.SAME_TZ_JK);
        }
        if (tzbDTO.getTid() != null) {
            ticket = (Ticket) ticketDAO.getById(tzbDTO.getTid());
        }
        Usermoney usermoney = usermoneyDAO.getByUid(uid);
        BigDecimal kymoney = usermoney.getKymoney();
        BigDecimal money = tzbDTO.getMoney();
        if (kymoney != null && ticket != null) {
            if (ticket.getTktime().getTime() < Calendar.getInstance().getTime().getTime()) {
                throw new InvestException(RequestResultEnum.TICKET_DISABLED);
            } else {
                UserTicket userTicket = userTicketDAO.getByUidKid(uid, ticket.getUmid());
                if (OurConstants.TICKET_OK.equals(userTicket.getState())) {
                    kymoney = kymoney.add(ticket.getTkmoney());
                    userTicket.setState(OurConstants.TICKET_USE);
                    //将优惠券更新为已使用状态
                    result += userTicketDAO.updateSelective(userTicket);
                } else {
                    throw new InvestException(RequestResultEnum.TICKET_DISABLED);
                }
            }
        }
        Borrowapply borrowapply = (Borrowapply) borrowapplyDAO.getById(tzbDTO.getBaid());
        BigDecimal symoney = borrowapply.getSymoney();
        //判断标的可投余额是否 大于等于 所投金额
        if (symoney.compareTo(money) != -1) {
            //判断投资用户的可用余额是否充足
            if (kymoney != null && kymoney.compareTo(money) != -1) {
                Borrowdetail borrowdetail = borrowdetailDAO.getByApplyId(borrowapply.getBaid());
                usermoney.setKymoney(kymoney.subtract(money));
                usermoney.setTzmoney(usermoney.getTzmoney().add(money));
                LoanCalculatorAdapter calculator = LoanUtil.getCalculator(borrowapply.getBzid());
                Loan loan = calculator.calLoan(LoanUtil.totalLoanMoney(money, LoanUtil.PERCENT),
                        borrowapply.getTerm(),
                        LoanUtil.rate(borrowdetail.getNprofit().doubleValue(), LoanUtil.RATEDISCOUNT),
                        LoanUtil.RATE_TYPE_YEAR);
                usermoney.setDsmoney(usermoney.getDsmoney().add(loan.getTotalRepayment()));
                //更新投资用户的可用余额、投资总额、待收总额
                result += usermoneyDAO.updateSelective(usermoney);
                tzbDTO.setTime(Calendar.getInstance().getTime());
                Tzb tzb = new Tzb(tzbDTO);
                //添加投资用户的投标记录
                result += tzbDAO.saveSelective(tzb);
                //更新当前借款的剩余可投金额
                borrowapply.setSymoney(borrowapply.getSymoney().subtract(money));
                MoneyLog moneyLog = new MoneyLog(tzbDTO.getUid(),
                        OurConstants.MONEY_LOG_TZ, money, Calendar.getInstance().getTime());
                // 增加投资用户的资金流向记录
                result += moneyLogDAO.saveSelective(moneyLog);
                Usermoney borrowUserMoney = usermoneyDAO.getByUid(borrowapply.getUid());
                //投资时，增加融资用户的冻结金额
                borrowUserMoney.setDjmoney(borrowUserMoney.getDjmoney().add(money));
                //当前借款的剩余可投金额等于已投金额（满标）
                if (symoney.compareTo(money) == 0) {
                    // 生成还款表数据
                    result += hkbDAO.saveList(gainHkbData(borrowapply, borrowdetail));
                    BigDecimal borrowTotalMoney = borrowapply.getMoney();
                    //满标后，将该标的冻结金额转为可用余额
                    borrowUserMoney.setKymoney(borrowUserMoney.getKymoney().add(borrowTotalMoney));
                    borrowUserMoney.setDjmoney(borrowUserMoney.getDjmoney().subtract(borrowTotalMoney));
                    borrowUserMoney.setZymoney(borrowUserMoney.getZymoney().add(borrowTotalMoney));
                    borrowapply.setState(OurConstants.BORROW_SUCCESS);
                }
                result += borrowapplyDAO.updateSelective(borrowapply);
                result += usermoneyDAO.updateSelective(borrowUserMoney);
            } else {
                throw new InvestException(RequestResultEnum.USERMONEY_KYMONEY_NOT_ENOUGH);
            }
        } else {
            throw new InvestException(RequestResultEnum.BORROW_SYMONEY_NOT_ENOUGH);
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
        String bzname = gainBzname(bz);
        LoanCalculatorAdapter calculator = LoanUtil.getCalculator(bz);
        Loan loan = calculator.calLoan(LoanUtil.totalLoanMoney(money, LoanUtil.PERCENT),
                term,
                LoanUtil.rate(nprofit.doubleValue(), LoanUtil.RATEDISCOUNT),
                LoanUtil.RATE_TYPE_YEAR);
        List<LoanByMonth> allLoans = loan.getAllLoans();
        int intZero = 0;
        for (int i = intZero, len = allLoans.size(); i < len; i++) {
            LoanByMonth loanByMonth = allLoans.get(i);
            Hkb hkb = new Hkb();
            hkb.setUid(uid);
            hkb.setRname(rname);
            hkb.setCpname(cpname);
            hkb.setTnum(term);
            hkb.setRnum(intZero);
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.MONTH, (i + 1));
            hkb.setYtime(calendar.getTime());
            hkb.setBzname(bzname);

            BigDecimal zero = new BigDecimal(intZero);
            hkb.setYbx(loanByMonth.getRepayment());
            hkb.setRbx(zero);
            hkb.setYlx(loanByMonth.getInterest());
            hkb.setRlx(zero);
            hkb.setYbj(loanByMonth.getPayPrincipal());
            hkb.setRbj(zero);
            hkb.setYfx(zero);
            hkb.setRfx(zero);
            hkb.setYucount(intZero);
            hkb.setState(OurConstants.HKB_WH);
            hkb.setBaid(baid);
            calendar.add(Calendar.DAY_OF_MONTH, 1);
            hkb.setYustartime(calendar.getTime());
            hkb.setHuid(huid);
            hkbList.add(hkb);
        }
        return hkbList;
    }

    private String gainBzname(Integer bz) {
        if (OurConstants.BZ_XXHB.equals(bz)) {
            return "先息后本";
        } else if (OurConstants.BZ_ACM.equals(bz)) {
            return "等额本金";
        } else if (OurConstants.BZ_ACPIM.equals(bz)) {
            return "等额本息";
        } else if (OurConstants.BZ_YCHQ.equals(bz)) {
            return "一次还清";
        }
        return null;
    }

    @Override
    public Long countAllMoney() {
        return tzbDAO.countAllMoney();
    }

    @Override
    public Long countUid(String beginTime, String endTime) {
        return tzbDAO.countUid(beginTime, endTime);
    }

    @Override
    public Integer countDealNumber() {
        return tzbDAO.countDealNumber();
    }

    @Override
    public List<TzbVO> getAllMoney() {
        return tzbDAO.getAllMoney();
    }

    @Override
    public Double sunMoneyByBaid(Integer baid) {
        return tzbDAO.sunMoneyByBaid(baid);
    }

    @Override
    public Pager pagerInvestHistoryByBorrowId(Long offset, Long limit, Integer borrowId) {
        if(offset == null){
            offset = 0L;
        }
        if(limit == null){
            limit = 0L;
        }
        Pager pager = new Pager(offset,limit);
        pager.setRows(tzbDAO.pagerInvestHistoryByBorrowId(pager,borrowId));
        pager.setTotal(tzbDAO.countInvestHistoryByBorrowId(borrowId));
        return pager;
    }

    @Override
    public Pager listAllTz(Pager pager) {
        pager.setRows(tzbDAO.listAllTz(pager));
        pager.setTotal(tzbDAO.countDealNumber().longValue());
        return pager;
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

    @Autowired
    public void setUserTicketDAO(UserTicketDAO userTicketDAO) {
        this.userTicketDAO = userTicketDAO;
    }
}
