package com.we.controller;

import com.we.bean.Jur;
import com.we.bean.Role;
import com.we.bean.Rolejur;
import com.we.common.Pager;
import com.we.service.RoleService;
import com.we.service.RolejurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Calendar;
import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;
    @Autowired
    private RolejurService rolejurService;

    @RequestMapping("add_role_page")
    public String addRolePage(){
        return "role/add_role";
    }

    @RequestMapping("all_role_page")
    public String allRolePage(){
        return "role/all_role";
    }

    @RequestMapping("add")
    @ResponseBody
    public void add(Role role,String jurIds){
        role.setCreateTime(Calendar.getInstance().getTime());
        roleService.save(role);
        rolejurService.saveRoleJur(role.getJid(),jurIds);
    }

    @RequestMapping("list_pager")
    @ResponseBody
    public Pager list_pager(Integer offset,Integer limit){
        return roleService.listPager(Long.valueOf(offset),Long.valueOf(limit));
    }




}
