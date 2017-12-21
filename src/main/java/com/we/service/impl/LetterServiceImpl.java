package com.we.service.impl;

import com.we.common.Pager;
import com.we.dao.LetterDAO;
import com.we.service.LetterService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class LetterServiceImpl implements LetterService {

    private LetterDAO letterDAO;

    @Override
    public int removeById(Long id) {
        return letterDAO.removeById(id);
    }

    @Override
    public int save(Object obj) {
        return letterDAO.save(obj);
    }

    @Override
    public int saveSelective(Object obj) {
        return letterDAO.saveSelective(obj);
    }

    @Override
    public Object getById(Long id) {
        return letterDAO.getById(id);
    }

    @Override
    public int updateSelective(Object obj) {
        return letterDAO.updateSelective(obj);
    }

    @Override
    public int update(Object obj) {
        return letterDAO.update(obj);
    }

    @Override
    public Pager listCriteria(Long offset, Long limit, Object object) {
        Pager pager = new Pager(offset,limit);
        pager.setRows(letterDAO.listCriteria(pager,object));
        pager.setTotal(letterDAO.countCriteria(object));
        return pager;
    }

    @Resource
    public void setLetterDAO(LetterDAO letterDAO) {
        this.letterDAO = letterDAO;
    }
}
