package com.we.service.impl;

import com.we.common.Pager;
import com.we.dao.UserLetterDAO;
import com.we.service.AbstractBaseService;
import com.we.service.UserLetterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserLetterServiceImpl extends AbstractBaseService implements UserLetterService {

    private UserLetterDAO userLetterDAO;

    @Autowired
    public void setUserLetterDAO(UserLetterDAO userLetterDAO) {
        super.setBaseDAO(userLetterDAO);
        this.userLetterDAO = userLetterDAO;
    }

    @Override
    public Integer removeById(Integer id) {
        return userLetterDAO.removeById(id);
    }

    @Override
    public Pager listCriteria(Long offset, Long limit, Object object) {
        Pager pager = new Pager(offset, limit);
        pager.setRows(userLetterDAO.listCriteria(pager, object));
        pager.setTotal(userLetterDAO.countCriteria(object));
        return pager;
    }

    @Override
    public Integer updateStatus(String ids, String status) {
        List<Integer> idList = new ArrayList<>();
        String[] split = ids.split(",");
        for (String s : split) {
            idList.add(Integer.valueOf(s));
        }
        return userLetterDAO.updateStatus(idList,Integer.valueOf(status));
    }
}
