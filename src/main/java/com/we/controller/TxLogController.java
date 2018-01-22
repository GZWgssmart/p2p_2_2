package com.we.controller;

import com.we.common.Pager;
import com.we.common.UserUtils;
import com.we.query.TxLogQuery;
import com.we.service.TxLogService;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2018/1/2.
 */
@Controller
@RequestMapping("/tx_log")
public class TxLogController {

    private TxLogService txLogService;

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit, TxLogQuery query){
        return txLogService.listCriteria(offset, limit, query);
    }

    @RequiresUser
    @RequestMapping("all_withdrawal_page")
    public String allWithdrawalPage(){
        return "user/all_withdrawal_page";
    }

    @RequiresUser
    @RequestMapping("list_withdrawal")
    @ResponseBody
    public Pager conPayPwd(Long offset, Long limit, HttpSession session){
        return txLogService.listWithdrawalByUserId(offset,limit, UserUtils.getUser(session).getUid());
    }

    @Resource
    public void setTxLogService(TxLogService txLogService) {
        this.txLogService = txLogService;
    }
}
