package com.we.service.impl;

import com.we.bean.Borrowapply;
import com.we.bean.Borrowdetail;
import com.we.common.OurConstants;
import com.we.common.Pager;
import com.we.dao.BorrowapplyDAO;
import com.we.dao.BorrowdetailDAO;
import com.we.service.AbstractBaseService;
import com.we.service.BorrowdetailService;
import com.we.vo.BorrowDetailVO;
import com.we.vo.ComboboxVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BorrowdetailServiceImpl extends AbstractBaseService implements BorrowdetailService {

    private BorrowdetailDAO borrowdetailDAO;
    private BorrowapplyDAO borrowapplyDAO;

    @Autowired
    public void setBorrowdetailDAO(BorrowdetailDAO borrowdetailDAO) {
        super.setBaseDAO(borrowdetailDAO);
        this.borrowdetailDAO = borrowdetailDAO;
    }

    @Override
    public Integer updateSelective(Object obj) {
        Borrowdetail borrowdetail = (Borrowdetail) obj;
        Borrowapply borrowapply = (Borrowapply) borrowapplyDAO.getById(borrowdetail.getBaid());
        borrowapply.setState(OurConstants.BORROW_CHECK);
        borrowapplyDAO.updateSelective(borrowapply);
        return super.updateSelective(obj);
    }


    @Override
    public Borrowdetail getByApplyId(Integer baid) {
        return borrowdetailDAO.getByApplyId(baid);
    }

    @Override
    public BorrowDetailVO getDetail(Integer borrowId) {
        BorrowDetailVO borrowDetailVO = borrowdetailDAO.getDetail(borrowId);
        borrowDetailVO.setBidCount(borrowdetailDAO.countBid(borrowId));
        return borrowDetailVO;
    }

    @Autowired
    public void setBorrowapplyDAO(BorrowapplyDAO borrowapplyDAO) {
        this.borrowapplyDAO = borrowapplyDAO;
    }
}
