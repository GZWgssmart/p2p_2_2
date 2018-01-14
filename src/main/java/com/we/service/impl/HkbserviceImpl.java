package com.we.service.impl;

import com.we.bean.*;
import com.we.common.DateUtil;
import com.we.common.OurConstants;
import com.we.dao.*;
import com.we.enums.RequestResultEnum;
import com.we.service.AbstractBaseService;
import com.we.service.BorrowapplyService;
import com.we.service.HkbService;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;

import static com.we.enums.RequestResultEnum.USERMONEY_KYMONEY_NOT_ENOUGH;

/**
 * Created by 123456 on 2018/1/5.
 */
@Service
public class HkbserviceImpl extends AbstractBaseService implements HkbService {

    private HkbDAO hkbDAO;
    @Autowired
    private YdateDAO ydateDAO;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private TzbDAO tzbDAO;
    private UsermoneyDAO usermoneyDAO;
    private BorrowapplyDAO borrowapplyDAO;
    private MoneyLogDAO moneyLogDAO;
    @Autowired
    private BorrowapplyService borrowapplyService;

    @Autowired
    public void setHkbDAO(HkbDAO hkbDAO) {
        super.setBaseDAO(hkbDAO);
        this.hkbDAO = hkbDAO;
    }

    @Override
    @Transactional
    public void AllMoney() {
        Calendar c = Calendar.getInstance();
        int month = c.get(Calendar.MONTH) + 1;
        String time = "";
        //上个月
        String lastTime = "";
        String lastTimeEnd = "";
        if (month == 1) {
            time = String.valueOf(c.get(Calendar.YEAR)) + "-01-01";
            lastTime = String.valueOf(c.get(Calendar.YEAR) - 1) + "-12-01";
            lastTimeEnd = String.valueOf(c.get(Calendar.YEAR) - 1) + "-12-32";
        } else if (month == 2) {
            time = String.valueOf(c.get(Calendar.YEAR)) + "-02-01";
            lastTime = String.valueOf(c.get(Calendar.YEAR)) + "-01-01";
            lastTimeEnd = String.valueOf(c.get(Calendar.YEAR)) + "-01-32";
        } else if (2 < month && month <= 10) {
            time = String.valueOf(c.get(Calendar.YEAR)) + "-0" + month + "-01";
            lastTime = String.valueOf(c.get(Calendar.YEAR)) + "-0" + (month - 1) + "-01";
            lastTimeEnd = String.valueOf(c.get(Calendar.YEAR)) + "-0" + (month - 1) + "-32";
        } else if (month == 11) {
            time = String.valueOf(c.get(Calendar.YEAR)) + "-11-01";
            lastTime = String.valueOf(c.get(Calendar.YEAR)) + "-10-01";
            lastTimeEnd = String.valueOf(c.get(Calendar.YEAR)) + "-10-32";
        } else if (month == 12) {
            time = String.valueOf(c.get(Calendar.YEAR)) + "-12-01";
            lastTime = String.valueOf(c.get(Calendar.YEAR)) + "-11-01";
            lastTime = String.valueOf(c.get(Calendar.YEAR)) + "-11-32";
        }
        Ydate ydate = new Ydate();
        ydate.setDate(DateUtil.StringToDate(time));
        //交易总额
        Double allMoney = hkbDAO.getAllMoney();
        ydate.setTmoney(BigDecimal.valueOf(allMoney));

        //每月交易总额    用上月交易总额减上上个月交易总额
        //上上个月没有交易记录 则交易总额为每月交易额
        Ydate lastYdate = ydateDAO.getByDate(lastTime);
        if (lastYdate == null) {
            ydate.setMmoney(BigDecimal.valueOf(allMoney));
        } else {
            ydate.setMmoney(BigDecimal.valueOf(allMoney).subtract(lastYdate.getTmoney()));
        }
        //总用户数
        ydate.setTuser(userDAO.countCriteria(User.class).intValue());
        //月注册数
        ydate.setMuser(userDAO.countMonthById(lastTime, lastTimeEnd).intValue());
        //投资总额
        ydate.setTtzno(tzbDAO.countAllMoney().intValue());
        //月投资人数
        ydate.setMtzno(tzbDAO.countUid(lastTime, lastTimeEnd).intValue());
        //总贷款人数
        ydate.setTdkno(borrowapplyService.countAllBorrowUse().intValue());
        //月贷款人数
        ydate.setMdkno(borrowapplyService.countMonthBorrowUse(lastTime, lastTimeEnd).intValue());
        //总贷款笔数
        ydate.setTdkbno(borrowapplyService.countAllBorrow().intValue());
        //月贷款笔数
        ydate.setMdkbno(borrowapplyService.countMonthBorrow(lastTime, lastTimeEnd).intValue());
        ydateDAO.save(ydate);
    }

