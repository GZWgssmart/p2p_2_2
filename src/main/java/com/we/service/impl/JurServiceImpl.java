package com.we.service.impl;

import com.we.common.Pager;
import com.we.dao.BaseDAO;
import com.we.dao.JurDAO;
import com.we.service.AbstractBaseService;
import com.we.service.JurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class JurServiceImpl extends AbstractBaseService implements JurService {

    private JurDAO jurDAO;


    @Autowired
    public void setJurDAO(JurDAO jurDAO) {
        super.setBaseDAO(jurDAO);
        this.jurDAO = jurDAO;
    }


    @Override
    public Pager listPager(Long offset, Long limit) {
        Pager pager = new Pager(offset,limit);
        pager.setRows(jurDAO.listPager(pager));
        pager.setTotal(jurDAO.countAll());
        return pager;
    }

    @Override
    public Pager listByRoleId(Integer roleId) {
        Pager pager = new Pager();
        pager.setRows(jurDAO.listByRoleId(roleId));
        return pager;
    }

    @Override
    public List<Object> listTreeVO() {
        return jurDAO.listTreeVO();
    }

    @Override
    public void deletes(String jurIds) {
        String [] jurIdsArray = jurIds.split(",");
        List<Integer> jurIdsList = new ArrayList<>();
        for (String classId:jurIdsArray){
            jurIdsList.add(Integer.valueOf(classId));
        }
        jurDAO.deletes(jurIdsList);
    }


}
