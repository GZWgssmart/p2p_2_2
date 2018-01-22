package com.we.service.impl;

import com.we.dao.DxmodelDAO;
import com.we.service.AbstractBaseService;
import com.we.service.DxmodelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by hasee on 2018/1/15.
 */
@Service
public class DxmodelServiceImpl extends AbstractBaseService implements DxmodelService{


    private DxmodelDAO dxmodelDAO;

    @Autowired
    public void setDxmodelDAO(DxmodelDAO dxmodelDAO) {
        super.setBaseDAO(dxmodelDAO);
        this.dxmodelDAO = dxmodelDAO;
    }

}
