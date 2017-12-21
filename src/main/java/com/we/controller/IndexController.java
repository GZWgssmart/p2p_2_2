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

    @RequestMapping("")
    public String index() {
        return "login";
    }

    @RequestMapping("welcome")
    public String welcome() {
        return "common/welcome";
    }
}
