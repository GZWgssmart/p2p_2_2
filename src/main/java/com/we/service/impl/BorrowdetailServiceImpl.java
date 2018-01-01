package com.we.service.impl;

import com.we.dao.BorrowdetailDAO;
import com.we.service.AbstractBaseService;
import com.we.service.BorrowdetailService;
import com.we.vo.ComboboxVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BorrowdetailServiceImpl extends AbstractBaseService implements BorrowdetailService {

    private BorrowdetailDAO borrowdetailDAO;

    @Autowired
    public void setBorrowdetailDAO(BorrowdetailDAO borrowdetailDAO) {
        super.setBaseDAO(borrowdetailDAO);
        this.borrowdetailDAO = borrowdetailDAO;
    }
}
