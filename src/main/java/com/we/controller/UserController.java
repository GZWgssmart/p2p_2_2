package com.we.controller;

import com.we.bean.User;
import com.we.common.EncryptUtils;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.UserService;
import com.we.vo.RequestResultVO;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
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
        System.out.println(user);
        RequestResultVO statusVO = null;
        //账号 是否已存在
        System.out.println(userService.isPhone(user.getPhone()));
        /*user.setUpwd(EncryptUtils.md5(user.getUpwd()));
        //无推荐码
        if(user.getTid() == null || "".equals(user.getTid())){
            userService.saveSelective(user);
            statusVO = RequestResultVO.status(RequestResultEnum.REGISTER_SUCCESS);
        }else{
            //有推荐码  先判断该推荐码是否存在
            //推荐码是否存在
        }*/


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
        return "user/pager_user";
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
