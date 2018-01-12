package com.we.service.impl;

import com.we.dao.BzDAO;
import com.we.service.AbstractBaseService;
import com.we.service.BzService;
import com.we.vo.ComboboxVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BzServiceImpl extends AbstractBaseService implements BzService {

    private BzDAO bzDAO;

    @Autowired
    public void setBzDAO(BzDAO bzDAO) {
        super.setBaseDAO(bzDAO);
        this.bzDAO = bzDAO;
    }

    @Override
    public void removeByIds(List<Integer> ids) {
        bzDAO.removeByIds(ids);
    }
    @Override
    public List<ComboboxVO> listCombobox() {
        return bzDAO.listCombobox();
    }
}
