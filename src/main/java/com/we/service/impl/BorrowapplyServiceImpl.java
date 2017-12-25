package com.we.service.impl;

import com.we.dao.BorrowapplyDAO;
import com.we.service.AbstractBaseService;
import com.we.service.BorrowapplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created on 2017/12/25 11:13
 *
 * @author mh
 */
@Service
public class BorrowapplyServiceImpl extends AbstractBaseService implements BorrowapplyService {

    private BorrowapplyDAO borrowapplyDAO;

    @Autowired
    public void setBorrowapplyDAO(BorrowapplyDAO borrowapplyDAO) {
        super.setBaseDAO(borrowapplyDAO);
        this.borrowapplyDAO = borrowapplyDAO;
    }
}
