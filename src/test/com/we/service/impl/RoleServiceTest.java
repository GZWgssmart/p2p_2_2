package com.we.service.impl;

import com.we.bean.Jur;
import com.we.bean.Role;
import com.we.common.Pager;
import com.we.service.RoleService;
import com.we.service.RolejurService;
import com.we.vo.RoleSerachVO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class RoleServiceTest extends BaseTest{

    @Autowired
    private RoleService roleService;

    @Autowired
    private RolejurService rolejurService;

    @Test
    public void save(){
        Role role = new Role();
        role.setRname("审核员");
        role.setContent("审核借款请求");

        System.out.println(roleService.save(role));
    }

    @Test
    public void saveRoleJur(){
        rolejurService.saveRoleJur(1,"1,2");
    }

    @Test
    public void listAll(){
        Pager pager = roleService.listPager(Long.valueOf(1),Long.valueOf(1));
        for(Object o:  pager.getRows()){
            Role role = (Role) o;
            System.out.println(role);
        }
        System.out.println(pager.getTotal());
    }

    @Test
    public void listByCriteria(){
        RoleSerachVO roleSerachVO = new RoleSerachVO();
        roleSerachVO.setRname("管");
        Pager pager = roleService.listCriteria(Long.valueOf(1),Long.valueOf(1),roleSerachVO);
        for(Object o : pager.getRows()){
            Role role = (Role) o;
            System.out.println(role);
        }
    }
}
