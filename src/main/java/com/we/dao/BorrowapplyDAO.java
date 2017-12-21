package com.we.dao;

import com.we.bean.Borrowapply;

public interface BorrowapplyDAO extends BaseDAO {
    int removeById(Integer baid);

    int save(Borrowapply record);

    int saveSelective(Borrowapply record);

    Borrowapply getById(Integer baid);

    int updateSelective(Borrowapply record);

    int update(Borrowapply record);
}