package com.we.dao;

import com.we.bean.Borrowdetail;

public interface BorrowdetailDAO extends BaseDAO {
    int removeById(Integer bdid);

    int save(Borrowdetail record);

    int saveSelective(Borrowdetail record);

    Borrowdetail getById(Integer bdid);

    int updateSelective(Borrowdetail record);

    int updateByPrimaryKeyWithBLOBs(Borrowdetail record);

    int update(Borrowdetail record);
}