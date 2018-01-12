package com.we.service.impl;

import com.we.service.BorrowapplyService;
import com.we.vo.BorrowdetailAndWapplyVO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by ID.LQF on 2018/1/11.
 */
public class BorrowapplyServiceTest extends BaseTest {

    @Autowired
    private BorrowapplyService borrowapplyService;

    @Test
    public void testListBorrow() {
        List<BorrowdetailAndWapplyVO> borrowes = borrowapplyService.listBorrow(1);
        for (BorrowdetailAndWapplyVO borrowe : borrowes) {
            System.out.println(borrowe.getJdmoney());
        }
    }

}
