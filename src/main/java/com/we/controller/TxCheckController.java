package com.we.controller;

import com.we.bean.Huser;
import com.we.bean.TxCheck;
import com.we.bean.TxLog;
import com.we.common.Pager;
import com.we.common.UserUtils;
import com.we.service.TxCheckService;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/tx_check")
public class TxCheckController {

    private TxCheckService txCheckService;


    @RequestMapping("check")
    @ResponseBody
    public RequestResultVO check(TxCheck txCheck, HttpSession session) {
        Huser huser = UserUtils.getHuser(session);
        txCheck.setHuid(huser.getHuid());
        return txCheckService.updateCheck(txCheck);
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit, TxCheck txCheck){
        return txCheckService.listCriteria(offset, limit, txCheck);
    }

    @Autowired
    public void setTxCheckService(TxCheckService txCheckService) {
        this.txCheckService = txCheckService;
    }
}
