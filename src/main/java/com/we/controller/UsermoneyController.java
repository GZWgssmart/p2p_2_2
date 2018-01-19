package com.we.controller;

import com.we.bean.Usermoney;
import com.we.service.UsermoneyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2018/1/2.
 */
@Controller
@RequestMapping("/usermoney")
public class UsermoneyController {

    private UsermoneyService usermoneyService;

    @RequestMapping("get/{uid}")
    @ResponseBody
    public Usermoney getByUid(@PathVariable Integer uid) {
        return usermoneyService.getByUid(uid);
    }

    @Resource
    public void setUsermoneyService(UsermoneyService usermoneyService) {
        this.usermoneyService = usermoneyService;
    }
}
