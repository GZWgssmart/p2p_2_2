package com.we.service.impl;

import com.we.dao.HuserDAO;
import com.we.service.AbstractBaseService;
import com.we.service.HuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class HuserServiceImpl extends AbstractBaseService implements HuserService {

    private HuserDAO husrDAO;

    @Autowired
    public void setHusrDAO(HuserDAO husrDAO) {
        super.setBaseDAO(husrDAO);
        this.husrDAO = husrDAO;
    }


    @Override
    public void deletes(String huserIds) {
        String [] huserIdsArray = huserIds.split(",");
        List<Integer> huserIdsList = new ArrayList<>();
        for (String classId:huserIdsArray){
            huserIdsList.add(Integer.valueOf(classId));
        }
        husrDAO.deletes(huserIdsList);
    }
}
