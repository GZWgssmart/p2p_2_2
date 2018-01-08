package com.we.controller;

import com.we.bean.Huser;
import com.we.bean.TxCheck;
import com.we.bean.TxLog;
import com.we.enums.RequestResultEnum;
import com.we.service.TxCheckService;
import com.we.service.TxLogService;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/txCheck")
public class TxCheckController {

    private TxCheckService txCheckService;
    private TxLogService txLogService;

    @RequestMapping("TxCheckSuccess")
    @ResponseBody
    public RequestResultVO TxCheckSuccess(Integer tid, HttpSession session) {
        System.out.println("DDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFF");
        RequestResultVO resultVO = null;
        TxCheck txCheck = new TxCheck();
        txCheck.setTxid(tid);
        txCheck.setDate(new Date());
        txCheck.setHuid(Integer.valueOf(((Huser)session.getAttribute("user")).getHuid()));
        txCheckService.save(txCheck);
        TxLog txLog = new TxLog();
        txLog.setTid(tid);
        txLog.setState(1);
        System.out.println(tid+"SSSSSSSSSSSS");
        txLogService.update(txLog);
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
        System.out.println(tid+"VVVVVVVVVVVVVVVV");
        txLog.setTid(tid);
        txLog.setState(0);
        txLogService.update(txLog);
        resultVO = RequestResultVO.status(RequestResultEnum.UPDSTE_TXCHECK_NO_SUCCESS);
        return resultVO;
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
