package com.we.controller;

import com.we.bean.Role;
import com.we.common.Pager;
import com.we.enums.RequestResultEnum;
import com.we.service.RoleService;
import com.we.service.RolejurService;
import com.we.service.RoleuserService;
import com.we.vo.RequestResultVO;
import com.we.vo.RoleZTreeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;


@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;
    @Autowired
    private RolejurService rolejurService;
    @Autowired
    private RoleuserService roleuserService;

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
    public RequestResultVO add(Role role, String jurIds){
        role.setCreateTime(Calendar.getInstance().getTime());
        roleService.save(role);
        if(jurIds != null && jurIds != ""){
        rolejurService.saveRoleJur(role.getJid(),jurIds);
        }
        return RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
    }

    @RequestMapping("update")
    @ResponseBody
    public RequestResultVO update(Role role, String jurIds){
        roleService.update(role);
        rolejurService.deletes(String.valueOf(role.getJid()));
        rolejurService.saveRoleJur(role.getJid(),jurIds);
        return RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
    }

    @RequestMapping("list_pager")
    @ResponseBody
    public Pager listPager(Integer offset,Integer limit){
        return roleService.listPager(Long.valueOf(offset),Long.valueOf(limit));
    }


    /**
     * 批量删除角色
     */
    @RequestMapping("deletes")
    @ResponseBody
    public RequestResultVO deletes(String roleIds){
        roleService.deletes(roleIds);
        rolejurService.deletes(roleIds);
        return RequestResultVO.status(RequestResultEnum.REMOVE_SUCCESS);
    }

    @RequestMapping("list_treeVO")
    @ResponseBody
    public List<RoleZTreeVO> listTreeVO(String huserId){
        List<Object> objectList = roleService.listTreeVO();
        List<RoleZTreeVO> roleZTreeVOS = new ArrayList<>();
        for(Object o : objectList){
            RoleZTreeVO roleZTreeVO = (RoleZTreeVO) o;
            roleZTreeVOS.add(roleZTreeVO);
        }
        if (huserId != null && huserId !=""){
            List<Integer> roleIds = roleuserService.listRoleIds(Integer.valueOf(huserId));
            for(RoleZTreeVO roleZTreeVO : roleZTreeVOS){
                for (Integer roleId : roleIds){
                    if(roleZTreeVO.getId() == roleId){
                        roleZTreeVO.setChecked(true);
                    }
                }
            }
            return roleZTreeVOS;
        }else{
            return roleZTreeVOS;
        }
    }
}
