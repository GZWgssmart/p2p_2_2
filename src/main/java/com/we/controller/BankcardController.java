package com.we.controller;

import com.we.bean.Bankcard;
import com.we.bean.User;
import com.we.common.OurConstants;
import com.we.service.BankcardService;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @RequestMapping("toBindingBankcard")
    public String toBankcard(){
        return "bankcard/add_bankcard";
    }

    @RequestMapping("bindingBankcard")
    public RequestResultVO bindingBankcard(HttpSession session, Bankcard bankcard){
        User user = (User)session.getAttribute(OurConstants.SESSION_IN_USER);
        bankcard.setUid(user.getUid());
        bankcard.setRname(user.getRname());
        bankcard.setDate(new Date());
        bankcardService.save(bankcard);
        return null;
    }

    @Resource
    public void setBankcardService(BankcardService bankcardService) {
        this.bankcardService = bankcardService;
    }
}