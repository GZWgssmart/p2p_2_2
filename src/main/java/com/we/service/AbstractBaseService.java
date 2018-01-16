package com.we.service;

import com.we.common.Pager;
import com.we.dao.BaseDAO;

/**
 * Created on 2017/12/22 10:09
 *
 * @author mh
 */
public abstract class AbstractBaseService implements BaseService {

    private BaseDAO baseDAO;

    public void setBaseDAO(BaseDAO baseDAO) {
        this.baseDAO = baseDAO;
    }

    @Override
    public Integer removeById(Integer id) {
        return baseDAO.removeById(id);
    }

    @Override
    public Integer save(Object obj) {
        return baseDAO.save(obj);
    }

    @Override
    public Integer saveSelective(Object obj) {
        return baseDAO.saveSelective(obj);
    }

    @Override
    public Object getById(Integer id) {
        return baseDAO.getById(id);
    }

    @Override
    public Integer updateSelective(Object obj) {
        return baseDAO.updateSelective(obj);
    }

    @Override
    public Integer update(Object obj) {
        return baseDAO.update(obj);
    }

    @Override
    public Pager listCriteria(Long offset, Long limit, Object object) {
        if (offset == null) {
            offset = 0L;
        }
        if (limit == null) {
            limit = 10L;
        }
        Pager pager = new Pager(offset, limit);
        pager.setRows(baseDAO.listCriteria(pager, object));
        pager.setTotal(baseDAO.countCriteria(object));
        return pager;
    }
}
