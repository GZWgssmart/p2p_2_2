package com.we.service.impl;

import com.we.dao.JklxDAO;
import com.we.service.AbstractBaseService;
import com.we.service.JklxService;
import com.we.vo.ComboboxVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JkxlServiceImpl extends AbstractBaseService implements JklxService {

    private JklxDAO jklxDAO;

    @Autowired
    public void setJklxDAO(JklxDAO jklxDAO) {
        super.setBaseDAO(jklxDAO);
        this.jklxDAO = jklxDAO;
    }

    @Override
    public List<ComboboxVO> listCombobox() {
        return jklxDAO.listCombobox();
    }
}
