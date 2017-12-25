package com.we.service.impl;

import com.we.bean.Huser;
import com.we.bean.Role;
import com.we.bean.Rolejur;
import com.we.bean.Roleuser;
import com.we.common.Pager;
import com.we.dao.RoleuserDAO;
import com.we.service.HuserService;
import com.we.service.RoleService;
import com.we.service.RoleuserService;
import com.we.vo.RoleSerachVO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class HuserServiceTest extends BaseTest{

    @Autowired
    private HuserService huserService;

    @Autowired
    private RoleuserService roleuserService;

    @Test
    public void save(){
        Huser huser = new Huser();
        huser.setHuname("1234");
        huser.setRname("zhangsan");
        huser.setSex("男");
        huser.setEmail("1234@qq.com");
        huserService.save(huser);
    }

    @Test
    public void listByCriteria(){
        RoleSerachVO roleSerachVO = new RoleSerachVO();
        roleSerachVO.setRname("审");
        Pager pager = huserService.listCriteria(Long.valueOf(1),Long.valueOf(1),roleSerachVO);
        for(Object o : pager.getRows()){
            Role role = (Role) o;
            System.out.println(role);
        }
    }


    @Test
    public void saveRoleJur(){
        roleuserService.saveRoleuser(2,"1,2");
    }
}
