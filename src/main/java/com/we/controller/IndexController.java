package com.we.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created on 2017/12/8 19:07
 *
 * @author mh
 */
@Controller
@RequestMapping("/index")
public class IndexController {

    //公司简介
    @RequestMapping("gsjj")
    public String allGsjj() {
        return "index/info/staticpage/gsjj";
    }

    //股东背景
    @RequestMapping("gdbj")
    public String allGd() {
        return "index/info/staticpage/gdbj";
    }

    //安全保障
    @RequestMapping("security")
    public String allSecurity() {
        return "index/security/security_assurance";
    }

    @RequestMapping("")
    public String index() {
        return "index";
    }

}
