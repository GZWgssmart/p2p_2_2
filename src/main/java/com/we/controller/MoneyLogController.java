package com.we.controller;

import com.we.common.Pager;
import com.we.query.MoneyLogQuery;
import com.we.service.MoneyLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by ID.LQF on 2018/1/19.
 */
@Controller
@RequestMapping("/money_log")
public class MoneyLogController {

    @Autowired
    private MoneyLogService moneyLogService;

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset, Long limit) {
        return moneyLogService.listCriteria(offset,limit,null);
    }

    @RequestMapping("search")
    @ResponseBody
    public Pager search(Long offset, Long limit,MoneyLogQuery moneyLogQuery) {
        return moneyLogService.listQueryDate(offset,limit,moneyLogQuery);
    }

}
