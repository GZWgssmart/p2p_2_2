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

    @RequestMapping("gdbj")
    public String allGd() {
        return "index/info/staticpage/gdbj";
    }

    @RequestMapping("security")
    public String allSecurity() {
        return "index/security/security_assurance";
    }

    @RequestMapping("")
    public String index() {
        return "index";
    }

}
