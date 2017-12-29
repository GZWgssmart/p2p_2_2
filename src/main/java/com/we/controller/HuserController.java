package com.we.controller;

import com.sun.xml.internal.ws.handler.ServerSOAPHandlerTube;
import com.we.bean.Huser;
import com.we.bean.UserLetter;
import com.we.common.Pager;
import com.we.service.HuserService;
import com.we.vo.AllHuserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by ID.LQF on 2017/12/25.
 */
@Controller
@RequestMapping("/huser")
public class HuserController {

    @Autowired
    private HuserService huserService;

    @RequestMapping("all_letter_page")
    public String allLetterPage() {
        return "huser/all_letter";
    }

    @RequestMapping("home")
    public String home() {
        return "huser/home";
    }

    @RequestMapping("all_dynamic_page")
    public String allDynamicPage() {
        return "huser/all_dynamic";
    }

        @RequestMapping("all_admin_page")
    public String allAdminPage() {
        return "huser/allAdmin";
    }

    @ResponseBody
    @RequestMapping("all_admin")
    public Pager allAdmin(Long offset, Long limit) {
        Pager pager = huserService.listCriteria(offset, limit, Huser.class);
        return pager;
    }

    /***
     * 条件分页查询用户 站内信
     * @param offset 开始索引
     * @param limit 查询个数
     * @param huser 用于接收页面传替的huid
     * @return 带结果的分页的对象
     */
    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset,Long limit,Huser huser) {
        return huserService.listCriteria(offset,limit,huser);
    }

}
