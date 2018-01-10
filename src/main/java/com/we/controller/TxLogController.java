package com.we.controller;

import com.we.bean.TxLog;
import com.we.common.Pager;
import com.we.service.TxLogService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2018/1/2.
 */
@Controller
@RequestMapping("/txLog")
public class TxLogController {

    private TxLogService txLogService;

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit, TxLog txLog){
        return txLogService.listCriteria(offset, limit, txLog);
    }
    @Resource
    public void setTxLogService(TxLogService txLogService) {
        this.txLogService = txLogService;
    }
}
