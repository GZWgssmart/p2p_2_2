package com.we.controller;

import com.we.common.Pager;
import com.we.dto.TxAndCz;
import com.we.query.MoneyLogQuery;
import com.we.service.MoneyLogService;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2018/1/2.
 */
@Controller
@RequestMapping("/moneyLog")
public class MoneyLogController {

    private MoneyLogService moneyLogService;

    @RequestMapping("tx")
    @ResponseBody
    public RequestResultVO tx(TxAndCz tx, HttpSession session) {
        return moneyLogService.tx(tx);
    }

    @RequestMapping("cz")
    @ResponseBody
    public RequestResultVO cz(TxAndCz cz, HttpSession session) {
        return moneyLogService.cz(cz);
    }

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

    @Resource
    public void setMoneyLogService(MoneyLogService moneyLogService) {
        this.moneyLogService = moneyLogService;
    }
}
