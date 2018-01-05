package com.we.service.impl;

import com.we.dao.RolejurDAO;
import com.we.service.AbstractBaseService;
import com.we.service.RolejurService;
import org.aspectj.lang.annotation.SuppressAjWarnings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by hasee on 2017/12/22.
 */

@Service
public class RolejurServiceImpl extends AbstractBaseService implements RolejurService {

    @Autowired
    private RolejurDAO rolejurDAO;

    public void saveRoleJur(Integer roleId,String jurIds){
        String [] jurIdsArray = jurIds.split(",");
        List<Integer> jurIdsList = new ArrayList<>();
        for (String classId:jurIdsArray){
            jurIdsList.add(Integer.valueOf(classId));
        }
        rolejurDAO.saveRoleJur(roleId,jurIdsList);
    }

    @Override
    public void deletes(String roleIds) {
        String [] roleIdsArray = roleIds.split(",");
        List<Integer> roleIdsList = new ArrayList<>();
        for (String classId:roleIdsArray){
            roleIdsList.add(Integer.valueOf(classId));
        }
        rolejurDAO.deletes(roleIdsList);
    }

    @Override
    public void deletesByJurIds(String jurIds) {
        String [] jurIdsArray = jurIds.split(",");
        List<Integer> jurIdsList = new ArrayList<>();
        for (String classId:jurIdsArray){
            jurIdsList.add(Integer.valueOf(classId));
        }
        rolejurDAO.deletesByjurIds(jurIdsList);
    }

    @Override
    public List<Integer> listJurIds(Integer roleId) {
        return rolejurDAO.listJurIds(roleId);
    }

}
