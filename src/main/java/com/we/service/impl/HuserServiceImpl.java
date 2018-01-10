package com.we.service.impl;

import com.we.bean.Huser;
import com.we.dao.HuserDAO;
import com.we.service.AbstractBaseService;
import com.we.service.HuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
public class HuserServiceImpl extends AbstractBaseService implements HuserService {

    private HuserDAO huserDAO;

    @Autowired
    public void setHusrDAO(HuserDAO huserDAO) {
        super.setBaseDAO(huserDAO);
        this.huserDAO = huserDAO;
    }


    @Override
    public void deletes(String huserIds) {
        String [] huserIdsArray = huserIds.split(",");
        List<Integer> huserIdsList = new ArrayList<>();
        for (String classId:huserIdsArray){
            huserIdsList.add(Integer.valueOf(classId));
        }
        huserDAO.deletes(huserIdsList);
    }

    @Override
    public Huser getByName(String name) {
        return huserDAO.getByName(name);
    }

    @Override
    public Set<String> getRolesByName(String name) {
        return huserDAO.getRolesByName(name);
    }

    @Override
    public Set<String> getPermissionsByName(String name) {
        return huserDAO.getPermissionsByName(name);
    }

    @Override
    public Huser getByEmail(String email) {
        return huserDAO.getByEmail(email);
    }

    @Override
    public Set<String> getRolesByEmail(String email) {
        return huserDAO.getRolesByEmail(email);
    }

    @Override
    public Set<String> getPermissionsByEmail(String email) {
        return huserDAO.getPermissionsByEmail(email);
    }

    @Override
    public Huser getByPhone(String phone) {
        return huserDAO.getByPhone(phone);
    }

    @Override
    public Set<String> getRolesByPhone(String phone) {
        return huserDAO.getRolesByPhone(phone);
    }

    @Override
    public Set<String> getPermissionsByPhone(String phone) {
        return huserDAO.getPermissionsByPhone(phone);
    }
}
