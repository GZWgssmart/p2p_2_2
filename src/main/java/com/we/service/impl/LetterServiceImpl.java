package com.we.service.impl;

import com.we.common.Pager;
import com.we.dao.LetterDAO;
import com.we.service.AbstractBaseService;
import com.we.service.LetterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class LetterServiceImpl extends AbstractBaseService implements LetterService {

    private LetterDAO letterDAO;

    @Autowired
    public void setLetterDAO(LetterDAO letterDAO) {
        super.setBaseDAO(letterDAO);
        this.letterDAO = letterDAO;
    }
}
