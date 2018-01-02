package com.we.dao;

import com.we.bean.Borrowdetail;
import org.springframework.stereotype.Repository;

@Repository
public interface BorrowdetailDAO extends BaseDAO {

    /**
     * 根据借款基本信息的id 查询详情，
     * @param baid 基本信息id
     * @return 详情
     */
    Borrowdetail getByApplyId(Integer baid);
}