    @Override
    public Integer sumRepayAmount() {
        return hkbDAO.sumRepayAmount();
    }

    @Override
    public Integer countunRepayNumber() {
        return hkbDAO.countunRepayNumber();
    }

    @Override
    public Double sumOverdueMoney() {
        return hkbDAO.sumOverdueMoney();
    }

    @Override
    public Integer countOverdueNumber() {
        return hkbDAO.countunRepayNumber();
    }

    @Override
    public RequestResultVO repayment(Integer uid, Integer hkid) {
        RequestResultVO resultVO = null;
        Usermoney usermoney = usermoneyDAO.getByUid(uid);
        Hkb hkb = (Hkb) hkbDAO.getById(hkid);
        BigDecimal kymoney = usermoney.getKymoney();
        BigDecimal ybx = hkb.getYbx();
        BigDecimal yMoney = ybx;
        BigDecimal yfx = hkb.getYfx();
        if (OurConstants.HKB_YQ.equals(hkb.getState())) {
            yMoney = yMoney.add(yfx);
        }
        if (kymoney.compareTo(yMoney) != -1) {
            kymoney = kymoney.subtract(yMoney);
            usermoney.setKymoney(kymoney);
            usermoneyDAO.update(usermoney);
            hkb.setRnum(1);
            hkb.setRtime(Calendar.getInstance().getTime());
            hkb.setRbx(ybx);
            BigDecimal ylx = hkb.getYlx();
            hkb.setRlx(ylx);
            BigDecimal ybj = hkb.getYbj();
            hkb.setRbj(ybj);
            hkb.setRfx(yfx);
            hkb.setState(OurConstants.HKB_YH);
            hkbDAO.update(hkb);
            Integer baid = hkb.getBaid();
            List<Hkb> hkbList = hkbDAO.listRepayOk(baid);
            if (hkbList.size() == 0) {
                //此次还款后已还清借款
                Borrowapply borrowapply = (Borrowapply) borrowapplyDAO.getById(baid);
                borrowapply.setState(OurConstants.BORROW_REPAY_OK);
                borrowapplyDAO.update(borrowapply);
            }
            MoneyLog moneyLog = new MoneyLog(uid, OurConstants.MONEY_LOG_REPAY,
                    yMoney, Calendar.getInstance().getTime());
            //生成资金流向记录
            moneyLogDAO.saveSelective(moneyLog);
            resultVO = RequestResultVO.status(RequestResultEnum.HK_SUCCESS);
            resultVO.setMessage("还款成功！当前可用余额为：" + kymoney + "，还款金额为：" + yMoney
            + "，其中，利息为：" + ylx + "，本金为：" + ybj + "，罚息为：" + yfx);
        } else {
            resultVO = RequestResultVO.status(RequestResultEnum.USERMONEY_KYMONEY_NOT_ENOUGH);
        }
        return resultVO;
    }

    @Autowired
    public void setUsermoneyDAO(UsermoneyDAO usermoneyDAO) {
        this.usermoneyDAO = usermoneyDAO;
    }

    @Autowired
    public void setBorrowapplyDAO(BorrowapplyDAO borrowapplyDAO) {
        this.borrowapplyDAO = borrowapplyDAO;
    }

    @Autowired
    public void setMoneyLogDAO(MoneyLogDAO moneyLogDAO) {
        this.moneyLogDAO = moneyLogDAO;
    }
}
