package com.we.service.impl;

import com.we.common.Pager;
import com.we.dao.RoleuserDAO;
import com.we.service.AbstractBaseService;
import com.we.service.BaseService;
import com.we.service.RoleuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class RoleuserServiceImpl extends AbstractBaseService implements RoleuserService {


    @Autowired
    private RoleuserDAO roleuserDAO;

    @Override
    public void saveRoleuser(Integer userId, String roleIds) {
        String [] roleIdsArray = roleIds.split(",");
        List<Integer> roleIdsList = new ArrayList<>();
        for (String classId:roleIdsArray){
            roleIdsList.add(Integer.valueOf(classId));
        }
        roleuserDAO.saveRoleuser(userId,roleIdsList);
    }


    @Override
    public Pager listCriteria(Long offset, Long limit, Object object) {
        return null;
    }
}
