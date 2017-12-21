package com.we.controller;

import com.we.bean.User;
import com.we.common.Pager;
import com.we.service.UserService;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created on 2017/12/8 19:07
 *
 * @author mh
 */
@Controller
@RequestMapping("/user")
public class UserController {

    private UserService userService;

    @RequestMapping("login_page")
    public String loginPage() {
        return "user/login_page";
    }

    @RequestMapping("register_page")
    public String registerPage() {
        return "user/register_page";
    }

    @PostMapping("register")
    @ResponseBody
    public RequestResultVO register(User user) {
        RequestResultVO statusVO = null;
        return statusVO;
    }

    @PostMapping("update")
    @ResponseBody
    public RequestResultVO update(Long offset, Long limit) {
        return new RequestResultVO();
    }

    @RequestMapping("list_user")
    @ResponseBody
    public Pager listCash(Long offset, Long limit) {
        return new Pager();
    }

    @RequestMapping("all_user_page")
    public String allUserPage() {
        return "cash/pager_user";
    }

    @PostMapping("login")
    @ResponseBody
    public RequestResultVO login(String phone, String pwd, String code, HttpSession session) {
        RequestResultVO statusVO = null;
        return statusVO;
    }

    @GetMapping("home")
    public String home() {
        return "home";
    }

    @Resource
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
