package com.we.controller;

import com.sun.xml.internal.ws.handler.ServerSOAPHandlerTube;
import com.we.bean.Huser;
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

}
