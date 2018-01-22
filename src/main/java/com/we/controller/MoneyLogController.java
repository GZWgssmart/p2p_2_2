package com.we.controller;

import com.we.bean.User;
import com.we.common.EncryptUtils;
import com.we.common.OurConstants;
import com.we.common.Pager;
import com.we.common.UserUtils;
import com.we.dto.TxAndCz;
import com.we.enums.RequestResultEnum;
import com.we.query.MoneyLogQuery;
import com.we.service.MoneyLogService;
import com.we.vo.QueryUserMoneyLogVO;
import com.we.vo.RequestResultVO;
import org.apache.shiro.authz.annotation.RequiresUser;
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
        RequestResultVO resultVO = RequestResultVO.status(RequestResultEnum.PAY_PWD_ERROR);
        if (checkZpwd(tx.getZpwd(), session)) {
            tx.setUid(UserUtils.getUser(session).getUid());
            resultVO = moneyLogService.tx(tx);
        }
        return resultVO;
    }

    @RequestMapping("cz")
    @ResponseBody
    public RequestResultVO cz(TxAndCz cz, HttpSession session) {
        RequestResultVO resultVO = RequestResultVO.status(RequestResultEnum.PAY_PWD_ERROR);
        if (checkZpwd(cz.getZpwd(), session)) {
            cz.setUid(UserUtils.getUser(session).getUid());
            resultVO = moneyLogService.cz(cz);
        }
        return resultVO;
    }

    private boolean checkZpwd(String zpwd, HttpSession session) {
        User user = UserUtils.getUser(session);
        if (zpwd != null && EncryptUtils.md5(zpwd).equals(user.getZpwd())) {
            return true;
        }
        return false;
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


    @RequiresUser
    @RequestMapping("user_money_log_page")
    public String  userMoneyLogPage() {
        return "user/user_money_log_page";
    }

    @RequiresUser
    @RequestMapping("list_criteria_by_user")
    @ResponseBody
    public Pager listCriteriaByUser(Long offset, Long limit,QueryUserMoneyLogVO queryUserMoneyLogVO,HttpSession session) {
        queryUserMoneyLogVO.setUserId(UserUtils.getUser(session).getUid());
        return moneyLogService.listCriteria(offset,limit,queryUserMoneyLogVO);
    }

    @Resource
    public void setMoneyLogService(MoneyLogService moneyLogService) {
        this.moneyLogService = moneyLogService;
    }
}
