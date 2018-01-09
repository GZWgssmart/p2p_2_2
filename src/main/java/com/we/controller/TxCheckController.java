package com.we.controller;

import com.we.bean.*;
import com.we.enums.RequestResultEnum;
import com.we.service.MoneyLogService;
import com.we.service.TxCheckService;
import com.we.service.TxLogService;
import com.we.service.UsermoneyService;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.Date;

@Controller
@RequestMapping("/txCheck")
public class TxCheckController {

    private TxCheckService txCheckService;
    private TxLogService txLogService;
    private MoneyLogService moneyLogService;
    private UsermoneyService usermoneyService;

    @RequestMapping("TxCheckSuccess")
    @ResponseBody
    public RequestResultVO TxCheckSuccess(BigDecimal money, Integer uid, Integer tid, HttpSession session) {
        RequestResultVO resultVO = null;
        TxCheck txCheck = new TxCheck();
        txCheck.setTxid(tid);
        txCheck.setDate(new Date());
        txCheck.setHuid(Integer.valueOf(((Huser)session.getAttribute("user")).getHuid()));
        txCheckService.save(txCheck);
        TxLog txLog = new TxLog();
        txLog.setTid(tid);
        txLog.setState(1);
        txLogService.update(txLog);
        System.out.println(uid+"*********"+money);
        Usermoney usermoney = usermoneyService.getByUid(uid);
        BigDecimal kyMoney = usermoney.getKymoney();
        usermoney.setKymoney(kyMoney.subtract(money));
        usermoneyService.updateByTx(usermoney);
        MoneyLog moneyLog = new MoneyLog();
        moneyLog.setOutMoney(money);
        moneyLog.setDate(new Date());
        moneyLog.setUid(uid);
        moneyLog.setType(1);
        moneyLogService.save(moneyLog);
        resultVO = RequestResultVO.status(RequestResultEnum.UPDSTE_TXCHECK_SUCCESS);
        return resultVO;
    }

    @RequestMapping("TxCheckNoSuccess")
    @ResponseBody
    public RequestResultVO TxCheckNoSuccess(Integer tid, String excuse, HttpSession session) {
        RequestResultVO resultVO = null;
        TxCheck txCheck = new TxCheck();
        txCheck.setTxid(tid);
        txCheck.setDate(new Date());
        txCheck.setExcuse(excuse);
        txCheck.setHuid(Integer.valueOf(((Huser)session.getAttribute("user")).getHuid()));
        txCheckService.save(txCheck);
        TxLog txLog = new TxLog();
        txLog.setTid(tid);
        txLog.setState(0);
        txLogService.update(txLog);
        resultVO = RequestResultVO.status(RequestResultEnum.UPDSTE_TXCHECK_NO_SUCCESS);
        return resultVO;
    }

    @Resource
    public void setUsermoneyService(UsermoneyService usermoneyService) {
        this.usermoneyService = usermoneyService;
    }

    @Resource
    public void setMoneyLogService(MoneyLogService moneyLogService) {
        this.moneyLogService = moneyLogService;
    }

    @Resource
    public void setTxLogService(TxLogService txLogService) {
        this.txLogService = txLogService;
    }

    @Resource
    public void setTxCheckService(TxCheckService txCheckService) {
        this.txCheckService = txCheckService;
    }
}
