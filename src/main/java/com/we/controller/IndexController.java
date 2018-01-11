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

    @RequestMapping("about")
    public String about(){
        return "index/info/about";
    }

    //公司动态
    @RequestMapping("gsdt")
    public String allGs() {
        return "index/info/staticpage/gsdt";
    }


    //平台公告
    @RequestMapping("ptgg")
    public String allPt() {
        return "index/info/staticpage/ptgg";
    }

    //联系我们
    @RequestMapping("lxwm")
    public String allLxwm() {
        return "index/info/staticpage/lxwm";
    }

    //从事机构信息
    @RequestMapping("csjgxx")
    public String allCsjgxx() {
        return "index/info/staticpage/csjgxx";
    }

    //从业机构信息
    @RequestMapping("jkxmxx")
    public String allInfo() {
        return "index/info/staticpage/jkxmxx";
    }

    //招贤纳士
    @RequestMapping("zxns")
    public String allZxns() {
        return "index/info/staticpage/zxns";
    }

    //团队顾问
    @RequestMapping("tdgw")
    public String allTdgw() {
        return "index/info/staticpage/tdgw";
    }

    //平台资质
    @RequestMapping("ptzz")
    public String allPtzz() {
        return "index/info/staticpage/ptzz";
    }

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

    @RequestMapping("foot")
    public String foot() {
        return "common/index/foot";
    }

}
