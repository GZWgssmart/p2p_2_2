package com.we.dao;

import com.we.bean.Borrowdetail;
import com.we.vo.BorrowDetailVO;
import com.we.vo.InvestHistoryVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BorrowdetailDAO extends BaseDAO {

    /**
     * 根据借款基本信息的id 查询详情，
     * @param baid 基本信息id
     * @return 详情
     */
    Borrowdetail getByApplyId(Integer baid);

    /**
     * 查询借款的所有信息
     * @param borrowId
     * @return
     */
    BorrowDetailVO getDetail(Integer borrowId);

    /**
     * 查询借款的投标数
     * @param borrowId
     * @return
     */
    Integer countBid(Integer borrowId);

    List<InvestHistoryVO> pagerInvestHistory(Integer borrowId);
}