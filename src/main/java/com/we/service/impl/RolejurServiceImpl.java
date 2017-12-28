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

}
