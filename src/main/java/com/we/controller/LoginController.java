package com.we.controller;

import com.we.bean.Huser;
import com.we.bean.User;
import com.we.common.OurConstants;
import com.we.enums.RequestResultEnum;
import com.we.service.HuserService;
import com.we.service.UserService;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created on 2017/12/24 19:18
 *用于模拟登录（输入url快捷登录，不需填写表单）
 * @author mh
 */
@Controller
@RequestMapping("/testLogin")
public class LoginController {

    private UserService userService;
    private HuserService huserService;

    @RequestMapping("{id}")
    @ResponseBody
    public RequestResultVO testLogin(@PathVariable Integer id, HttpSession session) {
        User user = (User) userService.getById(id);
        session.setAttribute(OurConstants.SESSION_IN_USER, user);
        return RequestResultVO.status(RequestResultEnum.LOGIN_SUCCESS);
    }

    @RequestMapping("huser/{id}")
    @ResponseBody
    public RequestResultVO adminLogin(@PathVariable Integer id, HttpSession session) {
        Huser huser = (Huser) huserService.getById(id);
        session.setAttribute(OurConstants.SESSION_IN_USER, huser);
        return RequestResultVO.status(RequestResultEnum.LOGIN_SUCCESS);
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    public void setHuserService(HuserService huserService) {
        this.huserService = huserService;
    }
}
