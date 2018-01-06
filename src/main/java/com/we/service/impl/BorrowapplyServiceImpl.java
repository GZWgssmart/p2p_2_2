package com.we.service.impl;

import com.we.bean.Borrowapply;
import com.we.bean.Shborrow;
import com.we.dao.BorrowapplyDAO;
import com.we.dao.ShborrowDAO;
import com.we.service.AbstractBaseService;
import com.we.service.BorrowapplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;

/**
 * Created on 2017/12/25 11:13
 *
 * @author mh
 */
@Service
public class BorrowapplyServiceImpl extends AbstractBaseService implements BorrowapplyService {

    private BorrowapplyDAO borrowapplyDAO;
    private ShborrowDAO shborrowDAO;

    @Override
    public Integer saveSelective(Object obj) {
        Integer i1 = borrowapplyDAO.saveSelective(obj);
        Borrowapply borrowapply = (Borrowapply) obj;
        Shborrow shborrow = new Shborrow();
        shborrow.setBaid(borrowapply.getBaid());
        Integer i2 = shborrowDAO.saveSelective(shborrow);
        return i1 + i2;
    }

    @Override
    public Long countAllBorrowUse() {
        return borrowapplyDAO.countAllBorrowUse();
    }

    @Override
    public Long countMonthBorrowUse(String beginTime, String endTime) {
        return borrowapplyDAO.countMonthBorrowUse(beginTime, endTime);
    }

    @Override
    public Long countAllBorrow() {
        return borrowapplyDAO.countAllBorrow();
    }

    @Override
    public Long countMonthBorrow(String beginTime, String endTime) {
        return borrowapplyDAO.countMonthBorrow(beginTime, endTime);
    }

    @Autowired
    public void setBorrowapplyDAO(BorrowapplyDAO borrowapplyDAO) {
        super.setBaseDAO(borrowapplyDAO);
        this.borrowapplyDAO = borrowapplyDAO;
    }

    @Autowired
    public void setShborrowDAO(ShborrowDAO shborrowDAO) {
        this.shborrowDAO = shborrowDAO;
    }

}
