package com.we.service.impl;

import com.we.common.Pager;
import com.we.dao.DynamicDAO;
import com.we.service.AbstractBaseService;
import com.we.service.DynamicService;
import com.we.vo.DynamicVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ID.LQF on 2017/12/22.
 */
@Service
public class DynamicServiceImpl extends AbstractBaseService implements DynamicService {

    private DynamicDAO dynamicDAO;

    @Autowired
    public void setDynamicDAO(DynamicDAO dynamicDAO) {
        super.setBaseDAO(dynamicDAO);
        this.dynamicDAO = dynamicDAO;
    }

    @Override
    public List<DynamicVO> listDynamic() {
        return dynamicDAO.listDynamic();
    }

    @Override
    public Pager pageDynamic(Long beginIndex, Long pageSize) {
        Pager pager = Pager.initNoSize(beginIndex, pageSize);
        pager.setRows(dynamicDAO.pageDynamic(pager));
        pager.setTotal(dynamicDAO.countCriteria(null));
        return pager;
    }


}
