package com.we.controller;

import com.we.bean.Bankcard;
import com.we.bean.User;
import com.we.common.OurConstants;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.BankcardService;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * Created by Administrator on 2017/12/25.
 */

@Controller
@RequestMapping("/bankcard")
public class BankcardController {

    private BankcardService bankcardService;

    @RequestMapping("addBankcard")
    @ResponseBody
    public RequestResultVO bindingBankcard(HttpSession session, Bankcard bankcard){
       RequestResultVO resultVO = null;
        User user = (User)session.getAttribute(OurConstants.SESSION_IN_USER);
        bankcard.setUid(user.getUid());
        bankcard.setDate(new Date());
        bankcardService.save(bankcard);
        resultVO = RequestResultVO.status(RequestResultEnum.BINDING_BANKCARD_SUCCESS);
        return resultVO;
    }

    @RequestMapping("allBankcard")
    @ResponseBody
    public Pager allBankcard(Long offset, Long limit, Bankcard bankcard){
        return bankcardService.listCriteria(offset, limit, bankcard);
    }

    @Resource
    public void setBankcardService(BankcardService bankcardService) {
        this.bankcardService = bankcardService;
    }
}